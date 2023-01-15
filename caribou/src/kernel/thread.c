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
#include <caribou.h>
#include <caribou/kernel/thread.h>
#include <caribou/kernel/timer.h>
#include <caribou/kernel/interrupt.h>
#include <caribou/kernel/ipc.h>
#include <caribou/kernel/sched.h>
#include <caribou/kernel/stack.h>
#include <caribou/lib/heap.h>
#include <caribou/lib/string.h>
#include <caribou/lib/errno.h>
#include <chip/chip.h>
#include <cpu/cpu.h>

static void caribou_terminate_threads	( void );
static void thread_finish				( void );

/** @brief An instance o the current thread state. */
caribou_state_t caribou_state;

/*******************************************************************************
 * @brief External reference to the process stack base, normally defined in 
 *        the linker script 
*******************************************************************************/
extern uint32_t __process_stack_base__;

/*******************************************************************************
 * @brief External reference to the process stack end (top), normally defined 
 * 		  in the linker script 
*******************************************************************************/
extern uint32_t __process_stack_end__;

/*******************************************************************************
 * @brief External reference to the main thread stack base, normally defined 
 *        in the linker script 
*******************************************************************************/
extern uint32_t __main_thread_stack_base__;

/*******************************************************************************
 * @brief External reference to the main thread stack base (top), normally 
 * defined in the linker script 
*******************************************************************************/
extern uint32_t	__main_thread_stack_end__;

/*******************************************************************************
 * @brief Clear the fault flags. The current thread is locked prior to setting 
 * the lags, and is unlocked after the flags have been set.
*******************************************************************************/
static uint16_t fault_clear(void)
{
	int state = caribou_interrupts_disable();
	caribou_state.faultflags=0;
	caribou_interrupts_set(state);
	return 0;
}

/*******************************************************************************
 * @brief Set a fault flag. The current thread is locked prior to setting the
 * lags, and is unlocked after the flags have been set.
*******************************************************************************/
static uint16_t fault_set(uint16_t flags)
{
	int state = caribou_interrupts_disable();
	caribou_state.faultflags |= flags;
	flags = caribou_state.faultflags;
	caribou_interrupts_set(state);
	return flags;
}

/*******************************************************************************
 * @brief Emit a thread fault by calling the faultfn callback function.
*******************************************************************************/
uint16_t _caribou_thread_fault_emit(uint16_t flags)
{
	if ( caribou_state.faultfn != NULL )
	{
		caribou_state.faultfn(flags,caribou_state.faultarg);
	}
	return flags;
}

/*******************************************************************************
*							 THREAD PRIVATE
*******************************************************************************/

/*******************************************************************************
 * @brief Allocate and initialize a thread node.
 * @brief parent A pointer to the parent thread node, or NULL.
 * @note THREAD_FAULT_ALLOC_FAILURE is emitted upon allocation failure.
*******************************************************************************/
static caribou_thread_t* new_thread_node(caribou_thread_t* parent)
{
	caribou_thread_t* node = (caribou_thread_t*)malloc(sizeof(caribou_thread_t));
	if ( node )
	{
		memset(node,0,sizeof(caribou_thread_t));
		node->parent = parent;
	}
	else
	{
		_caribou_thread_fault_emit(THREAD_FAULT_ALLOC_FAILURE);
	}
	return node;
}

/*******************************************************************************
 * @brief Dispose of a thread node.
*******************************************************************************/
static void delete_thread_node(caribou_thread_t* node)
{
	free(node);
}

/*******************************************************************************
 * @brief Append a thread node to the list.
*******************************************************************************/
static caribou_thread_t* append_thread_node(caribou_thread_t* node)
{
	int state = caribou_interrupts_disable();
	caribou_thread_t* last = caribou_state.queue;
	if ( last != NULL )
	{
		while ( last->next != NULL )
		{
			last = last->next;
		}
		last->next = node;
	}
	else
	{
		caribou_state.queue = node;
		node->next=NULL;
	}
	caribou_interrupts_set(state);
	return node;
}

/*******************************************************************************
 * @brief Append a thread node to the list.
*******************************************************************************/
static caribou_thread_t* insert_thread_node(
											caribou_thread_t* node,
											caribou_thread_t* after
										)
{
	int state = caribou_interrupts_disable();
	caribou_thread_t* next = after->next;
	after->next=node;
	node->next=next;
	caribou_interrupts_set(state);
	return node;
}

/*******************************************************************************
 * @brief Remove a thread node from the list.
*******************************************************************************/
static caribou_thread_t* remove_thread_node(caribou_thread_t* node)
{
	int state = caribou_interrupts_disable();
	if ( node == caribou_state.queue )
	{
		caribou_state.queue = node->next;
	}
	else
	{
		for(caribou_thread_t* other = caribou_state.queue; other!=NULL; other=other->next)
		{
			if ( other->next == node )
			{
				other->next = node->next;
				break;
			}
		}
		node->next=NULL;
	}
	caribou_interrupts_set(state);
	return node;
}

/*******************************************************************************
 * locate next child
*******************************************************************************/
static caribou_thread_t* find_child_thread_node(caribou_thread_t* parent)
{
	int state = caribou_interrupts_disable();
	register caribou_thread_t* child = caribou_state.queue;
	while( child != NULL )
	{
		if ( child->parent == parent )
		{
			caribou_interrupts_set(state);
			return child;
		}
		child = child->next;
	}
	caribou_interrupts_set(state);
	return child;
}

/*******************************************************************************
 * @return true if this thread is valid
*******************************************************************************/
extern bool caribou_thread_is_valid(caribou_thread_t* thread)
{
	bool rc=false;
	caribou_thread_lock();
	for(caribou_thread_t* next=caribou_state.queue; !rc && next; next = next->next)
	{
		if ( next == thread )
			rc=true;;
	}
	caribou_thread_unlock();
	return rc;
}

/*******************************************************************************
*							 WATCHDOG
*******************************************************************************/

/*******************************************************************************
 * @brief Test if all registered threads have checked in.
 * @return caribou_thread_t* of first node NOT checked in. NULL if all nodes 
 *         are checked in.
*******************************************************************************/
static caribou_thread_t* caribou_thread_watchdog_test_feeds()
{
	caribou_thread_lock();
	for( caribou_thread_t* node = caribou_state.queue; node != NULL; node = node->next )
	{
		if ( node->watchdog_count_reload != 0 ) // node is participating?
		{
			if (node->watchdog_count == 0 )
			{
				caribou_thread_unlock();
				return node;
			}
			else
			{
				node->watchdog_count -= 1;
			}
		}
	}
	caribou_thread_unlock();
	return NULL;
}

/*******************************************************************************
 * @brief Run the software watchdog timer periodically...
*******************************************************************************/
static void caribou_thread_watchdog_run()
{
	if ( caribou_state.options & CARIBOU_THREAD_O_WATCHDOG && 
			(caribou_state.jiffies - caribou_state.watchdog_ticks) > 0 )
	{
		caribou_thread_t* node;
		if ( ( node = caribou_thread_watchdog_test_feeds() ) == NULL )
		{
			if ( caribou_state.watchdog_checkin != NULL )
				caribou_state.watchdog_checkin();
		}
		else
		{
			if ( caribou_state.watchdog_timeout != NULL )
				caribou_state.watchdog_timeout(node);
			chip_reset();
		}
		caribou_state.watchdog_ticks = caribou_state.jiffies;
	}
}

/*******************************************************************************
 * @brief Initialize the watchdog system.
*******************************************************************************/
extern void caribou_thread_watchdog_init( 
									void (*watchdog_checkin)(void), 
									void (*watchdog_timeout)(caribou_thread_t*) 
									)
{
	caribou_thread_lock();

	caribou_state.watchdog_checkin =  watchdog_checkin;
	caribou_state.watchdog_timeout =  watchdog_timeout;

	caribou_state.options          |= CARIBOU_THREAD_O_WATCHDOG;
	caribou_state.watchdog_ticks   =  caribou_state.jiffies; 

	caribou_thread_unlock();
}

/*******************************************************************************
 * @brief Start a watchdog on the thread.
 * @param The thread which will require watchdog feeding.
*******************************************************************************/
extern void caribou_thread_watchdog_start(
											caribou_thread_t* thread, 
											uint16_t watchdog_count_reload
										)
{	
	thread->watchdog_count_reload = watchdog_count_reload;
	thread->watchdog_count 		  = watchdog_count_reload;

	caribou_state.watchdog_ticks  = caribou_state.jiffies-1; // ??
}

extern void caribou_thread_watchdog_stop(caribou_thread_t* thread)
{
	thread->watchdog_count_reload 	= 0;
	thread->watchdog_count 			= 0;
}

extern void caribou_thread_watchdog_feed(caribou_thread_t* thread)
{
	thread->watchdog_count = thread->watchdog_count_reload;
}

extern void caribou_thread_watchdog_feed_self()
{
	caribou_thread_watchdog_feed( caribou_state.current );
}


/*******************************************************************************
*							 SLEEP
*******************************************************************************/

/*******************************************************************************
 * Sleep another thread for a number of clock ticks.
 * @param thread The thread to put to sleep. 
 * @param ticks Number of jiffies to sleep for. A zero (0) value indicates 
 * 		  forever or until woken up
 * the caribou_thread_wakeup() function.
*******************************************************************************/
void caribou_thread_sleep(caribou_thread_t* thread, caribou_tick_t ticks)
{
	caribou_tick_t start = caribou_timer_ticks();
	caribou_thread_lock();
    ++thread->sleep;				/* go to sleep, or wakeup if already a wakeup happened */
	caribou_thread_unlock();
    while ( thread->sleep > 0)		/* while sleeping... */
	{
		if ( caribou_timer_ticks_timeout(start,ticks) )
		{
			caribou_thread_lock();
			--thread->sleep;				/* wake up the thread */
			caribou_thread_unlock();
			break;
		}
		caribou_thread_yield();
	}
}

/*******************************************************************************
 * Sleep the current thread for a number of clock ticks.
 * @param thread The thread to put to sleep. A zero (0) value indicates forever 
 * 		  or until woken up the caribou_thread_wakeup() function.
 * @param ticks Number of jiffies to sleep for. Forever or until 
 * 	      woken up if ticks==0.
*******************************************************************************/
void caribou_thread_sleep_current(caribou_tick_t ticks)
{
	caribou_thread_sleep(caribou_thread_current(),ticks);
}

/*******************************************************************************
 * Wake a thread previously put to sleep with caribou_thread_sleep().
 * @param thread The thread to wake up.
*******************************************************************************/
void caribou_thread_wakeup(caribou_thread_t* thread)
{
	caribou_thread_lock();
    if ( caribou_thread_is_valid(thread) && thread->sleep > 0 )
		--thread->sleep;				/* wake up the thread */
	caribou_thread_unlock();
}

/*******************************************************************************
*							 PROPERTIES
*******************************************************************************/

/*******************************************************************************
 * Set a pointer to the thread's name.
*******************************************************************************/
const char* caribou_thread_set_name(caribou_thread_t* thread, const char* name)
{
	const char* rc;
	caribou_thread_lock();
	rc = caribou_thread_is_valid(thread) ? thread->name = name : "";
	caribou_thread_unlock();
	return rc;
}

/*******************************************************************************
 * @return the thread name pointer
*******************************************************************************/
const char* caribou_thread_name(caribou_thread_t* thread)
{
	const char* rc;
	caribou_thread_lock();
	rc = caribou_thread_is_valid(thread) ? thread->name : "";
	caribou_thread_unlock();
	return rc;
}

/*******************************************************************************
 * @return the thread's runtime in jiffies
*******************************************************************************/
uint64_t caribou_thread_runtime(caribou_thread_t* thread)
{
	uint64_t rc;
	caribou_thread_lock();
	rc = caribou_thread_is_valid(thread) ? thread->runtime : 0L;
	caribou_thread_unlock();
	return rc;
}

/*******************************************************************************
 * @return the thread's stack size in bytes.
*******************************************************************************/
uint32_t caribou_thread_stacksize(caribou_thread_t* thread)
{
	uint32_t rc;
	caribou_thread_lock();
	rc = caribou_thread_is_valid(thread) ? 
			(uint32_t)thread->stack_top - (uint32_t)(thread->stack_base) : 0;
	caribou_thread_unlock();
	return rc;
}

/*******************************************************************************
 * @return the task's state
*******************************************************************************/
uint16_t caribou_thread_state(caribou_thread_t* thread)
{
	uint16_t rc;
	caribou_thread_lock();
	rc = caribou_thread_is_valid(thread) ? thread->state : 0;
	caribou_thread_unlock();
	return rc;
}

/*******************************************************************************
 * @return the parent thread
*******************************************************************************/
caribou_thread_t* caribou_thread_parent(caribou_thread_t* thread)
{
	caribou_thread_t* rc;
	caribou_thread_lock();
	rc = caribou_thread_is_valid(thread) ? thread->parent : NULL;
	caribou_thread_unlock();
	return rc;
}

/*******************************************************************************
 * @return a pointer to the root thread, normally the 'caribou' thread.
*******************************************************************************/
caribou_thread_t* caribou_thread_root(void)
{
	return caribou_state.queue;
}

/*******************************************************************************
 * @return A pointer to the currently running thread structure.
*******************************************************************************/
caribou_thread_t* caribou_thread_current(void)
{
	return caribou_state.current;
}

/*******************************************************************************
 * @return first thread.
*******************************************************************************/
caribou_thread_t* caribou_thread_first(void)
{
	return caribou_thread_root();
}

/*******************************************************************************
 * return current thread arg
*******************************************************************************/
void* caribou_thread_current_arg(void)
{
	return caribou_state.current->arg;
}

/*******************************************************************************
 * @brief Set the priority of the current thread.
 * @param thread A pointer to the target thread.
 * @param prio The priority to assign to the thread in terms of additional
 * scheduling slots assigned to the thread. For instance, 0 means to perform a 
 * switch the thread upon the next context switch interrupt, and 1 means to add 
 * one additional context cycle to the thread's run-time.
*******************************************************************************/
void caribou_thread_set_priority(caribou_thread_t* thread, int16_t prio)
{
	caribou_thread_lock();
    if ( caribou_thread_is_valid(thread) )
		thread->prio = prio;
	caribou_thread_unlock();
}

/*******************************************************************************
 * @return The thread priority of the current thread.
*******************************************************************************/
int16_t caribou_thread_priority(caribou_thread_t* thread)
{
	caribou_thread_lock();
	uint16_t rc = caribou_thread_is_valid(thread) ? thread->prio : 0;
	caribou_thread_unlock();
	return rc;
}

/*******************************************************************************
*							 OPERATIONS
*******************************************************************************/

/*******************************************************************************
 * @brief A wrapper for the hardware "Wait For Interrupt" function chip_wfi().
*******************************************************************************/
void caribou_thread_wfi()
{
	chip_wfi();
}

/*******************************************************************************
 * @brief The remainder of the scheduled time slots for the current thread are 
 *        disposed and the next runnable thread in the queue is scheduled.
*******************************************************************************/
void caribou_thread_yield(void)
{
	if (  caribou_state.current )
		caribou_preempt();
}

/*******************************************************************************
 * @brief Schedules a thread to be terminate upon the next execution of the 
 *        main thread idle loop. The thread's finish callback is executed, in 
 *        which case the thread is responsible for releasing any resources it 
 *        may have allocated. Thread timers will automatically be stopped and 
 *        disposed.
 * @param thread The thread to be scheduled for termination.
*******************************************************************************/
void caribou_thread_terminate(caribou_thread_t* thread)
{
	thread->state |= CARIBOU_THREAD_F_TERMINATED;
	if ( thread->finishfn )
	{
		thread->finishfn(thread->arg);
	}
	// delete any thread timers...
	caribou_timer_delete_all(thread);
	/* unlink the thread */
	remove_thread_node(thread);
	delete_thread_node(thread);
}

/*******************************************************************************
 * Create a new instance of a CARIBOU thread.
 * @param name The ascii name of the thread. This pointer must remain valid for
 * the life span of the thread instance.
 * @param run A Pointer to the entry point function of the thread. Note the 
 *        entry point function must accept a void* pointer even if it is not 
 *        used.
 * @param finish A function which is called up thread termination.
 * @param arg An argument pointer which is passed to the thread entry point 
 *        function run.
 * @param stackaddr A pointer to bottom of the program stack associated with 
 *        this thread. (Some architectures may require word alignment
 * @param stack_size The size of the stack belonging to this thread in bytes.
 * @param priority The priority of the thread.
 * @return A pointer to the newly created thread or NULL if something failed.
*******************************************************************************/
caribou_thread_t* caribou_thread_create(
											const char* name, 
											void 		(*run)(void*), 
											void 		(*finish)(void*), 
											void* 		arg, 
											void* 		stackaddr, 
											int 		stack_size, 
											int16_t 	priority,
											uint16_t 	watchdog_count_reload 
										)
{
	caribou_thread_t*	node=NULL;
	cpu_state_t*	cpu_state;
	
	node = new_thread_node(caribou_state.current==NULL?caribou_state.queue:caribou_state.current);
	if ( node != NULL )
	{
		if ( stackaddr )
		{
			//initialize the process stack pointer
			//memset(stackaddr,0xFA,stack_size);
			memset(stackaddr,0x00,stack_size);
			cpu_state = (cpu_state_t *)(stackaddr + stack_size - sizeof(cpu_state_t) );
			memset(cpu_state,0,sizeof(cpu_state_t));
			#if defined(__arm__)
				cpu_state->hw_stack.r0 = (uint32_t)arg;
				cpu_state->hw_stack.lr = (uint32_t)thread_finish;
				cpu_state->hw_stack.pc = (((uint32_t)run) + INITIAL_PC_OFFSET) & (~1);
				cpu_state->hw_stack.psr = DEFAULT_PSR;
				#if defined(ARM_FVP_LAZY_STACKING)
					cpu_state->sw_stack.lr = DEFAULT_EXCEPTION_RETURN;
				#endif
			#else
				cpu_state->reg.x[CPU_A0_XREG] = (cpu_reg_t)arg;
				cpu_state->reg.x[CPU_RA_XREG] = (cpu_reg_t)thread_finish;
				cpu_state->reg.x[CPU_PC_XREG] = (cpu_reg_t)run;
				cpu_set_initial_state(cpu_state);
			#endif
			node->stack_top = stackaddr + stack_size;
			node->sp = (void*)(node->stack_top - sizeof(cpu_state_t));
			node->stack_base = stackaddr;
		}
		else
		{
			node->sp = (&__process_stack_end__);
			node->stack_top = node->sp;
			node->stack_base = (&__process_stack_base__);
		}
		node->state = 0;
		node->name	= name;
		node->arg	= arg;
		node->prio	= priority;
		node->finishfn = finish;
		caribou_ipc_init(node);
		append_thread_node(node);
		caribou_thread_watchdog_start(node,watchdog_count_reload);
	}
	return node;
}

/*******************************************************************************
 * set the thread fault callback handler
*******************************************************************************/
void caribou_thread_fault_set(void* (*fn)(int, void*),void* arg)
{
	caribou_state.faultfn = fn;
	caribou_state.faultarg = arg;
	caribou_state.faultflags=0;
}

/*******************************************************************************
 * @brief Initialize the thread system with priority of main thread, this 
 *        creates the main'caribou' thread.
*******************************************************************************/
caribou_thread_t* caribou_thread_init(int16_t priority)
{
	/* initialize main thread */
	caribou_state.current = caribou_thread_create( 
													CARIBOU_MAIN_THREAD_NAME, 
													NULL, NULL, NULL, NULL, 
													0, 
													priority, 
													0 
												);
	return caribou_state.current;
}

/*******************************************************************************
 * @brief terminate threads
*******************************************************************************/
static void caribou_terminate_threads( void )
{
	caribou_thread_t* thread=caribou_state.queue;
	caribou_thread_t* next;

	/* terminate threads flagged for termination... */
	for(thread=caribou_state.queue; thread!=NULL; thread=next)
	{
		/* capture the next in case we terminate this thread */
		next = thread->next; 
		caribou_check_sp(thread);
		if ( thread->state & CARIBOU_THREAD_F_TERMINATED && thread != caribou_state.current )
		{
			caribou_thread_terminate(thread);
		}
	}	
}

/*******************************************************************************
*							 SCHEDULER
*******************************************************************************/

/*******************************************************************************
 * @brief  Main thread idle time processing. This weakly liked function gets 
 * called during main (caribou) thread idle time. There is no guaranteed 
 * schedule, however, under normal circumstances, the main_idle() function 
 * should be called with a period of one millisecond. Normally the function 
 * over-ride resides in main.c/pp and must utilize "C" linkage.
*******************************************************************************/
__attribute__((weak)) void main_idle()
{
}

/*******************************************************************************
 * @brief Main thread idle time processing. This weakly liked function gets 
 * called during main (caribou) thread idle time. There is no guaranteed 
 * schedule, however, under normal circumstances, the board_idle() function 
 * should be called with a period of one millisecond. Normally the function 
 * over-ride resides in board.c/pp and must utilize "C" linkage.
 *******************************************************************************/
__attribute__((weak)) void board_idle()
{
}

/*******************************************************************************
 * @brief One itteration of main thread.
 *******************************************************************************/
void caribou_thread_once()
{
	caribou_thread_watchdog_run();
	caribou_thread_yield();
	caribou_timer_idle(caribou_state.queue);
	caribou_thread_yield();
	caribou_terminate_threads();
	caribou_thread_yield();
	board_idle();
}

/*******************************************************************************
 * @brief Enter into the main thread execution loop. This function does not 
 * return. This function should be called once all other threads are created 
 * and started. This function has two callbacks board_idle() and main_idle().
 *******************************************************************************/
void caribou_thread_exec()
{
	for(;;)
	{
		caribou_thread_once();
		caribou_thread_yield();
	}
}

/*******************************************************************************
 * @brief Get here if a thread returns from it's run() function, wait to die.
 *******************************************************************************/
static void thread_finish(void)
{
	caribou_thread_watchdog_stop(caribou_state.current);
	caribou_state.current->state |= CARIBOU_THREAD_F_TERMINATED;
	for (;;)
	{
		// wait to die..
		caribou_thread_yield();
	}
}
