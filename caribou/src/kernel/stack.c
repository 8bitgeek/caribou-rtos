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

/*******************************************************************************
*							      STACK
*******************************************************************************/

#if CARIBOU_LOW_STACK_TRAP

extern void caribou_check_sp(caribou_thread_t* thread)
{
	
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

	if ( thread->sp < thread->stack_usage || !thread->stack_usage ) 
	{
		thread->stack_usage = thread->sp;
	}

}

#endif
