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
#ifndef _CARIBOU_CPU_ARM_CORTEX_M1_H_
#define _CARIBOU_CPU_ARM_CORTEX_M1_H_

#define MAIN_RETURN 	0xFFFFFFF9 	//Tells the handler to return using the MSP
#define THREAD_RETURN 	0xFFFFFFFD	//Tells the handler to return using the PSP

typedef uint32_t cpu_reg_t;

//This defines the stack frame that is saved  by the hardware
typedef struct
{
	cpu_reg_t	r0;
	cpu_reg_t	r1;
	cpu_reg_t	r2;
	cpu_reg_t 	r3;
	cpu_reg_t	r12;
	cpu_reg_t	lr;
	cpu_reg_t	pc;
	cpu_reg_t	psr;
} hw_stack_frame_t;

//This defines the stack frame that must be saved by the software
typedef struct
{
	cpu_reg_t	r4;
	cpu_reg_t	r5;
	cpu_reg_t	r6;
	cpu_reg_t	r7;
	cpu_reg_t	r8;
	cpu_reg_t	r9;
	cpu_reg_t	r10;
	cpu_reg_t	r11;
} sw_stack_frame_t;

#define INITIAL_PC_OFFSET (0)
#define DEFAULT_PSR 0x21000000

// This saves the context on the PSP, the Cortex-M0 pushes the other registers using hardware
// The Cortex-M0 does not have a store-multiple-decsending instruction, so we have to manually
// add the offsets to r0 when pushing onto the stack. In addition, the M0 does not operate on
// multiple registers above r7, so we have to stack all the registers in two steps. Popping is
// pretty normal since the multiple registers are in ascending direction, with the only exception
// that reglist is limited to r0-r7, so it's also a two step process to pop all the registers.
#define cpu_systick_enter() 				\
	__asm (								\
		"	push	{lr}			\n" \
		"	mrs		r0, psp			\n"	\
		"	sub		r0,r0,#16		\n" \
		"	stm		r0!, {r4-r7}	\n"	\
		"	mov		r4,r8			\n" \
		"	mov		r5,r9			\n" \
		"	mov		r6,r10			\n" \
		"	mov		r7,r11			\n" \
		"	sub		r0,r0,#32		\n" \
		"	stm		r0!, {r4-r7}	\n"	\
		"	sub		r0,r0,#16		\n" \
		"	msr		psp, r0			\n"	\
		: 								\
		:								\
		: "r0"							\
		); \
		driver_systick_enter()

//This loads the context from the PSP, the Cortex-M0 loads the other registers using hardware
#define cpu_systick_exit() \
		driver_systick_exit();			\
	__asm (								\
		"	mrs		r0, psp			\n"	\
		"	ldmfd	r0!, {r4-r7}	\n"	\
		"	mov		r11,r7			\n"	\
		"	mov		r10,r6			\n" \
		"	mov		r9,r5			\n" \
		"	mov		r8,r4			\n" \
		"	ldmfd	r0!, {r4-r7}	\n"	\
		"	msr		psp, r0			\n"	\
		"	pop		{pc}			\n"	\
		:								\
		:								\
		: "r0"							\
		)

//This writes the PSP so that the thread table stack pointer can be used again
#define wr_thread_stack_ptr(ptr) __asm ( " msr psp, %0\n\t" : : "r" (ptr) )

//This reads the PSP so that it can be stored in the thread table
static void* __attribute__((naked)) rd_thread_stack_ptr(void)
{
	__asm ( " mrs	r0, psp\n"
			" bx	lr\n" );
}

//Reads the main stack pointer
static void* __attribute__((naked)) rd_stack_ptr(void)
{
	__asm ( " mrs 	r0, msp\n"
			" bx	lr\n" );
}

#endif