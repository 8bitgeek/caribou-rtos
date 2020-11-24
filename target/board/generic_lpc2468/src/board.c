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

caribou_gpio_t	gpio_button_s1		= CARIBOU_GPIO_INIT(GPIOC,CARIBOU_GPIO_PIN_12);
caribou_gpio_t	gpio_button_s2		= CARIBOU_GPIO_INIT(GPIOC,CARIBOU_GPIO_PIN_13);

caribou_gpio_t	gpio_led_d2			= CARIBOU_GPIO_INIT(GPIOC,CARIBOU_GPIO_PIN_7);
caribou_gpio_t	gpio_led_d3			= CARIBOU_GPIO_INIT(GPIOC,CARIBOU_GPIO_PIN_6);
caribou_gpio_t	gpio_led_d4			= CARIBOU_GPIO_INIT(GPIOC,CARIBOU_GPIO_PIN_5);
caribou_gpio_t	gpio_led_d5			= CARIBOU_GPIO_INIT(GPIOC,CARIBOU_GPIO_PIN_4);
caribou_gpio_t	gpio_led_d6			= CARIBOU_GPIO_INIT(GPIOC,CARIBOU_GPIO_PIN_3);
caribou_gpio_t	gpio_led_d7			= CARIBOU_GPIO_INIT(GPIOC,CARIBOU_GPIO_PIN_2);
caribou_gpio_t	gpio_led_d8			= CARIBOU_GPIO_INIT(GPIOC,CARIBOU_GPIO_PIN_1);
caribou_gpio_t	gpio_led_d9			= CARIBOU_GPIO_INIT(GPIOC,CARIBOU_GPIO_PIN_0);

caribou_gpio_t	gpio_lcd_rs			= CARIBOU_GPIO_INIT(GPIOA,CARIBOU_GPIO_PIN_24);
caribou_gpio_t	gpio_lcd_rw			= CARIBOU_GPIO_INIT(GPIOA,CARIBOU_GPIO_PIN_25);
caribou_gpio_t	gpio_lcd_e			= CARIBOU_GPIO_INIT(GPIOA,CARIBOU_GPIO_PIN_26);
caribou_gpio_t	gpio_lcd_db4		= CARIBOU_GPIO_INIT(GPIOA,CARIBOU_GPIO_PIN_17);
caribou_gpio_t	gpio_lcd_db5		= CARIBOU_GPIO_INIT(GPIOA,CARIBOU_GPIO_PIN_18);
caribou_gpio_t	gpio_lcd_db6		= CARIBOU_GPIO_INIT(GPIOA,CARIBOU_GPIO_PIN_19);
caribou_gpio_t	gpio_lcd_db7		= CARIBOU_GPIO_INIT(GPIOA,CARIBOU_GPIO_PIN_20);
caribou_gpio_t	gpio_lcd_light		= CARIBOU_GPIO_INIT(GPIOA,CARIBOU_GPIO_PIN_21);

/**
 ** @brief A hook to perform early board initialization. Static stacks are initialized, BSS is *NOT* initialized at this stage.
 **/
extern void early_init(void)
{
	/*
		PCLKSEL
		-------
		00	PCLK_xyz = CCLK/4
		01	PCLK_xyz = CCLK[1]
		10	PCLK_xyz = CCLK/2
		11  Peripheral’s clock is selected to PCLK_xyz = CCLK/8
        except for CAN1, CAN2, and CAN filtering when ’11’
        selects PCLK_xyz = CCLK/6.
	*/

	PCLKSEL0	|= (0x02 << 6);		/*	UART0	*/
	PCLKSEL0	|= (0x02 << 8);		/*	UART1	*/

	IO0DIR		= CARIBOU_IO0DIR;
	IO1DIR		= CARIBOU_IO1DIR;

	FIO0DIR		= CARIBOU_IO0DIR;
	FIO1DIR		= CARIBOU_IO1DIR;
	FIO2DIR		= CARIBOU_IO2DIR;
	FIO3DIR		= CARIBOU_IO3DIR;
	FIO4DIR		= CARIBOU_IO4DIR;

	PINSEL0		= CARIBOU_PINSEL0;
	PINSEL1		= CARIBOU_PINSEL1;
	PINSEL2		= CARIBOU_PINSEL2;
	PINSEL3		= CARIBOU_PINSEL3;
	PINSEL4		= CARIBOU_PINSEL4;
	PINSEL5		= CARIBOU_PINSEL5;
	PINSEL6		= CARIBOU_PINSEL6;
	PINSEL7		= CARIBOU_PINSEL7;
	PINSEL8		= CARIBOU_PINSEL8;
	PINSEL9		= CARIBOU_PINSEL9;
	PINSEL10	= CARIBOU_PINSEL10;

	PINMODE0	= CARIBOU_PINMODE0;
	PINMODE1	= CARIBOU_PINMODE1;
	PINMODE2	= CARIBOU_PINMODE2;
	PINMODE3	= CARIBOU_PINMODE3;
	PINMODE4	= CARIBOU_PINMODE4;
	PINMODE5	= CARIBOU_PINMODE5;
	PINMODE6	= CARIBOU_PINMODE6;
	PINMODE7	= CARIBOU_PINMODE7;
	PINMODE8	= CARIBOU_PINMODE8;
	PINMODE9	= CARIBOU_PINMODE9;

	//PINSEL0		|= 0x40000050;		/* TXD1 RXD0 TXD0 */
	//PINSEL1		|= 0x00000001;		/* RXD1 */

	//PINSEL0 |= 0x40000050; /* PINSEL UART1 */
	//PINSEL4 |= 0x0000000A; /* PINSEL UART2 */
	//PINSEL0 |= 0x00500000; /* PINSEL UART3 */
}


/**
 ** @brief A hook to perform late initialization. Static stacks, BSS, heap, and static contructors are all initialized at this stage.
 **/
extern void late_init(void)
{
	caribou_uart_config_t config;

	_stdin = _stdout = fopen(CONSOLE_USART,"rw"); //  Which is stdio?

    caribou_uart_init_config(&config);
	config.baud_rate	= CARIBOU_UART_BAUD_RATE_115200;
	config.word_size	= CARIBOU_UART_WORDSIZE_8;
	config.stop_bits	= CARIBOU_UART_STOPBITS_1;
	config.parity_bits	= CARIBOU_UART_PARITY_NONE;
	config.flow_control	= CARIBOU_UART_FLOW_NONE;
	caribou_uart_set_config(CONSOLE_USART,&config);

	_stderr = fopen(AUX_USART,"rw");
	caribou_uart_init_config(&config);
	config.baud_rate	= CARIBOU_UART_BAUD_RATE_2400;
	config.word_size	= CARIBOU_UART_WORDSIZE_8;
	config.stop_bits	= CARIBOU_UART_STOPBITS_1;
	config.parity_bits	= CARIBOU_UART_PARITY_NONE;
	config.flow_control	= CARIBOU_UART_FLOW_NONE;
	caribou_uart_set_config(AUX_USART,&config);


}


