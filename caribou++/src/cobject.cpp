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
#include <caribou++/cobject.h>
#include <caribou++/cevent.h>
#include <caribou++/cmutex.h>
#include <caribou++/cobjectqueue.h>
#include <caribou++/ctimerevent.h>
#include <caribou++/cmap.h>
#include <caribou/kernel/thread.h>
#include <caribou/kernel/timer.h>
#include <caribou/kernel/interrupt.h>

/**
* @brief called from low-level interrupt handler, vector has been
* translated to enumerated vector.
*/
static CARIBOU::CTimerEvent timerEvent;

extern "C" void isr_vector(InterruptVector vector,void* arg)
{
	CARIBOU::CObject* object = (CARIBOU::CObject*)arg;

	if ( object != NULL )
	{
		object->public_irq(vector);
	}
}

extern "C" void* cobject_timer_fn(void* thread, caribou_timer_t* timer, void* arg)
{
	CARIBOU::CObject* object = (CARIBOU::CObject*)arg;
	if ( object != NULL )
	{
		timerEvent.setSender(object);
		timerEvent.setTimerId(timer);
		timerEvent.setSenderOwns(true);
		object->timerCallback(&timerEvent);
	}
	return NULL;
}

namespace CARIBOU
{

	CList<CEvent*>		CObject::mEventQueue;
	CList<CEvent*>		CObject::mBlockingEventQueue;
	CMap<CObject*,int>	CObject::mListenerMap;
	CARIBOU::CMutex		CObject::mMutex = CARIBOU::CMutex(CARIBOU_MUTEX_F_RECURSIVE);

	CObject::CObject()
	: mObjClass(0)
	{
	}

	CObject::~CObject()
	{
		purge(this);
	}

	bool CObject::objectLock() 
	{
		return mMutex.lock();
	}

	bool CObject::objectUnlock() 
	{
		return mMutex.unlock();
	}

	CARIBOU::CMutex& CObject::objectMutex()
	{
		return mMutex;
	}

	/**
	 ** @brief broadcast an event to anyone listening. Queued type of dispatch.
	 ** @param e The event to dispatch.
	 **/
	void CObject::broadcast(CEvent* e)
	{
		e->setSender(this);
		enqueue(e);
	}

	/**
	** Start a new timer belonging to this object. The timer will emit CTimerEvent objects to the
	** CObject::event(CEvent*) method at the prescribed intervals.
	** @param msec the number of milliseonds until the timer expires.
	** @return a unique identifier (id).
	*/
	caribou_timer_t* CObject::startTimer(uint32_t msec)
	{
		caribou_timer_t* timerId = caribou_timer_create(cobject_timer_fn,this,0);
		caribou_timer_set(timerId,from_ms(msec));
		return timerId;
	}


	/**
	** Restart an existing timer belonging to this object. The timer will emit CTimerEvent objects to the
	** CObject::event(CEvent*) method at the prescribed intervals.
	** @param msec the number of milliseonds until the timer expires.
	** @return a unique identifier.
	*/
	caribou_timer_t* CObject::resetTimer(caribou_timer_t* timerId)
	{
		caribou_timer_reset(timerId);
		return timerId;
	}

	/**
	* @brief stop a timer and remove it from the queueu
	* @param id The timer id as returned from startTimer()
	*/
	void CObject::killTimer(caribou_timer_t* timerId)
	{
		caribou_timer_delete(caribou_thread_current(),timerId);
	}

	/**
	* @brief get here on a timer event callback
	*/
	void CObject::timerCallback(CTimerEvent* e)
	{
		event(e);
	}

	/**
	** @brief Process Events.
	**/
	void CObject::event(CEvent* e)
	{
	}

	/**
	 ** @brief clear interrupt vector mask - enables interrupts to that vector.
	 */
	int CObject::enableVector(InterruptVector vector)
	{
		return caribou_vector_enable((uint32_t)vector);
	}

	/**
	 ** @brief set interrupt vector mask - disabling interrupts to that vector.
	 */
	int CObject::disableVector(InterruptVector vector)
	{
		return caribou_vector_disable((uint32_t)vector);
	}

	int CObject::vectorEnabled(InterruptVector vector)
	{
		return caribou_vector_enabled((uint32_t)vector);
	}

	int CObject::vectorSetEnabled(InterruptVector vector, int state)
	{
		return chip_vector_set((uint32_t)vector,state);
	}

	/**
	 ** @brief Install an IRQ interrupt handler object at an interrupt vector.
	 ** @param vector The vector number 0-63
	 ** @param object The object to recieve the interrupt.
	 ** @return boolean
	 */
	bool CObject::installVectorIRQ(InterruptVector vector, CObject* object)
	{
		bool rc=caribou_vector_install(vector,isr_vector,object) >= 0 ? true : false;
		return rc;
	}

	/**
	 ** @brief Remove an specific IRQ interrupt handler object by it's CObject* pointer.
	 ** @param object The object to recieve the interrupt.
	 ** @return boolean
	 */
	bool CObject::removeVectorIRQ(InterruptVector vector, CObject* object)
	{
		bool rc=caribou_vector_remove(vector,isr_vector) >= 0 ? true : false;
		return rc;
	}

	/**
	 ** @brief Remove an IRQ interrupt handler object by it's CObject* pointer.
	 ** @param object The object to recieve the interrupt.
	 ** @return boolean
	 */
	bool CObject::removeVectorIRQ(CObject* object)
	{
		bool rc=caribou_vector_remove_all(object);
		return rc;
	}

	/** @brief install an event listener */
	void CObject::installListener(CObject* object, int type )
	{
		objectLock();
		//mListenerMap->set(object,type);
		mListenerMap.append(object,type);
		objectUnlock();
	}

	/** @brief remove an event listener */
	void CObject::removeListener(CObject* object, int type )
	{
		objectLock();
		mListenerMap.take(mListenerMap.indexOf(object));
		objectUnlock();
	}

	/**
	* dispatch some events in the current task's time slice
	*/
	void CObject::dequeue()
	{
		objectLock();
		while ( mEventQueue.count() )
		{
			CEvent* e = mEventQueue.takeFirst();
			if ( e )
			{
				dispatch( e );
			}
		}
		objectUnlock();
	}

	/**
	* Enqueue an event for later dispatch.
	* CEventQueue has event ownership and will delete it unless e->senderOwns() is true.
	* @return true if the event was queued.
	*/
	bool CObject::enqueue(CEvent* e)
	{
		bool rc=false;		/** Only enqueue the event if somebody is listening to it's type... */
		objectLock();
		
		if ( e->priority() == CEvent::PriorityHigh )
		{
			/** jump the queue - LIFO mode */
			/** TODO - load testing required. test threshold where flooding hi priority events begins to starve the queue. */
			mEventQueue.insert(e,0);
		}
		else
		{
			/** normal/low priority - FIFO mode. */
			mEventQueue.append(e);
		}
		
		/* Handle synchronised (blocking) devivery */
		if ( e->priority() == CEvent::PrioritySync )
		{
			mBlockingEventQueue.append(e);
			objectUnlock();
			caribou_thread_yield_while( inBlockingQueue(e) );
			objectLock();
		}

		rc=true;
		objectUnlock();
		return rc;
	}

	/** 
	 * @brief dispatch a particular event registered listener object's event(...) method.
	 * @param e The event to dispatch must already be detached from the event queue.
	 * @note dispatch(...) owns the pointer.
	 * @note Thread locks are used to guard the listener map. This implies that the listening object
	 * should not use a MUTEX while receiving the event in order to avoid a deadlock condition.
	 */
	void CObject::dispatch(CEvent* e)
	{
		for(size_t n=0; n < mListenerMap.count(); n++)
		{
			CARIBOU::CEvent::Type listeningType = (CARIBOU::CEvent::Type)mListenerMap.dataAt(n);
			if ( listeningType == e->type() )
			{
				CObject* obj = mListenerMap.at(n);
				if ( e->receiver() == NULL || (e->receiver() != NULL && obj == e->receiver()) )
				{
					obj->event(e);
				}
			}
		}
		/** Then we delete the event object... */
		if ( e->priority() == CEvent::PrioritySync )
		{
			/* ... first removing it from the blocking queue.... */
			int idx = mBlockingEventQueue.indexOf(e);
			if ( idx > 0 )
			{
				mBlockingEventQueue.take(idx);
			}
		}
		if ( !e->senderOwns() )
		{
			delete e;
		}
	}

	/** 
	  * @brief purge all references to the specified object from the listener map. 
	  */
	int CObject::purge(CObject* object)
	{
		int rc=0;
		objectLock();
		/* @brief If the object is referenced in the listener map, then remove each reference... */
		int idx;
		while ( (idx = mListenerMap.indexOf(object)) >= 0 )
		{
			mListenerMap.take(idx);
		}
		/** 
		  * @brief If there are any events in the queue that are addressed to or from the object, 
		  * then remove them...
		  */
		for ( size_t n=0; n < mEventQueue.count(); n++ )
		{
			CEvent* e = mEventQueue.at(n);
			if ( e )
			{
				if ( e->sender() == object || e->receiver() == object )
				{
					mEventQueue.take(n);
					delete e;
				}
			}
		}
		objectUnlock();
		return rc;
	}

	bool CObject::inBlockingQueue(CEvent* e)
	{
		bool rc=false;
		objectLock();
		for(size_t n=0; !rc && n < mBlockingEventQueue.count(); n++)
		{
			CEvent* other = mBlockingEventQueue.at(n);
			if ( other == e )
			{
				rc = true;
			}
		}
		objectUnlock();
		return rc;
	}

	/** perform periodic queue maintenance */
	void CObject::periodic()
	{
		dequeue();
	}
}
