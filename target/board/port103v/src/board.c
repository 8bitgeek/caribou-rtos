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
#include <board.h>
#include <caribou/dev/gpio.h>

static caribou_gpio_t led1 = CARIBOU_GPIO_INIT(GPIOE,CARIBOU_GPIO_PIN_3);
static caribou_gpio_t led2 = CARIBOU_GPIO_INIT(GPIOE,CARIBOU_GPIO_PIN_4);
static caribou_gpio_t led3 = CARIBOU_GPIO_INIT(GPIOE,CARIBOU_GPIO_PIN_5);
static caribou_gpio_t led4 = CARIBOU_GPIO_INIT(GPIOE,CARIBOU_GPIO_PIN_6);

void early_init()
{
	RCC_ClocksTypeDef SYS_Clocks;
	/* Enable HSE */   
	RCC_HSEConfig(RCC_HSE_ON);
	/* Wait till HSE is ready and if Time out is reached exit */
	while(RCC_WaitForHSEStartUp()!=SUCCESS);
	RCC_SYSCLKConfig(RCC_SYSCLKSource_HSE);
	RCC_GetClocksFreq(&SYS_Clocks);

	SystemInit();
	SystemCoreClockUpdate();
	RCC_GetClocksFreq(&SYS_Clocks);

	RCC_AHBPeriphClockCmd(RCC_AHBPeriph_DMA1,ENABLE);
	RCC_AHBPeriphClockCmd(RCC_AHBPeriph_DMA2,ENABLE);
	RCC_APB1PeriphClockCmd(RCC_APB1Periph_DAC,ENABLE);

	RCC_AHBPeriphClockCmd(RCC_AHBPeriph_CRC,ENABLE);

	RCC_APB2PeriphClockCmd(RCC_APB2Periph_AFIO,ENABLE);

	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA,ENABLE);
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOB,ENABLE);
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOC,ENABLE);
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOD,ENABLE);
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOE,ENABLE);
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOF,ENABLE);
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOG,ENABLE);

	RCC_APB2PeriphClockCmd(RCC_APB2Periph_SPI1,ENABLE);
	RCC_APB1PeriphClockCmd(RCC_APB1Periph_SPI2,ENABLE);
	RCC_APB1PeriphClockCmd(RCC_APB1Periph_SPI3,ENABLE);

	RCC_APB1PeriphClockCmd(RCC_APB1Periph_I2C1,ENABLE);
	//RCC_APB1PeriphClockCmd(RCC_APB1Periph_I2C2,ENABLE);

	RCC_APB2PeriphClockCmd(RCC_APB2Periph_USART1,ENABLE);
	//RCC_APB1PeriphClockCmd(RCC_APB1Periph_USART2,ENABLE);
	//RCC_APB1PeriphClockCmd(RCC_APB1Periph_USART3,ENABLE);
	//RCC_APB1PeriphClockCmd(RCC_APB1Periph_USART4,ENABLE);
	//RCC_APB1PeriphClockCmd(RCC_APB1Periph_USART5,ENABLE);

	//RCC_APB2PeriphClockCmd(RCC_APB2Periph_ADC1,ENABLE);
	//RCC_APB2PeriphClockCmd(RCC_APB2Periph_ADC2,ENABLE);
	//RCC_APB2PeriphClockCmd(RCC_APB2Periph_ADC3,ENABLE);

	//RCC_APB2PeriphClockCmd(RCC_APB2Periph_TIM1,ENABLE);
	//RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM2,ENABLE);
	RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM3,ENABLE);
	RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM4,ENABLE);
	//RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM5,ENABLE);
	//RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM6,ENABLE);
	//RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM7,ENABLE);
	//RCC_APB2PeriphClockCmd(RCC_APB2Periph_TIM8,ENABLE);
	//RCC_APB2PeriphClockCmd(RCC_APB2Periph_TIM9,ENABLE);
	//RCC_APB2PeriphClockCmd(RCC_APB2Periph_TIM10,ENABLE);
	//RCC_APB2PeriphClockCmd(RCC_APB2Periph_TIM11,ENABLE);
	//RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM12,ENABLE);
	//RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM13,ENABLE);
	//RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM14,ENABLE);
	//RCC_APB2PeriphClockCmd(RCC_APB2Periph_TIM15,ENABLE);
	//RCC_APB2PeriphClockCmd(RCC_APB2Periph_TIM16,ENABLE);
	//RCC_APB2PeriphClockCmd(RCC_APB2Periph_TIM17,ENABLE);

	RCC_APB1PeriphClockCmd(RCC_APB1Periph_WWDG,ENABLE);
	//RCC_APB1PeriphClockCmd(RCC_APB1Periph_USB,ENABLE);
	//RCC_APB1PeriphClockCmd(RCC_APB1Periph_CAN1,ENABLE);
	RCC_APB1PeriphClockCmd(RCC_APB1Periph_BKP,ENABLE);
	RCC_APB1PeriphClockCmd(RCC_APB1Periph_PWR,ENABLE);
	RCC_APB1PeriphClockCmd(RCC_APB1Periph_CEC,ENABLE);

	GPIOA->CRL = CARIBOU_PORTA_CONFIG_L;
	GPIOA->CRH = CARIBOU_PORTA_CONFIG_H;

	GPIOB->CRL = CARIBOU_PORTB_CONFIG_L;
	GPIOB->CRH = CARIBOU_PORTB_CONFIG_H;

	GPIOC->CRL = CARIBOU_PORTC_CONFIG_L;
	GPIOC->CRH = CARIBOU_PORTC_CONFIG_H;

	GPIOD->CRL = CARIBOU_PORTD_CONFIG_L;
	GPIOD->CRH = CARIBOU_PORTD_CONFIG_H;

	GPIOE->CRL = CARIBOU_PORTE_CONFIG_L;
	GPIOE->CRH = CARIBOU_PORTE_CONFIG_H;
}

void late_init()
{
	_stdout = _stdin = _stderr = fopen(CONSOLE_USART,"rw"); // USART3 is stdio
}

void board_idle()
{
	static uint64_t last0 =0L;
	static uint64_t last1 =0L;
	static uint64_t last2 =0L;
	static uint32_t count=0;
	if ( (caribou_timer_ticks() - last0) > 16 )
	{
		caribou_gpio_toggle(&led1);
		caribou_gpio_toggle(&led2);
		last0 = caribou_timer_ticks();
	}
	if ( (caribou_timer_ticks() - last1) > 32 )
	{
		caribou_gpio_toggle(&led3);
		caribou_gpio_toggle(&led4);
		last1 = caribou_timer_ticks();
	}
	if ( (caribou_timer_ticks() - last2) > 128 )
	{
		printf("tick %d\n",count++);
		last2 = caribou_timer_ticks();
	}
}
