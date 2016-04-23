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
#include "board.h"
#include "sdram.h"

extern void isr_sdram_dma(InterruptVector vector, void* arg);

static SDRAM_HandleTypeDef sdramHandle;
static FMC_SDRAM_TimingTypeDef Timing;
static FMC_SDRAM_CommandTypeDef Command;
static DMA_HandleTypeDef dma_handle;

/**
  * @brief  Initializes the SDRAM device.
  * @retval SDRAM status
  */
uint8_t SDRAM_Init(void)
{ 
	static uint8_t sdramstatus = SDRAM_ERROR;
	/* SDRAM device configuration */
	sdramHandle.Instance = FMC_SDRAM_DEVICE;

	/* Timing configuration for 100Mhz as SD clock frequency (System clock is up to 200Mhz) */
	/*
	Timing.LoadToActiveDelay    = 2;
	Timing.ExitSelfRefreshDelay = 7;
	Timing.SelfRefreshTime      = 4;
	Timing.RowCycleDelay        = 7;
	Timing.WriteRecoveryTime    = 3;
	Timing.RPDelay              = 2;
	Timing.RCDDelay             = 2;

	sdramHandle.Init.SDBank             = FMC_SDRAM_BANK1;
	sdramHandle.Init.ColumnBitsNumber   = FMC_SDRAM_COLUMN_BITS_NUM_10;
	sdramHandle.Init.RowBitsNumber      = FMC_SDRAM_ROW_BITS_NUM_12;
	sdramHandle.Init.MemoryDataWidth    = SDRAM_MEMORY_WIDTH;
	sdramHandle.Init.InternalBankNumber = FMC_SDRAM_INTERN_BANKS_NUM_4;
	sdramHandle.Init.CASLatency         = FMC_SDRAM_CAS_LATENCY_2;
	sdramHandle.Init.WriteProtection    = FMC_SDRAM_WRITE_PROTECTION_DISABLE;
	sdramHandle.Init.SDClockPeriod      = SDCLOCK_PERIOD;
	sdramHandle.Init.ReadBurst          = FMC_SDRAM_RBURST_ENABLE;
	sdramHandle.Init.ReadPipeDelay      = FMC_SDRAM_RPIPE_DELAY_0;
	*/

	Timing.LoadToActiveDelay    = 2;
	Timing.ExitSelfRefreshDelay = 7;
	Timing.SelfRefreshTime      = 4;
	Timing.RowCycleDelay        = 7;
	Timing.WriteRecoveryTime    = 3;
	Timing.RPDelay              = 2;
	Timing.RCDDelay             = 2;

	sdramHandle.Init.SDBank             = FMC_SDRAM_BANK1;
	sdramHandle.Init.ColumnBitsNumber   = FMC_SDRAM_COLUMN_BITS_NUM_9;
	sdramHandle.Init.RowBitsNumber      = FMC_SDRAM_ROW_BITS_NUM_13;
	sdramHandle.Init.MemoryDataWidth    = SDRAM_MEMORY_WIDTH;
	sdramHandle.Init.InternalBankNumber = FMC_SDRAM_INTERN_BANKS_NUM_4;
	sdramHandle.Init.CASLatency         = FMC_SDRAM_CAS_LATENCY_2;
	sdramHandle.Init.WriteProtection    = FMC_SDRAM_WRITE_PROTECTION_DISABLE;
	sdramHandle.Init.SDClockPeriod      = SDCLOCK_PERIOD;
	sdramHandle.Init.ReadBurst          = FMC_SDRAM_RBURST_ENABLE;
	//sdramHandle.Init.ReadBurst          = FMC_SDRAM_RBURST_DISABLE;
	sdramHandle.Init.ReadPipeDelay      = FMC_SDRAM_RPIPE_DELAY_0;

	/* SDRAM controller initialization */

	if(HAL_SDRAM_Init(&sdramHandle, &Timing) != HAL_OK)
	{
		sdramstatus = SDRAM_ERROR;
	}
	else
	{
		sdramstatus = SDRAM_OK;
	}

	/* SDRAM initialization sequence */
	SDRAM_Initialization_sequence(REFRESH_COUNT);

	return sdramstatus;
}

/**
  * @brief  DeInitializes the SDRAM device.
  * @retval SDRAM status
  */
uint8_t SDRAM_DeInit(void)
{ 
  static uint8_t sdramstatus = SDRAM_ERROR;
  /* SDRAM device de-initialization */
  sdramHandle.Instance = FMC_SDRAM_DEVICE;

  if(HAL_SDRAM_DeInit(&sdramHandle) != HAL_OK)
  {
    sdramstatus = SDRAM_ERROR;
  }
  else
  {
    sdramstatus = SDRAM_OK;
  }
  
  /* SDRAM controller de-initialization */
  SDRAM_MspDeInit(&sdramHandle, NULL);
  
  return sdramstatus;
}

/**
  * @brief  Programs the SDRAM device.
  * @param  RefreshCount: SDRAM refresh counter value 
  * @retval None
  */
void SDRAM_Initialization_sequence(uint32_t RefreshCount)
{
	__IO uint32_t tmpmrd = 0;

	/* Step 1: Configure a clock configuration enable command */
	Command.CommandMode            = FMC_SDRAM_CMD_CLK_ENABLE;
	Command.CommandTarget          = FMC_SDRAM_CMD_TARGET_BANK1;
	Command.AutoRefreshNumber      = 1;
	Command.ModeRegisterDefinition = 0;

	/* Send the command */
	HAL_SDRAM_SendCommand(&sdramHandle, &Command, SDRAM_TIMEOUT);

	/* Step 2: Insert 100 us minimum delay */ 
	/* Inserted delay is equal to 1 ms due to systick time base unit (ms) */
	HAL_Delay(1);

	/* Step 3: Configure a PALL (precharge all) command */ 
	Command.CommandMode            = FMC_SDRAM_CMD_PALL;
	Command.CommandTarget          = FMC_SDRAM_CMD_TARGET_BANK1;
	Command.AutoRefreshNumber      = 1;
	Command.ModeRegisterDefinition = 0;

	/* Send the command */
	HAL_SDRAM_SendCommand(&sdramHandle, &Command, SDRAM_TIMEOUT);  

	/* Step 4: Configure an Auto Refresh command */ 
	//Command.CommandMode            = FMC_SDRAM_CMD_SELFREFRESH_MODE;
	Command.CommandMode            = FMC_SDRAM_CMD_AUTOREFRESH_MODE;
	//Command.CommandMode            = FMC_SDRAM_CMD_NORMAL_MODE;
	Command.CommandTarget          = FMC_SDRAM_CMD_TARGET_BANK1;
	Command.AutoRefreshNumber      = 8;
	Command.ModeRegisterDefinition = 0;

	/* Send the command */
	HAL_SDRAM_SendCommand(&sdramHandle, &Command, SDRAM_TIMEOUT);

	/* Step 5: Program the external memory mode register */
	/*
	tmpmrd = (uint32_t)SDRAM_MODEREG_BURST_LENGTH_1          |\
					 SDRAM_MODEREG_BURST_TYPE_SEQUENTIAL   |\
					 SDRAM_MODEREG_CAS_LATENCY_2           |\
					 SDRAM_MODEREG_OPERATING_MODE_STANDARD |\
					 SDRAM_MODEREG_WRITEBURST_MODE_SINGLE;
	*/

	/* Step 5: Program the external memory mode register */
	tmpmrd = (uint32_t)SDRAM_MODEREG_BURST_LENGTH_1          |\
					 SDRAM_MODEREG_BURST_TYPE_SEQUENTIAL   |\
					 SDRAM_MODEREG_CAS_LATENCY_2           |\
					 SDRAM_MODEREG_OPERATING_MODE_STANDARD |\
					 SDRAM_MODEREG_WRITEBURST_MODE_SINGLE;

	Command.CommandMode            = FMC_SDRAM_CMD_LOAD_MODE;
	Command.CommandTarget          = FMC_SDRAM_CMD_TARGET_BANK1;
	Command.AutoRefreshNumber      = 1;
	Command.ModeRegisterDefinition = tmpmrd;

	/* Send the command */
	HAL_SDRAM_SendCommand(&sdramHandle, &Command, SDRAM_TIMEOUT);

	/* Step 6: Set the refresh rate counter */
	/* Set the device refresh rate */
	HAL_SDRAM_ProgramRefreshRate(&sdramHandle, RefreshCount); 
}

/**
  * @brief  Reads an amount of data from the SDRAM memory in polling mode.
  * @param  uwStartAddress: Read start address
  * @param  pData: Pointer to data to be read  
  * @param  uwDataSize: Size of read data from the memory
  * @retval SDRAM status
  */
uint8_t SDRAM_ReadData(uint32_t uwStartAddress, uint32_t *pData, uint32_t uwDataSize)
{
  if(HAL_SDRAM_Read_32b(&sdramHandle, (uint32_t *)uwStartAddress, pData, uwDataSize) != HAL_OK)
  {
    return SDRAM_ERROR;
  }
  else
  {
    return SDRAM_OK;
  } 
}

/**
  * @brief  Reads an amount of data from the SDRAM memory in DMA mode.
  * @param  uwStartAddress: Read start address
  * @param  pData: Pointer to data to be read  
  * @param  uwDataSize: Size of read data from the memory
  * @retval SDRAM status
  */
uint8_t SDRAM_ReadData_DMA(uint32_t uwStartAddress, uint32_t *pData, uint32_t uwDataSize)
{
  if(HAL_SDRAM_Read_DMA(&sdramHandle, (uint32_t *)uwStartAddress, pData, uwDataSize) != HAL_OK)
  {
    return SDRAM_ERROR;
  }
  else
  {
    return SDRAM_OK;
  }     
}

/**
  * @brief  Writes an amount of data to the SDRAM memory in polling mode.
  * @param  uwStartAddress: Write start address
  * @param  pData: Pointer to data to be written  
  * @param  uwDataSize: Size of written data from the memory
  * @retval SDRAM status
  */
uint8_t SDRAM_WriteData(uint32_t uwStartAddress, uint32_t *pData, uint32_t uwDataSize) 
{
  if(HAL_SDRAM_Write_32b(&sdramHandle, (uint32_t *)uwStartAddress, pData, uwDataSize) != HAL_OK)
  {
    return SDRAM_ERROR;
  }
  else
  {
    return SDRAM_OK;
  }
}

/**
  * @brief  Writes an amount of data to the SDRAM memory in DMA mode.
  * @param  uwStartAddress: Write start address
  * @param  pData: Pointer to data to be written  
  * @param  uwDataSize: Size of written data from the memory
  * @retval SDRAM status
  */
uint8_t SDRAM_WriteData_DMA(uint32_t uwStartAddress, uint32_t *pData, uint32_t uwDataSize) 
{
  if(HAL_SDRAM_Write_DMA(&sdramHandle, (uint32_t *)uwStartAddress, pData, uwDataSize) != HAL_OK)
  {
    return SDRAM_ERROR;
  }
  else
  {
    return SDRAM_OK;
  } 
}

/**
  * @brief  Sends command to the SDRAM bank.
  * @param  SdramCmd: Pointer to SDRAM command structure 
  * @retval SDRAM status
  */  
uint8_t SDRAM_Sendcmd(FMC_SDRAM_CommandTypeDef *SdramCmd)
{
  if(HAL_SDRAM_SendCommand(&sdramHandle, SdramCmd, SDRAM_TIMEOUT) != HAL_OK)
  {
    return SDRAM_ERROR;
  }
  else
  {
    return SDRAM_OK;
  }
}

/**
  * @brief  Initializes SDRAM MSP.
  * @param  hsdram: SDRAM handle
  * @param  Params
  * @retval None
  */
__weak void SDRAM_MspInit(SDRAM_HandleTypeDef  *hsdram)
{  
}

/**
  * @brief  DeInitializes SDRAM MSP.
  * @param  hsdram: SDRAM handle
  * @param  Params
  * @retval None
  */
__weak void SDRAM_MspDeInit(SDRAM_HandleTypeDef  *hsdram, void *Params)
{  
}

/**
  * @brief  Handles SDRAM DMA transfer interrupt request.
  * @retval None
  */
extern void isr_sdram_dma(InterruptVector vector, void* arg)
{
	DMA_HandleTypeDef* dmaHandle = (DMA_HandleTypeDef*)arg;
	HAL_DMA_IRQHandler(dmaHandle); 
}

