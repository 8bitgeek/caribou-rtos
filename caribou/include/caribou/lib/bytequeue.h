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
#ifndef CARIBOUBYTEQUEUE_H
#define CARIBOUBYTEQUEUE_H

#include <caribou/kernel/types.h>
#include <caribou/lib/mutex.h>

#if !defined(CARIBOU_BYTEQUEUE_DMA)
	#define CARIBOU_BYTEQUEUE_DMA	1
#endif

#ifdef __cplusplus
extern "C"
{
#endif

/**
 * @note In the case where a bytequeue is used with DMA. A callback function for head
 * @note and/or tail values may be nessesary. The haead and tail callback functions
 * @brief are used in the case where the head_fn or tail_fn callback pointers are not NULL.
 */

/**
 * Byte queues.
 */
typedef struct _caribou_bytequeue_
{
	uint8_t*		queue;								/* byte oriented buffer storage */
	uint16_t		size;								/* total number of bytes the buffer may contain */
	uint16_t		head;								/* the buffer head pointer */
	uint16_t		tail;								/* the buffer tail poibter */
#if CARIBOU_BYTEQUEUE_DMA
    uint16_t (*head_fn)(struct _caribou_bytequeue_*,void*);	/* the buffer head pointer callback */
	uint16_t (*tail_fn)(struct _caribou_bytequeue_*,void*);	/* the buffer tail pointer callback */
	void*			head_d;								/* Auxiliary data pointer for head */
	void*			tail_d;								/* Auxiliary data pointer for tail */
#endif
} caribou_bytequeue_t;

#define CARIBOU_BYTEQUEUE_INIT	{0,0,0,0,0,0,0,0}

caribou_bytequeue_t*	caribou_bytequeue_new(uint16_t size);

#if CARIBOU_BYTEQUEUE_DMA
	void		caribou_bytequeue_set_head_fn(caribou_bytequeue_t* queue,uint16_t (*fn)(struct _caribou_bytequeue_*,void*),void* d);
	void		caribou_bytequeue_set_tail_fn(caribou_bytequeue_t* queue,uint16_t (*fn)(struct _caribou_bytequeue_*,void*),void* d);
#endif

bool		caribou_bytequeue_free(caribou_bytequeue_t* queue);
bool		caribou_bytequeue_init(caribou_bytequeue_t* queue, void* buf, uint16_t size);
bool		caribou_bytequeue_full(caribou_bytequeue_t* queue);
bool		caribou_bytequeue_empty(caribou_bytequeue_t* queue);
bool		caribou_bytequeue_put(caribou_bytequeue_t* queue,uint8_t c);
int			caribou_bytequeue_puts(caribou_bytequeue_t* queue,uint8_t* buf,int sz);
int			caribou_bytequeue_get(caribou_bytequeue_t* queue);
int			caribou_bytequeue_gets(caribou_bytequeue_t* queue,uint8_t* buf,int sz);
int			caribou_bytequeue_level(caribou_bytequeue_t* queue);
bool		caribou_bytequeue_half_full(caribou_bytequeue_t* queue);
int			caribou_bytequeue_size(caribou_bytequeue_t* queue);
void		caribou_bytequeue_clear(caribou_bytequeue_t* queue);
uint16_t	caribou_bytequeue_head(caribou_bytequeue_t* queue);
uint16_t	caribou_bytequeue_tail(caribou_bytequeue_t* queue);
uint8_t*	caribou_bytequeue_queue(caribou_bytequeue_t* queue);

#ifdef __cplusplus
}
#endif

#endif
