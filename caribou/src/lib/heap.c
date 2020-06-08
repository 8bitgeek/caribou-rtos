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
#include <caribou/lib/heap.h>
#include <caribou/lib/string.h>
#include <caribou/lib/mutex.h>

#define	ALL_BITS					0xFFFFFFFF
#if !defined(HEAP_BLOCK_SIZE)
	#define	HEAP_BLOCK_SIZE			32				/** The allocation block size in bytes */
#endif
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

static int32_t locate_free(caribou_heap_state_t* heap_state, int32_t blocks);
static void* allocate(caribou_heap_state_t* heap_state, register int32_t block, register int32_t blocks);

#if CARIBOU_HEAP_MUTEX
#if PRODUCT_HEAP_DEBUG
	CARIBOU_MUTEX_DECL_F(malloc_mutex,CARIBOU_MUTEX_F_RECURSIVE);
#else
	CARIBOU_MUTEX_DECL_F(malloc_mutex,CARIBOU_MUTEX_F_NOYIELD);
#endif
#define CARIBOU_MALLOC_LOCK()	caribou_mutex_lock(&malloc_mutex,0);
#define CARIBOU_MALLOC_UNLOCK()	caribou_mutex_unlock(&malloc_mutex);
#else
#define CARIBOU_MALLOC_LOCK()	caribou_thread_lock();
#define CARIBOU_MALLOC_UNLOCK()	caribou_thread_unlock();
#endif

//#define BITMAP_HEAP_DEBUG	1
#if PRODUCT_HEAP_DEBUG
	#include <caribou/lib/stdio.h>
	void* product_heap_debug=NULL;
	int product_heap_debug_bytes=0;
	caribou_mutex_t* heap_mutex()
	{
		return (&malloc_mutex);
	}
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
	if ( pointer )
	{
		for(;;);
	}
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

#if !defined(CARIBOU_NULL_HEAP)

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
	 * @brief Stack heap state (leaving as public symbol for debugging).
	 * @brief Multiple heap pools to support non-contiguous RAM
	 */
	caribou_heap_state_t caribou_heap_state[CARIBOU_NUMHEAPS];
	static int heap_count=0;	/* Number of initialized heaps */
	static int heap_num=0;		/* The current heap to operate in */
	#define HEAP_STATE(heap_num) (&caribou_heap_state[heap_num])

	/**
	* @brief Initialize an area of memory for heap use.
	* @param heap_base A pointer to the base physical address of the heap memory area.
	* @param heap_end A pointer to the last word (32-bits aligned) of the heap memory area.
	* @return void 
	*/
	void caribou_heap_init(void* heap_base, void* heap_end)
	{
		uint32_t heap_size;         /** The size of the heap memory area in bytes after subtracting the bitmap overhead */
		uint32_t heapSegmentSize;
		uint32_t pageWords;

		/* Initialize the index */
		#if CARIBOU_HEAP_MUTEX
			caribou_mutex_set_flags(&malloc_mutex,CARIBOU_MUTEX_F_RECURSIVE | CARIBOU_MUTEX_F_NOYIELD);
	    #endif

		CARIBOU_MALLOC_LOCK();
		
		++heap_count; heap_num=heap_count-1;
		while(heap_count>CARIBOU_NUMHEAPS); /* FIXME - trap too-many-heaps error */

		/** Initialize the parameters based on the linkage map */
		memset(HEAP_STATE(heap_num),0,sizeof(caribou_heap_state_t));

	    /** Calculate the total heap bytes and the number of pages required to map it */
		heapSegmentSize = (uint32_t)heap_end - (uint32_t)heap_base;
		pageWords = (heapSegmentSize/HEAP_BYTES_PER_PAGE);

	    /** Calculate the size of the heap free memory (in blocks) after subtracting the size of the bitmap overhead */
		heap_size = heapSegmentSize - ((pageWords*2)*sizeof(uint32_t));
		HEAP_STATE(heap_num)->heap_blocks = (heap_size / HEAP_BLOCK_SIZE);

	    /** Calculate the bitmap sizes and offsets */
		HEAP_STATE(heap_num)->heap_bitmap_size = HEAP_STATE(heap_num)->heap_blocks / HEAP_BLOCKS_PER_PAGE * sizeof(uint32_t);
		HEAP_STATE(heap_num)->heap_free_bitmap = (uint32_t*)(heap_base);
		HEAP_STATE(heap_num)->heap_last_bitmap = (uint32_t*)((uint32_t)heap_base+(pageWords*sizeof(uint32_t)));
		HEAP_STATE(heap_num)->heap_area = (uint8_t*)((uint32_t)heap_base+((pageWords*2)*sizeof(uint32_t)));

	    /** Initialize the memory areas */
	    #if defined(CARIBOU_ZERO_FILL_HEAP)
	        memset(HEAP_STATE(heap_num)->heap_area,0,heap_size);
	    #endif
		memset(HEAP_STATE(heap_num)->heap_free_bitmap,0,HEAP_STATE(heap_num)->heap_bitmap_size);
		memset(HEAP_STATE(heap_num)->heap_last_bitmap,0,HEAP_STATE(heap_num)->heap_bitmap_size);

	    CARIBOU_MALLOC_UNLOCK();
	}

	/**
	** @brief the number of bytes per block
	*/
	extern int32_t caribou_heap_block_size()
	{
		return HEAP_BLOCK_SIZE;
	}

	/**
	** @brief total up all the blocks used.
	*/
	extern int32_t caribou_heap_blocks_allocated()
	{
		int32_t rc=0;
		CARIBOU_MALLOC_LOCK();
		/** Search each heap... */
		for(heap_num=0; heap_num < heap_count; heap_num++)
		{
			rc += HEAP_STATE(heap_num)->heap_blocks_allocated;
		}
		CARIBOU_MALLOC_UNLOCK();
		return rc;
	}

	/**
	 * @return The number of bytes used on the current heap.
	 */
	extern int32_t caribou_heap_bytes_used()
	{
		int32_t rc = heap_blocks_allocated()*HEAP_BLOCK_SIZE;
		return rc;
	}

	/**
	 * @return The number of bytes free on the current heap.
	 */
	extern int32_t caribou_heap_bytes_free()
	{
		int32_t rc = 0;
		int32_t heap_blocks=0;
	    
		/** Search each heap... */
		CARIBOU_MALLOC_LOCK();
		for(heap_num=0; heap_num < heap_count; heap_num++)
		{
			heap_blocks += HEAP_STATE(heap_num)->heap_blocks;
		}
		rc += (heap_blocks-heap_blocks_allocated())*HEAP_BLOCK_SIZE;
		CARIBOU_MALLOC_UNLOCK();
		return rc;
	}

	/**
	 * @brief Lookup a single bit representing a single block, and return the bit state state as a boolean.
	 * @param heap_state Pointer to the heap state related to the heap to use.
	 * @param block The block index to look up.
	 * @param map The bitmap in which to lookup the bit in question.
	 * @return A boolean representative of the state of the bit.
	 */
	static bool get_bitmap_bit(caribou_heap_state_t* heap_state,int32_t block,uint32_t map[])
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
	static void set_bitmap_bit(caribou_heap_state_t* heap_state,int32_t block,uint32_t map[],bool state)
	{
		if ( valid(heap_state,block) )
		{
			int32_t bitOffset = bit_offset(block);
			int32_t wordOffset = block_offset(block);
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
	static bool is_free_sequence(caribou_heap_state_t* heap_state, int32_t block, int32_t blocks)
	{
		register int32_t n;
		register int32_t size = block+blocks;
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
	 * @brief Find the starting block for the heap. Taking into account memory which has been
	 * claimed by MPU protected threads.
	 * @param blocks Return the number of blocks.
	 * @return Starting block number.
	 */
	static int32_t block_range(caribou_heap_state_t* heap_state, int32_t* blocks)
	{
		int32_t rc = 0;
		*blocks = heap_state->heap_blocks;
		return rc;
	}

	/**
	 * @brief Locate blocks of contiguous free space of a given amount.
	 * @param blocks The number of contiguous blocks to search for.
	 * @return The index of the first block of the contiguous free memory, or -1 if not found.
	 */
	static int32_t locate_free(caribou_heap_state_t* heap_state, int32_t blocks)
	{
		register int32_t n;
		int32_t heap_blocks;
		register int32_t block=block_range(heap_state,&heap_blocks);
		register uint32_t page=0;
		while(block < heap_blocks)
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
	static int32_t blocks_used(caribou_heap_state_t* heap_state,int32_t block)
	{
		int32_t used=0;
		if(valid(heap_state,block))
		{
			while( block+used < heap_state->heap_blocks && !isLast(heap_state,block+(used++))) 
			{
			}
		}
		return used;
	}

	/**
	 * @brief Convert a heap memory pointer into a block offset.
	 * @param heap_state Pointer to the heap state related to the heap to use.
	 * @param pointer A memory pointer to a location within the heap memory.
	 * @return The block offset index, or -1 if the block is not found to be a pointer to valid heap block.
	 */
	static int32_t from_pointer(caribou_heap_state_t* heap_state,void* pointer)
	{
		if (pointer!=NULL)
		{
			int32_t block = ((uint32_t)pointer - (uint32_t)heap_state->heap_area) / HEAP_BLOCK_SIZE;
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
	static void* to_pointer(caribou_heap_state_t* heap_state,int32_t block)
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
	static void* allocate(caribou_heap_state_t* heap_state, register int32_t block, register int32_t blocks)
	{
		void* pointer=NULL;
		if ( valid(heap_state,block) )
		{
			for(register int32_t n=0; n < blocks; n++)					/* flag blocks in use... */
			{
				set(heap_state,block+n);
				resetLast(heap_state,block+n);
	            ++heap_state->heap_blocks_allocated;
			}
			setLast(heap_state,(block+blocks)-1);
			pointer = to_pointer(heap_state,block);		/* fetch the base pointer */
			notify_heap_alloc(blocks);
		}
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
	static bool deallocate(caribou_heap_state_t* heap_state, register int32_t block, register int32_t blocks)
	{
		if ( valid(heap_state,block) )
		{
			for(register uint32_t n=0; n < blocks; n++)			/* mark blocks free... */
			{
				reset(heap_state,block+n);
				resetLast(heap_state,block+n);
	            if ( --heap_state->heap_blocks_allocated < 0 )
					for(;;);
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
	static bool can_extend(caribou_heap_state_t* heap_state, int32_t block, int32_t used, int32_t blocks)
	{
		register int32_t n;
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
	static bool extend(caribou_heap_state_t* heap_state, int32_t block, int32_t used, int32_t blocks)
	{
		register int32_t n;
		bool rc=false;
		if ( can_extend(heap_state,block,used,blocks) )
		{
			uint32_t total = used+blocks;
			for(n=0; n < total; n++)
			{
				if (n == total-1)
					setLast(heap_state,block+n);
				else
					resetLast(heap_state,block+n);
				set(heap_state,block+n);
			}
	        heap_state->heap_blocks_allocated += blocks;
			rc=true;
		}
		return rc;
	}

	/**
	 ** @brief Return the size of memory associated with pointer.
	 */
	extern size_t caribou_heap_sizeof(void* pointer)
	{
		size_t rc=0;
		if ( pointer )
		{
			CARIBOU_MALLOC_LOCK();
			for(heap_num=0; heap_num < heap_count; heap_num++)
			{
				int32_t block;
				block = from_pointer(HEAP_STATE(heap_num),pointer);
				if ( block >= 0 )
				{
					rc = blocks_used(HEAP_STATE(heap_num),block) * HEAP_BLOCK_SIZE;
					break;
				}
			}
			CARIBOU_MALLOC_UNLOCK();
		}
		return rc;
	}

	/**
	** malloc()  allocates  size bytes and returns a pointer to the allocated memory.  The memory is not cleared.  If size is 0, then
	** malloc() returns either NULL, or a unique pointer value that can later be successfully passed to free().
	*/
	extern void* caribou_heap_malloc(size_t size)
	{
		void* pointer = NULL;
		if ( size > 0 )
		{
			int32_t blocks = to_blocks(size);
			int32_t block;

			/** Search each heap... */
			CARIBOU_MALLOC_LOCK()
			for(heap_num=0; heap_num < heap_count; heap_num++)
			{
				block = locate_free(HEAP_STATE(heap_num),blocks);
				if ( block >= 0 )
				{
					pointer = allocate(HEAP_STATE(heap_num),block,blocks);
					break;
				}
			}
			if ( pointer == NULL )
			{
				notify_heap_alloc_failed(size);
			}
			CARIBOU_MALLOC_UNLOCK();
		}
		#if defined(CARIBOU_CLEAR_HEAP_MALLOC)
			if ( pointer )
				memset(pointer,0,size);
		#endif
		return pointer;
	}

	/**
	** realloc() changes the size of the memory block pointed to by ptr to size bytes.  The contents will be unchanged to the minimum
	** of  the  old and new sizes; newly allocated memory will be uninitialized.  If ptr is NULL, then the call is equivalent to mal‐
	** loc(size), for all values of size; if size is equal to zero, and ptr is not NULL, then the call is  equivalent  to  free(ptr).
	** Unless  ptr is NULL, it must have been returned by an earlier call to malloc() or realloc().  If the area pointed to
	** was moved, a free(ptr) is done.
	*/
	extern void* caribou_heap_realloc(void* pointer, size_t size)
	{
		#if PRODUCT_HEAP_DEBUG
			size_t debug_realloc_size_in = heap_sizeof(pointer);
		#endif
		if (pointer != NULL && size > 0 )
		{
			int32_t blocks = to_blocks(size);
			int32_t block=(-1);
			int32_t used;
			CARIBOU_MALLOC_LOCK();
			/** Search each heap... */
			for(heap_num=0; heap_num < heap_count; heap_num++)
			{
				block = from_pointer(HEAP_STATE(heap_num),pointer);
				if ( block >= 0 )
					break;
			}
			if ( block >= 0 )
			{
				used = blocks_used(HEAP_STATE(heap_num),block);
				if (blocks > used)
				{
					if (!extend(HEAP_STATE(heap_num),block,used,blocks-used))         /* attempt to extend existing block */
					{
						int32_t target;
						deallocate(HEAP_STATE(heap_num),block,used);                  /* make currently allocated blocks available to be re-allocated.. */
						target = locate_free(HEAP_STATE(heap_num),blocks);            /* ...then attempts to locate a sequence of free blocks... */
						if (target >= 0 )
						{
							void* pTarget = allocate(HEAP_STATE(heap_num),target,blocks);	/* allocate the new blocks... */
							memcpy(pTarget,pointer,used*HEAP_BLOCK_SIZE);				/* ...and move the data to the new area. */
							//memmove(pTarget,pointer,used*HEAP_BLOCK_SIZE);			/* ...and move the data to the new area. */
							pointer = pTarget;
						}
						else
						{
							/* 
							 * The re-allocation failed in the current heap pool. 
							 * It may be possible to get a fit in another pool. 
							 */
							void* pTarget;
							if ( (pTarget = caribou_heap_malloc(size)) != NULL )
							{
								memcpy(pTarget,pointer,used*HEAP_BLOCK_SIZE);
								//memmove(pTarget,pointer,used*HEAP_BLOCK_SIZE);
								pointer = pTarget;
							}
							else
							{
								notify_heap_invalid_realloc(pointer,size);
								pointer = NULL;
							}
						}
					}
				}
				else if (blocks < used)
				{
					/* shrink the allocation */
					deallocate(HEAP_STATE(heap_num),block,used);
					allocate(HEAP_STATE(heap_num),block,blocks);
				}
			}
			else
			{
				notify_heap_invalid_realloc(pointer,size);
				pointer = NULL;
			}
			CARIBOU_MALLOC_UNLOCK();
		}
		else if (pointer != NULL && size == 0)
		{
			caribou_heap_free(pointer);
			pointer=NULL;
		}
		else if (pointer == NULL )
		{
			pointer = caribou_heap_malloc(size);
		}
		return pointer;
	}

	/**
	 ** @brief The calloc() function allocates memory for an array of nmemb elements of size bytes each and returns a pointer to the
	 ** allocated memory.  The memory is set to zero.  If nmemb or size is 0, then calloc() returns either NULL,  or  a  unique
	 ** pointer value that can later be successfully passed to free().
	 */
	extern void* caribou_heap_calloc(size_t nmemb, size_t size)
	{
	    size_t bytes = nmemb*size;
		void* pointer = caribou_heap_malloc(bytes);
	    if ( pointer )
	    {
	        memset(pointer,0,bytes);
	    }
		return pointer;
	}

	/**
	** free() frees the memory space pointed to by ptr, which must have been returned by a previous call  to  malloc() or
	** realloc().   Otherwise,  or if free(ptr) has already been called before, undefined behavior occurs.  If ptr is NULL, no opera‐
	** tion is performed.
	*/
	extern void caribou_heap_free(void* pointer)
	{
		int32_t block=(-1);
		int32_t used;
		CARIBOU_MALLOC_LOCK();
		/** Search each heap... */
		for(heap_num=0; heap_num < heap_count; heap_num++)
		{
			if ( (block = from_pointer(HEAP_STATE(heap_num),pointer)) >= 0 )
			{
	        	used = blocks_used(HEAP_STATE(heap_num),block);
				deallocate(HEAP_STATE(heap_num),block,used);
				break;
			}
		}
		if ( block < 0 )
		{
			notify_heap_invalid_dealloc(pointer);
		}
		CARIBOU_MALLOC_UNLOCK();
	}

#else /* CARIBOU_NULL_HEAP */


	void* caribou_heap_malloc(size_t sz)
	{
		return NULL;
	}

	void* caribou_heap_realloc(void* p, size_t sz)
	{
		return NULL;
	}

	void* caribou_heap_calloc(size_t nmemb, size_t size)
	{
		return NULL;
	}

	void  caribou_heap_free(void* p)
	{

	}

	void  caribou_heap_init(void* heap_base, void* heap_end)
	{

	}

	int32_t caribou_heap_block_size(void)
	{
		return 0;
	}

	int32_t caribou_heap_blocks_allocated()
	{
		return 0;
	}

	int32_t caribou_heap_bytes_used()
	{
		return 0;
	}

	int32_t caribou_heap_bytes_free()
	{
		return 0;
	}

	size_t  caribou_heap_sizeof(void* p)
	{
		return 0;
	}

#endif



#if CARIBOU_ANSI_HEAP

	extern void* malloc(size_t sz)                   
	{ 
		caribou_heap_malloc(sz); 
	}

	extern void* realloc(void* p, size_t sz)         
	{ 
		caribou_heap_realloc(p, sz); 
	}

	extern void* calloc(size_t nmemb, size_t size)   
	{ 
		caribou_heap_calloc(nmemb, size); 
	}

	extern void free(void* p)                       
	{ 
		caribou_heap_free(p); 
	}

#endif /* CARIBOU_ANSI_HEAP */
