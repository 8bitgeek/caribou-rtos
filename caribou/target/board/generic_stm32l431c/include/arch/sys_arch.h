 /******************************************************************************
* Copyright © 2005-2013 by Pike Aerospace Research Corporation
* All Rights Reserved
*
*   This file is part of CARIBOU RTOS
*
*   CARIBOU RTOS is free software: you can redistribute it and/or modify
*   it under the terms of the Beerware License Version 43.
*
* ----------------------------------------------------------------------------
* "THE BEER-WARE LICENSE" (Revision 43):
* <mike@pikeaero.com> wrote this file. As long as you retain this notice you
* can do whatever you want with this stuff. If we meet some day, and you think
* this stuff is worth it, you can buy me a beer in return ~ Mike Sharkey
* ----------------------------------------------------------------------------
******************************************************************************/
#ifndef INCLUDED_ARCH_SYS_ARCH_H
#define INCLUDED_ARCH_SYS_ARCH_H

#include <caribou.h>
#include <caribou/kernel/thread.h>
#include <caribou/lib/semaphore.h>
#include <caribou/lib/mutex.h>

#ifdef __cplusplus
extern "C"
{
#endif

typedef struct _sys_thread_wrapper_t
{
	struct _sys_thread_wrapper_t*	next;
	caribou_thread_t* 				thread;
	struct sys_timeo*				timeouts;
} sys_thread_wrapper_t;

typedef	char					s8_t;
typedef caribou_semaphore_t*	sys_sem_t;
typedef caribou_mutex_t*		sys_mutex_t;
typedef	caribou_queue_t*		sys_mbox_t;
typedef sys_thread_wrapper_t*	sys_thread_t;
typedef int  					sys_prot_t;

#define SYS_DEFAULT_THREAD_STACK_DEPTH		PRODUCT_THREAD_DEF_STKSZ
#define SYS_DEFAULT_THREAD_PRIORITY			PRODUCT_THREAD_NORMAL_PRIO

/**
This optional function does a "fast" critical region protection and returns
the previous protection level. This function is only called during very short
critical regions. An embedded system which supports ISR-based drivers might want
to implement this function by disabling interrupts. Task-based systems might want
to implement this by using a mutex or disabling tasking. This function should
support recursive calls from the same task or interrupt. In other words,
sys_arch_protect() could be called while already protected. In that case the
return value indicates that it is already protected.
*/
//extern sys_prot_t sys_arch_protect();
#define sys_arch_protect chip_interrupts_disable

/**
This optional function does a "fast" set of critical region protection to the
value specified by pval. See the documentation for sys_arch_protect() for more
information. This function is only required if your port is supporting an
operating system.
*/
//extern void sys_arch_unprotect(sys_prot_t pval);
#define sys_arch_unprotect chip_interrupts_set

#define sys_msleep(ms) caribou_thread_sleep_current(from_ms(ms))

#ifdef __cplusplus
}
#endif

#endif /* INCLUDED_ARCH_SYS_ARCH_H */


