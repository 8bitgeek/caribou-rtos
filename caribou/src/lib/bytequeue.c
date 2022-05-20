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
#include <caribou/kernel/thread.h>
#include <caribou/lib/bytequeue.h>
#include <caribou/lib/heap.h>
#include <caribou/lib/errno.h>
#include <caribou/lib/string.h>
#include <chip/chip.h>

#if CARIBOU_BYTEQUEUE_DMA
	#define Q_HEAD(q)	(q->head_fn!=NULL ? q->head_fn(q,q->head_d) : q->head)
	#define Q_TAIL(q)	(q->tail_fn!=NULL ? q->tail_fn(q,q->tail_d) : q->tail)
#else
	#define Q_HEAD(q)	(q->head)
	#define Q_TAIL(q)	(q->tail)
#endif

#define _queue_full(q) (Q_HEAD(q) == Q_TAIL(q)-1 || \
									(Q_HEAD(q) == q->size-1 && Q_TAIL(q) == 0))

/*******************************************************************************
*							 BYTEQUEUE
*******************************************************************************/

/**
 * @brief Allocate a new bytequeue struct and initialize it.
 * @param size The size of the queue storage in bytes
 * @return A pointer to the new caribou_bytequeue_t struct.
 */
caribou_bytequeue_t* caribou_bytequeue_new(uint16_t size)
{
	caribou_bytequeue_t* rc = (caribou_bytequeue_t*)malloc(sizeof(caribou_bytequeue_t));
	if ( rc )
	{
		memset(rc,0,sizeof(caribou_bytequeue_t));
		rc->queue = (uint8_t*)malloc(size);
		if ( rc->queue )
		{
			rc->size = size;
		}
		else
		{
			free(rc);
			rc=NULL;
		}
	}
	return rc;
}

/**
 * @brief Free a caribou_bytequeue_t structure, previously allocated by caribou_bytequeue_new().
 * @param queue Pointer to a previously allocated caribou_bytequeue_t structure. 
 * @return Return true if freed, else false.
 */
bool caribou_bytequeue_free(caribou_bytequeue_t* queue)
{
	bool rc=false;
	if ( queue )
	{
		int state = caribou_interrupts_disable();
		if ( queue->queue )
			free(queue->queue);
		free(queue);
		rc=true;
		caribou_interrupts_set(state);
	}
	return rc;
}

/**
 * @brief Initialize a caribou_bytequeue_t structure, using a pre-existing buffer area.
 * @param queue Pointer to a previously uninitialized caribou_bytequeue_t structure. 
 * @param buf The buffer to be usaed as the byte storage area for the queue.
 * @param sz The maximum number of bytes the queue may store, buf must be at least this large.
 * @return Return true if initialized, else false.
 */
bool caribou_bytequeue_init(caribou_bytequeue_t* queue, void* buf, uint16_t size)
{
	bool rc=false;
	memset(queue,0,sizeof(caribou_bytequeue_t));
	if ( queue && buf && size )
	{
		queue->queue = (uint8_t*)buf;
		queue->size = size;
		rc = true;
	}
	return rc;
}

/**
 * @brief Set the head pointer callback function pointer.
 * @param queue pointer to the queue struct
 * @param head_fn the callback function.
 */
void caribou_bytequeue_set_head_fn(caribou_bytequeue_t* queue,uint16_t (*fn)(struct _caribou_bytequeue_*,void*),void* d)
{
	queue->head_fn = fn;
	queue->head_d = d;
}

void caribou_bytequeue_set_tail_fn(caribou_bytequeue_t* queue,uint16_t (*fn)(struct _caribou_bytequeue_*,void*),void* d)
{
	queue->tail_fn = fn;
	queue->tail_d = d;
}

/**
 * @brief Determine of the queue is full;.
 * @param queue Pointer to a previously initialized caribou_bytequeue_t structure.
 * @return Return true if the queue is full, else false (queue full).
 */
bool caribou_bytequeue_full(caribou_bytequeue_t* queue)
{
	int state = caribou_interrupts_disable();
	bool rc = _queue_full(queue);
	caribou_interrupts_set(state);
	return rc;
}

/**
 * @brief Determine of the queue is empty.
 * @param queue Pointer to a previously initialized caribou_bytequeue_t structure.
 * @return Return true if the queue is empty, else false (queue full).
 */
bool caribou_bytequeue_empty(caribou_bytequeue_t* queue)
{
	int state = caribou_interrupts_disable();
	bool rc = ( Q_HEAD(queue) == Q_TAIL(queue) );
	caribou_interrupts_set(state);
	return rc;
}

/**
 * @brief Empty the bytequeue.
 * @param queue Pointer to a previously initialized caribou_bytequeue_t structure.
 */
void caribou_bytequeue_clear(caribou_bytequeue_t* queue)
{
	int state = caribou_interrupts_disable();
	queue->head = queue->tail = 0;
	/* FIXME DMA queue support? */
	caribou_interrupts_set(state);
}

/**
 * @brief Calculate the current fill level of the queue. 
 * @param queue Pointer to a previously initialized caribou_bytequeue_t structure.
 * @return The queue fill-level expressed as the difference in number of bytes between the head and tail pointers.
 */
int caribou_bytequeue_level(caribou_bytequeue_t* queue)
{
	int state = caribou_interrupts_disable();
	int rc = ( Q_HEAD(queue) - Q_TAIL(queue) );
	if ( rc < 0 )
	{
		rc = (queue->size - Q_TAIL(queue)) + Q_HEAD(queue);
	}
	caribou_interrupts_set(state);
	return rc;
}

/**
 * @brief Retrieve the current size of the queue. 
 * @param queue Pointer to a previously initialized caribou_bytequeue_t structure.
 * @return The total of the queue in bytes.
 */
int caribou_bytequeue_size(caribou_bytequeue_t* queue)
{
	return queue->size;
}

/**
 * @brief Determine if the fill-level of the queue is at least half full.
 * @param queue Pointer to a previously initialized caribou_bytequeue_t structure.
 * @return true of the queue is at least half full, else false.
 */
bool caribou_bytequeue_half_full(caribou_bytequeue_t* queue)
{
	return (caribou_bytequeue_level(queue) >= (caribou_bytequeue_size(queue)/2)); 
}

/**
 * @brief Put a byte into the queue.
 * @param queue Pointer to a previously initialized caribou_bytequeue_t structure.
 * @param c The byte to place on the queue.
 * @return Return true if the byte was stored, else false (queue full).
 */
bool caribou_bytequeue_put(caribou_bytequeue_t* queue,uint8_t c)
{
	int state = caribou_interrupts_disable();
	if ( !_queue_full(queue) )
	{
		queue->queue[queue->head++] = c;
		if ( queue->head >= queue->size )
			queue->head = 0;
		caribou_interrupts_set(state);
		return true;
	}
	caribou_interrupts_set(state);
	return false;
}

/**
 * @brief Put a sequence of bytes into the queue.
 * @param queue Pointer to a previously initialized caribou_bytequeue_t structure.
 * @param buf The buffer from where the bytes will be retrieved.
 * @param sz The maximum number of bytes to put from the buffer, buf must be at least this large.
 * @return The number of bytes stored may not equal the input sz if the queue was filled before all bytes stored. 
 */
int caribou_bytequeue_puts(caribou_bytequeue_t* queue,uint8_t* c,int sz)
{
	int rc=0;
	int state = caribou_interrupts_disable();
	while( rc<sz && !_queue_full(queue) )
	{
		queue->queue[queue->head++] = c[rc++];
		if ( queue->head >= queue->size )
			queue->head = 0;
	}
	caribou_interrupts_set(state);
	return rc;
}

/**
 * @brief Get a bytes from the queue.
 * @param queue Pointer to a previously initialized caribou_bytequeue_t structure.
 * @return The next byte in the queue, or -1 if queue is empty.
 */
int caribou_bytequeue_get(caribou_bytequeue_t* queue)
{
	int state = caribou_interrupts_disable();
	int rc = -1;
	if ( Q_HEAD(queue) != Q_TAIL(queue) ) // not empty?
	{
		rc = queue->queue[queue->tail++];
		if ( queue->tail >= queue->size )
			queue->tail = 0;
	}
	caribou_interrupts_set(state);
	return rc;
}

/**
 * @brief Get a sequence of bytes from the queue.
 * @param queue Pointer to a previously initialized caribou_bytequeue_t structure.
 * @param buf The buffer to where the bytes will be stored.
 * @param sz The maximum number of bytes to get from the queue, buf must be at least this large.
 * @return The number of bytes retrieved.
 */
int caribou_bytequeue_gets(caribou_bytequeue_t* queue, uint8_t* buf,int sz)
{
	int state = caribou_interrupts_disable();
	int rc = 0;
	while( Q_HEAD(queue) != Q_TAIL(queue) && rc < sz )
	{
		buf[rc++] = queue->queue[queue->tail++];
		if ( queue->tail >= queue->size )
			queue->tail = 0;
	}
	caribou_interrupts_set(state);
	return rc;
}

/**
 * @brief Get the byte offset of the byte pointed to by the queue head pointer.
 * @param queue Pointer to a previously initialized caribou_bytequeue_t structure.
 * @return A byte offset to the byte at the head pointer.
 */
uint16_t caribou_bytequeue_head(caribou_bytequeue_t* queue)
{
	return queue->head;
}

/**
 * @brief Get the byte offset of the byte pointed to by the queue tail pointer.
 * @param queue Pointer to a previously initialized caribou_bytequeue_t structure.
 * @return A byte offset to the byte at the tail pointer.
 */
uint16_t caribou_bytequeue_tail(caribou_bytequeue_t* queue)
{
	return queue->tail;
}

/**
 * @return Return a pointer to the byte array associated with the queue.
 * @param queue Pointer to a previously initialized caribou_bytequeue_t structure.
 */
uint8_t* caribou_bytequeue_queue(caribou_bytequeue_t* queue)
{
	return queue->queue;
}

/**
 * @return Calculate the current bytes-available level of the queue.  
 * @param queue Pointer to a previously initialized caribou_bytequeue_t structure.
 */
int caribou_bytequeue_avail(caribou_bytequeue_t* queue)
{
    return ( caribou_bytequeue_size(queue) - caribou_bytequeue_level(queue) );
}
