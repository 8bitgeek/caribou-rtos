/**
 * @file debug.h
 * @brief Debugging facilities
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

#ifndef _DEBUG_H
#define _DEBUG_H

//Dependencies
#include <stdio.h>
#include "os_port.h"

//Trace level definitions
#define TRACE_LEVEL_NO_TRACE 0
#define TRACE_LEVEL_FATAL    1
#define TRACE_LEVEL_ERROR    2
#define TRACE_LEVEL_WARNING  3
#define TRACE_LEVEL_INFO     4
#define TRACE_LEVEL_DEBUG    5

//Default trace level
#ifndef TRACE_LEVEL
   #define TRACE_LEVEL TRACE_LEVEL_DEBUG
#endif

//Debugging macros
#if (TRACE_LEVEL >= TRACE_LEVEL_FATAL)
   #define TRACE_FATAL(...) osTaskSuspendAll(), fprintf(stderr, __VA_ARGS__), osTaskResumeAll()
#else
   #define TRACE_FATAL(...)
#endif

#if (TRACE_LEVEL >= TRACE_LEVEL_ERROR)
   #define TRACE_ERROR(...) osTaskSuspendAll(), fprintf(stderr, __VA_ARGS__), osTaskResumeAll()
#else
   #define TRACE_ERROR(...)
#endif

#if (TRACE_LEVEL >= TRACE_LEVEL_WARNING)
   #define TRACE_WARNING(...) osTaskSuspendAll(), fprintf(stderr, __VA_ARGS__), osTaskResumeAll()
#else
   #define TRACE_WARNING(...)
#endif

#if (TRACE_LEVEL >= TRACE_LEVEL_INFO)
   #define TRACE_INFO(...) osTaskSuspendAll(), fprintf(stderr, __VA_ARGS__), osTaskResumeAll()
   #define TRACE_INFO_ARRAY(p, a, n) osTaskSuspendAll(), debugDisplayArray(stderr, p, a, n), osTaskResumeAll()
   #define TRACE_INFO_CHUNKED_BUFFER(p, b, o, n)
   #define TRACE_INFO_MPI(p, a) osTaskSuspendAll(), mpiDump(stderr, p, a), osTaskResumeAll()
#else
   #define TRACE_INFO(...)
   #define TRACE_INFO_ARRAY(p, a, n)
   #define TRACE_INFO_CHUNKED_BUFFER(p, b, o, n)
   #define TRACE_INFO_MPI(p, a)
#endif

#if (TRACE_LEVEL >= TRACE_LEVEL_DEBUG)
   #define TRACE_DEBUG(...) osTaskSuspendAll(), fprintf(stderr, __VA_ARGS__), osTaskResumeAll()
   #define TRACE_DEBUG_ARRAY(p, a, n) osTaskSuspendAll(), debugDisplayArray(stderr, p, a, n), osTaskResumeAll()
   #define TRACE_DEBUG_CHUNKED_BUFFER(p, b, o, n)
   #define TRACE_DEBUG_MPI(p, a) osTaskSuspendAll(), mpiDump(stderr, p, a), osTaskResumeAll()
#else
   #define TRACE_DEBUG(...)
   #define TRACE_DEBUG_ARRAY(p, a, n)
   #define TRACE_DEBUG_CHUNKED_BUFFER(p, b, o, n)
   #define TRACE_DEBUG_MPI(p, a)
#endif

//Debug related functions
void debugInit(uint32_t baudrate);

void debugDisplayArray(FILE *stream,
   const char_t *prepend, const void *data, size_t length);

#endif
