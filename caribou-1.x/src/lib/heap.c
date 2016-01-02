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
#include <caribou/kernel/swi.h>
#include <caribou/lib/bitmap_heap.h>

/**
 * notify memory allocated
 */
#if !defined(__DOXYGEN__)
__attribute__((weak))
#endif
void notify_heap_alloc(int16_t blocks)
{
}

/**
 * notify memory free'd
 */
#if !defined(__DOXYGEN__)
__attribute__((weak))
#endif
void notify_heap_dealloc(int16_t blocks)
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
** malloc()  allocates  size bytes and returns a pointer to the allocated memory.  The memory is not cleared.  If size is 0, then
** malloc() returns either NULL, or a unique pointer value that can later be successfully passed to free().
*/
extern void* malloc(size_t size)
{
	return caribou_heap_malloc(size);
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
	return caribou_heap_realloc(pointer,size);
}

/**
 ** The  calloc()  function allocates memory for an array of nmemb elements of size bytes each and returns a pointer to the
 ** allocated memory.  The memory is set to zero.  If nmemb or size is 0, then calloc() returns either NULL,  or  a  unique
 ** pointer value that can later be successfully passed to free().
 */
extern void* calloc(size_t nmemb, size_t size)
{
	return caribou_heap_calloc(nmemb,size);
}

/**
** free() frees the memory space pointed to by ptr, which must have been returned by a previous call  to  malloc() or
** realloc().   Otherwise,  or if free(ptr) has already been called before, undefined behavior occurs.  If ptr is NULL, no opera‐
** tion is performed.
*/
extern void free(void* pointer)
{
	caribou_heap_free(pointer);
}

/**
 * ******************* SWI-based heap operations ********************
 */

/**
* @brief Initialize memory.
*/
void caribou_heap_init(void* heap_base, void* heap_end)
{
	kcall_heap_init_t rc;
	rc.heap_base = heap_base;
	rc.heap_end = heap_end;
	kcall(KCALL_HEAP_INIT,&rc);
}

/**
** @brief the number of bytes per block
*/
size_t caribou_heap_block_size()
{
	size_t rc;
	kcall(KCALL_HEAP_BLOCK_SIZE,&rc);
	return rc;
}

/**
** @brief total up all the blocks used.
*/
size_t caribou_heap_blocks_allocated()
{
	size_t rc;
	kcall(KCALL_HEAP_BLOCKS_ALLOCATED,&rc);
	return rc;
}

size_t caribou_heap_bytes_used()
{
	size_t rc;
	kcall(KCALL_HEAP_BYTES_USED,&rc);
	return rc;
}

size_t caribou_heap_bytes_free()
{
	size_t rc;
	kcall(KCALL_HEAP_BYTES_FREE,&rc);
	return rc;
}


size_t caribou_heap_sizeof(void* p)
{
	kcall_heap_t rc;
	rc.p = p;
	rc.size=0;
	rc.nmemb=0;
	kcall(KCALL_HEAP_SIZEOF,&rc);
	return rc.size;
}

/**
** caribou_heap_malloc()  allocates  size bytes and returns a pointer to the allocated memory.  The memory is not cleared.  If size is 0, then
** caribou_heap_malloc() returns either NULL, or a unique pointer value that can later be successfully passed to free().
*/
extern void* caribou_heap_malloc(size_t sz)
{
	kcall_heap_t rc;
	rc.size = sz;
	rc.p = NULL;
	kcall(KCALL_HEAP_MALLOC,&rc);
	return rc.p;
}

/**
** caribou_heap_realloc() changes the size of the memory block pointed to by ptr to size bytes.  The contents will be unchanged to the minimum
** of  the  old and new sizes; newly allocated memory will be uninitialized.  If ptr is NULL, then the call is equivalent to caribou_malloc(size), for all values of size; if size is equal to zero, and ptr is not NULL, then the call is  equivalent  to  free(ptr).
** Unless  ptr is NULL, it must have been returned by an earlier call to caribou_heap_malloc() or caribou_heap_realloc().  If the area pointed to
** was moved, a caribou_heap_free(ptr) is done.
*/
extern void* caribou_heap_realloc(void* p, size_t sz)
{
	kcall_heap_t rc;
	rc.size = sz;
	rc.p = p;
	kcall(KCALL_HEAP_REALLOC,&rc);
	return rc.p;
}

/**
 ** The  caribou_heap_calloc()  function allocates memory for an array of nmemb elements of size bytes each and returns a pointer to the
 ** allocated memory.  The memory is set to zero.  If nmemb or size is 0, then caribou_heap_calloc() returns either NULL,  or  a  unique
 ** pointer value that can later be successfully passed to caribou_heap_free().
 */
extern void* caribou_heap_calloc(size_t nmemb, size_t sz)
{
	kcall_heap_t rc;
	rc.nmemb = nmemb;
	rc.size = sz;
	rc.p = NULL;
	kcall(KCALL_HEAP_CALLOC,&rc);
	return rc.p;
}

/**
** caribou_heap_free() frees the memory space pointed to by ptr, which must have been returned by a previous call  to  caribou_heap_malloc() or
** realloc().   Otherwise,  or if caribou_free(ptr) has already been called before, undefined behavior occurs.  If ptr is NULL, no opera‐
** tion is performed.
*/
extern void caribou_heap_free(void* p)
{
	kcall_heap_t rc;
	rc.size = 0;
	rc.p = p;
	kcall(KCALL_HEAP_FREE,&rc);
}
