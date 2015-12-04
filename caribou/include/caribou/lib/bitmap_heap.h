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
#ifndef CARIBOU_BITMAP_HEAP_H
#define CARIBOU_BITMAP_HEAP_H

#include <caribou/kernel/types.h>

#ifdef __cplusplus
extern "C"
{
#endif

/** BITMAP_HEAP state variables. */
typedef struct
{
    /** Pointer to the bitmap of free blocks, 0=free, 1=used */
	uint32_t*		heap_free_bitmap;		
        
    /** Pointer to the bitmap marking the last contiguous block in each allocation */
	uint32_t*		heap_last_bitmap;			

    /** The size of each heap bitmap in bytes */
	uint16_t		heap_bitmap_size;			

    /** Pointer to the first bytes of the usable heap memory */
	uint8_t*		heap_area;					

    /** The size of the heap in blocks */
	int32_t			heap_blocks;
		
	/** The number of blocks in use (for fast statistics) */
	int32_t			heap_blocks_allocated;

} heap_state_t;

extern heap_state_t heap_state[];

extern void*	bitmap_heap_malloc(size_t sz);
extern void*	bitmap_heap_realloc(void* p, size_t sz);
extern void*	bitmap_heap_calloc(size_t nmemb, size_t size);
extern void		bitmap_heap_free(void* p);

extern void		bitmap_heap_init(void* heap_base, void* heap_end);
extern int16_t	bitmap_heap_block_size(void);
extern int32_t	bitmap_heap_blocks_allocated();
extern int32_t	bitmap_heap_bytes_used();
extern int32_t	bitmap_heap_bytes_free();
extern size_t	bitmap_heap_sizeof(void* p);

#ifdef __cplusplus
}
#endif

#endif /* CARIBOU_BITMAP_HEAP_H */
