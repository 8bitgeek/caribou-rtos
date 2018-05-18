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
#ifndef _CARIBOU_COBJECT_H_
#define _CARIBOU_COBJECT_H_

#include <caribou.h>

extern "C" void isr_vector(InterruptVector vector,void* arg);

namespace CARIBOU
{

	/**
	** Common CARIBOU object base class providing various services
	*/
	class CMutex;
	class CEvent;
	class CTimerEvent;
	template <class T> class CList;
	template <class K,class T> class CMap;
	class CObject
	{
		public:
			friend class CCaribouMainThread;
			friend void isr_vector(InterruptVector vector,void* arg);
			typedef enum {
				errOK		   = 0,
				errOutOfMemory  = 100,
				errOutOfRange,
				errTimeout,
			} tErrorCode;

			CObject();
			virtual ~CObject();

			uint16_t					objClass()	{return mObjClass;}

			static	void				reset();				/** Executes a Hardware Reset */

			/** Interrupt vector operations... */
			static	void				_isr(InterruptVector vector);
			static	int					disableVector(InterruptVector vector);
			static	int					enableVector(InterruptVector vector);
			static	int					vectorEnabled(InterruptVector vector);
			static	int					vectorSetEnabled(InterruptVector vector, int state);
			static	bool				installVectorIRQ(InterruptVector vector, CObject* object);
			static	bool				removeVectorIRQ(InterruptVector vector, CObject* object);
			static	bool				removeVectorIRQ(CObject* object);

			/**
			 ** @brief broadcast an event to anyone listening. The event is queued to be
			 ** @brief sent out at a later time. This is the prefered method of message
			 ** @brief delivery.
			 **/
			void						broadcast(CEvent* e);

			static	void				installListener(CObject* object, int type);
			static	void				removeListener(CObject* object, int type);

			/// @brief Do not call this method directly. Used for CARIBOU thread timer callback.
			void						timerCallback(CTimerEvent* e);

			/* FIXME */
			inline void					public_irq(InterruptVector vector) {irq(vector);}

			/* User objectLock/Unlock() to protect data exchange between event and object */
			static bool					objectLock();
			/* User objectLock/Unlock() to protect data exchange between event and object */
			static bool					objectUnlock();

			static CARIBOU::CMutex&		objectMutex();

		protected:

			uint16_t					mObjClass;

			static	void				periodic();
			/**
			 ** @brief receive a hardware interrupt. If this object has register itself
			 ** @brief as in interrupt handler using installVectorIRQ(...)
			 ** @brief for a particular vector. This interrupts will come in through this method.
			 **/
			virtual	void				irq(InterruptVector vector)	{}
			/**
			 ** @brief receive a queued event, the complement of CObject::dispatch(CEvent*).
			 **/
			virtual	void				event(CEvent* e);

			/**
			 ** @brief enqueue a new event for broadcast
			 **/
			static	bool				enqueue(CEvent* e);

			virtual caribou_timer_t*	startTimer(uint32_t msec);
			virtual caribou_timer_t*	resetTimer(caribou_timer_t* timerId);
			virtual void				killTimer(caribou_timer_t* timerId);

		private:

			static	int					purge(CObject* object);
			static	void				dequeue();
			static	void				dispatch(CEvent* e);
			static	bool				inBlockingQueue(CEvent* e);

			static	CList<CEvent*>		mEventQueue;
			static	CList<CEvent*>		mBlockingEventQueue;
			static	CMap<CObject*,int>	mListenerMap;
			static	CMutex				mMutex;
	};

}

#endif
