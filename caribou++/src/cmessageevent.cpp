/******************************************************************************
* Copyright © 2005-2012 by Pike Aerospace Research Corporation
* All Rights Reserved
*
*   This file is part of CARIBOU RTOS
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
#include <caribou++/cmessageevent.h>

namespace CARIBOU
{

	#define inherited CEvent

	CMessageEvent::CMessageEvent()
	: inherited()
	{
		setType(MessageEvent);
	}

	CMessageEvent::CMessageEvent(CObject* sender,void* msg)
	: CEvent(sender)
	, mMsg(msg)
	{
		setType(MessageEvent);
	}

	CMessageEvent::~CMessageEvent()
	{
	}

	void CMessageEvent::copy(CMessageEvent& other)
	{
		inherited::copy( other );
		mMsg = other.mMsg;
		setType(other.type());
	}

} /* namespace PikeAero */
