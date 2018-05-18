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
#ifndef CARIBOUSPINLOCK_H
#define CARIBOUSPINLOCK_H

#include <caribou/kernel/thread.h>
#include <caribou/kernel/types.h>

#ifdef __cplusplus
extern "C"
{
#endif

typedef caribou_thread_t* caribou_spinlock_t;

extern void			caribou_spinlock_init(caribou_spinlock_t* spinlock);
extern bool			caribou_spinlock_lock(caribou_spinlock_t* spinlock);
extern bool			caribou_spinlock_trylock(caribou_spinlock_t* spinlock);
extern bool			caribou_spinlock_unlock(caribou_spinlock_t* spinlock);

#ifdef __cplusplus
}
#endif


#endif
