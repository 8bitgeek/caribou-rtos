/******************************************************************************
* Copyright © 2005-2012 by Pike Aerospace Research Corporation
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
#include <caribou++/ctimerevent.h>

namespace CARIBOU
{

	#define inherited CEvent

	CTimerEvent::CTimerEvent()
	: inherited()
	, mTimerId(NULL)
	{
		setType(TimerEvent);
	}

	CTimerEvent::CTimerEvent(CObject* sender,void* timerId)
	: inherited(sender)
	, mTimerId(timerId)
	{
		setType(TimerEvent);
	}

	CTimerEvent::~CTimerEvent()
	{
	}

	void CTimerEvent::copy(CTimerEvent& other)
	{
		inherited::copy( other );
		mTimerId = other.mTimerId;
		setType(other.type());
	}

} /* namespace PikeAero */
