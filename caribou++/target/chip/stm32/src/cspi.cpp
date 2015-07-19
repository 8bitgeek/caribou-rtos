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
#include <chip/cspi.h>

#include <stm32f10x_spi.h>
#include <stm32f10x_gpio.h>
#include <stm32f10x_rcc.h>

namespace CARIBOU
{
	#define inherited ISpi

	CSpi::CSpi(uint32_t unit)
	: inherited()
	, mSpi(NULL)
	{
		SPI_InitTypeDef  SPI_InitStructure;
		GPIO_InitTypeDef GPIO_InitStructure;

		/* General SPI configuration */ 
		SPI_InitStructure.SPI_Direction = SPI_Direction_2Lines_FullDuplex;
		SPI_InitStructure.SPI_Mode = SPI_Mode_Master;
		SPI_InitStructure.SPI_DataSize = SPI_DataSize_8b;
		SPI_InitStructure.SPI_CPOL = SPI_CPOL_Low;
		SPI_InitStructure.SPI_CPHA = SPI_CPHA_1Edge;
		SPI_InitStructure.SPI_NSS = SPI_NSS_Hard; /* SPI_NSS_Soft; */
		SPI_InitStructure.SPI_BaudRatePrescaler = SPI_BaudRatePrescaler_4;
		SPI_InitStructure.SPI_FirstBit = SPI_FirstBit_MSB;
		SPI_InitStructure.SPI_CRCPolynomial = 7;

		switch (unit)
		{
			case 0:
			{
				mSpi = SPI1;
				/* Enable SPI1 and GPIOA clocks */
				RCC_APB2PeriphClockCmd(RCC_APB2Periph_SPI1, ENABLE);
				/* Configure SPI1 pins: NSS, SCK, MISO and MOSI */
				GPIO_InitStructure.GPIO_Pin = GPIO_Pin_4 | GPIO_Pin_5 | GPIO_Pin_6 | GPIO_Pin_7;
				GPIO_InitStructure.GPIO_Speed = GPIO_Speed_10MHz;
				GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP;
				GPIO_Init(GPIOA, &GPIO_InitStructure);
			}
			break;
			case 1:
			{
				mSpi = SPI2;
				/* Enable SPI1 and GPIOA clocks */
				RCC_APB1PeriphClockCmd(RCC_APB1Periph_SPI2, ENABLE);
				/* Configure SPI1 pins: NSS, SCK, MISO and MOSI */
				GPIO_InitStructure.GPIO_Pin = GPIO_Pin_12 | GPIO_Pin_13 | GPIO_Pin_14 | GPIO_Pin_15;
				GPIO_InitStructure.GPIO_Speed = GPIO_Speed_10MHz;
				GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP;
				GPIO_Init(GPIOB, &GPIO_InitStructure);
			}
			break;
		}
		/* Enable SPI  */
		if ( mSpi )
		{
			SPI_Init(mSpi, &SPI_InitStructure);
			//SPI_Cmd(mSpi, ENABLE);
		}
	}

	CSpi::~CSpi()
	{
		mSpi=NULL;
	}

	void CSpi::init()
	{
		/* Enable SPI  */
		if ( mSpi )
		{
			SPI_Cmd(mSpi, ENABLE);
		}
	}

	/// SPI1 read/write a single byte
	/// @param wb Write Byte
	/// @return read byte.
	uint8_t CSpi::readWrite(uint8_t wb)
	{
		uint8_t rc = 0x00;
		if ( mSpi )
		{
			/* Wait for DR register to clear */
			while(SPI_I2S_GetFlagStatus(mSpi, SPI_I2S_FLAG_TXE) == RESET);

			/* Send byte through the SPI1 peripheral */
			SPI_I2S_SendData(mSpi, wb);

			/* Wait to receive a byte */
			while(SPI_I2S_GetFlagStatus(mSpi, SPI_I2S_FLAG_RXNE) == RESET);

			/* Return the byte read from the SPI bus */
			rc = SPI_I2S_ReceiveData(mSpi);
		}
		return rc;
	}

}