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
#include <caribou/lib/queue.h>
#include <caribou/kernel/thread.h>
#include <caribou/lib/heap.h>
#include <caribou/lib/errno.h>
#include <caribou/lib/string.h>
#include <chip/chip.h>

/** **************************************************************************
 ** @brief Allocate and initialize a new queue on the stack
 ** @param depth The depth of the queue expressed in the number of pointers.
 ** @return A pointer to the new queue or NULL if allocation failed.
 *****************************************************************************/
caribou_queue_t* caribou_queue_new(int depth)
{
	caribou_queue_t* queue=(caribou_queue_t*)malloc(sizeof(caribou_queue_t));
	if(queue)
	{
		if ( depth == QUEUE_DEPTH_DYNAMIC )
		{
			queue->msgs=(caribou_queue_msg_t**)NULL;
			queue->depth = depth;
			queue->count=0;
		}
		else
		{
			queue->msgs=(caribou_queue_msg_t**)malloc(depth*sizeof(caribou_queue_msg_t*));
			if ( queue->msgs )
			{
				memset(&queue->msgs[0],0,depth*sizeof(caribou_queue_msg_t*));
				queue->depth = depth;
				queue->count=0;
			}
			else
			{
				free(queue);
				queue=NULL;
			}
		}
	}
	return queue;
}


/** **************************************************************************
 ** @brief Delete a queue previously created with caribou_queue_new().
 ** @param queue A pointver to the queue to delete.
 *****************************************************************************/
void caribou_queue_delete(caribou_queue_t* queue)
{
	if ( queue )
	{
		if ( queue->msgs )
			free(queue->msgs);
		free(queue);
	}
}

/** **************************************************************************
 ** @brief initialize a queue where storage has been pre-allocated.
 ** @param queue A pointer to the queue to initialize.
 ** @param depth The depth of the queue in terms of number of pointers.
 *****************************************************************************/
caribou_queue_t* caribou_queue_init(caribou_queue_t* queue, int depth, caribou_queue_msg_t** msgs)
{
	queue->count=0;
	queue->depth=depth;
	queue->msgs=msgs;
	return queue;
}


/** **************************************************************************
 ** @brief Determine if the queue is full, meaning count has reached depth.
 ** @param queue The queue in question.
 ** @return true if the queue is full.
 *****************************************************************************/
bool caribou_queue_full(caribou_queue_t* queue)
{
	int lvl = caribou_queue_lock();
    int rc = queue->depth == QUEUE_DEPTH_DYNAMIC ? true : ( queue->count >= queue->depth );
    caribou_queue_lock_restore(lvl);
	return rc;
}

/** **************************************************************************
 ** @brief Determin if the queue is empty (count == 0 ).
 ** @param The queue in question.
 ** @return true if the queue is empty.
 *****************************************************************************/
bool caribou_queue_empty(caribou_queue_t* queue)
{
	int lvl = caribou_queue_lock();
	bool rc = ( queue->count == 0 );
	caribou_queue_lock_restore(lvl);
	return rc;
}

/** **************************************************************************
 ** @param queue The queue in question.
 ** @return The depth of the queue in terms of object capacity.
 *****************************************************************************/
int caribou_queue_depth(caribou_queue_t* queue)
{
	int lvl = caribou_queue_lock();
	int rc = queue->depth == QUEUE_DEPTH_DYNAMIC ? queue->count : queue->depth;
	caribou_queue_lock_restore(lvl);
	return rc;
}

/** **************************************************************************
 ** @Return the number of occupied elements of the queue
 *****************************************************************************/
int caribou_queue_count(caribou_queue_t* queue)
{
	int lvl = caribou_queue_lock();
	int rc = queue->count;
	caribou_queue_lock_restore(lvl);
	return rc;
}

/** **************************************************************************
 ** @brief Post a message to the queue and block while there is no space in 
 **		 the queue.
 ** @param queue The queue to operate on.
 ** @param msg A pointer to the message to insert.
 ** @return If the message was posted return true.
 *****************************************************************************/
bool caribou_queue_post(caribou_queue_t* queue, const caribou_queue_msg_t* msg, caribou_tick_t timeout)
{
	caribou_tick_t start = caribou_timer_ticks();
	while( !caribou_queue_try_post(queue,msg) )
	{
		if ( caribou_timer_ticks_timeout(start,timeout) )
			return false;
		caribou_thread_yield();		
	}
	return true;
}

/** **************************************************************************
 ** @brief Peek at the last message in the queue.
 ** @param queue The queue to operate on.
 ** @return Return the message pointer or NULL.
 *****************************************************************************/
extern caribou_queue_msg_t*	caribou_queue_last(caribou_queue_t* queue)
{
	caribou_queue_msg_t* rc=NULL;
	int lvl = caribou_queue_lock();
	if ( queue->count > 0 )
	{
		rc = queue->msgs[queue->count-1];
	}
	caribou_queue_lock_restore(lvl);
	return rc;
}

/** **************************************************************************
 ** @brief Peek at the last message in the queue.
 ** @param queue The queue to operate on.
 ** @return Return the message pointer or NULL.
 *****************************************************************************/
extern caribou_queue_msg_t*	caribou_queue_first(caribou_queue_t* queue)
{
	caribou_queue_msg_t* rc=NULL;
	int lvl = caribou_queue_lock();
	if ( queue->count > 0 )
	{
		rc = queue->msgs[0];
	}
	caribou_queue_lock_restore(lvl);
	return rc;
}

/** **************************************************************************
 ** @brief Fetch last message from the queue.
 ** @param queue The queue to operate on.
 ** @return Return the message pointer or NULL.
 *****************************************************************************/
caribou_queue_msg_t* caribou_queue_take_last(caribou_queue_t* queue, caribou_tick_t timeout)
{
	caribou_queue_msg_t* rc;
	caribou_tick_t start = caribou_timer_ticks();
	while ( (rc=caribou_queue_try_take_last(queue)) == NULL && !caribou_timer_ticks_timeout(start,timeout) )
		caribou_thread_yield();
	return rc;
}

/** **************************************************************************
 ** @brief Fetch first message from the queue, or wait.
 ** @param queue The queue to operate on.
 ** @return Return the message pointer or NULL.
 *****************************************************************************/
caribou_queue_msg_t* caribou_queue_take_first(caribou_queue_t* queue, caribou_tick_t timeout)
{
	caribou_queue_msg_t* rc;
	caribou_tick_t start = caribou_timer_ticks();
	while ( !(rc=caribou_queue_try_take_first(queue)) )
	{
		if ( caribou_timer_ticks_timeout(start,timeout) )
			return false;
		caribou_thread_yield();
	}
	return rc;
}

/** **************************************************************************
 ** @brief Post a message to the queue and don't block if there is no space in
 **		 the queue.
 ** @param queue The queue to operate on.
 ** @param msg he message to insert.
 ** @return true if message was posted
 *****************************************************************************/
bool caribou_queue_try_post(caribou_queue_t* queue, const caribou_queue_msg_t* msg)
{
	bool rc=false;
	int lvl = caribou_queue_lock();
	if ( queue->depth == QUEUE_DEPTH_DYNAMIC )	// dynamic queue?
	{
		queue->msgs = (caribou_queue_msg_t**)realloc(queue->msgs,(queue->count+1)*sizeof(caribou_queue_msg_t*));
		if ( queue->msgs )
		{
			queue->msgs[queue->count++] = (caribou_queue_msg_t*)msg;
			rc=true;
		}
	}
	else if ( queue->count < queue->depth )		// static queue has space?
	{
		queue->msgs[queue->count++] = (caribou_queue_msg_t*)msg;
		rc=true;
	}
	caribou_queue_lock_restore(lvl);
	return rc;

}

/** **************************************************************************
 ** @brief Fetch last message from the queue.
 ** @param queue The queue to operate on.
 ** @return Return the message pointer or NULL.
 *****************************************************************************/
caribou_queue_msg_t* caribou_queue_try_take_last(caribou_queue_t* queue)
{
	caribou_queue_msg_t* rc=NULL;
	int lvl = caribou_queue_lock();
	if ( queue->count > 0 )
	{
		rc = queue->msgs[--queue->count];
	}
	caribou_queue_lock_restore(lvl);
	return rc;
}

/** **************************************************************************
 ** @brief Fetch first message from the queue
 ** @param queue The queue to operate on.
 ** @return Return the message pointer or NULL.
 *****************************************************************************/
caribou_queue_msg_t* caribou_queue_try_take_first(caribou_queue_t* queue)
{
	caribou_queue_msg_t* rc=NULL;
	int lvl = caribou_queue_lock();
	if ( queue->count > 0 )
	{
		int sz = (sizeof(caribou_queue_msg_t*) * (--queue->count));
		rc = queue->msgs[0];							/* extract the message */
		memmove( queue->msgs, &queue->msgs[1], sz );	/* squeeze the queue */
	}
	caribou_queue_lock_restore(lvl);
	return rc;
}

/** **************************************************************************
 ** @brief Return the index of a particular message in the queue.
 ** @param queue The queue to operate on.
 ** @param msg A pointer to a message.
 ** @return Return the message index or -1.
 *****************************************************************************/
int caribou_queue_index_of(caribou_queue_t* queue, caribou_queue_msg_t* msg)
{
	int rc=-1;
	int lvl = caribou_queue_lock();
	for(int n=0; n < queue->count; n++)
	{
		if ( queue->msgs[n] == msg )
		{
			rc=n;
			break;
		}
	}
	caribou_queue_lock_restore(lvl);
	return rc;
}

/** **************************************************************************
 ** @brief Swap two messages in the queue.
 ** @param queue The queue to operate on.
 ** @param a message A
 ** @param b message B
 ** @return The first item in the queue or NULL.
 *****************************************************************************/
caribou_queue_msg_t* caribou_queue_swap(caribou_queue_t* queue, int a, int b)
{
	caribou_queue_msg_t* rc=NULL;
	int lvl = caribou_queue_lock();
	if ( (a>0 && b>0) && a != b && (a < queue->count && b < queue->count) )
	{
		caribou_queue_msg_t* t = queue->msgs[a];
		queue->msgs[a] = queue->msgs[b];
		queue->msgs[b] = t;
		rc=queue->msgs[0];
	}
	caribou_queue_lock_restore(lvl);	
	return rc;
}

/** **************************************************************************
 ** @brief Rotate the messages in the queue, first->last
 ** @param queue The queue to operate on.
 ** @return The first item in the queue or NULL.
 *****************************************************************************/
caribou_queue_msg_t* caribou_queue_rotate(caribou_queue_t* queue)
{
	caribou_queue_msg_t* rc=NULL;
	int lvl = caribou_queue_lock();
	if ( queue->count >= 1 )
	{
		if ( queue->count >= 2 )
		{
			caribou_queue_msg_t* last = queue->msgs[0];	// first -> last
			for(register int n=0; n < queue->count-1; n++)
				queue->msgs[n] = queue->msgs[n+1];
			queue->msgs[queue->count-1] = last;
		}
		rc = queue->msgs[0]; // return first
	}
	caribou_queue_lock_restore(lvl);	
	return rc;
}

/** **************************************************************************
 ** @brief Take a message our of the queue at an index.
 ** @param queue The queue to operate on.
 ** @param index The index if the message to take.
 ** @param timeout 
 ** @return The first item in the queue or NULL.
 *****************************************************************************/
caribou_queue_msg_t* caribou_queue_take_at(caribou_queue_t* queue, int index, caribou_tick_t timeout)
{
	caribou_queue_msg_t* rc;
	caribou_tick_t start = caribou_timer_ticks();
	while ( (rc=caribou_queue_try_take_at(queue,index)) == NULL && !caribou_timer_ticks_timeout(start,timeout) )
		caribou_thread_yield();
	return rc;

}

/** **************************************************************************
 ** @brief Take a message our of the queue at an index.
 ** @param queue The queue to operate on.
 ** @param index The index if the message to take.
 ** @param timeout 
 ** @return The first item in the queue or NULL.
 *****************************************************************************/
caribou_queue_msg_t* caribou_queue_try_take_at(caribou_queue_t* queue, int index)
{
	caribou_queue_msg_t* rc=NULL;
	int lvl = caribou_queue_lock();
	if ( index >= 0 && index < queue->count )
	{
		int sz = (sizeof(caribou_queue_msg_t*) * (queue->count-index));
		rc = queue->msgs[index];
		memmove( &queue->msgs[index], &queue->msgs[queue->count-index], sz);
	}
	caribou_queue_lock_restore(lvl);
	return rc;
}

/** **************************************************************************
 ** @brief Find a message in the queue at an index.
 ** @param queue The queue to operate on.
 ** @param index The index if the message to take.
 ** @param timeout 
 ** @return The first item in the queue or NULL.
 *****************************************************************************/
caribou_queue_msg_t* caribou_queue_at(caribou_queue_t* queue, int index)
{
	caribou_queue_msg_t* rc=NULL;
	int lvl = caribou_queue_lock();
	if ( index >= 0 && index < queue->count )
	{
		rc = queue->msgs[index];
	}
	caribou_queue_lock_restore(lvl);
	return rc;
}
