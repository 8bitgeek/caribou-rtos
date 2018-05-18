/******************************************************************************
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
#include <l3gd20.h>

/**
 * @brief Exchange an SPI byte.
 * @param SPIx The SPI Peripheral.
 * @param txd The byte to transmit.
 * @return The receiver byte.
 */
static uint8_t ExchangeSPI8(L3GD20_t* io, uint8_t txd)
{
	uint8_t rc;
	uint32_t DR = ((uint32_t)io->SPIx) + 0x0C; /* SPI Data Register Address */

	/** Wait while the transmitter is not empty */
    while(!io->SPIx->SR & SPI_SR_TXE);
	/** Wait while the SPI peripheral is busy */
	while(io->SPIx->SR & SPI_SR_BSY);
	/** Clear the receiver */
	if ( io->SPIx->SR & SPI_SR_RXNE )
		rc = *(__IO uint8_t *)DR;
	/** Transmit some data */
    *(__IO uint8_t *)DR = txd;
	/** Wait while the SPI peripheral is busy */
	while(io->SPIx->SR & SPI_SR_BSY);
    while(!io->SPIx->SR & SPI_SR_RXNE);
	rc = *(__IO uint8_t *)DR;
	return rc;
}

/**
 * @brief Read a 16 bit value from the MEMS sensor.
 * @param SPIx The SPI Peripheral.
 * @param addr The register address to read.
 */
static uint16_t ReadRegister16(L3GD20_t* io, uint8_t addr)
{
    uint16_t rc;
    uint8_t cmd = 0xC0 | addr;
    
    caribou_gpio_reset(io->CS);
    
	ExchangeSPI8(io,cmd);
	rc = ExchangeSPI8(io,0xFF);
	rc |= ExchangeSPI8(io,0xFF)<<8;

    caribou_gpio_set(io->CS);

    return rc;
}

static uint8_t ReadRegister8(L3GD20_t* io, uint8_t addr)
{
    uint8_t rc;
    uint8_t cmd = 0xC0 | addr;
    
    caribou_gpio_reset(io->CS);
    
	ExchangeSPI8(io,cmd);
	rc = ExchangeSPI8(io,0xFF);

    caribou_gpio_set(io->CS);

    return rc;	
}

static uint8_t WriteRegister8(L3GD20_t* io, uint8_t addr, uint8_t data)
{
    uint8_t rc;
 
    caribou_gpio_reset(io->CS);
    
	ExchangeSPI8(io,addr);
	rc = ExchangeSPI8(io,0xFF);

    caribou_gpio_set(io->CS);

    return rc;	
}

void L3GD20ReadGyro(L3GD20_t* io, uint16_t* x,uint16_t* y,uint16_t* z)
{
    *x = ReadRegister16(io,L3GD20_OUT_X_L);
    *y = ReadRegister16(io,L3GD20_OUT_Y_L);
    *z = ReadRegister16(io,L3GD20_OUT_Z_L);
}

uint8_t L3GD20WhoAmI(L3GD20_t* io)
{
	uint8_t rc = ReadRegister8(io,L3GD20_WHO_AM_I);
	return rc;
}

void L3GD20Init(L3GD20_t* io)
{
	
}