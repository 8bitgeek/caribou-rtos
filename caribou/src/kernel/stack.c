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

extern uint16_t caribou_check_sp(caribou_thread_t* thread)
{
	cpu_reg_t pattern=0xFAFAFAFA;
	cpu_reg_t* stack_bottom_p = (uint32_t*)thread->stack_base;
	cpu_reg_t fault=0;

	/* test for stack overflow condition */
	if ( (thread->sp < thread->stack_base) || (pattern != *stack_bottom_p) )
	{
		fault |= THREAD_FAULT_STACK_OVERFLOW;
	}
	
	/* TODO: test for 'THREAD_FAULT_STACK_OVERFLOW' and 'THREAD_FAULT_STACK_LOW' conditions */
	
	if ( fault )
	{
		_caribou_thread_fault_emit(THREAD_FAULT_STACK_OVERFLOW);
	}

	return fault;
}

extern cpu_reg_t caribou_min_free( caribou_thread_t* thread )
{
	cpu_reg_t pattern=0xFAFAFAFA;
	cpu_reg_t* stack_bottom_p = (uint32_t*)thread->stack_base;
	cpu_reg_t unused_bytes=0;

	while ( pattern == *stack_bottom_p++ )
	{
		unused_bytes += 4;
	}

	return unused_bytes;
}
