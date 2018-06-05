/******************************************************************************
* Copyright © 2005-2013 by Pike Aerospace Research Corporation
* All Rights Reserved
*
*   This file is part of CARIBOU RTOS
*
*   CARIBOU RTOS is free software: you can redistribute it and/or modify
*   it under the terms of the Beerware License Version 43.
*
* ----------------------------------------------------------------------------
* "THE BEER-WARE LICENSE" (Revision 43):
* <mike@pikeaero.com> wrote this file. As long as you retain this notice you
* can do whatever you want with this stuff. If we meet some day, and you think
* this stuff is worth it, you can buy me a beer in return ~ Mike Sharkey
* ----------------------------------------------------------------------------
******************************************************************************/
#ifndef _CARIBOU_CPU_ARM_CORTEX_M7_H_
#define _CARIBOU_CPU_ARM_CORTEX_M7_H_

#include <stm32f7xx.h>
#include <stm32f7xx_hal_cortex.h>
#include <core_cm7.h>

//This defines the stack frame that is saved  by the hardware
typedef struct
{
	uint32_t	r0;
	uint32_t	r1;
	uint32_t	r2;
	uint32_t 	r3;
	uint32_t	r12;
	uint32_t	lr;
	uint32_t	pc;
	uint32_t	psr;
} hw_stack_frame_t __attribute__((packed));

//This defines the stack frame that must be saved by the software
typedef struct
{
	#if defined(ARM_FVP_LAZY_STACKING)
		uint32_t	lr;
	#endif
    /* possible VFP registers S16-S31 here depending on return code (VFP active) */
	uint32_t	r4;
	uint32_t	r5;
	uint32_t	r6;
	uint32_t	r7;
	uint32_t	r8;
	uint32_t	r9;
	uint32_t	r10;
	uint32_t	r11;
} sw_stack_frame_t __attribute__((packed));

typedef struct
{
	sw_stack_frame_t	sw_stack;
	hw_stack_frame_t	hw_stack;
} process_frame_t __attribute__((packed));

#define INITIAL_PC_OFFSET (0)
#define DEFAULT_PSR 0x21000000
#define DEFAULT_EXCEPTION_RETURN	0xfffffffd

#if defined(ARM_FVP_LAZY_STACKING)
	//This saves the context on the PSP, the Cortex-M4 pushes the other registers using hardware
	#define cpu_systick_enter() 			\
		__asm__ __volatile__ (				\
			"	.thumb_func					\n"	\
			"	mrs			r0, psp			\n"	/* get process stack pointer into R1 to use to push regs onto process stack */	\
			"	stmdb		r0!, {r4-r11}	\n"	/* push remainder of CPU register onto process stack */	\
			"	tst			lr, #0x10		\n"	/* Is the VFP in use? */		\
			"	bne			1f				\n"	/* No, we're done pushing */	\
			"	vstmdb		r0!, {s16-s31}	\n"	/* Push the VFP register onto the process stack */		\
			"1:								\n"	/* */ \
			"	stmdb		r0!, {lr}		\n" /* push link register (VFP state) onto process stack */			\
			"	msr			psp, r0			\n"	/* update the process stack pointer */	\
			: 								\
			:								\
			:								\
			)

	//This loads the context from the PSP, the Cortex-M4 loads the other registers using hardware
	#define cpu_systick_exit()				\
		__asm__ __volatile__ (				\
			"	.thumb_func					\n" \
			"	mrs			r0, psp			\n"	/* get the process stack to r0 to restore the registers  */	\
			"	ldmfd		r0!, {lr}		\n" /* restore link (VFP state) from process stack */	\
			"	tst			lr, #0x10		\n"	/* restore the high FP registers if required */	\
			"	bne			1f				\n"	/* */ \
			"	vldmia		r0!, {s16-s31}	\n"	/* */ \
			"1:								\n"	/* */ \
			"	ldmfd		r0!, {r4-r11}	\n"	\
			"	msr			psp, r0			\n"	\
			"	bx			lr				\n" \
			:								\
			:								\
			:								\
			)
#else
	//This saves the context on the PSP, the Cortex-M4 pushes the other registers using hardware
	#define cpu_systick_enter() 			\
		__asm__ __volatile__ (				\
			"	push	{lr}			\n" \
			"	mrs		r0, psp			\n"	\
			"	stmdb	r0!, {r4-r11}	\n"	\
			"	msr		psp, r0			\n"	\
			: 								\
			:								\
			:								\
			)

	//This loads the context from the PSP, the Cortex-M4 loads the other registers using hardware
	#define cpu_systick_exit()				\
		__asm__ __volatile__ (				\
			"	mrs		r0, psp			\n"	\
			"	ldmfd	r0!, {r4-r11}	\n"	\
			"	msr		psp, r0			\n"	\
			"	pop		{pc}			\n"	\
			:								\
			:								\
			:								\
			)
#endif // ARM_FVP_LAZY_STACKING

//This writes the PSP so that the thread table stack pointer can be used again
#define wr_thread_stack_ptr(ptr) __asm__ __volatile__ ( " msr psp, %0\n\t" : : "r" (ptr) )


//This reads the PSP so that it can be stored in the thread table
static void* __attribute__((naked)) rd_thread_stack_ptr(void)
{
	__asm__ __volatile__ (	" mrs	r0, psp			\n"	\
							" bx	lr				\n" \
							:							\
							:							\
							: "r0"						\
							);
}

//Reads the main stack pointer
static void* __attribute__((naked)) rd_stack_ptr(void)
{
	__asm__ __volatile__ (	" mrs	r0, msp			\n" \
							" bx	lr				\n" \
							:							\
							:							\
							: "r0"						\
							);
}

#ifdef __cplusplus
extern "C"
{
#endif

// Floating point unit initialize
void fpu_init(void);

#ifdef __cplusplus
}
#endif

#endif