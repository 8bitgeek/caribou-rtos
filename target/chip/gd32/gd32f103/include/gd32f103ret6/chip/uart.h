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
#ifndef _CARIBOU_CHIP_UART_GD32F1xx_H_
#define _CARIBOU_CHIP_UART_GD32F1xx_H_

#include <caribou/kernel/types.h>
#include <caribou/dev/uart.h>
#include <caribou/lib/bytequeue.h>
#include <chip/vectors.h>

#include <gd32f10x.h>
#include <gd32f10x_usart.h>
#include <gd32f10x_rcu.h>

#ifdef __cplusplus
extern "C"
{
#endif

extern caribou_bytequeue_t* chip_uart_set_rx_queue(void* device, caribou_bytequeue_t* rx_queue);
extern caribou_bytequeue_t* chip_uart_set_tx_queue(void* device, caribou_bytequeue_t* tx_queue);

extern caribou_bytequeue_t* chip_uart_rx_queue(void* device);
extern caribou_bytequeue_t* chip_uart_tx_queue(void* device);

extern InterruptVector chip_uart_interrupt_vector(void* device);

extern uint32_t chip_uart_status(void* device);
extern uint32_t chip_uart_set_status(void* device,uint32_t status);

extern int	chip_uart_open(int fd);
extern int	chip_uart_close(int fd);
extern int	chip_uart_set_config(void* device,caribou_uart_config_t* config);

extern int	chip_uart_int_enable(void* device);
extern int	chip_uart_int_disable(void* device);
extern int	chip_uart_int_enabled(void* device);
extern int	chip_uart_int_set(void* device, int state);
extern void	chip_uart_enable(void* device);
extern void	chip_uart_disable(void* device);

extern int chip_uart_tx_data(void* device,int ch);
extern int chip_uart_rx_data(void* device);

extern bool chip_uart_tx_busy(void* device);

extern bool	chip_uart_tx_ready(void* device);
extern bool	chip_uart_rx_ready(void* device);

extern void	chip_uart_tx_start(void* device);
extern void	chip_uart_tx_stop(void* device);

extern void isr_uart(InterruptVector vector,void* arg);

#ifdef __cplusplus
}
#endif

#endif /* _CARIBOU_CHIP_UART_GD32F10X_H_ */
