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
#ifndef __CARIBOU_H__
#define __CARIBOU_H__

/* Board */
#include <caribou_config.h>
#include <board.h>
/* Kernel */
#include <caribou/kernel/types.h>
#include <caribou/kernel/timer.h>
#include <caribou/kernel/thread.h>
#include <caribou/kernel/interrupt.h>
/* Lib */
#include <caribou/lib/bytequeue.h>
#include <caribou/lib/cbmath.h>
#include <caribou/lib/errno.h>
#include <caribou/lib/fault.h>
#include <caribou/lib/heap.h>
#include <caribou/lib/mutex.h>
#include <caribou/lib/queue.h>
#include <caribou/lib/semaphore.h>
#include <caribou/lib/spinlock.h>
#include <caribou/lib/stdarg.h>
#include <caribou/lib/stddef.h>
#include <caribou/lib/stdint.h>
#include <caribou/lib/stdio.h>
#include <caribou/lib/string.h>
/* Dev */
#include <caribou/dev/adc.h>
#include <caribou/dev/gpio.h>
#include <caribou/dev/i2c.h>
#include <caribou/dev/i2s.h>
#include <caribou/dev/spi.h>
#include <caribou/dev/uart.h>

#ifdef __cplusplus
extern "C"
{
#endif

#ifndef __CARIBOU_RTOS__
   #define __CARIBOU_RTOS__
#endif

#define CARIBOU_VERSION		"0.9.9"
#define __CARIBOU_10

#define caribou_preempt()	chip_pend_svc_req()

extern void caribou_exec(void);
extern void caribou_init_clock();
extern void caribou_init(int8_t priority);
extern const char* caribou_version();
/**
 ** @brief A hook to perform early board initialization. 
 ** Static stacks are initialized, BSS is *NOT* initialized at this stage.
 **/
extern void caribou_early_init(void);

/**
 ** @brief A hook to perform late initialization. 
 ** Static stacks, BSS, heap, and static contructors are all initialized at this stage.
 **/
extern void caribou_late_init(void);

#ifdef __cplusplus
}
#endif

#endif
