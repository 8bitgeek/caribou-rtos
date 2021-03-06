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
#ifndef CARIBOUMUTEX_H
#define CARIBOUMUTEX_H

#include <caribou/kernel/types.h>

#ifdef __cplusplus
extern "C"
{
#endif

typedef uint8_t spinlock_t;

#define	CARIBOU_MUTEX_F_NOYIELD		0x01	/* disable mutex yield on lock wait */
#define	CARIBOU_MUTEX_F_RECURSIVE	0x02	/* the mutex is recursive within it's owner's thread */

typedef struct
{
	void*		thread;
	uint16_t	locks;
	uint8_t		flags;
} caribou_mutex_t;

#define CARIBOU_MUTEX_DECL(x) caribou_mutex_t x={NULL,0,0}
#define CARIBOU_MUTEX_DECL_F(x,F) caribou_mutex_t x={NULL,0,F}
#define CARIBOU_MUTEX_INIT(thread,flags) {thread,0,flags}

extern caribou_mutex_t*	caribou_mutex_new(uint8_t flags);
extern void				caribou_mutex_init(caribou_mutex_t* mutex,uint8_t flags);
extern void				caribou_mutex_free(caribou_mutex_t* mutex);
extern bool				caribou_mutex_lock(caribou_mutex_t* mutex,uint32_t timeout);
extern bool				caribou_mutex_trylock(caribou_mutex_t* mutex);
extern bool				caribou_mutex_unlock(caribou_mutex_t* mutex);
extern uint16_t			caribou_mutex_locks(caribou_mutex_t* mutex);
extern uint8_t			caribou_mutex_flags(caribou_mutex_t* mutex);
extern void				caribou_mutex_set_flags(caribou_mutex_t* mutex,uint8_t flags);

#ifdef __cplusplus
}
#endif


#endif /* CARIBOUMUTEX_H */

