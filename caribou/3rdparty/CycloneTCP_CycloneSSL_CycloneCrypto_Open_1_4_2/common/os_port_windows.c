/**
 * @file os_port_windows.c
 * @brief RTOS abstraction layer (Windows)
 *
 * @section License
 *
 * Copyright (C) 2010-2014 Oryx Embedded. All rights reserved.
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 *
 * @author Oryx Embedded (www.oryx-embedded.com)
 * @version 1.4.2
 **/

//Memory leaks detection
#if (defined(_WIN32) && defined(_DEBUG))
   #define _CRTDBG_MAP_ALLOC
   #include <stdlib.h>
   #include <crtdbg.h>
#endif

//Dependencies
#include <stdio.h>
#include <stdlib.h>
#include "os_port.h"
#include "os_port_windows.h"
#include "debug.h"

//Windows dependent headers
#include <windows.h>


/**
 * @brief Start OS scheduler
 **/

void osStart(void)
{
}


/**
 * @brief Create a new task
 * @param[in] name A name identifying the task
 * @param[in] taskCode Pointer to the task entry function
 * @param[in] params A pointer to a variable to be passed to the task
 * @param[in] stackSize The initial size of the stack, in words
 * @param[in] priority The priority at which the task should run
 * @return If the function succeeds, the return value is a handle to the
 *   new task. If the function fails, the return value is NULL
 **/

OsTask *osTaskCreate(const char_t *name, TaskCode taskCode,
   void *params, size_t stackSize, uint_t priority)
{
   //Not implemented
   return OS_INVALID_HANDLE;
}


/**
 * @brief Delete a task
 * @param[in] task A handle to the task to be deleted
 **/

void osTaskDelete(OsTask *task)
{
}


/**
 * @brief Suspend scheduler activity
 **/

void osTaskSuspendAll(void)
{
}


/**
 * @brief Resume scheduler activity
 **/

void osTaskResumeAll(void)
{
}


/**
 * @brief Yield control to the next task
 **/

void osTaskSwitch(void)
{
}


/**
 * @brief Switch to the higher priority task
 **/

void osTaskSwitchFromIrq(void)
{
}


/**
 * @brief Create a event object
 * @param[in] initialState If this parameter is TRUE, the initial state of the
 *   event object is signaled. Otherwise, it is nonsignaled
 * @return If the function succeeds, the return value is a handle to the newly
 *   created event object. If the function fails, the return value is NULL
 **/

OsEvent *osEventCreate(bool_t initialState)
{
   HANDLE event;

   //Create an event object
   event = CreateEvent(NULL, FALSE, initialState, NULL);
   //Return a handle to the newly created event object
   return (OsEvent *) event;
}


/**
 * @brief Close an event object
 **/

void osEventClose(OsEvent *event)
{
   //Make sure the handle is valid
   if(event)
   {
      //Properly dispose the event object
      CloseHandle((HANDLE) event);
   }
}


/**
 * @brief Set the specified event object to the signaled state
 * @param[in] event A handle to the event object
 **/

void osEventSet(OsEvent *event)
{
}


/**
 * @brief Set the specified event object to the nonsignaled state
 * @param[in] event A handle to the event object
 **/

void osEventReset(OsEvent *event)
{
}


/**
 * @brief Waits until the specified event is in the signaled state
 * @param[in] event A handle to the event object
 * @param[in] timeout The time-out interval, in milliseconds. If a nonzero value
 *   is specified, the function waits until the object is signaled or the
 *   interval elapses. If this parameter is zero, the function always returns
 *   immediately. If this parameter is INFINITE_DELAY, the function will return
 *   only when the object is signaled
 * @return TRUE if the state of the specified object is signaled, FALSE if the
 *   time-out interval elapsed, and the object's state is nonsignaled
 **/

bool_t osEventWait(OsEvent *event, systime_t timeout)
{
   //Not implemented
   return FALSE;
}


/**
 * @brief Set an event object to the signaled state from an IRQ routine
 * @param[in] event A handle to the event object
 * @return TRUE if setting the event to signaled state caused a task to unblock
 *   and the unblocked task has a priority higher than the currently running task
 **/

bool_t osEventSetFromIrq(OsEvent *event)
{
   //Not implemented
   return FALSE;
}


/**
 * @brief Create a semaphore object
 * @param[in] maxCount The maximum count for the semaphore object. This value
 *   must be greater than zero
 * @param[in] initialCount The initial count for the semaphore object. The state
 *   of a semaphore is signaled when its count is greater than zero and
 *   nonsignaled when it is zero. The count is decreased by one whenever a wait
 *   function releases a task that was waiting for the semaphore. The count is
 *   increased by one by calling the osSemaphoreRelease function
 * @return If the function succeeds, the return value is a handle to the newly
 *   created semaphore object. If the function fails, the return value is NULL
 **/

OsSemaphore *osSemaphoreCreate(uint_t maxCount, uint_t initialCount)
{
   HANDLE semaphore;

   //Create a semaphore
   semaphore = CreateSemaphore(NULL, initialCount, maxCount, NULL);
   //Return a handle to the newly created semaphore
   return (OsSemaphore *) semaphore;
}


/**
 * @brief Close a semaphore object
 **/

void osSemaphoreClose(OsSemaphore *semaphore)
{
   //Make sure the handle is valid
   if(semaphore)
   {
      //Properly dispose the semaphore object
      CloseHandle((HANDLE) semaphore);
   }
}


/**
 * @brief Waits until the specified semaphore is in the signaled state
 * @param[in] semaphore A handle to the semaphore object
 * @param[in] timeout The time-out interval, in milliseconds. If a nonzero value
 *   is specified, the function waits until the object is signaled or the
 *   interval elapses. If this parameter is zero, the function always returns
 *   immediately. If this parameter is INFINITE_DELAY, the function will return
 *   only when the object is signaled
 * @return TRUE if the state of the specified object is signaled, FALSE if the
 *   time-out interval elapsed, and the object's state is nonsignaled
 **/

bool_t osSemaphoreWait(OsSemaphore *semaphore, systime_t timeout)
{
   //Waits until the specified semaphore is in the signaled
   //state or the time-out interval elapses
   if(WaitForSingleObject((HANDLE) semaphore,  timeout) == WAIT_OBJECT_0)
      return TRUE;
   else
      return FALSE;
}


/**
 * @brief Release the specified semaphore object
 * @param[in] semaphore A handle to the semaphore object
 **/

void osSemaphoreRelease(OsSemaphore *semaphore)
{
   //Increase the count of the specified semaphore object
   ReleaseSemaphore((HANDLE) semaphore, 1, NULL);
}


/**
 * @brief Create a mutex object
 * @param[in] initialOwner If this value is TRUE the calling task obtains
 *   initial ownership of the mutex object. Otherwise, the calling task
 *   does not obtain ownership of the mutex
 * @return If the function succeeds, the return value is a handle to the newly
 *   created mutex object. If the function fails, the return value is NULL
 **/

OsMutex *osMutexCreate(bool_t initialOwner)
{
   HANDLE mutex;

   //Create a mutex object
   mutex = CreateMutex(NULL, initialOwner, NULL);
   //Return a handle to the newly created mutex
   return (OsMutex *) mutex;
}


/**
 * @brief Close a mutex object
 **/

void osMutexClose(OsMutex *mutex)
{
   //Make sure the handle is valid
   if(mutex)
   {
      //Properly dispose the semaphore object
      CloseHandle((HANDLE) mutex);
   }
}


/**
 * @brief Acquire ownership of the specified mutex object
 * @param[in] mutex A handle to the mutex object
 **/

void osMutexAcquire(OsMutex *mutex)
{
   //Waits until the specified mutex is in the signaled state
   WaitForSingleObject((HANDLE) mutex,  INFINITE);
}


/**
 * @brief Release ownership of the specified mutex object
 * @param[in] mutex A handle to the mutex object
 **/

void osMutexRelease(OsMutex *mutex)
{
   //Release ownership of the mutex object
   ReleaseMutex((HANDLE) mutex);
}


/**
 * @brief Delay routine
 * @param[in] delay Amount of time for which the calling task should block
 **/

void osDelay(systime_t delay)
{
   //Suspends the execution of the current thread until the time-out interval elapses
   Sleep(delay);
}


/**
 * @brief Retrieve system time
 * @return Number of milliseconds elapsed since the system was last started
 **/

systime_t osGetTickCount(void)
{
   //Retrieves the number of milliseconds that have elapsed
   //since the system was started
   return GetTickCount();
}


/**
 * @brief 16-bit increment operation
 * @param[in] n Pointer to a 16-bit to be incremented
 * @return The value resulting from the increment
 **/

uint16_t osAtomicInc16(uint16_t *n)
{
   uint16_t m;

   //Increment the specified 16-bit integer
   m = ++(*n);
   //Return the resulting value
   return *n;
}


/**
 * @brief 32-bit increment operation
 * @param[in] n Pointer to a 32-bit to be incremented
 * @return The value resulting from the increment
 **/

uint32_t osAtomicInc32(uint32_t *n)
{
   //Increment the specified 32-bit integer
   return InterlockedIncrement(n);
}


/**
 * @brief Allocate a memory block
 * @param[in] size Bytes to allocate
 * @return  A pointer to the allocated memory block or NULL if
 *   there is insufficient memory available
 **/

void *osMemAlloc(size_t size)
{
   //Allocate a memory block
   return malloc(size);
}


/**
 * @brief Release a previously allocated memory block
 * @param[in] p Previously allocated memory block to be freed
 **/

void osMemFree(void *p)
{
   //Free memory block
   free(p);
}


//The following functions are deprecated
void osTimerStart(OsTimer *timer, systime_t delay)
{
   timer->startTime = osGetTickCount();
   timer->interval = delay;
   timer->running = TRUE;
}


void osTimerStop(OsTimer *timer)
{
   timer->running = FALSE;
}


bool_t osTimerRunning(OsTimer *timer)
{
   return timer->running;
}


bool_t osTimerElapsed(OsTimer *timer)
{
   if(!timer->running)
      return FALSE;

   if(timeCompare(osGetTickCount(), timer->startTime + timer->interval) >= 0)
      return TRUE;
   else
      return FALSE;
}
