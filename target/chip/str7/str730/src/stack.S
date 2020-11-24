/***************************************************************************
 *   Copyright © 2005-2009 by Pike Aerospace Research Corporation          *
 *   mike@pikeaero.com - http://www.pikeaero.com                           *
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 *   This program is distributed in the hope that it will be useful,       *
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
 *   GNU General Public License for more details.                          *
 *                                                                         *
 *   You should have received a copy of the GNU General Public License     *
 *   along with this program; if not, write to the                         *
 *   Free Software Foundation, Inc.,                                       *
 *   59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.             *
 ***************************************************************************/


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

/*****************************************************************************
 * void wr_thread_stack_ptr()                                                *
 ****************************************************************************/
		.global	wr_thread_stack_ptr
		.func	wr_thread_stack_ptr
wr_thread_stack_ptr:
		msr			CPSR_c,#MODE_SYS|I_BIT|F_BIT
		mov			sp, r0
		msr			CPSR_c,#MODE_FIQ|I_BIT|F_BIT
		bx			lr
		.size	wr_thread_stack_ptr, . - wr_thread_stack_ptr
		.endfunc

/*****************************************************************************
 * void rd_thread_stack_ptr()                                                *
 ****************************************************************************/
		.global	rd_thread_stack_ptr
		.func	rd_thread_stack_ptr
rd_thread_stack_ptr:
		msr			CPSR_c,#MODE_SYS|I_BIT|F_BIT
		mov			r0, sp
		msr			CPSR_c,#MODE_FIQ|I_BIT|F_BIT
		bx			lr
		.size	rd_thread_stack_ptr, . - rd_thread_stack_ptr
		.endfunc

		.end
