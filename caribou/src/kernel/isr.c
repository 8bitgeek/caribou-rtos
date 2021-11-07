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
#include <caribou/kernel/sched.h>
#include <caribou/kernel/stack.h>
#include <chip/chip.h>
#include <cpu/cpu.h>

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

#pragma GCC push_options
#pragma GCC optimize ("Os")

/*******************************************************************************
 * @brief In the case where the current thread is preempted by 
 * caribou_thread_yield(), then there is no jiffies counting, otherwise it's 
 * the same as the normal scheduler interrupt. If CARIBOU_LOW_STACK_TRAP is 
 * defined, stack overflow trapping is performed.
 *******************************************************************************/
void __attribute__((naked)) caribou_pendsv(void)
{
	pendsv_enter();
	caribou_thread_schedule();
	pendsv_exit();
}

/*******************************************************************************
 * @brief Entry point for handing a scheduler timer interrupt. Determines
 * which thread is the next runnable on the queue, and switches context.
 * The jiffies counter is incremented and a jiffy is added to the current
 * thread's total run time. If CARIBOU_LOW_STACK_TRAP is defined, stack 
 * overflow trapping is performed.
 *******************************************************************************/
void __attribute__((naked)) caribou_systick(void)
{
	systick_enter();
	++caribou_state.jiffies;
	++caribou_state.current->runtime;
	caribou_thread_schedule();
	systick_exit();
}

#pragma GCC pop_options
