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
#ifndef CARIBOU_HEAP_H
#define CARIBOU_HEAP_H

#if !defined(CARIBOU_BITMAP_HEAP) && !defined(CARIBOU_NOVA_HEAP)
    #define CARIBOU_BITMAP_HEAP
#endif

#include <caribou/kernel/types.h>

#ifdef __cplusplus
extern "C"
{
#endif

extern void*	malloc(size_t sz);
extern void*	realloc(void* p, size_t sz);
extern void*	calloc(size_t nmemb, size_t size);
extern void		free(void* p);

extern void		heap_init(void* heap_base, void* heap_end);
extern int32_t	heap_block_size(void);
extern int32_t	heap_blocks_allocated(void);
extern int32_t	heap_bytes_used(void);
extern int32_t	heap_bytes_free(void);
extern size_t	heap_sizeof(void* p);

#ifdef __cplusplus
}
#endif

#endif /* CARIBOU_BITMAP_HEAP_H */
