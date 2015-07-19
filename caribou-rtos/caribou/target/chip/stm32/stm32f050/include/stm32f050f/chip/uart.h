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
#ifndef _CARIBOU_CHIP_UART_STM32F0XX_H_
#define _CARIBOU_CHIP_UART_STM32F0XX_H_

#include <caribou/types.h>
#include <caribou/uart.h>
#include <caribou/bytequeue.h>
#include <chip/vectors.h>

#include <stm32f0xx.h>
#include <stm32f0xx_usart.h>
#include <stm32f0xx_rcc.h>

#ifdef __cplusplus
extern "C"
{
#endif

typedef struct
{
	USART_TypeDef*			base_address;		/// The base USART port address.
	InterruptVector			vector;				/// The interrupt vector for the USART port.
	caribou_uart_config_t	config;				/// The UART configuration (baud,stop bits,parity,etc..) */
	uint32_t				status;				/// The device driver status bits.
	caribou_bytequeue_t*	rx;					/// The receive queue.
	caribou_bytequeue_t*	tx;					/// The transmit queue
} chip_uart_private_t;

extern int	chip_uart_open(int fd);
extern int	chip_uart_set_config(int fd,caribou_uart_config_t* config);
extern int	chip_uart_close(int fd);

extern int	chip_uart_int_enable(chip_uart_private_t* device);
extern int	chip_uart_int_disable(chip_uart_private_t* device);
extern int	chip_uart_int_enabled(chip_uart_private_t* device);
extern int	chip_uart_int_set(chip_uart_private_t* device, int state);
extern void	chip_uart_enable(chip_uart_private_t* device);
extern void	chip_uart_disable(chip_uart_private_t* device);

extern bool	chip_uart_tx_ready(chip_uart_private_t* device);
extern bool	chip_uart_rx_ready(chip_uart_private_t* device);

extern void	chip_uart_tx_start(chip_uart_private_t* device);
extern void	chip_uart_tx_stop(chip_uart_private_t* device);

#ifdef __cplusplus
}
#endif

#endif
