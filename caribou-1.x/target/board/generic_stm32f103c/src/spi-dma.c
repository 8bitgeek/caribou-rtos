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
#include <spi-dma.h>

static void spi_dma_interrupt(InterruptVector vector, void* arg)
{
	if ( DMA_GetFlagStatus(SPI_MASTER_Tx_DMA_FLAG) )
	{
		DMA_ClearITPendingBit( SPI_MASTER_Tx_DMA_IT );
	}
}

void spi_dma_init(uint8_t* display_buffer, uint32_t display_buffer_size)
{
	SPI_InitTypeDef    SPI_InitStructure;
	DMA_InitTypeDef    DMA_InitStructure;

	/* Install an interrupt handler for DMA interrupts */
	caribou_vector_install(SPI_MASTER_Tx_DMA_IRQ,spi_dma_interrupt,NULL);
	caribou_vector_enable(SPI_MASTER_Tx_DMA_IRQ);

	/* SPI_MASTER configuration ------------------------------------------------*/
	SPI_InitStructure.SPI_Direction = SPI_Direction_1Line_Tx;
	SPI_InitStructure.SPI_Mode = SPI_Mode_Master;
	SPI_InitStructure.SPI_DataSize = SPI_DataSize_8b;
	SPI_InitStructure.SPI_CPOL = SPI_CPOL_High;
	SPI_InitStructure.SPI_CPHA = SPI_CPHA_2Edge;
	SPI_InitStructure.SPI_NSS = SPI_NSS_Soft;
	SPI_InitStructure.SPI_BaudRatePrescaler = SPI_BaudRatePrescaler_128;
	SPI_InitStructure.SPI_FirstBit = SPI_FirstBit_MSB;
	SPI_InitStructure.SPI_CRCPolynomial = 7;
	SPI_Init(SPI_MASTER, &SPI_InitStructure);

	/* SPI_MASTER_Tx_DMA_Channel configuration ---------------------------------*/
	DMA_DeInit(SPI_MASTER_Tx_DMA_Channel);
	DMA_InitStructure.DMA_PeripheralBaseAddr = (uint32_t)SPI_MASTER_DR_Base;
	DMA_InitStructure.DMA_MemoryBaseAddr = (uint32_t)display_buffer;
	DMA_InitStructure.DMA_DIR = DMA_DIR_PeripheralDST;
	DMA_InitStructure.DMA_BufferSize = display_buffer_size;
	DMA_InitStructure.DMA_PeripheralInc = DMA_PeripheralInc_Disable;
	DMA_InitStructure.DMA_MemoryInc = DMA_MemoryInc_Enable;
	DMA_InitStructure.DMA_PeripheralDataSize = DMA_PeripheralDataSize_Byte;
	DMA_InitStructure.DMA_MemoryDataSize = DMA_MemoryDataSize_Byte;
	DMA_InitStructure.DMA_Mode = DMA_Mode_Circular;
	DMA_InitStructure.DMA_Priority = DMA_Priority_Low;
	DMA_InitStructure.DMA_M2M = DMA_M2M_Disable;
	DMA_Init(SPI_MASTER_Tx_DMA_Channel, &DMA_InitStructure);

	/* Enable SPI_MASTER */
	SPI_Cmd(SPI_MASTER, ENABLE);

}

void spi_dma_start()
{
	/* Enable SPI_MASTER */
	SPI_Cmd(SPI_MASTER, DISABLE);

	/* Enable SPI_MASTER DMA Tx request */
	SPI_I2S_DMACmd(SPI_MASTER, SPI_I2S_DMAReq_Tx, ENABLE);

	/* Enable SPI_MASTER */
	SPI_Cmd(SPI_MASTER, ENABLE);

	/* Enable DMA Interrupt upon transfer completed (wrap-around in circular mode). */
	DMA_ITConfig(SPI_MASTER_Tx_DMA_Channel,DMA_IT_TC|DMA_IT_TE,ENABLE);

	/* Enable DMA channels */
	DMA_Cmd(SPI_MASTER_Tx_DMA_Channel, ENABLE);
}

void spi_dma_stop()
{
	/* Enable DMA channels */
	DMA_Cmd(SPI_MASTER_Tx_DMA_Channel, DISABLE);

	SPI_NSSInternalSoftwareConfig(SPI_MASTER,SPI_NSSInternalSoft_Set);
}
