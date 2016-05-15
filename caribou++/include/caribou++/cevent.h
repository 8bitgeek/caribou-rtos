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
#ifndef _CARIBOU_CEVENT_H_
#define _CARIBOU_CEVENT_H_

#include <caribou++/cobject.h>

namespace CARIBOU {

	/**
	Implements an event object.

		@author Michael Sharkey <mike@pikeaero.com>
	*/
	class CEvent : public CObject
	{
		public:
			typedef enum {
				Invalid				= 0,		/* invalid or any event type depending on context */
				MessageEvent,					/* a message passing event */
				TimerEvent,						/* a timer event */
				UserType			= 1000,		/* user types should be > 1000 */
				Maximum							/* must be last enum!! */
			} Type;
			typedef enum {
				PriorityLow=0,
				PriorityStandard,
				PriorityHigh
			} Priority;

			CEvent(CObject* sender=NULL,bool senderOwns=false,CObject* receiver=NULL);
			CEvent(const CEvent& other)											{copy(other);}
			CEvent(CEvent* other)												{copy(*other);}
			virtual ~CEvent();

			virtual	void				copy(const CEvent& other);

			virtual	void				setPriority(Priority p)					{mPriority = p;}
			virtual	Priority			priority()								{return mPriority;}

			virtual	void				setType(Type type)						{mType=type;}
			virtual	Type				type()									{return mType;}

			virtual	void				setSender(CObject* object)				{mSender=object;}
			virtual	CObject*			sender()								{return mSender;}

			virtual	void				setReceiver(CObject* object)			{mReceiver=object;}
			virtual	CObject*			receiver()								{return mReceiver;}

			/** Sender-ownership of the event is only allowed when using callback dispatch, not to be used with CEventQueue dispatch! */
			inline	void				setSenderOwns(bool senderOwns)			{mSenderOwns=senderOwns;}
			inline	bool				senderOwns()							{return mSenderOwns;}

		private:
			CObject*					mSender;
			CObject*					mReceiver;								/* only if the eevnt is destined for a specific receiver */
			Type						mType;
			Priority					mPriority;
			bool						mSenderOwns;							/* The sender owns the event, no delete! */

	};

} /* namespace CARIBOU */

#endif
