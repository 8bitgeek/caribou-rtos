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

#ifdef __cplusplus
extern "C"
{
#endif

/**
 ** Byte queues.
 */
typedef struct
{
	uint8_t*		queue;				/// The receive buffer
	uint16_t		size;				/// The receive buffer size
	uint16_t		head;				/// The receive buffer head pointer.
	uint16_t		tail;				/// The receive buffer tail pointer.
} caribou_bytequeue_t;
#define CARIBOU_BYTEQUEUE_INIT	{0,0,0,0}

caribou_bytequeue_t*	caribou_bytequeue_new(uint16_t size);
bool	caribou_bytequeue_free(caribou_bytequeue_t* queue);
bool	caribou_bytequeue_init(caribou_bytequeue_t* queue, void* buf, uint16_t size);
bool	caribou_bytequeue_full(caribou_bytequeue_t* queue);
bool	caribou_bytequeue_empty(caribou_bytequeue_t* queue);
bool	caribou_bytequeue_put(caribou_bytequeue_t* queue,uint8_t c);
int		caribou_bytequeue_puts(caribou_bytequeue_t* queue,uint8_t* buf,int sz);
int		caribou_bytequeue_get(caribou_bytequeue_t* queue);
int		caribou_bytequeue_gets(caribou_bytequeue_t* queue,uint8_t* buf,int sz);
int		caribou_bytequeue_level(caribou_bytequeue_t* queue);
bool	caribou_bytequeue_half_full(caribou_bytequeue_t* queue);
int		caribou_bytequeue_size(caribou_bytequeue_t* queue);
void	caribou_bytequeue_clear(caribou_bytequeue_t* queue);

#ifdef __cplusplus
}
#endif

#endif
