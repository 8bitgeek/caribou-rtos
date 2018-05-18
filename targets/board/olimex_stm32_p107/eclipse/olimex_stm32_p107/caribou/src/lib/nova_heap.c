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

typedef struct heap_tag
{
	struct heap_tag*	next;
	size_t				size;
} heap_t;

static heap_t* heap = NULL;

#define HEAP_BLOCK_SIZE  16   /* Must be a power of two. */
#define ADDADR(x,n)  ((void *)((unsigned char *)(x)+(n)))

/**
* @brief Initialize memory.
*/
void nova_heap_init(void* heap_base, void* heap_end)
{
	heap = (heap_t*)heap_base;
	heap->next=NULL;
	heap->size = ((size_t)heap_end-(size_t)heap_base);
}

/**
 ** The  calloc()  function allocates memory for an array of nmemb elements of size bytes each and returns a pointer to the
 ** allocated memory.  The memory is set to zero.  If nmemb or size is 0, then calloc() returns either NULL,  or  a  unique
 ** pointer value that can later be successfully passed to free().
 */
void* nova_heap_calloc(size_t nmemb, size_t size)
{
	void* rc = malloc(nmemb*size);
	return rc;
}

/**
** malloc()  allocates  size bytes and returns a pointer to the allocated memory.  The memory is not cleared.  If size is 0, then
** malloc() returns either NULL, or a unique pointer value that can later be successfully passed to free().
*/
void* nova_heap_malloc(size_t size)
{          
	heap_t* p;
	heap_t* q;
	heap_t* best;
	uint32_t best_size;    
	
	int lvl = caribou_lib_lock();

	size = (size + sizeof(uint32_t) + HEAP_BLOCK_SIZE-1) & (uint32_t)(-HEAP_BLOCK_SIZE);
	p = heap;
	q = 0;
	best_size = ~0U;
	best = 0;

	while (p)
	{
		if (p->size == size) // done?
		{
			if (q)
			{
				q->next = p->next;
			}
			else
			{
				heap = p->next;
			}
			*((uint32_t *)p) = size;
			caribou_lib_lock_restore(lvl);
			return ((uint8_t *)p) + sizeof(uint32_t);
		}
		else 
		if (p->size > size && p->size < best_size) // split block?
		{
			best = p;
			best_size = p->size;
		}
		/* Consider next block. */
		q = p;
		p = p->next;
	}
	if (best) // split
	{
		best->size -= size;
		p = ADDADR(best, best_size - size);
		*((uint32_t *)p) = size;  
		caribou_lib_lock_restore(lvl);
		return ((char *)p) + sizeof(uint32_t);
	}
	else
	{
		caribou_lib_lock_restore(lvl);
		return NULL;
	}
}

/**
** free() frees the memory space pointed to by ptr, which must have been returned by a previous call  to  malloc() or
** realloc().   Otherwise,  or if free(ptr) has already been called before, undefined behavior occurs.  If ptr is NULL, no opera‐
** tion is performed.
*/
void nova_heap_free(void *addr)
{
	heap_t *p, *rover, *prev;
	unsigned size;  

	if ( addr )
	{
		int lvl = caribou_lib_lock();
		/* Adjust backwards to actual memory block origin. */
		addr = ((char *)addr) - sizeof(unsigned);
		/* Recover size */
		size = *((unsigned *)addr);
		if (addr)
		{
			/* Deallocated onto non-existent heap? */
			if (heap == 0)
			{
				/* Yes, add this floating block to the heap. */
				heap = addr;
				heap->next = 0;
				heap->size = size;
			}
			else
			{
				/* Search for block adjacent to p, but with lower address. */
				p = addr; rover = heap; prev = 0;
				while (rover && rover < (heap_t *)addr)
				{
					prev = rover; rover = rover->next;
				}
				/* Check for double-dispose of a pointer. */
				/* For efficiency, this could be removed. */
				#if 0
					if ((rover = addr) ||
					prev & (DIFADR(addr, ADDADR(prev, prev->size)) < 0))
					HALT(DOUBLEDISPOSE);
					END;
				#endif
				/* Return block to free list */
				p->next = rover;
				p->size = size;
				if (prev)
					prev->next = p;
				else
					heap = p;
				/* See if can join with block to right. */
				if (rover && (ADDADR(p, size) == rover))
				{
					p->size += rover->size;
					p->next = rover->next;
				}
				/* See if can join with block to left. */
				if (prev && ADDADR(prev, prev->size) == p)
				{
					prev->size += p->size;
					prev->next = p->next;
				}
			}
		}
		caribou_lib_lock_restore(lvl);
	}
}

/**
** realloc() changes the size of the memory block pointed to by ptr to size bytes.  The contents will be unchanged to the minimum
** of  the  old and new sizes; newly allocated memory will be uninitialized.  If ptr is NULL, then the call is equivalent to mal‐
** loc(size), for all values of size; if size is equal to zero, and ptr is not NULL, then the call is  equivalent  to  free(ptr).
** Unless  ptr is NULL, it must have been returned by an earlier call to malloc() or realloc().  If the area pointed to
** was moved, a free(ptr) is done.
*/
void* nova_heap_realloc(void *p, size_t size)
{
	void* rc=NULL;
	size_t curr_size = (p != NULL) ? ((uint32_t *)p)[-1] : 0;
	if ( curr_size != size )
	{
		// TODO Test if we really need to do this allocation.
		// TODO AKA modulus CHUNK_SIZE
		rc = malloc(size);
		if ( rc && p )
		{
			memcpy(rc, p, curr_size < size ? curr_size : size );
			free(p);
		}
	}
	return rc;
}
