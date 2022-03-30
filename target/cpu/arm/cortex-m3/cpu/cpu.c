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


//This reads the PSP so that it can be stored in the thread table
extern void* __attribute__((naked)) rd_thread_stack_ptr(void)
{
	__asm__ __volatile__ (	" mrs	r0, psp			\n"	\
							" bx	lr				\n" \
							:							\
							:							\
							: "r0"						\
							);
	return (void*)0;
}

//Reads the main stack pointer
extern void* __attribute__((naked)) rd_stack_ptr(void)
{
	__asm__ __volatile__ (	" mrs	r0, msp			\n" \
							" bx	lr				\n" \
							:							\
							:							\
							: "r0"						\
							);
	return (void*)0;
}

//This reads the Stacked PC from the PSP stack so that it can be stored in the thread table
extern void* rd_thread_stacked_pc(void)
{
	cpu_state_t* frame = (cpu_state_t*)rd_thread_stack_ptr();
	return (void*)(frame->hw_stack.lr);	
}

