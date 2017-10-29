/** ***************************************************************************
* @file
* @author Mike Sharkey <mike@pikeaero.com>.
* @copyright © 2005-2013 by Pike Aerospace Research Corporation
* @copyright © 2014-2015 by Mike Sharkey
* @details This file is part of CARIBOU RTOS
* CARIBOU RTOS is free software: you can redistribute it and/or modify
* it under the terms of the Beerware License Version 43.
* "THE BEER-WARE LICENSE" (Revision 43):
* Mike Sharkey <mike@pikeaero.com> wrote this file. 
* As long as you retain this notice you can do whatever you want with
* this stuff. If we meet some day, and you think this stuff is 
* worth it, you can buy me a beer in return ~ Mike Sharkey
******************************************************************************/
#include <cwatchdog.h>

/* 'C' Language application interface. */

extern "C" bool wdRegisterThread(caribou_thread_t* thread)
{
	return CARIBOU::CWatchdog::registerThread(thread);
}

extern "C" void wdUnregisterThread(caribou_thread_t* thread)
{
	return CARIBOU::CWatchdog::unregisterThread(thread);
}

extern "C" void wdCheckin(caribou_thread_t* thread)
{
	return CARIBOU::CWatchdog::checkin(thread);
}

namespace CARIBOU
{
	CARIBOU::CList<CWatchdog::thread_watch_t*> CWatchdog::mWatches;
	CARIBOU::CMutex CWatchdog::mMutex;

	/**
	 * @brief Register a thread for checkins.
	 */
	bool CWatchdog::registerThread(caribou_thread_t* thread)
	{
		if ( newThreadWatch(thread) != NULL )
		{
			checkin(thread);
			return true;
		}
		return false;
	}

	void CWatchdog::unregisterThread(caribou_thread_t* thread)
	{
		deleteThreadWatch(thread);
	}

	/**
	 * @brief Create and initialize a new watch structure instamce.
	 * @return a popinter to the new watch struct instance.
	 */
	CWatchdog::thread_watch_t* CWatchdog::newThreadWatch(caribou_thread_t* thread)
	{
		thread_watch_t* watch = (thread_watch_t*)malloc(sizeof(thread_watch_t));
		if ( watch )
		{
			watch->thread = thread;
			watch->checkin = false;
		}
		return watch;
	}

	/**
	 * @brief Delete and free the resources associated with a thread watch struct.
	 */
	void CWatchdog::deleteThreadWatch(caribou_thread_t* thread)
	{
		mMutex.lock();
		for(int n=0; n < mWatches.count(); n++)
		{
			thread_watch_t* watch = mWatches.at(n);
			if ( watch && watch->thread == thread )
			{
				mWatches.take(n);
				free(watch);
				break;
			}
		}
		mMutex.unlock();
	}

	#pragma GCC push_options
	#pragma GCC optimize ("Os")
	/**
	 * @brief Time stamp that a thread is checked in.
	 */
	void CWatchdog::checkin(caribou_thread_t* thread)
	{
		thread_watch_t* watch = lookup(thread);
		if ( watch != NULL )
		{
			watch->checkin = true;
		}
		punchin();
	}

	/**
	 * @brief Lookup a thread watch struct from a thread.
	 * @return the thread watch struct pointer or NULL.
	 */
	CWatchdog::thread_watch_t* CWatchdog::lookup(caribou_thread_t* thread)
	{
		thread_watch_t* rc=NULL;
		mMutex.lock();
		for(int n=0; rc == NULL && n < mWatches.count(); n++)
		{
			thread_watch_t* watch = mWatches.at(n);
			if ( watch && watch->thread == thread )
			{
				rc = watch;
			}
		}
		mMutex.unlock();
	}

	/**
	 * @brief If all threads have checked in, then do the punch in...
	 * After punching in, clear out all thread checkin flags.
	 */
	void CWatchdog::punchin()
	{
		bool checkin=true;							/* true if we're all checked in */
		mMutex.lock();
		for(int n=0; checkin && n < mWatches.count(); n++)
		{
			thread_watch_t* watch = mWatches.at(n);
			checkin = watch->checkin;
		}
		if ( checkin )								/* everybody is checked in? */
		{
			FeedWatchdog();							/* User supplied function/macto */
			/* Clear the check ins... */
			for(int n=0; n < mWatches.count(); n++)
			{
				thread_watch_t* watch = mWatches.at(n);
				watch->checkin=false;
			}
		}
		mMutex.unlock();
	}
	#pragma GCC pop_options

}
