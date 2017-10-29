/** ***************************************************************************
* @file
* @author Mike Sharkey <mike@pikeaero.com>.
* @copyright © 2005-2013 by Pike Aerospace Research Corporation
* @copyright © 2014-2017 by Mike Sharkey
* @details This file is part of CARIBOU RTOS
* CARIBOU RTOS is free software: you can redistribute it and/or modify
* it under the terms of the Beerware License Version 43.
* "THE BEER-WARE LICENSE" (Revision 43):
* Mike Sharkey <mike@pikeaero.com> wrote this file. 
* As long as you retain this notice you can do whatever you want with
* this stuff. If we meet some day, and you think this stuff is 
* worth it, you can buy me a beer in return ~ Mike Sharkey
******************************************************************************/
#ifndef CARIBOUWATCHDOG_H
#define CARIBOUWATCHDOG_H

#include <caribou/kernel/types.h>
#include <caribou/lib/mutex.h>
#include <caribou/kernel/timer.h>
#include <caribou/kernel/thread.h>

#ifdef __cplusplus
extern "C"
{
#endif

extern void caribou_watchdog_init();
extern bool caribou_watchdog_new(caribou_thread_t* thread);
extern void caribou_watchdog_delete(caribou_thread_t* thread);
extern void caribou_watchdog_feed(caribou_thread_t* thread);
extern void caribou_watchdog_feed_self();

#ifdef __cplusplus
}
#endif

#endif
