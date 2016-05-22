/******************************************************************************
* Copyright © 2005-2012 by Pike Aerospace Research Corporation
* All Rights Reserved
*
*   This file is part of CARIBOU RTOS
*
*   CARIBOU is free software: you can redistribute it and/or modify
*   it under the terms of the Beerware License Version 43.
*
* ----------------------------------------------------------------------------
* "THE BEER-WARE LICENSE" (Revision 43):
* <mike@pikeaero.com> wrote this file. As long as you retain this notice you
* can do whatever you want with this stuff. If we meet some day, and you think
* this stuff is worth it, you can buy me a beer in return ~ Mike Sharkey
* ----------------------------------------------------------------------------
******************************************************************************/
#include <caribou++/csemaphore.h>
#include <caribou++/cthread.h>

namespace CARIBOU 
{

	CSemaphore::CSemaphore(int count)
	{
		mSemaphore = caribou_semaphore_new(count);
	}

	CSemaphore::CSemaphore(const CSemaphore& other)
	{
		if ( this != &other )
		{
			mSemaphore = other.mSemaphore;
		}
	}

	CSemaphore::~CSemaphore()
	{
		caribou_semaphore_delete(mSemaphore);
	}

	CSemaphore&	CSemaphore::operator=(const CSemaphore& other)
	{
		mSemaphore = other.mSemaphore;
	}

	bool CSemaphore::signal()
	{
		return caribou_semaphore_signal(mSemaphore);
	}

	bool CSemaphore::wait(caribou_tick_t timeout)
	{
		return caribou_semaphore_wait(mSemaphore,timeout);
	}

	bool CSemaphore::tryWait(caribou_tick_t timeout)
	{
		return caribou_semaphore_try_wait(mSemaphore,timeout);
	}


}
