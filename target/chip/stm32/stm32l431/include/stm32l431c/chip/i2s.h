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
#ifndef _CARIBOU_I2S_STM32F405_H_
#define _CARIBOU_I2S_STM32F405_H_

#include <caribou/kernel/types.h>
#include <chip/vectors.h>

#include <stm32l4xx.h>
#include <stm32l4xx_hal_dma.h>
#include <stm32l4xx_hal_spi.h>
#include <stm32l4xx_hal_rcc.h>

#ifdef __cplusplus
extern "C"
{
#endif

#define chip_i2s_port_t	SPI_TypeDef*
#define chip_i2s_word_t	uint16_t

bool chip_i2s_rx_ready(chip_i2s_port_t port);
chip_i2s_word_t chip_i2s_rx(chip_i2s_port_t port);
bool chip_i2s_tx_ready(chip_i2s_port_t port);
chip_i2s_word_t chip_i2s_tx(chip_i2s_port_t port, chip_i2s_word_t word);

#ifdef __cplusplus
}
#endif

#endif /* _CARIBOU_I2S_STM32F103V_H_ */
