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
	KCALL_NOP					=	0,			/** No Operation, test the kernel SWI */
	KCALL_HEAP_MALLOC			=	1,			/** Heap allocate, *arg = kcall_malloc_t */
	KCALL_HEAP_REALLOC			=	2,			/** Heap re-allocate, *arg = kcall_malloc_t */
	KCALL_HEAP_CALLOC			=	3,			/** Heap allocate & clear, *arg = kcall_malloc_t */
	KCALL_HEAP_FREE				=	4,			/** Heap free, *arg = kcall_malloc_t */
	KCALL_HEAP_INIT				=	5,			/** Heap initialize an area for heap use */
	KCALL_HEAP_BLOCK_SIZE		=	6,			/** Heap, return size of a heap block */
	KCALL_HEAP_BLOCKS_ALLOCATED	=	7,			/** Heap, Returns the number of blocks allocated */
	KCALL_HEAP_BYTES_USED		=	8,			/** Heap, Returns the number of bytes used */
	KCALL_HEAP_BYTES_FREE		=	9,			/** Heap, Returns the number of bytes free */
	KCALL_HEAP_SIZEOF			=	10,			/** Heap, Returns the size of allocation, given a pointer */
	KCALL_VECTOR_INSTALL		=	11,			/** Install an vectored ISR */
	KCALL_VECTOR_REMOVE			=	12,			/** Remove a vectored ISR */
	KCALL_VECTOR_REMOVE_ALL		=	13,			/** Remove all vectored ISRs */
	KCALL_VECTOR_INSTALLED		=	14,			/** Determine if an ISR is currently installed */
	KCALL_VECTOR_ENABLE			=	15,			/** Enable interrupts for a vector */
	KCALL_VECTOR_DISABLE		=	16,			/** Disable interrupts for a vector */
	KCALL_VECTOR_ENABLED		=	17,			/** Is the vector ISR enabled? */
	KCALL_VECTOR_SET			=	18,			/** Set the state of the vector isr (enable/disable) */
} kcall_t;

typedef struct
{
	void* heap_base;
	void* heap_end;
} kcall_heap_init_t;

typedef struct
{
	size_t		size;							/** Size of allocation */
    size_t		nmemb;							/** Member size */
	void*		p;								/** Pointer to allocated ram */
} kcall_heap_t;

typedef void (*caribou_isr_t)(InterruptVector,void*);

typedef struct
{
	InterruptVector	vector;
	caribou_isr_t	isr;
    void*			arg;						/** ISR argument */
	int				state;						/** enabled / disabled */
	int				rc;							/** return code */
} kcall_vector_t;

extern int kcall(kcall_t fn, void* arg);

#ifdef __cplusplus
}
#endif

#endif
