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
#include <caribou/kernel/interrupt.h>
#include <caribou/kernel/swi.h>

/**
 * @brief Determine if a vector is already installed.
 * @param vector The device specific interrupt vector number.
 * @param isr A pointer to the interrupt service routing for the vector.
 * @param arg An optional argument to pass to the interrupt handler.
 * @return non-zero if vector is installed.
 */
int caribou_vector_installed(InterruptVector vector,caribou_isr_t isr,void* arg)
{
	kcall_vector_t rc;
	memset(&rc,0,sizeof(kcall_vector_t));
	rc.vector = vector;
	rc.isr = isr;
	rc.arg = arg;
    kcall(KCALL_VECTOR_INSTALLED,&rc);
	return rc.rc;
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
	kcall_vector_t rc;
	memset(&rc,0,sizeof(kcall_vector_t));
	rc.vector = vector;
	rc.isr = isr;
	rc.arg = arg;
    kcall(KCALL_VECTOR_INSTALL,&rc);
	return rc.rc;
}

/**
 * @brief Install the vector into the isr_map chain.
 * @param vector The device specific interrupt vector number.
 * @param isr A pointer to the interrupt service routing for the vector.
 * @return The vector number or < 0 on failure.
 */
int caribou_vector_remove(InterruptVector vector,caribou_isr_t isr)
{
	kcall_vector_t rc;
	memset(&rc,0,sizeof(kcall_vector_t));
	rc.vector = vector;
	rc.isr = isr;
    kcall(KCALL_VECTOR_REMOVE,&rc);
	return rc.rc;
}

/**
 * @brief Remove all vectors associated with arg.
 * @param vector The device specific interrupt vector number.
 * @param arg A pointer to the arg
 * @return The vector number or < 0 on failure.
 */
int caribou_vector_remove_all(void* arg)
{
	kcall_vector_t rc;
	memset(&rc,0,sizeof(kcall_vector_t));
	rc.arg = arg;
    kcall(KCALL_VECTOR_REMOVE_ALL,&rc);
	return rc.rc;
}

int	caribou_vector_enabled(InterruptVector vector)		
{
	#if 1
		return chip_vector_enabled(vector);
	#else
		kcall_vector_t rc;
		memset(&rc,0,sizeof(kcall_vector_t));
		rc.vector = vector;
		kcall(KCALL_VECTOR_ENABLED,&rc);
		return rc.rc;
	#endif
}

int	caribou_vector_enable(InterruptVector vector)		
{
	#if 1
		return chip_vector_enable(vector);
	#else
		kcall_vector_t rc;
		memset(&rc,0,sizeof(kcall_vector_t));
		rc.vector = vector;
		kcall(KCALL_VECTOR_ENABLE,&rc);
		return rc.rc;
	#endif
}

int	caribou_vector_disable(InterruptVector vector)
{
	#if 1
		return chip_vector_disable(vector);
	#else
		kcall_vector_t rc;
		memset(&rc,0,sizeof(kcall_vector_t));
		rc.vector = vector;
		kcall(KCALL_VECTOR_DISABLE,&rc);
		return rc.rc;
	#endif
}

int	caribou_vector_set(InterruptVector vector,int state)	
{
	#if 1
		return chip_vector_set(vector,state);
	#else
		kcall_vector_t rc;
		memset(&rc,0,sizeof(kcall_vector_t));
		rc.vector = vector;
		rc.state = state;
		kcall(KCALL_VECTOR_SET,&rc);
		return rc.rc;
	#endif
}

