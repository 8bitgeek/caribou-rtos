/*
   _________    ____  ________  ____  __  __   ____  __________  _____
  / ____/   |  / __ \/  _/ __ )/ __ \/ / / /  / __ \/_  __/ __ \/ ___/
 / /   / /| | / /_/ // // __  / / / / / / /  / /_/ / / / / / / /\__ \ 
/ /___/ ___ |/ _, _// // /_/ / /_/ / /_/ /  / _, _/ / / / /_/ /___/ / 
\____/_/  |_/_/ |_/___/_____/\____/\____/  /_/ |_| /_/  \____//____/  
                                                                      

Copyright © 2005-2013 by Pike Aerospace Research Corporation
Copyright © 2014-2015 by Mike Sharkey
Copyleft © 2018 by Mike Sharkey 
mike@pikeaero.com        

This file is part of CARIBOU RTOS

CARIBOU RTOS is free software: you can redistribute it and/or modify
it under the terms of the Beerware License Version 43.

----------------------------------------------------------------------------
"THE BEER-WARE LICENSE" (Revision 43):
<mike@pikeaero.com> wrote this file. As long as you retain this notice you
can do whatever you want with this stuff. If we meet some day, and you think
this stuff is worth it, you can buy me a beer in return ~ Mike Sharkey
---------------------------------------------------------------------------- 

*/
#ifndef CARIBOUTIMER_H
#define CARIBOUTIMER_H

#include <caribou/kernel/types.h>
#include <chip/chip.h>

#ifdef __cplusplus
extern "C"
{
#endif

/** 
 * @brief If the CARIBOU_TIMER_F_DYNAMIC flag is set, then it indicates that the
 * timer was dynamically allocated on the heap with caribou_timer_create(), and so will
 * be disposed of properly by caribou_timer_delete().
 * Otherwise, if the CARIBOU_TIMER_F_DYNAMIC is not set, then it is assumed that it is
 * a statically allocated, or stack allocated instance of a caribou_timer_t structure,
 * and so caribou_timer_delete() will make no attempt to de-allocate the memory associated with
 * the timer structure.
 */
#define	CARIBOU_TIMER_F_DYNAMIC		0x01		

/**
 * @brief Normally a caribou_timer_t will trigger a timeout callback upon the termination
 * of the timeout period, and once the callback is serviced, the period counter is then reloaded
 * and the timer restarted, such that the timer will repeat automatically at the specified period.
 * If the CARIBOU_TIMER_F_ONESHOT flag is set, then the timer callback is called exactly once at the
 * first expiration of the period counter. In either case, calling caribou_timer_reset() will
 * re-load the period counter and start the timer again.
 */
#define	CARIBOU_TIMER_F_ONESHOT		0x02		/// A one-shot timer, no-reload

struct _caribou_timer_t;

typedef void* (caribou_timer_callback_fn)(void* thread, struct _caribou_timer_t* timer, void* arg);

/**
 * @brief The caribou_timer_t structure defines the data structure used by 
 * CARIBOU to maintain timers and sleep periods. 
 * @note The structure elements should not be
 * manipulated by the application program, and are subject to change in
 * future releases.
 */
typedef struct _caribou_timer_t
{
    /** @brief A pointer to the previous caribou_timer_t in the linked list. */
	struct _caribou_timer_t*	prev;		
    /** @brief A pointer to the next caribou_timer_t in the linked list. */
	struct _caribou_timer_t*	next;		
    /** @brief Optional timer notification callback function */
	caribou_timer_callback_fn*  timerfn;		
    /** @brief Optional timer notification callback function argument  */
	void*						fnarg;		
    /** @brief The remaining ticks (iffies) before the timer is due to expire. */
	uint32_t					ticks;		
    /** @brief The tick count to re-load in order to re-start the timer period. */
	uint32_t					reloadticks;
    /** @brief The lags which control various timer operations. */
	uint8_t						flags;		
} caribou_timer_t;

/**
 * @brief The from_ms(msec) macro convert from milliseconds to native clock ticks 
 */
#define			from_ms(msec)	(msec/JIFFIES)
/**
 * @brief The to_ms(ticks) macro converts from native clock ticks to milliseconds
 */
#define			to_ms(ticks)	(ticks*JIFFIES)

/**
 * @brief Several CARIBOU functions take a timeout value as a parameter. In those cases,
 * The TIMEOUT_INFINITE constant may be used to indicate that the timeout period should
 * be infinite.
 */
#define			TIMEOUT_INFINITE	0

/**
 * @brief Several CARIBOU functions take a timeout value as a parameter. In those cases,
 * The TIMEOUT_IMMEDIATE constant may be used to indicate that the timeout period should
 * be immediate, such that the function call always returns immediately.
 */
#define			TIMEOUT_IMMEDIATE	-1

/**
 * @brief The caribou_tick_t macro should be used at the data type whenever referring
 * to the native tick (JIFFY) counter data type. In some cases it may be desirable
 * to make it a 64 bit value, and in others 32 bit for instance.
 */
#define caribou_tick_t	unt32_t

#define	caribou_timer_period()	(JIFFIES)

extern bool					caribou_timer_ticks_timeout(caribou_tick_t start, caribou_tick_t timeout);
extern caribou_timer_t*		caribou_timer_create(caribou_timer_callback_fn* timerfn, void* arg, uint8_t flags);
extern caribou_tick_t		caribou_timer_ticks();
extern caribou_timer_t*		caribou_timer_init(caribou_timer_t* timer, caribou_timer_callback_fn* timerfn, void* arg, uint8_t flags);
extern caribou_timer_t*		caribou_timer_reset( caribou_timer_t* timer );
extern caribou_timer_t*		caribou_timer_set( caribou_timer_t* timer, uint32_t ticks );
extern bool					caribou_timer_expired(caribou_timer_t* timer);
extern void					caribou_timer_delete( void* thread, caribou_timer_t* timer );
extern void					caribou_timer_delete_all( void* thread );

#ifdef __cplusplus
}
#endif


#endif
