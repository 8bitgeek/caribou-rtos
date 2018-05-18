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

#include <caribou/kernel/timer.h>
#include <caribou/kernel/thread.h>
#include <caribou/kernel/interrupt.h>
#include <caribou/lib/heap.h>
#include <chip/chip.h>
#include <cpu/cpu.h>

extern uint16_t			_caribou_thread_fault_emit(uint16_t flags);

/*******************************************************************************
*							 TIMER
*******************************************************************************/

caribou_tick_t caribou_timer_ticks()	
{
	return caribou_state.jiffies;
}


/**
 * @brief The caribou_timer_expired() function is used to determine
 * if a timer has expired.
 * @param time A pointer to a previously initialized caribou_timer_t 
 * instance.
 * @return true if the timer has expired, or false if the timer has yet to expire.
 */
bool caribou_timer_expired(caribou_timer_t* timer)
{
	return (timer->ticks==0);
}


// dispose of a thread node
static void delete_timer_node(caribou_timer_t* node)
{
	if ( node->flags & CARIBOU_TIMER_F_DYNAMIC )
		bitmap_heap_free(node);
}

static bool find_timer_node(caribou_thread_t* thread, caribou_timer_t* node)
{
	bool rc=false;
	caribou_thread_lock();
	for( caribou_timer_t* next=thread->timer; !rc && next!=NULL; next=next->next)
	{
		if ( node == next )
		{
			rc=true;
		}
	}
	caribou_thread_unlock();
	return rc;
}

// append a thread node to the list
static caribou_timer_t* append_timer_node(caribou_thread_t* thread, caribou_timer_t* node)
{
	if ( !find_timer_node(thread,node) )
	{
		caribou_thread_lock();
		caribou_timer_t* last = thread->timer;
		if ( last != NULL )
		{
			while ( last->next != NULL )
			{
				last = last->next;
			}
			last->next = node;
			node->prev = last;
		}
		else
		{
			thread->timer = node;
			node->prev=NULL;
			node->next=NULL;
		}
		caribou_thread_unlock();
	}
	return node;
}

// remove a timer node from the list
static caribou_timer_t* remove_timer_node(caribou_thread_t* thread, caribou_timer_t* node)
{
	caribou_thread_lock();
	if ( node == thread->timer )
	{
		thread->timer = node->next;
		if ( thread->timer != NULL )
		{
			thread->timer->prev = NULL;
		}
	}
	else
	{
		if ( node->prev != NULL ) node->prev->next = node->next;
		if ( node->next != NULL ) node->next->prev = node->prev;
		node->next=NULL;
		node->prev=NULL;
	}
	caribou_thread_unlock();
	return node;
}

/**
 * @brief Allocate a thread node on the heap, and initialize it
 * @return Upon success, returns a pointer to the newly allocated thread.
 */
static caribou_timer_t* new_timer_node(void* (*timerfn)(void*,void*), void* fnarg )
{
	caribou_timer_t* node = (caribou_timer_t*)bitmap_heap_malloc(sizeof(caribou_timer_t));
	if ( node )
	{
		memset(node,0,sizeof(caribou_timer_t));
		node->timerfn = timerfn;
		node->fnarg = fnarg;
	}
	else
	{
		_caribou_thread_fault_emit(THREAD_FAULT_ALLOC_FAILURE);
	}
	return node;
}


/**
 * @brief Instantiate a new timer on the heap memory, and associate it with the current thread. 
 * @patam timerfn The timer callback function
 * @param arg Arguments to pass to the callback function
 * @param flags Timer flags
 * @return A pointer to the newly allocated caribou_timer_t* structure instance,
 * or NULL if a problem was encountered.
 */
caribou_timer_t* caribou_timer_create( caribou_timer_callback_fn* timerfn, void* arg, uint8_t flags )
{
	caribou_thread_t* thread = caribou_thread_current();
	caribou_timer_t* timer = new_timer_node(timerfn,arg);
	if ( timer )
	{
		timer->flags = flags | CARIBOU_TIMER_F_DYNAMIC;
        timer->timerfn = timerfn;
        timer->fnarg = arg;
		append_timer_node(thread,timer);
	}
	return timer;
}

/**
 * @brief 
 * @param tmer A pointer to the timer
 * @patam timerfn The timer callback function
 * @param arg Arguments to pass to the callback function
 * @param flags Timer flags
 * @return A pointer to the timer or NULL if a problem was encountered.
 */
caribou_timer_t* caribou_timer_init( caribou_timer_t* timer, caribou_timer_callback_fn* timerfn, void* arg, uint8_t flags )
{
	caribou_thread_t* thread = caribou_thread_current();
	if ( timer )
	{
        memset(timer,0,sizeof(caribou_timer_t));
		timer->flags = flags & ~CARIBOU_TIMER_F_DYNAMIC;
        timer->timerfn = timerfn;
        timer->fnarg = arg;
		append_timer_node(thread,timer);
	}
	return timer;
}

/**
 * @brief Determine of the timeout period has expired in relationn to the start time.
 * @param start The time from which the timeout period should have started.
 * @param timeout The timeout period, TIMEOUT_INFINATE wait forever, TIMEOUT_IMMEDIATE, wait never.
 * @return true if the timeout has expired.
 */
bool caribou_timer_ticks_timeout(caribou_tick_t start, caribou_tick_t timeout)
{
	if ( TIMEOUT_INFINITE == timeout )			/* never timed out */
		return false;
	if ( TIMEOUT_IMMEDIATE == timeout )			/* always timed out */
		return true;
	return ((caribou_state.jiffies-start) >= timeout); 
}

/**
 * @brief Set the period of the specified timer.
 * @param timer A pointer to a previously initialized timer.
 * @param ticks The number of ticks per period.
 * @return A pointer to the timer instance.
 */
caribou_timer_t* caribou_timer_set( caribou_timer_t* timer, uint32_t ticks )
{
	caribou_thread_lock();
	timer->ticks = ticks;
	timer->reloadticks = ticks;
	caribou_thread_unlock();
	return timer;
}

/**
 * @brief Reset the period of the specified timer.
 * @param timer A pointer to a previously initialized timer.
 * @return A pointer to the timer instance.
 */
caribou_timer_t* caribou_timer_reset( caribou_timer_t* timer )
{
	caribou_thread_lock();
	timer->ticks = timer->reloadticks;
	caribou_thread_unlock();
	return timer;
}

/**
 * @brief Dispose of a timer instance associated with a thread.
 * @param thread The thread associated with the timer.
 * @param timer A pointer to the timer instance.
 */
void caribou_timer_delete( void* thread, caribou_timer_t* timer )
{
	caribou_thread_lock();
	caribou_timer_set(timer,0);
	remove_timer_node((caribou_thread_t*)thread, timer);
	delete_timer_node(timer);
	caribou_thread_unlock();
}
/**
 * @brief Dispose of all timer instances associated with a thread.
 * @param thread The thread which references the timers to be disposed.
 */
void caribou_timer_delete_all( void* thread )
{
	while ( ((caribou_thread_t*)thread)->timer )
		caribou_timer_delete( (caribou_thread_t*)thread, ((caribou_thread_t*)thread)->timer );
}

/**
** @brief Expire sleep timers and timer timers
** @param thread The subject of the timer and sleep expiry.
** @param delta_jiffies The number of jiffies elapsed since the last timer expiry run.
** @return number timers expired.
*/
static int expire_timer(caribou_thread_t* thread, caribou_timer_t* timer, int delta_jiffies)
{
	int rc=0;
    if ( timer->ticks )
    {
        timer->ticks = (timer->ticks>=delta_jiffies)?timer->ticks-delta_jiffies:0;
        if ( !timer->ticks )
        {
            if ( timer->timerfn )
            {
                timer->timerfn(thread,timer,timer->fnarg);
            }
            if ( !(timer->flags & CARIBOU_TIMER_F_ONESHOT) )
            {
                timer->ticks = timer->reloadticks;
            }
            ++rc;
        }
    }
	return rc;
}

/**
 * @brief Used by CARIBOU to process timers during the main thread idle loop.
 * @return number of timers expired
 */
int caribou_timer_idle(caribou_thread_t* thread)
{
	int rc;
	int delta_jiffies;
	caribou_thread_lock();
	delta_jiffies=(caribou_state.jiffies-caribou_state.tail_jiffies);
	if ( delta_jiffies )
	{
        caribou_state.tail_jiffies = caribou_state.jiffies;
        while(thread)
        {
            /** expire timers...*/
            for(caribou_timer_t* timer=thread->timer; timer!=NULL; timer = timer->next)
            {
                rc += expire_timer(thread,timer,delta_jiffies);
            }
			thread = thread->next;
        }
	}
	caribou_thread_unlock();
	return rc;
}

/**
 * FIXME microsecond delay 
 */
void caribou_timer_usec_delay(uint32_t usecs)
{
	chip_usec_delay(usecs);
}

