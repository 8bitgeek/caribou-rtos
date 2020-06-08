/******************************************************************************
* Copyright © 2005-2012 by Pike Aerospace Research Corporation
* All Rights Reserved
*
*   This file is part of CARIBOU RTOS.
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
#ifndef _CARIBOU_PLUSPLUS_H_
#define _CARIBOU_PLUSPLUS_H_

#include <caribou.h>

#ifndef _CARIBOU_COBJECT_H_
	#include <caribou++/cobject.h>
#endif

#ifndef _CARIBOU_CTHREAD_H_
	#include <caribou++/cthread.h>
#endif

#ifndef _CARIBOU_CTIMEREVENT_H_
	#include <caribou++/ctimerevent.h>
#endif

#ifndef _CARIBOU_CLIST_H_
	#include <caribou++/cevent.h>
#endif

#ifndef _CARIBOU_CLIST_H_
	#include <caribou++/clist.h>
#endif

#ifndef _CARIBOU_CBYTEARRAY_H_
	#include <caribou++/cbytearray.h>
#endif

#ifndef _CARIBOU_CSTRING_H_
	#include <caribou++/cstring.h>
#endif

#ifdef CARIBOU_LWIP
	#include <lwip/netif.h>
#endif

#if defined(NEW_TAKES_ULONG)
	#define CARIBOU_NEW_SIZE_T	long unsigned int
#elif defined(NEW_TAKES_SIZE_T)
	#define CARIBOU_NEW_SIZE_T	size_t
#else
 #error define NEW_TAKES_ULONG or NEW_TAKES_SIZE_T
#endif

extern void* operator new(CARIBOU_NEW_SIZE_T size);
extern void* operator new[](CARIBOU_NEW_SIZE_T size);
extern void* operator new (CARIBOU_NEW_SIZE_T size, void* ptr);
extern void operator delete(void *p);
extern void operator delete[](void *p);

namespace CARIBOU
{
	/***** MAIN THREAD WRAPPER *****/
	class CMutex;
	class CCaribouMainThread
	{
		friend class CMutex;
		public:
			static	void init(uint8_t priority=0);
			static 	void init(caribou_thread_t* thread);
			static	void once();
			static	void run();
			static	caribou_thread_t* thread() {return mCaribouThread;}
		protected:
		private:
			static	caribou_thread_t*	mCaribouThread;
	};
}

#ifdef __cplusplus
extern "C"
{
#endif

#ifdef __cplusplus
}
#endif

#endif
