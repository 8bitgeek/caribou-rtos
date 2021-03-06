#ifndef _BOARD_FAULT_H_
#define _BOARD_FAULT_H_

#include <board.h>

extern void notify_heap_invalid_dealloc ( void* pointer );
extern void notify_heap_invalid_realloc ( void* pointer, size_t size );
extern void notify_heap_alloc_failed 	( size_t size );

#endif
