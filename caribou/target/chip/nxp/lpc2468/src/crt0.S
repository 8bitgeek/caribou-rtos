/******************************************************************************
* Copyright © 2005-2012 by Pike Aerospace Research Corporation
* All Rights Reserved
*
*   This file is part of CARIBOU RTOS.
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

/*****************************************************************************
 * Various globals.                                                          *
 *       --Mike                                                              *
 *****************************************************************************/
		.extern main								/* main() 'C' language entry point */
		.extern caribou_heap_init							/* heap initialization function */
		.extern	_configure
		.extern _reset_id_register_

        .global	__main_stack_base__
        .global	__main_stack_size__
        .global __main_stack_end__
        .global	__process_stack_base__
        .global	__process_stack_size__
        .global	__process_stack_end__

		.global	__bss_start__
		.global	__bss_end__

		.global	__heap_base__
		.global	__heap_end__

		.global	__init_array_start
		.global	__init_array_end
		.global	__fini_array_start
		.global	__fini_array_end

/*****************************************************************************
 * Stack location and sizes for various processor modes.                     *
 *       --Mike                                                              *
 *****************************************************************************/
		.set	UND_STACK_SIZE,		0x00000100
		.set	ABT_STACK_SIZE,		0x00000100
		.set	FIQ_STACK_SIZE,		0x00000400
		.set	IRQ_STACK_SIZE,		0x00000400
		.set	SVC_STACK_SIZE,		0x00000400
		.set	RSID,				0xE01FC180
		.set	MEMMAP,				0xE01FC040

/*****************************************************************************
 * Standard definitions of Mode bits and Interrupt (I & F) flags in PSRs     *
 *       --Mike                                                              *
 *****************************************************************************/
		.set	MODE_USR,			0x10			/* User Mode */
		.set	MODE_FIQ,			0x11			/* FIQ Mode */
		.set	MODE_IRQ,			0x12			/* IRQ Mode */
		.set	MODE_SVC,			0x13			/* Supervisor Mode */
		.set	MODE_ABT,			0x17			/* Abort Mode */
		.set	MODE_UND,			0x1B			/* Undefined Mode */
		.set	MODE_SYS,			0x1F			/* System Mode */

		.equ	I_BIT,				0x80			/* when I bit is set, IRQ is disabled */
		.equ	F_BIT,				0x40			/* when F bit is set, FIQ is disabled */

		.text
		.code	32

/*****************************************************************************
 * The copyright notice embedded prominently at the begining of the ROM      *
 *       --Mike                                                              *
 *****************************************************************************/
		.global	copyright
copyright:
		.string "(c) 2005-2014 Pike Aerospace Research Corporation"
		.align 4						/* re-align to the word boundary */

/*****************************************************************************
 * Do all the preparation leading up to and including the call to main()     *
 *       --Mike                                                              *
 *****************************************************************************/
		.section .init, "ax"
		.global reset_handler
		.func   reset_handler
reset_handler:
 		msr		cpsr_c,#MODE_SVC|I_BIT|F_BIT		/* Disable IRQ, move to SVC mode. */
        /*********************************************************************
         * Initialize Interrupt System                                       *
         *   - Set stack location for each mode                              *
         *   - Leave in System Mode with Interrupts Disabled                 *
         *       --Mike                                                      *
         *********************************************************************/
		ldr		r0,=__main_stack_end__				/* Load the top of stack */

		msr		CPSR_c,#MODE_IRQ|I_BIT|F_BIT		/* IRQ Mode */
		mov		sp,r0
		sub		r0,r0,#IRQ_STACK_SIZE
		msr		CPSR_c,#MODE_FIQ|I_BIT|F_BIT		/* FIQ Mode */
		mov		sp,r0
		sub		r0,r0,#FIQ_STACK_SIZE
		msr		CPSR_c,#MODE_SVC|I_BIT|F_BIT		/* Supervisor Mode */
		mov		sp,r0
		sub		r0,r0,#SVC_STACK_SIZE
		msr		CPSR_c,#MODE_ABT|I_BIT|F_BIT		/* Abort Mode */
		mov		sp,r0
		sub		r0,r0,#ABT_STACK_SIZE
		msr		CPSR_c,#MODE_UND|I_BIT|F_BIT		/* Undefined Instruction Mode */
		mov		sp,r0
		sub		r0,r0,#UND_STACK_SIZE

		ldr		r0,=__process_stack_end__			/* Load the System (process) stack */
		msr		CPSR_c,#MODE_SYS|I_BIT|F_BIT		/* System Mode */
		mov		sp,r0

		/* configure the PLL */
		bl		_configure

		/* Initialize process (system mode) stack */
		ldr 	r0, =__process_stack_base__
		ldr 	r1, =__process_stack_end__
		mov 	r2, #0
		bl 		memory_set

		/* Initialize main stack */
		ldr 	r0, =__main_stack_base__
		ldr 	r1, =__main_stack_end__
		mov 	r2, #0
		bl 		memory_set

		/* Data initialization. NOTE: It assumes that the DATA size is a multiple of 4 bytes. */
        ldr     r0, =_textdata
        ldr     r1, =_data
        ldr     r2, =_edata
        bl		memory_copy

		/* Zero the bss. */
		ldr 	r0, =__bss_start__
		ldr 	r1, =__bss_end__
		mov 	r2, #0
		bl 		memory_set

		/* initialize the heap */
		ldr 	r0, =__heap_base__
		ldr		r1, =__heap_end__
		ldr		r2, =caribou_heap_init
		mov		lr,pc
		bx		r2

		// Early init
		ldr		r2, =early_init
		mov		lr,pc
		bx		r2

		/* Call constructors */
		ldr 	r0, =__init_array_start
		ldr 	r1, =__init_array_end
ctor_loop:
		cmp		 r0, r1
		beq 	ctor_end
		ldr 	r2, [r0]
		add 	r0, #4
		push 	{r0-r1}
		mov		lr,pc
		bx		r2
		pop 	{r0-r1}
		b 		ctor_loop
ctor_end:
		// Jump to application entry point
		ldr		r2, =late_init
		mov		lr,pc
		bx		r2
		/* Setup initial call frame */
		mov		lr, #4
		mov		r12, sp
		stmfd	sp!, {r11-r12, lr-pc}
		sub		r11, r12, #4
		/* Jump to application main() */
		mov		r0, #0
		mov		r1, #0
		ldr		r2, =main
		mov		lr, pc
		bx		r2
		/* Jump to program exit point */
		b		exit
        /** memory initialization */
memory_copy:
		cmp		r0, r1
		moveq	pc, lr
		subs	r2, r2, r1
		moveq	pc, lr
memory_copy1:
		ldrb	r3, [r0], #+1
		strb	r3, [r1], #+1
		subs	r2, r2, #1
		bne		memory_copy1
		bx		lr
memory_set:
		cmp		r0, r1
		moveq	pc, lr
		strb	r2, [r0], #1
		b		memory_set

		.size reset_handler, . - reset_handler
		.endfunc

/*****************************************************************************
 * Disable interrupts, then restart                                          *
 *   - "global object"-dtors are never called and it should not be           *
 *     needed since there is no OS to exit to.                               *
 *       --Mike                                                              *
 *****************************************************************************/
		.global	exit
		.func	exit
exit:
		msr		CPSR_c,#MODE_SYS|I_BIT|F_BIT	/* Supervisor mode disable IRQ and FIQ */

		/* Call destructors */
		ldr 	r0, =__fini_array_start
		ldr 	r1, =__fini_array_end

dtor_loop:
		cmp		r0, r1
		beq		reset_handler						/* reset */
		ldr		r2, [r0], #+4
		stmfd	sp!, {r0-r1}
		mov		lr, pc
		mov		pc, r2
		ldmfd	sp!, {r0-r1}
		b		dtor_loop
		.size 	exit, . - exit
		.endfunc

/**********************/

		.global abort
		.func   abort
abort:	msr		CPSR_c,#MODE_ABT|I_BIT|F_BIT
		b		abort
		.size	abort, . - abort
		.endfunc

		.end
