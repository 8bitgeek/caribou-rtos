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
#ifndef CARIBOUSEMAPHORE_H
#define CARIBOUSEMAPHORE_H

#include <caribou/kernel/types.h>
#include <caribou/kernel/thread.h>
#include <caribou/lib/queue.h>

#ifdef __cplusplus
extern "C"
{
#endif

typedef struct _caribou_semaphore_t
{
	int		count;			/* number of semaphore locks available */
} caribou_semaphore_t;

/**
 * @brief Declare a semaphore with a thread queue depth and initial count.
 * @param SEMAPHORE The semaphore name to declare.
 * @param DEPTH The maximum depth of queued threads.
 * @param COUNT The initial semaphore count (must be >= 0).
 */

#define DECL_CARIBOU_SEMAPHORE(SEMAPHORE,COUNT)						\
			caribou_semaphore_t SEMAPHORE={COUNT}

#define DECL_STATIC_CARIBOU_SEMAPHORE(SEMAPHORE,COUNT)				\
			DECL_STATIC_CARIBOU_QUEUE(SEMAPHORE ## queue);			\
			static caribou_semaphore_t SEMAPHORE={COUNT,&SEMAPHORE ## queue}

#define DECL_CARIBOU_BINARY_SEMAPHORE(SEMAPHORE)		caribou_semaphore_t SEMAPHORE={1}

/**
 * @brief Static initializer with a pre-existing message queue storage.
 * @param COUNT The initial semaphore count.
 * @param DEPTH The depth of the threads storage.
 * @param THREADS The pre-allocate threads storage.
 * @return A caribou_semaphore_t initializer.
 */
#define CARIBOU_SEMAPHORE(COUNT,DEPTH,THREADS) {COUNT,CARABOU_QUEUE_INIT(DEPTH,THREADS)}

extern caribou_semaphore_t*	caribou_semaphore_new(int count);
extern void					caribou_semaphore_delete(caribou_semaphore_t* semaphore);
extern caribou_semaphore_t*	caribou_semaphore_init(caribou_semaphore_t* semaphore, int count);
extern bool					caribou_semaphore_signal(caribou_semaphore_t* semaphore);
extern bool					caribou_semaphore_wait(caribou_semaphore_t* semaphore, caribou_tick_t timeout);
extern bool					caribou_semaphore_try_wait(caribou_semaphore_t* semaphore);

#ifdef __cplusplus
}
#endif


#endif
