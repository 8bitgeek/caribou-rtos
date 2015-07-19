/******************************************************************************
* Copyright © 2005-2012 by Pike Aerospace Research Corporation
* All Rights Reserved
*
*   This file is part of DaddyBASIC.
*
*   DaddyBASIC is free software: you can redistribute it and/or modify
*   it under the terms of the Beerware License Version 43.
*
* ----------------------------------------------------------------------------
* "THE BEER-WARE LICENSE" (Revision 43):
* <mike@pikeaero.com> wrote this file. As long as you retain this notice you
* can do whatever you want with this stuff. If we meet some day, and you think
* this stuff is worth it, you can buy me a beer in return ~ Mike Sharkey
* ----------------------------------------------------------------------------
******************************************************************************/
#include "cobject.h"
#include "cgpio.h"

#include "LPC2103.h"

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
		return driver_hw_gpio_pin_read( port(), bit(mPad) );
	}

	void CGPIO::setState(bool state)
	{
		driver_hw_gpio_pin_write( port(), bit(mPad), state ? bit(mPad) : bit(mPad) );
	}

	void CGPIO::toggleState()
	{
		setState(!state());
	}

	void CGPIO::setMode(tPinMode pinMode)
	{
	}

}
