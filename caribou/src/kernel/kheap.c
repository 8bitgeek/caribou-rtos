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
#include <caribou/kernel/swi.h>
#include <caribou/kernel/kheap.h>

int kheap_malloc(void* arg)
{
	kcall_heap_t* rc = (kcall_heap_t*)arg;
	rc->p = bitmap_heap_malloc(rc->size);
	return 0;
}

int kheap_realloc(void* arg)
{
	kcall_heap_t* rc = (kcall_heap_t*)arg;
	rc->p = bitmap_heap_realloc(rc->p,rc->size);
	return 0;
}

int kheap_calloc(void* arg)
{
	kcall_heap_t* rc = (kcall_heap_t*)arg;
	rc->p = bitmap_heap_calloc(rc->nmemb,rc->size);
	return 0;
}

int kheap_free(void* arg)
{
	kcall_heap_t* rc = (kcall_heap_t*)arg;
	bitmap_heap_free(rc->p);
	rc->size=0;
	rc->p=NULL;
	return 0;
}

int kheap_init(void* arg)
{
	kcall_heap_init_t* rc = (kcall_heap_init_t*)arg;
	bitmap_heap_init(rc->heap_base,rc->heap_end);
	return 0;
}

int kheap_block_size(void* arg)
{
	size_t* rc=(size_t*)arg;
	*rc = bitmap_heap_block_size();
	return 0;
}

int kheap_blocks_allocated(void* arg)
{
	size_t* rc=(size_t*)arg;
	*rc = bitmap_heap_blocks_allocated();
	return 0;
}

int kheap_bytes_used(void *arg)
{
	size_t* rc=(size_t*)arg;
	*rc = bitmap_heap_bytes_used();
	return 0;
}

int kheap_bytes_free(void* arg)
{
	size_t* rc=(size_t*)arg;
	*rc = bitmap_heap_bytes_free();
	return 0;
}

int kheap_sizeof(arg)
{
	kcall_heap_t* rc = (kcall_heap_t*)arg;
	rc->size=bitmap_heap_sizeof(rc->p);
	return 0;
}
