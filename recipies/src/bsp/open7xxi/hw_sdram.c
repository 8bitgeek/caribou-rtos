#include <hw_sdram.h>
#include <delay.h>

#define SDRAM_MEMORY_WIDTH               FMC_SDRAM_MEM_BUS_WIDTH_16

/**
 *  SDCLK[1:0]: SDRAM clock configuration
 *  These bits define the SDRAM clock period for both SDRAM banks and allow disabling the clock
 *  before changing the frequency. In this case the SDRAM must be re-initialized.
 *  00: SDCLK clock disabled
 *  01: reserved
 *  10: SDCLK period = 2 x HCLK periods
 *  11: SDCLK period = 3 x HCLK periods
 */
#define SDCLOCK_PERIOD                   FMC_SDRAM_CLOCK_PERIOD_2
#define REFRESH_COUNT                    ((uint32_t)0x0603)   /* SDRAM refresh counter (100Mhz SD clock) */
#define SDRAM_TIMEOUT                    ((uint32_t)0xFFFF)

/* DMA definitions for SDRAM DMA transfer */
#define __DMAx_CLK_ENABLE                 __HAL_RCC_DMA2_CLK_ENABLE
#define __DMAx_CLK_DISABLE                __HAL_RCC_DMA2_CLK_DISABLE
#define SDRAM_DMAx_CHANNEL                DMA_CHANNEL_0
#define SDRAM_DMAx_STREAM                 DMA2_Stream0  
#define SDRAM_DMAx_IRQn                   DMA2_Stream0_IRQn
#define SDRAM_DMAx_IRQHandler             DMA2_Stream0_IRQHandler  
  
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

extern void isr_sdram_dma(InterruptVector vector, void* arg);
/* FIXME - remove all the unnessesary stuff */

void    SDRAM_Initialization_sequence(uint32_t RefreshCount);
uint8_t SDRAM_Sendcmd(FMC_SDRAM_CommandTypeDef *SdramCmd);
void    SDRAM_DMA_IRQHandler(void);  
   
/* These functions can be modified in case the current settings (e.g. DMA stream)
   need to be changed for specific application needs */
void    SDRAM_MspInit(SDRAM_HandleTypeDef  *hsdram);
void    SDRAM_MspDeInit(SDRAM_HandleTypeDef  *hsdram, void *Params);

static SDRAM_HandleTypeDef sdramHandle;
static FMC_SDRAM_TimingTypeDef Timing;
static FMC_SDRAM_CommandTypeDef Command;

uint32_t hw_sdram_base(void)
{
  return ((uint32_t)0xD0000000);
}

uint32_t hw_sdram_end(void)
{
  return ((uint32_t)0xD07FFFFF);
}

uint32_t hw_sdram_size(void)
{
  return hw_sdram_end() - hw_sdram_base();
}

bool hw_sdram_setup(void)
{ 
	bool rc = false;

	sdramHandle.Instance = FMC_SDRAM_DEVICE;

	Timing.LoadToActiveDelay    = 2;
	Timing.ExitSelfRefreshDelay = 7;
	Timing.SelfRefreshTime      = 4;
	Timing.RowCycleDelay        = 6;
	Timing.WriteRecoveryTime    = 2;
	Timing.RPDelay              = 2;
	Timing.RCDDelay             = 2;

	sdramHandle.Init.SDBank             = FMC_SDRAM_BANK2;
	sdramHandle.Init.ColumnBitsNumber   = FMC_SDRAM_COLUMN_BITS_NUM_8;
	sdramHandle.Init.RowBitsNumber      = FMC_SDRAM_ROW_BITS_NUM_12;
	sdramHandle.Init.MemoryDataWidth    = SDRAM_MEMORY_WIDTH;
	sdramHandle.Init.InternalBankNumber = FMC_SDRAM_INTERN_BANKS_NUM_4;
	sdramHandle.Init.CASLatency         = FMC_SDRAM_CAS_LATENCY_3;
	sdramHandle.Init.WriteProtection    = FMC_SDRAM_WRITE_PROTECTION_DISABLE;
	sdramHandle.Init.SDClockPeriod      = SDCLOCK_PERIOD;
	sdramHandle.Init.ReadBurst          = FMC_SDRAM_RBURST_DISABLE;
	sdramHandle.Init.ReadPipeDelay      = FMC_SDRAM_RPIPE_DELAY_1;

	rc = (HAL_SDRAM_Init(&sdramHandle, &Timing) != HAL_OK) ? false : true;

	SDRAM_Initialization_sequence(REFRESH_COUNT);

	return rc;
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
  Command.CommandTarget          = FMC_SDRAM_CMD_TARGET_BANK2;
  Command.AutoRefreshNumber      = 1;
  Command.ModeRegisterDefinition = 0;

  /* Send the command */
  HAL_SDRAM_SendCommand(&sdramHandle, &Command, SDRAM_TIMEOUT);

  /* Step 2: Insert 100 us minimum delay */ 
  /* Inserted delay is equal to 1 ms due to systick time base unit (ms) */
  msdelay(1000);
    
  /* Step 3: Configure a PALL (precharge all) command */ 
  Command.CommandMode            = FMC_SDRAM_CMD_PALL;
  Command.CommandTarget          = FMC_SDRAM_CMD_TARGET_BANK2;
  Command.AutoRefreshNumber      = 1;
  Command.ModeRegisterDefinition = 0;

  /* Send the command */
  HAL_SDRAM_SendCommand(&sdramHandle, &Command, SDRAM_TIMEOUT);  
  
  /* Step 4: Configure an Auto Refresh command */ 
  Command.CommandMode            = FMC_SDRAM_CMD_AUTOREFRESH_MODE;
  Command.CommandTarget          = FMC_SDRAM_CMD_TARGET_BANK2;
  Command.AutoRefreshNumber      = 8;
  Command.ModeRegisterDefinition = 0;

  /* Send the command */
  HAL_SDRAM_SendCommand(&sdramHandle, &Command, SDRAM_TIMEOUT);
  
  /* Step 5: Program the external memory mode register */
  tmpmrd = (uint32_t)SDRAM_MODEREG_BURST_LENGTH_1          |\
                     SDRAM_MODEREG_BURST_TYPE_SEQUENTIAL   |\
                     SDRAM_MODEREG_CAS_LATENCY_3           |\
                     SDRAM_MODEREG_OPERATING_MODE_STANDARD |\
                     SDRAM_MODEREG_WRITEBURST_MODE_SINGLE;
  
  Command.CommandMode            = FMC_SDRAM_CMD_LOAD_MODE;
  Command.CommandTarget          = FMC_SDRAM_CMD_TARGET_BANK2;
  Command.AutoRefreshNumber      = 1;
  Command.ModeRegisterDefinition = tmpmrd;

  /* Send the command */
  HAL_SDRAM_SendCommand(&sdramHandle, &Command, SDRAM_TIMEOUT);
  
  /* Step 6: Set the refresh rate counter */
  /* Set the device refresh rate */
  HAL_SDRAM_ProgramRefreshRate(&sdramHandle, RefreshCount); 
}

__weak void SDRAM_MspInit(SDRAM_HandleTypeDef  *hsdram)
{  
}

__weak void SDRAM_MspDeInit(SDRAM_HandleTypeDef  *hsdram, void *Params)
{  
}

extern void isr_sdram_dma(InterruptVector vector, void* arg)
{
	DMA_HandleTypeDef* dmaHandle = (DMA_HandleTypeDef*)arg;
	HAL_DMA_IRQHandler(dmaHandle); 
}

