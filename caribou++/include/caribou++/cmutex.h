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
#ifndef CARIBOUCMUTEX_H
#define CARIBOUCMUTEX_H

#include "caribou++.h"

namespace CARIBOU {

	/**
	** Implements a mutex data structure.
	** @author Michael Sharkey <mike@pikeaero.com>
	*/
	class CMutex
	{
		public:
			CMutex(uint8_t flags=0,bool lock=false);
			~CMutex();

			bool				tryLock();
			bool				lock(int timeout=0);
			bool				unlock();
			uint16_t			locks();

			uint8_t				flags();
			void				setFlags(uint8_t flags);


		private:
			caribou_mutex_t		mMutex;
	};

}

#endif
