/******************************************************************************
* Copyright © 2005-2012 by Pike Aerospace Research Corporation
* All Rights Reserved
*
*   This file is part of CARIBOU RTOS
*
*   DaddyBASIC is free software: you can redistribute it and/or modify
*   it under the terms of the Beerware License Version 43.
*
* ----------------------------------------------------------------------------
* "THE BEER-WARE LICENSE" (Revision 43):
* <mike@pikeaero.com> wrote this file. As long as you retain this notice you
* can do whatever you want with this stuff. If we meet some day, and you think
* this stuff is worth it, you can buy me a beer in return ~ Mike Sharkey
* ----------------------------------------------------------------------------
******************************************************************************/
#ifndef _CARIBOU_CSPINLOCK_H_
#define _CARIBOU_CSPINLOCK_H_

#include <caribou++.h>

namespace CARIBOU {

	/**
	** Implements a spinlock.
	** @author Michael Sharkey <mike@pikeaero.com>
	*/
	class CSpinLock
	{
		public:
			CSpinLock(bool lock=false);
			~CSpinLock();

			inline bool		tryLock()	{return caribou_spinlock_trylock(&mSpinLock);}
			inline bool		lock()		{return caribou_spinlock_lock(&mSpinLock);}
			inline bool		unlock()	{return caribou_spinlock_unlock(&mSpinLock);}
		private:
			caribou_spinlock_t		mSpinLock;
	};

}

#endif
