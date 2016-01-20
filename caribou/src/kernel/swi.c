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
#include <caribou/kernel/thread.h>
#include <caribou/kernel/timer.h>
#include <caribou/lib/queue.h>
#include <caribou/lib/heap.h>
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

static int _kcall_malloc(void* arg)
{
	int rc=0;
	kcall_heap_t* mc = (kcall_heap_t*)arg;
	if ( (mc->memp = malloc(mc->size)) == NULL )
		rc = (-1);
	return rc;
}

static int _kcall_calloc(void* arg)
{
	int rc=0;
	kcall_heap_t* mc = (kcall_heap_t*)arg;
	if ( (mc->memp = calloc(mc->nmemb,mc->size)) == NULL )
		rc = (-1);
	return rc;
}

static int _kcall_realloc(void* arg)
{
	int rc=0;
	kcall_heap_t* mc = (kcall_heap_t*)arg;
	if ( (mc->memp = realloc(mc->memp,mc->size)) == NULL )
		rc = (-1);
	return rc;
}

static int _kcall_free(void* arg)
{
	int rc=0;
	kcall_heap_t* mc = (kcall_heap_t*)arg;
	if ( mc->memp )
	{
		free(mc->memp);
		mc->memp=NULL;
		mc->size=0;
	}
	else
		rc = (-1);
	return rc;
}

static int kcall_service(kcall_t fn,void* arg)
{
	int rc=(-1);
	switch(fn)
	{
		case CARIBOU_KCALL_NOP:			rc=0;						break;
		case CARIBOU_KCALL_MALLOC:		rc=_kcall_malloc(arg);		break;
		case CARIBOU_KCALL_CALLOC:		rc=_kcall_calloc(arg);		break;
		case CARIBOU_KCALL_REALLOC:		rc=_kcall_realloc(arg);		break;
		case CARIBOU_KCALL_FREE:		rc=_kcall_free(arg);		break;
		default:						rc=(-1);					break;
	}
	return rc;
}

