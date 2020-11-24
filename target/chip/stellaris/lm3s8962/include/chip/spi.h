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
#ifndef _CARIBOU_SPI_LM3S8962_H_
#define _CARIBOU_SPI_LM3S8962_H_

#include <caribou/kernel/types.h>
#include <chip/vectors.h>

#include <inc/lm3s8962.h>
#include <inc/hw_types.h>
#include <inc/hw_ssi.h>
#include <driverlib/ssi.h>

#ifdef __cplusplus
extern "C"
{
#endif

#define chip_spi_port_t	unsigned long
#define chip_spi_word_t	uint16_t

chip_spi_word_t	chip_spi_exchange(chip_spi_port_t port, chip_spi_word_t word);
bool chip_spi_rx_ready(chip_spi_port_t port);
chip_spi_word_t chip_spi_rx(chip_spi_port_t port);
bool chip_spi_tx_ready(chip_spi_port_t port);
chip_spi_word_t chip_spi_tx(chip_spi_port_t port, chip_spi_word_t word);

#ifdef __cplusplus
}
#endif

#endif
