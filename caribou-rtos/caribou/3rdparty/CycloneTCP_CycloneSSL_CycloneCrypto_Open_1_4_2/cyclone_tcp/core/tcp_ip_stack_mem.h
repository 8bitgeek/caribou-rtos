/**
 * @file tcp_ip_stack_mem.h
 * @brief Memory management
 *
 * @section License
 *
 * Copyright (C) 2010-2014 Oryx Embedded. All rights reserved.
 *
 * This file is part of CycloneTCP Open.
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

#ifndef _TCP_IP_STACK_MEM_H
#define _TCP_IP_STACK_MEM_H

//Dependencies
#include "tcp_ip_stack_config.h"
#include "os_port.h"
#include "error.h"

//Use fixed-size blocks allocation?
#ifndef MEM_POOL_SUPPORT
   #define MEM_POOL_SUPPORT DISABLED
#elif (MEM_POOL_SUPPORT != ENABLED && MEM_POOL_SUPPORT != DISABLED)
   #error MEM_POOL_SUPPORT parameter is not valid
#endif

//Number of buffers available
#ifndef MEM_POOL_BUFFER_COUNT
   #define MEM_POOL_BUFFER_COUNT 32
#elif (MEM_POOL_BUFFER_COUNT < 1)
   #error MEM_POOL_BUFFER_COUNT parameter is not valid
#endif

//Size of the buffers
#ifndef MEM_POOL_BUFFER_SIZE
   #define MEM_POOL_BUFFER_SIZE 1536
#elif (MEM_POOL_BUFFER_SIZE < 128)
   #error MEM_POOL_BUFFER_SIZE parameter is not valid
#endif

//Miscellaneous macro declarations
#define N(size) (((size) + MEM_POOL_BUFFER_SIZE - 1) / MEM_POOL_BUFFER_SIZE)


/**
 * @brief Structure describing a chunk of data
 **/

typedef struct
{
   void *address;
   uint16_t length;
   uint16_t size;
} ChunkDesc;


/**
 * @brief Structure describing a buffer that spans multiple chunks
 **/

typedef struct
{
   uint_t chunkCount;
   uint_t maxChunkCount;
   ChunkDesc chunk[];
} ChunkedBuffer;


typedef struct
{
   uint_t chunkCount;
   uint_t maxChunkCount;
   ChunkDesc chunk[1];
} ChunkedBuffer1;


//Memory management functions
error_t memPoolInit(void);
void *memPoolAlloc(size_t size);
void memPoolFree(void *p);
void memPoolGetStats(uint_t *currentUsage, uint_t *maxUsage, uint_t *size);

ChunkedBuffer *chunkedBufferAlloc(size_t length);
void chunkedBufferFree(ChunkedBuffer *buffer);

size_t chunkedBufferGetLength(const ChunkedBuffer *buffer);
error_t chunkedBufferSetLength(ChunkedBuffer *buffer, size_t length);

void *chunkedBufferAt(const ChunkedBuffer *buffer, size_t offset);

error_t chunkedBufferConcat(ChunkedBuffer *dest,
   const ChunkedBuffer *src, size_t srcOffset, size_t length);

error_t chunkedBufferCopy(ChunkedBuffer *dest, size_t destOffset,
   const ChunkedBuffer *src, size_t srcOffset, size_t length);

error_t chunkedBufferAppend(ChunkedBuffer *dest, const void *src, size_t length);

size_t chunkedBufferWrite(ChunkedBuffer *dest,
   size_t destOffset, const void *src, size_t length);

size_t chunkedBufferRead(void *dest, const ChunkedBuffer *src,
   size_t srcOffset, size_t length);

#endif
