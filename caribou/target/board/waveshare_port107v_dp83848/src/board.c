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
#include <caribou/kernel/interrupt.h>

caribou_gpio_t led1	= CARIBOU_GPIO_INIT(GPIOE,CARIBOU_GPIO_PIN_7);
caribou_gpio_t led2	= CARIBOU_GPIO_INIT(GPIOE,CARIBOU_GPIO_PIN_8);
caribou_gpio_t led3	= CARIBOU_GPIO_INIT(GPIOE,CARIBOU_GPIO_PIN_9);
caribou_gpio_t led4	= CARIBOU_GPIO_INIT(GPIOE,CARIBOU_GPIO_PIN_10);

caribou_gpio_t key1	= CARIBOU_GPIO_INIT(GPIOB,CARIBOU_GPIO_PIN_13);
caribou_gpio_t key2	= CARIBOU_GPIO_INIT(GPIOB,CARIBOU_GPIO_PIN_14);
caribou_gpio_t key3	= CARIBOU_GPIO_INIT(GPIOB,CARIBOU_GPIO_PIN_15);

caribou_gpio_t joy1	= CARIBOU_GPIO_INIT(GPIOD,CARIBOU_GPIO_PIN_8);
caribou_gpio_t joy2	= CARIBOU_GPIO_INIT(GPIOD,CARIBOU_GPIO_PIN_9);
caribou_gpio_t joy3	= CARIBOU_GPIO_INIT(GPIOD,CARIBOU_GPIO_PIN_10);
caribou_gpio_t joy4	= CARIBOU_GPIO_INIT(GPIOD,CARIBOU_GPIO_PIN_11);
caribou_gpio_t joy5	= CARIBOU_GPIO_INIT(GPIOD,CARIBOU_GPIO_PIN_12);

void early_init()
{
	EXTI_InitTypeDef EXTI_InitStructure;
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

	/* Select USBCLK source */
	//RCC_USBCLKConfig(RCC_USBCLKSource_PLLCLK_1Div5);

    //RCC_AHBPeriphClockCmd(RCC_AHBPeriph_ETH_MAC,ENABLE);
    //RCC_AHBPeriphClockCmd(RCC_AHBPeriph_ETH_MAC_Tx,ENABLE);
    //RCC_AHBPeriphClockCmd(RCC_AHBPeriph_ETH_MAC_Rx,ENABLE);

	/* Enable AFIO clock */
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_AFIO, ENABLE);

	RCC_AHBPeriphClockCmd(RCC_AHBPeriph_DMA1,ENABLE);
	RCC_AHBPeriphClockCmd(RCC_AHBPeriph_DMA2,ENABLE);
	//RCC_APB1PeriphClockCmd(RCC_APB1Periph_DAC,ENABLE);

	RCC_AHBPeriphClockCmd(RCC_AHBPeriph_CRC,ENABLE);

	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA,ENABLE);
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOB,ENABLE);
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOC,ENABLE);
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOD,ENABLE);
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOE,ENABLE);
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOF,ENABLE);
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOG,ENABLE);

	//RCC_APB2PeriphClockCmd(RCC_APB2Periph_SPI1,ENABLE);
	//RCC_APB1PeriphClockCmd(RCC_APB1Periph_SPI2,ENABLE);
	//RCC_APB1PeriphClockCmd(RCC_APB1Periph_SPI3,ENABLE);

	//RCC_APB1PeriphClockCmd(RCC_APB1Periph_I2C1,ENABLE);
	//RCC_APB1PeriphClockCmd(RCC_APB1Periph_I2C2,ENABLE);

	//RCC_APB2PeriphClockCmd(RCC_APB2Periph_USART1,ENABLE);
	//RCC_APB1PeriphClockCmd(RCC_APB1Periph_USART2,ENABLE);
	RCC_APB1PeriphClockCmd(RCC_APB1Periph_USART3,ENABLE);
	//RCC_APB1PeriphClockCmd(RCC_APB1Periph_USART4,ENABLE);
	//RCC_APB1PeriphClockCmd(RCC_APB1Periph_USART5,ENABLE);

	RCC_APB2PeriphClockCmd(RCC_APB2Periph_ADC1,ENABLE);
	//RCC_APB2PeriphClockCmd(RCC_APB2Periph_ADC2,ENABLE);
	//RCC_APB2PeriphClockCmd(RCC_APB2Periph_ADC3,ENABLE);

	RCC_APB2PeriphClockCmd(RCC_APB2Periph_TIM1,ENABLE);
	//RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM2,ENABLE);
	RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM3,ENABLE);
	//RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM4,ENABLE);
	//RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM5,ENABLE);
	//RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM6,ENABLE);
	//RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM7,ENABLE);
	//RCC_APB2PeriphClockCmd(RCC_APB2Periph_TIM8,ENABLE);
	//RCC_APB2PeriphClockCmd(RCC_APB2Periph_TIM9,ENABLE);
	//RCC_APB2PeriphClockCmd(RCC_APB2Periph_TIM30,ENABLE);
	//RCC_APB2PeriphClockCmd(RCC_APB2Periph_TIM31,ENABLE);
	//RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM32,ENABLE);
	//RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM33,ENABLE);
	//RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM34,ENABLE);
	//RCC_APB2PeriphClockCmd(RCC_APB2Periph_TIM35,ENABLE);
	//RCC_APB2PeriphClockCmd(RCC_APB2Periph_TIM36,ENABLE);
	//RCC_APB2PeriphClockCmd(RCC_APB2Periph_TIM37,ENABLE);

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

	/* Configure the EXTI line 18 connected internally to the USB IP */
	//EXTI_ClearITPendingBit(EXTI_Line18);
	//EXTI_InitStructure.EXTI_Mode = EXTI_Mode_Interrupt;
	//EXTI_InitStructure.EXTI_Line = EXTI_Line18; 
	//EXTI_InitStructure.EXTI_Trigger = EXTI_Trigger_Rising;
	//EXTI_InitStructure.EXTI_LineCmd = ENABLE;
	//EXTI_Init(&EXTI_InitStructure);

	//GPIO_PinRemapConfig(GPIO_FullRemap_TIM3, ENABLE);

	caribou_gpio_reset(&led1);
	caribou_gpio_reset(&led2);
	caribou_gpio_reset(&led3);
	caribou_gpio_reset(&led4);


	/* enable pull-ups on pushbuttons */
	caribou_gpio_set(&key1);
	caribou_gpio_set(&key2);
	caribou_gpio_set(&key3);
	caribou_gpio_set(&joy1);
	caribou_gpio_set(&joy2);
	caribou_gpio_set(&joy3);
	caribou_gpio_set(&joy4);
	caribou_gpio_set(&joy5);

}


void late_init()
{
	_stdout = _stdin = _stderr = fopen(CONSOLE_USART,"rw"); // USART1 is stdio
}

void board_idle()
{
	if ( !caribou_gpio_pinstate(&joy5) )
	{
		caribou_gpio_set(&led1);
		caribou_gpio_set(&led2);
		caribou_gpio_set(&led3);
		caribou_gpio_set(&led4);
	}
	else
	{
		caribou_gpio_write(&led1,!caribou_gpio_pinstate(&joy1));
		caribou_gpio_write(&led2,!caribou_gpio_pinstate(&joy2));
		caribou_gpio_write(&led3,!caribou_gpio_pinstate(&joy3));
		caribou_gpio_write(&led4,!caribou_gpio_pinstate(&joy4));
	}
}
