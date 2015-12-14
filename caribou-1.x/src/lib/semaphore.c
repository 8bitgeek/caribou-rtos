/** ***************************************************************************
* @file
* @author Mike Sharkey <mike@pikeaero.com>.
* @copyright © 2005-2013 by Pike Aerospace Research Corporation
* @copyright © 2014-2015 by Mike Sharkey
* @details This file is part of CARIBOU RTOS
* CARIBOU RTOS is free software: you can redistribute it and/or modify
* it under the terms of the Beerware License Version 43.
* "THE BEER-WARE LICENSE" (Revision 43):
* Mike Sharkey <mike@pikeaero.com> wrote this file. 
* As long as you retain this notice you can do whatever you want with
* this stuff. If we meet some day, and you think this stuff is 
* worth it, you can buy me a beer in return ~ Mike Sharkey
******************************************************************************/
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
caribou_semaphore_t* caribou_semaphore_new(int depth, int count)
{
	caribou_semaphore_t* semaphore = (caribou_semaphore_t*)malloc(sizeof(caribou_semaphore_t));
	if ( semaphore )
	{
		semaphore->queue = caribou_queue_new(depth);
		if ( semaphore->queue )
		{
			semaphore->count = count;
		}
		else
		{
			free(semaphore);
			semaphore=NULL;
		}

	}
	return semaphore;
}

void caribou_semaphore_delete(caribou_semaphore_t* semaphore)
{
	if (semaphore)
	{
		int state = caribou_lib_lock();
		if (semaphore->queue)
		{
			while ( semaphore->count < 0 )
				caribou_semaphore_signal(semaphore);
			caribou_queue_delete(semaphore->queue);
		}
		free(semaphore);
		caribou_lib_lock_restore(state);
	}
}

caribou_semaphore_t* caribou_semaphore_init(caribou_semaphore_t* semaphore, caribou_queue_t* queue, int count)
{
	int state = caribou_lib_lock();
	memset(semaphore,0,sizeof(caribou_semaphore_t));
	semaphore->count = count;
	semaphore->queue = queue;
	caribou_lib_lock_restore(state);
	return semaphore;
}

caribou_queue_t* caribou_semaphore_queue(caribou_semaphore_t* semaphore)
{
	if ( semaphore )
		return semaphore->queue;
	return NULL;
}

/** **************************************************************************
 ** @brief This operation increases the semaphore counter, if the result 
 **        is non-negative then a waiting thread is removed from the 
 **        queue and resumed. Threads are removed from the queue in a FIFO manner.
 ** @param semaphore The semaphore to operate on.
 ** @return true if the semaphore was released.
 *****************************************************************************/
bool caribou_semaphore_signal(caribou_semaphore_t* semaphore)
{
	bool rc=true;
	int state = caribou_lib_lock();
	if ( ++semaphore->count <= 0 )
	{
		caribou_thread_t* thread;
		if ( semaphore->queue && (rc=caribou_queue_try_take_first(semaphore->queue,&thread)) )
		{
			caribou_thread_wakeup(thread);
		}
		else
		{
			--semaphore->count;
			rc=false;
		}
	}
	caribou_lib_lock_restore(state);
	return rc;
}

/** **************************************************************************
 ** @brief This operation decreases the semaphore counter, if the result 
 **        is negative then the invoking thread is queued.
 ** @param semaphore The semaphore to operate on.
 ** @return true of the semaphore was released.
 *****************************************************************************/
bool caribou_semaphore_wait(caribou_semaphore_t* semaphore, caribou_tick_t timeout)
{
	caribou_tick_t start = caribou_timer_ticks();
	while ( !caribou_semaphore_try_wait(semaphore,timeout) )
	{
		if ( caribou_timer_ticks_timeout(start,timeout) )
			return false;
		caribou_thread_yield();
	}
	return true;
}

/** **************************************************************************
 ** @brief This operation decreases the semaphore counter, if the result 
 **        is negative then the invoking thread is queued.
 ** @param semaphore The semaphore to operate on.
 ** @return true if the semaphore was released.
 *****************************************************************************/
bool caribou_semaphore_try_wait(caribou_semaphore_t* semaphore, caribou_tick_t timeout)
{
	bool rc=true;
	int state = caribou_lib_lock();
	if ( --semaphore->count < 0 )
	{
		if ( semaphore->queue && caribou_queue_try_post(semaphore->queue,caribou_thread_current()) )
		{	
			caribou_lib_unlock();
			caribou_thread_sleep(caribou_thread_current(), timeout /* TIMEOUT_INFINITE */); 
			caribou_lib_lock();
		}
		else
		{
			++semaphore->count;	/* failed to wait */
			rc=false;
		}
	}
	caribou_lib_lock_restore(state);
	return rc;
}

