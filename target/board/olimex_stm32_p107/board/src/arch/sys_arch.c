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
#include <caribou.h>
#include <caribou/lib/queue.h>

/* ------------------------ System architecture includes ----------------------------- */
#include <arch/sys_arch.h>

/* ------------------------ lwIP includes --------------------------------- */
#include <lwip/opt.h>

#include <lwip/debug.h>
#include <lwip/def.h>
#include <lwip/sys.h>
#include <lwip/mem.h>
#include <lwip/api.h>
#include <lwip/netifapi.h>
#include <lwip/tcp.h>
#include <lwip/udp.h>
#include <lwip/tcpip.h>
#include <lwip/sockets.h>
#include <lwip/mem.h>
#include <lwip/stats.h>

struct sys_timeouts* lwip_system_timeouts = NULL;	/// Default timeouts list for lwIP
sys_thread_t lwip_system_threads = NULL;			/// A list of all threads created by lwIP

#if 0
sys_prot_t sys_arch_protect()
{
	return chip_interrupts_disable();
}

void sys_arch_unprotect(sys_prot_t pval)
{
	chip_interrupts_set(pval);
}
#endif

/// return time in millisseconds
__attribute__((weak)) u32_t sys_now(void)
{
	return (u32_t)to_ms(caribou_timer_ticks());
}

sys_thread_t sys_thread_new(const char *name, lwip_thread_fn thread, void *arg, int stacksize, int prio)
{
	sys_thread_t newthread = malloc(sizeof(sys_thread_wrapper_t));
	if (newthread)
	{
		void* stack = malloc(stacksize);
		if ( stack )
		{
			int lock_state = caribou_lock();
			newthread->next = lwip_system_threads;
			lwip_system_threads = newthread;
			caribou_lock_set(lock_state);
			newthread->timeouts = NULL;
			newthread->thread = caribou_thread_create("lwip",thread,NULL,arg,stack,stacksize,prio);
			if ( !newthread->thread )
			{
				free(stack);
				free(newthread);
				newthread=NULL;
			}
		}
		else
		{
			free(newthread);
			newthread=NULL;
		}
	}
	return newthread;
}

struct sys_timeouts *sys_arch_timeouts(void)
{
	sys_thread_t thread = lwip_system_threads;
	caribou_thread_t *self = caribou_thread_current();
	// Search the threads list for the thread that is currently running
	for ( ; thread!=NULL; thread=thread->next)
	{
		if (thread->thread == self)
			return thread->timeouts;
	}
	// No match, so just return the system-wide default version
	return &lwip_system_timeouts;
}

/** Create a new mutex
 * @param mutex pointer to the mutex to create
 * @return a new mutex */
err_t sys_mutex_new(sys_mutex_t *mutex)
{
	err_t rc=ERR_MEM;
	*mutex = caribou_mutex_new(0);
	if (*mutex)
	{
		rc=ERR_OK;
	}
	return rc;
}

/** Delete a mutex
 * @param mutex the mutex to delete */
void sys_mutex_free(sys_mutex_t *mutex)
{
	caribou_mutex_free(*mutex);
	*mutex=NULL;
}

/** Lock a mutex
 * @param mutex the mutex to lock */
void sys_mutex_lock(sys_mutex_t *mutex)
{
	caribou_mutex_lock(*mutex,0);
}

/** Unlock a mutex
 * @param mutex the mutex to unlock */
void sys_mutex_unlock(sys_mutex_t *mutex)
{
	caribou_mutex_unlock(*mutex);
}

/** Check if a mutex is valid/allocated: return 1 for valid, 0 for invalid */
int sys_mutex_valid(sys_mutex_t *mutex)
{
	int rc = (*mutex != NULL) ? 1 : 0;
	return rc;
}

/** Set a mutex invalid so that sys_mutex_valid returns 0 */
void sys_mutex_set_invalid(sys_mutex_t *mutex)
{
	*mutex = NULL;
}


/** Create a new mbox of specified size
 * @param mbox pointer to the mbox to create
 * @param size (miminum) number of messages in this mbox
 * @return ERR_OK if successful, another err_t otherwise */
err_t sys_mbox_new(sys_mbox_t *mbox, int size)
{
	err_t rc = ERR_MEM;
	*mbox = caribou_queue_new(size);
	if (*mbox)
	{
		rc = ERR_OK;
	}
	return rc;
}

/** Delete an mbox
 * @param mbox mbox to delete */
void sys_mbox_free(sys_mbox_t *mbox)
{
	caribou_queue_delete(*mbox);
	*mbox=NULL;
}

/** Post a message to an mbox - may not fail
 * -> blocks if full, only used from tasks not from ISR
 * @param mbox mbox to posts the message
 * @param msg message to post (ATTENTION: can be NULL) */
void sys_mbox_post(sys_mbox_t *mbox, void *msg)
{
	caribou_queue_post(*mbox,msg,TIMEOUT_INFINITE);
}

/** Try to post a message to an mbox - may fail if full or ISR
 * @param mbox mbox to posts the message
 * @param msg message to post (ATTENTION: can be NULL) */
err_t sys_mbox_trypost(sys_mbox_t *mbox, void *msg)
{
	err_t rc = ERR_WOULDBLOCK;
	if ( caribou_queue_try_post(*mbox,msg) )
	{
		rc = ERR_OK;
	}
	return rc;
}

/** Wait for a new message to arrive in the mbox
 * @param mbox mbox to get a message from
 * @param msg pointer where the message is stored
 * @param timeout maximum time (in milliseconds) to wait for a message
 * @return time (in milliseconds) waited for a message, may be 0 if not waited
 *         or SYS_ARCH_TIMEOUT on timeout
 *         The returned time has to be accurate to prevent timer jitter! */
u32_t sys_arch_mbox_fetch(sys_mbox_t *mbox, void **msg, u32_t timeout)
{
	u32 rc = SYS_ARCH_TIMEOUT;
	caribou_tick_t start = caribou_timer_ticks();
	if ( caribou_queue_take_first(*mbox,msg,timeout) )
	{
		return to_ms(caribou_timer_ticks()) - start;
	}
	return rc;
}

/** Wait for a new message to arrive in the mbox
 * @param mbox mbox to get a message from
 * @param msg pointer where the message is stored
 * @param timeout maximum time (in milliseconds) to wait for a message
 * @return 0 (milliseconds) if a message has been received
 *         or SYS_MBOX_EMPTY if the mailbox is empty */
u32_t sys_arch_mbox_tryfetch(sys_mbox_t *mbox, void **msg)
{
	if ( caribou_queue_try_take_first(*mbox,msg) )
	{
		return 0;
	}
	return SYS_MBOX_EMPTY;
}

/** Check if an mbox is valid/allocated: return 1 for valid, 0 for invalid */
int sys_mbox_valid(sys_mbox_t *mbox)
{
	if (*mbox)
		return 1;
	return 0;
}

/** Set an mbox invalid so that sys_mbox_valid returns 0 */
void sys_mbox_set_invalid(sys_mbox_t *mbox)
{
	*mbox = NULL;
}

/** Create a new semaphore
 * @param sem pointer to the semaphore to create
 * @param count initial count of the semaphore
 * @return ERR_OK if successful, another err_t otherwise */
err_t sys_sem_new(sys_sem_t *sem, u8_t count)
{
	err_t rc = ERR_MEM;
	*sem = caribou_semaphore_new(QUEUE_DEPTH_DYNAMIC,count);
	if ( *sem )
	{
		rc = ERR_OK;
	}
	return rc;
}

/** Signals a semaphore
 * @param sem the semaphore to signal */
void sys_sem_signal(sys_sem_t *sem)
{
	caribou_semaphore_signal(*sem);
}

/** Wait for a semaphore for the specified timeout
 * @param sem the semaphore to wait for
 * @param timeout timeout in milliseconds to wait (0 = wait forever)
 * @return time (in milliseconds) waited for the semaphore
 *         or SYS_ARCH_TIMEOUT on timeout */
u32_t sys_arch_sem_wait(sys_sem_t *sem, u32_t timeout)
{
	caribou_tick_t start = caribou_timer_ticks();
	if ( caribou_semaphore_wait(*sem,timeout) )
	{
		return to_ms(caribou_timer_ticks()) - start;
	}
	return SYS_ARCH_TIMEOUT;
}

/** Delete a semaphore
 * @param sem semaphore to delete */
void sys_sem_free(sys_sem_t *sem)
{
	caribou_semaphore_delete(*sem);
}

/** Check if a sempahore is valid/allocated: return 1 for valid, 0 for invalid */
int sys_sem_valid(sys_sem_t *sem)
{
	if ( *sem )
		return 1;
	return 0;
}

/** Set a semaphore invalid so that sys_sem_valid returns 0 */
void sys_sem_set_invalid(sys_sem_t *sem)
{
	*sem = NULL;
}

/*-----------------------------------------------------------------------------------*/
// Initialize sys arch
void sys_init(void)
{
}

