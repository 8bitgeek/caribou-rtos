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
#include <caribou++/cthread.h>
#include <caribou++/cmutexlocker.h>
#include <chip/chip.h>

/**
 * @brief Each CThread enters a thread of execution here in the thread's context.
 */
static void caribou_cthread_runfn(void *arg)
{
	CARIBOU::CThread* thread = (CARIBOU::CThread*)arg;
	thread->run();
}

/**
 * @brief Each Ctask finishes a thread of execution here.
 */
static void caribou_cthread_finishfn(void *arg)
{
	CARIBOU::CThread* thread = static_cast<CARIBOU::CThread*>(arg);
	if ( thread != NULL )
	{
		delete thread;
	}
}

namespace CARIBOU
{
	#define inherited CObject

	CThread::CThread( caribou_thread_t* thread )
	: inherited()
	, mName("")
	, mStackSize(0)
	, mPrioroty(0)
	, mThread(thread)
	, mStarted(true)
	, mWatchdogCount(0)
	{
	}


	CThread::CThread( const char* name, size_t stksize, uint16_t priority, uint16_t watchdog_count )
	: inherited()
	, mName(name)
	, mStackSize(stksize)
	, mPrioroty(priority)
	, mThread(NULL)
	, mStarted(false)
	, mWatchdogCount(watchdog_count)
	{
	}

	CThread::~CThread()
	{
	}

	void CThread::start()
	{
		mPrivateStack.resize(mStackSize);
		if ( mPrivateStack.size() == mStackSize )
		{
			mThread = caribou_thread_create(mName.data(), 
											caribou_cthread_runfn, 
											caribou_cthread_finishfn, 
											this,
											mPrivateStack.data(),
											mStackSize,
											mPrioroty,mWatchdogCount);
		}
	}

	void CThread::stop()
	{
		// ??
	}

	void CThread::setName(const char* name)
	{
		mName = name;
		caribou_thread_set_name(mThread,mName.data());
	}

	/**
	* @return the name of the thread.
	*/
	char* CThread::name()
	{
		return (char*)caribou_thread_name(mThread);
	}

	/**
	* @return Get the current arg. NULL indicates main thread (main thread is not a CThread).
	*/
	CThread* CThread::current()
	{
		return static_cast<CARIBOU::CThread*>(caribou_thread_current_arg());
	}

	/**
	* Yields the time slot
	*/
	void CThread::yield()
	{
		caribou_thread_yield();
	}

	/**
	* @brief Sleep for some milliseconds
	*/
	void CThread::sleep(int msec)
	{
		if ( msec > 0 )
			caribou_thread_sleep_current(from_ms(msec));
		else if ( msec == 0 )
			caribou_thread_sleep_current(0);
		else
			caribou_thread_sleep_current(-1);
	}

	/**
	* Wake up from sleep.
	*/
	void CThread::wakeup()
	{
		caribou_thread_wakeup(mThread);
	}

	/**
	* @brief Lock the current thread.
	*/
	void CThread::lock()
	{
		caribou_thread_lock();
	}

	/**
	* @brief Unlock the current thread.
	*/
	void CThread::unlock()
	{
		caribou_thread_unlock();
	}

	/**
	 * @return runtime in milliseconds
	 */
	uint64_t CThread::runtime()
	{
		return to_ms(caribou_thread_runtime(mThread));
	}

	uint32_t CThread::stacksize()
	{
		return caribou_thread_stacksize(mThread);
	}

	int16_t CThread::priority()
	{
		return caribou_thread_priority(mThread);
	}

	/**
	* Number of ticks elapsed
	*/
	caribou_tick_t CThread::timerTicks()
	{
		return caribou_state.jiffies;
	}

	/**
	* Number of milliseconds in a tick
	*/
	int	CThread::timerPeriod()
	{
		return caribou_timer_period();
	}

	/**
	* Timer timeout
	*/
    bool CThread::timerTimeout(caribou_tick_t start, caribou_tick_t timeout)
	{
		return caribou_timer_ticks_timeout(start,timeout);
	}

	/**
	* Milliseconds elapsed
	*/
	//double CThread::elapsed()
	//{
	//	return timerTicks() * timerPeriod();
	//}

	void CThread::watchdogFeed()
	{
		caribou_thread_watchdog_feed_self();
	}

}


