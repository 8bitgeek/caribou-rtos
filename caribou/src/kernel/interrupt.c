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
#if defined(_CARIBOU_INTERRUPT_CHAINING_)
	#include "interrupt_chaining.c"
#else

#include <caribou/kernel/interrupt.h>
#include <caribou/lib/heap.h>
#include <caribou/lib/string.h>

#if !defined(_CARIBOU_VECTORS_MAX_)
	#define _CARIBOU_VECTORS_MAX_ SYS_IRQ
#endif

typedef struct caribou_interrupt_handler_s
{
	caribou_isr_t		isr;		/**< a pointer to the isr */
	void*					arg;		/**< the arg to pass to the isr */
} caribou_interrupt_handler_t;

caribou_interrupt_handler_t isr_map[_CARIBOU_VECTORS_MAX_];

/** ***************************************************************************
 * @brief Determine if a vector is already installed.
 * @param vector The device specific interrupt vector number.
 * @param isr A pointer to the interrupt service routing for the vector.
 * @param arg An optional argument to pass to the interrupt handler.
 * @return non-zero if vector is installed.
 ******************************************************************************/
int caribou_vector_installed(InterruptVector vector,caribou_isr_t isr,void* arg)
{
	int rc = 0;
	int state = caribou_interrupts_disable();
	if ( vector < (InterruptVector)_CARIBOU_VECTORS_MAX_ )
	{
		caribou_interrupt_handler_t* node = &isr_map[(unsigned char)vector];
		if ( node->isr == isr && node->arg == arg )
		{
			rc = 1;
		}
	}
	caribou_interrupts_set(state);
	return rc;
}

/** ***************************************************************************
 * @brief Install the vector into the isr_map chain.
 * @param vector The device specific interrupt vector number.
 * @param isr A pointer to the interrupt service routing for the vector.
 * @param arg An optional argument to pass to the interrupt handler.
 * @return The vector number or < 0 on failure.
 ******************************************************************************/
int caribou_vector_install(InterruptVector vector,caribou_isr_t isr,void* arg)
{
	if ( !caribou_vector_installed(vector,isr,arg) )
	{
		caribou_interrupt_handler_t* node = &isr_map[(unsigned char)vector];
		node->isr = isr;
		node->arg = arg;
		return (unsigned char)vector;
	}
	return -1;
}

/** ***************************************************************************
 * @brief Install the vector into the isr_map chain.
 * @param vector The device specific interrupt vector number.
 * @param isr A pointer to the interrupt service routing for the vector.
 * @return The vector number or < 0 on failure.
 ******************************************************************************/
int caribou_vector_remove(InterruptVector vector,caribou_isr_t isr)
{
	int state = caribou_interrupts_disable();
	caribou_interrupt_handler_t* node = &isr_map[(unsigned char)vector];
	node->isr = NULL;
	node->arg = NULL;
	caribou_interrupts_set(state);
	return (unsigned char)vector;
}

/** ***************************************************************************
 * @brief Remove all vectors associated with arg.
 * @param vector The device specific interrupt vector number.
 * @param arg A pointer to the arg
 * @return The vector number or < 0 on failure.
 ******************************************************************************/
int caribou_vector_remove_all(void* arg)
{
	int state = caribou_interrupts_disable();
	for(int vector=0; vector < _CARIBOU_VECTORS_MAX_; vector++)
	{
		caribou_interrupt_handler_t* node = &isr_map[(unsigned char)vector];
		if ( node->arg == arg )						// this is the one?
		{
			node->isr = NULL;
			node->arg = NULL;
			caribou_interrupts_set(state);
			return vector;
		}
	}
	caribou_interrupts_set(state);
	return -1;
}

/** ***************************************************************************
 * @brief Interrupt service entry point from hardware vector 
 * @param vector The hardware vector number
 ******************************************************************************/
__attribute__((weak)) void caribou_interrupt_service(InterruptVector vector)
{
	caribou_interrupt_handler_t* node = &isr_map[(unsigned char)vector];
	if ( node && node->isr )
		node->isr(vector,node->arg);
}

#endif 
