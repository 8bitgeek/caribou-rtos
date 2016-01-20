/** ***************************************************************************
* @file
* @author Mike Sharkey <mike@pikeaero.com>.
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
#ifndef _CARIBOU_SWI_H_
#define _CARIBOU_SWI_H_

#include <caribou/kernel/types.h>
#include <caribou/kernel/timer.h>
#include <caribou/lib/errno.h>

#ifdef __cplusplus
extern "C"
{
#endif

typedef enum
{
	CARIBOU_KCALL_NOP=0,			/** No Operation, test the kernel SWI */
	CARIBOU_KCALL_MALLOC,
	CARIBOU_KCALL_CALLOC,
	CARIBOU_KCALL_REALLOC,
	CARIBOU_KCALL_FREE,
} kcall_t;

/**
 * @brief Structure used for all of the heap operations.
 */
typedef struct
{
	size_t	nmemb;			/** Number of members (aka calloc) */
	size_t	size;			/** Size of allocation */
	void*	memp;			/** Memory pointer */
} kcall_heap_t;

extern int kcall(kcall_t fn, void* arg);

#ifdef __cplusplus
}
#endif

#endif
