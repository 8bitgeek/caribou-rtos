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
#include "chip.h"
#include "stm32f0xx.h"

// The Cortex-M0 does not have a store-multiple-decsending instruction, so we have to manually
// add the offsets to r0 when pushing onto the stack. In addition, the M0 does not operate on
// multiple registers above r7, so we have to stack all the registers in two steps. Popping is
// pretty normal since the multiple registers are in ascending direction, with the only exception
// that reglist is limited to r0-r7, so it's also a two step process to pop all the registers.
#define isr_enter() 					\
	__asm (								\
		"	push	{lr}			\n" \
		"	push	{r4-r7}			\n"	\
		"	mov		r7,r8			\n"	\
		"	push	{r7}			\n"	\
		"	mov		r7,r9			\n" \
		"	push	{r7}			\n"	\
		"	mov		r7,r10			\n" \
		"	push	{r7}			\n"	\
		"	mov		r7,r11			\n"	\
		"	push	{r7}			\n"	)

//This loads the context from the PSP, the Cortex-M0 loads the other registers using hardware
#define isr_exit()					\
	__asm (								\
		"	pop		{r4-r7}			\n"	\
		"	mov		r11,r7			\n"	\
		"	mov		r10,r6			\n" \
		"	mov		r9,r5			\n" \
		"	mov		r8,r4			\n"	\
		"	pop		{r4-r7}			\n"	\
		"	pop		{pc}			\n"	)

__attribute__((weak)) void isr_wdg(InterruptVector vector)			{}
__attribute__((weak)) void isr_gpio(InterruptVector vector)			{}
__attribute__((weak)) void isr_uart(InterruptVector vector)			{}
__attribute__((weak)) void isr_ssi(InterruptVector vector)			{}
__attribute__((weak)) void isr_i2c(InterruptVector vector)			{}
__attribute__((weak)) void isr_timer(InterruptVector vector)		{}
__attribute__((weak)) void isr_ethernet(InterruptVector vector)		{}
__attribute__((weak)) void isr_hibernate(InterruptVector vector)	{}
__attribute__((weak)) void isr_default(InterruptVector vector)		{}


/**
 ** @brief User-land Interrupt Service Routine entry point.
 **/
void _isr(InterruptVector vector)
{
	switch (vector)
	{
		case Vector_WWDG:					isr_wdg(vector); break;
		case Vector_PVD:					isr_default(vector); break;
		case Vector_RTC:					isr_default(vector); break;
		case Vector_FLASH:					isr_default(vector); break;
		case Vector_RCC:					isr_default(vector); break;
		case Vector_EXTI0_1:				isr_gpio(vector); break;
		case Vector_EXTI2_3:				isr_gpio(vector); break;
		case Vector_EXTI4_15:				isr_gpio(vector); break;
		case Vector_TSC:					isr_default(vector); break;
		case Vector_DMA_CH1:				isr_default(vector); break;
		case Vector_DMA_CH2_3:				isr_default(vector); break;
		case Vector_DMA_CH4_5:				isr_default(vector); break;
		case Vector_ADC_COMP:				isr_default(vector); break;
		case Vector_TIM1_BRK_UP_TRG_COM:	isr_timer(vector); break;
		case Vector_TIM1_CC:				isr_timer(vector); break;
		case Vector_TIM2:					isr_timer(vector); break;
		case Vector_TIM3:					isr_timer(vector); break;
		case Vector_TIM6_DAC:				isr_timer(vector); break;
		case Vector_Reserved1:				isr_default(vector); break;
		case Vector_TIM14:					isr_timer(vector); break;
		case Vector_TIM15:					isr_timer(vector); break;
		case Vector_TIM16:					isr_timer(vector); break;
		case Vector_TIM17:					isr_timer(vector); break;
		case Vector_I2C1:					isr_i2c(vector); break;
		case Vector_I2C2:					isr_i2c(vector); break;
		case Vector_SPI1:					isr_ssi(vector); break;
		case Vector_SPI2:					isr_ssi(vector); break;
		case Vector_USART1:					isr_uart(vector); break;
		case Vector_USART2:					isr_uart(vector); break;
		case Vector_Reserved2:				isr_default(vector); break;
		case Vector_CEC:					isr_default(vector); break;
		case Vector_SoftSysTick:			isr_default(vector); break;	/** software induced Systick (STM32F051 resrved vector) */
	}
}


static void __attribute__((naked)) _isr_stm32f051(InterruptVector vector)
{
	isr_enter();
	_isr( vector );
	NVIC->ICPR[0] = (1 << (uint32_t)vector); /* Clear pending interrupt */
	isr_exit();
}

#if 0
/**
** Get here from the interrupt vector. Query the NVIC to get the active vector,
** and then dispatch it.
*/
void nvic_isr()
{
	isr_enter();

	InterruptVector vector = (InterruptVector)(HWREG(NVIC_INT_CTRL) & NVIC_INT_CTRL_VEC_ACT_M);
	_isr(vector);
	isr_exit();
}
#endif

void __attribute__((naked)) _isr_0()	{ __asm(" push {lr}\n"); _isr_stm32f051((InterruptVector)0); __asm(" pop {pc}\n"); }
void __attribute__((naked)) _isr_1()	{ __asm(" push {lr}\n"); _isr_stm32f051((InterruptVector)1); __asm(" pop {pc}\n"); }
void __attribute__((naked)) _isr_2()	{ __asm(" push {lr}\n"); _isr_stm32f051((InterruptVector)2); __asm(" pop {pc}\n"); }
void __attribute__((naked)) _isr_3()	{ __asm(" push {lr}\n"); _isr_stm32f051((InterruptVector)3); __asm(" pop {pc}\n"); }
void __attribute__((naked)) _isr_4()	{ __asm(" push {lr}\n"); _isr_stm32f051((InterruptVector)4); __asm(" pop {pc}\n"); }
void __attribute__((naked)) _isr_5()	{ __asm(" push {lr}\n"); _isr_stm32f051((InterruptVector)5); __asm(" pop {pc}\n"); }
void __attribute__((naked)) _isr_6()	{ __asm(" push {lr}\n"); _isr_stm32f051((InterruptVector)6); __asm(" pop {pc}\n"); }
void __attribute__((naked)) _isr_7()	{ __asm(" push {lr}\n"); _isr_stm32f051((InterruptVector)7); __asm(" pop {pc}\n"); }
void __attribute__((naked)) _isr_8()	{ __asm(" push {lr}\n"); _isr_stm32f051((InterruptVector)8); __asm(" pop {pc}\n"); }
void __attribute__((naked)) _isr_9()	{ __asm(" push {lr}\n"); _isr_stm32f051((InterruptVector)9); __asm(" pop {pc}\n"); }
void __attribute__((naked)) _isr_10()	{ __asm(" push {lr}\n"); _isr_stm32f051((InterruptVector)10); __asm(" pop {pc}\n"); }
void __attribute__((naked)) _isr_11()	{ __asm(" push {lr}\n"); _isr_stm32f051((InterruptVector)11); __asm(" pop {pc}\n"); }
void __attribute__((naked)) _isr_12()	{ __asm(" push {lr}\n"); _isr_stm32f051((InterruptVector)12); __asm(" pop {pc}\n"); }
void __attribute__((naked)) _isr_13()	{ __asm(" push {lr}\n"); _isr_stm32f051((InterruptVector)13); __asm(" pop {pc}\n"); }
void __attribute__((naked)) _isr_14()	{ __asm(" push {lr}\n"); _isr_stm32f051((InterruptVector)14); __asm(" pop {pc}\n"); }
void __attribute__((naked)) _isr_15()	{ __asm(" push {lr}\n"); _isr_stm32f051((InterruptVector)15); __asm(" pop {pc}\n"); }
void __attribute__((naked)) _isr_16()	{ __asm(" push {lr}\n"); _isr_stm32f051((InterruptVector)16); __asm(" pop {pc}\n"); }
void __attribute__((naked)) _isr_17()	{ __asm(" push {lr}\n"); _isr_stm32f051((InterruptVector)17); __asm(" pop {pc}\n"); }
void __attribute__((naked)) _isr_18()	{ __asm(" push {lr}\n"); _isr_stm32f051((InterruptVector)18); __asm(" pop {pc}\n"); }
void __attribute__((naked)) _isr_19()	{ __asm(" push {lr}\n"); _isr_stm32f051((InterruptVector)19); __asm(" pop {pc}\n"); }
void __attribute__((naked)) _isr_20()	{ __asm(" push {lr}\n"); _isr_stm32f051((InterruptVector)20); __asm(" pop {pc}\n"); }
void __attribute__((naked)) _isr_21()	{ __asm(" push {lr}\n"); _isr_stm32f051((InterruptVector)21); __asm(" pop {pc}\n"); }
void __attribute__((naked)) _isr_22()	{ __asm(" push {lr}\n"); _isr_stm32f051((InterruptVector)22); __asm(" pop {pc}\n"); }
void __attribute__((naked)) _isr_23()	{ __asm(" push {lr}\n"); _isr_stm32f051((InterruptVector)23); __asm(" pop {pc}\n"); }
void __attribute__((naked)) _isr_24()	{ __asm(" push {lr}\n"); _isr_stm32f051((InterruptVector)24); __asm(" pop {pc}\n"); }
void __attribute__((naked)) _isr_25()	{ __asm(" push {lr}\n"); _isr_stm32f051((InterruptVector)25); __asm(" pop {pc}\n"); }
void __attribute__((naked)) _isr_26()	{ __asm(" push {lr}\n"); _isr_stm32f051((InterruptVector)26); __asm(" pop {pc}\n"); }
void __attribute__((naked)) _isr_27()	{ __asm(" push {lr}\n"); _isr_stm32f051((InterruptVector)27); __asm(" pop {pc}\n"); }
void __attribute__((naked)) _isr_28()	{ __asm(" push {lr}\n"); _isr_stm32f051((InterruptVector)28); __asm(" pop {pc}\n"); }
void __attribute__((naked)) _isr_29()	{ __asm(" push {lr}\n"); _isr_stm32f051((InterruptVector)29); __asm(" pop {pc}\n"); }
void __attribute__((naked)) _isr_30()	{ __asm(" push {lr}\n"); _isr_stm32f051((InterruptVector)30); __asm(" pop {pc}\n"); }
void __attribute__((naked)) _isr_31()	{ __asm(" push {lr}\n"); _isr_stm32f051((InterruptVector)31); __asm(" pop {pc}\n"); }

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
void chip_systick_irq_enable(void)
{
	SysTick->CTRL |= SysTick_CTRL_TICKINT_Msk;	/* enable hardware interrupt */
}

/**
* @brief Disbale the systick IRQ
*/
void chip_systick_irq_disable(void)
{
	SysTick->CTRL &= ~SysTick_CTRL_TICKINT_Msk;	/* enable hardware interrupt */
}

/**
* @brief Set the systick IRQ state.
*/
void chip_systick_irq_set(int enable)
{
	if (enable)
		chip_systick_irq_enable();
	else
		chip_systick_irq_disable();
}

/**
* @brief Did the systick timer cause the systick?
* @return true of the systick was causedd by a hardware interrupt.
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

void chip_systick_enter(void)
{
	int vector = SCB->ICSR & SCB_ICSR_VECTACTIVE_Msk;
	switch(vector)
	{
		case 14:
			SCB->ICSR |= SCB_ICSR_PENDSVCLR_Msk;
			break;
		case 15:
			SCB->ICSR |= SCB_ICSR_PENDSTCLR_Msk;
			break;
	}
}

void chip_systick_exit(void)
{
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
	volatile uint32_t StartUpCounter = 0, HSEStatus = 0;

	#if defined (PLL_SOURCE_HSI)
		FLASH->ACR = FLASH_ACR_PRFTBE | FLASH_ACR_LATENCY;		/* Enable Prefetch Buffer and set Flash Latency */
		RCC->CFGR |= (uint32_t)RCC_CFGR_HPRE_DIV1;				/* HCLK = SYSCLK */
		RCC->CFGR |= (uint32_t)RCC_CFGR_PPRE_DIV1;				/* PCLK = HCLK */
		/* PLL configuration = (HSI/2) * 12 = ~48 MHz */
		RCC->CFGR &= (uint32_t)((uint32_t)~(RCC_CFGR_PLLSRC | RCC_CFGR_PLLXTPRE | RCC_CFGR_PLLMULL));
		RCC->CFGR |= (uint32_t)(RCC_CFGR_PLLSRC_HSI_Div2 | RCC_CFGR_PLLXTPRE_PREDIV1 | RCC_CFGR_PLLMULL12);
		RCC->CR |= RCC_CR_PLLON;								/* Enable PLL */
		while((RCC->CR & RCC_CR_PLLRDY) == 0);					/* Wait till PLL is ready */
		RCC->CFGR &= (uint32_t)((uint32_t)~(RCC_CFGR_SW));		/* Select PLL as system clock source */
		RCC->CFGR |= (uint32_t)RCC_CFGR_SW_PLL;
		/* Wait till PLL is used as system clock source */
		while ((RCC->CFGR & (uint32_t)RCC_CFGR_SWS) != (uint32_t)RCC_CFGR_SWS_PLL);

	#else
		#if defined (PLL_SOURCE_HSE)
			RCC->CR |= ((uint32_t)RCC_CR_HSEON); 				/* Enable HSE */
		#elif defined (PLL_SOURCE_HSE_BYPASS)
			RCC->CR |= (uint32_t)(RCC_CR_HSEON | RCC_CR_HSEBYP);	/* HSE oscillator bypassed with external clock */
		#endif /* PLL_SOURCE_HSE */

		/* Wait till HSE is ready and if Time out is reached exit */
		do
		{
			HSEStatus = RCC->CR & RCC_CR_HSERDY;
			StartUpCounter++;
		} while((HSEStatus == 0) && (StartUpCounter != HSE_STARTUP_TIMEOUT));

		if ((RCC->CR & RCC_CR_HSERDY) != RESET)
			HSEStatus = (uint32_t)0x01;
		else
			HSEStatus = (uint32_t)0x00;

		if (HSEStatus == (uint32_t)0x01)
		{
			FLASH->ACR = FLASH_ACR_PRFTBE | FLASH_ACR_LATENCY;	/* Enable Prefetch Buffer and set Flash Latency */
			RCC->CFGR |= (uint32_t)RCC_CFGR_HPRE_DIV1;			/* HCLK = SYSCLK */
			RCC->CFGR |= (uint32_t)RCC_CFGR_PPRE_DIV1;			/* PCLK = HCLK */
			/* PLL configuration = HSE * 6 = 48 MHz */
			RCC->CFGR &= (uint32_t)((uint32_t)~(RCC_CFGR_PLLSRC | RCC_CFGR_PLLXTPRE | RCC_CFGR_PLLMULL));
			RCC->CFGR |= (uint32_t)(RCC_CFGR_PLLSRC_PREDIV1 | RCC_CFGR_PLLXTPRE_PREDIV1 | RCC_CFGR_PLLMULL6);
			RCC->CR |= RCC_CR_PLLON;							/* Enable PLL */
			while((RCC->CR & RCC_CR_PLLRDY) == 0);				/* Wait till PLL is ready */
			/* Select PLL as system clock source */
			RCC->CFGR &= (uint32_t)((uint32_t)~(RCC_CFGR_SW));
			RCC->CFGR |= (uint32_t)RCC_CFGR_SW_PLL;
			/* Wait till PLL is used as system clock source */
			while ((RCC->CFGR & (uint32_t)RCC_CFGR_SWS) != (uint32_t)RCC_CFGR_SWS_PLL);
		}
		else
		{
			for(;;);
		}
	#endif /* PLL_SOURCE_HSI */

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


//*****************************************************************************
void chip_hw_peripheral_enable(uint32_t periph)
{
	/** FIXME */
}

//*****************************************************************************
void chip_hw_peripheral_disable(uint32_t periph)
{
	/** FIXME */
}

//*****************************************************************************
//
//! Configures pin(s) for use by the UART peripheral.
//!
//! \param ulPort is the base address of the GPIO port.
//! \param ucPins is the bit-packed representation of the pin(s).
//!
//! The UART pins must be properly configured for the UART peripheral to
//! function correctly.  This function provides a typical configuration for
//! those pin(s); other configurations may work as well depending upon the
//! board setup (for example, using the on-chip pull-ups).
//!
//! The pin(s) are specified using a bit-packed byte, where each bit that is
//! set identifies the pin to be accessed, and where bit 0 of the byte
//! represents GPIO port pin 0, bit 1 represents GPIO port pin 1, and so on.
//!
//! \note This cannot be used to turn any pin into a UART pin; it only
//! configures a UART pin for proper operation.
//!
//! \return None.
//
//*****************************************************************************
void chip_hw_set_pintype_uart(uint32_t ulPort, uint8_t ucPins)
{
	/** FIXME */
}

//*****************************************************************************
//
//! Sets the direction and mode of the specified pin(s).
//!
//! \param ulPort is the base address of the GPIO port
//! \param ucPins is the bit-packed representation of the pin(s).
//! \param ulPinIO is the pin direction and/or mode.
//!
//! This function will set the specified pin(s) on the selected GPIO port
//! as either an input or output under software control, or it will set the
//! pin to be under hardware control.
//!
//! The parameter \e ulPinIO is an enumerated data type that can be one of
//! the following values:
//!
//! - \b GPIO_DIR_MODE_IN
//! - \b GPIO_DIR_MODE_OUT
//! - \b GPIO_DIR_MODE_HW
//!
//! where \b GPIO_DIR_MODE_IN specifies that the pin will be programmed as
//! a software controlled input, \b GPIO_DIR_MODE_OUT specifies that the pin
//! will be programmed as a software controlled output, and
//! \b GPIO_DIR_MODE_HW specifies that the pin will be placed under
//! hardware control.
//!
//! The pin(s) are specified using a bit-packed byte, where each bit that is
//! set identifies the pin to be accessed, and where bit 0 of the byte
//! represents GPIO port pin 0, bit 1 represents GPIO port pin 1, and so on.
//!
//! \note GPIOPadConfigSet() must also be used to configure the corresponding
//! pad(s) in order for them to propagate the signal to/from the GPIO.
//!
//! \return None.
//
//*****************************************************************************
void chip_hw_set_gpio_dirmode(uint32_t ulPort, uint8_t ucPins, uint32_t ulPinIO)
{
	/** FIXME */
}


//*****************************************************************************
//
//! Sets the pad configuration for the specified pin(s).
//!
//! \param ulPort is the base address of the GPIO port.
//! \param ucPins is the bit-packed representation of the pin(s).
//! \param ulStrength specifies the output drive strength.
//! \param ulPinType specifies the pin type.
//!
//! This function sets the drive strength and type for the specified pin(s)
//! on the selected GPIO port.  For pin(s) configured as input ports, the
//! pad is configured as requested, but the only real effect on the input
//! is the configuration of the pull-up or pull-down termination.
//!
//! The parameter \e ulStrength can be one of the following values:
//!
//! - \b GPIO_STRENGTH_2MA
//! - \b GPIO_STRENGTH_4MA
//! - \b GPIO_STRENGTH_8MA
//! - \b GPIO_STRENGTH_8MA_SC
//!
//! where \b GPIO_STRENGTH_xMA specifies either 2, 4, or 8 mA output drive
//! strength, and \b GPIO_OUT_STRENGTH_8MA_SC specifies 8 mA output drive with
//! slew control.
//!
//! The parameter \e ulPinType can be one of the following values:
//!
//! - \b GPIO_PIN_TYPE_STD
//! - \b GPIO_PIN_TYPE_STD_WPU
//! - \b GPIO_PIN_TYPE_STD_WPD
//! - \b GPIO_PIN_TYPE_OD
//! - \b GPIO_PIN_TYPE_OD_WPU
//! - \b GPIO_PIN_TYPE_OD_WPD
//! - \b GPIO_PIN_TYPE_ANALOG
//!
//! where \b GPIO_PIN_TYPE_STD* specifies a push-pull pin, \b GPIO_PIN_TYPE_OD*
//! specifies an open-drain pin, \b *_WPU specifies a weak pull-up, \b *_WPD
//! specifies a weak pull-down, and \b GPIO_PIN_TYPE_ANALOG specifies an
//! analog input (for the comparators).
//!
//! The pin(s) are specified using a bit-packed byte, where each bit that is
//! set identifies the pin to be accessed, and where bit 0 of the byte
//! represents GPIO port pin 0, bit 1 represents GPIO port pin 1, and so on.
//!
//! \return None.
//
//*****************************************************************************
void chip_hw_set_gpio_padconfig(uint32_t ulPort, uint8_t ucPins, uint32_t ulStrength, uint32_t ulPinType)
{
	/** FIXME */
}

//*****************************************************************************
//
//! Configures the alternate function of a GPIO pin.
//!
//! \param ulPinConfig is the pin configuration value, specified as only one of
//! the \b GPIO_P??_??? values.
//!
//! This function configures the pin mux that selects the peripheral function
//! associated with a particular GPIO pin.  Only one peripheral function at a
//! time can be associated with a GPIO pin, and each peripheral function should
//! only be associated with a single GPIO pin at a time (despite the fact that
//! many of them can be associated with more than one GPIO pin).
//!
//! \note This function is only valid on Tempest-class devices.
//!
//! \return None.
//
//*****************************************************************************
void chip_hw_config_gpio_pin(uint32_t ulPinConfig)
{
	/** FIXME */
}

//*****************************************************************************
//
//! Configures pin(s) for use as GPIO inputs.
//!
//! \param ulPort is the base address of the GPIO port.
//! \param ucPins is the bit-packed representation of the pin(s).
//!
//! The GPIO pins must be properly configured in order to function correctly as
//! GPIO inputs; this is especially true of Fury-class devices where the
//! digital input enable is turned off by default.  This function provides the
//! proper configuration for those pin(s).
//!
//! The pin(s) are specified using a bit-packed byte, where each bit that is
//! set identifies the pin to be accessed, and where bit 0 of the byte
//! represents GPIO port pin 0, bit 1 represents GPIO port pin 1, and so on.
//!
//! \return None.
//
//*****************************************************************************
void chip_gpio_pin_type_input(uint32_t ulPort, uint8_t ucPins)
{
    /** FIXME */
}

//*****************************************************************************
//
//! Configures pin(s) for use as GPIO outputs.
//!
//! \param ulPort is the base address of the GPIO port.
//! \param ucPins is the bit-packed representation of the pin(s).
//!
//! The GPIO pins must be properly configured in order to function correctly as
//! GPIO outputs; this is especially true of Fury-class devices where the
//! digital input enable is turned off by default.  This function provides the
//! proper configuration for those pin(s).
//!
//! The pin(s) are specified using a bit-packed byte, where each bit that is
//! set identifies the pin to be accessed, and where bit 0 of the byte
//! represents GPIO port pin 0, bit 1 represents GPIO port pin 1, and so on.
//!
//! \return None.
//
//*****************************************************************************
void chip_gpio_pin_type_output(uint32_t ulPort, uint8_t ucPins)
{
    /** FIXME */
}



//*****************************************************************************
//
//! Reads the values present of the specified pin(s).
//!
//! \param ulPort is the base address of the GPIO port.
//! \param ucPins is the bit-packed representation of the pin(s).
//!
//! The values at the specified pin(s) are read, as specified by \e ucPins.
//! Values are returned for both input and output pin(s), and the value
//! for pin(s) that are not specified by \e ucPins are set to 0.
//!
//! The pin(s) are specified using a bit-packed byte, where each bit that is
//! set identifies the pin to be accessed, and where bit 0 of the byte
//! represents GPIO port pin 0, bit 1 represents GPIO port pin 1, and so on.
//!
//! \return Returns a bit-packed byte providing the state of the specified
//! pin, where bit 0 of the byte represents GPIO port pin 0, bit 1 represents
//! GPIO port pin 1, and so on.  Any bit that is not specified by \e ucPins
//! is returned as a 0.  Bits 31:8 should be ignored.
//
//*****************************************************************************
uint32_t chip_hw_gpio_pin_read(uint32_t ulPort, uint8_t ucPins)
{
	/** FIXME */
    return 0;
}

//*****************************************************************************
//
//! Writes a value to the specified pin(s).
//!
//! \param ulPort is the base address of the GPIO port.
//! \param ucPins is the bit-packed representation of the pin(s).
//! \param ucVal is the value to write to the pin(s).
//!
//! Writes the corresponding bit values to the output pin(s) specified by
//! \e ucPins.  Writing to a pin configured as an input pin has no effect.
//!
//! The pin(s) are specified using a bit-packed byte, where each bit that is
//! set identifies the pin to be accessed, and where bit 0 of the byte
//! represents GPIO port pin 0, bit 1 represents GPIO port pin 1, and so on.
//!
//! \return None.
//
//*****************************************************************************
void chip_hw_gpio_pin_write(uint32_t ulPort, uint8_t ucPins, uint8_t ucVal)
{
    /** FIXME */
}

//*****************************************************************************
//
//! Configures pin(s) for use by the I2C peripheral.
//!
//! \param ulPort is the base address of the GPIO port.
//! \param ucPins is the bit-packed representation of the pin(s).
//!
//! The I2C pins must be properly configured for the I2C peripheral to function
//! correctly.  This function provides the proper configuration for those
//! pin(s).
//!
//! The pin(s) are specified using a bit-packed byte, where each bit that is
//! set identifies the pin to be accessed, and where bit 0 of the byte
//! represents GPIO port pin 0, bit 1 represents GPIO port pin 1, and so on.
//!
//! \note This cannot be used to turn any pin into an I2C pin; it only
//! configures an I2C pin for proper operation.
//!
//! \return None.
//
//*****************************************************************************
void chip_hw_set_pin_type_i2c(uint32_t ulPort, uint8_t ucPins)
{
	/** FIXME */
}

//*****************************************************************************
//
//! Configures pin(s) for use by the SSI peripheral.
//!
//! \param ulPort is the base address of the GPIO port.
//! \param ucPins is the bit-packed representation of the pin(s).
//!
//! The SSI pins must be properly configured for the SSI peripheral to function
//! correctly.  This function provides a typical configuration for those
//! pin(s); other configurations may work as well depending upon the board
//! setup (for example, using the on-chip pull-ups).
//!
//! The pin(s) are specified using a bit-packed byte, where each bit that is
//! set identifies the pin to be accessed, and where bit 0 of the byte
//! represents GPIO port pin 0, bit 1 represents GPIO port pin 1, and so on.
//!
//! \note This function cannot be used to turn any pin into a SSI pin; it only
//! configures a SSI pin for proper operation. Devices with flexible pin
//! muxing also require a GPIOPinConfigure() function call.
//!
//! \return None.
//
//*****************************************************************************
void chip_hw_set_pin_type_ssi(uint32_t ulPort, uint8_t ucPins)
{
	/** FIXME */
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
void chip_vector_enable(uint32_t vector)
{
	NVIC->ISER[0] = 1 << (uint32_t)vector;
}

// disable a vectored interrupt
void chip_vector_disable(uint32_t vector)
{
	NVIC->ICER[0] = 1 << (uint32_t)vector;
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
	static uint8_t AHBPrescTable[16] = {0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 3, 4, 6, 7, 8, 9};
	uint32_t rc = 0;
	uint32_t tmp = 0;
	uint32_t pllmull = 0;
	uint32_t pllsource = 0;
	uint32_t prediv1factor = 0;

	/* Get SYSCLK source -------------------------------------------------------*/
	tmp = RCC->CFGR & RCC_CFGR_SWS;

	switch (tmp)
	{
		case 0x00:  /* HSI used as system clock */
			rc = HSI_VALUE;
			break;
		case 0x04:  /* HSE used as system clock */
			rc = HSE_VALUE;
			break;
		case 0x08:  /* PLL used as system clock */
			/* Get PLL clock source and multiplication factor ----------------------*/
			pllmull = RCC->CFGR & RCC_CFGR_PLLMULL;
			pllsource = RCC->CFGR & RCC_CFGR_PLLSRC;
			pllmull = ( pllmull >> 18) + 2;

			if (pllsource == 0x00)
			{
				/* HSI oscillator clock divided by 2 selected as PLL clock entry */
				rc = (HSI_VALUE >> 1) * pllmull;
			}
			else
			{
				prediv1factor = (RCC->CFGR2 & RCC_CFGR2_PREDIV1) + 1;
				/* HSE oscillator clock selected as PREDIV1 clock entry */
				rc = (HSE_VALUE / prediv1factor) * pllmull;
			}
			break;
		default: /* HSI used as system clock */
			rc = HSI_VALUE;
		  break;
	}
  /* Compute HCLK clock frequency ----------------*/
  /* Get HCLK prescaler */
  tmp = AHBPrescTable[((RCC->CFGR & RCC_CFGR_HPRE) >> 4)];
  /* HCLK clock frequency */
  rc >>= tmp;
  return rc;
}
