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
#include <caribou/lib/spinlock.h>

#define CARIBOU_SPINLOCK_UNLOCKED	0x0000000
#define CARIBOU_SPINLOCK_LOCKED		0x0000001

/*******************************************************************************
*							 SPINLOCK
*******************************************************************************/
/// initialize a spinlock struct
void caribou_spinlock_init(caribou_spinlock_t* spinlock)
{
	*spinlock = CARIBOU_SPINLOCK_UNLOCKED;
}

/// try to acquire lock - blocking
bool caribou_spinlock_lock(caribou_spinlock_t* spinlock)
{
	while ( !caribou_spinlock_trylock(spinlock) );
	return true;
}

/// try to acquire a lock - non-blocking, return true of lock was acquired.
bool caribou_spinlock_trylock(caribou_spinlock_t* spinlock)
{
	bool rc;
	int state = chip_interrupts_disable();
	rc = (*spinlock==CARIBOU_SPINLOCK_UNLOCKED);
	if ( rc )
	{
		*spinlock = CARIBOU_SPINLOCK_LOCKED;
	}
	chip_interrupts_set(state);
	return rc;
}

/// unlock a spinlock
void caribou_spinlock_unlock(caribou_spinlock_t* spinlock)
{
	*spinlock = CARIBOU_SPINLOCK_UNLOCKED;
}
