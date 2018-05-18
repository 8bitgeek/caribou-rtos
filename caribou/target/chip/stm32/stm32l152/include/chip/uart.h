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
#ifndef _CARIBOU_UART_STM32L152_H_
#define _CARIBOU_UART_STM32L152_H_

#include <caribou/types.h>
#include <chip/vectors.h>

#ifdef __cplusplus
extern "C"
{
#endif

#define UART_RX_BUFFER_SZ 128
#define UART_TX_BUFFER_SZ 128

extern int	uart_open(int ndev);
extern int	uart_close(int fd);

#ifdef __cplusplus
}
#endif

#endif
