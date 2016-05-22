/******************************************************************************
* Copyright © 2005-2012 by Pike Aerospace Research Corporation
* All Rights Reserved
*
*   This file is part of CARIBOU RTOS
*
*   CARIBOU is free software: you can redistribute it and/or modify
*   it under the terms of the Beerware License Version 43.
*
* ----------------------------------------------------------------------------
* "THE BEER-WARE LICENSE" (Revision 43):
* <mike@pikeaero.com> wrote this file. As long as you retain this notice you
* can do whatever you want with this stuff. If we meet some day, and you think
* this stuff is worth it, you can buy me a beer in return ~ Mike Sharkey
* ----------------------------------------------------------------------------
******************************************************************************/
#ifndef CARIBOUCSEMAPHORE_H
#define CARIBOUCSEMAPHORE_H

#include <caribou++.h>
#include <caribou/kernel/timer.h>
#include <caribou/lib/semaphore.h>

namespace CARIBOU 
{

	class CSemaphore
	{
		public:
			CSemaphore(int count);
			CSemaphore(const CSemaphore& other);
			virtual ~CSemaphore();

			CSemaphore&	operator=(const CSemaphore& other);

			bool			signal();
			bool			wait(caribou_tick_t timeout=TIMEOUT_INFINITE);
			bool			tryWait(caribou_tick_t timeout=TIMEOUT_IMMEDIATE);

		private:
			caribou_semaphore_t*		mSemaphore;
	};

}

#endif
