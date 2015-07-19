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
 * Various globals.                                                          *
 *       --Mike                                                              *
 *****************************************************************************/
		.global main								/* main() 'C' language entry point */
		.global heap_init							/* heap initialization function */

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

		.global	vsr_SWI								/* SWI 'C' language handler */
		.global	vsr_IRQ								/* IRQ 'C' language handler */
		.global	vsr_FIQ								/* FIQ 'C' language handler */
		.global _fiq_systick

/*****************************************************************************
 * Various peripheral port locations and bit definitions.                    *
 *       --Mike                                                              *
 *****************************************************************************/
		.set	CFG_PCGR0_INIT,		0x20000001		/* CFG_PCGR0_INIT bits */
		.set	CFG_BASE,			0x40000000		/* str730 CFG register base address */
		.set	CFG_PCGR0,			0x08			/* CFG_PCGR0 register address offset */
		.set	CFG_PECGR0,			0x10			/* CFG_PECGR0 register address offset */
		.set	CFG_PCGRB0,			0x18			/* CFG_PCGRB0 register address offset */

		.set	EIC_BASE,			0xFFFFFC00		/* EIC base address */
		.set	EIC_CICR,			0x04			/* EIC_CICR register address offset */
		.set	EIC_IVR,			0x18			/* EIC_IVR register address offset */
		.set	EIC_IPR0,			0x40			/* EIC_IPR0 register address offset */
		.set	EIC_IPR1,			0x44			/* EIC_IPR1 register address offset */
		.set	EIC_SIRn,			0x60			/* EIC_SIRn register address offset */

		.set	FLASH_BASE,			0x80100000		/* FLASH Register Base */
		.set	FLASH_CR0,			0x00			/* FLASH Control Register 0 */
		.set	FLASH_CR1,			0x04			/* FLASH Control Register 1 */
		.set	FLASH_DR0,			0x08			/* FLASH Data Register 0 */
		.set	FLASH_DR1,			0x0C			/* FLASH Data Register 1 */
		.set	FLASH_AR,			0x10			/* FLASH Address Register */
		.set	FLASH_ER,			0x14			/* FLASH Error Register */
		.set	FLASH_NVWPAR,		0xDFB0			/* FLASH  non volitile write protection register */
		.set	FLASH_NVAPR0,		0xDFB8			/* FLASH NV access protection register 0 */
		.set	FLASH_NVAPR1,		0xDFBC			/* FLASH NV access protection register 1 */

		.set	FLASH_WMS,			0x80000000		/* FLASH Write Mode Start bit */
		.set	FLASH_LOCK,			0x00000010		/* FLASH Register Access Locked (read only) */
		.set	FLASH_BSY1,			0x00000004		/* FLASH Bank Busy */
		.set	FLASH_BSY0,			0x00000002		/* FLASH Bank Busy */

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
 * Exception Vectors                                                         *
 * Note: STR730 FLASH can be aliased to 0x00000000 from 0x80000000           *
 *       Program should be org'ed to 0x80000000 as the real FLASH addr.      *
 *       Exception vectors have to work from 0x00000000 adderss space.       *
 *       --Mike                                                              *
 *****************************************************************************/
		.section vectors, "ax"
		.align	0
		.global _vectors
		.func   _vectors
_vectors:
		ldr   pc,__rst					/* reset			(start) */
		ldr   pc,__abt                  /* undefined		(abort/start) */
		ldr   pc,__swi                  /* SWI */
		ldr   pc,__abt                  /* program abort	(abort/start) */
		ldr   pc,__abt                  /* data abort		(abort/start) */
		ldr   pc,__abt                  /* reserved */
		ldr   pc,[pc,#((EIC_BASE+EIC_IVR)-0x00000020)]   /* IRQ */
		ldr   pc,__fiq                  /* FIQ */

/*****************************************************************************
 * The copyright notice embedded prominently at the begining of the ROM      *
 *       --Mike                                                              *
 *****************************************************************************/
		.global	copyright
copyright:
		.string "(c) 2005-2013 Pike Aerospace Research Corporation"
		.align 4						/* re-align to the word boundary */

/*****************************************************************************
 * Interrupt Vector Service Routine Table                                    *
 * Should point to the 0x80000000 address space.                             *
 *       --Mike                                                              *
 *****************************************************************************/
		.global	vsr_IRQ					/* Vector Service Routine (IRQ) */
		.global	vsr_FIQ					/* Vector Service Routine (FIQ) */
		.global	vsr_SWI					/* Vector Service Routine (SWI) */
__rst:  .word _start					/* Reset handler */
__abt:  .word abort						/* Abort handler */
__swi:	.word vsr_SWI					/* SWI 'C' language handler */
__irq:	.word vsr_IRQ					/* IRQ 'C' language handler */
__fiq:	.word _fiq_systick				/* FIQ 'C' language handler */
__rtp:	.word RAM_TOP					/* Top of Ram */
__stp:	.word (RAM_TOP-128)				/* Top of Stack (128 bytes reserved for FLASH writer subroutines) */
		.size   __rst, . - __rst
		.endfunc


/*****************************************************************************
 * Do all the preparation leading up to and including the call to main()     *
 *       --Mike                                                              *
 *****************************************************************************/
		.section .init, "ax"
		.global _start
		.func   _start
_start:
 		msr		cpsr_c,#MODE_IRQ|I_BIT|F_BIT	/* Disable IRQ, move to IRQ mode.
		/** First off, make sure the RAM clock is enabled. */
		/** CFG->PCGR0 |= CFG_PCGR0_RAM; */
		mov		r2,#CFG_BASE
		ldr		r3,[r2, #CFG_PCGR0]
		orr		r3,r3, #CFG_PCGR0_INIT
		str		r3,[r2, #CFG_PCGR0]
		/** CFG->PCGRB0 &= ~CFG_PCGR0_RAM; */
		ldr		r3,[r2, #CFG_PCGRB0]
		bic		r3,r3, #CFG_PCGR0_INIT
		str		r3,[r2, #CFG_PCGRB0]
		/** CFG->PECGR0 |= CFG_PCGR0_RAM; */
		ldr		r3,[r2, #CFG_PECGR0]
		orr		r3,r3, #CFG_PCGR0_INIT
		str		r3,[r2, #CFG_PECGR0]
        /*********************************************************************
         * Initialize Interrupt System                                       *
         *   - Set stack location for each mode                              *
         *   - Leave in System Mode with Interrupts Disabled                 *
         *       --Mike                                                      *
         *********************************************************************/
		ldr		r0,=__process_stack_end__			/* Load the op of stack */
		msr		CPSR_c,#MODE_UND|I_BIT|F_BIT		/* Undefined Instruction Mode */
		mov		sp,r0
		sub		r0,r0,#UND_STACK_SIZE
		msr		CPSR_c,#MODE_ABT|I_BIT|F_BIT		/* Abort Mode */
		mov		sp,r0
		sub		r0,r0,#ABT_STACK_SIZE
		msr		CPSR_c,#MODE_FIQ|I_BIT|F_BIT		/* FIQ Mode */
		mov		sp,r0
		sub		r0,r0,#FIQ_STACK_SIZE
		msr		CPSR_c,#MODE_IRQ|I_BIT|F_BIT		/* IRQ Mode */
		mov		sp,r0
		sub		r0,r0,#IRQ_STACK_SIZE
		msr		CPSR_c,#MODE_SVC|I_BIT|F_BIT		/* Supervisor Mode */
		mov		sp,r0
		sub		r0,r0,#SVC_STACK_SIZE
		msr		CPSR_c,#MODE_SYS|I_BIT|F_BIT		/* System Mode */
		mov		sp,r0

		/* Initialize process (system mode) stack */
		ldr 	r0, =__process_stack_base__
		ldr 	r1, =__process_stack_end__
		mov 	r2, #0xFF
		bl 		memory_set

		/* Initialize main stack */
		ldr 	r0, =__main_stack_base__
		ldr 	r1, =__main_stack_end__
		mov		r2, #0xFF
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
		ldr		r2, =heap_init
		mov		lr,pc
		bx		r2

		/* Call constructors */
		ldr 	r0, =__init_array_start
		ldr 	r1, =__init_array_end
ctor_loop:
		cmp		r0, r1
		beq		ctor_end
		ldr		r2, [r0], #+4
		stmfd	sp!, {r0-r1}
		mov		lr, pc
		mov		pc, r2
		ldmfd	sp!, {r0-r1}
		b		ctor_loop
ctor_end:
		/* Setup initial call frame */
		mov		lr, #4
		mov		r12, sp
		stmfd	sp!, {r11-r12, lr-pc}
		sub		r11, r12, #0x00000004
		/* Jump to application entry point (main)*/
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

		.size _start, . - _start
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
		beq		_start						/* reset */
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
