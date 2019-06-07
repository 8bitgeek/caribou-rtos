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
#ifndef _CARIBOU_THREAD_H_
#define _CARIBOU_THREAD_H_

#include <caribou/kernel/types.h>
#include <caribou/kernel/timer.h>
#include <caribou/lib/queue.h>
#include <caribou/lib/bytequeue.h>
#include <caribou/lib/errno.h>

#ifdef __cplusplus
extern "C"
{
#endif

#if !defined(CARIBOU_IPC_MESSAGE_DEPTH)
	#define CARIBOU_IPC_MESSAGE_DEPTH	8
#endif

#if !defined(CARIBOU_IPC_SIGNAL_DEPTH)
	#define CARIBOU_IPC_SIGNAL_DEPTH	8
#endif

/** 
 * @brief The definition of a thread structure. An instance of such a structure exists
 * for each currently running thread.
 */
typedef struct _caribou_thread_t
{
	/** @brief Pointer to the next thread in the linked list. */
	struct _caribou_thread_t*	next;
	
	/** @brief Pointer to the parent thread of this thread */
	struct _caribou_thread_t*	parent;             
	
	/** @brief The stacked program counter of this thread at the last entry to the scheduler */
	void*						pc;                 

	/** @brief The stack pointer of this thread at the last entry point to the scheduler */
	void*						sp;                 
	
	/** @brief The "high-water" mark indicating the most stack used by the thread. */
	void*						stack_usage;        
	
	/** @brief The "low-water" point at which free stack level is dangerously low. */
	void*						stack_low;          
	
	/** @brief Pointer to the top word of the thread's stack */
	void*						stack_top;          
	
	/** @brief Pointer to the bottom of the thread's stack */
    void*						stack_base;         
	
	/** @brief Flags to indicate the current state of the thread */
	uint16_t					state;              
	
	/** @brief Thread priority - currently implemented as a number of jiffies of run time - higher number = more jiffies*/
	int16_t						prio;               
	
	/** @brief A Pointer to the '\0' terminated ASCII name of the tread or NULL */
	const char*					name;               
	
	/** @brief An optional argument pointer passed during the creation of the thread */
	void*						arg;                
	
	/** @brief The total run time of the thread expressed in jiffies. */
	uint64_t					runtime;            
	
	/** @brief Thread lock count incremented on caribou_thread_lock(), decremented on caribou_thread_unlock() */ 
	int16_t						lock;               
	
	/** @brief Callback function pointer which is called just pror to the thread being terminated, can be NULL */
	void						(*finishfn)(void*); 
	
	/** @brief A linked list of timers belong to this thread. */
	caribou_timer_t*			timer;              
	
	/** @brief A copy of the global errno variable, preserved here on each context switch */
	errno_t						errno;              
	
	/** @brief The current sleep state (<=0: wakeup), (>0: sleep state). @note The main thread can never sleep. */
	int16_t						sleep;              

	/** @brief The watchdog counter */
	uint16_t					watchdog_count;

	/** @brief The watchdog counter reload */
	uint16_t					watchdog_count_reload;

	#if defined(CARIBOU_MPU_ENABLED)
		/** The thread has claimed an MPU subregion (only 0 or 1 supported) */
		int						mpu_subregion_cnt;
		/** The heap number of the MPU heap for this thread */
		int						mpu_heap_num;
		/** The MPU region belonging to this thread */
		int						mpu_region;	
		/** The MPU subregion belonging to this thread */
		int						mpu_subregion;
	#endif

	/** IPC message queue */
	caribou_queue_msg_t*		ipc_messages[CARIBOU_IPC_MESSAGE_DEPTH];
	caribou_queue_t				ipc_message_queue;

	/** IPC signal queue */
	uint8_t*					ipc_signals[CARIBOU_IPC_SIGNAL_DEPTH];
	caribou_bytequeue_t			ipc_signal_queue;

} caribou_thread_t;

/** A structure containing the current state of the CARIBOU thread core */
typedef struct
{
    /** A pointer to the root node of the linked list of threads which makes up the run queue. */
    caribou_thread_t*	queue;
    /** A pointer to the caribou_thread_t which is currently executing. */
    caribou_thread_t*	current;
    /** The priority counter counts down the number of jiffies of the currently executing, thread and when reaches zero, a context switch is executed */
    int16_t				priority;					
    /** An optional pointer to a callback function which may be called when a thread fault is detected in order to notify the application layer. */
    void*				(*faultfn)(int, void*);	
    /** Optional arguments to pass to the ault callback */
    void*				faultarg;					// argument to pass to fault callback
    /** The faultflags indicate the nature of the fault */
    uint16_t			faultflags;
    /** The CARIBOU jifies counter get incremented on each hardware scheduling timer */
    caribou_tick_t      jiffies;
    /** Used internally for calculating the delta related to firing thread-owned timers */
    caribou_tick_t      tail_jiffies;
	/** Option bits */
	uint16_t			options;
	/** Software Watchdog timeout period ticks elapsed */
	caribou_tick_t		watchdog_ticks;
	/** Software Watchdog Checkin callback */
   	void				(*watchdog_checkin)(void); 
	/** Software Watchdog Timeout callback */
   	void				(*watchdog_timeout)(caribou_thread_t*); 

#if CARIBOU_DEADLINE_THREAD
	/** Deadline Thread */
	caribou_thread_t*	deadline_thread;
	/** Deadline Thread Period */
	caribou_tick_t		deadline_thread_period;
	/** Deadline Thread Reference Time */
	caribou_tick_t		deadline_thread_ref;
#endif
	
} caribou_state_t;

/** An instance o the current thread state. */
extern caribou_state_t caribou_state;

/** Uncomment the following line in order to support dumping threads on a kernel crash */
/* #define CARIBOU_THREAD_DUMP */

/**
 * @brief The name of the main thread.
 */
#if !defined(CARIBOU_MAIN_THREAD_NAME)
    #define CARIBOU_MAIN_THREAD_NAME        "CARIBOU"
#endif

/**
 * @brief A convenience proprocessor directive to establish a default thread stack size.
 */
#if !defined(CARIBOU_THREAD_DEF_STKSZ)
	#define CARIBOU_THREAD_DEF_STKSZ		1024
#endif

/**
 * @brief A convenience preprocessor directive which specifies the lowest thread priority.
 * Threads running at priority zero (0), get no scheduled run time, and are presumed to be
 * primarily interrupt, timer, or event driven. All normal thread services such as timers and so 
 * forth are available.
 */
#define CARIBOU_THREAD_LOWPRIO			0

/**
 * @brief A convenience preprocessor directive which specifies a normal pririty thread, one which
 * has a run period of one jiffy.
 */
#if !defined(CARIBOU_THREAD_NORMALPRIO)
	#define CARIBOU_THREAD_NORMALPRIO		1
#endif

/**
 * @brief A convenience preprocessor directive which specifies a high priority thread, one which
 * has a run period of two jiffies.
 */
#if !defined(CARIBOU_THREAD_HIGHPRIO)
	#define CARIBOU_THREAD_HIGHPRIO		2
#endif


/**
 * @brief A convenience preprocessor directive which specifies the default thread priority.
 */
#if !defined(CARIBOU_THREAD_DEF_PRIO)
	#define CARIBOU_THREAD_DEF_PRIO			CARIBOU_THREAD_LOWPRIO
#endif

/** @brief The Software watchdog option is enabled */
#define CARIBOU_THREAD_O_WATCHDOG		0x0001

/** @brief A thread flag which signifies that the thread is in the yield state. */
#define CARIBOU_THREAD_F_YIELD			0x0002
/** @brief A thread flag which signifies that the thread is in the termination state. */
#define CARIBOU_THREAD_F_TERMINATED		0x0004
/** @brief A thread flag which signified that a deadline thread is scheduled */
#define CARIBOU_THREAD_F_DEADLINE		0x0008
/** @brief A thread has check in with the watchdog, within the window */
#define CARIBOU_THREAD_F_WATCHDOG_FEED	0x4000

#define CARIBOU_THREAD_F_IDLE_MASK		(CARIBOU_THREAD_F_YIELD | CARIBOU_THREAD_F_TERMINATED)

#define	THREAD_FAULT_STACK_LOW			0x0001
#define	THREAD_FAULT_STACK_UNDERFLOW	0x0002
#define	THREAD_FAULT_STACK_OVERFLOW		0x0004
#define	THREAD_FAULT_ALLOC_FAILURE		0x0008
#define THREAD_FAULT_HEAP_CORRUPT		0x0010

/* @brief Yield CPU time while expression is true */
#define caribou_thread_yield_while(e) while(e) caribou_thread_yield()

extern caribou_thread_t*	caribou_thread_init(int16_t priority); // initialize the main thread
extern void					caribou_thread_fault_set(void* (*fn)(int, void*),void* arg);
extern caribou_thread_t*	caribou_thread_create(	
													const char* name, 
													void        (*run)(void*), 
													void        (*finish)(void*), 
													void*       arg, 
													void*       stackaddr, 
													int         stack_size, 
													int16_t     priority, 
													uint16_t 	watchdog_count_reload
													);
extern void					caribou_thread_set_priority(caribou_thread_t* thread, int16_t priority );

extern void					caribou_thread_yield(void);
extern void					caribou_thread_finish(void);
extern void					caribou_thread_terminate(caribou_thread_t* thread);
extern caribou_thread_t*	caribou_thread_root(void);
extern caribou_thread_t*	caribou_thread_current(void);
extern void*				caribou_thread_current_arg(void);
extern caribou_thread_t*	caribou_thread_parent(caribou_thread_t* thread);
extern caribou_thread_t*	caribou_thread_first(void);
extern int					caribou_thread_count(void);

extern const char*			caribou_thread_set_name(caribou_thread_t* thread, const char* name);  /* caller owns char* name pointer */
extern const char*			caribou_thread_name(caribou_thread_t* thread);
extern uint64_t				caribou_thread_runtime(caribou_thread_t* thread);
extern uint32_t				caribou_thread_stacksize(caribou_thread_t* thread);
extern uint32_t				caribou_thread_stackusage(caribou_thread_t* thread);
extern int16_t				caribou_thread_priority(caribou_thread_t* thread);
extern uint16_t				caribou_thread_state(caribou_thread_t* thread);

#define 					caribou_thread_lock()			(caribou_state.current->lock=1)
#define 					caribou_thread_unlock()			(caribou_state.current->lock=0)
#define 					caribou_thread_locked(thread)	(thread->lock)

extern void					caribou_thread_sleep_current(caribou_tick_t ticks);
extern void					caribou_thread_sleep(caribou_thread_t* thread, caribou_tick_t ticks);
extern void					caribou_thread_wakeup(caribou_thread_t* thread);

extern void					caribou_thread_dump();				/// for debugging, dump the thread list to stdout
extern void					caribou_thread_wfi();				/// wait for interrupt

extern void					caribou_thread_once();				/// main thread exec loop - used by CARIBOU
extern void					caribou_thread_exec();				/// main thread exec loop - used by CARIBOU

extern int					caribou_timer_idle(caribou_thread_t* thread); // Used internally by CARUBOU for idle time processing

#if defined(CARIBOU_MPU_ENABLED)
	extern void					caribou_thread_mpu_enable(caribou_thread_t* thread);
	extern void					caribou_thread_mpu_disable(caribou_thread_t* thread);
#endif

extern void					caribou_thread_watchdog_init( void (*watchdog_checkin)(void), void (*watchdog_timeout)(caribou_thread_t*) );
extern void					caribou_thread_watchdog_start(caribou_thread_t* thread, uint16_t watchdog_count_reload);
extern void					caribou_thread_watchdog_stop(caribou_thread_t* thread);
extern void					caribou_thread_watchdog_feed(caribou_thread_t* thread);
extern void					caribou_thread_watchdog_feed_self();

#if CARIBOU_DEADLINE_THREAD
	extern void				caribou_thread_set_deadline( caribou_thread_t* thread, caribou_tick_t period); 
	extern bool				caribou_thread_at_deadline( caribou_thread_t* thread ); 
#endif

#ifdef __cplusplus
}
#endif

#endif
