 /******************************************************************************
* Copyright Â© 2005-2013 by Pike Aerospace Research Corporation
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

//typedef	char					s8_t;
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
/**
Many protocols require certain events to happen after certain time periods.
For example, if an ACK is not received within a certain time window in TCP,
the packet needs to be retransmitted. For simplicity in implementation, lwIP
piggybacks the timer requirement onto the mailbox and semaphores.
Although complete understanding of timeouts is not required to properly implement
sys_arch.c, it does help explain what the one function you must provide actually does.

QUICK EXPLANATION: The linked list of timeouts is a linked list of struct sys_timeo's.
This structure holds the number of milliseconds left until it should be activated,
as well as a pointer to the function and its argument that should be called on timeout.
When a thread (or the program itself) blocks on a lwIP semaphore (via sys_sem_wait) or
on a mailbox (via sys_mailbox_fetch), it blocks for a time equal to the next timeout
that needs servicing. If the semaphore or mailbox times out, the timeout handlers needing
serviced are called. Otherwise, all the timeouts are decremented by the amount of time
elapsed in the blocking call (hence why it is necessary for sys_sem_wait to accurately
report how long the call was blocked).

The linked list is contained in a struct sys_timeouts. The function you must implement is:
  struct sys_timeouts *sys_arch_timeouts(void): This function returns a pointer to the
  "appropriate" linked list of timeouts.

If you do not use threads in your system, then this implementation is all you need. If
you do use threads, then you will need to give each thread its own sys_timeouts structure,
and return that depending on what thread calls this function. This will be described in
the next section. This "per thread" need is one of the main problem you have when you create
your sys_arch.c file. It's important to understand that lwIP doesn't handle any "cleanup"
function when a thread terminates. So, if you do a real allocation per thread (during sys_thread_new
or sys_arch_timeouts, you have to handle any needed desallocation when your threads terminate).
*/
struct sys_timeouts* sys_arch_timeouts(void);

#define sys_msleep(ms) caribou_thread_sleep_current(from_ms(ms))

#ifdef __cplusplus
}
#endif

#endif /* INCLUDED_ARCH_SYS_ARCH_H */


