/**
 * @file os_port_freertos.c
 * @brief RTOS abstraction layer (FreeRTOS)
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
#include "os_port.h"
#include "os_port_freertos.h"
#include "debug.h"

//FreeRTOS specific headers
#include "freertos.h"
#include "task.h"
#include "semphr.h"


/**
 * @brief Start OS scheduler
 **/

void osStart(void)
{
   //Start the scheduler
   vTaskStartScheduler();
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
   portBASE_TYPE status;
   xTaskHandle task = NULL;

   //Create a new task
   status = xTaskCreate((pdTASK_CODE) taskCode,
      (const signed char *) name, stackSize, params, priority, &task);

   //Check the return value
   if(status == pdPASS)
      return task;
   else
      return NULL;
}


/**
 * @brief Delete a task
 * @param[in] task A handle to the task to be deleted
 **/

void osTaskDelete(OsTask *task)
{
   //Delete the specified task
   vTaskDelete((xTaskHandle) task);
}


/**
 * @brief Suspend scheduler activity
 **/

void osTaskSuspendAll(void)
{
   //Suspend all tasks
   vTaskSuspendAll();
}


/**
 * @brief Resume scheduler activity
 **/

void osTaskResumeAll(void)
{
   //Resume all tasks
   xTaskResumeAll();
}


/**
 * @brief Yield control to the next task
 **/

void osTaskSwitch(void)
{
   //Force a context switch
   taskYIELD();
}


/**
 * @brief Switch to the higher priority task
 **/

void osTaskSwitchFromIrq(void)
{
   //Force a context switch
   //vPortYieldFromISR();
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
   xSemaphoreHandle event;

   //Create an event object
   vSemaphoreCreateBinary(event);
   //Any error to report?
   if(!event) return NULL;

   //Initial state is signaled or nonsignaled?
   if(!initialState)
   {
      //Set the specified event object to the nonsignaled state
      xSemaphoreTake(event, 0);
   }

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
      vSemaphoreDelete((xSemaphoreHandle) event);
   }
}


/**
 * @brief Set the specified event object to the signaled state
 * @param[in] event A handle to the event object
 **/

void osEventSet(OsEvent *event)
{
   //Set the specified event to the signaled state
   xSemaphoreGive((xSemaphoreHandle) event);
}


/**
 * @brief Set the specified event object to the nonsignaled state
 * @param[in] event A handle to the event object
 **/

void osEventReset(OsEvent *event)
{
   //Force the specified event to the nonsignaled state
   xSemaphoreTake((xSemaphoreHandle) event, 0);
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
   //Waits until the specified event is in the signaled
   //state or the time-out interval elapses
   return xSemaphoreTake((xSemaphoreHandle) event, timeout);
}


/**
 * @brief Set an event object to the signaled state from an IRQ routine
 * @param[in] event A handle to the event object
 * @return TRUE if setting the event to signaled state caused a task to unblock
 *   and the unblocked task has a priority higher than the currently running task
 **/

bool_t osEventSetFromIrq(OsEvent *event)
{
   portBASE_TYPE flag;

   //Set the specified event to the signaled state
   xSemaphoreGiveFromISR((xSemaphoreHandle) event, &flag);

   //A higher priority task has been woken?
   return flag;
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
   //Create a semaphore and return a handle to the newly created object
   return xSemaphoreCreateCounting(maxCount, initialCount);
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
      vSemaphoreDelete((xSemaphoreHandle) semaphore);
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
   return xSemaphoreTake((xSemaphoreHandle) semaphore, timeout);
}


/**
 * @brief Release the specified semaphore object
 * @param[in] semaphore A handle to the semaphore object
 **/

void osSemaphoreRelease(OsSemaphore *semaphore)
{
   //Release the semaphore
   xSemaphoreGive((xSemaphoreHandle) semaphore);
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
   xSemaphoreHandle mutex;

   //Create a mutex object
   mutex = xSemaphoreCreateMutex();
   //Any error to report
   if(!mutex) return NULL;

   //Get the initial ownership of the mutex?
   if(initialOwner)
   {
      //Obtain ownership
      xSemaphoreTake(mutex, 0);
   }

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
      //Properly dispose the specified mutex
      vSemaphoreDelete((xSemaphoreHandle) mutex);
   }
}


/**
 * @brief Acquire ownership of the specified mutex object
 * @param[in] mutex A handle to the mutex object
 **/

void osMutexAcquire(OsMutex *mutex)
{
   //Obtain ownership of the mutex object
   xSemaphoreTake((xSemaphoreHandle) mutex, portMAX_DELAY);
}


/**
 * @brief Release ownership of the specified mutex object
 * @param[in] mutex A handle to the mutex object
 **/

void osMutexRelease(OsMutex *mutex)
{
   //Release ownership of the mutex object
   xSemaphoreGive((xSemaphoreHandle) mutex);
}


OsQueue *osQueueCreate(uint_t length, size_t itemSize)
{
   //Create a queue and return a handle to the newly created object
   return xQueueCreate(length, itemSize);
}


void osQueueClose(OsQueue *queue)
{
   //Make sure the handle is valid
   if(queue)
   {
      //Properly dispose the specified queue object
      vQueueDelete((xQueueHandle) queue);
   }
}


bool_t osQueueSend(OsQueue *queue, const void *item, systime_t timeout)
{
   //Send the specified item to the queue
   return xQueueSend(queue, item, timeout);
}


bool_t osQueueReceive(OsQueue *queue, void *item, systime_t timeout)
{
   //Receive an item from the queue
   return xQueueReceive(queue, item, timeout);
}


bool_t osQueuePeek(OsQueue *queue, void *item, systime_t timeout)
{
   //Look at the next item in the queue
   return xQueueReceive(queue, item, timeout);
}


bool_t osQueueSendFromIrq(OsQueue *queue, const void *item, bool_t *higherPriorityTaskWoken)
{
   //Send the specified item to the queue
   return xQueueSendFromISR(queue, item, (portBASE_TYPE *) higherPriorityTaskWoken);
}


bool_t osQueueReceiveFromIrq(OsQueue *queue, void *item, bool_t *higherPriorityTaskWoken)
{
   //Receive an item from the queue
   return xQueueReceiveFromISR(queue, item, (portBASE_TYPE *) higherPriorityTaskWoken);
}


/**
 * @brief Delay routine
 * @param[in] delay Amount of time for which the calling task should block
 **/

void osDelay(systime_t delay)
{
   //Delay the task for the specified duration
   vTaskDelay(delay);
}


/**
 * @brief Retrieve system time
 * @return Number of milliseconds elapsed since the system was last started
 **/

systime_t osGetTickCount(void)
{
   //Get current tick count
   return xTaskGetTickCount();
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

   //Allocate a memory block
   p = pvPortMalloc(size);
   //Debug message
   //TRACE_DEBUG("Allocating %" PRIuSIZE " bytes at 0x%08" PRIXPTR "\r\n", size, (uintptr_t) p);
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
      //TRACE_DEBUG("Freeing memory at 0x%08" PRIXPTR "\r\n", (uintptr_t) p);
      //Free memory block
      vPortFree(p);
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
