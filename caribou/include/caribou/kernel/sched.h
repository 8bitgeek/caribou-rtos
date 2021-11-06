/*
   _________    ____  ________  ____  __  __   ____  __________  _____
  / ____/   |  / __ \/  _/ __ )/ __ \/ / / /  / __ \/_  __/ __ \/ ___/
 / /   / /| | / /_/ // // __  / / / / / / /  / /_/ / / / / / / /\__ \ 
/ /___/ ___ |/ _, _// // /_/ / /_/ / /_/ /  / _, _/ / / / /_/ /___/ / 
\____/_/  |_/_/ |_/___/_____/\____/\____/  /_/ |_| /_/  \____//____/  
                                                                      

Copyright © 2005-2013 by Pike Aerospace Research Corporation
Copyright © 2014-2015 by Mike Sharkey
Copyleft © 2021 by Mike Sharkey 
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
#ifndef _CARIBOU_SCHED_H_
#define _CARIBOU_SCHED_H_

#include <caribou/kernel/types.h>
#include <cpu/cpu.h>
#include <caribou/kernel/stack.h>

#ifdef __cplusplus
extern "C"
{
#endif

   extern void caribou_swap_thread( void );

   #pragma GCC push_options
   #pragma GCC optimize ("Os")

      void inline __attribute__((always_inline)) caribou_thread_schedule( void ) 
      {
         caribou_state.current->sp = (void*)rd_thread_stack_ptr();
         caribou_check_sp( caribou_state.current );
         caribou_swap_thread();
         wr_thread_stack_ptr( caribou_state.current->sp );
      }

   #pragma GCC pop_options

#ifdef __cplusplus
}
#endif

#endif
