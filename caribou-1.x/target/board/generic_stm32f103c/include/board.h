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
#ifndef _CARIBOU_CHIP_BOARD_H_
#define _CARIBOU_CHIP_BOARD_H_

#include <caribou.h>
#include <chip/chip.h>
#include <caribou/dev/gpio.h>

#ifdef __cplusplus
extern "C" {
#endif

extern caribou_gpio_t led1;

#define	GPIO_CNF_AIN			(0x00)					/* Analog Mode */
#define	GPIO_CNF_IN				(0x04)					/* Floating Input (reset state) */
#define	GPIO_CNF_IN_PUD			(0x08)					/* Input with pull-up / pull-down */
#define	GPIO_CNF_RESERVED		(0x0C)					/* Reserved */

#define	GPIO_CNF_OUT_PP			(0x00)					/* General purpose output push-pull */
#define	GPIO_CNF_OUT_OD			(0x04)					/* General purpose output open-drain */
#define	GPIO_CNF_AF_PP			(0x08)					/* Alternate function output push-pull */
#define	GPIO_CNF_AF_OD			(0x0C)					/* Alternate function output open-drain */

#define	GPIO_MODE_IN			(0x00)					/* Input mode (reset state) */
#define	GPIO_MODE_OUT_10MHZ		(0x01)					/* Output mode, max speed 10 MHz */
#define	GPIO_MODE_OUT_2MHZ		(0x02)					/* Output mode, max speed 2 MHz */
#define	GPIO_MODE_OUT_50MHZ		(0x03)					/* Output mode, max speed 50 MHz */

#define PIN_MODE_MASK(n)		(0xF<<(n*4))			/* 16 bits */
#define PIN_MODE(n,mode)		(uint32_t)((mode&0xF)<<(n*4))		/* 16 bits, mode 4 bits */

/**
 ** PORT A
 */
#define	CARIBOU_PORTA_CONFIG_L	PIN_MODE(0,GPIO_CNF_IN | GPIO_MODE_IN) |	\
								PIN_MODE(1,GPIO_CNF_IN | GPIO_MODE_IN) |	\
								PIN_MODE(2,GPIO_CNF_IN | GPIO_MODE_IN) |	\
								PIN_MODE(3,GPIO_CNF_IN | GPIO_MODE_IN) |	\
								PIN_MODE(4,GPIO_CNF_IN | GPIO_MODE_IN) |	\
								PIN_MODE(5,GPIO_CNF_IN | GPIO_MODE_IN) |	\
								PIN_MODE(6,GPIO_CNF_IN | GPIO_MODE_IN) |	\
								PIN_MODE(7,GPIO_CNF_IN | GPIO_MODE_IN)
#define	CARIBOU_PORTA_CONFIG_H	PIN_MODE(0,GPIO_CNF_IN | GPIO_MODE_IN) |	\
								PIN_MODE(1,GPIO_CNF_IN | GPIO_MODE_IN) |	\
								PIN_MODE(2,GPIO_CNF_IN | GPIO_MODE_IN) |	\
								PIN_MODE(3,GPIO_CNF_IN | GPIO_MODE_IN) |	\
								PIN_MODE(4,GPIO_CNF_IN | GPIO_MODE_IN) |	\
								PIN_MODE(5,GPIO_CNF_IN | GPIO_MODE_IN) |	\
								PIN_MODE(6,GPIO_CNF_IN | GPIO_MODE_IN) |	\
								PIN_MODE(7,GPIO_CNF_IN | GPIO_MODE_IN)
/**
 ** PORT B
 */
#define	CARIBOU_PORTB_CONFIG_L	PIN_MODE(0,GPIO_CNF_IN | GPIO_MODE_IN) |	\
								PIN_MODE(1,GPIO_CNF_IN | GPIO_MODE_IN) |	\
								PIN_MODE(2,GPIO_CNF_IN | GPIO_MODE_IN) |	\
								PIN_MODE(3,GPIO_CNF_IN | GPIO_MODE_IN) |	\
								PIN_MODE(4,GPIO_CNF_IN | GPIO_MODE_IN) |	\
								PIN_MODE(5,GPIO_CNF_IN | GPIO_MODE_IN) |	\
								PIN_MODE(6,GPIO_CNF_IN | GPIO_MODE_IN) |	\
								PIN_MODE(7,GPIO_CNF_IN | GPIO_MODE_IN)
#define	CARIBOU_PORTB_CONFIG_H	PIN_MODE(0,GPIO_CNF_IN | GPIO_MODE_IN) |	\
								PIN_MODE(1,GPIO_CNF_IN | GPIO_MODE_IN) |	\
								PIN_MODE(2,GPIO_CNF_IN | GPIO_MODE_IN) |	\
								PIN_MODE(3,GPIO_CNF_IN | GPIO_MODE_IN) |	\
								PIN_MODE(4,GPIO_CNF_IN | GPIO_MODE_IN) |	\
								PIN_MODE(5,GPIO_CNF_IN | GPIO_MODE_IN) |	\
								PIN_MODE(6,GPIO_CNF_IN | GPIO_MODE_IN) |	\
								PIN_MODE(7,GPIO_CNF_IN | GPIO_MODE_IN)
/**
 ** PORT C
 */
#define	CARIBOU_PORTC_CONFIG_L	PIN_MODE(0,GPIO_CNF_IN | GPIO_MODE_IN) |	\
								PIN_MODE(1,GPIO_CNF_IN | GPIO_MODE_IN) |	\
								PIN_MODE(2,GPIO_CNF_IN | GPIO_MODE_IN) |	\
								PIN_MODE(3,GPIO_CNF_IN | GPIO_MODE_IN) |	\
								PIN_MODE(4,GPIO_CNF_IN | GPIO_MODE_IN) |	\
								PIN_MODE(5,GPIO_CNF_IN | GPIO_MODE_IN) |	\
								PIN_MODE(6,GPIO_CNF_IN | GPIO_MODE_IN) |	\
								PIN_MODE(7,GPIO_CNF_IN | GPIO_MODE_IN)
#define	CARIBOU_PORTC_CONFIG_H	PIN_MODE(0,GPIO_CNF_IN | GPIO_MODE_IN) |	\
								PIN_MODE(1,GPIO_CNF_IN | GPIO_MODE_IN) |	\
								PIN_MODE(2,GPIO_CNF_IN | GPIO_MODE_IN) |	\
								PIN_MODE(3,GPIO_CNF_IN | GPIO_MODE_IN) |	\
								PIN_MODE(4,GPIO_CNF_IN | GPIO_MODE_IN) |	\
								PIN_MODE(5,GPIO_CNF_OUT_PP | GPIO_MODE_OUT_2MHZ) |	/* LED1 */	\
								PIN_MODE(6,GPIO_CNF_IN | GPIO_MODE_IN) |	\
								PIN_MODE(7,GPIO_CNF_IN | GPIO_MODE_IN)
/**
 ** PORT D
 */
#define	CARIBOU_PORTD_CONFIG_L	PIN_MODE(0,GPIO_CNF_IN | GPIO_MODE_IN) |	\
								PIN_MODE(1,GPIO_CNF_IN | GPIO_MODE_IN) |	\
								PIN_MODE(2,GPIO_CNF_IN | GPIO_MODE_IN) |	\
								PIN_MODE(3,GPIO_CNF_IN | GPIO_MODE_IN) |	\
								PIN_MODE(4,GPIO_CNF_IN | GPIO_MODE_IN) |	\
								PIN_MODE(5,GPIO_CNF_IN | GPIO_MODE_IN) |	\
								PIN_MODE(6,GPIO_CNF_IN | GPIO_MODE_IN) |	\
								PIN_MODE(7,GPIO_CNF_IN | GPIO_MODE_IN)
#define	CARIBOU_PORTD_CONFIG_H	PIN_MODE(0,GPIO_CNF_IN | GPIO_MODE_IN) |	\
								PIN_MODE(1,GPIO_CNF_IN | GPIO_MODE_IN) |	\
								PIN_MODE(2,GPIO_CNF_IN | GPIO_MODE_IN) |	\
								PIN_MODE(3,GPIO_CNF_IN | GPIO_MODE_IN) |	\
								PIN_MODE(4,GPIO_CNF_IN | GPIO_MODE_IN) |	\
								PIN_MODE(5,GPIO_CNF_IN | GPIO_MODE_IN) |	\
								PIN_MODE(6,GPIO_CNF_IN | GPIO_MODE_IN) |	\
								PIN_MODE(7,GPIO_CNF_IN | GPIO_MODE_IN)
/**
 ** PORT E
 */
#define	CARIBOU_PORTE_CONFIG_L	PIN_MODE(0,GPIO_CNF_IN | GPIO_MODE_IN) |	\
								PIN_MODE(1,GPIO_CNF_IN | GPIO_MODE_IN) |	\
								PIN_MODE(2,GPIO_CNF_IN | GPIO_MODE_IN) |	\
								PIN_MODE(3,GPIO_CNF_IN | GPIO_MODE_IN) |	\
								PIN_MODE(4,GPIO_CNF_IN | GPIO_MODE_IN) |	\
								PIN_MODE(5,GPIO_CNF_IN | GPIO_MODE_IN) |	\
								PIN_MODE(6,GPIO_CNF_IN | GPIO_MODE_IN) |	\
								PIN_MODE(7,GPIO_CNF_IN | GPIO_MODE_IN)
#define	CARIBOU_PORTE_CONFIG_H	PIN_MODE(0,GPIO_CNF_IN | GPIO_MODE_IN) |	\
								PIN_MODE(1,GPIO_CNF_IN | GPIO_MODE_IN) |	\
								PIN_MODE(2,GPIO_CNF_IN | GPIO_MODE_IN) |	\
								PIN_MODE(3,GPIO_CNF_IN | GPIO_MODE_IN) |	\
								PIN_MODE(4,GPIO_CNF_IN | GPIO_MODE_IN) |	\
								PIN_MODE(5,GPIO_CNF_IN | GPIO_MODE_IN) |	\
								PIN_MODE(6,GPIO_CNF_IN | GPIO_MODE_IN) |	\
								PIN_MODE(7,GPIO_CNF_IN | GPIO_MODE_IN)

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

#endif /* _CARIBOU_CHIP_BOARD_H_ */
