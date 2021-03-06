/** ***************************************************************************
* @file
* @author Mike Sharkey <mike@pikeaero.com>.
* @copyright © 2005-2013 by Pike Aerospace Research Corporation
* @copyright © 2014-2015 by Mike Sharkey
* @details This file is part of CARIBOU RTOS
* CARIBOU RTOS is free software: you can redistribute it and/or modify
* it under the terms of the Beerware License Version 43.
* "THE BEER-WARE LICENSE" (Revision 43):
* Mike Sharkey <mike@pikeaero.com> wrote this file. 
* As long as you retain this notice you can do whatever you want with
* this stuff. If we meet some day, and you think this stuff is 
* worth it, you can buy me a beer in return ~ Mike Sharkey
******************************************************************************/
#include <board.h>

caribou_gpio_t led1 = CARIBOU_GPIO_INIT(GPIOA,CARIBOU_GPIO_PIN_5);
caribou_gpio_t pb1	= CARIBOU_GPIO_INIT(GPIOC,CARIBOU_GPIO_PIN_13);

caribou_gpio_t ha1	= CARIBOU_GPIO_INIT(GPIOA,CARIBOU_GPIO_PIN_10);
caribou_gpio_t ha2	= CARIBOU_GPIO_INIT(GPIOB,CARIBOU_GPIO_PIN_3);

static void CLOCK_Configuration()
{
	RCC_ClocksTypeDef SYS_Clocks;
	RCC->CFGR |= (
					RCC_CFGR_HPRE_DIV1	|						/* HCLK Prescaler 1:1 */
					RCC_CFGR_PPRE_DIV1 |
					RCC_CFGR_ADCPRE_DIV4
				 );
	RCC->CFGR |= RCC_CFGR_PLLMULL12;							/* 4MHz x 12 = 48MHz */
	RCC->CR |= RCC_CR_PLLON;									/* Start PLL */
	while(!RCC->CR & RCC_CR_PLLRDY);							/* Wait for PLL Ready */
	FLASH->ACR |= FLASH_ACR_LATENCY;							/* 2 FLASH Waits States */
	RCC->CFGR |= RCC_CFGR_SW_PLL;								/* Select PLL as SYSCLK */
	while((RCC->CFGR & RCC_CFGR_SWS)!=RCC_CFGR_SWS_PLL);		/* Wait for switch to PLL */
    SystemCoreClockUpdate();
	RCC_GetClocksFreq(&SYS_Clocks);    
}

void early_init()
{
	CLOCK_Configuration();

	RCC->AHBENR |=	(	RCC_AHBPeriph_DMA1		|
						RCC_AHBPeriph_GPIOA		|
						RCC_AHBPeriph_GPIOB		|
						RCC_AHBPeriph_GPIOC		|
						RCC_AHBPeriph_GPIOD		|
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
	/* PORT D */
	GPIOD->MODER = CARIBOU_PORTD_MODE;
	GPIOD->OTYPER = CARIBOU_PORTD_OTYPER;
	GPIOD->OSPEEDR = CARIBOU_PORTD_OSPEEDR;
	GPIOD->PUPDR = CARIBOU_PORTD_PUPDR;
	GPIOD->AFR[0] = CARIBOU_PORTD_AFRL;
	GPIOD->AFR[1] = CARIBOU_PORTD_AFRH;
	/* PORT F */
	GPIOF->MODER = CARIBOU_PORTF_MODE;
	GPIOF->OTYPER = CARIBOU_PORTF_OTYPER;
	GPIOF->OSPEEDR = CARIBOU_PORTF_OSPEEDR;
	GPIOF->PUPDR = CARIBOU_PORTF_PUPDR;
	GPIOF->AFR[0] = CARIBOU_PORTF_AFRL;
	GPIOF->AFR[1] = CARIBOU_PORTF_AFRH;

	caribou_gpio_reset(&ha1);
	caribou_gpio_reset(&ha2);
}

void late_init()
{
	caribou_uart_config_t config;
	_stdout = _stdin = _stderr = fopen(CONSOLE_USART,"rw"); // USART for stdio
    caribou_uart_init_config(&config);
	config.baud_rate = CARIBOU_UART_BAUD_RATE_115200;
    config.flow_control = CARIBOU_UART_FLOW_RTS_CTS;
    caribou_uart_set_config(CONSOLE_USART,&config);
}

/**
 * @brief Implement this callback if you which to trap heap allocation failures.
 * @param size The size of the allocation which triggered the failure.
 */
void notify_heap_alloc_failed(size_t size)
{
	for(;;);
}

