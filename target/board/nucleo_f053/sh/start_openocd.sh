#!/bin/bash
OPENOCD=/usr/bin/openocd
OPENOCD_SCRIPTS=/usr/share/openocd/scripts/

if [ "`lsusb | grep 15ba:0003`" != "" ]; then
	INTRERFACE=interface/olimex-arm-usb-ocd.cfg
elif [ "`lsusb | grep 15ba:0004`" != "" ]; then
	INTRERFACE=interface/olimex-jtag-tiny.cfg
elif [ "`lsusb | grep 0483:3748`" != "" ]; then
	INTRERFACE=interface/stlink-v2.cfg
else
	INTRERFACE=interface/parport.cfg
fi

echo "INTERFACE *** $INTRERFACE *** INTERFACE"

$OPENOCD	--search ./ \
			--search sh/ \
			--search $OPENOCD_SCRIPTS \
			-f $INTRERFACE \
			-f sh/stm32f051.cfg
