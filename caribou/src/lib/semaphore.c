/*
   _________    ____  ________  ____  __  __   ____  __________  _____
  / ____/   |  / __ \/  _/ __ )/ __ \/ / / /  / __ \/_  __/ __ \/ ___/
 / /   / /| | / /_/ // // __  / / / / / / /  / /_/ / / / / / / /\__ \ 
/ /___/ ___ |/ _, _// // /_/ / /_/ / /_/ /  / _, _/ / / / /_/ /___/ / 
\____/_/  |_/_/ |_/___/_____/\____/\____/  /_/ |_| /_/  \____//____/  
                                                                      

Copyright © 2005-2013 by Pike Aerospace Research Corporation
Copyright © 2014-2015 by Mike Sharkey
Copyleft © 2018 by Mike Sharkey 
mike@pikeaero.com        

This file is part of CARIBOU RTOS

CARIBOU RTOS is free software: you can redistribute it and/or modify
it under the terms of the Beerware License Version 43.

----------------------------------------------------------------------------
"THE BEER-WARE LICENSE" (Revision 43):
<mike@pikeaero.com> wrote this file. As long as you retain this notice you
can do whatever you want with this stuff. If we meet some day, and you think
this stuff is worth it, you can buy me a beer in return ~ Mike Sharkey
---------------------------------------------------------------------------- 

*/
#include <caribou.h>
#include <caribou/kernel/interrupt.h>
#include <caribou/lib/semaphore.h>
#include <caribou/lib/errno.h>
#include <caribou/lib/heap.h>
#include <caribou/lib/string.h>

/** **************************************************************************
 ** @brief Allocate and initialize a new semaphore on the heap.
 ** @param depth The depth of the thread queue (max number of waiting threads).
 ** @param count The initial semaphore count.
 **
 *****************************************************************************/
caribou_semaphore_t* caribou_semaphore_new(int count)
{
	caribou_semaphore_t* semaphore = (caribou_semaphore_t*)malloc(sizeof(caribou_semaphore_t));
	if ( semaphore )
	{
		semaphore->count = count;
	}
	return semaphore;
}

void caribou_semaphore_delete(caribou_semaphore_t* semaphore)
{
	if (semaphore)
	{
		free(semaphore);
	}
}

caribou_semaphore_t* caribou_semaphore_init(caribou_semaphore_t* semaphore, int count)
{
	int state = caribou_interrupts_disable();
	semaphore->count = count;
	caribou_interrupts_set(state);
	return semaphore;
}

/** **************************************************************************
 ** @brief This operation atomically increment the semaphore counter.
 ** @param semaphore The semaphore to operate on.
 ** @return true if the semaphore was released.
 *****************************************************************************/
bool caribou_semaphore_signal(caribou_semaphore_t* semaphore)
{
	int state = caribou_interrupts_disable();
	++semaphore->count; /* released */
	caribou_interrupts_set(state);
	return true;
}

/** **************************************************************************
 ** @brief This operation atomically decreases the semaphore counter.
 ** @param semaphore The semaphore to operate on.
 ** @return true of the semaphore was released.
 *****************************************************************************/
bool caribou_semaphore_wait(caribou_semaphore_t* semaphore, caribou_tick_t timeout)
{
	bool rc=true;
	caribou_tick_t start = caribou_timer_ticks();
	while ( !(rc=caribou_semaphore_try_wait(semaphore)) )
	{
		if ( caribou_timer_ticks_timeout(start,timeout) )
		{
			rc = false;
			break;
		}
		caribou_thread_yield();
	}
	return rc;
}

/** **************************************************************************
 ** @brief This operation decreases the semaphore counter
 ** @param semaphore The semaphore to operate on.
 ** @return true if the semaphore was released.
 *****************************************************************************/
bool caribou_semaphore_try_wait(caribou_semaphore_t* semaphore)
{
	bool rc=false;
	int state = caribou_interrupts_disable();
	if ( semaphore->count > 0 )
	{
			--semaphore->count;	/* release */
			rc=true;
	}
	caribou_interrupts_set(state);
	return rc;
}

