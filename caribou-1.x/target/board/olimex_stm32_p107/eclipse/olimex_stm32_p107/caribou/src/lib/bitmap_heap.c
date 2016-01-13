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
#include <caribou/lib/bitmap_heap.h>
#include <caribou/lib/string.h>

#define	ALL_BITS					0xFFFFFFFF
#define	HEAP_BLOCK_SIZE				16				/** The allocation block size in bytes */
#define HEAP_BLOCKS_PER_PAGE		32				/** Number of blocks per bitmap page */
#define HEAP_BYTES_PER_PAGE			(HEAP_BLOCKS_PER_PAGE * HEAP_BLOCK_SIZE)

#define isFree(heap_state,block)	(!get_bitmap_bit(heap_state,block,heap_state->heap_free_bitmap))
#define	isUsed(heap_state,block)    (get_bitmap_bit(heap_state,block,heap_state->heap_free_bitmap))
#define	set(heap_state,block)		(set_bitmap_bit(heap_state,block,heap_state->heap_free_bitmap,true))
#define	reset(heap_state,block)		(set_bitmap_bit(heap_state,block,heap_state->heap_free_bitmap,false))

#define	isLast(heap_state,block)	(get_bitmap_bit(heap_state,block,heap_state->heap_last_bitmap))
#define	setLast(heap_state,block)	(set_bitmap_bit(heap_state,block,heap_state->heap_last_bitmap,true))
#define	resetLast(heap_state,block)	(set_bitmap_bit(heap_state,block,heap_state->heap_last_bitmap,false))

#define	valid(heap_state,block)		(block >= 0 && block < heap_state->heap_blocks)

#define	bit_offset(block)			(block % HEAP_BLOCKS_PER_PAGE)
#define	block_offset(block)			(block / HEAP_BLOCKS_PER_PAGE)

#define	to_blocks(size)				((size/HEAP_BLOCK_SIZE) + ((size%HEAP_BLOCK_SIZE)?1:0))

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
 * @brief	HEAP segment start.
 * @pre	  The symbol must be aligned to a 32 bits boundary.
 */
extern uint32_t __heap_start__;

/**
 * @brief	HEAP segment end.
 * @pre	  The symbol must be aligned to a 32 bits boundary.
 */
extern uint32_t __heap_end__;

/**
 * @brief For now, stack heap state.
 * @brief Working toward multiple heap pools (for instance; fragmented physical RAM)
 */
heap_state_t static_heap_state;
heap_state_t* heap_state = &static_heap_state;

/**
* @brief Initialize memory.
*/
void bitmap_heap_init(void* heap_base, void* heap_end)
{
	uint32_t heap_size;         /** The size of the heap memory area in bytes after subtracting the bitmap overhead */
	uint32_t heapSegmentSize;
	uint32_t pageWords;

	/** Initialize the parameters based on the linkage map */
	memset(heap_state,0,sizeof(heap_state_t));

    /** Calculate the total heap bytes and the number of pages required to map it */
	heapSegmentSize = (uint32_t)heap_end - (uint32_t)heap_base;
	pageWords = (heapSegmentSize/HEAP_BYTES_PER_PAGE);

    /** Calculate the size of the heap free memory (in blocks) after subtracting the size of the bitmap overhead */
	heap_size = heapSegmentSize - ((pageWords*2)*sizeof(uint32_t));
	heap_state->heap_blocks = (heap_size / HEAP_BLOCK_SIZE);

    /** Calculate the bitmap sizes and offsets */
	heap_state->heap_bitmap_size = heap_state->heap_blocks / HEAP_BLOCKS_PER_PAGE * sizeof(uint32_t);
	heap_state->heap_free_bitmap = (uint32_t*)(heap_base);
	heap_state->heap_last_bitmap = (uint32_t*)((uint32_t)heap_base+(pageWords*sizeof(uint32_t)));
	heap_state->heap_area = (uint8_t*)((uint32_t)heap_base+((pageWords*2)*sizeof(uint32_t)));

    /** Initialize the memory areas */
    #if defined(CARIBOU_ZERO_FILL_HEAP)
        memset(heap_state->heap_area,0,heap_size);
    #endif
	memset(heap_state->heap_free_bitmap,0,heap_state->heap_bitmap_size);
	memset(heap_state->heap_last_bitmap,0,heap_state->heap_bitmap_size);
}

/**
** @brief the number of bytes per block
*/
int16_t bitmap_heap_block_size()
{
	return HEAP_BLOCK_SIZE;
}

/**
** @brief total up all the blocks used.
*/
int16_t bitmap_heap_blocks_allocated()
{
	int16_t n;
	int16_t total=0;
	int16_t block=0;
	while(block < heap_state->heap_blocks )
	{
		uint32_t word = heap_state->heap_free_bitmap[block/HEAP_BLOCKS_PER_PAGE];
		if((word & ALL_BITS) == ALL_BITS)
		{
			total += HEAP_BLOCKS_PER_PAGE;
		}
		else
		{
			for(n=0; n < HEAP_BLOCKS_PER_PAGE; n++)
			{
				total += ((word>>n)&1);
			}
		}
		block += HEAP_BLOCKS_PER_PAGE;
	}
	return total;
}

/**
 * @return The number of bytes used on the current heap.
 */
int32_t bitmap_heap_bytes_used()
{
	return heap_blocks_allocated()*HEAP_BLOCK_SIZE;
}

/**
 * @return The number of bytes free on the current heap.
 */
int32_t bitmap_heap_bytes_free()
{
	return (heap_state->heap_blocks-heap_blocks_allocated())*HEAP_BLOCK_SIZE;
}

/**
 * @brief Lookup a single bit representing a single block, and return the bit state state as a boolean.
 * @param heap_state Pointer to the heap state related to the heap to use.
 * @param block The block index to look up.
 * @param map The bitmap in which to lookup the bit in question.
 * @return A boolean representative of the state of the bit.
 */
static bool get_bitmap_bit(heap_state_t* heap_state,int16_t block,uint32_t map[])
{
	if ( valid(heap_state,block) )
	{
		return (map[block_offset(block)] & (1<<bit_offset(block))) ? true : false;
	}
	return false;
}

/**
 * @brief lookup a bit in the bitmap and set the bit state from a boolean.
 * @param heap_state Pointer to the heap state related to the heap to use.
 * @param block The block index to look up.
 * @param map The bitmap in which to lookup the bit in question.
 * @param state The boolean state to use to set or reset the bit.
 */
static void set_bitmap_bit(heap_state_t* heap_state,int16_t block,uint32_t map[],bool state)
{
	if ( valid(heap_state,block) )
	{
		int16_t bitOffset = bit_offset(block);
		int16_t wordOffset = block_offset(block);
		if (state)
			map[wordOffset] |= (1<<bitOffset);
		else
			map[wordOffset] &= ~(1<<bitOffset);
	}
}

/**
 * @brief determine if a sequence of blocks are free.
 * @param heap_state Pointer to the heap state related to the heap to use.
 * @param block The block index at which to start.
 * @param blocks The number of blocks which to extend.
 */
static bool is_free_sequence(heap_state_t* heap_state, int16_t block, int16_t blocks)
{
	int16_t n;
	int16_t size = block+blocks;
	if ( size < heap_state->heap_blocks )
	{
		for(n=block; n < size; n++)
		{
			if (isUsed(heap_state,n))
			{
				return false;
			}
		}
		return true;
	}
	return false;
}

/**
 * @brief Locate blocks of contiguous free space of a given amount.
 * @param blocks The number of contiguous blocks to search for.
 * @return The index of the first block of the contiguous free memory, or -1 if not found.
 */
static int16_t locate_free(heap_state_t* heap_state, int16_t blocks)
{
	int16_t n;
	int16_t block=0;
	uint32_t page=0;
	while(block < heap_state->heap_blocks)
	{
		page = heap_state->heap_free_bitmap[block_offset(block)];
		if ( ((page & ALL_BITS) != ALL_BITS) )	/* look at 32 blocks at a time... */
		{
			/* out of the next 32 bits, see if we can start the sequence */
			for(n=0; n < HEAP_BLOCKS_PER_PAGE; n++)
			{
				/* try each bit */
				if (is_free_sequence(heap_state,block+n,blocks))
				{
					return block+n;
				}
			}
		}
		block += HEAP_BLOCKS_PER_PAGE;	/* we've looked at 32 blocks, skip past them */
	}
	return -1;
}

/**
 * @brief Count the number of consecutive blocks in use starting at a given block.
 * @param heap_state Pointer to the heap state related to the heap to use.
 * @param block The block index at which to start.
 * @return number of consecutive blocks used.
 */
static int16_t blocks_used(heap_state_t* heap_state,int16_t block)
{
	int16_t used=0;
	if(valid(heap_state,block))
	{
		while( block+used < heap_state->heap_blocks && !isLast(heap_state,block+(used++))) {}
	}
	return used;
}

/**
 * @brief Convert a heap memory pointer into a block offset.
 * @param heap_state Pointer to the heap state related to the heap to use.
 * @param pointer A memory pointer to a location within the heap memory.
 * @return The block offset index, or -1 if the block is not found to be a pointer to valid heap block.
 */
static int16_t from_pointer(heap_state_t* heap_state,void* pointer)
{
	if (pointer!=NULL)
	{
		int16_t block = ((uint32_t)pointer - (uint32_t)heap_state->heap_area)/HEAP_BLOCK_SIZE;
		if ( valid(heap_state,block) )
		{
			return block;
		}
	}
	return -1;
}

/**
* @brief Convert a block offset into a pointer
*/
/**
 * @brief Convert a offset index into a heap memory pointer.
 * @param heap_state Pointer to the heap state related to the heap to use.
 * @param block A block offset index into the heap memory.
 * @return A heap memory pointer, or NULL if the block is not found to be a valid heap block.
 */
static void* to_pointer(heap_state_t* heap_state,int16_t block)
{
	void* pointer=NULL;
	if (valid(heap_state,block))
	{
		pointer = &heap_state->heap_area[block*HEAP_BLOCK_SIZE];
	}
	return pointer;
}

/**
 * @brief Allocate a contiguous range of blocks
 * @brief heap_state Pointer to the heap state related to the heap to use.
 * @brief block The starting block from where to originate the allocation.
 * @brief blocks The number of blocks to allocate.
 * @return A pointer to the first byte of the allocated blocks, or NULL.
 */
static void* allocate(heap_state_t* heap_state, int16_t block, int16_t blocks)
{
	int16_t n;
	void* pointer=NULL;
	if ( valid(heap_state,block) )
	{
		for(n=0; n < blocks; n++)			/* flag blocks in use... */
		{
			if (n == blocks-1)
				setLast(heap_state,block+n);
			else
				resetLast(heap_state,block+n);
			set(heap_state,block+n);
		}
		pointer = to_pointer(heap_state,block);		/* fetch the base pointer */
		notify_heap_alloc(blocks);
	}
	#if defined(CARIBOU_ZERO_HEAP_ALLOC)
		if ( pointer )
		{
			memset(pointer,0,blocks*HEAP_BLOCK_SIZE);
		}
	#endif
	return pointer;
}

/**
 * @brief Deallocate a contiguous range of blocks
 * @param heap_state  Pointer to the heap state related to the heap to use.
 * @param block The block offset from which to being deallocating blocks.
 * @param blocks The number of blocks which to extend.
 * @return Boolean, true on success, else false on failure (invalid range).
 * @note notify_heap_dealloc() callback is activated upon any abnormal condition.
 */
static bool deallocate(heap_state_t* heap_state, int16_t block, int16_t blocks)
{
	uint16_t n;
	if ( valid(heap_state,block) )
	{
		for(n=0; n < blocks; n++)			/* mark blocks free... */
		{
			reset(heap_state,block+n);
			resetLast(heap_state,block+n);
		}
		notify_heap_dealloc(blocks);
		return true;
	}
	return false;
}

/**
 * @brief Test if it is possible to extend an allocation contiguously (are there contiguous free blocks available?).
 * @param heap_state  Pointer to the heap state related to the heap to use.
 * @param block The block index at which to begin.
 * @param used The number of blocks currently allocated or earmarked for allocation.
 * @param blocks The number of blocks which to extend.
 * @return Boolean, true if the required number of contiguous blocks are available, else false.
 */
static bool can_extend(heap_state_t* heap_state, int16_t block, int16_t used, int16_t blocks)
{
	int16_t n;
	bool rc=false;
	if ( valid(heap_state,block) )
	{
		for(n=0; n < blocks; n++)
		{
			if (isUsed(heap_state,block+used+n))
			{
				return rc;
			}
		}
		rc=true;
	}
	return rc;
}

/**
 * @brief Extend a sequence of blocks starting at this block be extended by blocks amount.
 * @param heap_state  Pointer to the heap state related to the heap to use.
 * @param block The block index from which to begin extending
 * @param used The number of blocks currently allocated or earmarked for allocation.
 * @param blocks The number of bocks by which to contiguously extend the allocation.
 * @return Boolean true if the extension was performed, else false
 */
static bool extend(heap_state_t* heap_state, int16_t block, int16_t used, int16_t blocks)
{
	int16_t n;
	bool rc=false;
	if ( can_extend(heap_state,block,used,blocks) )
	{
		uint16_t total = used+blocks;
		for(n=0; n < total; n++)
		{
			if (n == total-1)
				setLast(heap_state,block+n);
			else
				resetLast(heap_state,block+n);
			set(heap_state,block+n);
		}
		rc=true;
	}
	return rc;
}

/**
 ** @brief Return the size of memory associated with pointer.
 */
extern size_t bitmap_heap_sizeof(void* pointer)
{
	size_t rc=0;
	if ( pointer )
	{
		int16_t block;
		int16_t used;
		int lvl = caribou_lib_lock();
		block = from_pointer(heap_state,pointer);
		if ( block >= 0 )
		{
			rc = blocks_used(heap_state,block) * HEAP_BLOCK_SIZE;
		}
	}
	return rc;
}

/**
** malloc()  allocates  size bytes and returns a pointer to the allocated memory.  The memory is not cleared.  If size is 0, then
** malloc() returns either NULL, or a unique pointer value that can later be successfully passed to free().
*/
extern void* bitmap_heap_malloc(size_t size)
{
	void* pointer = NULL;
	if ( size > 0 )
	{
		int16_t blocks = to_blocks(size);
		int16_t block;
		int lvl = caribou_lib_lock();
		{
			block = locate_free(heap_state,blocks);
			if ( block >= 0 )
			{
				pointer = allocate(heap_state,block,blocks);
			}
			else
			{
				notify_heap_alloc_failed(size);
				pointer = NULL;
			}
		}
		caribou_lib_lock_restore(lvl);
	}
	return pointer;
}

/**
** realloc() changes the size of the memory block pointed to by ptr to size bytes.  The contents will be unchanged to the minimum
** of  the  old and new sizes; newly allocated memory will be uninitialized.  If ptr is NULL, then the call is equivalent to mal‐
** loc(size), for all values of size; if size is equal to zero, and ptr is not NULL, then the call is  equivalent  to  free(ptr).
** Unless  ptr is NULL, it must have been returned by an earlier call to malloc() or realloc().  If the area pointed to
** was moved, a free(ptr) is done.
*/
extern void* bitmap_heap_realloc(void* pointer, size_t size)
{
	if (pointer != NULL && size > 0 )
	{
		int16_t blocks = to_blocks(size);
		int16_t block;
		int16_t used;
		int lvl = caribou_lib_lock();
		block = from_pointer(heap_state,pointer);
		if ( block >= 0 )
		{
			used = blocks_used(heap_state,block);
			if (blocks > used)
			{
				if (!extend(heap_state,block,used,blocks-used))         /* attempt to extend existing block */
				{
					int16_t target;
					deallocate(heap_state,block,used);                  /* make currently allocated blocks available to be re-allocated.. */
					target = locate_free(heap_state,blocks);            /* ...then attempts to locate a sequence of free blocks... */
					if (target >= 0 )
					{
						void* pTarget = allocate(heap_state,target,blocks);        /* allocate the new blocks... */
						memmove(pTarget,pointer,used*HEAP_BLOCK_SIZE);      /* ...and move the data to the new area. */
						pointer = pTarget;
					}
					else
					{
						/* The re-allocation failed. The current blocks are already marked free, so just NULL the pointer */
						notify_heap_invalid_realloc(pointer,size);
						pointer = NULL;
					}
				}
			}
			else if (blocks < used)
			{
				/* shrink the allocation */
				deallocate(heap_state,block,used);
				allocate(heap_state,block,blocks);
			}
		}
		else
		{
			notify_heap_invalid_realloc(pointer,size);
			pointer = NULL;
		}
		caribou_lib_lock_restore(lvl);
	}
	else if (pointer != NULL && size == 0)
	{
		bitmap_heap_free(pointer);
		pointer=NULL;
	}
	else if (pointer == NULL )
	{
		pointer = bitmap_heap_malloc(size);
	}
	return pointer;
}

/**
 ** @brief The calloc() function allocates memory for an array of nmemb elements of size bytes each and returns a pointer to the
 ** allocated memory.  The memory is set to zero.  If nmemb or size is 0, then calloc() returns either NULL,  or  a  unique
 ** pointer value that can later be successfully passed to free().
 */
extern void* bitmap_heap_calloc(size_t nmemb, size_t size)
{
    size_t bytes = nmemb*size;
	void* rc = bitmap_heap_malloc(bytes);
    if ( rc )
        memset(rc,0,bytes);
	return rc;
}

/**
** free() frees the memory space pointed to by ptr, which must have been returned by a previous call  to  malloc() or
** realloc().   Otherwise,  or if free(ptr) has already been called before, undefined behavior occurs.  If ptr is NULL, no opera‐
** tion is performed.
*/
extern void bitmap_heap_free(void* pointer)
{
	int16_t block;
	int16_t used;
	int lvl = caribou_lib_lock();
	block = from_pointer(heap_state,pointer);
	if ( block != 0 )
	{
		used = blocks_used(heap_state,block);
		deallocate(heap_state,block,used);
	}
	else
	{
		notify_heap_invalid_dealloc(pointer);
	}
	caribou_lib_lock_restore(lvl);
}
