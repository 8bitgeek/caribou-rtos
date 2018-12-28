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
#include <chip/chip.h>

/** ***************************************************************************
 ** @return The Caribou Version. 
 ******************************************************************************/
extern const char* caribou_version()
{
	return CARIBOU_VERSION;
}

extern void _halt();

/** ***************************************************************************
 ** @brief Test the state of the CARIBOU scheduler lock.
 ** @return The number of lock state
 *****************************************************************************/
extern int caribou_lock_state()
{
	return chip_systick_irq_state();
}

/** ***************************************************************************
 ** @brief Lock the CARIBOU scheduler onto current thread. 
 ******************************************************************************/
extern int caribou_lock()
{
	return chip_systick_irq_disable();
}

/** ***************************************************************************
 ** @brief Unlock the CARIBOU scheduler. 
 ******************************************************************************/
extern int caribou_unlock()
{
	return chip_systick_irq_enable();
}

/** ***************************************************************************
 ** @brief Set the CARIBOU scheduler lock state. 
 ******************************************************************************/
extern void caribou_lock_set(int state)
{
	chip_systick_irq_set(state);
}

#if 0
/** ***************************************************************************
 ** @brief Force scheduler to perform a context switch.
 ******************************************************************************/
extern void caribou_preempt()
{
	chip_systick_irq_force();
}
#endif

/** ***************************************************************************
 ** @brief Abort on a hard fault.
 ******************************************************************************/
__attribute__((weak)) void abort(void)
{
    #if defined(CARIBOU_THREAD_DUMP)
		#if defined(CARIBOU_DEBUG_PRINTF)
			debug_printf("**** ABORT ****\n");
			caribou_thread_dump();
		#endif
    #endif
	_halt();
}

/**
 * @brief The CARIBOU main thread loop. caribou_exec() does not return.
 * @note If it is desired to run some application code from the main thread,
 * then it is recommended that the application code implement the
 * main_idle() function which is callback from the main thread idle loop,
 * and will be called after each cycle of CARIBOU house keeping.
 */
void caribou_exec(void)
 {
	caribou_thread_exec(); /// never to return.
 }

/**
 * @brief Initialize the clock such that jiffies start ticking.
 */
void caribou_init_clock()
{
	static bool clock_started=false;
	if ( !clock_started )
	{
		chip_init(caribou_timer_period());
		clock_started=true;
	}
}

void caribou_private_init(void)
{
	memset(&caribou_state,0,sizeof(caribou_state_t));
}

/**
 * @brief Initialize the CARIBOU main thread. 
 * @param priority The priority to assign to the main thread.
 * @note Interrupts are disabled for the duration of this function.
 * @note caribou_init() must be called before any other CARIBOU threads
 * are created.
 */
void caribou_init(int8_t priority)
{
	chip_interrupts_disable();
	caribou_init_clock();
	caribou_thread_init(priority);
	#if defined(CARIBOU_MPU_ENABLED)
		heap_mpu_enable();
	#endif
	chip_interrupts_enable();
}
