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
#include <chip/chip.h>
#include <stm32l4xx.h>
#include <stm32l4xx_hal_rcc.h>
#include <caribou/kernel/interrupt.h>

#define IWDG_START			0x0000CCCC	/* Starts the IWDG */
#define	IWDG_WRITE_ACCESS	0x00005555	/* Enable Write Access to PR and RLR Registers */
#define IWDG_REFRESH		0x0000AAAA	/* IWDG Reload Count Register */
#define IWDG_RELOAD			0x00000FFF	/* IWDG Reload Value */

#define DELAY_CAL_FACTOR ( 100 )		/* FIXME - run-time calibrate this */

__attribute__((weak)) void assert_param(int n)		{}

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
void chip_pend_svc_req(void)
{
	SCB->ICSR |= SCB_ICSR_PENDSVSET_Msk;
}

/**
 * @brief The IWDG get's it clock from the 40KHz LSI.
 * @param period [1-4096] milliseconds
 */
void chip_watchdog_init(uint32_t period)
{
	IWDG->KR = IWDG_START;									/* (1) Activate IWDG (not needed if done in option bytes) */
	IWDG->KR = IWDG_WRITE_ACCESS;							/* (2) Enable write access to IWDG registers */
	IWDG->PR = IWDG_PR_PR_1 | IWDG_PR_PR_0;					/* (3) Prescaler/32 scales RLR [000-FFF] to [1-4096] ms */
	IWDG->RLR = period-1;									/* (4) Set reload value to have a rollover each period */
	while (IWDG->SR);										/* (5) Wait if flags are reset */
	chip_watchdog_feed();									/* (6) Refresh counter */
}



/**
 * @brief Feed watchdog.
 */
void chip_watchdog_feed()
{
	IWDG->KR = IWDG_REFRESH; /* (6) */
}

void chip_idle()
{
	chip_reset_watchdog();
}

/**
** @brief Initialize the system TImer (Systick)
*/
static void init_core_timer()
{
	uint32_t ticks = chip_clock_freq() / 1000;					/* number of ticks between interrupts */
	SysTick->LOAD  = (ticks & SysTick_LOAD_RELOAD_Msk) - 1;		/* set reload register */
	//NVIC_SetPriority (SysTick_IRQn, (1<<__NVIC_PRIO_BITS) - 1);	/* set Priority for Cortex-M0 System Interrupts */
	NVIC_SetPriority (SysTick_IRQn, 0);							/* set Priority for Cortex-M0 System Interrupts */
	SysTick->VAL   = 0;											/* Load the SysTick Counter Value */
	SysTick->CTRL  = SysTick_CTRL_CLKSOURCE_Msk |
					SysTick_CTRL_TICKINT_Msk   |
					SysTick_CTRL_ENABLE_Msk;					/* Enable SysTick IRQ and SysTick Timer */
}

/**
** @brief Initialize the watchdog timer.
*/
static void init_wd_timer()
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
	init_core_timer();
	init_wd_timer();
}

void chip_hw_peripheral_enable(uint32_t periph)
{
	/** FIXME */
}

void chip_hw_peripheral_disable(uint32_t periph)
{
	/** FIXME */
}

void chip_hw_set_pintype_uart(uint32_t ulPort, uint8_t ucPins)
{
	/** FIXME */
}

void chip_hw_set_gpio_dirmode(uint32_t ulPort, uint8_t ucPins, uint32_t ulPinIO)
{
	/** FIXME */
}

void chip_hw_set_gpio_padconfig(uint32_t ulPort, uint8_t ucPins, uint32_t ulStrength, uint32_t ulPinType)
{
	/** FIXME */
}

void chip_hw_config_gpio_pin(uint32_t ulPinConfig)
{
	/** FIXME */
}

void chip_gpio_pin_type_input(uint32_t ulPort, uint8_t ucPins)
{
	/** FIXME */
}

void chip_gpio_pin_type_output(uint32_t ulPort, uint8_t ucPins)
{
	/** FIXME */
}

uint32_t chip_hw_gpio_pin_read(uint32_t ulPort, uint8_t ucPins)
{
	/** FIXME */
	return 0;
}

void chip_hw_gpio_pin_write(uint32_t ulPort, uint8_t ucPins, uint8_t ucVal)
{
	/** FIXME */
}


void chip_hw_set_pin_type_i2c(uint32_t ulPort, uint8_t ucPins)
{
	/** FIXME */
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

int chip_vector_enabled(uint32_t vector)
{
	int rc;
	if ( vector < 32 )
		rc = (NVIC->ISER[0] & (1 << (uint32_t)vector)) ? 1 : 0;
	else if ( vector < 64 && vector >= 32 )
		rc = (NVIC->ISER[1] & (1 << (uint32_t)(vector-32))) ? 1 : 0;
	else if ( vector >= 64 )
		rc = (NVIC->ISER[2] & (1 << (uint32_t)(vector-64))) ? 1 : 0;
	return rc;
}

// enable a vectored interrupt
int chip_vector_enable(uint32_t vector)
{
	int rc=chip_vector_enabled(vector);
	if ( vector < 32 )
		NVIC->ISER[0] = (1 << (uint32_t)vector);
	else if ( vector < 64 && vector >= 32 )
		NVIC->ISER[1] = (1 << (uint32_t)(vector-32));
	else if ( vector >= 64 )
		NVIC->ISER[2] = (1 << (uint32_t)(vector-64));
	return rc;
}

// disable a vectored interrupt
int chip_vector_disable(uint32_t vector)
{
	int rc=chip_vector_enabled(vector);
	if ( vector < 32 )
		NVIC->ICER[0] = (1 << (uint32_t)vector);
	else if ( vector < 64 && vector >= 32 )
		NVIC->ICER[1] = (1 << (uint32_t)(vector-32));
	else if ( vector >= 64 )
		NVIC->ICER[2] = (1 << (uint32_t)(vector-64));
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
	return HAL_RCC_GetSysClockFreq();
}

void chip_reset()
{
	__DSB();													/* Ensure all outstanding memory accesses included
																	buffered write are completed before reset */
	SCB->AIRCR  = ((0x5FA << SCB_AIRCR_VECTKEY_Pos)      |
				 SCB_AIRCR_SYSRESETREQ_Msk);
	__DSB();													/* Ensure completion of memory access */
	for(;;);	
}

void chip_usec_delay(uint32_t usecs)
{
	uint32_t iterations = usecs / DELAY_CAL_FACTOR;

	for(int i=0; i<iterations; ++i)
	{
		__asm__ volatile // gcc-ish syntax, don't know what compiler is used
		(
		"nop\n\t"
		"nop\n\t"
		:::
		);
	}
}

extern void chip_get_uuid(uint32_t* uuid)
{
	volatile uint32_t* a = (uint32_t*)0x1FFF7590;
	uuid[0] = *a++;
	uuid[1] = *a++;
	uuid[2] = *a++;	
}