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

/*****************************************************************************
 * Various peripheral port locations and bit definitions.                    *
 *       --Mike                                                              *
 *****************************************************************************/

		.set	EIC_BASE,			0xFFFFFC00		/* EIC base address */
		.set	EIC_CICR,			0x04			/* EIC_CICR register address offset */
		.set	EIC_IVR,			0x18			/* EIC_IVR register address offset */
		.set	EIC_IPR0,			0x40			/* EIC_IPR0 register address offset */
		.set	EIC_IPR1,			0x44			/* EIC_IPR1 register address offset */
		.set	EIC_SIRn,			0x60			/* EIC_SIRn register address offset */

		.text
		.code	32

/*****************************************************************************
 * Various globals and externs.                                              *
 *       --Mike                                                              *
 *****************************************************************************/
			.section .init, "ax"
			.global	vsr_IRQ							/* Vector Service Routine (IRQ) */
__eic_base:	.word	EIC_BASE						/* EIC base address */
__irq:		.word	vsr_IRQ							/* IRQ 'C' language handler */

/*****************************************************************************
 * IRQ Service Routine (ISR) allowing nested interrupts.                     *
 * Calls 'C' language interrupt service routine which is pointed to by the   *
 * __irq word.                                                               *
 * Upon entry, stacks are pushed as follows:                                 *
 * IRQ Stack:                                                                *
 *				lr_irq  (PC)                                                 *
 *				r0                                                           *
 *				spsr                                                         *
 *              lr (system mode)                                             *
 * SYS Stack:                                                                *
 *				lr (system mode)                                             *
 *				r12                                                          *
 *				r11                                                          *
 *				r10                                                          *
 *				r9                                                           *
 *				r8                                                           *
 *				r7                                                           *
 *				r6                                                           *
 *				r5                                                           *
 *				r4                                                           *
 *				r3                                                           *
 *				r2                                                           *
 *				r1                                                           *
 *				r0                                                           *
 *                                                                           *
 *       --Mike                                                              *
 *****************************************************************************/
		.global irq_isr
		.func   irq_isr
irq_isr:

		/* IRQ Stack: */
		stmfd	sp!,{lr}						/* Preserve PC onto IRQ stack */
		stmfd	sp!,{r0}						/* Preserve scratch register R0 onto IRQ stack */
		mrs		r0,spsr							/* Save the SPSR into R0 */
		stmfd	sp!,{r0}						/* Preserve SPSR via R0 onto the stack */
		mov		r0,sp;							/* Preserve IRQ SP into R0 */
		msr		cpsr_c,#MODE_SYS|I_BIT|F_BIT	/* Go to system mode (IRQs remaining disabled) */
		stmfd	r0!,{lr}						/* Preserve LR_SYS onto IRQ stack */
		msr		cpsr_c,#MODE_IRQ|I_BIT|F_BIT	/* Go back to IRQ mode (IRQs remaining disabled) */
		mov		sp,r0							/* Preserve updated IRQ SP */
		ldr		r0,[r0,#12]						/* Restore R0 */

		/* System Stack: */
		msr		cpsr_c,#MODE_SYS                /* Re-enable IRQ, go to system mode */
		stmfd	sp!,{lr}						/* Save lr_sys for the system mode */
		stmfd	sp!,{r0-r12}					/* Preserve the GP registers r0-r12 */

		/* Call the 'C' language ISR... */
		ldr		r2,__eic_base					/* Get EIC base address */
		mov		lr,pc							/* Setup the link register with return address. */
		ldr		pc,__irq						/* Call the 'C' language ISR... */

		ldmfd	sp!,{r0-r12}					/* Restore the GP registers r0-r12 */
		ldmfd	sp!,{lr}						/* Restore lr_sys for the system mode */

		msr		cpsr_c,#MODE_IRQ|I_BIT|F_BIT	/* Disable IRQ, move to IRQ mode.
		/**
		** Clear pending bit in EIC (using the proper IPRx)...
		** if (EIC->CICR < 32)
		**	EIC->IPR0 = 1 << EIC->CICR;
		** else
		**	EIC->IPR1 = (1 << (EIC->CICR-32));
		*/
		stmfd	sp!,{r0-r2}						/* Preserve r0-r2 (scratch) */
		mov		r1,#1							/* Get a mask bit */
		ldr		r2,__eic_base					/* Get EIC base address */
		ldr		r0,[r2, #EIC_CICR]				/* Get the value of the CICR register */
		cmp		r0,#32							/* CICR value < 32? */
		blt		__irq_isr_1						/* yes... */
		sub		r0,r0,#32						/* no; r0 = r0 - 32 */
		mov		r1,r1, lsl r0					/* r1 = r1 << r0 */
		str		r1,[r2, #EIC_IPR1]				/* EIC->IPR1 = r1 */
		b		__irq_isr_2
__irq_isr_1:
		mov		r1,r1, lsl r0					/* r1 = r1 << r0 */
		str		r1,[r2, #EIC_IPR0]				/* EIC->IPR0 = r1 */
__irq_isr_2:
		ldmfd	sp!,{r0-r2}						/* Restore r0-r2 (scratch) */

		/* Restore from IRQ stack */
		ldmfd	sp!,{r0}						/* Discard LR (system) */
		ldmfd	sp!,{r0}						/* Restore SPSR via r0 */
		msr		spsr,r0
		ldmfd	sp!,{r0}						/* Restore LR IRQ */
		ldmfd	sp!,{lr}						/* Restore and PC (return) */
		subs	pc,lr,#4
		.size   irq_isr, . - irq_isr
		.endfunc

/*****************************************************************************
 * Enable interrupts                                                         *
 *       --Mike                                                              *
 *****************************************************************************/
		.global	enableInterrupts
		.func   enableInterrupts
enableInterrupts:
		mrs		r0, cpsr					/* Get PSR */
		bic		r0, r0, #(I_BIT|F_BIT)		/* Enable IRQ and FIQ */
		msr		cpsr, r0					/* set up PSR */
		bx		lr							/* Return */
		.size enableInterrupts, . - enableInterrupts
		.endfunc

/*****************************************************************************
 * Disable interrupts                                                        *
 *       --Mike                                                              *
 *****************************************************************************/
		.global	disableInterrupts
		.func   disableInterrupts
disableInterrupts:
		mrs		r0, cpsr					/* Get PSR */
		orr		r0, r0, #(I_BIT|F_BIT)		/* Enable IRQ and FIQ */
		msr		cpsr, r0					/* set up PSR */
		bx		lr							/* Return */
		.size disableInterrupts, . - disableInterrupts
		.endfunc

/*****************************************************************************
 * Interrupts enabled?                                                       *
 *       --Mike                                                              *
 *****************************************************************************/
		.global	interruptsEnabled
		.func   interruptsEnabled
interruptsEnabled:
		mrs		r0, cpsr					/* Get PSR */
		and		r0, r0, #(I_BIT|F_BIT)		/* IRQ and/or FIQ enabled ? */
		moveq	r0, #1						/* Yes. */
		movne	r0, #0						/* No. */
		bx		lr							/* Return */
		.size interruptsEnabled, . - interruptsEnabled
		.endfunc

/*****************************************************************************
 * Initialize the EIC (Enhanced Interrupt Controller) priorities and vectors *
 *       --Mike                                                              *
 *****************************************************************************/
		.global startEIC
		.func   startEIC

		/**
		 ** EIC->IVR = __irq_isr & 0xFFFF0000;
		 ** for( r4=0; r4 < 64; r4++ )
		 ** {
		 **  EIC->SIRn[r4] = ( ( __irq_isr & 0x0000FFFF ) << 16 ) | (__eic_priorities[r4]&0x0F);
		 ** }
		*/
startEIC:
		mov		r1, #0xFF					/** EIC->IVR = __irq_isr & 0xFFFF0000 ... */
		mov		r1, r1, lsl #8
		orr		r1, r1, #0xFF
		mov		r1, r1, lsl #16
		adr		r0, irq_isr
		and		r0, r0, r1
		ldr		r3, __eic_base
		str		r0, [r3, #EIC_IVR]
__eic_init_for_loop:
		mov		r4,#0						/** for( r4=0; ... */
__eic_init_1:
		cmp		r4,#64						/** ... r4 < 64; ... */
		bge		__eic_init_2

		adr		r0,irq_isr					/** r0 = ( ( __irq_isr & 0x0000FFFF ) << 16 ) ... */
		mov		r0,r0, lsl #16

		adr		r1,__eic_priorities			/** r0 |= (__eic_priorities[r4]&0x0F) ... */
		add		r1,r1,r4
		ldrb	r2,[r1]
		orr		r0,r0,r2

		mov		r2,#EIC_SIRn				/** EIC->SIR[r4] = r0 ... */
		mov		r1,#4
		mul		r1,r4,r1
		add		r2,r2,r1
		str		r0,[r3,r2]

		add		r4,r4,#1					/** r4++ ) ...*/
		b		__eic_init_1

__eic_init_2:
		mov		r2,lr						/** done */
		bx		r2
/*****************************************************************************
 * EIC (Enhanced Interrupt Controller) priorities table                      *
 *       --Mike                                                              *
 *****************************************************************************/
__eic_priorities:
        .byte	15			/** 0	CMU_PRCCU */
        .byte	1			/** 1	INT1 */
        .byte	1			/** 2	INT2 */
        .byte	1			/** 3	INT3 */
        .byte	1			/** 4	INT4 */
        .byte	1			/** 5	INT5 */
        .byte	1			/** 6	INT6 */
        .byte	1			/** 7	INT7 */
        .byte	1			/** 8	INT8 */
        .byte	1			/** 9	INT9 */
        .byte	1			/** 10	INT10 */
        .byte	1			/** 11	INT11 */
        .byte	1			/** 12	INT12 */
        .byte	1			/** 13	INT13 */
        .byte	1			/** 14	INT14 */
        .byte	1			/** 15	INT15 */
        .byte	8			/** 16	DMA */
        .byte	15			/** 17	TIM1 */
        .byte	15			/** 18	TIM2 */
        .byte	15			/** 19	TIM3 */
        .byte	15			/** 20	TIM4 */
        .byte	7			/** 21	TBU0 */
        .byte	7			/** 22	TBU1 */
        .byte	7			/** 23	TBU2 */
        .byte	15			/** 24	TIM5 */
        .byte	15			/** 25	TIM6 */
        .byte	15			/** 26	TIM7 */
        .byte	15			/** 27	TIM8 */
        .byte	15			/** 28	TIM9 */
        .byte	0			/** 29	Reserved */
        .byte	0			/** 30	Reserved */
        .byte	1			/** 31	UART2 */
        .byte	1			/** 32	UART3 */
        .byte	1			/** 33	FLASH */
        .byte	14			/** 34	PWM0 */
        .byte	14			/** 35	PWM1 */
        .byte	14			/** 36	PWM2 */
        .byte	14			/** 37	PWM3 */
        .byte	14			/** 38	PWM4 */
        .byte	14			/** 39	PWM5 */
        .byte	1			/** 40	WIU */
        .byte	15			/** 41	WDG_WUT */
        .byte	8			/** 42	BSPI0 */
        .byte	8			/** 43	BSPI1 */
        .byte	1			/** 44	BSPI2 */
        .byte	1			/** 45	UART0 */
        .byte	1			/** 46	UART1 */
        .byte	1			/** 47	I2C0 */
        .byte	1			/** 48	I2C1 */
        .byte	0			/** 49	Reserved */
        .byte	0			/** 50	Reserved */
        .byte	1			/** 51	I2C0 */
        .byte	1			/** 52	I2C1 */
        .byte	0			/** 53	Reserved */
        .byte	0			/** 54	Reserved */
        .byte	4			/** 55	CAN0 */
        .byte	4			/** 56	CAN1 */
        .byte	2			/** 57	CAN2 */
        .byte	8			/** 58	DMA0 */
        .byte	8			/** 59	DMA1 */
        .byte	8			/** 60	DMA2 */
        .byte	8			/** 61	DMA3 */
        .byte	5			/** 62	ADC */
        .byte	8			/** 63	RTC */

		.size startEIC, . - startEIC
		.endfunc


		.end
