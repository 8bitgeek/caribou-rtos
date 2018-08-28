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
#ifndef _CARIBOU_KHEAP_H_
#define _CARIBOU_KHEAP_H_

#include <caribou/kernel/types.h>
#include <caribou/kernel/timer.h>
#include <caribou/lib/errno.h>

#ifdef __cplusplus
extern "C"
{
#endif

extern int kheap_malloc(void* arg);
extern int kheap_realloc(void* arg);
extern int kheap_calloc(void* arg);
extern int kheap_free(void* arg);
extern int kheap_init(void* arg);
extern int kheap_block_size(void* arg);
extern int kheap_blocks_allocated(void* arg);
extern int kheap_bytes_used(void *arg);
extern int kheap_bytes_free(void* arg);
extern int kheap_sizeof(arg);

#ifdef __cplusplus
}
#endif

#endif
