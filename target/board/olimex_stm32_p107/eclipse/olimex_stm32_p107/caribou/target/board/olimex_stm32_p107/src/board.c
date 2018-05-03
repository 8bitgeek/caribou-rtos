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

caribou_gpio_t led1	= CARIBOU_GPIO_INIT(GPIOC,CARIBOU_GPIO_PIN_6);
caribou_gpio_t led2	= CARIBOU_GPIO_INIT(GPIOC,CARIBOU_GPIO_PIN_7);

caribou_gpio_t pb1	= CARIBOU_GPIO_INIT(GPIOA,CARIBOU_GPIO_PIN_0);
caribou_gpio_t pb2	= CARIBOU_GPIO_INIT(GPIOC,CARIBOU_GPIO_PIN_13);

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
}

void InitializeTIM3()
{
	TIM_TimeBaseInitTypeDef  TIM_TimeBaseStructure;
	TIM_OCInitTypeDef  TIM_OCInitStructure;
	uint16_t CCR1_Val = 30;
	uint16_t CCR2_Val = 249;
	uint16_t CCR3_Val = 166;
	uint16_t CCR4_Val = 83;
	uint16_t PrescalerValue = 0;
	/* -----------------------------------------------------------------------
	TIM3 Configuration: generate 4 PWM signals with 4 different duty cycles:
	The TIM3CLK frequency is set to SystemCoreClock (Hz), to get TIM3 counter
	clock at 24 MHz the Prescaler is computed as following:
	 - Prescaler = (TIM3CLK / TIM3 counter clock) - 1
	SystemCoreClock is set to 72 MHz for Low-density, Medium-density, High-density
	and Connectivity line devices and to 24 MHz for Low-Density Value line and
	Medium-Density Value line devices

	The TIM3 is running at 108 KHz: TIM3 Frequency = TIM3 counter clock/(ARR + 1)
												  = 48 MHz / 666 = 108 KHz
	TIM3 Channel1 duty cycle = (TIM3_CCR1/ TIM3_ARR)* 100 = 50%
	TIM3 Channel2 duty cycle = (TIM3_CCR2/ TIM3_ARR)* 100 = 37.5%
	TIM3 Channel3 duty cycle = (TIM3_CCR3/ TIM3_ARR)* 100 = 25%
	TIM3 Channel4 duty cycle = (TIM3_CCR4/ TIM3_ARR)* 100 = 12.5%
	----------------------------------------------------------------------- */
	/* Compute the prescaler value */
	PrescalerValue = (uint16_t) (SystemCoreClock / 48000000) - 1;
	/* Time base configuration */
	TIM_TimeBaseStructure.TIM_Period = 60;
	TIM_TimeBaseStructure.TIM_Prescaler = PrescalerValue;
	TIM_TimeBaseStructure.TIM_ClockDivision = 0;
	TIM_TimeBaseStructure.TIM_CounterMode = TIM_CounterMode_Up;

	TIM_TimeBaseInit(TIM3, &TIM_TimeBaseStructure);

	/* PWM1 Mode configuration: Channel1 */
    TIM_OCStructInit(&TIM_OCInitStructure);
	TIM_OCInitStructure.TIM_OCMode = TIM_OCMode_PWM1;
	TIM_OCInitStructure.TIM_OutputState = TIM_OutputState_Enable;
	TIM_OCInitStructure.TIM_Pulse = CCR1_Val;
	TIM_OCInitStructure.TIM_OCPolarity = TIM_OCPolarity_High;

	TIM_OC1Init(TIM3, &TIM_OCInitStructure);

	TIM_OC1PreloadConfig(TIM3, TIM_OCPreload_Enable);

#if 0
	/* PWM1 Mode configuration: Channel2 */
	TIM_OCInitStructure.TIM_OutputState = TIM_OutputState_Enable;
	TIM_OCInitStructure.TIM_Pulse = CCR2_Val;

	TIM_OC2Init(TIM3, &TIM_OCInitStructure);

	TIM_OC2PreloadConfig(TIM3, TIM_OCPreload_Enable);

	/* PWM1 Mode configuration: Channel3 */
	TIM_OCInitStructure.TIM_OutputState = TIM_OutputState_Enable;
	TIM_OCInitStructure.TIM_Pulse = CCR3_Val;

	TIM_OC3Init(TIM3, &TIM_OCInitStructure);

	TIM_OC3PreloadConfig(TIM3, TIM_OCPreload_Enable);

	/* PWM1 Mode configuration: Channel4 */
	TIM_OCInitStructure.TIM_OutputState = TIM_OutputState_Enable;
	TIM_OCInitStructure.TIM_Pulse = CCR4_Val;

	TIM_OC4Init(TIM3, &TIM_OCInitStructure);

	TIM_OC4PreloadConfig(TIM3, TIM_OCPreload_Enable);
#endif

	TIM_ARRPreloadConfig(TIM3, ENABLE);

	/* TIM3 enable counter */
	TIM_Cmd(TIM3, ENABLE);
}

void late_init()
{
	caribou_gpio_set(&led1);
	caribou_gpio_reset(&led2);
	_stdout = _stdin = _stderr = fopen(CONSOLE_USART,"rw"); // USART1 is stdio
	//InitializeETH();
    InitializeTIM3();
}

void board_idle()
{
}
