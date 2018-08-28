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
#ifndef _CARIBOU_KVECTOR_H_
#define _CARIBOU_KVECTOR_H_

#include <caribou/kernel/types.h>
#include <caribou/kernel/timer.h>
#include <caribou/lib/errno.h>
#ifdef __cplusplus
extern "C"
{
#endif

extern int	kvector_install(void* arg);
extern int	kvector_remove(void* arg);
extern int	kvector_remove_all(void* arg);
extern int	kvector_installed(void* arg);
extern int	kvector_enable(void* arg);
extern int	kvector_disable(void* arg);
extern int	kvector_enabled(void* arg);
extern int	kvector_set(void* arg);

extern void	kvector_isr(InterruptVector vector); /* @brief User-land Interrupt Service Routine entry point. */

#ifdef __cplusplus
}
#endif

#endif /* _CARIBOU_KVECTOR_H_ */
