#
# This file is part of LUNA.
#
# Copyright (c) 2020 Great Scott Gadgets <info@greatscottgadgets.com>
# SPDX-License-Identifier: BSD-3-Clause

import atexit

from usb1 import USBContext, USBError, ENDPOINT_IN, ENDPOINT_OUT, RECIPIENT_DEVICE, TYPE_VENDOR

from .jtag  import JTAGChain
from .flash import ConfigurationFlash
from .spi   import DebugSPIConnection
from .ila   import ApolloILAFrontend
from .ecp5  import ECP5_JTAGProgrammer
from .intel import IntelJTAGProgrammer

from .onboard_jtag import *

class DebuggerNotFound(IOError):
    """ Class that indicates that an Apollo Debug device could not be found. """
    pass


def create_ila_frontend(ila, *, use_cs_multiplexing=False):
    """ Convenience method that instantiates an Apollo debug session and creates an ILA frontend from it.

    Parameters
    ----------
    ila: SyncSerialILA
        The ILA object we'll be connecting to.
    """

    debugger = ApolloDebugger()
    return ApolloILAFrontend(debugger, ila=ila, use_inverted_cs=use_cs_multiplexing)



class ApolloDebugger:
    """ Class representing a link to an Apollo Debug Module. """

    USB_IDS  = [(0x1d50, 0x615c), (0x16d0, 0x05a5)]

    REQUEST_SET_LED_PATTERN = 0xa1
    REQUEST_RECONFIGURE     = 0xc0

    LED_PATTERN_IDLE = 500
    LED_PATTERN_UPLOAD = 50


    # External boards (non-LUNA boards) are indicated with a Major revision of 0xFF.
    # Their minor revision then encodes the board type.
    EXTERNAL_BOARD_MAJOR = 0xFF
    EXTERNAL_BOARD_NAMES = {
        0: "Daisho [rev 31-Oct-2014]",
        1: "Xil.se Pergola FPGA"
    }

    EXTERNAL_BOARD_PROGRAMMERS = {
        0: IntelJTAGProgrammer
    }


    # LUNA subdevices (specialized variants of the LUNA board) use a major of 0xFE.
    SUBDEVICE_MAJORS = {
        0xFE: "Amalthea"
    }

    # Class variable that stores our global libusb context.
    _libusb_context: USBContext = None


    def __init__(self):
        """ Sets up a connection to the debugger. """

        # Try to create a connection to our Apollo debug firmware.
        for vid, pid in self.USB_IDS:
            handle = self.libusb_context().openByVendorIDAndProductID(vid, pid)
            if handle is not None:
                break

        # If we couldn't find an Apollo device, bail out.
        if handle is None:
            raise DebuggerNotFound()

        self.handle = handle
        self.device = handle.getDevice()
        self.major, self.minor = self.get_hardware_revision()

        # Create our basic interfaces, for debugging convenience.
        self.jtag  = JTAGChain(self)
        self.spi   = DebugSPIConnection(self)
        self.flash = ConfigurationFlash(self)


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


    def get_fpga_type(self):
        """ Returns a string indicating the type of FPGA populated on the connected LUNA board.

        The returned format is the same as used in a nMigen platform file; and can be used to override
        a platform's device type.

        Returns
        -------
        str
            The type of FPGA populated on the connected LUNA board.
        """

        with self.jtag as jtag:

            # First, we'll detect all devices on our JTAG chain.
            jtag_devices = jtag.enumerate()
            if not jtag_devices:
                raise IOError("Could not detect an FPGA via JTAG!")

            # ... and grab its device identifier.
            first_device = jtag_devices[0]
            if not hasattr(first_device, 'DEVICE'):
                raise IOError("First JTAG device in chain does not provide an FPGA type. Is this a proper board?")

            return first_device.DEVICE


    @property
    def serial_number(self):
        """ Returns the device's serial number, as a string.

        Returns
        -------
        str
            The device's serial number.
        """
        return self.device.getSerialNumber()


    def get_hardware_revision(self):
        """ Determines and returns the revision of the connected hardware.

        Returns
        -------
        (int, int)
            The relevant hardware's major and minor version numbers.
        """

        # Extract the major and minor from the device's USB descriptor.
        minor = self.device.getbcdDevice() & 0xFF
        major = self.device.getbcdDevice() >> 8
        return major, minor


    def get_hardware_name(self):
        """ Returns a string describing this piece of hardware.

        Returns
        -------
        str
            The name for this piece of hardware.
        """

        # If this is a non-LUNA board, we'll look up its name in our table.
        if self.major == self.EXTERNAL_BOARD_MAJOR:
            return self.EXTERNAL_BOARD_NAMES[self.minor]

        # If this is a non-LUNA board, we'll look up its name in our table.
        if self.major in self.SUBDEVICE_MAJORS:
            product_name = self.SUBDEVICE_MAJORS[self.major]
            major        = 0 # For now?
        else:
            product_name = "LUNA"
            major        = self.major

        # Otherwise, identify it by its revision number.
        return f"{product_name} r{major}.{self.minor}"


    def get_compatibility_string(self):
        """ Returns 'LUNA' for a LUNA board; or 'LUNA-compatible' for supported external board.

        Returns
        -------
        str: {'LUNA', 'LUNA-compatible'}
            The compatibility string the connected board.
        """

        if self.major == self.EXTERNAL_BOARD_MAJOR:
            return 'LUNA-compatible'
        elif self.major in self.SUBDEVICE_MAJORS:
            return self.SUBDEVICE_MAJORS[self.major]

    def out_request(self, number, value=0, index=0, data=None, timeout=5000):
        """ Helper that issues an OUT control request to the debugger.

        All parameters match their SETUP packet definitions.

        Returns
        -------
        int
            The number of bytes actually sent.
        """

        if data is None:
            data = bytes()

        request_type = ENDPOINT_OUT | RECIPIENT_DEVICE | TYPE_VENDOR
        return self.handle.controlWrite(request_type, number, value, index, data, timeout=timeout)


    def in_request(self, number, value=0, index=0, length=0, timeout=500):
        """ Helper that issues an IN control request to the debugger.

        All parameters match their SETUP packet definitions.

        Returns
        -------
        bytes
            The data read from the device.
        """

        request_type = ENDPOINT_IN | RECIPIENT_DEVICE | TYPE_VENDOR
        result = self.handle.controlRead(request_type, number, value, index, length, timeout=timeout)

        return bytes(result)


    def set_led_pattern(self, number):
        """ Sets the LED pattern to match the number specified.

        Parameters
        ----------
        number: int
            The number representing the pattern to set the LEDs to.
        """
        self.out_request(self.REQUEST_SET_LED_PATTERN, number)


    def soft_reset(self):
        """ Resets the target (FPGA/etc) connected to the debug controller. """
        try:
            self.out_request(self.REQUEST_RECONFIGURE)
        except USBError:
            pass
