/**
 * @file os_port_windows.h
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

#ifndef _OS_PORT_WINDOWS_H
#define _OS_PORT_WINDOWS_H

typedef void OsTask;
typedef void OsEvent;
typedef void OsSemaphore;
typedef void OsMutex;

typedef void (*TaskCode)(void *params);

//Kernel specific functions
void osInit(void);
void osStart(void);

//Task management
OsTask *osTaskCreate(const char_t *name, TaskCode taskCode,
   void *params, size_t stackSize, uint_t priority);

void osTaskCreateStatic(OsTask *task, const char_t *name, TaskCode taskCode,
   void *params, void *stack, size_t stackSize, uint_t priority);

void osTaskDelete(OsTask *task);
void osTaskSuspendAll(void);
void osTaskResumeAll(void);
void osTaskSwitch(void);
void osTaskSwitchFromIrq(void);

//Event specific functions
OsEvent *osEventCreate(bool_t initialState);
void osEventClose(OsEvent *event);
void osEventSet(OsEvent *event);
void osEventReset(OsEvent *event);
bool_t osEventWait(OsEvent *event, systime_t timeout);
bool_t osEventSetFromIrq(OsEvent *event);

//Semaphore specific functions
OsSemaphore *osSemaphoreCreate(uint_t maxCount, uint_t initialCount);
void osSemaphoreClose(OsSemaphore *semaphore);
bool_t osSemaphoreWait(OsSemaphore *semaphore, systime_t timeout);
void osSemaphoreRelease(OsSemaphore *semaphore);

//Mutex specific functions
OsMutex *osMutexCreate(bool_t initialOwner);
void osMutexClose(OsMutex *mutex);
void osMutexAcquire(OsMutex *mutex);
void osMutexRelease(OsMutex *mutex);

//Memory management
void *osMemAlloc(size_t size);
void osMemFree(void *p);

//Atomic operations
uint16_t osAtomicInc16(uint16_t *n);
uint32_t osAtomicInc32(uint32_t *n);

#undef min
#undef max
#include <stdlib.h>
#undef min
#undef max
#define min(a, b) ((a) < (b) ? (a) : (b))
#define max(a, b) ((a) > (b) ? (a) : (b))
#define strlwr _strlwr
#define strcasecmp _stricmp
#define strncasecmp _strnicmp
#define strtok_r(str, delim, p) strtok(str, delim)
#include <time.h>

#endif
