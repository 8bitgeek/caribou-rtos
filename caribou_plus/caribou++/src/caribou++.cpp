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
#include <caribou++.h>
#include <caribou++/cthread.h>
#include <caribou++/cevent.h>
#include <caribou++/ctimerevent.h>
#include <caribou++/clist.h>
#include <caribou++/cmutex.h>
#include <chip/chip.h>

extern "C" int __aeabi_atexit( __attribute__((unused)) void *object,
						__attribute__((unused)) void (*destructor)(void *),
						__attribute__((unused)) void *dso_handle)
{
	return 0;
}

extern "C"
{
	void *__dso_handle = NULL;
}

/**
* Get here on pure virtual is called.
*/
extern "C" __attribute__((weak)) void __cxa_pure_virtual()
{
	chip_reset();
}

/**
* Get here on thread faults, typical stack overflow/corrupt or malloc failed.
*/
extern "C" __attribute__((weak)) void* thread_fault_fn(int fault,void* arg)
{
	chip_reset();
	return NULL;
}

void* operator new(CARIBOU_NEW_SIZE_T size)
{
	void* p;
	p=(void*)malloc(size);
	#if defined(CARIBOU_NEW_TRAP)
		if ( size && p == NULL )
		{
			chip_reset();
		}
	#endif
	return p;
}

void* operator new[](CARIBOU_NEW_SIZE_T size)
{
	void* p;
	p=(void*)malloc(size);
	#if defined(CARIBOU_NEW_TRAP)
		if (size && p == NULL )
		{
			chip_reset();
		}
	#endif
	return p;
}

void* operator new (CARIBOU_NEW_SIZE_T size, void* ptr)
{
	return ptr;
}

void operator delete(void *p)
{
	free(p);
}

void operator delete[](void *p)
{
	free(p);
}

namespace CARIBOU
{
	caribou_thread_t*	CCaribouMainThread::mCaribouThread=NULL;
	void CCaribouMainThread::init(uint8_t priority,void* pnetif)
	{
		caribou_init(priority);
		caribou_thread_fault_set(thread_fault_fn,NULL);
		mCaribouThread = caribou_thread_current();
	}

	void CCaribouMainThread::once()
	{
		caribou_thread_once();
		CObject::periodic();
	}

	void CCaribouMainThread::run()
	{
		for(;;)
		{
			once();
			#if defined( CARIBOU_WFI )
				caribou_wfi();
			#endif
		}
	}
}

