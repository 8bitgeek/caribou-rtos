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
#include <caribou/kernel/swi.h>
#include <caribou/kernel/kheap.h>
#include <caribou/kernel/kvector.h>
#include <caribou/kernel/thread.h>
#include <caribou/kernel/timer.h>
#include <caribou/kernel/interrupt.h>
#include <caribou/lib/queue.h>
#include <caribou/lib/bitmap_heap.h>
#include <caribou/lib/string.h>
#include <caribou/lib/errno.h>
#include <chip/chip.h>
#include <cpu/cpu.h>

static int kcall_service(kcall_t fn,void* arg);

/**
 * @brief Call into the kernel from process thread space.
 * @param fn Function code, indicates the ind of operation.
 * @param arg The argument pointer to data related to the kind of operation.
 * @return 0 upon success. -1 on errno.
 */
#if 1
int kcall(kcall_t fn, void* arg)
{
	int rc;
	__asm__ __volatile__(	"	mov		r4,%1			\n"			/* R4=fn */
							"   mov		r5,%2			\n"			/* R5=arg */
							"	svc		#0				\n"			/* Software Interrupt*/
							"	mov		%0,r4			\n"			/* rc=R4 */
							: "=r" (rc)
							: "r" (fn), "r" (arg)
							: "r4","r5"
						);
	return rc;
}
#else
int kcall(kcall_t fn, void* arg)
{
	int rc;
	__asm__ __volatile__(	"	cpsie   i				\n"			/* Interrupt must be enabled */
							"	mov		r4,%1			\n"			/* R4=fn */
							"   mov		r5,%2			\n"			/* R5=arg */
							"	svc		#0				\n"			/* Software Interrupt*/
							"	mov		%0,r4			\n"			/* rc=R4 */
							: "=r" (rc)
							: "r" (fn), "r" (arg)
							: "r4","r5"
						);
	return rc;
}
#endif

/**
 * @brief Software Interrupt Vector.
 */
void __attribute__((naked)) _swi(void)
{
	kcall_t fn;
	void* arg;
	int rc;
	__asm__ __volatile__(	"	push	{lr}			\n"
							"	mov		%0,r4			\n"			/* fn=R4 */
							"   mov		%1,r5			\n"			/* arg=R5 */
							: "=r" (fn), "=r" (arg)
							:
							:
						);

	rc = kcall_service(fn,arg);

	__asm__ __volatile__(	"	mov		r4,%0			\n"			/* fn=R4 */
							"   pop		{pc}			\n"
							:
							: "r" (rc)
							: "r4"
						);
}


/**
 * @brief Entry point to dispatch service calls.
 * @param fn The kcall type as defined by the kcall_t enum.
 * @param arg A pointer to input/output variables.
 */
static int kcall_service(kcall_t fn,void* arg)
{
	int rc=(-1);
	switch(fn)
	{
		case KCALL_NOP:						rc=0;							break;
		case KCALL_HEAP_MALLOC:				rc=kheap_malloc(arg);			break;
		case KCALL_HEAP_REALLOC:			rc=kheap_realloc(arg);			break;
		case KCALL_HEAP_CALLOC:				rc=kheap_calloc(arg);			break;
		case KCALL_HEAP_FREE:				rc=kheap_free(arg);				break;
		case KCALL_HEAP_INIT:				rc=kheap_init(arg);				break;	/** Heap initialize an area for heap use */
		case KCALL_HEAP_BLOCK_SIZE:			rc=kheap_block_size(arg);		break;	/** Heap, return size of a heap block */
		case KCALL_HEAP_BLOCKS_ALLOCATED:	rc=kheap_blocks_allocated(arg);	break;	/** Heap, Returns the number of blocks allocated */
		case KCALL_HEAP_BYTES_USED:			rc=kheap_bytes_used(arg);		break;	/** Heap, Returns the number of bytes used */
		case KCALL_HEAP_BYTES_FREE:			rc=kheap_bytes_free(arg);		break;	/** Heap, Returns the number of bytes free */
		case KCALL_HEAP_SIZEOF:				rc=kheap_sizeof(arg);			break;	/** Heap, Returns the size of allocation, given a pointer */
		case KCALL_VECTOR_INSTALL:			rc=kvector_install(arg);		break;	/** Install an vectored ISR */
		case KCALL_VECTOR_REMOVE:			rc=kvector_remove(arg);			break;	/** Remove a vectored ISR */
		case KCALL_VECTOR_REMOVE_ALL:		rc=kvector_remove_all(arg);		break;	/** Remove all vectored ISRs */
		case KCALL_VECTOR_INSTALLED:		rc=kvector_installed(arg);		break;	/** Determine if an ISR is currently installed */
		case KCALL_VECTOR_ENABLE:			rc=kvector_enable(arg);			break;	/** Enable interrupts for a vector */
		case KCALL_VECTOR_DISABLE:			rc=kvector_disable(arg);		break;	/** Disable interrupts for a vector */
		case KCALL_VECTOR_ENABLED:			rc=kvector_enabled(arg);		break;	/** Is the vector ISR enabled? */
        case KCALL_VECTOR_SET:				rc=kvector_set(arg);			break;	/** Set the state of the vector isr (enable/disable) */
		default:							rc=(-1);						break;
	}
	return rc;
}

