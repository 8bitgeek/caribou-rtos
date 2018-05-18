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
#include <chip/spi.h>
#include <chip/lpc2103.h>

/**
 * @brief Transmit a word and receive a word...
 */
chip_spi_word_t	chip_spi_exchange(chip_spi_port_t spi, chip_spi_word_t word)
{
	chip_spi_word_t rc;
	while ( !chip_spi_tx_ready(spi) );
	S0SPDR = word;
	while ( !chip_spi_rx_ready(spi) );
	rc = S0SPDR;
	return rc;
}

/**
 * @brief Check if the receiver is ready.
 */
bool chip_spi_rx_ready(chip_spi_port_t spi)
{
	chip_spi_word_t rc;
	rc = (S0SPSR | S0SPSR_SPIF) ? true : false;
	return rc;	
}

chip_spi_word_t chip_spi_rx(chip_spi_port_t spi)
{
	chip_spi_word_t rc;
	while ( !chip_spi_rx_ready(spi) );
	rc = S0SPDR;
	return rc;	
}

bool chip_spi_tx_ready(chip_spi_port_t spi)
{
	chip_spi_word_t rc;
	rc = (S0SPSR | S0SPSR_SPIF) ? true : false;
	return rc;	
}

void chip_spi_tx(chip_spi_port_t spi, chip_spi_word_t word)
{
	chip_spi_word_t rc;
	while ( !chip_spi_tx_ready(spi) );
	S0SPDR = word;
}

