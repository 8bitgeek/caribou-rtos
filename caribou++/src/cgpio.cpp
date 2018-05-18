/******************************************************************************
* Copyright © 2005-2013 by Pike Aerospace Research Corporation
* All Rights Reserved
*
*   This file is part of CARIBOU RTOS
*
*   CARIBOU RTOS is free software: you can redistribute it and/or modify
*   it under the terms of the Beerware License Version 43.
*
* ----------------------------------------------------------------------------
* "THE BEER-WARE LICENSE" (Revision 43):
* <mike@pikeaero.com> wrote this file. As long as you retain this notice you
* can do whatever you want with this stuff. If we meet some day, and you think
* this stuff is worth it, you can buy me a beer in return ~ Mike Sharkey
* ----------------------------------------------------------------------------
******************************************************************************/
#include <caribou++/cgpio.h>
#include <caribou++/ctimerevent.h>

namespace CARIBOU
{
	#define inherited CObject

	CGPIO::CGPIO(caribou_gpio_t* gpio)
	: inherited()
	, mToggleTimerId(NULL)
	, mOneShotTimerId(NULL)
	{
		if ( gpio )
			memcpy(&mGPIO,gpio,sizeof(caribou_gpio_t));
		else
			memset(&mGPIO,0,sizeof(caribou_gpio_t));
	}

	CGPIO::CGPIO(const CGPIO& other)
	{
		memcpy(&mGPIO,&other.mGPIO,sizeof(caribou_gpio_t));
		mToggleTimerId = other.mToggleTimerId;
		mOneShotTimerId = other.mOneShotTimerId;
	}

	CGPIO::~CGPIO()
	{
	}

	/**
	* Get the state of the pins according to the pinmask
	*/
	chip_gpio_pinmask_t	CGPIO::state()
	{
		chip_gpio_pinmask_t rc = caribou_gpio_pinstate(&mGPIO);
		return rc;
	}

	/**
	* Get the pin mask.
	*/
	chip_gpio_pinmask_t	CGPIO::pinmask()
	{
		chip_gpio_pinmask_t rc = caribou_gpio_pinmask(&mGPIO);
		return rc;
	}

	/**
	* Set the pins in the pinmask.
	*/
	void CGPIO::set()
	{
		caribou_gpio_set(&mGPIO);
	}

	/**
	* Set the pins in the pinmask.
	*/
	void CGPIO::reset()
	{
		caribou_gpio_reset(&mGPIO);
	}

	/**
	* Toggle the pin(s) in the pinmask.
	*/
	void CGPIO::toggle()
	{
		caribou_gpio_toggle(&mGPIO);
	}

	/**
	 * Toggle the pin at preset frequency.
	 * @param msec number of milliseconds per period.
	 */
	void CGPIO::toggle(uint32_t msec)
	{
		if ( mToggleTimerId )
		{
			killTimer( mToggleTimerId );
		}
		mToggleTimerId = startTimer( msec );
	}

	/**
	 * Toggle the pin at preset frequency - once.
	 * @param msec number of milliseconds per period.
	 */
	void CGPIO::oneshot(uint32_t msec)
	{
		if ( mOneShotTimerId )
		{
			killTimer( mOneShotTimerId );
		}
		mOneShotTimerId = startTimer( msec );
	}

	void CGPIO::event(CEvent* e)
	{
		if ( e->type() == CEvent::TimerEvent )
		{
			CTimerEvent* timerEvent = (CTimerEvent*)e;
			if ( timerEvent->timerId() == mToggleTimerId )
			{
				toggle();
			}
			else
			if ( timerEvent->timerId() == mOneShotTimerId )
			{
				killTimer(mOneShotTimerId);
				toggle();
			}
		}
	}

}