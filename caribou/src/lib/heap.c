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
#include <caribou/lib/heap.h>
#if defined(CARIBOU_BITMAP_HEAP)
	#include <caribou/lib/bitmap_heap.h>
#elif defined(CARIBOU_NOVA_HEAP)
	#include <caribou/lib/bitmap_heap.h>
#else
	#error CARIBOU_BITMAP_HEAP or CARIBOU_NOVA_HEAP must be defined.
#endif

/**
 * notify memory allocated
 */
#if !defined(__DOXYGEN__)
__attribute__((weak))
#endif
void notify_heap_alloc(int32_t blocks)
{
}

/**
 * notify memory free'd
 */
#if !defined(__DOXYGEN__)
__attribute__((weak))
#endif
void notify_heap_dealloc(int32_t blocks)
{
}

/**
 * notify invalid free'd
 */
#if !defined(__DOXYGEN__)
__attribute__((weak))
#endif
void notify_heap_invalid_dealloc(void* pointer)
{
	for(;;);
}

/**
 * notify invalid realloc'd
 */
#if !defined(__DOXYGEN__)
__attribute__((weak))
#endif
void notify_heap_invalid_realloc(void* pointer, size_t size)
{
	for(;;);
}

/**
 * notify invalid alloc'd
 */
#if !defined(__DOXYGEN__)
__attribute__((weak))
#endif
void notify_heap_alloc_failed(size_t size)
{
	for(;;);
}

/**
 * @brief	HEAP segment start.
 * @pre	  The symbol must be aligned to a 32 bits boundary.
 */
extern uint32_t __heap_start__;

/**
 * @brief	HEAP segment end.
 * @pre	  The symbol must be aligned to a 32 bits boundary.
 */
extern uint32_t __heap_end__;

#if defined(CARIBOU_BITMAP_HEAP)
	#define	HEAP_INIT				bitmap_heap_init
	#define	HEAP_BLOCK_SIZE			bitmap_heap_block_size
	#define	HEAP_BLOCKS_ALLOCATED	bitmap_heap_blocks_allocated
	#define	HEAP_BYTES_USED			bitmap_heap_bytes_used
	#define	HEAP_BYTES_FREE			bitmap_heap_bytes_free
	#define	HEAP_MALLOC				bitmap_heap_malloc
	#define	HEAP_REALLOC			bitmap_heap_realloc
	#define	HEAP_CALLOC				bitmap_heap_calloc
	#define	HEAP_FREE				bitmap_heap_free
	#define HEAP_SIZEOF				bitmap_heap_sizeof
#elif defined(CARIBOU_NOVA_HEAP)
	#define	HEAP_INIT				nova_heap_init
	#define	HEAP_BLOCK_SIZE			nova_heap_block_size
	#define	HEAP_BLOCKS_ALLOCATED	nova_heap_blocks_allocated
	#define	HEAP_BYTES_USED			nova_heap_bytes_used
	#define	HEAP_BYTES_FREE			nova_heap_bytes_free
	#define	HEAP_MALLOC				nova_heap_malloc
	#define	HEAP_REALLOC			nova_heap_realloc
	#define	HEAP_CALLOC				nova_heap_calloc
	#define	HEAP_FREE				nova_heap_free
	#define	HEAP_SIZEOF				nova_heap_sizeof
#else
	#error CARIBOU_BITMAP_HEAP or CARIBOU_NOVA_HEAP must be defined.
#endif


#if defined(CARIBOU_MPU_ENABLED)
	
	void* heap_init_mpu(void* heap_base, uint8_t mpu_region_size)
	{
		return bitmap_heap_mpu_init(heap_base,mpu_region_size);
	}

    bool heap_mpu_claim(void* claim)
	{
		return bitmap_heap_mpu_claim((heap_claim_t*)claim);
	}

    void* heap_mpu_claim_malloc(void* claim,size_t size)
	{
		return bitmap_heap_mpu_claim_malloc(claim,size);
	}

	void heap_mpu_assign(caribou_thread_t* thread, void* claim)
	{
		bitmap_heap_mpu_assign(thread, (heap_claim_t*)claim);
	}
	
	void heap_mpu_disable()
	{
		bitmap_heap_mpu_disable();
	}

	void heap_mpu_enable()
	{
		bitmap_heap_mpu_enable();
	}

#endif

/**
* @brief Initialize memory.
*/
void heap_init(void* heap_base, void* heap_end)
{
	HEAP_INIT(heap_base,heap_end);
}

/**
** @brief the number of bytes per block
*/
int32_t heap_block_size()
{
	return HEAP_BLOCK_SIZE();
}

/**
** @brief total up all the blocks used.
*/
int32_t heap_blocks_allocated()
{
	return HEAP_BLOCKS_ALLOCATED();
}

int32_t heap_bytes_used()
{
	return HEAP_BYTES_USED();
}

int32_t heap_bytes_free()
{
	return HEAP_BYTES_FREE();
}


size_t	heap_sizeof(void* p)
{
	return HEAP_SIZEOF(p);
}

/**
** malloc()  allocates  size bytes and returns a pointer to the allocated memory.  The memory is not cleared.  If size is 0, then
** malloc() returns either NULL, or a unique pointer value that can later be successfully passed to free().
*/
extern void* malloc(size_t size)
{
	return HEAP_MALLOC(size);
}

/**
** realloc() changes the size of the memory block pointed to by ptr to size bytes.  The contents will be unchanged to the minimum
** of  the  old and new sizes; newly allocated memory will be uninitialized.  If ptr is NULL, then the call is equivalent to mal‐
** loc(size), for all values of size; if size is equal to zero, and ptr is not NULL, then the call is  equivalent  to  free(ptr).
** Unless  ptr is NULL, it must have been returned by an earlier call to malloc() or realloc().  If the area pointed to
** was moved, a free(ptr) is done.
*/
extern void* realloc(void* pointer, size_t size)
{
	return HEAP_REALLOC(pointer,size);
}

/**
 ** The  calloc()  function allocates memory for an array of nmemb elements of size bytes each and returns a pointer to the
 ** allocated memory.  The memory is set to zero.  If nmemb or size is 0, then calloc() returns either NULL,  or  a  unique
 ** pointer value that can later be successfully passed to free().
 */
extern void* calloc(size_t nmemb, size_t size)
{
	return HEAP_CALLOC(nmemb,size);
}

/**
** free() frees the memory space pointed to by ptr, which must have been returned by a previous call  to  malloc() or
** realloc().   Otherwise,  or if free(ptr) has already been called before, undefined behavior occurs.  If ptr is NULL, no opera‐
** tion is performed.
*/
extern void free(void* pointer)
{
	HEAP_FREE(pointer);
}

