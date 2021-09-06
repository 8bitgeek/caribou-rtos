/******************************************************************************
* Copyright © 2005-2014 by Pike Aerospace Research Corporation
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
#include <chip/chip.h>
#include <stm32f0xx.h>
#include <stm32f0xx_rcc.h>

/**
** Get here from the interrupt vector. Query the NVIC to get the active vector,
** and then dispatch it.
*/
void __attribute__((naked)) caribou_isr()
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

bool chip_move_vectors(ram,offset)
{
	return false;
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

void chip_reset()
{
    /* FIXME */
    for(;;); /* WTD timeout */
}

/**
** @brief Initialize the system TImer (Systick)
*/
static void initSysTick()
{
	uint32_t ticks = chip_clock_freq() / 1000;				/* number of ticks between interrupts */
	SysTick->LOAD  = (ticks & SysTick_LOAD_RELOAD_Msk) - 1;		/* set reload register */
	NVIC_SetPriority (SysTick_IRQn, (1<<__NVIC_PRIO_BITS) - 1);	/* set Priority for Cortex-M0 System Interrupts */
	SysTick->VAL   = 0;                                        	/* Load the SysTick Counter Value */
	SysTick->CTRL  = SysTick_CTRL_CLKSOURCE_Msk |
					SysTick_CTRL_TICKINT_Msk   |
					SysTick_CTRL_ENABLE_Msk;                    /* Enable SysTick IRQ and SysTick Timer */
}

/*
*/
void chip_init(int systick_hz)
{
	/** Interrupts are now disabled... */
	chip_interrupts_disable();
	initSysTick();
}

void __attribute__((naked)) chip_interrupts_enable(void)
{
	__asm(" cpsie   i\n"
          " bx      lr\n");
}

int __attribute__((naked)) chip_interrupts_disable(void)
{
	__asm(" push    {r1}\n"
		  " movs    r1,#1\n"
		  " mrs     r0, primask\n"
		  " eor     r0,r1\n"
		  " pop     {r1}\n"
		  " cpsid	i\n"
		  " bx  	lr\n");
}

int	__attribute__((naked)) chip_interrupts_enabled(void)
{
	__asm(" push    {r1}\n"
		  " movs    r1,#1\n"
		  " mrs     r0, primask\n"
		  " eor     r0,r1\n"
		  " pop     {r1}\n"
		  " bx  	lr\n");
}

void __attribute__((naked)) chip_wfi(void)
{
	__asm(" wfi\n bx lr\n");
}

// return the current interrupt level from the IPSR register
uint32_t __attribute__((naked)) chip_interrupt_level(void)
{
	__asm(" push    {r1}\n"
		  " mov     r1,#0x3F\n"
		  " mrs     r0, psr\n"
		  " and     r0,r1\n"
		  " pop     {r1}\n"
		  " bx  	lr\n");
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

// a brief delay
uint32_t chip_delay(uint32_t count)
{
	while(count) --count;
	return count; /* needed for optimizer */
}

// return the clock frequency
uint32_t chip_clock_freq(void)
{
	RCC_ClocksTypeDef RCC_Clocks;
	RCC_GetClocksFreq(&RCC_Clocks);
	return RCC_Clocks.SYSCLK_Frequency;
}
