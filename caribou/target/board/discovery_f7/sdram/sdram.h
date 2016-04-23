/******************************************************************************
* Copyright © 2016 by Pike Aerospace Research Corporation
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
#ifndef __ACCUTRON_SDRAM_H_
#define __ACCUTRON_SDRAM_H_

#ifdef __cplusplus
 extern "C" {
#endif 

#include "stm32f7xx_hal.h"

/** 
  * @brief  SDRAM status structure definition  
  */     
#define   SDRAM_OK         ((uint8_t)0x00)
#define   SDRAM_ERROR      ((uint8_t)0x01)

/**
 * Memory pools
 */

#if defined(CARIBOU_MPU_ENABLED)

	#define	SDRAM_MPU_HEAP_BASE0	((uint32_t)0xC0000000)			/* MPU protected heap area #1 */
	#define	SDRAM_MPU_HEAP_SIZE0	MPU_REGION_SIZE_1MB

	#define	SDRAM_MPU_HEAP_BASE1	((uint32_t)0xC0100000)			/* MPU protected heap area #2 */
	#define	SDRAM_MPU_HEAP_SIZE1	MPU_REGION_SIZE_1MB

	#define	SDRAM_MPU_HEAP_BASE2	((uint32_t)0xC0200000)			/* MPU protected heap area #3 */
	#define	SDRAM_MPU_HEAP_SIZE2	MPU_REGION_SIZE_1MB

	#define	SDRAM_MPU_HEAP_BASE3	((uint32_t)0xC0300000)			/* MPU protected heap area #4 */
	#define	SDRAM_MPU_HEAP_SIZE3	MPU_REGION_SIZE_1MB

	#define	SDRAM_HEAP_BASE			((uint32_t)0xC0400000)			/* General heap */
	#define	SDRAM_HEAP_END			((uint32_t)0xC08FFFFF)

#else

	#define	SDRAM_HEAP_BASE			((uint32_t)0xC0000000)			/* General heap */
	#define	SDRAM_HEAP_END			((uint32_t)0xC04FFFFF)

#endif


/* #define SDRAM_MEMORY_WIDTH            FMC_SDRAM_MEM_BUS_WIDTH_8  */
#define SDRAM_MEMORY_WIDTH               FMC_SDRAM_MEM_BUS_WIDTH_16

#define SDCLOCK_PERIOD                   FMC_SDRAM_CLOCK_PERIOD_2
//#define SDCLOCK_PERIOD                FMC_SDRAM_CLOCK_PERIOD_3

#define REFRESH_COUNT                    ((uint32_t)0x0603)   /* SDRAM refresh counter (100Mhz SD clock) */
//#define REFRESH_COUNT                    ((uint32_t)0x0603/2)   /* SDRAM refresh counter (100Mhz SD clock) */
   
#define SDRAM_TIMEOUT                    ((uint32_t)0xFFFF)

/* DMA definitions for SDRAM DMA transfer */
#define __DMAx_CLK_ENABLE                 __HAL_RCC_DMA2_CLK_ENABLE
#define __DMAx_CLK_DISABLE                __HAL_RCC_DMA2_CLK_DISABLE
#define SDRAM_DMAx_CHANNEL                DMA_CHANNEL_0
#define SDRAM_DMAx_STREAM                 DMA2_Stream0  
#define SDRAM_DMAx_IRQn                   DMA2_Stream0_IRQn
#define SDRAM_DMAx_IRQHandler             DMA2_Stream0_IRQHandler  
/**
  * @}
  */ 
  
/**
  * @brief  FMC SDRAM Mode definition register defines
  */
#define SDRAM_MODEREG_BURST_LENGTH_1             ((uint16_t)0x0000)
#define SDRAM_MODEREG_BURST_LENGTH_2             ((uint16_t)0x0001)
#define SDRAM_MODEREG_BURST_LENGTH_4             ((uint16_t)0x0002)
#define SDRAM_MODEREG_BURST_LENGTH_8             ((uint16_t)0x0004)
#define SDRAM_MODEREG_BURST_TYPE_SEQUENTIAL      ((uint16_t)0x0000)
#define SDRAM_MODEREG_BURST_TYPE_INTERLEAVED     ((uint16_t)0x0008)
#define SDRAM_MODEREG_CAS_LATENCY_2              ((uint16_t)0x0020)
#define SDRAM_MODEREG_CAS_LATENCY_3              ((uint16_t)0x0030)
#define SDRAM_MODEREG_OPERATING_MODE_STANDARD    ((uint16_t)0x0000)
#define SDRAM_MODEREG_WRITEBURST_MODE_PROGRAMMED ((uint16_t)0x0000) 
#define SDRAM_MODEREG_WRITEBURST_MODE_SINGLE     ((uint16_t)0x0200) 


uint8_t SDRAM_Init(void);
uint8_t SDRAM_DeInit(void);
void    SDRAM_Initialization_sequence(uint32_t RefreshCount);
uint8_t SDRAM_ReadData(uint32_t uwStartAddress, uint32_t *pData, uint32_t uwDataSize);
uint8_t SDRAM_ReadData_DMA(uint32_t uwStartAddress, uint32_t *pData, uint32_t uwDataSize);
uint8_t SDRAM_WriteData(uint32_t uwStartAddress, uint32_t *pData, uint32_t uwDataSize);
uint8_t SDRAM_WriteData_DMA(uint32_t uwStartAddress, uint32_t *pData, uint32_t uwDataSize);
uint8_t SDRAM_Sendcmd(FMC_SDRAM_CommandTypeDef *SdramCmd);
void    SDRAM_DMA_IRQHandler(void);  
   
/* These functions can be modified in case the current settings (e.g. DMA stream)
   need to be changed for specific application needs */
void    SDRAM_MspInit(SDRAM_HandleTypeDef  *hsdram);
void    SDRAM_MspDeInit(SDRAM_HandleTypeDef  *hsdram, void *Params);


#ifdef __cplusplus
}
#endif

#endif /* __ACCUTRON_SDRAM_H_ */
