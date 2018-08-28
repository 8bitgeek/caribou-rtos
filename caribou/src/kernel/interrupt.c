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
#include <caribou/kernel/interrupt.h>
#include <caribou/lib/heap.h>
#include <caribou/lib/string.h>

typedef struct caribou_interrupt_handler_s
{
	caribou_isr_t		isr;		/* a pointer to the isr */
	void*				arg;		/* the arg to pass to the isr */
	struct caribou_interrupt_handler_s* next;
} caribou_interrupt_handler_t;

caribou_interrupt_handler_t**	isr_map = NULL;
int								isr_map_size = 0;

/** extend the size of the isr map table */
static int isr_map_extend(int size)
{
	if ( size > isr_map_size )
	{
		int new_size_in_bytes = size*sizeof(caribou_interrupt_handler_t*);
		caribou_interrupt_handler_t** new_isr_map = (caribou_interrupt_handler_t**)malloc(new_size_in_bytes);
		if ( new_isr_map )
		{
			caribou_interrupt_handler_t** old_isr_map = isr_map;

			memset(new_isr_map,0,new_size_in_bytes);

			int state = caribou_interrupts_disable();	/* Interrupts Disabled */
			if ( isr_map )
			{
				memcpy(new_isr_map,isr_map,isr_map_size*sizeof(caribou_interrupt_handler_t**));
			}
			isr_map = new_isr_map;
			isr_map_size = size;
			caribou_interrupts_set(state);				/* Interrupts Enabled */
				
			if ( old_isr_map )
			{
   				free(old_isr_map);
			}
		}
	}
	return isr_map_size;
}

/**
 * @brief Determine if a vector is already installed.
 * @param vector The device specific interrupt vector number.
 * @param isr A pointer to the interrupt service routing for the vector.
 * @param arg An optional argument to pass to the interrupt handler.
 * @return non-zero if vector is installed.
 */
int caribou_vector_installed(InterruptVector vector,caribou_isr_t isr,void* arg)
{
	int rc =0;
	int state = caribou_interrupts_disable();
	if ( vector < (InterruptVector)isr_map_size )
	{
		caribou_interrupt_handler_t* node = isr_map[(unsigned char)vector];
		while ( node )
		{
			if ( node->isr == isr && node->arg == arg )
			{
				rc = 1;
				break;
			}
			node=node->next;
		}
	}
	caribou_interrupts_set(state);
	return rc;
}

/**
 * @brief Install the vector into the isr_map chain.
 * @param vector The device specific interrupt vector number.
 * @param isr A pointer to the interrupt service routing for the vector.
 * @param arg An optional argument to pass to the interrupt handler.
 * @return The vector number or < 0 on failure.
 */
int caribou_vector_install(InterruptVector vector,caribou_isr_t isr,void* arg)
{
	if ( !caribou_vector_installed(vector,isr,arg) )
	{
		if ( isr_map_extend( (int)vector+1 ) )
		{
			caribou_interrupt_handler_t* node = (caribou_interrupt_handler_t*)malloc(sizeof(caribou_interrupt_handler_t));
			if ( node )
			{
				memset(node,0,sizeof(caribou_interrupt_handler_t));
				node->isr = isr;
				node->arg = arg;
				if ( isr_map[(unsigned char)vector] == NULL )
				{
					isr_map[(unsigned char)vector] = node;
				}
				else
				{
					caribou_interrupt_handler_t* next = isr_map[(unsigned char)vector];
					while( next->next ) next = next->next;
					next->next = node;
				}
			}
		}
		return (unsigned char)vector;
	}
	return -1;
}

/**
 * @brief Install the vector into the isr_map chain.
 * @param vector The device specific interrupt vector number.
 * @param isr A pointer to the interrupt service routing for the vector.
 * @return The vector number or < 0 on failure.
 */
int caribou_vector_remove(InterruptVector vector,caribou_isr_t isr)
{
	int state = caribou_interrupts_disable();
	caribou_interrupt_handler_t* prev=NULL;
	caribou_interrupt_handler_t* next=NULL;
	for( next = isr_map[(unsigned char)vector]; next != NULL; next = next->next)
	{
		if ( next->isr == isr )
		{
			if ( prev )
				prev->next = next->next;
			else
				isr_map[(unsigned char)vector]=NULL;
			break;
		}
		prev = next;
	}
	caribou_interrupts_set(state);
	if ( next )
		free(next);
	return (unsigned char)vector;
}

/**
 * @brief Remove all vectors associated with arg.
 * @param vector The device specific interrupt vector number.
 * @param arg A pointer to the arg
 * @return The vector number or < 0 on failure.
 */
int caribou_vector_remove_all(void* arg)
{
	for(int vector=0; vector < isr_map_size; vector++)
	{
		caribou_interrupt_handler_t* next = isr_map[(unsigned char)vector];
		caribou_interrupt_handler_t* prev = next;
		while( next ) 
		{
			if ( next->arg == arg )						// this is the one?
			{
				if ( next == isr_map[(unsigned char)vector] )		// root?
				{
					isr_map[(unsigned char)vector] = next->next ? next->next : NULL;
				}
				else
				{
					prev->next = next->next;			// remove from the list.
				} 
				free(next);								// release the memory
				next = prev->next;						// continue.
			}
			prev = next;
			next = next->next;
		}
	}
	return 1;
}

/** 
 * @brief Interrupt service entry point from hardware vector 
 * @param vector The hardware vector number
 */
caribou_interrupt_handler_t* node_debug=NULL;
caribou_interrupt_handler_t* node_next=NULL;

__attribute__((weak)) void caribou_interrupt_service(InterruptVector vector)
{
	#ifdef CARIBOU_TEST_VECTOR_BOUNDS
		if ( vector < (InterruptVector)isr_map_size )
		{
	#endif
        caribou_interrupt_handler_t* node = isr_map[(unsigned char)vector];
        while( node )
        { 
            if ( node->isr )
				node->isr(vector,node->arg);
			node_debug = node;
            node=node->next;
        }
	#ifdef CARIBOU_TEST_VECTOR_BOUNDS
		}
		else
		{
			for(volatile int x=0;true;x++);
		}
	#endif
}

