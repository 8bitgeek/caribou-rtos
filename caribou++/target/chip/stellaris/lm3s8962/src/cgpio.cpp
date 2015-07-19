/***************************************************************************
 *   Copyright © 2005-2013 by Pike Aerospace Research Corporation          *
 *   info@pikeaero.com                                                     *
 *                                                                         *
 *   This program is free software: you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation, either version 3 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 *   This program is distributed in the hope that it will be useful,       *
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
 *   GNU General Public License for more details.                          *
 *                                                                         *
 *   You should have received a copy of the GNU General Public License     *
 *   along with this program.  If not, see <http://www.gnu.org/licenses/>. *
 **************************************************************************/
#include "cobject.h"
#include "cgpio.h"

#include "inc/hw_types.h"
#include "inc/hw_memmap.h"
#include "inc/hw_sysctl.h"
#include "inc/hw_uart.h"
#include "inc/hw_gpio.h"

#include "driverlib/sysctl.h"
#include "driverlib/gpio.h"
#include "driverlib/pin_map.h"
#include "driverlib/ssi.h"

namespace CARIBOU {

	CGPIO::CGPIO(uint32_t port, uint16_t pad, tPinMode mode)
	: mPort(port)
	, mPad(pad)
	{
		setMode(mode);
	}

	CGPIO::~CGPIO()
	{
	}

	bool CGPIO::state()
	{
		return chip_hw_gpio_pin_read( port(), bit(mPad) );
	}

	void CGPIO::setState(bool state)
	{
		chip_hw_gpio_pin_write( port(), bit(mPad), state ? bit(mPad) : bit(mPad) );
	}

	void CGPIO::toggleState()
	{
		setState(!state());
	}

	void CGPIO::setMode(tPinMode pinMode)
	{
		chip_hw_set_gpio_dirmode( port(), bit(mPad), GPIO_DIR_MODE_IN );
		switch(pinMode)
		{
			case InputMode:			/* 2 Regular input high-Z pad */
				chip_hw_set_gpio_padconfig( port(), bit(mPad), GPIO_STRENGTH_2MA, GPIO_PIN_TYPE_STD );
				chip_hw_set_gpio_dirmode( port(), bit(mPad), GPIO_DIR_MODE_IN );
				break;
			case InputPullUp:		/* 3 Input pad with weak pull up resistor */
				chip_hw_set_gpio_padconfig( port(), bit(mPad), GPIO_STRENGTH_2MA, GPIO_PIN_TYPE_STD_WPU );
				chip_hw_set_gpio_dirmode( port(), bit(mPad), GPIO_DIR_MODE_IN );
				break;
			case InputAnalog:		/* 5 Analog input mode */
				chip_hw_set_gpio_padconfig( port(), bit(mPad), GPIO_STRENGTH_2MA, GPIO_PIN_TYPE_ANALOG );
				chip_hw_set_gpio_dirmode( port(), bit(mPad), GPIO_DIR_MODE_HW );
				break;
			case OutputPushPull:  	/* 6 Push-pull output pad. */
				chip_hw_set_gpio_padconfig( port(), bit(mPad), GPIO_STRENGTH_8MA, GPIO_PIN_TYPE_STD );
				chip_hw_set_gpio_dirmode( port(), bit(mPad), GPIO_DIR_MODE_OUT );
				break;
			case OutputOpenDrain:	/* 7 Open-drain output pad. */
				chip_hw_set_gpio_padconfig( port(), bit(mPad), GPIO_STRENGTH_8MA, GPIO_PIN_TYPE_OD_WPU );
				chip_hw_set_gpio_dirmode( port(), bit(mPad), GPIO_DIR_MODE_OUT );
				break;
			case ResetMode:			/* 0 After reset state. */
			case UnconnectedMode:	/* 1 Safe state for unconnected pads. */
			case InputPullDown:		/* 4 Input pad with weak pull down resistor */
			default:
				chip_hw_set_gpio_padconfig( port(), bit(mPad), GPIO_STRENGTH_2MA, GPIO_PIN_TYPE_STD_WPD );
				chip_hw_set_gpio_dirmode( port(), bit(mPad), GPIO_DIR_MODE_IN );
				break;
		}
	}

}
