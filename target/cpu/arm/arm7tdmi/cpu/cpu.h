/*
   _________    ____  ________  ____  __  __   ____  __________  _____
  / ____/   |  / __ \/  _/ __ )/ __ \/ / / /  / __ \/_  __/ __ \/ ___/
 / /   / /| | / /_/ // // __  / / / / / / /  / /_/ / / / / / / /\__ \ 
/ /___/ ___ |/ _, _// // /_/ / /_/ / /_/ /  / _, _/ / / / /_/ /___/ / 
\____/_/  |_/_/ |_/___/_____/\____/\____/  /_/ |_| /_/  \____//____/  
                                                                      

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
#ifndef _CARIBOU_CPU_ARM_ARM7TDMI_H_
#define _CARIBOU_CPU_ARM_ARM7TDMI_H_

#define MAIN_RETURN 			0xFFFFFFF9  //Tells the handler to return using the MSP
#define THREAD_RETURN 			0xFFFFFFFD	//Tells the handler to return using the PSP
#define INITIAL_PC_OFFSET		0
#define DEFAULT_PSR 			0x0000001F	

typedef uint32_t cpu_reg_t;

/**
 * This defines the stack frame that is saved on the PSP (process stack) by a context switch.
 */
typedef struct
{
	cpu_reg_t	r0;
	cpu_reg_t	r1;
	cpu_reg_t	r2;
	cpu_reg_t	r3;
	cpu_reg_t	r4;
	cpu_reg_t	r5;
	cpu_reg_t	r6;
	cpu_reg_t	r7;
	cpu_reg_t	r8;
	cpu_reg_t	r9;
	cpu_reg_t	r10;
	cpu_reg_t	r11;
	cpu_reg_t	r12;
	cpu_reg_t	lr;
	cpu_reg_t	psr;
	cpu_reg_t	pc;
} hw_stack_frame_t;

//This defines the stack frame that must be saved by the software
typedef struct
{
} sw_stack_frame_t;

typedef struct
{
	sw_stack_frame_t	sw_stack;
	hw_stack_frame_t	hw_stack;
} cpu_state_t __attribute__((packed));

#define cpu_systick_enter()
#define save_context()
#define load_context()
#define cpu_systick_exit() __asm(	"	ldmfd		sp!,{pc}						\n" )

#define systick_enter()		cpu_systick_enter()
#define systick_exit()		cpu_systick_exit()


extern void		wr_thread_stack_ptr(void* sp);
extern void*	rd_thread_stack_ptr(void);

//This reads the Stacked PC from the PSP stack so that it can be stored in the thread table
static void* rd_thread_stacked_pc(void)
{
	cpu_state_t* frame = (cpu_state_t*)rd_thread_stack_ptr();
	return (void*)(frame->hw_stack.lr);	
}


#endif