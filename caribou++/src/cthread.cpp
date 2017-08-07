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
static void caribou_cthread_startfn(void *arg)
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
	CList<CThread*>	CThread::mThreads;

	#define inherited CObject

	CThread::CThread( caribou_thread_t* thread )
	: inherited()
	, mName("")
	, mStackSize(0)
	, mPrioroty(0)
	, mThread(thread)
	, mStarted(true)
	, mWatchdogHandle(0)
	{
		lock();
		mThreads.append(this);
		unlock();
	}


	CThread::CThread( const char* name, size_t stksize, uint16_t priority )
	: inherited()
	, mName(name)
	, mStackSize(stksize)
	, mPrioroty(priority)
	, mThread(NULL)
	, mStarted(false)
	, mWatchdogHandle(0)
	{
		objectLock();
		mThreads.append(this);
		objectUnlock();
	}

	CThread::~CThread()
	{
		objectLock();
		int idx = mThreads.indexOf(this);
		if ( idx >= 0 )
		{
			mThreads.take(idx);
		}
		objectUnlock();
	}

	void CThread::start()
	{
		#if !defined(CARIBOU_MPU_ENABLED)
			mPrivateStack.resize(mStackSize);
			if ( mPrivateStack.size() == mStackSize )
			{
				mThread = caribou_thread_create(mName.data(), 
						  caribou_cthread_startfn, 
						  caribou_cthread_finishfn, 
						  this,
						  mPrivateStack.data(),
						  mStackSize,
						  mPrioroty);
			}
		#else
			mThread = caribou_thread_create(name, caribou_cthread_startfn, caribou_cthread_finishfn,this,NULL,stksize,priority);
		#endif
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

	uint32_t CThread::stackusage()
	{
		return caribou_thread_stackusage(mThread);
	}

	int16_t CThread::priority()
	{
		return caribou_thread_priority(mThread);
	}

	uint16_t CThread::state()
	{
		return caribou_thread_state(mThread);
	}

	CString CThread::status()
	{
		uint16_t f = state();
		CString rc;
		if ( (f & CARIBOU_THREAD_F_IDLE_MASK) == 0 )	rc += "r"; else rc += "-";
		if ( caribou_thread_locked(mThread) )	rc += "L"; else rc += "-";
		if ( f & CARIBOU_THREAD_F_YIELD )	rc += "Y"; else rc += "-";
		if ( f & mThread->sleep > 0 )	rc += "S"; else rc += "-";
		return rc;
	}

	/**
	* Number of ticks elapsed
	*/
	caribou_tick_t CThread::timerTicks()
	{
		return caribou_timer_ticks();
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

}


