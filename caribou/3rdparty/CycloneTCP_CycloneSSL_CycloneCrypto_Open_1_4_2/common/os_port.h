/**
 * @file os_port.h
 * @brief RTOS abstraction layer
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

#ifndef _OS_PORT_H
#define _OS_PORT_H

//Dependencies
#include <stddef.h>
#include <stdint.h>
#include <inttypes.h>
#include "os_port_config.h"


#define PTR_OFFSET(addr, offset) ((void *) ((uint8_t *) (addr) + (offset)))

#define timeCompare(t1, t2) ((int32_t) ((t1) - (t2)))


//Compilation flags used to enable/disable features
#define ENABLED  (+1)
#define DISABLED (-1)

#ifndef FALSE
   #define FALSE 0
#endif

#ifndef TRUE
   #define TRUE 1
#endif

#ifndef LSB
   #define LSB(x) ((x) & 0xFF)
#endif

#ifndef MSB
   #define MSB(x) (((x) >> 8) & 0xFF)
#endif

#ifdef min
   #undef min
#endif

#define min(a, b) ((a) < (b) ? (a) : (b))

#ifdef max
   #undef max
#endif

#define max(a, b) ((a) > (b) ? (a) : (b))

#ifndef arraysize
   #define arraysize(a) (sizeof(a) / sizeof(a[0]))
#endif

//Events
#define INFINITE_DELAY ((uint_t) -1)

//Invalid handle value
#define OS_INVALID_HANDLE NULL

//Types
typedef char char_t;
typedef signed int int_t;
typedef unsigned int uint_t;
typedef int bool_t;
typedef uint32_t systime_t;

#ifndef _WIN32
   typedef unsigned long time_t;
#endif

#if defined(_WIN32)
   #define PRIuSIZE "Iu"
   #define PRIuTIME "lu"
#elif defined(__XC32)
   #define PRIuSIZE "u"
   #define PRIuTIME "u"
#else
   #define PRIuSIZE "u"
   #define PRIuTIME "lu"
#endif

#if defined(__CC_ARM)
   #undef PRIu8
   #define PRIu8 "u"
   #undef PRIu16
   #define PRIu16 "u"
#endif


/**
 * @brief Timer object
 **/

typedef struct
{
   bool_t running;
   systime_t startTime;
   systime_t interval;
} OsTimer;

//Timer specific functions
void osTimerStart(OsTimer *timer, systime_t delay);
void osTimerStop(OsTimer *timer);
bool_t osTimerRunning(OsTimer *timer);
bool_t osTimerElapsed(OsTimer *timer);

//Time related functions
void osDelay(systime_t delay);
systime_t osGetTickCount(void);

//FreeRTOS port?
#if defined(USE_FREERTOS)
   #include "os_port_freertos.h"
//Keil RTS port?
#elif defined(USE_RTX)
   #include "os_port_rtx.h"
//Windows port?
#elif defined(_WIN32)
   #include "os_port_windows.h"
//No RTOS defined?
#else
   #error No RTOS defined
#endif

//Delay routines
#define usleep(delay) {volatile uint32_t n = delay * 4; while(n > 0) n--;}
#define sleep(delay) {volatile uint32_t n = delay * 4000; while(n > 0) n--;}

#endif
