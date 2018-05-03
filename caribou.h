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
#ifndef __CARIBOU_H__
#define __CARIBOU_H__

/* Board */
#include <caribou_config.h>
#include <board.h>
/* Kernel */
#include <kernel/caribou_types.h>
#include <kernel/caribou_timer.h>
#include <kernel/caribou_thread.h>
#include <kernel/caribou_interrupt.h>
/* Lib */
#include <lib/caribou_bytequeue.h>
#include <lib/caribou_cbmath.h>
#include <lib/caribou_errno.h>
#include <lib/caribou_fault.h>
#include <lib/caribou_heap.h>
#include <lib/caribou_mutex.h>
#include <lib/caribou_qsort.h>
#include <lib/caribou_queue.h>
#include <lib/caribou_rand.h>
#include <lib/caribou_semaphore.h>
#include <lib/caribou_spinlock.h>
#include <lib/caribou_stdarg.h>
#include <lib/caribou_stddef.h>
#include <lib/caribou_stdint.h>
#include <lib/caribou_stdio.h>
#include <lib/caribou_string.h>
/* Dev */
#include <dev/caribou_adc.h>
#include <dev/caribou_gpio.h>
#include <dev/caribou_i2c.h>
#include <dev/caribou_i2s.h>
#include <dev/caribou_spi.h>
#include <dev/caribou_uart.h>

#ifdef __cplusplus
extern "C"
{
#endif

#ifndef __CARIBOU_RTOS__
#define __CARIBOU_RTOS__
#endif

#define CARIBOU_VERSION		"0.9.5"

extern int caribou_lock_state();
extern int caribou_lock();
extern int caribou_unlock();
extern void caribou_lock_set(int state);
extern void caribou_preempt();

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
