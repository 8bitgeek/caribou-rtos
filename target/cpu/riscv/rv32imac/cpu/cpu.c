/*
   _________    ____  ________  ____  __  __   ____  __________  _____
  / ____/   |  / __ \/  _/ __ )/ __ \/ / / /  / __ \/_  __/ __ \/ ___/
 / /   / /| | / /_/ // // __  / / / / / / /  / /_/ / / / / / / /\__ \ 
/ /___/ ___ |/ _, _// // /_/ / /_/ / /_/ /  / _, _/ / / / /_/ /___/ / 
\____/_/  |_/_/ |_/___/_____/\____/\____/  /_/ |_| /_/  \____//____/  
                                                                      

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
#include <cpu/cpu.h>

#include "cpu.h"

extern void* __attribute__((naked)) rd_thread_stack_ptr(void)
{
	__asm ( " mv 	a0, sp			\n"
			" ret   		\n" );
	return 0;
}

extern cpu_reg_t atomic_acquire(cpu_reg_t* lock)
{
	__asm ( "   li              a0,1                \n"
            "   amoswap.w.aq    a0, a0, (%0)        \n"
            "   xori            a0,a0,1             \n"
			"   ret   		                        \n" 
            :
            : "r" (lock)
            : "a0"
            );
	return 0; /* suppress warning */
}

extern void atomic_release(cpu_reg_t* lock)
{
	__asm ( "   li              a0,0                \n"
            "   amoswap.w.aq    a0, a0, (%0)        \n"
            : 
            : "r" (lock)
            : "a0"
            );
}

extern void cpu_int_enable(void)
{
    set_csr( mstatus, MSTATUS_MIE );
}

extern cpu_reg_t cpu_int_disable(void)
{
    int int_state = cpu_int_enabled();
    clear_csr( mstatus, MSTATUS_MIE );
    return int_state;
}

extern cpu_reg_t cpu_int_enabled(void)
{
    return ( read_csr( mstatus ) & MSTATUS_MIE );
}

extern void cpu_int_set(cpu_reg_t enable)
{
    if (enable)
        cpu_int_enable(); 
    else 
        cpu_int_disable();
}
