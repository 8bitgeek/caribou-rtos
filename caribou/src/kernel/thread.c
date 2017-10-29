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
#include <caribou/kernel/thread.h>
#include <caribou/kernel/timer.h>
#include <caribou/kernel/interrupt.h>
#include <caribou/lib/queue.h>
#include <caribou/lib/heap.h>
#if defined(CARIBOU_MPU_ENABLED)
	#include <caribou/lib/bitmap_heap.h>
#endif
#include <caribou/lib/string.h>
#include <caribou/lib/errno.h>
#include <caribou/lib/watchdog.h>
#include <chip/chip.h>
#include <cpu/cpu.h>

/** @brief An instance o the current thread state. */
caribou_state_t caribou_state;

/** @brief Defines the steps to run on entry to a systick ISR */
#ifndef systick_enter
	#define systick_enter()		\
		cpu_systick_enter();	\
		chip_systick_enter()
#endif

/** @brief the steps to run on exit from a systick ISR */
#ifndef systick_exit
	#define systick_exit()		\
		chip_systick_exit();	\
		cpu_systick_exit()
#endif

/** @brief Defines the steps to run on entry to a pendsv ISR */
#ifndef pendsv_enter
	#define pendsv_enter()		\
		cpu_systick_enter();	\
		chip_pendsv_enter()
#endif

/** @brief the steps to run on exit from a pendsv ISR */
#ifndef pendsv_exit
	#define pendsv_exit()		\
		chip_pendsv_exit();	\
		cpu_systick_exit()
#endif

/** @brief External reference to the process stack base, normally defined in the linker script */
extern uint32_t __process_stack_base__;
/** @brief External reference to the process stack end (top), normally defined in the linker script */
extern uint32_t __process_stack_end__;
/** @brief External reference to the main thread stack base, normally defined in the linker script */
extern uint32_t __main_thread_stack_base__;
/** @brief External reference to the main thread stack base (top), normally defined in the linker script */
extern uint32_t	__main_thread_stack_end__;

/** @brief Forward declaration for the private runtimers() function */
static void runtimers();

/** @brief determine if the thread is in a runnable state */
#define runnable(thread) ((thread->state & CARIBOU_THREAD_F_IDLE_MASK) == 0)
/** @brief determine of the thread can be preempted at this time. */
#define preemptable(thread) (thread->lock==0)
/** @brief find the next thread in the queue */
#define nextinqueue(thread) ( thread->next ? thread->next : caribou_state.queue )

/**
 * @brief Clear the fault flags. The current thread is locked prior to setting the
 * lags, and is unlocked after the flags have been set.
 */
static uint16_t fault_clear(void)
{
	int state = caribou_interrupts_disable();
	caribou_state.faultflags=0;
	caribou_interrupts_set(state);
	return 0;
}

/**
 * @brief Set a fault flag. The current thread is locked prior to setting the
 * lags, and is unlocked after the flags have been set.
 */
static uint16_t fault_set(uint16_t flags)
{
	int state = caribou_interrupts_disable();
	caribou_state.faultflags |= flags;
	flags = caribou_state.faultflags;
	caribou_interrupts_set(state);
	return flags;
}

/**
 * @brief Emit a thread fault by calling the faultfn callback function.
 */
uint16_t _caribou_thread_fault_emit(uint16_t flags)
{
	if ( caribou_state.faultfn != NULL )
	{
		caribou_state.faultfn(flags,caribou_state.faultarg);
	}
	return flags;
}

#if defined(CARIBOU_THREAD_DUMP)
    static void caribou_dump_one_thread(caribou_thread_t* thread)
    {
        if ( thread )
        {
            DEBUG_PRINTF( "------------\n");
            DEBUG_PRINTF( "	 thread: 0x%08x\n", thread );
            DEBUG_PRINTF( "	 parent: 0x%08x\n", thread->parent );
            DEBUG_PRINTF( "	   next: 0x%08x\n", thread->next );
            DEBUG_PRINTF( "		 sp: 0x%08x\n", thread->sp );
            DEBUG_PRINTF( "  stack_low: 0x%08x\n", thread->stack_low );
            DEBUG_PRINTF( "  stack_top: 0x%08x\n", thread->stack_top );
            DEBUG_PRINTF( " stack_base: 0x%08x\n", thread->stack_base );
            DEBUG_PRINTF( "	  state: 0x%02x\n", thread->state );
            DEBUG_PRINTF( "	   prio: 0x%02x\n", thread->prio );
            DEBUG_PRINTF( "	   name: \"%s\"\n", thread->name ? thread->name : "(null)" );
        }
    }
#endif

void caribou_thread_dump()
{
    #if defined(CARIBOU_THREAD_DUMP)
        caribou_thread_t* thread;
        DEBUG_PRINTF("_current_thread_ = \"%s\" (0x%08X)\n", caribou_state.current->name, caribou_state.current );
        for(thread=caribou_state.queue; thread; thread=thread->next)
        {
            caribou_dump_one_thread(thread);
        }
    #endif
}
/*******************************************************************************
*							 THREAD
*******************************************************************************/

/**
 * @brief Allocate and initialize a thread node.
 * @brief parent A pointer to the parent thread node, or NULL.
 * @note THREAD_FAULT_ALLOC_FAILURE is emitted upon allocation failure.
 */
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

/**
 * @brief Dispose of a thread node.
 */
static void delete_thread_node(caribou_thread_t* node)
{
	free(node);
}

/**
 * @brief Append a thread node to the list.
 */
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

/**
 * @brief Append a thread node to the list.
 */
static caribou_thread_t* insert_thread_node(caribou_thread_t* node,caribou_thread_t* after)
{
	int state = caribou_interrupts_disable();
	caribou_thread_t* next = after->next;
	after->next=node;
	node->next=next;
	caribou_interrupts_set(state);
	return node;
}

/**
 * @brief Remove a thread node from the list.
 */
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

/// locate next child
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

/** 
 * @brief Lock the current thread such that it will not yield CPU time until
 * such time that the thread is unlocked by caribou_thread_unlock(). Needless to say
 * this should generally be used sparingly. 
 * @return The current state of the lock.
 */
int caribou_thread_lock(void)
{
	int rc=0;
	int state = caribou_interrupts_disable();
	if ( caribou_state.current )
	{
		rc = caribou_state.current->lock;
		++caribou_state.current->lock;
	}
	caribou_interrupts_set(state);
	return rc;
}

/**
 * @brief Unlock a thread which has been previously been locked with caribou_thread_lock()
 * @return The current state of the lock.
 */
int caribou_thread_unlock(void)
{
	int rc=0;
	int state = caribou_interrupts_disable();
	if ( caribou_state.current )
	{
		if ( caribou_state.current->lock > 0 )
		{
			rc = caribou_state.current->lock;
			--caribou_state.current->lock;
		}
		caribou_interrupts_set(state);
		if ( !caribou_state.current->lock) 
			caribou_thread_yield();
	}
	else
	{
		caribou_interrupts_set(state);
	}
	return rc;
}

/**
 * @brief Determine of the current thread is locked?
 * @return The current state of the lock.
 */
int caribou_thread_locked(caribou_thread_t* thread)
{
	bool rc=0;
	if ( thread )
	{
		int state = caribou_interrupts_disable();
		rc = thread->lock;
		caribou_interrupts_set(state);
	}
	return rc;
}

/**
 * Sleep another thread for a number of clock ticks.
 * @param thread The thread to put to sleep. 
 * @param ticks Number of jiffies to sleep for. A zero (0) value indicates forever or until woken up
 * the caribou_thread_wakeup() function.
 */
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
		caribou_watchdog_feed_self();
	}
}

/**
 * Sleep the current thread for a number of clock ticks.
 * @param thread The thread to put to sleep. A zero (0) value indicates forever or until woken up
 * the caribou_thread_wakeup() function.
 * @param ticks Number of jiffies to sleep for. Forever or until woken up if ticks==0.
 */
void caribou_thread_sleep_current(caribou_tick_t ticks)
{
	caribou_thread_sleep(caribou_thread_current(),ticks);
}

/// Wake a thread previously put to sleep with caribou_thread_sleep().
/// @param thread The thread to wake up.
void caribou_thread_wakeup(caribou_thread_t* thread)
{
	caribou_thread_lock();
	--thread->sleep;				/* wake up the thread */
	caribou_thread_unlock();
}

/// Set a pointer to the thread's name.
const char* caribou_thread_set_name(caribou_thread_t* thread, const char* name)
{
	thread->name = name;
	return thread->name;
}

/// return the thread name pointer
const char* caribou_thread_name(caribou_thread_t* thread)
{
	return thread ? thread->name : "";
}

/// return the thread's runtime in jiffies
uint64_t caribou_thread_runtime(caribou_thread_t* thread)
{
	return thread ? thread->runtime : 0;
}

/// return the thread's stack size in bytes.
uint32_t caribou_thread_stacksize(caribou_thread_t* thread)
{
	return thread ? (uint32_t)thread->stack_top - (uint32_t)(thread->stack_base) : 0;
}

/// return the task's stack usage in bytes.
uint32_t caribou_thread_stackusage(caribou_thread_t* thread)
{
	return ((uint32_t)thread->stack_top - (uint32_t)thread->stack_usage); 
}

/// return the task's state
uint16_t caribou_thread_state(caribou_thread_t* thread)
{
	return thread ? thread->state : NULL;
}

/// return the parent thread
caribou_thread_t* caribou_thread_parent(caribou_thread_t* thread)
{
	return thread ? thread->parent : NULL;
}

/**
 * @brief A wrapper for the hardware "Wait For Interrupt" function chip_wfi().
 */
void caribou_thread_wfi()
{
	chip_wfi();
}

/**
 * @brief The remainder of the scheduled time slots for the current thread are disposed
 * and the next runnable thread in the queue is scheduled.
 */
void caribou_thread_yield(void)
{
	if ( caribou_state.current && !caribou_state.current->lock )
		caribou_preempt();			// preempt the current thread
}

/**
 * @brief Schedules a thread to be terminate upon the next execution of the main thread idle loop.
 * The thread's finish callback is executed, in which case the thread is responsible for releasing
 * any resources it may have allocated. Thread timers will automatically be stopped and disposed.
 * @param thread The thread to be scheduled for termination.
 */
void caribou_thread_terminate(caribou_thread_t* thread)
{
	caribou_timer_t* timer;
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

/**
 * @brief Get here if a thread returns from it's run() function, wait to die.
 */
void thread_finish(void)
{
	caribou_state.current->state |= CARIBOU_THREAD_F_TERMINATED;
	caribou_watchdog_delete(caribou_state.current);
	for (;;)
	{
		// wait to die..
		caribou_thread_yield();
	}
}

/**
 * Create a new instance of a CARIBOU thread.
 * @param name The ascii name of the thread. This pointer must remain valid for the life span
 * of the thread instance.
 * @param run A Pointer to the entry point function of the thread. Note the entry point function must accept
 * a void* pointer even if it is not used.
 * @param finish A function which is called up thread termination.
 * @param arg An argument pointer which is passed to the thread entry point function run.
 * @param stackaddr A pointer to bottom of the program stack associated with this thread.
 * @param stack_size The size of the stack belonging to this thread.
 * @param priority The priority of the thread.
 * @return A pointer to the newly created thread or NULL if something failed.
 */
caribou_thread_t* caribou_thread_create(const char* name, void (*run)(void*), void (*finish)(void*), void * arg, void * stackaddr, int stack_size, int16_t priority )
{
	caribou_thread_t*	node=NULL;
	process_frame_t*	process_frame;

	#if defined(CARIBOU_MPU_ENABLED)
		heap_claim_t	claim;
		int				region;
		int				subregion;
		/* claim a subregion for each thread */
		while(!heap_mpu_claim(&claim)) {}	/* FIXME - maybe we want to fault or something when no more regions? */
		/* allocate the stack from the subregion */
		stackaddr = heap_mpu_claim_malloc(&claim, stack_size);
	#endif
	
	node = new_thread_node(caribou_state.current==NULL?caribou_state.queue:caribou_state.current);
	if ( node != NULL )
	{
		#if defined(CARIBOU_MPU_ENABLED)
			heap_mpu_assign(node,&claim);
		#endif
		if ( stackaddr )
		{
			uint32_t stack_top;
			//initialize the process stack pointer
			//memset(stackaddr,0xFA,stack_size);
			memset(stackaddr,0x00,stack_size);
			process_frame = (hw_stack_frame_t *)(stackaddr + stack_size - sizeof(process_frame_t) );
			memset(process_frame,0,sizeof(process_frame_t));
			process_frame->hw_stack.r0 = (uint32_t)arg;
			process_frame->hw_stack.lr = (uint32_t)thread_finish;
			process_frame->hw_stack.pc = (((uint32_t)run) + INITIAL_PC_OFFSET) & (~1);
			process_frame->hw_stack.psr = DEFAULT_PSR;
			#if defined(ARM_FVP_LAZY_STACKING)
				process_frame->sw_stack.lr = DEFAULT_EXCEPTION_RETURN;
			#endif
			stack_top = (stackaddr + stack_size);
			node->sp = stack_top - sizeof(process_frame_t);
			node->stack_top = stackaddr + stack_size;
			node->stack_low = stackaddr;
			node->stack_low += sizeof(process_frame_t);
			node->stack_base = stackaddr;
		}
		else
		{
			node->sp = (&__process_stack_end__);
			node->stack_top = node->sp;
			node->stack_low = (&__process_stack_base__);
			node->stack_low += sizeof(process_frame_t);
			node->stack_base = (&__process_stack_base__);
		}
		node->state = 0;
		node->name	= name;
		node->arg	= arg;
		node->prio	= priority;
		node->finishfn = finish;
		append_thread_node(node);
       	caribou_watchdog_new(node);

	}
	return node;
}

/// set the thread fault callback handler
void caribou_thread_fault_set(void* (*fn)(int, void*),void* arg)
{
	caribou_state.faultfn = fn;
	caribou_state.faultarg = arg;
	caribou_state.faultflags=0;
}

/**
 * @return a pointer to the root thread, normally the 'caribou' thread.
 */
caribou_thread_t* caribou_thread_root(void)
{
	return caribou_state.queue;
}

/**
 * @return A pointer to the currently running thread structure.
 */
caribou_thread_t* caribou_thread_current(void)
{
	return caribou_state.current;
}

/**
 * @return first thread.
 */
caribou_thread_t* caribou_thread_first(void)
{
	return caribou_state.queue;
}

/// return current thread arg
void* caribou_thread_current_arg(void)
{
	return caribou_state.current->arg;
}

/**
 * @brief Set the priority of the current thread.
 * @param thread A pointer to the target thread.
 * @param prio The priority to assign to the thread in terms of additional
 * scheduling slots assigned to the thread. For instance, 0 means to perform a switch the thread
 * upon the next context switch interrupt, and 1 means to add one additional context cycle to the thread's
 * run-time.
 */
void caribou_thread_set_priority(caribou_thread_t* thread, int16_t prio)
{
	int state = caribou_interrupts_disable();
	thread->prio = prio;
	caribou_interrupts_set(state);
}

/**
 * @return The thread priority of the current thread.
 */
int16_t caribou_thread_priority(caribou_thread_t* thread)
{
	return thread ? thread->prio : 0;
}

/**
 * @brief Initialize the thread system with priority of main thread, this creates the main
 * 'caribou' thread.
 */
caribou_thread_t* caribou_thread_init(int16_t priority)
{
	// initialize main thread
    memset(&caribou_state,0,sizeof(caribou_state_t));
	caribou_state.current = caribou_thread_create( CARIBOU_MAIN_THREAD_NAME, NULL, NULL, NULL, NULL, 0, priority );
	return caribou_state.current;
}

/*******************************************************************************
*							 SCHEDULER
*******************************************************************************/
/**
 * @brief Schedule a thread to run next. The specified thread will be queued
 * to run on the next context switch. If it is desired to schedule the thread to run immediately,
 * then follow the caribou_thread_schedule() call with a call to caribou_thread_yield().
 * @param thread The thread to schedule to run next.
 */
void caribou_thread_schedule(caribou_thread_t* thread)
{
	if ( thread != caribou_state.current )
	{
		int state = caribou_interrupts_disable();
		caribou_thread_t* next = caribou_state.current->next;
		if ( !caribou_state.current->lock && thread != next )
		{
			caribou_state.priority=0; /* terminate current thread shortly */
			remove_thread_node(thread);
			insert_thread_node(thread,caribou_state.current);
			#if 0
				/* FIXME pend systick */
				SCB->ICSR |= SCB_ICSR_PENDSTSET_Msk;
			#endif
		}
		caribou_interrupts_set(state);
	}
}

/**
 * @brief  Main thread idle time processing. This weakly liked function gets called
 * during main (caribou) thread idle time. There is no guaranteed schedule, however,
 * under normal circumstances, the main_idle() function should be called with a period of one millisecond.
 * Normally the function over-ride resides in main.c/pp and must utilize "C" linkage.
 */
__attribute__((weak)) void main_idle()
{
}

/**
 * @brief  Main thread idle time processing. This weakly liked function gets called
 * during main (caribou) thread idle time. There is no guaranteed schedule, however,
 * under normal circumstances, the board_idle() function should be called with a period of one millisecond.
 * Normally the function over-ride resides in board.c/pp and must utilize "C" linkage.
 */
__attribute__((weak)) void board_idle()
{
}

static void check_sp(caribou_thread_t* thread)
{
	#if CARIBOU_LOW_STACK_TRAP
	if ( thread->sp <= thread->stack_low || thread->sp > thread->stack_top )
	{
		if ( thread->sp <= thread->stack_low )
		{
			_caribou_thread_fault_emit(THREAD_FAULT_STACK_LOW);
		}
		else if ( thread->sp <= thread->stack_base )
		{
			_caribou_thread_fault_emit(THREAD_FAULT_STACK_OVERFLOW);
		}
		else if ( thread->sp > thread->stack_top )
		{
			_caribou_thread_fault_emit(THREAD_FAULT_STACK_UNDERFLOW);
		}
	} 
	#endif
	if ( thread->sp < thread->stack_usage || !thread->stack_usage ) 
	{
		thread->stack_usage = thread->sp;
	}
}

void caribou_thread_once()
{
	caribou_thread_t* thread=caribou_state.queue;
	caribou_thread_t* next;

	// idle hooks...
	board_idle();
	// idle the timers...
    caribou_timer_idle(caribou_state.queue);
	// terminate threads flagged for termination...
	for(thread=caribou_state.queue; thread!=NULL; thread=next)
	{
		next = thread->next; /* capture the next in case we terminate this thread */
		check_sp(thread);
		if ( thread->state & CARIBOU_THREAD_F_TERMINATED && thread != caribou_state.current )
		{
			caribou_thread_terminate(thread);
		}
	}
}

/**
 * @brief Enter into the main thread execution loop. This function does not return.
 * This function should be called once all other threads are created and started.
 * This function has two callbacks board_idle() and main_idle().
 */
void caribou_thread_exec()
{
	for(;;)
	{
		caribou_thread_once();
		caribou_thread_yield();
	}
}

/**
 * @brief Performs the thread scheduling function.
 * Currently a round-robin search for the next runnable.
 */
static inline void _swap_thread()																
{											
	/* Preserve the current thread's errno... */												
	caribou_state.current->errno = errno;        	
	if ( preemptable( caribou_state.current ) && --caribou_state.priority < 0 )				
	{																						
		while( !runnable((caribou_state.current=nextinqueue(caribou_state.current))) )		
		{																					
			caribou_state.current->state &= ~CARIBOU_THREAD_F_YIELD;						
		}																					
		caribou_state.priority = caribou_state.current->prio;				
		/* Restore the current thread's errno... */
		errno = caribou_state.current->errno;    	
	}																						
}

#if defined(CARIBOU_MPU_ENABLED)
	/**
	 * @brief Enable MPU region access for the specified thread.
	 */
	void caribou_thread_mpu_enable(caribou_thread_t* thread)
	{
		register uint32_t RNR = MPU->RNR;
		register uint32_t subregion_bit = ((1<<(thread->mpu_subregion))<<MPU_RASR_SRD_Pos);
        /* select the region for the thread */
		MPU->RNR = thread->mpu_region+1;
        /* Disabling access to the subregion */
		MPU->RASR &= ~subregion_bit;	
		/* Resore the previous region */
		MPU->RNR = RNR;
		/* Data Barrier */
		__DSB();
	}

	/**
	 * @brief Disable MPU protection for the specified thread.
	 */
	void caribou_thread_mpu_disable(caribou_thread_t* thread)
	{
		register uint32_t RNR = MPU->RNR;
		register uint32_t subregion_bit = ((1<<(thread->mpu_subregion))<<MPU_RASR_SRD_Pos);
        /* select the region for the thread */
		MPU->RNR = thread->mpu_region+1;
        /* Enabling access to the subregion */
		MPU->RASR |= subregion_bit;	
		/* Resore the previous region */
		MPU->RNR = RNR;
		/* Data Barrier */
		__DSB();
	}
#endif

/**
 * @brief In the case where the current thread is preempted by caribou_thread_yield(),
 * then there is no jiffies counting, otherwise it's the same as the normal scheduler
 * interrupt. If CARIBOU_LOW_STACK_TRAP is defined, stack overflow trapping is performed.
 */
void __attribute__((naked)) _pendsv(void)
{
	pendsv_enter();
	if ( caribou_state.current )
	{
		caribou_state.current->sp = rd_thread_stack_ptr();
		check_sp(caribou_state.current);
		caribou_state.current->state |= CARIBOU_THREAD_F_YIELD;
		/* give up remainder of time slots */
		caribou_state.priority=-1;
		#if defined(CARIBOU_MPU_ENABLED)
			caribou_thread_mpu_enable(caribou_state.current);	/* Enable MPU protection (read-only) */
		#endif
		_swap_thread();
		#if defined(CARIBOU_MPU_ENABLED)
			caribou_thread_mpu_disable(caribou_state.current);	/* Disable MPU protection (read-write) */
		#endif
		wr_thread_stack_ptr( caribou_state.current->sp );
	}
	pendsv_exit();
}

/**
 * @brief Entry point for handing a scheduler timer interrupt. Determines
 * which thread is the next runnable on the queue, and switches context.
 * The jiffies counter is incremented and a jiffy is added to the current
 * thread's total run time. If CARIBOU_LOW_STACK_TRAP is defined, stack 
 * overflow trapping is performed.
 */
void __attribute__((naked)) _systick(void)
{
	systick_enter();
	if ( caribou_state.current )
	{
		caribou_state.current->sp = rd_thread_stack_ptr();
		check_sp(caribou_state.current);
		++caribou_state.jiffies;
		++caribou_state.current->runtime;
		#if defined(CARIBOU_MPU_ENABLED)
			caribou_thread_mpu_enable(caribou_state.current);	/* Enable MPU protection (read-only) */
		#endif
		_swap_thread();
		#if defined(CARIBOU_MPU_ENABLED)
			caribou_thread_mpu_disable(caribou_state.current);	/* Disable MPU protection (read-write) */
		#endif
		wr_thread_stack_ptr( caribou_state.current->sp );
		systick_exit();
	}
	else
	{
		++caribou_state.jiffies;
		systick_exit();
	}
}

