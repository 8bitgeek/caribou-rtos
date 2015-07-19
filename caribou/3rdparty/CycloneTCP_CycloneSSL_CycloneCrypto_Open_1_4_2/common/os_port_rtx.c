/**
 * @file os_port_rtx.c
 * @brief RTOS abstraction layer (Keil RTX)
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

//Dependencies
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "os_port.h"
#include "os_port_rtx.h"
#include "debug.h"

//RTX specific headers
#include "rtl.h"

//Variables
static bool_t running;
static OsTask taskPool[OS_PORT_TASK_COUNT];
static _declare_box(eventPool, sizeof(OS_SEM), OS_PORT_EVENT_COUNT);
static _declare_box(semaphorePool, sizeof(OS_SEM), OS_PORT_SEMAPHORE_COUNT);
static _declare_box(mutexPool, sizeof(OS_MUT), OS_PORT_MUTEX_COUNT);


/**
 * @brief OS initialization
 **/

void osInit(void)
{
   //The scheduler is not running
   running = FALSE;

   //Initialize fixed block size memory pools
   memset(taskPool, 0, sizeof(taskPool));
   _init_box(eventPool, sizeof(eventPool), sizeof(OS_SEM));
   _init_box(semaphorePool, sizeof(semaphorePool), sizeof(OS_SEM));
   _init_box(mutexPool, sizeof(mutexPool), sizeof(OS_MUT));
}


/**
 * @brief Start OS scheduler
 * @param[in] task Initialization task
 **/

void osStart(OsInitTask task)
{
   //The scheduler is now running
   running = TRUE;
   //Start the scheduler
   os_sys_init(task);
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
   uint_t i;
   OsTask *task = NULL;

   //Enter critical section
   osTaskSuspendAll();

   //Loop through table
   for(i = 0; i < OS_PORT_TASK_COUNT; i++)
   {
      //Check whether the current entry is free
      if(!taskPool[i].tid)
      {
         //Create a new task
         taskPool[i].tid = os_tsk_create_ex(taskCode, priority, params);

         //Successful task creation?
         if(taskPool[i].tid)
            task = &taskPool[i];

         //We are done
         break;
      }
   }

   //Leave critical section
   osTaskResumeAll();
   //Return a handle to the newly created task
   return task;
}


/**
 * @brief Create a static task
 * @param[out] task Pointer to the task structure
 * @param[in] name A name identifying the task
 * @param[in] taskCode Pointer to the task entry function
 * @param[in] params A pointer to a variable to be passed to the task
 * @param[in] stackSize The initial size of the stack, in words
 * @param[in] priority The priority at which the task should run
 **/

void osTaskCreateStatic(OsTask *task, const char_t *name, TaskCode taskCode,
   void *params, void *stack, size_t stackSize, uint_t priority)
{
   //Create a new task
   task->tid = os_tsk_create_user_ex(taskCode, priority,
      stack, stackSize * sizeof(uint_t), params);
}


/**
 * @brief Delete a task
 * @param[in] task A handle to the task to be deleted
 **/

void osTaskDelete(OsTask *task)
{
   uint_t i;
   OS_TID tid;

   //Retrieve task ID
   if(task == NULL)
      tid = os_tsk_self();
   else
      tid = task->tid;

   //Enter critical section
   osTaskSuspendAll();

   //Loop through table
   for(i = 0; i < OS_PORT_TASK_COUNT; i++)
   {
      //Check current entry
      if(taskPool[i].tid == tid)
      {
         //Release current entry
         taskPool[i].tid = 0;
      }
   }

   //Leave critical section
   osTaskResumeAll();

   //Delete the currently running task?
   if(task == NULL)
   {
      //Kill ourselves
      os_tsk_delete_self();
   }
   else
   {
      //Delete the specified task
      os_tsk_delete(tid);
   }
}


/**
 * @brief Suspend scheduler activity
 **/

void osTaskSuspendAll(void)
{
   //Make sure the operating system is running
   if(running)
   {
      //Suspend all tasks
      tsk_lock();
   }
}


/**
 * @brief Resume scheduler activity
 **/

void osTaskResumeAll(void)
{
   //Make sure the operating system is running
   if(running)
   {
      //Resume all tasks
      tsk_unlock();
   }
}


/**
 * @brief Yield control to the next task
 **/

void osTaskSwitch(void)
{
   //Pass control to the next task
   os_tsk_pass();
}


/**
 * @brief Switch to the higher priority task
 **/

void osTaskSwitchFromIrq(void)
{
   //Not implemented
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
   OS_ID event;

   //Allocate memory to hold the event object
   event = _alloc_box(eventPool);
   //Failed to allocate memory?
   if(!event) return NULL;

   //Initialize event object
   os_sem_init(event, 0);

   //Initial state is signaled or nonsignaled?
   if(initialState)
   {
      //Obtain ownership
      os_sem_send(event);
   }

   //Return a handle to the newly created event object
   return (OsEvent *) event;
}


/**
 * @brief Create a event object
 * @param[out] event Pointer to the event object
 * @param[in] initialState If this parameter is TRUE, the initial state of the
 *   event object is signaled. Otherwise, it is nonsignaled
 **/

void osEventCreateStatic(OsEvent *event, bool_t initialState)
{
   //Initialize event object
   os_sem_init((OS_ID) event, 0);

   //Initial state is signaled or nonsignaled?
   if(initialState)
   {
      //Obtain ownership
      os_sem_send((OS_ID) event);
   }
}


/**
 * @brief Close an event object
 **/

void osEventClose(OsEvent *event)
{
   //Make sure the handle is valid
   if(event)
   {
      //Properly dispose the specified event object
      _free_box(eventPool, event);
   }
}


/**
 * @brief Set the specified event object to the signaled state
 * @param[in] event A handle to the event object
 **/

void osEventSet(OsEvent *event)
{
   //Set the specified event to the signaled state
   os_sem_send((OS_ID) event);
}


/**
 * @brief Set the specified event object to the nonsignaled state
 * @param[in] event A handle to the event object
 **/

void osEventReset(OsEvent *event)
{
   OS_RESULT res;

   //Force the specified event to the nonsignaled state
   do
   {
      res = os_sem_wait((OS_ID) event, 0);
   } while(res == OS_R_OK);
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
   uint16_t n;
   OS_RESULT res;

   //Waits until the specified event is in the signaled
   //state or the time-out interval elapses
   if(timeout == INFINITE_DELAY)
   {
      //Infinite delay
      res = os_sem_wait((OS_ID) event, 0xFFFF);
   }
   else
   {
      //Wait until the time interval elapses
      while(timeout > 0)
      {
         n = min(timeout, 0xFFFE);
         res = os_sem_wait((OS_ID) event, n);
         if(res != OS_R_TMO)
            break;
         timeout -= n;
      }
   }

   //Check status
   if(res == OS_R_OK || res == OS_R_SEM)
   {
      do
      {
         res = os_sem_wait((OS_ID) event, 0);
      } while(res == OS_R_OK);

      return TRUE;
   }
   else
   {
      return FALSE;
   }
}


/**
 * @brief Set an event object to the signaled state from an IRQ routine
 * @param[in] event A handle to the event object
 * @return TRUE if setting the event to signaled state caused a task to unblock
 *   and the unblocked task has a priority higher than the currently running task
 **/

bool_t osEventSetFromIrq(OsEvent *event)
{
   //Set the specified event to the signaled state
   isr_sem_send((OS_ID) event);

   //A higher priority task has been woken?
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
   OS_ID semaphore;

   //Allocate memory to hold the semaphore object
   semaphore = _alloc_box(semaphorePool);
   //Failed to allocate memory?
   if(!semaphore) return NULL;

   //Initialize semaphore
   os_sem_init(semaphore, initialCount);

   //Return a handle to the newly created semaphore
   return (OsSemaphore *) semaphore;
}


void osSemaphoreCreateStatic(OsSemaphore *semaphore, uint_t maxCount, uint_t initialCount)
{
   //Initialize semaphore
   os_sem_init((OS_ID) semaphore, initialCount);
}


/**
 * @brief Close a semaphore object
 **/

void osSemaphoreClose(OsSemaphore *semaphore)
{
   //Make sure the handle is valid
   if(semaphore)
   {
      //Properly dispose the specified semaphore
      _free_box(semaphorePool, semaphore);
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
   uint16_t n;
   OS_RESULT res;

   //Waits until the specified semaphore is in the signaled
   //state or the time-out interval elapses
   if(timeout == INFINITE_DELAY)
   {
      //Infinite delay
      res = os_sem_wait((OS_ID) semaphore, 0xFFFF);
   }
   else
   {
      //Wait until the time interval elapses
      while(timeout > 0)
      {
         n = min(timeout, 0xFFFE);
         res = os_sem_wait((OS_ID) semaphore, n);
         if(res != OS_R_TMO)
            break;
         timeout -= n;
      }
   }

   //Check status
   if(res == OS_R_OK || res == OS_R_SEM)
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
   //Release the semaphore
   os_sem_send((OS_ID) semaphore);
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
   OS_ID mutex;

   //Allocate memory to hold the mutex object
   mutex = _alloc_box(mutexPool);
   //Failed to allocate memory?
   if(!mutex) return NULL;

   //Initialize mutex
   os_mut_init(mutex);

   //Get the initial ownership of the mutex?
   if(initialOwner)
   {
      //Obtain ownership
      os_mut_wait(mutex, 0);
   }

   //Return a handle to the newly created mutex
   return (OsMutex *) mutex;
}


void osMutexCreateStatic(OsMutex *mutex, bool_t initialOwner)
{
   //Initialize mutex
   os_mut_init((OS_ID) mutex);

   //Get the initial ownership of the mutex?
   if(initialOwner)
   {
      //Obtain ownership
      os_mut_wait((OS_ID) mutex, 0);
   }
}


/**
 * @brief Close a mutex object
 **/

void osMutexClose(OsMutex *mutex)
{
   //Make sure the handle is valid
   if(mutex)
   {
      //Properly dispose the specified mutex
      _free_box(mutexPool, mutex);
   }
}


/**
 * @brief Acquire ownership of the specified mutex object
 * @param[in] mutex A handle to the mutex object
 **/

void osMutexAcquire(OsMutex *mutex)
{
   //Obtain ownership of the mutex object
   os_mut_wait((OS_ID) mutex, 0xFFFF);
}


/**
 * @brief Release ownership of the specified mutex object
 * @param[in] mutex A handle to the mutex object
 **/

void osMutexRelease(OsMutex *mutex)
{
   //Release ownership of the mutex object
   os_mut_release((OS_ID) mutex);
}


/**
 * @brief Delay routine
 * @param[in] delay Amount of time for which the calling task should block
 **/

void osDelay(systime_t delay)
{
   uint16_t n;

   //Delay the task for the specified duration
   while(delay > 0)
   {
      n = min(delay, 0xFFFE);
      os_dly_wait(n);
      delay -= n;
   }
}


/**
 * @brief Retrieve system time
 * @return Number of milliseconds elapsed since the system was last started
 **/

systime_t osGetTickCount(void)
{
   //Get current tick count
   return os_time_get();
}


/**
 * @brief 16-bit increment operation
 * @param[in] n Pointer to a 16-bit to be incremented
 * @return The value resulting from the increment
 **/

uint16_t osAtomicInc16(uint16_t *n)
{
   uint16_t m;

   //Enter critical section
   osTaskSuspendAll();
   //Increment the specified 16-bit integer
   m = ++(*n);
   //Leave critical section
   osTaskResumeAll();

   //Return the incremented value
   return m;
}


/**
 * @brief 32-bit increment operation
 * @param[in] n Pointer to a 32-bit to be incremented
 * @return The value resulting from the increment
 **/

uint32_t osAtomicInc32(uint32_t *n)
{
   uint32_t m;

   //Enter critical section
   osTaskSuspendAll();
   //Increment the specified 32-bit integer
   m = ++(*n);
   //Leave critical section
   osTaskResumeAll();

   //Return the incremented value
   return m;
}


/**
 * @brief Allocate a memory block
 * @param[in] size Bytes to allocate
 * @return  A pointer to the allocated memory block or NULL if
 *   there is insufficient memory available
 **/

void *osMemAlloc(size_t size)
{
   void *p;

   //Enter critical section
   osTaskSuspendAll();
   //Allocate a memory block
   p = malloc(size);
   //Leave critical section
   osTaskResumeAll();
   //Debug message
   //TRACE_DEBUG("Allocating %u bytes at 0x%08X\r\n", size, (uint_t) p);
   //Return a pointer to the newly allocated memory block
   return p;
}


/**
 * @brief Release a previously allocated memory block
 * @param[in] p Previously allocated memory block to be freed
 **/

void osMemFree(void *p)
{
   //Make sure the pointer is valid
   if(p != NULL)
   {
      //Debug message
      //TRACE_DEBUG("Freeing memory at 0x%08X\r\n", (uint_t) p);
      //Enter critical section
      osTaskSuspendAll();
      //Free memory block
      free(p);
      //Leave critical section
      osTaskResumeAll();
   }
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
