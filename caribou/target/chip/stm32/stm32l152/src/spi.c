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

int caribou_spi_init(caribou_spi_t* spi, uint32_t spi_port, uint16_t word_size, uint8_t master_mode, uint8_t cpol)
{
	SPI_InitTypeDef			SPI_InitStruct;

	memset(spi,0,sizeof(caribou_spi_t));

	switch(spi_port)
	{
		case 0: spi->spi_port = SPI1;	break;
		case 1: spi->spi_port = SPI2;	break;
	}

	SPI_StructInit(&SPI_InitStruct);
	
	SPI_InitStruct.SPI_Direction = SPI_Direction_2Lines_FullDuplex;
	
	if ( master_mode )
	{
		SPI_InitStruct.SPI_Mode = SPI_Mode_Master;
	}
	else
	{
		SPI_InitStruct.SPI_Mode = SPI_Mode_Slave;
	}

	switch( word_size )
	{
		case 8:	SPI_InitStruct.SPI_DataSize = SPI_DataSize_8b;		break;
		case 16: SPI_InitStruct.SPI_DataSize = SPI_DataSize_16b;	break;
	}

	if ( cpol )
		SPI_InitStruct.SPI_CPOL = SPI_CPOL_High;

	SPI_Init(spi->spi_port,&SPI_InitStruct);
    SPI_Cmd(spi->spi_port,ENABLE);
}

/* SPI exchange bytes */
uint16_t caribou_spi_exchange(caribou_spi_t* spi,uint16_t src)
{
	uint16_t rc;
	while ( SPI_I2S_GetFlagStatus(spi->spi_port, SPI_I2S_FLAG_TXE) == RESET );
	SPI_I2S_SendData(spi->spi_port, src);
	while ( SPI_I2S_GetFlagStatus(spi->spi_port, SPI_I2S_FLAG_RXNE) == RESET );
	rc = SPI_I2S_ReceiveData(spi->spi_port);
	return rc;
}

uint16_t caribou_spi_transmit(caribou_spi_t* spi,uint16_t src)
{
	SPI_I2S_SendData(spi->spi_port, src);
	return src;
}

uint16_t caribou_spi_receive(caribou_spi_t* spi)
{
	uint16_t rc=0;
	rc = SPI_I2S_ReceiveData(spi->spi_port);
	return rc;
}

uint16_t caribou_spi_receiver_ready(caribou_spi_t* spi)
{
	return SPI_I2S_GetFlagStatus(spi->spi_port, SPI_I2S_FLAG_RXNE) ? 1 : 0; 
}

int caribou_spi_selected(caribou_spi_t* spi)
{
	GPIO_ReadOutputDataBit(spi->select_port, 1<<spi->select_pin) == Bit_SET ? 1 : 0;
}

void caribou_spi_select(caribou_spi_t* spi)
{
	GPIO_ClearBits(spi->select_port,1<<spi->select_pin);
	/* clear the receiver */
	while ( SPI_I2S_GetFlagStatus(spi->select_port, SPI_I2S_FLAG_RXNE) == SET )
		SPI_I2S_ReceiveData(spi->select_port);
}

void caribou_spi_deselect(caribou_spi_t* spi)
{
	GPIO_ClearBits(spi->select_port,1<<spi->select_pin);
}

void caribou_spi_interrupts_enable(caribou_spi_t* spi)
{
	chip_vector_enable(SPI1_IRQn);
	SPI_I2S_ITConfig(spi->spi_port, SPI_I2S_IT_RXNE | SPI_I2S_IT_TXE, ENABLE);
}

void caribou_spi_interrupts_disable(caribou_spi_t* spi)
{
	chip_vector_disable(SPI1_IRQn);
	SPI_I2S_ITConfig(spi->spi_port, SPI_I2S_IT_RXNE | SPI_I2S_IT_TXE, DISABLE);
}

