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
#ifndef _CARIBOU_CHIP_UART_STM32F051_H_
#define _CARIBOU_CHIP_UART_STM32F051_H_

#include <types.h>
#include "vectors.h"

#ifdef __cplusplus
extern "C"
{
#endif

#define UART_RX_BUFFER_SZ 128
#define UART_TX_BUFFER_SZ 128

extern int	chip_uart_open(const char* name);
extern int	chip_uart_close(int fd);

#ifdef __cplusplus
}
#endif

#endif
