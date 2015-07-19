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
#ifndef _CARIBOU_CDATETIME_H_
#define _CARIBOU_CDATETIME_H_

#include <caribou++/cobject.h>
#include <caribou++/cevent.h>

namespace CARIBOU
{

	/**
	** Implements a date time object.
	**	@author Michael Sharkey <mike@pikeaero.com>
	**
	** TODO
	**   - Implement date compare operators
	**   - Implement date math operators
	*/
	class CDateTime : public CObject
	{
		public:
			CDateTime(bool counter=false);
			CDateTime(CDateTime* other);
			CDateTime(const CDateTime& other) {copy((CDateTime*)&other);}
			virtual ~CDateTime();
			virtual	void				copy(CDateTime* other);

					void				setIsCounter(bool b);		/* listen to clock ticks */
					bool				isCounter();

					void				setTicks(uint64_t ticks)	{mTicks=ticks;}
					void				setHundredths(uint8_t h)	{mHundredths=h;}
					void				setTenths(uint8_t tenths)	{mTenths=tenths;}
					void				setSeconds(uint8_t seconds)	{mSeconds=seconds;}
					void				setMinutes(uint8_t minutes)	{mMinutes=minutes;}
					void				setHours(uint8_t hours)		{mHours=hours;}
					void				setDays(uint8_t days)		{mDays=days;}

			inline	uint64_t			ticks()		{return mTicks;}
			inline	uint32_t			hundredths(){return mHundredths;}
			inline	uint32_t			tenths()	{return mTenths;}
			inline	uint32_t			seconds()	{return mSeconds;}
			inline	uint32_t			minutes()	{return mMinutes;}
			inline	uint32_t			hours()		{return mHours;}
			inline	uint32_t			days()		{return mDays;}

		protected:
			virtual	void				event(CEvent* e);
			void						update();
			void						tick();						/* manual increment by 1/10th second */
			caribou_timer_t*			mTimer;

		private:
			bool						mCounter;
			uint64_t					mTicks;
			uint8_t						mHundredths;
			uint8_t						mTenths;
			uint8_t						mSeconds;
			uint8_t						mMinutes;
			uint8_t						mHours;
			uint16_t					mDays;

	};

}

#endif
