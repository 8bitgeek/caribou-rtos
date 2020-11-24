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
#ifndef _CPU_H_
#define _CPU_H_

#include <stdint.h>

#define CPU_MAX_XREG    32

typedef uint32_t cpu_reg_t;

typedef union cpu_state_t
{
    struct {
        // stored in "stack order" i.e. high register first
        uint32_t    x[CPU_MAX_XREG];
    } reg;
    struct {
        uint32_t    t6;     //  x31 Temporaries
        uint32_t    t5;     //  x30
        uint32_t    t4;     //  x29
        uint32_t    t3;     //  x28
        uint32_t    s11;    //  x27 Saved Registers
        uint32_t    s10;    //  x26
        uint32_t    s9;     //  x25
        uint32_t    s8;     //  x24
        uint32_t    s7;     //  x23
        uint32_t    s6;     //  x22
        uint32_t    s5;     //  x21
        uint32_t    s4;     //  x20
        uint32_t    s3;     //  x19
        uint32_t    s2;     //  x18
        uint32_t    a7;     //  x17 Function arguments
        uint32_t    a6;     //  x16
        uint32_t    a5;     //  x15
        uint32_t    a4;     //  x14
        uint32_t    a3;     //  x13
        uint32_t    a2;     //  x12
        uint32_t    a1;     //  x11 Function arguments / return values
        uint32_t    a0;     //  x10
        uint32_t    s1;     //  x9  Saved register
        uint32_t    fp;     //  x8  Saved register / frame pointer
        uint32_t    t2;     //  x7  Temporaries
        uint32_t    t1;     //  x6  
        uint32_t    t0;     //  x5
        uint32_t    tp;     //  x4  Thread pointer
        uint32_t    gp;     //  x3  Global pointer
        uint32_t    sp;     //  x2  Stack pointer
        uint32_t    ra;     //  x1  Return address
        uint32_t    pc;     //  mepc program counter
    } abi;
} cpu_state_t;

#define cpu_push_state() 			    \
	__asm (								\
        "   addi    sp,sp,-128      \n" \
        "   csrw    mscratch,x5     \n" \
        "   csrr    x5,mepc         \n" \
        "   sw      x5,124(sp)      \n" \
        "   csrr    x5,mscratch     \n" \
        "   sw      x1,120(sp)      \n" \
        "   sw      x2,116(sp)      \n" \
        "   sw      x3,112(sp)      \n" \
        "   sw      x4,108(sp)      \n" \
        "   sw      x5,104(sp)      \n" \
        "   sw      x6,100(sp)      \n" \
        "   sw      x7,96(sp)       \n" \
        "   sw      x8,92(sp)       \n" \
        "   sw      x9,88(sp)       \n" \
        "   sw      x10,84(sp)      \n" \
        "   sw      x11,80(sp)      \n" \
        "   sw      x12,76(sp)      \n" \
        "   sw      x13,72(sp)      \n" \
        "   sw      x14,68(sp)      \n" \
        "   sw      x15,64(sp)      \n" \
        "   sw      x16,60(sp)      \n" \
        "   sw      x17,56(sp)      \n" \
        "   sw      x18,52(sp)      \n" \
        "   sw      x19,48(sp)      \n" \
        "   sw      x20,44(sp)      \n" \
        "   sw      x21,40(sp)      \n" \
        "   sw      x22,36(sp)      \n" \
        "   sw      x23,32(sp)      \n" \
        "   sw      x24,28(sp)      \n" \
        "   sw      x25,24(sp)      \n" \
        "   sw      x26,20(sp)      \n" \
        "   sw      x27,16(sp)      \n" \
        "   sw      x28,12(sp)      \n" \
        "   sw      x29,8(sp)       \n" \
        "   sw      x30,4(sp)       \n" \
        "   sw      x31,0(sp)       \n" \
		);                              \
        brisc_scheduler_state.threads[brisc_scheduler_state.thread_id].cpu_state = (cpu_state_t*)cpu_rd_sp()

#define cpu_pop_state()                 \
	__asm (								\
        "   lw      x5,124(sp)      \n" \
        "   csrw    mepc,x5         \n" \
        "   lw      x1,120(sp)      \n" \
        "   lw      x2,116(sp)      \n" \
        "   lw      x3,112(sp)      \n" \
        "   lw      x4,108(sp)      \n" \
        "   lw      x5,104(sp)      \n" \
        "   lw      x6,100(sp)      \n" \
        "   lw      x7,96(sp)       \n" \
        "   lw      x8,92(sp)       \n" \
        "   lw      x9,88(sp)       \n" \
        "   lw      x10,84(sp)      \n" \
        "   lw      x11,80(sp)      \n" \
        "   lw      x12,76(sp)      \n" \
        "   lw      x13,72(sp)      \n" \
        "   lw      x14,68(sp)      \n" \
        "   lw      x15,64(sp)      \n" \
        "   lw      x16,60(sp)      \n" \
        "   lw      x17,56(sp)      \n" \
        "   lw      x18,52(sp)      \n" \
        "   lw      x19,48(sp)      \n" \
        "   lw      x20,44(sp)      \n" \
        "   lw      x21,40(sp)      \n" \
        "   lw      x22,36(sp)      \n" \
        "   lw      x23,32(sp)      \n" \
        "   lw      x24,28(sp)      \n" \
        "   lw      x25,24(sp)      \n" \
        "   lw      x26,20(sp)      \n" \
        "   lw      x27,16(sp)      \n" \
        "   lw      x28,12(sp)      \n" \
        "   lw      x29,8(sp)       \n" \
        "   lw      x30,4(sp)       \n" \
        "   lw      x31,0(sp)       \n" \
        "   addi    sp,sp,128       \n" \
 		)

#define cpu_wr_sp(ptr) __asm  ( "  mv  sp,%0\n" : : "r" (ptr) )

#define cpu_systick_enter()             \
    __asm(  "  nop               \n"    \
            )

#define cpu_systick_exit()              \
    __asm(  "  mret              \n"    \
            )

extern void* __attribute__((naked))     cpu_rd_sp   ( void );
extern uint32_t                         atomic_acquire ( uint32_t* lock );
extern void                             atomic_release ( uint32_t* lock );


#endif




#ifndef _CARIBOU_CPU_RISCV_RV32IMAC_H_
#define _CARIBOU_CPU_RISCV_RV32IMAC_H_

#include <riscv_encoding.h>

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
extern void* __attribute__((naked)) rd_thread_stack_ptr(void);

//Reads the main stack pointer
extern void* __attribute__((naked)) rd_stack_ptr(void);

//This reads the Stacked PC from the PSP stack so that it can be stored in the thread table
extern void* rd_thread_stacked_pc(void);

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