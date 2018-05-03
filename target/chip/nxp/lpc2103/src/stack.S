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
 * Stack location and sizes for various processor modes.                     *
 *       --Mike                                                              *
 *****************************************************************************/
		.set	RAM_TOP,			0xa0003FFC		/* Address of top most word in RAM */
		.set	UND_STACK_SIZE,		0x00000040
		.set	ABT_STACK_SIZE,		0x00000080
		.set	FIQ_STACK_SIZE,		0x00000080
		.set	IRQ_STACK_SIZE,		0x00000200
		.set	SVC_STACK_SIZE,		0x00000100

__rtp:	.word RAM_TOP					/* Top of Ram */
__stp:	.word (RAM_TOP-128)				/* Top of Stack (128 bytes reserved for FLASH writer subroutines) */

/*****************************************************************************
 * void* stackTop()                                                          *
 ****************************************************************************/
		.global	stackTop
		.func	stackTop
stackTop:
		ldr		r0, __stp					/* get the top of stack */
		bx		lr							/* return */
		.size	stackTop, . - stackTop
		.endfunc

/*****************************************************************************
 * void* stackPointer()                                                      *
 ****************************************************************************/
		.global	stackPointer
		.func	stackPointer
stackPointer:
		mov		r0, sp						/* get the stack pointer */
		bx		lr							/* return */
		.size	stackPointer, . - stackPointer
		.endfunc

/*****************************************************************************
 * void* stackUsed()                                                         *
 ****************************************************************************/
		.global	stackUsed
		.func	stackUsed
stackUsed:
		stmfd	sp!, {r1}					/* preserve scratch registers */
		mov		r1, sp						/* get the stack pointer */
		ldr		r0, __stp					/* get the top of stack */
		sub		r0, r0, r1					/* calculate stack used */
        ldmfd	sp!, {r1}					/* restore scratch registers */
		bx		lr							/* return */
		.size	stackPointer, . - stackPointer
		.endfunc


		.end
