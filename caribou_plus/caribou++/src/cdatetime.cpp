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
#include <caribou++/cdatetime.h>
#include <caribou++/ctimerevent.h>

/**
* TODO
*   - Emit tenths,second,minute,hour, and day events.
*     event should contain emum describing which one it is and
*     snapshot of the current date/time as well as a pointer to the
*	  the CDateTime object that generated the event.
*/

#define TENTH_SECOND	100  /* 1/10th second in milliseconds */

namespace CARIBOU
{

	#define inherited CObject

	CDateTime::CDateTime(bool b)
	: inherited()
	, mTimer(NULL)
	, mTicks(0)
	, mHundredths(0)
	, mTenths(0)
	, mSeconds(0)
	, mMinutes(0)
	, mHours(0)
	, mDays(0)
	{
		setIsCounter(b);
	}

	CDateTime::CDateTime(CDateTime* other)
	: inherited()
	{
		copy(other);
	}

	CDateTime::~CDateTime()
	{
		if ( mTimer )
		{
			killTimer( mTimer );
			mTimer=NULL;
		}
	}

	void CDateTime::copy(CDateTime* other)
	{
		setIsCounter(false);
		setTicks( other->ticks() );
		setHundredths( other->hundredths() );
		setTenths( other->tenths() );
		setSeconds( other->seconds() );
		setMinutes( other->minutes() );
		setHours( other->hours() );
		setDays( other->days() );
		setIsCounter( other->isCounter() );
	}

	/**
	* Install or remove a tick listener.
	*/
	void CDateTime::setIsCounter(bool b)
	{
		mCounter = b;
		if ( mTimer )
		{
			killTimer( mTimer );
		}
		if ( mCounter )
		{
			mTimer = startTimer( TENTH_SECOND );
		}
	}

	bool CDateTime::isCounter()
	{
		return mCounter;
	}

	void CDateTime::update()
	{
		if ( ++mHundredths >= 10 )
		{
			mHundredths=0;
			if ( ++mTenths >= 10 )
			{
				mTenths=0;
				if ( ++mSeconds >= 60 )
				{
					mSeconds=0;
					if ( ++mMinutes >= 60 )
					{
						mMinutes=0;
						if ( ++mHours >= 24 )
						{
							mHours=0;
							++mDays;
						}
					}
				}
			}
		}
	}

	void CDateTime::tick()
	{
		++mTicks;
		update();
	}

	void CDateTime::event(CEvent* e)
	{
		inherited::event(e);
		if ( e->type() == CEvent::TimerEvent )
		{
			CTimerEvent* timerEvent = static_cast<CTimerEvent*>(e);
			if ( timerEvent->timerId() == mTimer )
			{
				tick();
			}
		}
	}

} // CARIBOU
