/*
   _________    ____  ________  ____  __  __   ____  __________  _____
  / ____/   |  / __ \/  _/ __ )/ __ \/ / / /  / __ \/_  __/ __ \/ ___/
 / /   / /| | / /_/ // // __  / / / / / / /  / /_/ / / / / / / /\__ \ 
/ /___/ ___ |/ _, _// // /_/ / /_/ / /_/ /  / _, _/ / / / /_/ /___/ / 
\____/_/  |_/_/ |_/___/_____/\____/\____/  /_/ |_| /_/  \____//____/  
                                                                      

Copyright © 2005-2013 by Pike Aerospace Research Corporation
Copyright © 2014-2015 by Mike Sharkey
Copyleft © 2021 by Mike Sharkey 
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
#include <caribou/kernel/sched.h>
#include <caribou/kernel/thread.h>
#include <caribou/kernel/stack.h>

/*******************************************************************************
*							 SCHEDULER
*******************************************************************************/

static void _swap_thread	( void );	
static void _swapto			( caribou_thread_t* thread );

/*******************************************************************************
 * @brief determine if the thread is in a runnable state 
 *******************************************************************************/
#define runnable(thread) 	((thread->state & CARIBOU_THREAD_F_TERMINATED) == 0) 

/*******************************************************************************
 * @brief find the next thread in the queue 
 *******************************************************************************/
#define nextinqueue(thread) ( thread->next ? thread->next : caribou_state.queue )

#pragma GCC push_options
#pragma GCC optimize ("Os")

/*******************************************************************************
 * @brief Get here if a thread returns from it's run() function, wait to die.
 *******************************************************************************/
void _swapto( register caribou_thread_t* thread )
{
	caribou_state.current  = thread;	
	caribou_state.priority = thread->prio;
	errno                  = thread->errno;
}

/*******************************************************************************
 * @brief Performs the thread scheduling function.
 *        Currently a round-robin search for the next runnable.
 *******************************************************************************/
static void _swap_thread( void )					
{													
	caribou_thread_t* thread=caribou_state.current;		
	if ( !caribou_thread_locked(thread) )
	{
		thread->errno = errno;
		if ( --caribou_state.priority < 0 )
		{
			while( !runnable((thread=nextinqueue(thread))) );
			_swapto(thread);
		}
	}
}

/*******************************************************************************
 * @brief Thread scheduler public entry point. Should only be called from 
 *        scheduler interrupt context. 
 *******************************************************************************/
extern void caribou_thread_schedule( void )
{
	if ( !caribou_state.lock )
	{
		caribou_state.current->sp = (void*)rd_thread_stack_ptr();
		caribou_check_sp( caribou_state.current );
		_swap_thread();
		wr_thread_stack_ptr( caribou_state.current->sp );
	}
}

#pragma GCC pop_options
