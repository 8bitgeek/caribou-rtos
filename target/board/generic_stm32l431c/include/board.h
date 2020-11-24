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
#include <caribou/dev/gpio.h>
#include <chip/chip.h>
#include <netconf.h>
#include <stm32l4xx_hal_dma.h>

#ifdef __cplusplus
extern "C" {
#endif

#define CONSOLE_USART			1						/* UART table offset */

extern caribou_gpio_t led1;

/*********************************************/

typedef enum
{
  GPIO_Mode_IN   = 0x00, /*!< GPIO Input Mode              */
  GPIO_Mode_OUT  = 0x01, /*!< GPIO Output Mode             */
  GPIO_Mode_AF   = 0x02, /*!< GPIO Alternate function Mode */
  GPIO_Mode_AN   = 0x03  /*!< GPIO Analog In/Out Mode      */
} GPIOMode_TypeDef;

#define IS_GPIO_MODE(MODE) (((MODE) == GPIO_Mode_IN)|| ((MODE) == GPIO_Mode_OUT) || \
                            ((MODE) == GPIO_Mode_AF)|| ((MODE) == GPIO_Mode_AN))
typedef enum
{
  GPIO_OType_PP = 0x00,
  GPIO_OType_OD = 0x01
} GPIOOType_TypeDef;

#define IS_GPIO_OTYPE(OTYPE) (((OTYPE) == GPIO_OType_PP) || ((OTYPE) == GPIO_OType_OD))

#define PIN_MODE_MASK(n)		(0x3<<(n*2))			/* 16 bits */
#define PIN_MODE(n,mode)		((mode&0x3)<<(n*2))		/* 16 bits, mode 2 bits */

#define	PIN_OTYPER_MASK(n)		(1<<n)					/* 16 bits */
#define	PIN_OTYPER(n,otyper)	((otyper&1)<<n)			/* 16 bits, otyper 1 bit */

#define PIN_OSPEEDR_MASK(n)		(0x3<<(n*2))			/* 16 bits */
#define PIN_OSPEEDR(n,ospeedr)	((ospeedr&0x3)<<(n*2))	/* 16 bits, mode 2 bits */

#define PIN_PUPDR_MASK(n)		(0x3<<(n*2))			/* 16 bits */
#define PIN_PUPDR(n,pupdr)		((pupdr&0x3)<<(n*2))	/* 16 bits, mode 2 bits */

#define PIN_AFR_MASK(n)			(0xf<<(n*4))			/* 8 bits */
#define PIN_AFR(n,afr)			((afr&0xf)<<(n*4))		/* 8 bits, mode 4 bits */

#define GPIO_AF_GPIO			0						/* Alternate Function GPIO or Default */
#define GPIO_AF_USART2			GPIO_AF7_USART2

/**
 ** PORT A
 */
#define	CARIBOU_PORTA_MODE		PIN_MODE(0,GPIO_Mode_IN) |	\
								PIN_MODE(1,GPIO_Mode_IN) |	\
								PIN_MODE(2,GPIO_Mode_AF) |			/* DEBUG TX */			\
								PIN_MODE(3,GPIO_Mode_AF) |			/* DEBUG_RX */			\
								PIN_MODE(4,GPIO_Mode_IN) |	\
								PIN_MODE(5,GPIO_Mode_IN) |	\
								PIN_MODE(6,GPIO_Mode_IN) |	\
								PIN_MODE(7,GPIO_Mode_IN) |	\
								PIN_MODE(8,GPIO_Mode_IN) |	\
								PIN_MODE(9,GPIO_Mode_IN) |	\
								PIN_MODE(10,GPIO_Mode_IN) | \
								PIN_MODE(11,GPIO_Mode_IN) | \
								PIN_MODE(12,GPIO_Mode_IN) | \
								PIN_MODE(13,GPIO_Mode_AF) |			/* JTMS/SWDIO */		\
								PIN_MODE(14,GPIO_Mode_AF) |			/* JTCK/SWCLK */		\
								PIN_MODE(15,GPIO_Mode_AF)			/* JTDI */

#define	CARIBOU_PORTA_OTYPER	PIN_OTYPER(0,GPIO_OType_PP) |	\
								PIN_OTYPER(1,GPIO_OType_PP) |	\
								PIN_OTYPER(2,GPIO_OType_PP) |	\
								PIN_OTYPER(3,GPIO_OType_PP) |	\
								PIN_OTYPER(4,GPIO_OType_PP) |	\
								PIN_OTYPER(5,GPIO_OType_PP) |	\
								PIN_OTYPER(6,GPIO_OType_PP) |	\
								PIN_OTYPER(7,GPIO_OType_PP) |	\
								PIN_OTYPER(8,GPIO_OType_PP) |	\
								PIN_OTYPER(9,GPIO_OType_PP) |	\
								PIN_OTYPER(10,GPIO_OType_PP) |	\
								PIN_OTYPER(11,GPIO_OType_PP) |	\
								PIN_OTYPER(12,GPIO_OType_PP) |	\
								PIN_OTYPER(13,GPIO_OType_PP) |		/* JTMS/SWDIO */		\
								PIN_OTYPER(14,GPIO_OType_PP) |		/* JTCK/SWCLK */		\
								PIN_OTYPER(15,GPIO_OType_PP)		/* JTDI */

#define	CARIBOU_PORTA_OSPEEDR	PIN_OSPEEDR(0,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(1,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(2,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(3,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(4,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(5,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(6,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(7,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(8,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(9,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(10,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(11,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(12,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(13,GPIO_SPEED_FREQ_LOW) |	/* JTMS/SWDIO */		\
								PIN_OSPEEDR(14,GPIO_SPEED_FREQ_LOW) |	/* JTCK/SWCLK */		\
								PIN_OSPEEDR(15,GPIO_SPEED_FREQ_LOW)		/* JTDI */

#define	CARIBOU_PORTA_PUPDR		PIN_PUPDR(0,GPIO_NOPULL) |	\
								PIN_PUPDR(1,GPIO_NOPULL) |	\
								PIN_PUPDR(2,GPIO_NOPULL) |	\
								PIN_PUPDR(3,GPIO_NOPULL) |	\
								PIN_PUPDR(4,GPIO_NOPULL) |	\
								PIN_PUPDR(5,GPIO_NOPULL) |	\
								PIN_PUPDR(6,GPIO_NOPULL) |	\
								PIN_PUPDR(7,GPIO_NOPULL) |	\
								PIN_PUPDR(8,GPIO_NOPULL) |	\
								PIN_PUPDR(9,GPIO_NOPULL) |	\
								PIN_PUPDR(10,GPIO_NOPULL) |	\
								PIN_PUPDR(11,GPIO_NOPULL) |	\
								PIN_PUPDR(12,GPIO_NOPULL) |	\
								PIN_PUPDR(13,GPIO_PULLUP) |			/* JTMS/SWDIO */		\
								PIN_PUPDR(14,GPIO_PULLDOWN) |		/* JTCK/SWCLK */		\
								PIN_PUPDR(15,GPIO_PULLUP)			/* JTDI */

#define	CARIBOU_PORTA_AFRL		PIN_AFR(0,GPIO_AF_GPIO) |	\
								PIN_AFR(1,GPIO_AF_GPIO) |	\
								PIN_AFR(2,GPIO_AF_USART2) |	\
								PIN_AFR(3,GPIO_AF_USART2) |	\
								PIN_AFR(4,GPIO_AF_GPIO) |	\
								PIN_AFR(5,GPIO_AF_GPIO) |	\
								PIN_AFR(6,GPIO_AF_GPIO) |	\
								PIN_AFR(7,GPIO_AF_GPIO)			
#define	CARIBOU_PORTA_AFRH		PIN_AFR(0,GPIO_AF_GPIO) |	\
								PIN_AFR(1,GPIO_AF_GPIO) |	\
								PIN_AFR(2,GPIO_AF_GPIO) |	\
								PIN_AFR(3,GPIO_AF_GPIO) |	\
								PIN_AFR(4,GPIO_AF_GPIO) |	\
								PIN_AFR(5,GPIO_AF_GPIO) |			/* JTMS/SWDIO */		\
								PIN_AFR(6,GPIO_AF_GPIO) |			/* JTCK/SWCLK */		\
								PIN_AFR(7,GPIO_AF_GPIO)				/* JTDI */
/**
 ** PORT B
 */
#define	CARIBOU_PORTB_MODE		PIN_MODE(0,GPIO_Mode_OUT) |			/* STATUS LED */		\
								PIN_MODE(1,GPIO_Mode_IN) |	\
								PIN_MODE(2,GPIO_Mode_IN) |	\
								PIN_MODE(3,GPIO_Mode_IN) |	\
								PIN_MODE(4,GPIO_Mode_IN) |	\
								PIN_MODE(5,GPIO_Mode_IN) |	\
								PIN_MODE(6,GPIO_Mode_IN) |	\
								PIN_MODE(7,GPIO_Mode_IN) |	\
								PIN_MODE(8,GPIO_Mode_IN) |	\
								PIN_MODE(9,GPIO_Mode_IN) |	\
								PIN_MODE(10,GPIO_Mode_IN) | \
								PIN_MODE(11,GPIO_Mode_IN) | \
								PIN_MODE(12,GPIO_Mode_IN) | \
								PIN_MODE(13,GPIO_Mode_IN) |	\
								PIN_MODE(14,GPIO_Mode_IN) |	\
								PIN_MODE(15,GPIO_Mode_IN)

#define	CARIBOU_PORTB_OTYPER	PIN_OTYPER(0,GPIO_OType_PP) |	\
								PIN_OTYPER(1,GPIO_OType_PP) |	\
								PIN_OTYPER(2,GPIO_OType_PP) |	\
								PIN_OTYPER(3,GPIO_OType_PP) |	\
								PIN_OTYPER(4,GPIO_OType_PP) |	\
								PIN_OTYPER(5,GPIO_OType_PP) |	\
								PIN_OTYPER(6,GPIO_OType_PP) |	\
								PIN_OTYPER(7,GPIO_OType_PP) |	\
								PIN_OTYPER(8,GPIO_OType_PP) |	\
								PIN_OTYPER(9,GPIO_OType_PP) |	\
								PIN_OTYPER(10,GPIO_OType_PP) |	\
								PIN_OTYPER(11,GPIO_OType_PP) |	\
								PIN_OTYPER(12,GPIO_OType_PP) |	\
								PIN_OTYPER(13,GPIO_OType_PP) |	\
								PIN_OTYPER(14,GPIO_OType_PP) |	\
								PIN_OTYPER(15,GPIO_OType_PP)

#define	CARIBOU_PORTB_OSPEEDR	PIN_OSPEEDR(0,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(1,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(2,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(3,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(4,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(5,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(6,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(7,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(8,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(9,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(10,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(11,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(12,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(13,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(14,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(15,GPIO_SPEED_FREQ_LOW)

#define	CARIBOU_PORTB_PUPDR		PIN_PUPDR(0,GPIO_NOPULL) |	\
								PIN_PUPDR(1,GPIO_NOPULL) |	\
								PIN_PUPDR(2,GPIO_NOPULL) |	\
								PIN_PUPDR(3,GPIO_NOPULL) |	\
								PIN_PUPDR(4,GPIO_NOPULL) |	\
								PIN_PUPDR(5,GPIO_NOPULL) |	\
								PIN_PUPDR(6,GPIO_NOPULL) |	\
								PIN_PUPDR(7,GPIO_NOPULL) |	\
								PIN_PUPDR(8,GPIO_NOPULL) |	\
								PIN_PUPDR(9,GPIO_NOPULL) |	\
								PIN_PUPDR(10,GPIO_NOPULL) |	\
								PIN_PUPDR(11,GPIO_NOPULL) |	\
								PIN_PUPDR(12,GPIO_NOPULL) |	\
								PIN_PUPDR(13,GPIO_NOPULL) |	\
								PIN_PUPDR(14,GPIO_NOPULL) |	\
								PIN_PUPDR(15,GPIO_NOPULL)

#define	CARIBOU_PORTB_AFRL		PIN_AFR(0,GPIO_AF_GPIO) |	\
								PIN_AFR(1,GPIO_AF_GPIO) |	\
								PIN_AFR(2,GPIO_AF_GPIO) |	\
								PIN_AFR(3,GPIO_AF_GPIO) |	\
								PIN_AFR(4,GPIO_AF_GPIO) |	\
								PIN_AFR(5,GPIO_AF_GPIO) |	\
								PIN_AFR(6,GPIO_AF_GPIO) |	\
								PIN_AFR(7,GPIO_AF_GPIO)
#define	CARIBOU_PORTB_AFRH		PIN_AFR(0,GPIO_AF_GPIO) |	\
								PIN_AFR(1,GPIO_AF_GPIO) |	\
								PIN_AFR(2,GPIO_AF_GPIO) |	\
								PIN_AFR(3,GPIO_AF_GPIO) |	\
								PIN_AFR(4,GPIO_AF_GPIO) |	\
								PIN_AFR(5,GPIO_AF_GPIO) |	\
								PIN_AFR(6,GPIO_AF_GPIO) |	\
								PIN_AFR(7,GPIO_AF_GPIO)
/**
 ** PORT C
 */
#define	CARIBOU_PORTC_MODE		PIN_MODE(0,GPIO_Mode_IN) |	\
								PIN_MODE(1,GPIO_Mode_IN) |	\
								PIN_MODE(2,GPIO_Mode_IN) |	\
								PIN_MODE(3,GPIO_Mode_IN) |	\
								PIN_MODE(4,GPIO_Mode_IN) |	\
								PIN_MODE(5,GPIO_Mode_IN) |	\
								PIN_MODE(6,GPIO_Mode_IN) |	\
								PIN_MODE(7,GPIO_Mode_IN) |	\
								PIN_MODE(8,GPIO_Mode_IN) |	\
								PIN_MODE(9,GPIO_Mode_IN) |	\
								PIN_MODE(10,GPIO_Mode_IN) | \
								PIN_MODE(11,GPIO_Mode_IN) |	\
								PIN_MODE(12,GPIO_Mode_IN) | \
								PIN_MODE(13,GPIO_Mode_IN) | \
								PIN_MODE(14,GPIO_Mode_IN) | \
								PIN_MODE(15,GPIO_Mode_IN)

#define	CARIBOU_PORTC_OTYPER	PIN_OTYPER(0,GPIO_OType_PP) |	\
								PIN_OTYPER(1,GPIO_OType_PP) |	\
								PIN_OTYPER(2,GPIO_OType_PP) |	\
								PIN_OTYPER(3,GPIO_OType_PP) |	\
								PIN_OTYPER(4,GPIO_OType_PP) |	\
								PIN_OTYPER(5,GPIO_OType_PP) |	\
								PIN_OTYPER(6,GPIO_OType_PP) |	\
								PIN_OTYPER(7,GPIO_OType_PP) |	\
								PIN_OTYPER(8,GPIO_OType_PP) |	\
								PIN_OTYPER(9,GPIO_OType_PP) |	\
								PIN_OTYPER(10,GPIO_OType_PP) |	\
								PIN_OTYPER(11,GPIO_OType_PP) |	\
								PIN_OTYPER(12,GPIO_OType_PP) |	\
								PIN_OTYPER(13,GPIO_OType_PP) |	\
								PIN_OTYPER(14,GPIO_OType_PP) |	\
								PIN_OTYPER(15,GPIO_OType_PP)

#define	CARIBOU_PORTC_OSPEEDR	PIN_OSPEEDR(0,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(1,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(2,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(3,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(4,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(5,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(6,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(7,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(8,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(9,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(10,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(11,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(12,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(13,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(14,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(15,GPIO_SPEED_FREQ_LOW)

#define	CARIBOU_PORTC_PUPDR		PIN_PUPDR(0,GPIO_NOPULL) |	\
								PIN_PUPDR(1,GPIO_NOPULL) |	\
								PIN_PUPDR(2,GPIO_NOPULL) |	\
								PIN_PUPDR(3,GPIO_NOPULL) |	\
								PIN_PUPDR(4,GPIO_NOPULL) |	\
								PIN_PUPDR(5,GPIO_NOPULL) |	\
								PIN_PUPDR(6,GPIO_NOPULL) |	\
								PIN_PUPDR(7,GPIO_NOPULL) |	\
								PIN_PUPDR(8,GPIO_NOPULL) |	\
								PIN_PUPDR(9,GPIO_NOPULL) |	\
								PIN_PUPDR(10,GPIO_NOPULL) |	\
								PIN_PUPDR(11,GPIO_NOPULL) |	\
								PIN_PUPDR(12,GPIO_NOPULL) |	\
								PIN_PUPDR(13,GPIO_NOPULL) |	\
								PIN_PUPDR(14,GPIO_NOPULL) |	\
								PIN_PUPDR(15,GPIO_NOPULL)

#define	CARIBOU_PORTC_AFRL		PIN_AFR(0,GPIO_AF_GPIO) |	\
								PIN_AFR(1,GPIO_AF_GPIO) |	\
								PIN_AFR(2,GPIO_AF_GPIO) |	\
								PIN_AFR(3,GPIO_AF_GPIO) |	\
								PIN_AFR(4,GPIO_AF_GPIO) |	\
								PIN_AFR(5,GPIO_AF_GPIO) |	\
								PIN_AFR(6,GPIO_AF_GPIO) |	\
								PIN_AFR(7,GPIO_AF_GPIO)
#define	CARIBOU_PORTC_AFRH		PIN_AFR(0,GPIO_AF_GPIO) |	\
								PIN_AFR(1,GPIO_AF_GPIO) |	\
								PIN_AFR(2,GPIO_AF_GPIO) |	\
								PIN_AFR(3,GPIO_AF_GPIO) |	\
								PIN_AFR(4,GPIO_AF_GPIO) |	\
								PIN_AFR(5,GPIO_AF_GPIO) |	\
								PIN_AFR(6,GPIO_AF_GPIO) |	\
								PIN_AFR(7,GPIO_AF_GPIO)

/**
 ** PORT H
 */
#define	CARIBOU_PORTH_MODE		PIN_MODE(0,GPIO_Mode_IN) |	\
								PIN_MODE(1,GPIO_Mode_IN) |	\
								PIN_MODE(2,GPIO_Mode_IN) |	\
								PIN_MODE(3,GPIO_Mode_IN) |	\
								PIN_MODE(4,GPIO_Mode_IN) |	\
								PIN_MODE(5,GPIO_Mode_IN) |	\
								PIN_MODE(6,GPIO_Mode_IN) |	\
								PIN_MODE(7,GPIO_Mode_IN) |	\
								PIN_MODE(8,GPIO_Mode_IN) |	\
								PIN_MODE(9,GPIO_Mode_IN) |	\
								PIN_MODE(10,GPIO_Mode_IN) | \
								PIN_MODE(11,GPIO_Mode_IN) | \
								PIN_MODE(12,GPIO_Mode_IN) | \
								PIN_MODE(13,GPIO_Mode_IN) | \
								PIN_MODE(14,GPIO_Mode_IN) | \
								PIN_MODE(15,GPIO_Mode_IN)

#define	CARIBOU_PORTH_OTYPER	PIN_OTYPER(0,GPIO_OType_PP) |	\
								PIN_OTYPER(1,GPIO_OType_PP) |	\
								PIN_OTYPER(2,GPIO_OType_PP) |	\
								PIN_OTYPER(3,GPIO_OType_PP) |	\
								PIN_OTYPER(4,GPIO_OType_PP) |	\
								PIN_OTYPER(5,GPIO_OType_PP) |	\
								PIN_OTYPER(6,GPIO_OType_PP) |	\
								PIN_OTYPER(7,GPIO_OType_PP) |	\
								PIN_OTYPER(8,GPIO_OType_PP) |	\
								PIN_OTYPER(9,GPIO_OType_PP) |	\
								PIN_OTYPER(10,GPIO_OType_PP) |	\
								PIN_OTYPER(11,GPIO_OType_PP) |	\
								PIN_OTYPER(12,GPIO_OType_PP) |	\
								PIN_OTYPER(13,GPIO_OType_PP) |	\
								PIN_OTYPER(14,GPIO_OType_PP) |	\
								PIN_OTYPER(15,GPIO_OType_PP)

#define	CARIBOU_PORTH_OSPEEDR	PIN_OSPEEDR(0,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(1,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(2,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(3,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(4,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(5,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(6,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(7,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(8,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(9,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(10,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(11,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(12,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(13,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(14,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(15,GPIO_SPEED_FREQ_LOW)

#define	CARIBOU_PORTH_PUPDR		PIN_PUPDR(0,GPIO_NOPULL) |		\
								PIN_PUPDR(1,GPIO_NOPULL) |		\
								PIN_PUPDR(2,GPIO_NOPULL) |		\
								PIN_PUPDR(3,GPIO_NOPULL) |		\
								PIN_PUPDR(4,GPIO_NOPULL) |		\
								PIN_PUPDR(5,GPIO_NOPULL) |		\
								PIN_PUPDR(6,GPIO_NOPULL) |		\
								PIN_PUPDR(7,GPIO_NOPULL) |		\
								PIN_PUPDR(8,GPIO_NOPULL) |		\
								PIN_PUPDR(9,GPIO_NOPULL) |		\
								PIN_PUPDR(10,GPIO_NOPULL) |	\
								PIN_PUPDR(11,GPIO_NOPULL) |	\
								PIN_PUPDR(12,GPIO_NOPULL) |	\
								PIN_PUPDR(13,GPIO_NOPULL) |	\
								PIN_PUPDR(14,GPIO_NOPULL) |	\
								PIN_PUPDR(15,GPIO_NOPULL)

#define	CARIBOU_PORTH_AFRL		PIN_AFR(0,GPIO_AF_GPIO) |	\
								PIN_AFR(1,GPIO_AF_GPIO) |	\
								PIN_AFR(2,GPIO_AF_GPIO) |	\
								PIN_AFR(3,GPIO_AF_GPIO) |	\
								PIN_AFR(4,GPIO_AF_GPIO) |	\
								PIN_AFR(5,GPIO_AF_GPIO) |	\
								PIN_AFR(6,GPIO_AF_GPIO) |	\
								PIN_AFR(7,GPIO_AF_GPIO)
#define	CARIBOU_PORTH_AFRH		PIN_AFR(0,GPIO_AF_GPIO) |	\
								PIN_AFR(1,GPIO_AF_GPIO) |	\
								PIN_AFR(2,GPIO_AF_GPIO) |	\
								PIN_AFR(3,GPIO_AF_GPIO) |	\
								PIN_AFR(4,GPIO_AF_GPIO) |	\
								PIN_AFR(5,GPIO_AF_GPIO) |	\
								PIN_AFR(6,GPIO_AF_GPIO) |	\
								PIN_AFR(7,GPIO_AF_GPIO)


/**
 ** @brief A hook to perform early board initialization. Static stacks are initialized, BSS is *NOT* initialized at this stage.
 **/
extern void early_init(void);

/**
 ** @brief A hook to perform late initialization. Static stacks, BSS, heap, and static constructors are all initialized at this stage.
 **/
extern void late_init(void);

/**
 ** @brief A hok for board specific idle time
 */
extern void board_idle(void);

#ifdef __cplusplus
}
#endif

#endif /* _CARIBOU_BOARD_H_ */