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
#ifndef _CARIBOU_SPI_DMA_H_
#define _CARIBOU_SPI_DMA_H_

#include <caribou.h>
#include <chip/chip.h>

#ifdef __cplusplus
extern "C" {
#endif

#define SPI_MASTER                   SPI1
#define SPI_MASTER_CLK               RCC_APB2Periph_SPI1
#define SPI_MASTER_GPIO              GPIOA
#define SPI_MASTER_GPIO_CLK          RCC_APB2Periph_GPIOA  
#define SPI_MASTER_PIN_SCK           GPIO_Pin_5
#define SPI_MASTER_PIN_MISO          GPIO_Pin_6
#define SPI_MASTER_PIN_MOSI          GPIO_Pin_7
#define SPI_MASTER_DMA               DMA1
#define SPI_MASTER_DMA_CLK           RCC_AHBPeriph_DMA1  
#define SPI_MASTER_Tx_DMA_Channel    DMA1_Channel3
#define SPI_MASTER_Tx_DMA_FLAG       DMA1_FLAG_TC3  
#define SPI_MASTER_Tx_DMA_IT		 DMA1_IT_TC3  
#define	SPI_MASTER_Tx_DMA_IRQ		 DMA1_Channel3_IRQn
#define SPI_MASTER_DR_Base           0x4001300C

void spi_dma_init(uint8_t* display_buffer, uint32_t display_buffer_size);
void spi_dma_start();
void spi_dma_stop();

#ifdef __cplusplus
}
#endif

#endif /* _CARIBOU_CHIP_BOARD_H_ */
