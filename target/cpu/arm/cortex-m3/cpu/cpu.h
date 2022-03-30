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
#ifndef _CARIBOU_CPU_ARM_CORTEX_M3_H_
#define _CARIBOU_CPU_ARM_CORTEX_M3_H_

#include <caribou/kernel/types.h>

#ifdef __cplusplus
extern "C"
{
#endif

typedef uint32_t cpu_reg_t;

/** 
 * @brief hw_stack_frame_t defines the stack frame that is saved by the hardware
 * when an interrupt is initiated.
 */
typedef struct
{
	uint32_t	r0;
	uint32_t	r1;
	uint32_t	r2;
	uint32_t	r3;
	uint32_t	r12;
	uint32_t	lr;
	uint32_t	pc;
	uint32_t	psr;
} hw_stack_frame_t;

/** 
 * @brief sw_stack_frame_t defines the stack frame that must be saved by the software
 * whenever a context switch occurs.
 */
typedef struct
{
	uint32_t	r4;
	uint32_t	r5;
	uint32_t	r6;
	uint32_t	r7;
	uint32_t	r8;
	uint32_t	r9;
	uint32_t	r10;
	uint32_t	r11;
} sw_stack_frame_t;

/**
 * @brief cpu_state_t defines the complete stack structure which is stored on
 * a per-thread basis.
 */
typedef struct
{
	sw_stack_frame_t	sw_stack;
	hw_stack_frame_t	hw_stack;
} cpu_state_t;

#define INITIAL_PC_OFFSET (0)
#define DEFAULT_PSR 0x21000000

/**
 * @brief cpu_systick_enter() Is called upon a context-switch interrupt entry. 
 * The purpose is to preserve those registers which are not automatically preserved
 * on the PSP by the hardware, as specified by the cpu_state_t structure.
 * The Cortex-M3 preserves those registers specified in the hw_stack_frame_t structure.
 */
#define cpu_systick_enter()				\
	__asm__ __volatile__ (				\
		"	push	{lr}			\n" \
		"	mrs		r0, psp			\n"	\
		"	stmdb	r0!, {r4-r11}	\n"	\
		"	msr		psp, r0			\n"	\
		:								\
		:								\
		: "r0"							\
		)

/**
 * @brief cpu_systick_enter() Is called upon a context-switch interrupt exit. 
 * The purpose is to restore those registers which are not automatically restored
 * from the PSP by the hardware, as specified by the cpu_state_t structure.
 * The Cortex-M3 restores those registers specified in the hw_stack_frame_t structure.
 */
#define cpu_systick_exit()				\
	__asm__ __volatile__ (				\
		"	mrs		r0, psp			\n"	\
		"	ldmfd	r0!, {r4-r11}	\n"	\
		"	msr		psp, r0			\n"	\
		"	pop		{pc}			\n"	\
		:								\
		:								\
		: "r0"							\
		)

/* This writes the PSP so that the thread table stack pointer can be used again */
#define wr_thread_stack_ptr(ptr) __asm__ __volatile__ ( " msr psp, %0\n\t" : : "r" (ptr) )

/* This reads the PSP so that it can be stored in the thread table */
extern void* __attribute__((naked)) rd_thread_stack_ptr(void);

/* Reads the main stack pointer */
extern void* __attribute__((naked)) rd_stack_ptr(void);

/* This reads the Stacked PC from the PSP stack so that it can be stored in the thread table */
extern void* rd_thread_stacked_pc(void);

#ifdef __cplusplus
}
#endif

#endif
