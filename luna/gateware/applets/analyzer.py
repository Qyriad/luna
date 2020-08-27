#!/usr/bin/env python3
# pylint: disable=maybe-no-member
#
# This file is part of LUNA.
#
# Copyright (c) 2020 Great Scott Gadgets <info@greatscottgadgets.com>
# SPDX-License-Identifier: BSD-3-Clause

""" Generic USB analyzer backend generator for LUNA. """

import time
import atexit

from datetime import datetime

import usb1

from usb1 import USBContext

from nmigen                           import Elaboratable, Module
from usb_protocol.emitters            import DeviceDescriptorCollection

from luna                             import get_appropriate_platform
from luna.usb2                        import USBDevice, USBStreamInEndpoint

from luna.gateware.architecture.car   import LunaECP5DomainGenerator

from luna.gateware.interface.ulpi     import UTMITranslator
from luna.gateware.usb.analyzer       import USBAnalyzer


USB_SPEED_HIGH       = 0b00
USB_SPEED_FULL       = 0b01
USB_SPEED_LOW        = 0b10

USB_VENDOR_ID        = 0x1d50
USB_PRODUCT_ID       = 0x615b

BULK_ENDPOINT_NUMBER  = 1
BULK_ENDPOINT_ADDRESS = 0x80 | BULK_ENDPOINT_NUMBER
MAX_BULK_PACKET_SIZE  = 512

TRANSFER_SIZE = 512
TRANSFER_QUEUE_DEPTH = 4


class USBAnalyzerApplet(Elaboratable):
    """ Gateware that serves as a generic USB analyzer backend.

    WARNING: This is _incomplete_! It's missing:
        - DRAM backing for analysis
    """


    def __init__(self, usb_speed=USB_SPEED_FULL):
        self.usb_speed = usb_speed


    def create_descriptors(self):
        """ Create the descriptors we want to use for our device. """

        descriptors = DeviceDescriptorCollection()

        #
        # We'll add the major components of the descriptors we we want.
        # The collection we build here will be necessary to create a standard endpoint.
        #

        # We'll need a device descriptor...
        with descriptors.DeviceDescriptor() as d:
            d.idVendor           = USB_VENDOR_ID
            d.idProduct          = USB_PRODUCT_ID

            d.iManufacturer      = "LUNA"
            d.iProduct           = "USB Analyzer"
            d.iSerialNumber      = "[autodetect serial here]"

            d.bNumConfigurations = 1


        # ... and a description of the USB configuration we'll provide.
        with descriptors.ConfigurationDescriptor() as c:

            with c.InterfaceDescriptor() as i:
                i.bInterfaceNumber = 0

                with i.EndpointDescriptor() as e:
                    e.bEndpointAddress = BULK_ENDPOINT_ADDRESS
                    e.wMaxPacketSize   = MAX_BULK_PACKET_SIZE


        return descriptors


    def elaborate(self, platform):
        m = Module()

        # Generate our clock domains.
        clocking = LunaECP5DomainGenerator()
        m.submodules.clocking = clocking

        # Create our UTMI translator.
        ulpi = platform.request("target_phy")
        m.submodules.utmi = utmi = UTMITranslator(ulpi=ulpi)

        # Strap our power controls to be in VBUS passthrough by default,
        # on the target port.
        m.d.comb += [
            platform.request("power_a_port").o      .eq(0),
            platform.request("pass_through_vbus").o .eq(1),
        ]

        # Set up our parameters.
        m.d.comb += [

            # Set our mode to non-driving and to the desired speed.
            utmi.op_mode     .eq(0b01),
            utmi.xcvr_select .eq(self.usb_speed),

            # Disable all of our terminations, as we want to participate in
            # passive observation.
            utmi.dm_pulldown .eq(0),
            utmi.dm_pulldown .eq(0),
            utmi.term_select .eq(0)
        ]

        # Create our USB uplink interface...
        uplink_ulpi = platform.request("host_phy")
        m.submodules.usb = usb = USBDevice(bus=uplink_ulpi)

        # Add our standard control endpoint to the device.
        descriptors = self.create_descriptors()
        usb.add_standard_control_endpoint(descriptors)

        # Add a stream endpoint to our device.
        stream_ep = USBStreamInEndpoint(
            endpoint_number=BULK_ENDPOINT_NUMBER,
            max_packet_size=MAX_BULK_PACKET_SIZE
        )
        usb.add_endpoint(stream_ep)

        # Create a USB analyzer, and connect a register up to its output.
        m.submodules.analyzer = analyzer = USBAnalyzer(utmi_interface=utmi)

        m.d.comb += [
            # USB stream uplink.
            stream_ep.stream            .connect(analyzer.stream),

            usb.connect                 .eq(1),

            # LED indicators.
            platform.request("led", 0).o  .eq(analyzer.capturing),
            platform.request("led", 1).o  .eq(analyzer.stream.valid),
            platform.request("led", 2).o  .eq(analyzer.overrun),

            platform.request("led", 3).o  .eq(utmi.session_valid),
            platform.request("led", 4).o  .eq(utmi.rx_active),
            platform.request("led", 5).o  .eq(utmi.rx_error),
        ]

        # Return our elaborated module.
        return m



class USBAnalyzerConnection:
    """ Class representing a connection to a LUNA USB analyzer.

    This abstracts away connection details, so we can rapidly change the way things
    work without requiring changes in e.g. our ViewSB frontend.
    """

    # Class variable that stores our global libusb context.
    _libusb_context: USBContext = None


    def __init__(self):
        """ Creates our connection to the USBAnalyzer. """

        self._buffer = bytearray()
        self._device_handle = None
        self._transfers = []


    @classmethod
    def _destroy_libusb_context(cls):
        """ Destroys our libusb context on closing our Python instance. """

        cls._libusb_context.close()
        cls._libusb_context = None


    @classmethod
    def libusb_context(cls):
        """ Retrieves the libusb context, creating one if needed.

        Returns
        -------
        USBContext
            The libusb context.
        """

        if cls._libusb_context is None:
            cls._libusb_context = USBContext().open()
            atexit.register(cls._destroy_libusb_context)

        return cls._libusb_context


    def build_and_configure(self, capture_speed):
        """ Builds the LUNA analyzer applet and configures the FPGA with it. """

        # Create the USBAnalyzer we want to work with.
        analyzer = USBAnalyzerApplet(usb_speed=capture_speed)

        # Build and upload the analyzer.
        # FIXME: use a temporary build directory
        platform = get_appropriate_platform()
        platform.build(analyzer, do_program=True)

        time.sleep(3)

        while not self._device_handle:

            # FIXME: add timeout
            self._device_handle = self.libusb_context().openByVendorIDAndProductID(USB_VENDOR_ID, USB_PRODUCT_ID)

        self._device_handle.claimInterface(0)


    def create_transfer(self):

        transfer = self._device_handle.getTransfer()
        transfer.setBulk(BULK_ENDPOINT_ADDRESS, TRANSFER_SIZE, timeout=1000,
            callback=self._transfer_complete_cb)

        return transfer


    def _transfer_complete_cb(self, transfer):


        status = transfer.getStatus()

        if status == usb1.TRANSFER_COMPLETED:

            data = transfer.getBuffer()
            self._buffer.extend(data)

            # Re-submit the transfer.
            transfer.submit()

        elif status == usb1.TRANSFER_TIMED_OUT:

            transfer.submit()

        elif status == usb1.TRANSFER_CANCELLED:

            # This transfer has been Doomed (thanks to python-libusb1), so we can't just re-submit it.

            self._transfers.remove(transfer)
            del transfer

            # Create a new transfer to replace it.
            transfer = self.create_transfer()
            self._transfers.append(transfer)
            transfer.submit()

        else:

            usb1.raiseUSBError(status)


    def read_raw_packet(self):
        """ Reads a raw packet from our USB Analyzer. Blocks until a packet is complete.

        Returns
        -------
        packet: bytes
            Raw packet data.
        timestamp: datetime
            The timestamp at which the packet was taken.
        flags
            Flags indicating connection status. Format TBD.
        """

        # Set up transfers.
        if not self._transfers:
            for _ in range(TRANSFER_QUEUE_DEPTH):

                transfer = self.create_transfer()
                self._transfers.append(transfer)
                transfer.submit()

        size = 0
        packet = None

        # Read until we get enough data to determine our packet's size...
        while not packet:
            while len(self._buffer) < 3:
                self.libusb_context().handleEvents()

            # Extract our size from our buffer...
            size = (self._buffer.pop(0) << 8) | self._buffer.pop(0)

            # ...and read until we have a packet.
            while len(self._buffer) < size:
                self.libusb_context().handleEvents()

            # Extract our raw packet.
            packet = self._buffer[0:size]
            del self._buffer[0:size]

        # Return the extracted raw packet.
        # TODO: extract and provide status flags
        # TODO: generate a timestamp on-device
        return packet, datetime.now(), None
