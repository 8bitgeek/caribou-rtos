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
#include <caribou/kernel/timer.h>
#include <caribou/lib/mutex.h>
#include <caribou/lib/errno.h>
#include <caribou/lib/heap.h>
#include <caribou/lib/string.h>

/*******************************************************************************
*							 MUTEX
*******************************************************************************/

/**
 * @brief Allocates and initialize a new instance of a caribou_mutex_t on the heap.
 * @param flags Mutex flags to apply initially o the mutex.
 * @return Pointer to newly allocated mutex or NULL.
 * note If NULL is returned, then errno is set.
 */
extern caribou_mutex_t*	caribou_mutex_new(uint8_t flags)
{
	caribou_mutex_t* mutex = (caribou_mutex_t*)malloc(sizeof(caribou_mutex_t));
	if ( mutex )
	{
		caribou_mutex_init(mutex,flags);
		errno = 0;
	}
	else
	{
		errno = ENOMEM;
	}
	return mutex;
}

/**
 * @brief Free a mutex that has been previously allocated on the heap by caribou_mutex_new(). 
 * @param mutex A pointer to the caribou_mutex_t instance to de-allocate from the heap.
 */
extern void caribou_mutex_free(caribou_mutex_t* mutex)
{
	if(mutex)
	{
		free(mutex);
	}
}

/**
 * @brief Instances of caribou_mutex_t must be initialized. This is a convenience function 
 * to perform the proper initialization of a caribou_mutex_t structure. It is only recommended
 * to use the CARIBOU initialization functions rather than accessing the structure members directly.
 * @param mutex A pointer to the caribou_mutex_t instance to initialize.
 * @param flags Initial mutex flags to apply.
 */
void caribou_mutex_init(caribou_mutex_t* mutex,uint8_t flags)
{
	memset(mutex,0,sizeof(caribou_mutex_t));
	mutex->flags = flags;
}

/**
 * Try to acquire lock. If the mutex is currently held, the calling thread
 * will block unless the current thread is the holder of the current lock. If the current already holds the lock,
 * then a new lock will be granted.
 * @param A pointer to in instance of a caribou_mutex_t structure.
 * @param timeout The timeout to wait in milliseconds, or forever if zero.
 * @return true if the lock was acquired.
 * @note If the current thread currently holds a lock on the mutex, then a new lock will be granted, however, in order
 * to release the lock completely such that it may be acquired by another thread, then caribou_mutex_unlock() must be called a number of time equal to the number
 * of times a lock was acquired by the same (current) thread.
 */
bool caribou_mutex_lock(caribou_mutex_t* mutex,uint32_t timeout)
{
	caribou_timer_t	timer;
	caribou_thread_lock();					/* lock the thread if it's not locked already */
	++mutex->blocking;						/* tell the holder of the lock that this thread is blocking */
	caribou_thread_unlock();				/* restore previous scheduler lock state */
	if ( timeout )
	{
        caribou_timer_set(&timer,from_ms(timeout));
		caribou_timer_init(&timer,NULL,NULL,CARIBOU_TIMER_F_ONESHOT);
	}
	while ( !caribou_mutex_trylock(mutex) && (!timeout || (timeout && !caribou_timer_expired(&timer))))
	{
		if ( (mutex->flags & CARIBOU_MUTEX_F_NOYIELD) == 0 )
		{
			caribou_thread_yield();
		}
	}
	caribou_thread_lock();					/* lock the scheduler if it's not locked already */
	--mutex->blocking;						/* tell the holder of the lock that this thread is unblocking */
	caribou_thread_unlock();				/* restore the previous scheduler state */
	return true;
}

/**
 * Try to acquire a mutex lock without blocking. If the mutex is currently held, the calling thread
 * will not block, however, caribou_mutex_trylock() will return false, and the lock will not have been 
 * acquired by the calling thread.
 * @param A pointer to in instance of a caribou_mutex_t structure.
 * @return true if the lock was acquired.
 * @note If the current thread currently holds a lock on the mutex, then a new lock will be granted, however, in order
 * to release the lock completely such that it may be acquired by another thread, then caribou_mutex_unlock() must be called a number of time equal to the number
 * of times a lock was acquired by the same (current) thread.
 */
bool caribou_mutex_trylock(caribou_mutex_t* mutex)
{
	bool rc;
	caribou_thread_t* current_thread = caribou_thread_current();
	caribou_thread_lock();
	if ( mutex->locks )
	{
		if ( mutex->thread != current_thread )
		{
			rc = false;	/* qcquired */
		}
		else if ( mutex->flags & CARIBOU_MUTEX_F_RECURSIVE )
		{	
			rc = true;	/* acquired */
		}
		else
		{
			rc = false;	/* not acquired */
		}
	}
	else
	{
		/* acquired */
		++mutex->locks; // increment number of locks
		mutex->thread = current_thread;
		rc = true;
	}
	caribou_thread_unlock();
	return rc;
}

/**
 * @brief Unlock a mutex instance which was previously acquired with thread_mutex_lock() or thread_caribou_mutex_trylock()
 * If there are other threads that are currently blocking on the mutex, then caribou_mutex_unlock() will yield the thread after 
 * releasing the mutex, otherwise, if there are no other threads blocking on the mutex, then continue without yielding.
 * @param mutex A mutex instance which was previously locked.
 * @return Boolean, true if the lock was released, otherwise false.
 * @note A mutex can only be unlocked by the thread which locked it.
 */
bool caribou_mutex_unlock(caribou_mutex_t* mutex)
{
	bool rc=false;
	caribou_thread_lock();
	if ( mutex->locks && mutex->thread == caribou_thread_current() )
	{
		if ( --mutex->locks == 0 )  // decrement number of locks.
			mutex->thread=NULL;
		rc=true;
	}
	// if there are blockers, then yield, otherwise not...
	if ( mutex->blocking )
	{
		caribou_thread_unlock();
		if ( (mutex->flags & CARIBOU_MUTEX_F_NOYIELD) == 0 )
		{
			caribou_thread_yield();
		}
	}
	else
	{
		caribou_thread_unlock();
	}
	return rc;
}

/**
 * @brief Queries the option flags associated with the specified mutex instance.
 * @param mutex A pointer to a mutex instance.
 * @return The flags of the mutex instance.
 * @note The Current thread is locked for the duration of this operation.
 */
uint8_t caribou_mutex_flags(caribou_mutex_t* mutex)
{
	uint8_t rc;
	caribou_thread_lock();
	rc = mutex->flags;
	caribou_thread_unlock();
	return rc;
}

/**
 * @brief Set the option flags associated with the specified mutex instance.
 * @param mutex A pointer to a mutex instance.
 * @param flags The flags to set/reset.
 * @return The flags of the mutex instance.
 * @note The Current thread is locked for the duration of this operation.
 */
void caribou_mutex_set_flags(caribou_mutex_t* mutex,uint8_t flags)
{
	caribou_thread_lock();
	mutex->flags=flags;
	caribou_thread_unlock();
}



