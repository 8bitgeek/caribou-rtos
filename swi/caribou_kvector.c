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
#include <caribou/kernel/swi.h>
#include <caribou/kernel/kvector.h>
#include <caribou/kernel/interrupt.h>
#include <caribou/lib/bitmap_heap.h>

typedef struct caribou_vector_isr_s
{
	caribou_isr_t		isr;		/* a pointer to the isr */
	void*				arg;		/* the arg to pass to the isr */
	struct caribou_interrupt_handler_s* next;
} caribou_vector_isr_t;

static caribou_vector_isr_t**			isr_map = NULL;
static int								isr_map_size = 0;

/** extend the size of the isr map table */
static int isr_map_extend(int size)
{
	if ( size > isr_map_size )
	{
		isr_map = (caribou_vector_isr_t**)bitmap_heap_realloc(isr_map,size*sizeof(caribou_vector_isr_t*));
		if ( isr_map )
		{
			// NULL out the new entries...
			for(int n=isr_map_size; n < size; n++)
			{
				isr_map[n] = NULL; 
			}
			isr_map_size = size;
		}
	}
	return isr_map_size;
}

extern int kvector_install(void* arg)
{
	kcall_vector_t* rc = (kcall_vector_t*)arg;
	if ( !kvector_installed(arg) )
	{
		//int state = caribou_interrupts_disable();
		if ( isr_map_extend((char)rc->vector+1) > (char)rc->vector )
		{
			caribou_vector_isr_t* node = (caribou_vector_isr_t*)bitmap_heap_malloc(sizeof(caribou_vector_isr_t));
			if ( node )
			{
				memset(node,0,sizeof(caribou_vector_isr_t));
				node->isr =	rc->isr;
				node->arg = rc->arg;
				if ( isr_map[(char)rc->vector] == NULL )
				{
					isr_map[(char)rc->vector] = node;
				}
				else
				{
					caribou_vector_isr_t* next = isr_map[(char)rc->vector];
					while( next->next )
						next = next->next;
					next->next = node;
				}
			}
		}
		//caribou_interrupts_set(state);
		rc->rc = 0;
	}
	rc->rc = -1;
	return 0;
}

extern int kvector_remove(void* arg)
{
	kcall_vector_t* rc = (kcall_vector_t*)arg;
	caribou_vector_isr_t* next = isr_map[(char)rc->vector];
	caribou_vector_isr_t* prev = next;
	//int state = caribou_interrupts_disable();
	while( next ) 
	{
		if ( next->isr == rc->isr )						// this is the one?
		{
			if ( next == isr_map[rc->vector] )			// root?
			{
				isr_map[rc->vector] = next->next ? next->next : NULL;
			}
			else
			{
				prev->next = next->next;				// remove from the list.
			} 
			bitmap_heap_free(next);						// release the memory
			next = prev->next;							// continue.
		}
		prev = next;
		next = next->next;
	}
	//caribou_interrupts_set(state);
	rc->rc = 0;
	return 0;
}

extern int kvector_remove_all(void* arg)
{
	kcall_vector_t* rc = (kcall_vector_t*)arg;
	for(int vector=0; vector < isr_map_size; vector++)
	{
		caribou_vector_isr_t* next = isr_map[(char)rc->vector];
		caribou_vector_isr_t* prev = next;
		while( next ) 
		{
			//int state = caribou_interrupts_disable();
			if ( next->arg == rc->arg )						// this is the one?
			{
				if ( next == isr_map[rc->vector] )			// root?
				{
					isr_map[vector] = next->next ? next->next : NULL;
				}
				else
				{
					prev->next = next->next;				// remove from the list.
				} 
				bitmap_heap_free(next);						// release the memory
				next = prev->next;							// continue.
			}
			prev = next;
			next = next->next;
			//caribou_interrupts_set(state);
		}
	}
	rc->rc = 0;
	return 0;
}

extern int kvector_installed(void* arg)
{
	kcall_vector_t* rc = (kcall_vector_t*)arg;
	rc->rc=0;
	//int state = caribou_interrupts_disable();
	if ( rc->vector < (InterruptVector)isr_map_size )
	{
		caribou_vector_isr_t* node = isr_map[rc->vector];
		while ( node )
		{
			if ( node->isr == rc->isr && node->arg == rc->arg )
			{
				rc->rc = 1;
				break;
			}
			node=node->next;
		}
	}
	//caribou_interrupts_set(state);
	return 0;
}

extern int kvector_enable(void* arg)
{
	kcall_vector_t* rc = (kcall_vector_t*)arg;	
	rc->rc = chip_vector_enable(rc->vector);
	return 0;
}

extern int kvector_disable(void* arg)
{
	kcall_vector_t* rc = (kcall_vector_t*)arg;	
	rc->rc = chip_vector_disable(rc->vector);
	return 0;
}

extern int kvector_enabled(void* arg)
{
	kcall_vector_t* rc = (kcall_vector_t*)arg;	
	rc->rc = chip_vector_enabled(rc->vector);
	return 0;
}

extern int kvector_set(void* arg)
{
	kcall_vector_t* rc = (kcall_vector_t*)arg;	
	rc->rc = chip_vector_set(rc->vector,rc->state);
	return 0;
}

/** 
 * @brief Interrupt service entry point from hardware vector 
 * @param vector The hardware vector number
 */
__attribute__((weak)) void kvector_isr(InterruptVector vector)
{
	#ifdef CARIBOU_TEST_VECTOR_BOUNDS
		if ( vector < (InterruptVector)isr_map_size )
		{
	#endif
        caribou_vector_isr_t* node = isr_map[(char)vector];
        while( node )
        { 
            if ( node->isr )
				node->isr(vector,node->arg);
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
