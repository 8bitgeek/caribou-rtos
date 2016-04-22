/******************************************************************************
* Copyright © 2016 by Pike Aerospace Research Corporation
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
#include <board.h>
#include <stm32f0xx_rcc.h>

void early_init()
{
	SystemInit();

	RCC->AHBENR |=	(	RCC_AHBPeriph_DMA1		|
						RCC_AHBPeriph_GPIOA		|
						RCC_AHBPeriph_GPIOB		|
						RCC_AHBPeriph_GPIOF		);

	RCC->APB1ENR |= (	RCC_APB1Periph_I2C1		|
						RCC_APB1Periph_TIM3		|
						RCC_APB1Periph_WWDG		|
						RCC_APB1Periph_PWR		);

	RCC->APB2ENR |= (	RCC_APB2Periph_USART1	|
						RCC_APB2Periph_ADC1		|
						RCC_APB2Periph_TIM1		);

	/* PORT A */
	GPIOA->MODER = CARIBOU_PORTA_MODE;
	GPIOA->OTYPER = CARIBOU_PORTA_OTYPER;
	GPIOA->OSPEEDR = CARIBOU_PORTA_OSPEEDR;
	GPIOA->PUPDR = CARIBOU_PORTA_PUPDR;
	GPIOA->AFR[0] = CARIBOU_PORTA_AFRL;
	GPIOA->AFR[1] = CARIBOU_PORTA_AFRH;
	/* PORT B */
	GPIOB->MODER = CARIBOU_PORTB_MODE;
	GPIOB->OTYPER = CARIBOU_PORTB_OTYPER;
	GPIOB->OSPEEDR = CARIBOU_PORTB_OSPEEDR;
	GPIOB->PUPDR = CARIBOU_PORTB_PUPDR;
	GPIOB->AFR[0] = CARIBOU_PORTB_AFRL;
	GPIOB->AFR[1] = CARIBOU_PORTB_AFRH;
	/* PORT C */
	GPIOC->MODER = CARIBOU_PORTC_MODE;
	GPIOC->OTYPER = CARIBOU_PORTC_OTYPER;
	GPIOC->OSPEEDR = CARIBOU_PORTC_OSPEEDR;
	GPIOC->PUPDR = CARIBOU_PORTC_PUPDR;
	GPIOC->AFR[0] = CARIBOU_PORTC_AFRL;
	GPIOC->AFR[1] = CARIBOU_PORTC_AFRH;
	/* PORT F */
	GPIOF->MODER = CARIBOU_PORTF_MODE;
	GPIOF->OTYPER = CARIBOU_PORTF_OTYPER;
	GPIOF->OSPEEDR = CARIBOU_PORTF_OSPEEDR;
	GPIOF->PUPDR = CARIBOU_PORTF_PUPDR;
	GPIOF->AFR[0] = CARIBOU_PORTF_AFRL;
	GPIOF->AFR[1] = CARIBOU_PORTF_AFRH;
}

void late_init()
{
}
