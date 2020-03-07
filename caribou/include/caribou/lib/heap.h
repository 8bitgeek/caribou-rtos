/*
   _________    ____  ________  ____  __  __   ____  __________  _____
  / ____/   |  / __ \/  _/ __ )/ __ \/ / / /  / __ \/_  __/ __ \/ ___/
 / /   / /| | / /_/ // // __  / / / / / / /  / /_/ / / / / / / /\__ \ 
/ /___/ ___ |/ _, _// // /_/ / /_/ / /_/ /  / _, _/ / / / /_/ /___/ / 
\____/_/  |_/_/ |_/___/_____/\____/\____/  /_/ |_| /_/  \____//____/  
                                                                      

Copyright © 2005-2013 by Pike Aerospace Research Corporation
Copyright © 2014-2015 by Mike Sharkey
Copyleft © 2018 by Mike Sharkey 
mike@pikeaero.com        

This file is part of CARIBOU RTOS

CARIBOU RTOS is free software: you can redistribute it and/or modify
it under the terms of the Beerware License Version 43.

----------------------------------------------------------------------------
"THE BEER-WARE LICENSE" (Revision 43):
<mike@pikeaero.com> wrote this file. As long as you retain this notice you
can do whatever you want with this stuff. If we meet some day, and you think
this stuff is worth it, you can buy me a beer in return ~ Mike Sharkey
---------------------------------------------------------------------------- 

*/
#ifndef CARIBOU_HEAP_H
#define CARIBOU_HEAP_H

#include <caribou_config.h>
#include <caribou/kernel/types.h>
#include <caribou/kernel/thread.h>

#ifdef __cplusplus
extern "C"
{
#endif

#if !defined(CARIBOU_ANSI_HEAP)
    #define CARIBOU_ANSI_HEAP 1
#endif

#if (!defined(CARIBOU_NUMHEAPS) || CARIBOU_NUMHEAPS == 0)
    #define CARIBOU_NUMHEAPS 1
#endif

/** BITMAP_HEAP state variables. */
typedef struct
{
    /** Pointer to the bitmap of free blocks, 0=free, 1=used */
    uint32_t*       heap_free_bitmap;       
        
    /** Pointer to the bitmap marking the last contiguous block in each allocation */
    uint32_t*       heap_last_bitmap;           

    /** The size of each heap bitmap in bytes */
    int32_t         heap_bitmap_size;           

    /** Pointer to the first bytes of the usable heap memory */
    uint8_t*        heap_area;                  

    /** The size of the heap in blocks */
    int32_t         heap_blocks;
        
    /** The number of blocks in use (for fast statistics) */
    int32_t         heap_blocks_allocated;

    /** The mpu heap region flags */
    uint32_t        heap_flags;

} caribou_heap_state_t;

#if !defined(CARIBOU_NULL_HEAP)
    extern caribou_heap_state_t caribou_heap_state[];
#endif

extern void*    caribou_heap_malloc(size_t sz);
extern void*    caribou_heap_realloc(void* p, size_t sz);
extern void*    caribou_heap_calloc(size_t nmemb, size_t size);
extern void     caribou_heap_free(void* p);
extern void     caribou_heap_init(void* heap_base, void* heap_end);
extern int32_t  caribou_heap_block_size(void);
extern int32_t  caribou_heap_blocks_allocated();
extern int32_t  caribou_heap_bytes_used();
extern int32_t  caribou_heap_bytes_free();
extern size_t   caribou_heap_sizeof(void* p);

#if CARIBOU_ANSI_HEAP
    extern void*    malloc(size_t sz);
    extern void*    realloc(void* p, size_t sz);
    extern void*    calloc(size_t nmemb, size_t size);
    extern void     free(void* p);
#endif

#ifdef __cplusplus
}
#endif

#endif /* CARIBOU_HEAP_H */
