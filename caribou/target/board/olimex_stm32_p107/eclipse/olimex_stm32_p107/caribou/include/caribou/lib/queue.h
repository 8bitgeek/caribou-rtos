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
#ifndef CARIBOUQUEUE_H
#define CARIBOUQUEUE_H

#include <caribou/kernel/types.h>
#include <caribou/lib/mutex.h>
#include <caribou/kernel/timer.h>

#ifdef __cplusplus
extern "C"
{
#endif

/**
 ** Message queues. FIXME - caribou_queue_msg_t to linked list item for linked list queues.
 */
typedef void caribou_queue_msg_t;

typedef struct _caribou_queue_t
{
	int							depth;		/* depth of the queue in terms of number of object pointer capacity */
	int							count;		/* the number of messages in the queue */
	caribou_queue_msg_t**		msgs;		/* array of pointers to messages */
} caribou_queue_t;

/**
 * @brief A caribou_queue_t structure initializer.
 * @param DEPTH The depth of the queue.
 * @param MSGS The storage space for messages. ( Must be at least DEPTH*sizeof(void*) ).
 */
#define CARIBOU_QUEUE(DEPTH,MSGS) {DEPTH,0,MSGS}

/**
 * @brief Declare a queue of a specified depth and allocate the required storage.
 * @param QUEUE The queue to operate on.
 * @param DEPTH The depth of the queue in terms of number of message pointers.
 */
#define DECL_CARIBOU_QUEUE(QUEUE,DEPTH) \
		void* QUEUE ## msgs[DEPTH];	\
		caribou_queue_t QUEUE = CARIBOU_QUEUE(DEPTH,QUEUE ## msgs)

#define DECL_STATIC_CARIBOU_QUEUE(QUEUE,DEPTH) \
		static void* QUEUE ## msgs[DEPTH];	\
		static caribou_queue_t QUEUE = CARIBOU_QUEUE(DEPTH,QUEUE ## msgs)

/*
 * @brief When specified at the 'depth' parameter, the depth of queue is dynamically expanded from the heap allocator 
 */
#define	QUEUE_DEPTH_DYNAMIC					-1
		
/*
 * acquire and restore the queue lock state.
 */
#define caribou_queue_lock()				caribou_lib_lock()
#define	caribou_queue_lock_restore(lvl)		caribou_lib_lock_restore(lvl)

extern caribou_queue_t*		caribou_queue_new(int depth);
extern void					caribou_queue_delete(caribou_queue_t* queue);
extern caribou_queue_t*		caribou_queue_init(caribou_queue_t* queue, int depth, caribou_queue_msg_t** msg);
extern int					caribou_queue_depth(caribou_queue_t* queue);
extern int					caribou_queue_count(caribou_queue_t* queue);
extern bool					caribou_queue_empty(caribou_queue_t* queue);
extern bool					caribou_queue_full(caribou_queue_t* queue);
extern bool					caribou_queue_post(caribou_queue_t* queue, caribou_queue_msg_t* msg, caribou_tick_t timeout);
extern caribou_queue_msg_t*	caribou_queue_last(caribou_queue_t* queue);
extern caribou_queue_msg_t*	caribou_queue_first(caribou_queue_t* queue);
extern caribou_queue_msg_t*	caribou_queue_take_last(caribou_queue_t* queue, caribou_tick_t timeout);
extern bool					caribou_queue_take_first(caribou_queue_t* queue, caribou_queue_msg_t** msg, caribou_tick_t timeout);
extern bool					caribou_queue_try_post(caribou_queue_t* queue, caribou_queue_msg_t* msg);
extern caribou_queue_msg_t*	caribou_queue_try_take_last(caribou_queue_t* queue);
extern bool					caribou_queue_try_take_first(caribou_queue_t* queue,caribou_queue_msg_t** msg);
extern int					caribou_queue_index_of(caribou_queue_t* queue, caribou_queue_msg_t* msg);
extern caribou_queue_msg_t*	caribou_queue_swap(caribou_queue_t* queue, int a, int b);
extern caribou_queue_msg_t*	caribou_queue_rotate(caribou_queue_t* queue);
extern caribou_queue_msg_t*	caribou_queue_take_at(caribou_queue_t* queue, int index, caribou_tick_t timeout);
extern caribou_queue_msg_t*	caribou_queue_try_take_at(caribou_queue_t* queue, int index);
extern caribou_queue_msg_t*	caribou_queue_at(caribou_queue_t* queue, int index);

#ifdef __cplusplus
}
#endif

#endif
