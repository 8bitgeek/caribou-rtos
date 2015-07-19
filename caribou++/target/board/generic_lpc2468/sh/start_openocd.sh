#!/bin/bash
if [ "`lsusb | grep 15ba:0003`" != "" ]; then
	INTRERFACE=interface/olimex-arm-usb-ocd.cfg
elif [ "`lsusb | grep 15ba:0004`" != "" ]; then
	INTRERFACE=interface/olimex-jtag-tiny.cfg
else
	INTRERFACE=interface/parport.cfg
fi

echo "INTERFACE *** $INTRERFACE *** INTERFACE"

/usr/bin/openocd --search ./ --search driver_lpc2468/sh -f $INTRERFACE -f driver_lpc2468/sh/lpc2468.cfg
