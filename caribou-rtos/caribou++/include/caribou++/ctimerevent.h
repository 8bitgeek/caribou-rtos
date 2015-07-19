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
#ifndef _CARIBOU_CTIMEREVENT_H_
#define _CARIBOU_CTIMEREVENT_H_

#include <caribou++/cevent.h>

namespace CARIBOU {

	class CTimerEvent : public CEvent
	{
		public:
			CTimerEvent();
			CTimerEvent(CObject* sender,void* timer);
			CTimerEvent(CTimerEvent* other)	{copy(*other);}
			CTimerEvent(CTimerEvent& other)	{copy(other);}
			virtual ~CTimerEvent();
			virtual	void		copy(CTimerEvent& other);

			inline void			setTimerId(void* timerId)	{mTimerId=timerId;}
			inline void*		timerId()					{return mTimerId;}

		private:
			void*				mTimerId;

	};

} /* namespace CARIBOU */

#endif
