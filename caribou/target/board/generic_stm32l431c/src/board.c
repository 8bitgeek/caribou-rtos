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
#include <stm32l4xx.h>
#include <stm32l431xx.h>

caribou_gpio_t led1	= CARIBOU_GPIO_INIT(GPIOB,CARIBOU_GPIO_PIN_0);

static void CLOCK_Configuration()
{
	/* Enable Internal 16 MHz Oscillator */
	RCC->CR |= RCC_CR_HSION | RCC_CR_HSIKERON;
	while ( !RCC->CR & RCC_CR_HSIRDY );

	/* SYSCLK is 16MHz HSI */
	RCC->CFGR = RCC_CFGR_SW_0 | RCC_CFGR_STOPWUCK;

	/* Configure the PLL */
	RCC->PLLCFGR |= RCC_PLLCFGR_PLLSRC_HSI;						/* Select 16MHz HSI Clk Src */
	RCC->PLLCFGR |= (20 << RCC_PLLCFGR_PLLN_Pos);				/* 16MHz * 20 = 320MHz */
	RCC->PLLCFGR |= ((2-1) << RCC_PLLCFGR_PLLM_Pos);			/* 320MHz / 2 = 160MHz */
	RCC->PLLCFGR &= ~(RCC_PLLCFGR_PLLR_1|RCC_PLLCFGR_PLLR_0);	/* 160MHz / 2 = 80MHz */
	RCC->PLLCFGR |= RCC_PLLCFGR_PLLREN;							/* Enable PLLCLK (/R) Output */

	/* Start the PLL */
	RCC->CR |= RCC_CR_PLLON;									/* Start PLL */
	while(!RCC->CR & RCC_CR_PLLRDY);							/* Wait for PLL Ready */

	/* Configure FLASH Wait States */
	FLASH->ACR |= FLASH_ACR_LATENCY_4WS;

	/* Select PLL as clock source */
	RCC->CFGR |= RCC_CFGR_SW_PLL;
	while((RCC->CFGR & RCC_CFGR_SWS)!=RCC_CFGR_SWS_PLL);
}

void early_init()
{

	//SystemInit();
	CLOCK_Configuration();
	SystemCoreClockUpdate();

	RCC->AHB1ENR |= (
						RCC_AHB1ENR_DMA1EN		|
                        RCC_AHB1ENR_DMA2EN		
					);

	RCC->AHB2ENR |= ( 
						RCC_AHB2ENR_GPIOAEN		|
                        RCC_AHB2ENR_GPIOBEN		|
                        RCC_AHB2ENR_GPIOCEN		|
                        RCC_AHB2ENR_GPIOHEN		|
                        RCC_AHB2ENR_ADCEN		
					);

	RCC->APB1ENR1 |=(
						RCC_APB1ENR1_WWDGEN		|
                        RCC_APB1ENR1_USART2EN	|
                        RCC_APB1ENR1_USART3EN	|
						RCC_APB1ENR1_CAN1EN
					);

	RCC->APB2ENR |= (
						RCC_APB2ENR_SYSCFGEN	|
                        RCC_APB2ENR_USART1EN
					);

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
	/* POST H */
	GPIOH->MODER = CARIBOU_PORTH_MODE;
	GPIOH->OTYPER = CARIBOU_PORTH_OTYPER;
	GPIOH->OSPEEDR = CARIBOU_PORTH_OSPEEDR;
	GPIOH->PUPDR = CARIBOU_PORTH_PUPDR;
	GPIOH->AFR[0] = CARIBOU_PORTH_AFRL;
	GPIOH->AFR[1] = CARIBOU_PORTH_AFRH;

    caribou_gpio_reset(&led1);
}

void late_init()
{
	caribou_uart_config_t	uart_config;
	_stdout = _stdin = _stderr = fopen(CONSOLE_USART,"rw"); // USART3 is stdio
	caribou_uart_init_config(&uart_config);
	uart_config.baud_rate = CARIBOU_UART_BAUD_RATE_115200;
	//uart_config.dma_mode = CARIBOU_UART_DMA_RX;
	//uart_config.dma_prio = CARIBOU_UART_DMA_PRIO_MEDIUM;
	caribou_uart_set_config(CONSOLE_USART,&uart_config);

}

void board_idle()
{
	static uint64_t last0 =0L;
	if ( (caribou_timer_ticks() - last0) >= 100 )
	{
		caribou_gpio_toggle(&led1);
		last0 = caribou_timer_ticks();
	}
}
