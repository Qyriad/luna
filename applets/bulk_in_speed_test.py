#!/usr/bin/env python3
# pylint: disable=no-member
#
# This file is part of LUNA.
#
# Copyright (c) 2020 Great Scott Gadgets <info@greatscottgadgets.com>
# SPDX-License-Identifier: BSD-3-Clause

import os
import sys
import logging
import time
import asyncio

from enum import Enum

import usb1
import libusb1

from usb1 import USBContext, USBTransfer, USBDeviceHandle, ENDPOINT_IN

from nmigen                  import Elaboratable, Module, ClockDomain, ClockSignal
from usb_protocol.emitters   import DeviceDescriptorCollection

from luna                    import top_level_cli
from luna.usb2               import USBDevice, USBStreamInEndpoint


VENDOR_ID  = 0x16d0
PRODUCT_ID = 0x0f3b

BULK_ENDPOINT_NUMBER = 1
BULK_ENDPOINT_IN = ENDPOINT_IN | BULK_ENDPOINT_NUMBER
MAX_BULK_PACKET_SIZE = 64 if os.getenv('LUNA_FULL_ONLY') else 512

# Set the total amount of data to be used in our speed test.
TEST_DATA_SIZE = 1 * 1024 * 1024
TEST_TRANSFER_SIZE = 16 * 1024

# Size of the host-size "transfer queue" -- this is effectively the number of async transfers we'll
# have scheduled at a given time.
TRANSFER_QUEUE_DEPTH = 16



class USBInSpeedTestDevice(Elaboratable):
    """ Simple device that sends data to the host as fast as hardware can.

    This is paired with the python code below to evaluate LUNA throughput.
    """

    def create_descriptors(self):
        """ Create the descriptors we want to use for our device. """

        descriptors = DeviceDescriptorCollection()

        #
        # We'll add the major components of the descriptors we we want.
        # The collection we build here will be necessary to create a standard endpoint.
        #

        # We'll need a device descriptor...
        with descriptors.DeviceDescriptor() as d:
            d.idVendor           = VENDOR_ID
            d.idProduct          = PRODUCT_ID

            d.iManufacturer      = "LUNA"
            d.iProduct           = "IN speed test"
            d.iSerialNumber      = "no serial"

            d.bNumConfigurations = 1


        # ... and a description of the USB configuration we'll provide.
        with descriptors.ConfigurationDescriptor() as c:

            with c.InterfaceDescriptor() as i:
                i.bInterfaceNumber = 0

                with i.EndpointDescriptor() as e:
                    e.bEndpointAddress = 0x80 | BULK_ENDPOINT_NUMBER
                    e.wMaxPacketSize   = MAX_BULK_PACKET_SIZE


        return descriptors


    def elaborate(self, platform):
        m = Module()

        # Generate our domain clocks/resets.
        m.submodules.car = platform.clock_domain_generator()

        # Create our USB device interface...
        ulpi = platform.request(platform.default_usb_connection)
        m.submodules.usb = usb = USBDevice(bus=ulpi)

        # Add our standard control endpoint to the device.
        descriptors = self.create_descriptors()
        usb.add_standard_control_endpoint(descriptors)

        # Add a stream endpoint to our device.
        stream_ep = USBStreamInEndpoint(
            endpoint_number=BULK_ENDPOINT_NUMBER,
            max_packet_size=MAX_BULK_PACKET_SIZE
        )
        usb.add_endpoint(stream_ep)

        # Send entirely zeroes, as fast as we can.
        m.d.comb += [
            stream_ep.stream.valid    .eq(1),
            stream_ep.stream.payload  .eq(0)
        ]

        # Connect our device as a high speed device by default.
        m.d.comb += [
            usb.connect          .eq(1),
            usb.full_speed_only  .eq(1 if os.getenv('LUNA_FULL_ONLY') else 0),
        ]

        return m


# Create an enum that strips the LIBUSB_TRANSFER_ prefix from the constant names.
TransferStatus = Enum('TransferStatus',
    {key[len('LIBUSB_TRANSFER_'):]: value for key, value in libusb1.libusb_transfer_status.forward_dict.items()})


class AsyncTransferManager():
    """ Class that stores the group of state needed to manage the asynchronous transfers. """

    # Translate libusb transfer status codes to human-y messages.
    _ERROR_MESSAGES = {
        usb1.TRANSFER_ERROR: "error'd out",
        usb1.TRANSFER_TIMED_OUT: "timed out",
        usb1.TRANSFER_CANCELLED: "was prematurely cancelled",
        usb1.TRANSFER_STALL: "was stalled",
        usb1.TRANSFER_NO_DEVICE: "lost the device it was connected to",
        usb1.TRANSFER_OVERFLOW: "got more data than expected"
    }


    def __init__(self, context: USBContext, device_handle: USBDeviceHandle, transfer_size, transfer_depth):

        self.context = context
        self.device_handle = device_handle

        self.active_transfers = []
        self.num_transfers = 0
        self.completed_transfers = []
        self.total_data_transferred = 0

        self.start_time = None
        self.end_time = None

        self.transfer_size = transfer_size
        self.transfer_depth = transfer_depth

        self._error = None


    async def _handle_events(self):

        while self.num_transfers:

            try:
                self.context.handleEvents()
            except usb1.USBErrorInterrupted:
                pass

            await asyncio.sleep(0)


    def _transfer_complete_cb(self, transfer: USBTransfer):

        future = transfer.getUserData()
        status = transfer.getStatus()

        if status == usb1.TRANSFER_COMPLETED:

            length = transfer.getActualLength()
            future.set_result(length)

        else:

            # Time to bail out.
            self._error = status
            future.cancel()


    def _setup_transfers(self):

        for _ in range(self.transfer_depth):

            # Allocate the transfer...
            transfer = self.device_handle.getTransfer()
            transfer.setBulk(BULK_ENDPOINT_IN, self.transfer_size, timeout=1000,
                callback=self._transfer_complete_cb)


            # ...and store it.
            self.active_transfers.append(transfer)
            self.num_transfers += 1


    async def _wait_for_transfer_complete(self, transfer):

        while transfer not in self.completed_transfers:
            await asyncio.sleep(0)

        self.completed_transfers.remove(transfer)


    def _should_cancel(self):
        return self._error is not None or self.total_data_transferred >= TEST_DATA_SIZE


    async def _do_transfer(self, transfer: USBTransfer):
        """ Repeatedly submits the transfer until it's time to cancel. """

        loop = asyncio.get_event_loop()

        while not self._should_cancel():

            future = loop.create_future()
            transfer.setUserData(future)

            transfer.submit()

            try:
                length = await future

                # Don't count any data we receive after we've recorded the end time.
                if self.end_time is None:
                    self.total_data_transferred += length

            except asyncio.CancelledError:
                break

            # await self._wait_for_transfer_complete(transfer)

        if self.end_time is None:
            self.end_time = time.time()

        self.num_transfers -= 1


    def run(self):

        async def _gather_coroutines(*coroutines):
            """ Because you can't asyncio.run(asyncio.gather()). """
            await asyncio.gather(*coroutines)

        self._setup_transfers()

        coroutines = [self._do_transfer(transfer) for transfer in self.active_transfers]
        coroutines.append(self._handle_events())

        # Start our benchmark timer.
        self.start_time = time.time()

        asyncio.run(_gather_coroutines(*coroutines))

        elapsed = self.end_time - self.start_time

        for transfer in self.active_transfers:

            # libusb_transfer_free(transfer)
            del transfer

        if self._error:
            logging.error('Test failed because a transfer {}.'.format(self._ERROR_MESSAGES[self._error]))


        bytes_per_second = self.total_data_transferred / (elapsed)
        # logging.info('Received {} MB total at {} MB/s.'.format(self.total_data_transferred / 1000000, bytes_per_second / 1000000))

        return bytes_per_second / 1000000



def run_async_speed_test():


    with USBContext() as context:

        # Grab a reference to our device...
        handle: USBDeviceHandle = context.openByVendorIDAndProductID(VENDOR_ID, PRODUCT_ID)

        if handle is None:
            raise IOError("Test device not found.")

        # ...and claim its bulk interface.
        handle.claimInterface(0)

        averages = []

        for test in range(10):

            for transfer_size in range(1024, 1024 * 16, 1024):

                for transfer_depth in range(2, 16):

                    # logging.info("Async test with {:02} {} byte transfers.".format(transfer_depth, transfer_size))

                    speeds = []

                    for i in range(20):

                        manager = AsyncTransferManager(context, handle, transfer_size, transfer_depth)
                        speed = manager.run()
                        speeds.append(speed)

                    avg = sum(speeds) / len(speeds)
                    # logging.info('{:02} {} byte transfers: {}'.format(transfer_depth, transfer_size, avg))
                    averages.append((transfer_depth, transfer_size, avg))
                    # logging.info('Average: {} MB/s.'.format(sum(speeds) / len(speeds)))

            # logging.info("Maximum: {}".format((x for x in averages if x[
            depth, size, avg = max(averages, key=lambda tup : tup[2])
            logging.info("Maximum: {} {} byte transfers: {}".format(depth, size, avg))


def run_speed_test():
    """ Runs a simple speed test, and reports throughput. """

    total_data_exchanged = 0
    failed_out = False

    _messages = {
        1: "error'd out",
        2: "timed out",
        3: "was prematurely cancelled",
        4: "was stalled",
        5: "lost the device it was connected to",
        6: "sent more data than expected."
    }

    def _should_terminate():
        """ Returns true iff our test should terminate. """
        return (total_data_exchanged > TEST_DATA_SIZE) or failed_out


    def _transfer_completed(transfer: usb1.USBTransfer):
        """ Callback executed when an async transfer completes. """
        nonlocal total_data_exchanged, failed_out

        status = transfer.getStatus()

        # If the transfer completed.
        if status in (usb1.TRANSFER_COMPLETED,):

            # Count the data exchanged in this packet...
            total_data_exchanged += transfer.getActualLength()

            # ... and if we should terminate, abort.
            if _should_terminate():
                return

            # Otherwise, re-submit the transfer.
            transfer.submit()

        else:
            failed_out = status



    with usb1.USBContext() as context:

        # Grab a reference to our device...
        dev = context.openByVendorIDAndProductID(0x16d0, 0x0f3b)

        # ... and claim its bulk interface.
        dev.claimInterface(0)

        # Submit a set of transfers to perform async comms with.
        active_transfers = []
        for _ in range(TRANSFER_QUEUE_DEPTH):

            # Allocate the transfer...
            transfer = dev.getTransfer()
            transfer.setBulk(0x80 | BULK_ENDPOINT_NUMBER, TEST_TRANSFER_SIZE, callback=_transfer_completed, timeout=1000)

            # ... and store it.
            active_transfers.append(transfer)


        # Start our benchmark timer.
        start_time = time.time()

        # Submit our transfers all at once.
        for transfer in active_transfers:
            transfer.submit()

        # Run our transfers until we get enough data.
        while not _should_terminate():
            context.handleEvents()

        # Figure out how long this took us.
        end_time = time.time()
        elapsed = end_time - start_time

        # Cancel all of our active transfers.
        for transfer in active_transfers:
            if transfer.isSubmitted():
                transfer.cancel()

        # If we failed out; indicate it.
        if (failed_out):
            logging.error(f"Test failed because a transfer {_messages[failed_out]}.")
            sys.exit(failed_out)


        bytes_per_second = total_data_exchanged / elapsed
        logging.info(f"Received {total_data_exchanged / 1000000} MB total at {bytes_per_second / 1000000} MB/s.")


if __name__ == "__main__":
    device = top_level_cli(USBInSpeedTestDevice)

    logging.info("Giving the device time to connect...")
    time.sleep(5)

    if device is not None:
        logging.info(f"Starting bulk in speed test.")
        logging.info('Running sync test...')
        run_speed_test()
        logging.info('Running async test...')
        run_async_speed_test()

        # if os.getenv('async') == 'yes':
            # logging.info('Running async test...')
            # run_async_speed_test()
        # else:
            # logging.info('Running sync test...')
            # run_speed_test()
