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
#include <caribou/kernel/interrupt.h>
#include <chip/chip.h>
#include <stm32f10x.h>
#include <stm32f10x_rcc.h>

#define DELAY_CAL_FACTOR ( 100 )		/* FIXME - run-time calibrate this */

#define isr_enter()					    \
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
		);

#define isr_exit()					    \
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
        "   mret                    \n" \
 		)

#if defined USE_FULL_ASSERT
	void assert_failed(uint8_t* file, uint32_t line)
	{
		while(1);
	}
#endif

#if !defined(assert_param)
__attribute__((weak)) void assert_param(int n)		
{
	while(!n);
}
#endif

/**
** Get here from the interrupt vector. Query the NVIC to get the active vector,
** and then dispatch it.
*/
void __attribute__((naked)) nvic_isr()
{
	isr_enter();
	caribou_interrupt_service((InterruptVector)(SCB->ICSR & SCB_ICSR_VECTACTIVE_Msk)-16);
	isr_exit();
}

__attribute__((weak)) void _swi()
{
}

__attribute__((weak)) void _nmi()
{
}

/**
* @brief Is the systick IRQ enabled?
*/
int chip_systick_irq_state(void)
{
	return (SysTick->CTRL & SysTick_CTRL_TICKINT_Msk) ? 1 : 0;
}

/**
* @brief Enable the systick IRQ
*/
int chip_systick_irq_enable(void)
{
	int rc = (SysTick->CTRL & SysTick_CTRL_TICKINT_Msk) ? 1 : 0;
	SysTick->CTRL |= SysTick_CTRL_TICKINT_Msk;	/* enable systick interrupt */
	return rc;
}

/**
* @brief Disbale the systick IRQ
* @return the previous state.
*/
int chip_systick_irq_disable(void)
{
	int rc = (SysTick->CTRL & SysTick_CTRL_TICKINT_Msk) ? 1 : 0;
	SysTick->CTRL &= ~SysTick_CTRL_TICKINT_Msk;	/* disable systick interrupt */
	return rc;
}

/**
* @brief Set the systick IRQ state.
*/
void chip_systick_irq_set(int enable)
{
	if (enable)
		SysTick->CTRL |= SysTick_CTRL_TICKINT_Msk;	/* enable systick interrupt */
	else
		SysTick->CTRL &= ~SysTick_CTRL_TICKINT_Msk;	/* disable systick interrupt */
}

/**
* @brief Did the systick timer cause the systick?
* @return true of the systick was caused by a hardware interrupt.
*/
bool chip_systick_count_bit(void)
{
	bool rc = (SysTick->CTRL & SysTick_CTRL_COUNTFLAG_Msk) ? true : false;
	return rc;
}

/**
* @brief Force a systick timeout, such that systick will go negative in order to
* provide a means of detecting that it was a forced systick() call, i.e. thread yield() or so.
*/
void chip_systick_irq_force(void)
{
	SCB->ICSR |= SCB_ICSR_PENDSVSET_Msk;
}

void chip_reset_watchdog()
{
}

void chip_idle()
{
	chip_reset_watchdog();
}

/**
** @brief Initialize the PLL
*/
static void initPLL()
{
	/* SystemInit(); */ /* early_init() should do this */
}

/**
** @brief Initialize the system TImer (Systick)
*/
static void initSysTick()
{
	uint32_t ticks = chip_clock_freq() / 1000;				/* number of ticks between interrupts */
	SysTick->LOAD  = (ticks & SysTick_LOAD_RELOAD_Msk) - 1;		/* set reload register */
	NVIC_SetPriority (SysTick_IRQn, (1<<__NVIC_PRIO_BITS) - 1);	/* set Priority for Cortex-M0 System Interrupts */
	SysTick->VAL   = 0;											/* Load the SysTick Counter Value */
	SysTick->CTRL  = SysTick_CTRL_CLKSOURCE_Msk |
					SysTick_CTRL_TICKINT_Msk   |
					SysTick_CTRL_ENABLE_Msk;					/* Enable SysTick IRQ and SysTick Timer */
}

/**
** @brief Initialize the watchdog timer.
*/
static void initializeWWDG()
{
	//WWDG_SetPrescaler(WWDG_Prescaler_8);
	//WWDG_SetWindowValue(0x40);
	//WWDG_Enable(0x7F);
}

/*
*/
void chip_init(int systick_hz)
{
	/** Interrupts are now disabled... */
	chip_interrupts_disable();

	/** initialize system */
	initPLL();
	initSysTick();
	initializeWWDG();
}

void __attribute__((naked)) chip_interrupts_enable(void)
{
	__asm(" cpsie   i\n"
		  " bx		lr\n");
}

int __attribute__((naked)) chip_interrupts_disable(void)
{
	__asm(" mrs	r0, primask\n"
		  "	eor	r0,r0,#1\n"
		  " cpsid	 i\n"
		  " bx		lr\n");
}

int	__attribute__((naked)) chip_interrupts_enabled(void)
{
	__asm(" mrs	r0, primask\n"
		  "	eor	r0,r0,#1\n"
		  " bx		lr\n");
}
// return the current interrupt level from the IPSR register
uint32_t __attribute__((naked)) chip_interrupt_level(void)
{
	__asm(" mrs	r0, psr\n"
		  "	and	r0,r0,#0x3F\n"
		  " bx		lr\n");
}

void __attribute__((naked)) chip_interrupts_set(int enable)
{
	__asm("		cmp		r0, #0			\n"
		  "		beq		1f				\n"
		  "		cpsie   i				\n"
		  "		b		2f				\n"
		  "1:							\n"
		  "		cpsid   i				\n"
		  "2:							\n"
		  "		bx		lr				\n");
}

void __attribute__((naked)) chip_wfi(void)
{
	__asm(" wfi\n bx lr\n");
}

// enable a vectored interrupt
int chip_vector_enable(uint32_t vector)
{
	int rc=0;
	if ( vector < 32 )
	{
		uint32_t bit = (1 << (uint32_t)vector);
		rc = (NVIC->ISER[0] & bit) ? 1 : 0;
		NVIC->ISER[0] = bit;
	}
	else
	{
		uint32_t bit = (1 << (uint32_t)(vector-32));
		rc = (NVIC->ISER[1] & bit) ? 1 : 0;
		NVIC->ISER[1] = bit;
	}
	return rc;
}

// disable a vectored interrupt
int chip_vector_disable(uint32_t vector)
{
	int rc=0;
	if ( vector < 32 )
	{
		uint32_t bit = (1 << (uint32_t)vector);
		rc = (NVIC->ISER[0] & bit) ? 1 : 0;
		NVIC->ICER[0] = bit;
	}
	else
	{
		uint32_t bit = (1 << (uint32_t)(vector-32));
		rc = (NVIC->ISER[1] & bit) ? 1 : 0;
		NVIC->ICER[1] = bit;
	}
	return rc;
}

int chip_vector_enabled(uint32_t vector)
{
	int rc;
	if ( vector < 32 )
		rc = (NVIC->ISER[0] & (1 << (uint32_t)vector)) ? 1 : 0;
	else
		rc = (NVIC->ISER[1] & (1 << (uint32_t)(vector-32))) ? 1 : 0;
	return rc;
}

int chip_vector_set(uint32_t vector, int state)
{
	int rc;
	if ( state )
		rc = chip_vector_enable( vector );
	else
		rc = chip_vector_disable( vector );
	return rc;
}

// return the clock frequency
uint32_t chip_clock_freq(void)
{
	return SystemCoreClock;
}

void chip_reset()
{
	/** FIXME */
	for(;;);
}

void chip_usec_delay(uint32_t usecs)
{
	while(usecs--)
	{
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");		
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");		
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");		
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");		
		__asm(" nop\n");
		__asm(" nop\n");
	}
}
