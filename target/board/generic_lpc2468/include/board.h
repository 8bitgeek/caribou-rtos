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
#ifndef _CARIBOU_BOARD_H_
#define _CARIBOU_BOARD_H_

#include <caribou.h>
#include <chip/chip.h>
#include <caribou/dev/gpio.h>

#define PLL_SOURCE_HSI

#ifdef __cplusplus
extern "C"
{
#endif

extern caribou_gpio_t	gpio_button_s1;
extern caribou_gpio_t	gpio_button_s2;

extern caribou_gpio_t	gpio_led_d2;
extern caribou_gpio_t	gpio_led_d3;
extern caribou_gpio_t	gpio_led_d4;
extern caribou_gpio_t	gpio_led_d5;
extern caribou_gpio_t	gpio_led_d6;
extern caribou_gpio_t	gpio_led_d7;
extern caribou_gpio_t	gpio_led_d8;
extern caribou_gpio_t	gpio_led_d9;

extern caribou_gpio_t	gpio_lcd_rs;
extern caribou_gpio_t	gpio_lcd_rw;
extern caribou_gpio_t	gpio_lcd_e;
extern caribou_gpio_t	gpio_lcd_db4;
extern caribou_gpio_t	gpio_lcd_db5;
extern caribou_gpio_t	gpio_lcd_db6;
extern caribou_gpio_t	gpio_lcd_db7;
extern caribou_gpio_t	gpio_lcd_light;

#define PIN_AFR_MASK(n)			(0x3<<(n*2))			/* 16 bits */
#define PIN_AFR(n,afr)			((afr&0x3)<<(n*2))		/* 16 bits, afr 2 bits */

#define PIN_MODE_MASK(n)		(0x3<<(n*2))			/* 16 bits */
#define PIN_MODE(n,mode)		((mode&0x3)<<(n*2))		/* 16 bits, mode 2 bits */

#define PIN_DIR_MASK(n)			(0x1<<n)				/* 32 bits */
#define PIN_DIR(n,dir)			((dir&0x1)<<(n))		/* 32 bits, diri 1 bit */

#define GPIO_MODE_0				0
#define GPIO_MODE_1				1
#define GPIO_MODE_2				2
#define GPIO_MODE_3				3
#define GPIO_MODE_PUP			GPIO_MODE_0				/* Pull UP */
#define GPIO_MODE_RES			GPIO_MODE_1				/* Reserved */
#define GPIO_MODE_NO			GPIO_MODE_2				/* No Pull Up/Down */
#define GPIO_MODE_PDN			GPIO_MODE_3				/* Pull DOwn */

#define GPIO_AF_0				0
#define GPIO_AF_1				1
#define GPIO_AF_2				2
#define GPIO_AF_3				3
#define GPIO_AF_GPIO			GPIO_AF_0				/* Alternate Function GPIO or Default */

#define GPIO_DIR_0				0
#define GPIO_DIR_1				1
#define GPIO_DIR_IN				GPIO_DIR_0
#define GPIO_DIR_OUT			GPIO_DIR_1

#define GPIO_AF_TXD0			GPIO_AF_1
#define GPIO_AF_RXD0			GPIO_AF_1

#define GPIO_AF_TXD1			GPIO_AF_1
#define GPIO_AF_RXD1			GPIO_AF_1

/* PORT P0 */
#define	CARIBOU_PINSEL0		PIN_AFR(0,GPIO_AF_GPIO)	|	\
							PIN_AFR(1,GPIO_AF_GPIO)	|	\
							PIN_AFR(2,GPIO_AF_TXD0)	|	\
							PIN_AFR(3,GPIO_AF_RXD0)	|	\
							PIN_AFR(4,GPIO_AF_GPIO)	|	\
							PIN_AFR(5,GPIO_AF_GPIO)	|	\
							PIN_AFR(6,GPIO_AF_GPIO)	|	\
							PIN_AFR(7,GPIO_AF_GPIO)	|	\
							PIN_AFR(8,GPIO_AF_GPIO)	|	\
							PIN_AFR(9,GPIO_AF_GPIO)	|	\
							PIN_AFR(10,GPIO_AF_GPIO)|	\
							PIN_AFR(11,GPIO_AF_GPIO)|	\
							PIN_AFR(12,GPIO_AF_GPIO)|	\
							PIN_AFR(13,GPIO_AF_GPIO)|	\
							PIN_AFR(14,GPIO_AF_GPIO)|	\
							PIN_AFR(15,GPIO_AF_TXD1)

#define	CARIBOU_PINSEL1		PIN_AFR(0,GPIO_AF_RXD1)	|	\
							PIN_AFR(1,GPIO_AF_GPIO)	|	\
							PIN_AFR(2,GPIO_AF_GPIO)	|	\
							PIN_AFR(3,GPIO_AF_GPIO)	|	\
							PIN_AFR(4,GPIO_AF_GPIO)	|	\
							PIN_AFR(5,GPIO_AF_GPIO)	|	\
							PIN_AFR(6,GPIO_AF_GPIO)	|	\
							PIN_AFR(7,GPIO_AF_GPIO)	|	\
							PIN_AFR(8,GPIO_AF_GPIO)	|	\
							PIN_AFR(9,GPIO_AF_GPIO)	|	\
							PIN_AFR(10,GPIO_AF_GPIO)|	\
							PIN_AFR(11,GPIO_AF_GPIO)|	\
							PIN_AFR(12,GPIO_AF_GPIO)|	\
							PIN_AFR(13,GPIO_AF_GPIO)|	\
							PIN_AFR(14,GPIO_AF_GPIO)|	\
							PIN_AFR(15,GPIO_AF_GPIO)

#define	CARIBOU_PINMODE0	PIN_MODE(0,GPIO_MODE_NO)|	\
							PIN_MODE(1,GPIO_MODE_NO)|	\
							PIN_MODE(2,GPIO_MODE_NO)|	\
							PIN_MODE(3,GPIO_MODE_NO)|	\
							PIN_MODE(4,GPIO_MODE_NO)|	\
							PIN_MODE(5,GPIO_MODE_NO)|	\
							PIN_MODE(6,GPIO_MODE_NO)|	\
							PIN_MODE(7,GPIO_MODE_NO)|	\
							PIN_MODE(8,GPIO_MODE_NO)|	\
							PIN_MODE(9,GPIO_MODE_NO)|	\
							PIN_MODE(10,GPIO_MODE_NO)|	\
							PIN_MODE(11,GPIO_MODE_NO)|	\
							PIN_MODE(12,GPIO_MODE_NO)|	\
							PIN_MODE(13,GPIO_MODE_NO)|	\
							PIN_MODE(14,GPIO_MODE_NO)|	\
							PIN_MODE(15,GPIO_MODE_NO)

#define	CARIBOU_PINMODE1	PIN_MODE(0,GPIO_MODE_NO)|	\
							PIN_MODE(1,GPIO_MODE_NO)|	\
							PIN_MODE(2,GPIO_MODE_NO)|	\
							PIN_MODE(3,GPIO_MODE_NO)|	\
							PIN_MODE(4,GPIO_MODE_NO)|	\
							PIN_MODE(5,GPIO_MODE_NO)|	\
							PIN_MODE(6,GPIO_MODE_NO)|	\
							PIN_MODE(7,GPIO_MODE_NO)|	\
							PIN_MODE(8,GPIO_MODE_NO)|	\
							PIN_MODE(9,GPIO_MODE_NO)|	\
							PIN_MODE(10,GPIO_MODE_NO)|	\
							PIN_MODE(11,GPIO_MODE_NO)|	\
							PIN_MODE(12,GPIO_MODE_NO)|	\
							PIN_MODE(13,GPIO_MODE_NO)|	\
							PIN_MODE(14,GPIO_MODE_NO)|	\
							PIN_MODE(15,GPIO_MODE_NO)

#define	CARIBOU_IO0DIR		PIN_DIR(0,GPIO_DIR_IN)	|	\
							PIN_DIR(1,GPIO_DIR_IN)	|	\
							PIN_DIR(2,GPIO_DIR_OUT)	|	\
							PIN_DIR(3,GPIO_DIR_IN)	|	\
							PIN_DIR(4,GPIO_DIR_IN)	|	\
							PIN_DIR(5,GPIO_DIR_IN)	|	\
							PIN_DIR(6,GPIO_DIR_IN)	|	\
							PIN_DIR(7,GPIO_DIR_IN)	|	\
							PIN_DIR(8,GPIO_DIR_IN)	|	\
							PIN_DIR(9,GPIO_DIR_IN)	|	\
							PIN_DIR(10,GPIO_DIR_IN)|	\
							PIN_DIR(11,GPIO_DIR_IN)|	\
							PIN_DIR(12,GPIO_DIR_IN)|	\
							PIN_DIR(13,GPIO_DIR_IN)|	\
							PIN_DIR(14,GPIO_DIR_IN)|	\
							PIN_DIR(15,GPIO_DIR_OUT)|	\
							PIN_DIR(16,GPIO_DIR_IN)|	\
							PIN_DIR(17,GPIO_DIR_OUT)|	\
							PIN_DIR(18,GPIO_DIR_OUT)|	\
							PIN_DIR(19,GPIO_DIR_OUT)|	\
							PIN_DIR(20,GPIO_DIR_OUT)|	\
							PIN_DIR(21,GPIO_DIR_OUT)|	\
							PIN_DIR(22,GPIO_DIR_IN)|	\
							PIN_DIR(23,GPIO_DIR_IN)|	\
							PIN_DIR(24,GPIO_DIR_OUT)|	\
							PIN_DIR(25,GPIO_DIR_OUT)|	\
							PIN_DIR(26,GPIO_DIR_OUT)|	\
							PIN_DIR(27,GPIO_DIR_IN)|	\
							PIN_DIR(28,GPIO_DIR_IN)|	\
							PIN_DIR(29,GPIO_DIR_IN)|	\
							PIN_DIR(30,GPIO_DIR_IN)|	\
							PIN_DIR(31,GPIO_DIR_IN)


/* PORT P1 */
#define	CARIBOU_PINSEL2		PIN_AFR(0,GPIO_AF_GPIO)	|	\
							PIN_AFR(1,GPIO_AF_GPIO)	|	\
							PIN_AFR(2,GPIO_AF_GPIO)	|	\
							PIN_AFR(3,GPIO_AF_GPIO)	|	\
							PIN_AFR(4,GPIO_AF_GPIO)	|	\
							PIN_AFR(5,GPIO_AF_GPIO)	|	\
							PIN_AFR(6,GPIO_AF_GPIO)	|	\
							PIN_AFR(7,GPIO_AF_GPIO)	|	\
							PIN_AFR(8,GPIO_AF_GPIO)	|	\
							PIN_AFR(9,GPIO_AF_GPIO)	|	\
							PIN_AFR(10,GPIO_AF_GPIO)|	\
							PIN_AFR(11,GPIO_AF_GPIO)|	\
							PIN_AFR(12,GPIO_AF_GPIO)|	\
							PIN_AFR(13,GPIO_AF_GPIO)|	\
							PIN_AFR(14,GPIO_AF_GPIO)|	\
							PIN_AFR(15,GPIO_AF_GPIO)

#define	CARIBOU_PINSEL3		PIN_AFR(0,GPIO_AF_GPIO)	|	\
							PIN_AFR(1,GPIO_AF_GPIO)	|	\
							PIN_AFR(2,GPIO_AF_GPIO)	|	\
							PIN_AFR(3,GPIO_AF_GPIO)	|	\
							PIN_AFR(4,GPIO_AF_GPIO)	|	\
							PIN_AFR(5,GPIO_AF_GPIO)	|	\
							PIN_AFR(6,GPIO_AF_GPIO)	|	\
							PIN_AFR(7,GPIO_AF_GPIO)	|	\
							PIN_AFR(8,GPIO_AF_GPIO)	|	\
							PIN_AFR(9,GPIO_AF_GPIO)	|	\
							PIN_AFR(10,GPIO_AF_GPIO)|	\
							PIN_AFR(11,GPIO_AF_GPIO)|	\
							PIN_AFR(12,GPIO_AF_GPIO)|	\
							PIN_AFR(13,GPIO_AF_GPIO)|	\
							PIN_AFR(14,GPIO_AF_GPIO)|	\
							PIN_AFR(15,GPIO_AF_GPIO)

#define	CARIBOU_PINMODE2	PIN_MODE(0,GPIO_MODE_NO)|	\
							PIN_MODE(1,GPIO_MODE_NO)|	\
							PIN_MODE(2,GPIO_MODE_NO)|	\
							PIN_MODE(3,GPIO_MODE_NO)|	\
							PIN_MODE(4,GPIO_MODE_NO)|	\
							PIN_MODE(5,GPIO_MODE_NO)|	\
							PIN_MODE(6,GPIO_MODE_NO)|	\
							PIN_MODE(7,GPIO_MODE_NO)|	\
							PIN_MODE(8,GPIO_MODE_NO)|	\
							PIN_MODE(9,GPIO_MODE_NO)|	\
							PIN_MODE(10,GPIO_MODE_NO)|	\
							PIN_MODE(11,GPIO_MODE_NO)|	\
							PIN_MODE(12,GPIO_MODE_NO)|	\
							PIN_MODE(13,GPIO_MODE_NO)|	\
							PIN_MODE(14,GPIO_MODE_NO)|	\
							PIN_MODE(15,GPIO_MODE_NO)

#define	CARIBOU_PINMODE3	PIN_MODE(0,GPIO_MODE_NO)|	\
							PIN_MODE(1,GPIO_MODE_NO)|	\
							PIN_MODE(2,GPIO_MODE_NO)|	\
							PIN_MODE(3,GPIO_MODE_NO)|	\
							PIN_MODE(4,GPIO_MODE_NO)|	\
							PIN_MODE(5,GPIO_MODE_NO)|	\
							PIN_MODE(6,GPIO_MODE_NO)|	\
							PIN_MODE(7,GPIO_MODE_NO)|	\
							PIN_MODE(8,GPIO_MODE_NO)|	\
							PIN_MODE(9,GPIO_MODE_NO)|	\
							PIN_MODE(10,GPIO_MODE_NO)|	\
							PIN_MODE(11,GPIO_MODE_NO)|	\
							PIN_MODE(12,GPIO_MODE_NO)|	\
							PIN_MODE(13,GPIO_MODE_NO)|	\
							PIN_MODE(14,GPIO_MODE_NO)|	\
							PIN_MODE(15,GPIO_MODE_NO)

#define	CARIBOU_IO1DIR		PIN_DIR(0,GPIO_DIR_IN)	|	\
							PIN_DIR(1,GPIO_DIR_IN)	|	\
							PIN_DIR(2,GPIO_DIR_IN)	|	\
							PIN_DIR(3,GPIO_DIR_IN)	|	\
							PIN_DIR(4,GPIO_DIR_IN)	|	\
							PIN_DIR(5,GPIO_DIR_IN)	|	\
							PIN_DIR(6,GPIO_DIR_IN)	|	\
							PIN_DIR(7,GPIO_DIR_IN)	|	\
							PIN_DIR(8,GPIO_DIR_IN)	|	\
							PIN_DIR(9,GPIO_DIR_IN)	|	\
							PIN_DIR(10,GPIO_DIR_IN)|	\
							PIN_DIR(11,GPIO_DIR_IN)|	\
							PIN_DIR(12,GPIO_DIR_IN)|	\
							PIN_DIR(13,GPIO_DIR_IN)|	\
							PIN_DIR(14,GPIO_DIR_IN)|	\
							PIN_DIR(15,GPIO_DIR_IN)|	\
							PIN_DIR(16,GPIO_DIR_IN)|	\
							PIN_DIR(17,GPIO_DIR_IN)|	\
							PIN_DIR(18,GPIO_DIR_IN)|	\
							PIN_DIR(19,GPIO_DIR_IN)|	\
							PIN_DIR(20,GPIO_DIR_IN)|	\
							PIN_DIR(21,GPIO_DIR_IN)|	\
							PIN_DIR(22,GPIO_DIR_IN)|	\
							PIN_DIR(23,GPIO_DIR_IN)|	\
							PIN_DIR(24,GPIO_DIR_IN)|	\
							PIN_DIR(25,GPIO_DIR_IN)|	\
							PIN_DIR(26,GPIO_DIR_IN)|	\
							PIN_DIR(27,GPIO_DIR_IN)|	\
							PIN_DIR(28,GPIO_DIR_IN)|	\
							PIN_DIR(29,GPIO_DIR_IN)|	\
							PIN_DIR(30,GPIO_DIR_IN)|	\
							PIN_DIR(31,GPIO_DIR_IN)


/* PORT P2 */
#define	CARIBOU_PINSEL4		PIN_AFR(0,GPIO_AF_GPIO)	|	\
							PIN_AFR(1,GPIO_AF_GPIO)	|	\
							PIN_AFR(2,GPIO_AF_GPIO)	|	\
							PIN_AFR(3,GPIO_AF_GPIO)	|	\
							PIN_AFR(4,GPIO_AF_GPIO)	|	\
							PIN_AFR(5,GPIO_AF_GPIO)	|	\
							PIN_AFR(6,GPIO_AF_GPIO)	|	\
							PIN_AFR(7,GPIO_AF_GPIO)	|	\
							PIN_AFR(8,GPIO_AF_GPIO)	|	\
							PIN_AFR(9,GPIO_AF_GPIO)	|	\
							PIN_AFR(10,GPIO_AF_GPIO)|	\
							PIN_AFR(11,GPIO_AF_GPIO)|	\
							PIN_AFR(12,GPIO_AF_GPIO)|	\
							PIN_AFR(13,GPIO_AF_GPIO)|	\
							PIN_AFR(14,GPIO_AF_GPIO)|	\
							PIN_AFR(15,GPIO_AF_GPIO)

#define	CARIBOU_PINSEL5		PIN_AFR(0,GPIO_AF_GPIO)	|	\
							PIN_AFR(1,GPIO_AF_GPIO)	|	\
							PIN_AFR(2,GPIO_AF_GPIO)	|	\
							PIN_AFR(3,GPIO_AF_GPIO)	|	\
							PIN_AFR(4,GPIO_AF_GPIO)	|	\
							PIN_AFR(5,GPIO_AF_GPIO)	|	\
							PIN_AFR(6,GPIO_AF_GPIO)	|	\
							PIN_AFR(7,GPIO_AF_GPIO)	|	\
							PIN_AFR(8,GPIO_AF_GPIO)	|	\
							PIN_AFR(9,GPIO_AF_GPIO)	|	\
							PIN_AFR(10,GPIO_AF_GPIO)|	\
							PIN_AFR(11,GPIO_AF_GPIO)|	\
							PIN_AFR(12,GPIO_AF_GPIO)|	\
							PIN_AFR(13,GPIO_AF_GPIO)|	\
							PIN_AFR(14,GPIO_AF_GPIO)|	\
							PIN_AFR(15,GPIO_AF_GPIO)

#define	CARIBOU_PINMODE4	PIN_MODE(0,GPIO_MODE_NO)|	\
							PIN_MODE(1,GPIO_MODE_NO)|	\
							PIN_MODE(2,GPIO_MODE_NO)|	\
							PIN_MODE(3,GPIO_MODE_NO)|	\
							PIN_MODE(4,GPIO_MODE_NO)|	\
							PIN_MODE(5,GPIO_MODE_NO)|	\
							PIN_MODE(6,GPIO_MODE_NO)|	\
							PIN_MODE(7,GPIO_MODE_NO)|	\
							PIN_MODE(8,GPIO_MODE_NO)|	\
							PIN_MODE(9,GPIO_MODE_NO)|	\
							PIN_MODE(10,GPIO_MODE_NO)|	\
							PIN_MODE(11,GPIO_MODE_NO)|	\
							PIN_MODE(12,GPIO_MODE_NO)|	\
							PIN_MODE(13,GPIO_MODE_NO)|	\
							PIN_MODE(14,GPIO_MODE_NO)|	\
							PIN_MODE(15,GPIO_MODE_NO)

#define	CARIBOU_PINMODE5	PIN_MODE(0,GPIO_MODE_NO)|	\
							PIN_MODE(1,GPIO_MODE_NO)|	\
							PIN_MODE(2,GPIO_MODE_NO)|	\
							PIN_MODE(3,GPIO_MODE_NO)|	\
							PIN_MODE(4,GPIO_MODE_NO)|	\
							PIN_MODE(5,GPIO_MODE_NO)|	\
							PIN_MODE(6,GPIO_MODE_NO)|	\
							PIN_MODE(7,GPIO_MODE_NO)|	\
							PIN_MODE(8,GPIO_MODE_NO)|	\
							PIN_MODE(9,GPIO_MODE_NO)|	\
							PIN_MODE(10,GPIO_MODE_NO)|	\
							PIN_MODE(11,GPIO_MODE_NO)|	\
							PIN_MODE(12,GPIO_MODE_NO)|	\
							PIN_MODE(13,GPIO_MODE_NO)|	\
							PIN_MODE(14,GPIO_MODE_NO)|	\
							PIN_MODE(15,GPIO_MODE_NO)

#define	CARIBOU_IO2DIR		PIN_DIR(0,GPIO_DIR_OUT)	|	\
							PIN_DIR(1,GPIO_DIR_OUT)	|	\
							PIN_DIR(2,GPIO_DIR_OUT)	|	\
							PIN_DIR(3,GPIO_DIR_OUT)	|	\
							PIN_DIR(4,GPIO_DIR_OUT)	|	\
							PIN_DIR(5,GPIO_DIR_OUT)	|	\
							PIN_DIR(6,GPIO_DIR_OUT)	|	\
							PIN_DIR(7,GPIO_DIR_OUT)	|	\
							PIN_DIR(8,GPIO_DIR_IN)	|	\
							PIN_DIR(9,GPIO_DIR_IN)	|	\
							PIN_DIR(10,GPIO_DIR_IN)|	\
							PIN_DIR(11,GPIO_DIR_IN)|	\
							PIN_DIR(12,GPIO_DIR_IN)|	\
							PIN_DIR(13,GPIO_DIR_IN)|	\
							PIN_DIR(14,GPIO_DIR_IN)|	\
							PIN_DIR(15,GPIO_DIR_IN)|	\
							PIN_DIR(16,GPIO_DIR_IN)|	\
							PIN_DIR(17,GPIO_DIR_IN)|	\
							PIN_DIR(18,GPIO_DIR_IN)|	\
							PIN_DIR(19,GPIO_DIR_IN)|	\
							PIN_DIR(20,GPIO_DIR_IN)|	\
							PIN_DIR(21,GPIO_DIR_IN)|	\
							PIN_DIR(22,GPIO_DIR_IN)|	\
							PIN_DIR(23,GPIO_DIR_IN)|	\
							PIN_DIR(24,GPIO_DIR_IN)|	\
							PIN_DIR(25,GPIO_DIR_IN)|	\
							PIN_DIR(26,GPIO_DIR_IN)|	\
							PIN_DIR(27,GPIO_DIR_IN)|	\
							PIN_DIR(28,GPIO_DIR_IN)|	\
							PIN_DIR(29,GPIO_DIR_IN)|	\
							PIN_DIR(30,GPIO_DIR_IN)|	\
							PIN_DIR(31,GPIO_DIR_IN)


/* PORT P3 */
#define	CARIBOU_PINSEL6		PIN_AFR(0,GPIO_AF_GPIO)	|	\
							PIN_AFR(1,GPIO_AF_GPIO)	|	\
							PIN_AFR(2,GPIO_AF_GPIO)	|	\
							PIN_AFR(3,GPIO_AF_GPIO)	|	\
							PIN_AFR(4,GPIO_AF_GPIO)	|	\
							PIN_AFR(5,GPIO_AF_GPIO)	|	\
							PIN_AFR(6,GPIO_AF_GPIO)	|	\
							PIN_AFR(7,GPIO_AF_GPIO)	|	\
							PIN_AFR(8,GPIO_AF_GPIO)	|	\
							PIN_AFR(9,GPIO_AF_GPIO)	|	\
							PIN_AFR(10,GPIO_AF_GPIO)|	\
							PIN_AFR(11,GPIO_AF_GPIO)|	\
							PIN_AFR(12,GPIO_AF_GPIO)|	\
							PIN_AFR(13,GPIO_AF_GPIO)|	\
							PIN_AFR(14,GPIO_AF_GPIO)|	\
							PIN_AFR(15,GPIO_AF_GPIO)

#define	CARIBOU_PINSEL7		PIN_AFR(0,GPIO_AF_GPIO)	|	\
							PIN_AFR(1,GPIO_AF_GPIO)	|	\
							PIN_AFR(2,GPIO_AF_GPIO)	|	\
							PIN_AFR(3,GPIO_AF_GPIO)	|	\
							PIN_AFR(4,GPIO_AF_GPIO)	|	\
							PIN_AFR(5,GPIO_AF_GPIO)	|	\
							PIN_AFR(6,GPIO_AF_GPIO)	|	\
							PIN_AFR(7,GPIO_AF_GPIO)	|	\
							PIN_AFR(8,GPIO_AF_GPIO)	|	\
							PIN_AFR(9,GPIO_AF_GPIO)	|	\
							PIN_AFR(10,GPIO_AF_GPIO)|	\
							PIN_AFR(11,GPIO_AF_GPIO)|	\
							PIN_AFR(12,GPIO_AF_GPIO)|	\
							PIN_AFR(13,GPIO_AF_GPIO)|	\
							PIN_AFR(14,GPIO_AF_GPIO)|	\
							PIN_AFR(15,GPIO_AF_GPIO)

#define	CARIBOU_PINMODE6	PIN_MODE(0,GPIO_MODE_NO)|	\
							PIN_MODE(1,GPIO_MODE_NO)|	\
							PIN_MODE(2,GPIO_MODE_NO)|	\
							PIN_MODE(3,GPIO_MODE_NO)|	\
							PIN_MODE(4,GPIO_MODE_NO)|	\
							PIN_MODE(5,GPIO_MODE_NO)|	\
							PIN_MODE(6,GPIO_MODE_NO)|	\
							PIN_MODE(7,GPIO_MODE_NO)|	\
							PIN_MODE(8,GPIO_MODE_NO)|	\
							PIN_MODE(9,GPIO_MODE_NO)|	\
							PIN_MODE(10,GPIO_MODE_NO)|	\
							PIN_MODE(11,GPIO_MODE_NO)|	\
							PIN_MODE(12,GPIO_MODE_NO)|	\
							PIN_MODE(13,GPIO_MODE_NO)|	\
							PIN_MODE(14,GPIO_MODE_NO)|	\
							PIN_MODE(15,GPIO_MODE_NO)

#define	CARIBOU_PINMODE7	PIN_MODE(0,GPIO_MODE_NO)|	\
							PIN_MODE(1,GPIO_MODE_NO)|	\
							PIN_MODE(2,GPIO_MODE_NO)|	\
							PIN_MODE(3,GPIO_MODE_NO)|	\
							PIN_MODE(4,GPIO_MODE_NO)|	\
							PIN_MODE(5,GPIO_MODE_NO)|	\
							PIN_MODE(6,GPIO_MODE_NO)|	\
							PIN_MODE(7,GPIO_MODE_NO)|	\
							PIN_MODE(8,GPIO_MODE_NO)|	\
							PIN_MODE(9,GPIO_MODE_NO)|	\
							PIN_MODE(10,GPIO_MODE_NO)|	\
							PIN_MODE(11,GPIO_MODE_NO)|	\
							PIN_MODE(12,GPIO_MODE_NO)|	\
							PIN_MODE(13,GPIO_MODE_NO)|	\
							PIN_MODE(14,GPIO_MODE_NO)|	\
							PIN_MODE(15,GPIO_MODE_NO)

#define	CARIBOU_IO3DIR		PIN_DIR(0,GPIO_DIR_IN)	|	\
							PIN_DIR(1,GPIO_DIR_IN)	|	\
							PIN_DIR(2,GPIO_DIR_IN)	|	\
							PIN_DIR(3,GPIO_DIR_IN)	|	\
							PIN_DIR(4,GPIO_DIR_IN)	|	\
							PIN_DIR(5,GPIO_DIR_IN)	|	\
							PIN_DIR(6,GPIO_DIR_IN)	|	\
							PIN_DIR(7,GPIO_DIR_IN)	|	\
							PIN_DIR(8,GPIO_DIR_IN)	|	\
							PIN_DIR(9,GPIO_DIR_IN)	|	\
							PIN_DIR(10,GPIO_DIR_IN)|	\
							PIN_DIR(11,GPIO_DIR_IN)|	\
							PIN_DIR(12,GPIO_DIR_IN)|	\
							PIN_DIR(13,GPIO_DIR_IN)|	\
							PIN_DIR(14,GPIO_DIR_IN)|	\
							PIN_DIR(15,GPIO_DIR_IN)|	\
							PIN_DIR(16,GPIO_DIR_IN)|	\
							PIN_DIR(17,GPIO_DIR_IN)|	\
							PIN_DIR(18,GPIO_DIR_IN)|	\
							PIN_DIR(19,GPIO_DIR_IN)|	\
							PIN_DIR(20,GPIO_DIR_IN)|	\
							PIN_DIR(21,GPIO_DIR_IN)|	\
							PIN_DIR(22,GPIO_DIR_IN)|	\
							PIN_DIR(23,GPIO_DIR_IN)|	\
							PIN_DIR(24,GPIO_DIR_IN)|	\
							PIN_DIR(25,GPIO_DIR_IN)|	\
							PIN_DIR(26,GPIO_DIR_IN)|	\
							PIN_DIR(27,GPIO_DIR_IN)|	\
							PIN_DIR(28,GPIO_DIR_IN)|	\
							PIN_DIR(29,GPIO_DIR_IN)|	\
							PIN_DIR(30,GPIO_DIR_IN)|	\
							PIN_DIR(31,GPIO_DIR_IN)


/* PORT P4 */
#define	CARIBOU_PINSEL8		PIN_AFR(0,GPIO_AF_GPIO)	|	\
							PIN_AFR(1,GPIO_AF_GPIO)	|	\
							PIN_AFR(2,GPIO_AF_GPIO)	|	\
							PIN_AFR(3,GPIO_AF_GPIO)	|	\
							PIN_AFR(4,GPIO_AF_GPIO)	|	\
							PIN_AFR(5,GPIO_AF_GPIO)	|	\
							PIN_AFR(6,GPIO_AF_GPIO)	|	\
							PIN_AFR(7,GPIO_AF_GPIO)	|	\
							PIN_AFR(8,GPIO_AF_GPIO)	|	\
							PIN_AFR(9,GPIO_AF_GPIO)	|	\
							PIN_AFR(10,GPIO_AF_GPIO)|	\
							PIN_AFR(11,GPIO_AF_GPIO)|	\
							PIN_AFR(12,GPIO_AF_GPIO)|	\
							PIN_AFR(13,GPIO_AF_GPIO)|	\
							PIN_AFR(14,GPIO_AF_GPIO)|	\
							PIN_AFR(15,GPIO_AF_GPIO)

#define	CARIBOU_PINSEL9		PIN_AFR(0,GPIO_AF_GPIO)	|	\
							PIN_AFR(1,GPIO_AF_GPIO)	|	\
							PIN_AFR(2,GPIO_AF_GPIO)	|	\
							PIN_AFR(3,GPIO_AF_GPIO)	|	\
							PIN_AFR(4,GPIO_AF_GPIO)	|	\
							PIN_AFR(5,GPIO_AF_GPIO)	|	\
							PIN_AFR(6,GPIO_AF_GPIO)	|	\
							PIN_AFR(7,GPIO_AF_GPIO)	|	\
							PIN_AFR(8,GPIO_AF_GPIO)	|	\
							PIN_AFR(9,GPIO_AF_GPIO)	|	\
							PIN_AFR(10,GPIO_AF_GPIO)|	\
							PIN_AFR(11,GPIO_AF_GPIO)|	\
							PIN_AFR(12,GPIO_AF_GPIO)|	\
							PIN_AFR(13,GPIO_AF_GPIO)|	\
							PIN_AFR(14,GPIO_AF_GPIO)|	\
							PIN_AFR(15,GPIO_AF_GPIO)

#define	CARIBOU_PINMODE8	PIN_MODE(0,GPIO_MODE_NO)|	\
							PIN_MODE(1,GPIO_MODE_NO)|	\
							PIN_MODE(2,GPIO_MODE_NO)|	\
							PIN_MODE(3,GPIO_MODE_NO)|	\
							PIN_MODE(4,GPIO_MODE_NO)|	\
							PIN_MODE(5,GPIO_MODE_NO)|	\
							PIN_MODE(6,GPIO_MODE_NO)|	\
							PIN_MODE(7,GPIO_MODE_NO)|	\
							PIN_MODE(8,GPIO_MODE_NO)|	\
							PIN_MODE(9,GPIO_MODE_NO)|	\
							PIN_MODE(10,GPIO_MODE_NO)|	\
							PIN_MODE(11,GPIO_MODE_NO)|	\
							PIN_MODE(12,GPIO_MODE_NO)|	\
							PIN_MODE(13,GPIO_MODE_NO)|	\
							PIN_MODE(14,GPIO_MODE_NO)|	\
							PIN_MODE(15,GPIO_MODE_NO)

#define	CARIBOU_PINMODE9	PIN_MODE(0,GPIO_MODE_NO)|	\
							PIN_MODE(1,GPIO_MODE_NO)|	\
							PIN_MODE(2,GPIO_MODE_NO)|	\
							PIN_MODE(3,GPIO_MODE_NO)|	\
							PIN_MODE(4,GPIO_MODE_NO)|	\
							PIN_MODE(5,GPIO_MODE_NO)|	\
							PIN_MODE(6,GPIO_MODE_NO)|	\
							PIN_MODE(7,GPIO_MODE_NO)|	\
							PIN_MODE(8,GPIO_MODE_NO)|	\
							PIN_MODE(9,GPIO_MODE_NO)|	\
							PIN_MODE(10,GPIO_MODE_NO)|	\
							PIN_MODE(11,GPIO_MODE_NO)|	\
							PIN_MODE(12,GPIO_MODE_NO)|	\
							PIN_MODE(13,GPIO_MODE_NO)|	\
							PIN_MODE(14,GPIO_MODE_NO)|	\
							PIN_MODE(15,GPIO_MODE_NO)

#define	CARIBOU_IO4DIR		PIN_DIR(0,GPIO_DIR_IN)	|	\
							PIN_DIR(1,GPIO_DIR_IN)	|	\
							PIN_DIR(2,GPIO_DIR_IN)	|	\
							PIN_DIR(3,GPIO_DIR_IN)	|	\
							PIN_DIR(4,GPIO_DIR_IN)	|	\
							PIN_DIR(5,GPIO_DIR_IN)	|	\
							PIN_DIR(6,GPIO_DIR_IN)	|	\
							PIN_DIR(7,GPIO_DIR_IN)	|	\
							PIN_DIR(8,GPIO_DIR_IN)	|	\
							PIN_DIR(9,GPIO_DIR_IN)	|	\
							PIN_DIR(10,GPIO_DIR_IN)|	\
							PIN_DIR(11,GPIO_DIR_IN)|	\
							PIN_DIR(12,GPIO_DIR_IN)|	\
							PIN_DIR(13,GPIO_DIR_IN)|	\
							PIN_DIR(14,GPIO_DIR_IN)|	\
							PIN_DIR(15,GPIO_DIR_IN)|	\
							PIN_DIR(16,GPIO_DIR_IN)|	\
							PIN_DIR(17,GPIO_DIR_IN)|	\
							PIN_DIR(18,GPIO_DIR_IN)|	\
							PIN_DIR(19,GPIO_DIR_IN)|	\
							PIN_DIR(20,GPIO_DIR_IN)|	\
							PIN_DIR(21,GPIO_DIR_IN)|	\
							PIN_DIR(22,GPIO_DIR_IN)|	\
							PIN_DIR(23,GPIO_DIR_IN)|	\
							PIN_DIR(24,GPIO_DIR_IN)|	\
							PIN_DIR(25,GPIO_DIR_IN)|	\
							PIN_DIR(26,GPIO_DIR_IN)|	\
							PIN_DIR(27,GPIO_DIR_IN)|	\
							PIN_DIR(28,GPIO_DIR_IN)|	\
							PIN_DIR(29,GPIO_DIR_IN)|	\
							PIN_DIR(30,GPIO_DIR_IN)|	\
							PIN_DIR(31,GPIO_DIR_IN)


/* PORT ETM */
#define	CARIBOU_PINSEL10	PIN_AFR(0,GPIO_AF_GPIO)	|	\
							PIN_AFR(1,GPIO_AF_GPIO)	|	\
							PIN_AFR(2,GPIO_AF_GPIO)	|	\
							PIN_AFR(3,GPIO_AF_GPIO)	|	\
							PIN_AFR(4,GPIO_AF_GPIO)	|	\
							PIN_AFR(5,GPIO_AF_GPIO)	|	\
							PIN_AFR(6,GPIO_AF_GPIO)	|	\
							PIN_AFR(7,GPIO_AF_GPIO)	|	\
							PIN_AFR(8,GPIO_AF_GPIO)	|	\
							PIN_AFR(9,GPIO_AF_GPIO)	|	\
							PIN_AFR(10,GPIO_AF_GPIO)|	\
							PIN_AFR(11,GPIO_AF_GPIO)|	\
							PIN_AFR(12,GPIO_AF_GPIO)|	\
							PIN_AFR(13,GPIO_AF_GPIO)|	\
							PIN_AFR(14,GPIO_AF_GPIO)|	\
							PIN_AFR(15,GPIO_AF_GPIO)


/**
 ** @brief A hook to perform early board initialization. Static stacks are initialized, BSS is *NOT* initialized at this stage.
 **/
extern void early_init(void);


/**
 ** @brief A hook to perform late initialization. Static stacks, BSS, heap, and static contructors are all initialized at this stage.
 **/
extern void late_init(void);

#ifdef __cplusplus
}
#endif

#endif

