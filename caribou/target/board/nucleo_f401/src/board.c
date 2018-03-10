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

caribou_gpio_t led1	= CARIBOU_GPIO_INIT(GPIOA,CARIBOU_GPIO_PIN_5);

void early_init()
{
	RCC_ClocksTypeDef SYS_Clocks;
	#if 0
		/* Enable HSE */   
		RCC_HSEConfig(RCC_HSE_ON);
		/* Wait till HSE is ready and if Time out is reached exit */
		while(RCC_WaitForHSEStartUp()!=SUCCESS);
		RCC_SYSCLKConfig(RCC_SYSCLKSource_HSE);
	#endif
	RCC_GetClocksFreq(&SYS_Clocks);

	#if 0
		SystemInit();
	#endif
	SystemCoreClockUpdate();
	RCC_GetClocksFreq(&SYS_Clocks);

	/* Enable Peripheral Clocks... */
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_SYSCFG, ENABLE);

	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOA,ENABLE);
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOB,ENABLE);
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOC,ENABLE);
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOD,ENABLE);
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOE,ENABLE);
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOF,ENABLE);
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOG,ENABLE);
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOH,ENABLE);
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOI,ENABLE);
	
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_USART1,ENABLE);
	RCC_APB1PeriphClockCmd(RCC_APB1Periph_USART2,ENABLE);
	RCC_APB1PeriphClockCmd(RCC_APB1Periph_USART3,ENABLE);
	RCC_APB1PeriphClockCmd(RCC_APB1Periph_SPI2,ENABLE);

	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_DMA1,ENABLE);
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_DMA2,ENABLE);
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_CRC,ENABLE);

	/* PORT A */
	GPIOA->MODER = CARIBOU_PORTA_MODE;
	GPIOA->OTYPER = CARIBOU_PORTA_OTYPER;
	GPIOA->OSPEEDR = CARIBOU_PORTA_OSPEEDR;
	GPIOA->PUPDR = CARIBOU_PORTA_PUPDR;
	GPIOA->AFR[0] = CARIBOU_PORTA_AFRL;
	GPIOA->AFR[1] = CARIBOU_PORTA_AFRH;
	/* POST B */
	GPIOB->MODER = CARIBOU_PORTB_MODE;
	GPIOB->OTYPER = CARIBOU_PORTB_OTYPER;
	GPIOB->OSPEEDR = CARIBOU_PORTB_OSPEEDR;
	GPIOB->PUPDR = CARIBOU_PORTB_PUPDR;
	GPIOB->AFR[0] = CARIBOU_PORTB_AFRL;
	GPIOB->AFR[1] = CARIBOU_PORTB_AFRH;
	/* POST C */
	GPIOC->MODER = CARIBOU_PORTC_MODE;
	GPIOC->OTYPER = CARIBOU_PORTC_OTYPER;
	GPIOC->OSPEEDR = CARIBOU_PORTC_OSPEEDR;
	GPIOC->PUPDR = CARIBOU_PORTC_PUPDR;
	GPIOC->AFR[0] = CARIBOU_PORTC_AFRL;
	GPIOC->AFR[1] = CARIBOU_PORTC_AFRH;
	/* POST D */
	GPIOD->MODER = CARIBOU_PORTD_MODE;
	GPIOD->OTYPER = CARIBOU_PORTD_OTYPER;
	GPIOD->OSPEEDR = CARIBOU_PORTD_OSPEEDR;
	GPIOD->PUPDR = CARIBOU_PORTD_PUPDR;
	GPIOD->AFR[0] = CARIBOU_PORTD_AFRL;
	GPIOD->AFR[1] = CARIBOU_PORTD_AFRH;
	/* POST H */
	GPIOH->MODER = CARIBOU_PORTH_MODE;
	GPIOH->OTYPER = CARIBOU_PORTH_OTYPER;
	GPIOH->OSPEEDR = CARIBOU_PORTH_OSPEEDR;
	GPIOH->PUPDR = CARIBOU_PORTH_PUPDR;
	GPIOH->AFR[0] = CARIBOU_PORTH_AFRL;
	GPIOH->AFR[1] = CARIBOU_PORTH_AFRH;
}

void late_init()
{
	caribou_uart_config_t	uart_config;
	_stdout = _stdin = _stderr = fopen(CONSOLE_USART,"rw"); // USART3 is stdio
	caribou_uart_init_config(&uart_config);
	uart_config.baud_rate = CARIBOU_UART_BAUD_RATE_115200;
	uart_config.dma_mode = CARIBOU_UART_DMA_RX;
	uart_config.dma_prio = CARIBOU_UART_DMA_PRIO_MEDIUM;
	caribou_uart_set_config(CONSOLE_USART,&uart_config);

    caribou_gpio_reset(&led1);
}

void board_idle()
{
	static uint64_t last0 =0L;
	if ( (caribou_timer_ticks() - last0) > 500 )
	{
		caribou_gpio_toggle(&led1);
		last0 = caribou_timer_ticks();
	}

	caribou_wfi();
}
