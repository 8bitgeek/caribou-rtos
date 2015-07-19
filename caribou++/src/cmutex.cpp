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
#include <caribou++/cmutex.h>

namespace CARIBOU {

	CMutex::CMutex(uint8_t flags,bool lock)
	{
		caribou_mutex_init(&mMutex,flags);
		if ( lock )
		{
			this->lock();
		}
	}

	CMutex::~CMutex()
	{
	}

	/// Test the lock, and return true if it was acquired.
	bool CMutex::tryLock()
	{
		return caribou_mutex_trylock(&mMutex);
	}

	/// Sleep while acquiring the lock
	bool CMutex::lock(int timeout)
	{
		return caribou_mutex_lock(&mMutex,timeout);
	}

	/// Release a previously acquired lock.
	bool CMutex::unlock()
	{
		return caribou_mutex_unlock(&mMutex);
	}

	// Return the mutex flags
	uint8_t CMutex::flags()
	{
		return caribou_mutex_flags(&mMutex);
	}

	// Set the tex flags
	void CMutex::setFlags(uint8_t flags)
	{
		caribou_mutex_set_flags(&mMutex,flags);
	}

}
