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
#ifndef _CARIBOU_VECTORS_H_
#define _CARIBOU_VECTORS_H_

#define	SYS_IRQ			32					/* number of IRQs */

/**
** Interrupt vectors enumerated...
*/
typedef	enum
{

	Vector_WWDG,
	Vector_PVD,
	Vector_RTC,
	Vector_FLASH,
	Vector_RCC,
	Vector_EXTI0_1,
	Vector_EXTI2_3,
	Vector_EXTI4_15,
	Vector_TSC,
	Vector_DMA_CH1,
	Vector_DMA_CH2_3,
	Vector_DMA_CH4_5,
	Vector_ADC_COMP,
	Vector_TIM1_BRK_UP_TRG_COM,
	Vector_TIM1_CC,
	Vector_TIM2,

	Vector_TIM3,
	Vector_TIM6_DAC,										/** DMA Error */
	Vector_Reserved1,
	Vector_TIM14,
	Vector_TIM15,
	Vector_TIM16,
	Vector_TIM17,										/** 21 Time Base #0 */
	Vector_I2C1,
	Vector_I2C2,
	Vector_SPI1,
	Vector_SPI2,
	Vector_USART1,
	Vector_USART2,
	Vector_Reserved2,
	Vector_CEC,
	Vector_SoftSysTick,									/** software induced Systick (STM32F051 resrved vector) */

} InterruptVector;

#endif