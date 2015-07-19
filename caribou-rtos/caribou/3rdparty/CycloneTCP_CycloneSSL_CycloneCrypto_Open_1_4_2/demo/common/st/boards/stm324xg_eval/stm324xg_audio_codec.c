/**
  ******************************************************************************
  * @file    stm324xg_audio_codec.c
  * @author  MCD Application Team
  * @version V1.0.0
  * @date    31-July-2012
  * @brief   This file includes the low layer driver for CS43L22 Audio Codec.
  * 
  *     *******************************************************************  
  *                           IMPORTANT NOTES
  *     *******************************************************************  
  *     This file is extracted and modified from the audio codec driver
  *     "stm324xg_eval_audio_codec.c" provided by STMicroelectronics for
  *     the STM32F2xx family (in folder Utilities\STM32_EVAL\STM324xG_EVAL).
  *     This modified driver is intended for use ONLY in the scope of the
  *     current Audio Example.
  *        
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; COPYRIGHT 2012 STMicroelectronics</center></h2>
  *
  * Licensed under MCD-ST Liberty SW License Agreement V2, (the "License");
  * You may not use this file except in compliance with the License.
  * You may obtain a copy of the License at:
  *
  *        http://www.st.com/software_license_agreement_liberty_v2
  *
  * Unless required by applicable law or agreed to in writing, software 
  * distributed under the License is distributed on an "AS IS" BASIS, 
  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  * See the License for the specific language governing permissions and
  * limitations under the License.
  *
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "stm324xg_audio_codec.h"

/** @addtogroup STM32_Audio_Utilities
  * @{
  */


/** @defgroup STM32_AUDIO_CODEC 
  * @brief STM32 Audio Player module
  * @{
  */ 

/** @defgroup STM32_AUDIO_CODEC_Private_TypesDefinitions
  * @{
  */ 
/**
  * @}
  */ 

/** @defgroup STM32_AUDIO_CODEC_Private_Defines
  * @{
  */ 
/* Mask for the bit EN of the I2S CFGR register */
#define I2S_ENABLE_MASK                 0x0400

/* Delay for the Codec to be correctly reset */
#define CODEC_RESET_DELAY               0x4FFF

/* Codec audio Standards */
#ifdef I2S_STANDARD_PHILLIPS
 #define  CODEC_STANDARD                0x04
 #define I2S_STANDARD                   I2S_Standard_Phillips         
#elif defined(I2S_STANDARD_MSB)
 #define  CODEC_STANDARD                0x00
 #define I2S_STANDARD                   I2S_Standard_MSB    
#elif defined(I2S_STANDARD_LSB)
 #define  CODEC_STANDARD                0x08
 #define I2S_STANDARD                   I2S_Standard_LSB    
#else 
 #error "Error: No audio communication standard selected !"
#endif /* I2S_STANDARD */

/* The 7 bits Codec adress (sent through I2C interface) */
#define CODEC_ADDRESS                   0x94  /* b00100111 */
/**
  * @}
  */ 

/** @defgroup STM32_AUDIO_CODEC_Private_Macros
  * @{
  */ 
/**
  * @}
  */ 

/** @defgroup STM32_AUDIO_CODEC_Private_Variables
  * @{
  */ 
/* This structure is declared glabal because it is handled by two different functions */
static DMA_InitTypeDef DMA_InitStructure; 
static I2S_InitTypeDef I2S_InitStructure;
static uint8_t OutputDev = 0;

uint32_t AudioTotalSize = 0xFFFF; /* This variable holds the total size of the audio file */
uint32_t AudioRemSize   = 0xFFFF; /* This variable holds the remaining data in audio file */
uint16_t *CurrentPos;             /* This variable holds the current poisition of audio pointer */

__IO uint32_t  CODECTimeout = CODEC_LONG_TIMEOUT;

uint32_t ExternalClockVal = 0;
/**
  * @}
  */ 
  
/** @defgroup STM32_AUDIO_CODEC_Private_FunctionPrototypes
  * @{
  */ 
/*-----------------------------------
                           Audio Codec functions 
                                    ------------------------------------------*/
/* Low layer codec functions */
static void     Codec_CtrlInterface_Init(void);
static void     Codec_CtrlInterface_DeInit(void);
static void     Codec_AudioInterface_DeInit(void);
static void     Codec_Reset(void);
static uint32_t Codec_WriteRegister(uint32_t RegisterAddr, uint32_t RegisterValue);
static void     Codec_GPIO_Init(void);
static void     Codec_GPIO_DeInit(void);
static void     Delay(__IO uint32_t nCount);
#ifdef VERIFY_WRITTENDATA
static uint32_t Codec_ReadRegister(uint32_t RegisterAddr);
#endif /* VERIFY_WRITTENDATA */
/*----------------------------------------------------------------------------*/
/**
  * @}
  */
  
/** @defgroup STM32_AUDIO_CODEC_Private_Functions
  * @{
  */ 
  
/**
  * @brief  Configure the audio peripherals.
  * @param  OutputDevice: OUTPUT_DEVICE_SPEAKER, OUTPUT_DEVICE_HEADPHONE,
  *                       OUTPUT_DEVICE_BOTH or OUTPUT_DEVICE_AUTO .
  * @param  Volume: Initial volume level (from 0 (Mute) to 100 (Max))
  * @param  AudioFreq: Audio frequency used to paly the audio stream.
  * @retval o if correct communication, else wrong communication
  */
uint32_t EVAL_AUDIO_Init(uint16_t OutputDevice, uint8_t Volume, uint32_t AudioFreq, uint32_t ExtClk)
{    
  /* Perform low layer Codec initialization */
  if (Codec_Init(OutputDevice, VOLUME_CONVERT(Volume), AudioFreq, ExtClk) != 0)
  {
    return 1;                
  }
  else
  {    
    /* I2S data transfer preparation:
    Prepare the Media to be used for the audio transfer from memory to I2S peripheral */
    Audio_MAL_Init();
    
    /* Return 0 when all operations are OK */
    return 0;
  }
}

/**
  * @brief Dinitializes all the resources used by the codec (those initialized 
  *        by EVAL_AUDIO_Init() function) EXCEPT the I2C resources since they are 
  *        used by the IOExpander as well (and eventually other modules). 
  * @param None.
  * @retval 0 if correct communication, else wrong communication
  */
uint32_t EVAL_AUDIO_DeInit(void)
{ 
  /* DeInitialize the Media layer */
  Audio_MAL_DeInit();
  
  /* DeInitialize Codec */  
  Codec_DeInit();  
  
  return 0;
}

/**
  * @brief Starts playing audio stream from a data buffer for a determined size. 
  * @param pBuffer: Pointer to the buffer 
  * @param Size: Number of audio data BYTES.
  * @retval o if correct communication, else wrong communication
  */
uint32_t EVAL_AUDIO_Play(uint16_t* pBuffer, uint32_t Size)
{
  /* Set the total number of data to be played (count in half-word) */
  AudioTotalSize = Size/2;

  /* Call the audio Codec Play function */
  Codec_Play();
  
  /* Update the Media layer and enable it for play */  
  Audio_MAL_Play((uint32_t)pBuffer, (uint32_t)(DMA_MAX(AudioTotalSize / 2)));
  
  /* Update the remaining number of data to be played */
  AudioRemSize = (Size/2) - DMA_MAX(AudioTotalSize);
  
  /* Update the current audio pointer position */
  CurrentPos = pBuffer + DMA_MAX(AudioTotalSize);
  
  return 0;
}

/**
  * @brief This function Pauses or Resumes the audio file stream. In case
  *        of using DMA, the DMA Pause feature is used. In all cases the I2S 
  *        peripheral is disabled. 
  * 
  * @WARNING When calling EVAL_AUDIO_PauseResume() function for pause, only
  *         this function should be called for resume (use of EVAL_AUDIO_Play() 
  *         function for resume could lead to unexpected behaviour).
  * 
  * @param Cmd: AUDIO_PAUSE (or 0) to pause, AUDIO_RESUME (or any value different
  *        from 0) to resume. 
  * @param Addr: Address from/at which the audio stream should resume/pause.
  * @param Size: Number of data to be configured for next resume.
  * @retval o if correct communication, else wrong communication
  */
uint32_t EVAL_AUDIO_PauseResume(uint32_t Cmd, uint32_t Addr, uint32_t Size)
{    
  if (Cmd != AUDIO_PAUSE)
  {
    /* Call the Media layer pause/resume function */
    Audio_MAL_PauseResume(Cmd, Addr, Size);    
    
    /* Call the Audio Codec Pause/Resume function */
    if (Codec_PauseResume(Cmd) != 0)
    {
      return 1;
    }
    else
    {
      return 0;
    }   
  }
  else
  {
    /* Call the Audio Codec Pause/Resume function */
    if (Codec_PauseResume(Cmd) != 0)
    {
      return 1;
    }
    else
    {
      /* Call the Media layer pause/resume function */
      Audio_MAL_PauseResume(Cmd, Addr, Size);
      
      /* Return 0 if all operations are OK */
      return 0;
    }     
  }
}

/**
  * @brief Stops audio playing and Power down the Audio Codec. 
  * @param Option: could be one of the following parameters 
  * @arg   CODEC_PDWN_SW for software power off (by writing registers) Then no 
  *        need to reconfigure the Codec after power on.
  * @arg   ODEC_PDWN_HW completely shut down the codec (physically). Then need 
  *        to reconfigure the Codec after power on.  
  * @retval o if correct communication, else wrong communication
  */
uint32_t EVAL_AUDIO_Stop(uint32_t Option)
{
  /* Call Audio Codec Stop function */
  if (Codec_Stop(Option) != 0)
  {
    return 1;
  }
  else
  {
    /* Call Media layer Stop function */
    Audio_MAL_Stop();
    
    /* Update the remaining data number */
    AudioRemSize = AudioTotalSize;    
    
    /* Return 0 when all operations are correctly done */
    return 0;
  }
}

/**
  * @brief Controls the current audio volume level. 
  * @param Volume: Volume level to be set in percentage from 0% to 100% (0 for 
  *        Mute and 100 for Max volume level).
  * @retval o if correct communication, else wrong communication
  */
uint32_t EVAL_AUDIO_VolumeCtl(uint8_t Volume)
{
  /* Call the codec volume control function with converted volume value */
  return (Codec_VolumeCtrl(VOLUME_CONVERT(Volume)));
}

/**
  * @brief Enable or disable the MUTE mode by software 
  * @param Command: could be AUDIO_MUTE_ON to mute sound or AUDIO_MUTE_OFF to 
  *        unmute the codec and restore previous volume level.
  * @retval o if correct communication, else wrong communication
  */
uint32_t EVAL_AUDIO_Mute(uint32_t Cmd)
{ 
  /* Call the Codec Mute function */
  return (Codec_Mute(Cmd));
}


/*========================

                CS43L22 Audio Codec Control Functions
                                                ==============================*/
/**
* @brief Initializes the audio codec and all related interfaces (control 
  *      interface: I2C and audio interface: I2S)
  * @param OutputDevice: can be OUTPUT_DEVICE_SPEAKER, OUTPUT_DEVICE_HEADPHONE,
  *                       OUTPUT_DEVICE_BOTH or OUTPUT_DEVICE_AUTO .
  * @param  Volume: Initial volume level (from 0 (Mute) to 100 (Max))
  * @param  AudioFreq: Audio frequency used to paly the audio stream.
  * @retval o if correct communication, else wrong communication
  */
uint32_t Codec_Init(uint16_t OutputDevice, uint8_t Volume, uint32_t AudioFreq, uint32_t ExtClk)
{
  uint32_t counter = 0;  
  
  /* Reset the Codec Registers */
  Codec_Reset();

  /* Configure the Codec related IOs */
  Codec_GPIO_Init();  
  
  /* Initialize the Control interface of the Audio Codec */
  Codec_CtrlInterface_Init();     
  
  /* Keep Codec powered OFF */
  counter += Codec_WriteRegister(0x02, 0x01);  

  switch (OutputDevice)
  {
    case OUTPUT_DEVICE_SPEAKER:
      counter += Codec_WriteRegister(0x04, 0xFA); /* SPK always ON & HP always OFF */
      OutputDev = 0xFA;
      break;
      
    case OUTPUT_DEVICE_HEADPHONE:
      counter += Codec_WriteRegister(0x04, 0xAF); /* SPK always OFF & HP always ON */
      OutputDev = 0xAF;
      break;
      
    case OUTPUT_DEVICE_BOTH:
      counter += Codec_WriteRegister(0x04, 0xAA); /* SPK always ON & HP always ON */
      OutputDev = 0xAA;
      break;
      
    case OUTPUT_DEVICE_AUTO:
      counter += Codec_WriteRegister(0x04, 0x05); /* Detect the HP or the SPK automatically */
      OutputDev = 0x05;
      break;    
      
    default:
      counter += Codec_WriteRegister(0x04, 0x05); /* Detect the HP or the SPK automatically */
      OutputDev = 0x05;
      break;
    
  }
  
  /* Clock configuration: Auto detection */  
  counter += Codec_WriteRegister(0x05, 0x81);
  
  /* Set the Slave Mode and the audio Standard */  
  counter += Codec_WriteRegister(0x06, CODEC_STANDARD);
      
  /* Set the Master volume */
  Codec_VolumeCtrl(Volume);

  /* If the Speaker is enabled, set the Mono mode and volume attenuation level */
  if (OutputDevice != OUTPUT_DEVICE_HEADPHONE)
  {
    /* Set the Speaker Mono mode */  
    counter += Codec_WriteRegister(0x0F , 0x06);
    
    /* Set the Speaker attenuation level */  
    counter += Codec_WriteRegister(0x24, 0x00);
    counter += Codec_WriteRegister(0x25, 0x00);
  }
  
  /* Power on the Codec */
  counter += Codec_WriteRegister(0x02, 0x9E);  
  
  /* Additional configuration for the CODEC. These configurations are done to reduce
      the time needed for the Codec to power off. If these configurations are removed, 
      then a long delay should be added between powering off the Codec and switching 
      off the I2S peripheral MCLK clock (which is the operating clock for Codec).
      If this delay is not inserted, then the codec will not shut down propoerly and
      it results in high noise after shut down. */
  
  /* Disable the analog soft ramp */
  counter += Codec_WriteRegister(0x0A, 0x00);
  /* Disable the digital soft ramp */
  counter += Codec_WriteRegister(0x0E, 0x04);
  /* Disable the limiter attack level */
  counter += Codec_WriteRegister(0x27, 0x00);
  /* Adjust Bass and Treble levels */
  counter += Codec_WriteRegister(0x1F, 0x0F);
  /* Adjust PCM volume level */
  counter += Codec_WriteRegister(0x1A, 0x0A);
  counter += Codec_WriteRegister(0x1B, 0x0A);

  /* Configure the I2S peripheral */
  Codec_AudioInterface_Init(AudioFreq, ExtClk);  
  /* Store the current value of the external clock */
  ExternalClockVal = ExtClk;
  
  /* Return communication control value */
  return counter;  
}

/**
  * @brief Restore the audio codec state to default state and free all used 
  *        resources.
  * @param None.
  * @retval o if correct communication, else wrong communication
  */
uint32_t Codec_DeInit(void)
{
  uint32_t counter = 0; 

  /* Reset the Codec Registers */
  Codec_Reset();  
  
  /* Keep Codec powered OFF */
  counter += Codec_WriteRegister(0x02, 0x01);    
  
  /* Deinitialize all use GPIOs */
  Codec_GPIO_DeInit();

  /* Disable the Codec control interface */
  Codec_CtrlInterface_DeInit();
  
  /* Deinitialize the Codec audio interface (I2S) */
  Codec_AudioInterface_DeInit(); 
  
  /* Return communication control value */
  return counter;  
}

/**
  * @brief Start the audio Codec play feature.
  *        For this codec no Play options are required.
  * @param None.
  * @retval o if correct communication, else wrong communication
  */
uint32_t Codec_Play(void)
{
  /* 
     No actions required on Codec level for play command
     */  

  /* Return communication control value */
  return 0;  
}

/**
  * @brief Pauses and resumes playing on the audio codec.
  * @param Cmd: AUDIO_PAUSE (or 0) to pause, AUDIO_RESUME (or any value different
  *        from 0) to resume. 
  * @retval o if correct communication, else wrong communication
  */
uint32_t Codec_PauseResume(uint32_t Cmd)
{
  uint32_t counter = 0;   
  
  /* Pause the audio file playing */
  if (Cmd == AUDIO_PAUSE)
  { 
    /* Mute the output first */
    counter += Codec_Mute(AUDIO_MUTE_ON);

    /* Put the Codec in Power save mode */    
    counter += Codec_WriteRegister(0x02, 0x01);      
  }
  else /* AUDIO_RESUME */
  {   
    /* Unmute the output first */
    counter += Codec_Mute(AUDIO_MUTE_OFF);
    
    counter += Codec_WriteRegister(0x04, OutputDev);
    
    /* Exit the Power save mode */
    counter += Codec_WriteRegister(0x02, 0x9E); 
  }

  return counter;
}

/**
  * @brief Stops audio Codec playing. It powers down the codec.
  * @param CodecPdwnMode: selects the  power down mode.
  * @arg   CODEC_PDWN_SW: only mutes the audio codec. When resuming from this 
  *        mode the codec keeps the prvious initialization (no need to re-Initialize
  *        the codec registers).
  * @arg   CODEC_PDWN_HW: Physically power down the codec. When resuming from this
  *        mode, the codec is set to default configuration (user should re-Initialize
  *        the codec in order to play again the audio stream).
  * @retval o if correct communication, else wrong communication
  */
uint32_t Codec_Stop(uint32_t CodecPdwnMode)
{
  uint32_t counter = 0;   

  /* Mute the output first */
  Codec_Mute(AUDIO_MUTE_ON);
  
  if (CodecPdwnMode == CODEC_PDWN_SW)
  {    
    /* Power down the DAC and the speaker (PMDAC and PMSPK bits)*/
    counter += Codec_WriteRegister(0x02, 0x9F);
  }
  else /* CODEC_PDWN_HW */
  { 
    /* Power down the DAC components */
    counter += Codec_WriteRegister(0x02, 0x9F);
    
    /* Wait at least 100�s */
    Delay(0xFFF);
    
    /* Reset The pin */
    IOE_WriteIOPin(AUDIO_RESET_PIN, BitReset);
  }
  
  return counter;    
}

/**
  * @brief Highers or Lowers the codec volume level.
  * @param Volume: a byte value from 0 to 255 (refer to codec registers 
  *        description for more details).
  * @retval o if correct communication, else wrong communication
  */
uint32_t Codec_VolumeCtrl(uint8_t Volume)
{
  uint32_t counter = 0;
  
  if (Volume > 0xE6)
  {
    /* Set the Master volume */
    counter += Codec_WriteRegister(0x20, Volume - 0xE7); 
    counter += Codec_WriteRegister(0x21, Volume - 0xE7);     
  }
  else
  {
    /* Set the Master volume */
    counter += Codec_WriteRegister(0x20, Volume + 0x19); 
    counter += Codec_WriteRegister(0x21, Volume + 0x19); 
  }

  return counter;  
}

/**
  * @brief Enables or disables the mute feature on the audio codec.
  * @param Cmd: AUDIO_MUTE_ON to enable the mute or AUDIO_MUTE_OFF to disable the
  *             mute mode.
  * @retval o if correct communication, else wrong communication
  */
uint32_t Codec_Mute(uint32_t Cmd)
{
  uint32_t counter = 0;  
  
  /* Set the Mute mode */
  if (Cmd == AUDIO_MUTE_ON)
  {
    counter += Codec_WriteRegister(0x04, 0xFF);
  }
  else /* AUDIO_MUTE_OFF Disable the Mute */
  {
    counter += Codec_WriteRegister(0x04, OutputDev);
  }
  
  return counter;  
}

/**
  * @brief Resets the audio codec. It restores the default configuration of the 
  *        codec (this function shall be called before initializing the codec).
  *
  * @note  This function calls an external driver function: The IO Expander driver.
  *
  * @param None.
  * @retval 0 if correct communication, else wrong communication
  */
static void Codec_Reset(void)
{
  /* Configure the IO Expander (to use the Codec Reset pin mapped on the IOExpander) */
  IOE_Config();
  
  /* Power Down the codec */
  IOE_WriteIOPin(AUDIO_RESET_PIN, BitReset);

  /* wait for a delay to insure registers erasing */
  Delay(CODEC_RESET_DELAY); 
  
  /* Power on the codec */
  IOE_WriteIOPin(AUDIO_RESET_PIN, BitSet);
}

/**
  * @brief Switch dynamically (while audio file is played) the output target (speaker or headphone).
  *
  * @note  This function modifies a global variable of the audio codec driver: OutputDev.
  *
  * @param None.
  * @retval 0 if correct communication, else wrong communication
  */
uint32_t Codec_SwitchOutput(uint8_t Output)
{
  uint8_t counter = 0;
  
  switch (Output) 
  {
    case OUTPUT_DEVICE_SPEAKER:
      counter += Codec_WriteRegister(0x04, 0xFA); /* SPK always ON & HP always OFF */
      OutputDev = 0xFA;
      break;
      
    case OUTPUT_DEVICE_HEADPHONE:
      counter += Codec_WriteRegister(0x04, 0xAF); /* SPK always OFF & HP always ON */
      OutputDev = 0xAF;
      break;
      
    case OUTPUT_DEVICE_BOTH:
      counter += Codec_WriteRegister(0x04, 0xAA); /* SPK always ON & HP always ON */
      OutputDev = 0xAA;
      break;
      
    case OUTPUT_DEVICE_AUTO:
      counter += Codec_WriteRegister(0x04, 0x05); /* Detect the HP or the SPK automatically */
      OutputDev = 0x05;
      break;    
      
    default:
      counter += Codec_WriteRegister(0x04, 0x05); /* Detect the HP or the SPK automatically */
      OutputDev = 0x05;
      break;
  }
  
  return counter;
}

/**
  * @brief Writes a Byte to a given register into the audio codec through the 
           control interface (I2C)
  * @param RegisterAddr: The address (location) of the register to be written.
  * @param RegisterValue: the Byte value to be written into destination register.
  * @retval o if correct communication, else wrong communication
  */
static uint32_t Codec_WriteRegister(uint32_t RegisterAddr, uint32_t RegisterValue)
{
  uint32_t result = 0;

  /*!< While the bus is busy */
  CODECTimeout = CODEC_LONG_TIMEOUT;
  while(I2C_GetFlagStatus(CODEC_I2C, I2C_FLAG_BUSY))
  {
    if((CODECTimeout--) == 0) return Codec_TIMEOUT_UserCallback();
  }
  
  /* Start the config sequence */
  I2C_GenerateSTART(CODEC_I2C, ENABLE);

  /* Test on EV5 and clear it */
  CODECTimeout = CODEC_FLAG_TIMEOUT;
  while (!I2C_CheckEvent(CODEC_I2C, I2C_EVENT_MASTER_MODE_SELECT))
  {
    if((CODECTimeout--) == 0) return Codec_TIMEOUT_UserCallback();
  }
  
  /* Transmit the slave address and enable writing operation */
  I2C_Send7bitAddress(CODEC_I2C, CODEC_ADDRESS, I2C_Direction_Transmitter);

  /* Test on EV6 and clear it */
  CODECTimeout = CODEC_FLAG_TIMEOUT;
  while (!I2C_CheckEvent(CODEC_I2C, I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED))
  {
    if((CODECTimeout--) == 0) return Codec_TIMEOUT_UserCallback();
  }

  /* Transmit the first address for write operation */
  I2C_SendData(CODEC_I2C, RegisterAddr);

  /* Test on EV8 and clear it */
  CODECTimeout = CODEC_FLAG_TIMEOUT;
  while (!I2C_CheckEvent(CODEC_I2C, I2C_EVENT_MASTER_BYTE_TRANSMITTING))
  {
    if((CODECTimeout--) == 0) return Codec_TIMEOUT_UserCallback();
  }
  
  /* Disable the interrupts mechanism to prevent the I2C communication from corruption */
  __disable_irq();  
  
  /* Prepare the register value to be sent */
  I2C_SendData(CODEC_I2C, RegisterValue);
  
  /*!< Wait till all data have been physically transferred on the bus */
  CODECTimeout = CODEC_LONG_TIMEOUT;
  while(!I2C_GetFlagStatus(CODEC_I2C, I2C_FLAG_BTF))
  {
    if((CODECTimeout--) == 0) Codec_TIMEOUT_UserCallback();
  }
  
  /* End the configuration sequence */
  I2C_GenerateSTOP(CODEC_I2C, ENABLE);  
  
#ifdef VERIFY_WRITTENDATA
  /* Verify that the data has been correctly written */  
  result = (Codec_ReadRegister(RegisterAddr) == RegisterValue)? 0:1;
#endif /* VERIFY_WRITTENDATA */
  
  /* Re-enable the interrupt mechanism */
  __enable_irq();
  
  /* Return the verifying value: 0 (Passed) or 1 (Failed) */
  return result;  
}

#ifdef VERIFY_WRITTENDATA
/**
  * @brief Reads and returns te value of an audio codec register through the 
  *        control interface (I2C).
  * @param RegisterAddr: Address of the register to be read.
  * @retval Value of the register to be read or dummy value if the communication
  *         fails.
  */
static uint32_t Codec_ReadRegister(uint32_t RegisterAddr)
{
  uint32_t result = 0;

  /*!< While the bus is busy */
  CODECTimeout = CODEC_LONG_TIMEOUT;
  while(I2C_GetFlagStatus(CODEC_I2C, I2C_FLAG_BUSY))
  {
    if((CODECTimeout--) == 0) return Codec_TIMEOUT_UserCallback();
  }
  
  /* Start the config sequence */
  I2C_GenerateSTART(CODEC_I2C, ENABLE);

  /* Test on EV5 and clear it */
  CODECTimeout = CODEC_FLAG_TIMEOUT;
  while (!I2C_CheckEvent(CODEC_I2C, I2C_EVENT_MASTER_MODE_SELECT))
  {
    if((CODECTimeout--) == 0) return Codec_TIMEOUT_UserCallback();
  }
  
  /* Transmit the slave address and enable writing operation */
  I2C_Send7bitAddress(CODEC_I2C, CODEC_ADDRESS, I2C_Direction_Transmitter);

  /* Test on EV6 and clear it */
  CODECTimeout = CODEC_FLAG_TIMEOUT;
  while (!I2C_CheckEvent(CODEC_I2C, I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED))
  {
    if((CODECTimeout--) == 0) return Codec_TIMEOUT_UserCallback();
  }

  /* Transmit the register address to be read */
  I2C_SendData(CODEC_I2C, RegisterAddr);

  /* Test on EV8 and clear it */
  CODECTimeout = CODEC_FLAG_TIMEOUT;
  while (I2C_GetFlagStatus(CODEC_I2C, I2C_FLAG_BTF) == RESET)
  {
    if((CODECTimeout--) == 0) return Codec_TIMEOUT_UserCallback();
  }
  
  /*!< Send STRAT condition a second time */  
  I2C_GenerateSTART(CODEC_I2C, ENABLE);
  
  /*!< Test on EV5 and clear it (cleared by reading SR1 then writing to DR) */
  CODECTimeout = CODEC_FLAG_TIMEOUT;
  while(!I2C_CheckEvent(CODEC_I2C, I2C_EVENT_MASTER_MODE_SELECT))
  {
    if((CODECTimeout--) == 0) return Codec_TIMEOUT_UserCallback();
  } 

  __disable_irq();
  
  /*!< Send Codec address for read */
  I2C_Send7bitAddress(CODEC_I2C, CODEC_ADDRESS, I2C_Direction_Receiver);  
  
  /* Wait on ADDR flag to be set (ADDR is still not cleared at this level */
  CODECTimeout = CODEC_FLAG_TIMEOUT;
  while(I2C_GetFlagStatus(CODEC_I2C, I2C_FLAG_ADDR) == RESET)
  {
    if((CODECTimeout--) == 0) return Codec_TIMEOUT_UserCallback();
  }     
  
  /*!< Disable Acknowledgement */
  I2C_AcknowledgeConfig(CODEC_I2C, DISABLE);   
  
  /* Clear ADDR register by reading SR1 then SR2 register (SR1 has already been read) */
  (void)CODEC_I2C->SR2;
  
  /*!< Send STOP Condition */
  I2C_GenerateSTOP(CODEC_I2C, ENABLE);
  
  /* Wait for the byte to be received */
  CODECTimeout = CODEC_FLAG_TIMEOUT;
  while(I2C_GetFlagStatus(CODEC_I2C, I2C_FLAG_RXNE) == RESET)
  {
    if((CODECTimeout--) == 0) return Codec_TIMEOUT_UserCallback();
  }
  
  /*!< Read the byte received from the Codec */
  result = I2C_ReceiveData(CODEC_I2C);
  
  /* Wait to make sure that STOP flag has been cleared */
  CODECTimeout = CODEC_FLAG_TIMEOUT;
  while(CODEC_I2C->CR1 & I2C_CR1_STOP)
  {
    if((CODECTimeout--) == 0) return Codec_TIMEOUT_UserCallback();
  }  
  
  /*!< Re-Enable Acknowledgement to be ready for another reception */
  I2C_AcknowledgeConfig(CODEC_I2C, ENABLE);  
  
  /* Clear AF flag for next communication */
  I2C_ClearFlag(CODEC_I2C, I2C_FLAG_AF); 

  /* Re-enable the interrupt mechanism */
  __enable_irq();
  
  /* Return the byte read from Codec */
  return result;
}
#endif /* VERIFY_WRITTENDATA */

/**
  * @brief Initializes the Audio Codec control interface (I2C).
  * @param  None.
  * @retval None.
  */
static void Codec_CtrlInterface_Init(void)
{
  I2C_InitTypeDef I2C_InitStructure;

  /* Enable the CODEC_I2C peripheral clock */
  RCC_APB1PeriphClockCmd(CODEC_I2C_CLK, ENABLE);
  
  /* If the I2C peripheral is already enabled, don't reconfigure it */
  if (CODEC_I2C->CR1 & I2C_CR1_PE)
  {  
    /* CODEC_I2C peripheral configuration */
    I2C_DeInit(CODEC_I2C);
    I2C_InitStructure.I2C_Mode = I2C_Mode_I2C;
    I2C_InitStructure.I2C_DutyCycle = I2C_DutyCycle_2;
    I2C_InitStructure.I2C_OwnAddress1 = 0x33;
    I2C_InitStructure.I2C_Ack = I2C_Ack_Enable;
    I2C_InitStructure.I2C_AcknowledgedAddress = I2C_AcknowledgedAddress_7bit;
    I2C_InitStructure.I2C_ClockSpeed = I2C_SPEED;
    
    /* Enable the I2C peripheral */
    I2C_Cmd(CODEC_I2C, ENABLE);  
    
    /* Initialize the I2C peripheral */
    I2C_Init(CODEC_I2C, &I2C_InitStructure);
  }
}

/**
  * @brief Restore the Audio Codec control interface to its default state.
  *        This function doesn't de-initialize the I2C because the I2C peripheral
  *        may be used by other modules.
  * @param  None.
  * @retval None.
  */
static void Codec_CtrlInterface_DeInit(void)
{
  /* Disable the I2C peripheral */ /* This step is not done here because 
     the I2C interface can be used by other modules */
  /* I2C_DeInit(CODEC_I2C); */
}

/**
  * @brief  Initializes the Audio Codec audio interface (I2S)
  * @note   This function assumes that the I2S input clock (through PLL_R in 
  *         Devices RevA/Z and through dedicated PLLI2S_R in Devices RevB/Y)
  *         is already configured and ready to be used.    
  * @param  AudioFreq: Audio frequency to be configured for the I2S peripheral. 
  * @retval None.
  */
void Codec_AudioInterface_Init(uint32_t AudioFreq, uint32_t ExtClk)
{
#ifdef USE_I2S_DYNAMIC_INIT
  uint32_t plli2sN = 344, plli2sR = 2, pllm = 1;   
  uint32_t I2SSrcClkVal = ExtClk;
  
  /* Verify the current value of the external clock */
  if (ExternalClockVal != ExtClk)
  {
    ExternalClockVal = ExtClk;
  }
  
  /* Compute the PLL parameters */
  if (ExtClk == 0)
  {
    /* Get the PLLM value */
    pllm = (uint32_t)(RCC->PLLCFGR & RCC_PLLCFGR_PLLM);

    switch (AudioFreq)
    {
    case 96000:
      plli2sN = 344;
      plli2sR = 2;
      I2SSrcClkVal = (uint32_t)(((HSE_VALUE / pllm) * plli2sN) / plli2sR);   
      break;
      
    case 48000:
      plli2sN = 344;
      plli2sR = 2;
      I2SSrcClkVal = (uint32_t)(((HSE_VALUE / pllm) * plli2sN) / plli2sR); 
      break;
      
    case 32000:
      plli2sN = 213;
      plli2sR = 2;
      I2SSrcClkVal = (uint32_t)(((HSE_VALUE / pllm) * plli2sN) / plli2sR);
      break;
      
    case 44100:
      plli2sN = 271;
      plli2sR = 2;
      I2SSrcClkVal = (uint32_t)(((HSE_VALUE / pllm) * plli2sN) / plli2sR); 
      break;
      
    case 44000:
      plli2sN = 383;
      plli2sR = 2;
      I2SSrcClkVal = (uint32_t)(((HSE_VALUE / pllm) * plli2sN) / plli2sR); 
      break;
      
    default: /* Use 96 KHz configuration */
      plli2sN = 344;
      plli2sR = 2;
      I2SSrcClkVal = (uint32_t)(((HSE_VALUE / pllm) * plli2sN) / plli2sR); 
      break;     
    }  
  }
#endif /* USE_I2S_DYNAMIC_INIT */
  
  /* Enable the CODEC_I2S peripheral clock */
  RCC_APB1PeriphClockCmd(CODEC_I2S_CLK, ENABLE);
  RCC->APB1ENR |= RCC_APB1Periph_SPI2 | RCC_APB1Periph_SPI3;

  /* Reset CODEC_I2S peripheral */
  I2S_Cmd(CODEC_I2S, DISABLE);
  SPI_I2S_DeInit(CODEC_I2S);  
  
  if (ExtClk)
  {
    RCC->CFGR |= (uint32_t)RCC_CFGR_I2SSRC;
  }
  else
  {
    /* Disable PLLI2S */
    RCC->CFGR |= RCC_CFGR_I2SSRC;
    RCC->CR &= ~((uint32_t)RCC_CR_PLLI2SON);
    
    /* PLLI2S clock used as I2S clock source */
    RCC->CFGR &= ~RCC_CFGR_I2SSRC;
    
    /* Configure PLLI2S */
    RCC->PLLI2SCFGR = (plli2sN << 6) | (plli2sR << 28);
    
    /* Enable PLLI2S */
    RCC->CR |= ((uint32_t)RCC_CR_PLLI2SON);
    
    /* Wait till PLLI2S is ready */
    while((RCC->CR & RCC_CR_PLLI2SRDY) == 0)
    {
    }  
  }
  
  /* CODEC_I2S peripheral configuration */
  I2S_InitStructure.I2S_AudioFreq = AudioFreq;
  I2S_InitStructure.I2S_Standard = I2S_STANDARD;
  I2S_InitStructure.I2S_DataFormat = I2S_DataFormat_16b;
  I2S_InitStructure.I2S_CPOL = I2S_CPOL_Low;
  I2S_InitStructure.I2S_Mode = I2S_Mode_MasterTx;
#ifdef CODEC_MCLK_ENABLED
  I2S_InitStructure.I2S_MCLKOutput = I2S_MCLKOutput_Enable;
#elif defined(CODEC_MCLK_DISABLED)
  I2S_InitStructure.I2S_MCLKOutput = I2S_MCLKOutput_Disable;
#else
 #error "No selection for the MCLK output has been defined !"
#endif /* CODEC_MCLK_ENABLED */

  /* Initialize the I2S peripheral with the structure above */
#ifdef USE_I2S_DYNAMIC_INIT
    I2S_InitExt(CODEC_I2S, &I2S_InitStructure, (uint32_t)((ExtClk)? ExtClk:I2SSrcClkVal));
#else
  I2S_Init(CODEC_I2S, &I2S_InitStructure);  
#endif /* USE_I2S_DYNAMIC_INIT */

  /* Enable the I2S DMA TX request */
  SPI_I2S_DMACmd(CODEC_I2S, SPI_I2S_DMAReq_Tx, ENABLE);

  /* The I2S peripheral will be enabled only in the EVAL_AUDIO_Play() function 
       or by user functions if DMA mode not enabled */  
}

/**
  * @brief Restores the Audio Codec audio interface to its default state.
  * @param  None.
  * @retval None.
  */
static void Codec_AudioInterface_DeInit(void)
{
  /* Disable the CODEC_I2S peripheral (in case it hasn't already been disabled) */
  I2S_Cmd(CODEC_I2S, DISABLE);
  
  /* Deinitialize the CODEC_I2S peripheral */
  SPI_I2S_DeInit(CODEC_I2S);
  
  /* Disable the CODEC_I2S peripheral clock */
  RCC_APB1PeriphClockCmd(CODEC_I2S_CLK, DISABLE); 
}

/**
  * @brief Initializes IOs used by the Audio Codec (on the control and audio 
  *        interfaces).
  * @param  None.
  * @retval None.
  */
static void Codec_GPIO_Init(void)
{
   GPIO_InitTypeDef GPIO_InitStructure;
  
  /* Enable I2S and I2C GPIO clocks */
  RCC_AHB1PeriphClockCmd(CODEC_I2C_GPIO_CLOCK | CODEC_I2S_GPIO_CLOCK, ENABLE);
  
  /* CODEC_I2C SCL and SDA pins configuration -------------------------------------*/
  /* If the I2C peripheral is already enabled, don't reconfigure it */
  if (CODEC_I2C->CR1 & I2C_CR1_PE)
  { 
    GPIO_InitStructure.GPIO_Pin = CODEC_I2C_SCL_PIN | CODEC_I2C_SDA_PIN; 
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_InitStructure.GPIO_OType = GPIO_OType_OD;
    GPIO_InitStructure.GPIO_PuPd  = GPIO_PuPd_NOPULL;
    GPIO_Init(CODEC_I2C_GPIO, &GPIO_InitStructure);     
    /* Connect pins to Periph */
    GPIO_PinAFConfig(CODEC_I2C_GPIO, CODEC_I2S_SCL_PINSRC, CODEC_I2C_GPIO_AF);  
    GPIO_PinAFConfig(CODEC_I2C_GPIO, CODEC_I2S_SDA_PINSRC, CODEC_I2C_GPIO_AF);  
  }
  
  /* CODEC_I2S pins configuraiton: WS, SCK and SD pins -----------------------------*/
  GPIO_InitStructure.GPIO_Pin = CODEC_I2S_WS_PIN | CODEC_I2S_SCK_PIN | CODEC_I2S_SD_PIN; 
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_25MHz;
  GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;
  GPIO_Init(CODEC_I2S_GPIO, &GPIO_InitStructure);     
  /* Connect pins to Periph */
  GPIO_PinAFConfig(CODEC_I2S_GPIO, CODEC_I2S_WS_PINSRC, CODEC_I2S_GPIO_AF);  
  GPIO_PinAFConfig(CODEC_I2S_GPIO, CODEC_I2S_SCK_PINSRC, CODEC_I2S_GPIO_AF);
  GPIO_PinAFConfig(CODEC_I2S_GPIO, CODEC_I2S_SD_PINSRC, CODEC_I2S_GPIO_AF);

 #ifdef CODEC_MCLK_ENABLED
  /* CODEC_I2S pins configuraiton: MCK pin */
  GPIO_InitStructure.GPIO_Pin = CODEC_I2S_MCK_PIN; 
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_25MHz;
  GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;
  GPIO_Init(CODEC_I2S_MCK_GPIO, &GPIO_InitStructure);   
  /* Connect pins to Periph */
  GPIO_PinAFConfig(CODEC_I2S_MCK_GPIO, CODEC_I2S_MCK_PINSRC, CODEC_I2S_GPIO_AF); 
 #endif /* CODEC_MCLK_ENABLED */   
}

/**
  * @brief Restores the IOs used by the Audio Codec interface to their default 
  *        state
  * @param  None.
  * @retval None.
  */
static void Codec_GPIO_DeInit(void)
{
  GPIO_InitTypeDef GPIO_InitStructure;
  
  /* Deinitialize all the GPIOs used by the driver (EXCEPT the I2C IOs since 
     they are used by the IOExpander as well) */
  GPIO_InitStructure.GPIO_Pin = CODEC_I2S_WS_PIN | CODEC_I2S_SCK_PIN | CODEC_I2S_SD_PIN;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_2MHz;
  GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  GPIO_InitStructure.GPIO_PuPd  = GPIO_PuPd_NOPULL;
  GPIO_Init(CODEC_I2S_GPIO, &GPIO_InitStructure);     
  /* Disconnect pins from Periph */
  GPIO_PinAFConfig(CODEC_I2S_GPIO, CODEC_I2S_WS_PIN, 0x00);  
  GPIO_PinAFConfig(CODEC_I2S_GPIO, CODEC_I2S_SCK_PIN, 0x00);
  GPIO_PinAFConfig(CODEC_I2S_GPIO, CODEC_I2S_SD_PIN, 0x00);  
  
#ifdef CODEC_MCLK_ENABLED
  /* CODEC_I2S pins deinitialization: MCK pin */
  GPIO_InitStructure.GPIO_Pin = CODEC_I2S_MCK_PIN; 
  GPIO_Init(CODEC_I2S_MCK_GPIO, &GPIO_InitStructure);   
  /* Disonnect pins from Periph */
  GPIO_PinAFConfig(CODEC_I2S_MCK_GPIO, CODEC_I2S_MCK_PINSRC, CODEC_I2S_GPIO_AF); 
#endif /* CODEC_MCLK_ENABLED */    
}

/**
  * @brief  Inserts a delay time (not accurate timing).
  * @param  nCount: specifies the delay time length.
  * @retval None.
  */
static void Delay( __IO uint32_t nCount)
{
  for (; nCount != 0; nCount--);
}

#ifdef USE_DEFAULT_TIMEOUT_CALLBACK
/**
  * @brief  Basic management of the timeout situation.
  * @param  None.
  * @retval None.
  */
uint32_t Codec_TIMEOUT_UserCallback(void)
{
  /* Block communication and all processes */
  while (1)
  {   
  }
}
#endif /* USE_DEFAULT_TIMEOUT_CALLBACK */
/*========================

                Audio MAL Interface Control Functions

                                                ==============================*/

/**
  * @brief  Initializes and prepares the Media to perform audio data transfer 
  *         from Media to the I2S peripheral.
  * @param  None.
  * @retval None.
  */
void Audio_MAL_Init(void)  
{   
#if defined(AUDIO_MAL_DMA_IT_TC_EN) || defined(AUDIO_MAL_DMA_IT_HT_EN) || defined(AUDIO_MAL_DMA_IT_TE_EN)
  NVIC_InitTypeDef NVIC_InitStructure;
#endif
  
  /* Enable the DMA clock */
  RCC_AHB1PeriphClockCmd(AUDIO_MAL_DMA_CLOCK, ENABLE); 
  
  /* Configure the DMA Stream */
  DMA_Cmd(AUDIO_MAL_DMA_STREAM, DISABLE);
  DMA_DeInit(AUDIO_MAL_DMA_STREAM);
  /* Set the parameters to be configured */
  DMA_InitStructure.DMA_Channel = AUDIO_MAL_DMA_CHANNEL;  
  DMA_InitStructure.DMA_PeripheralBaseAddr = CODEC_I2S_ADDRESS;
  DMA_InitStructure.DMA_Memory0BaseAddr = (uint32_t)0;      /* This field will be configured in play function */
  DMA_InitStructure.DMA_DIR = DMA_DIR_MemoryToPeripheral;
  DMA_InitStructure.DMA_BufferSize = (uint32_t)0xFFFE;      /* This field will be configured in play function */
  DMA_InitStructure.DMA_PeripheralInc = DMA_PeripheralInc_Disable;
  DMA_InitStructure.DMA_MemoryInc = DMA_MemoryInc_Enable;
  DMA_InitStructure.DMA_PeripheralDataSize = AUDIO_MAL_DMA_PERIPH_DATA_SIZE;
  DMA_InitStructure.DMA_MemoryDataSize = AUDIO_MAL_DMA_MEM_DATA_SIZE; 
#ifdef AUDIO_MAL_MODE_NORMAL
  DMA_InitStructure.DMA_Mode = DMA_Mode_Normal;
#elif defined(AUDIO_MAL_MODE_CIRCULAR)
  DMA_InitStructure.DMA_Mode = DMA_Mode_Circular;
#else
  #error "AUDIO_MAL_MODE_NORMAL or AUDIO_MAL_MODE_CIRCULAR should be selected !!"
#endif /* AUDIO_MAL_MODE_NORMAL */  
  DMA_InitStructure.DMA_Priority = DMA_Priority_High;
  DMA_InitStructure.DMA_FIFOMode = DMA_FIFOMode_Enable;         
  DMA_InitStructure.DMA_FIFOThreshold = DMA_FIFOThreshold_Full;
  DMA_InitStructure.DMA_MemoryBurst = DMA_MemoryBurst_Single;
  DMA_InitStructure.DMA_PeripheralBurst = DMA_PeripheralBurst_Single;  
  DMA_Init(AUDIO_MAL_DMA_STREAM, &DMA_InitStructure);  

  /* Enable the selected DMA interrupts (selected in "stm32_eval_audio_codec.h" defines) */
#ifdef AUDIO_MAL_DMA_IT_TC_EN
  DMA_ITConfig(AUDIO_MAL_DMA_STREAM, DMA_IT_TC, ENABLE);
#endif /* AUDIO_MAL_DMA_IT_TC_EN */
#ifdef AUDIO_MAL_DMA_IT_HT_EN
  DMA_ITConfig(AUDIO_MAL_DMA_STREAM, DMA_IT_HT, ENABLE);
#endif /* AUDIO_MAL_DMA_IT_HT_EN */
#ifdef AUDIO_MAL_DMA_IT_TE_EN
  DMA_ITConfig(AUDIO_MAL_DMA_STREAM, DMA_IT_TE | DMA_IT_FE | DMA_IT_DME, ENABLE);
#endif /* AUDIO_MAL_DMA_IT_TE_EN */
  
#ifdef AUDIO_MAL_USE_DMA_DOUBLE
  DMA_DoubleBufferModeCmd(AUDIO_MAL_DMA_STREAM, ENABLE);
#endif /* AUDIO_MAL_USE_DMA_DOUBLE */
  
  /* Enable the I2S DMA request */
  SPI_I2S_DMACmd(CODEC_I2S, SPI_I2S_DMAReq_Tx, ENABLE);
  
#if defined(AUDIO_MAL_DMA_IT_TC_EN) || defined(AUDIO_MAL_DMA_IT_HT_EN) || defined(AUDIO_MAL_DMA_IT_TE_EN)
  /* I2S DMA IRQ Channel configuration */
  NVIC_InitStructure.NVIC_IRQChannel = AUDIO_MAL_DMA_IRQ;
  NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = EVAL_AUDIO_IRQ_PREPRIO;
  NVIC_InitStructure.NVIC_IRQChannelSubPriority = EVAL_AUDIO_IRQ_SUBRIO;
  NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
  NVIC_Init(&NVIC_InitStructure);
#endif 
}

/**
  * @brief  Restore default state of the used Media.
  * @param  None.
  * @retval None.
  */
void Audio_MAL_DeInit(void)  
{   
#if defined(AUDIO_MAL_DMA_IT_TC_EN) || defined(AUDIO_MAL_DMA_IT_HT_EN) || defined(AUDIO_MAL_DMA_IT_TE_EN)
  NVIC_InitTypeDef NVIC_InitStructure;  
  
  /* Deinitialize the NVIC interrupt for the I2S DMA Stream */
  NVIC_InitStructure.NVIC_IRQChannel = AUDIO_MAL_DMA_IRQ;
  NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = EVAL_AUDIO_IRQ_PREPRIO;
  NVIC_InitStructure.NVIC_IRQChannelSubPriority = EVAL_AUDIO_IRQ_SUBRIO;
  NVIC_InitStructure.NVIC_IRQChannelCmd = DISABLE;
  NVIC_Init(&NVIC_InitStructure);  
#endif 
  
  /* Disable the DMA stream before the deinit */
  DMA_Cmd(AUDIO_MAL_DMA_STREAM, DISABLE);
  
  /* Dinitialize the DMA Stream */
  DMA_DeInit(AUDIO_MAL_DMA_STREAM);
  
  /* 
     The DMA clock is not disabled, since it can be used by other streams 
                                                                          */ 
}

/**
  * @brief  Starts playing audio stream from the audio Media.
  * @param  Addr: Pointer to the audio stream buffer
  * @param  Size: Number of data in the audio stream buffer
  * @retval None.
  */
void Audio_MAL_Play(uint32_t Addr, uint32_t Size)
{   
#ifndef AUDIO_USE_MACROS 
  /* Enable the I2S DMA Stream*/
  DMA_Cmd(AUDIO_MAL_DMA_STREAM, DISABLE);
  
  /* Wait the DMA Stream to be effectively disabled */
  //while (DMA_GetCmdStatus(AUDIO_MAL_DMA_STREAM) != DISABLE)
  {}

  /* Clear the Interrupt flag */
  DMA_ClearFlag(AUDIO_MAL_DMA_STREAM, AUDIO_MAL_DMA_FLAG_TC); 
  
  /* Configure the buffer address and size */
  DMA_InitStructure.DMA_Memory0BaseAddr = (uint32_t)Addr;
  DMA_InitStructure.DMA_BufferSize = (uint32_t)(Size);

  /* Configure the DMA Stream with the new parameters */
  DMA_Init(AUDIO_MAL_DMA_STREAM, &DMA_InitStructure);
  
  /* Enable the I2S DMA Stream*/
  DMA_Cmd(AUDIO_MAL_DMA_STREAM, ENABLE);

  /* If the I2S peripheral is still not enabled, enable it */
  if ((CODEC_I2S->I2SCFGR & I2S_ENABLE_MASK) == 0)
  {
    I2S_Cmd(CODEC_I2S, ENABLE);
  }   
#else
 #ifdef AUDIO_MAL_USE_DMA_DOUBLE
  /* Configure the buffer address */
  if ((DMAy_Streamx->CR & DMA_SxCR_CT) == 0)
  {
    AUDIO_MAL_DMA_STREAM->M0AR = (uint32_t)Addr;
  }
  else
  {
    AUDIO_MAL_DMA_STREAM->M1AR = (uint32_t)Addr;
  }
 #else
  /* Disable the I2S DMA Stream*/
  AUDIO_MAL_DMA_STREAM->CR &= ~(uint32_t)DMA_SxCR_EN;
  
  /* Clear the Interrupt flag */
  AUDIO_MAL_DMA->AUDIO_MAL_DMA_IFCR = (uint32_t)(AUDIO_MAL_DMA_FLAG_TC & 0x0F7D0F7D);
  
  /* Wait the DMA Stream to be effectively disabled */
  while ((AUDIO_MAL_DMA_STREAM->CR & (uint32_t)DMA_SxCR_EN) != 0)
  {}
 
  /* Configure the buffer address and size */
  AUDIO_MAL_DMA_STREAM->M0AR = (uint32_t)Addr;

  AUDIO_MAL_DMA_STREAM->NDTR = (uint32_t)(Size);
  
  /* Enable the I2S DMA Stream*/
  AUDIO_MAL_DMA_STREAM->CR |= (uint32_t)DMA_SxCR_EN;
 #endif /* AUDIO_MAL_USE_DMA_DOUBLE */
  
  /* If the I2S peripheral is still not enabled, enable it */
  CODEC_I2S->I2SCFGR |= SPI_I2SCFGR_I2SE;
#endif /* AUDIO_USE_MACROS */
}

/**
  * @brief  Pauses or Resumes the audio stream playing from the Media.
  * @param Cmd: AUDIO_PAUSE (or 0) to pause, AUDIO_RESUME (or any value different
  *        from 0) to resume. 
  * @param Addr: Address from/at which the audio stream should resume/pause.
  * @param Size: Number of data to be configured for next resume.
  * @retval None.
  */
void Audio_MAL_PauseResume(uint32_t Cmd, uint32_t Addr, uint32_t Size)
{
  /* Pause the audio file playing */
  if (Cmd == AUDIO_PAUSE)
  {    
#ifdef USE_DMA_PAUSE_FEATURE
    /* Disable the I2S peripheral */
    I2S_Cmd(CODEC_I2S, DISABLE);
    
    /* Pause the I2S DMA Stream 
        Note. For the STM32F2xx devices, the DMA implements a pause feature, 
              by disabling the stream, all configuration is preserved and data 
              transfer is paused till the next enable of the stream.
              This feature is not available on STM32F1xx devices. */
    DMA_Cmd(AUDIO_MAL_DMA_STREAM, DISABLE);
    
#else /* #if !defined(USE_DMA_PAUSE_FEATURE) */      
    /* Stop the current DMA request by resetting the I2S cell */
    Codec_AudioInterface_DeInit();
    
    /* Re-configure the I2S interface for the next resume operation */
    Codec_AudioInterface_Init(I2S_InitStructure.I2S_AudioFreq, ExternalClockVal);

    /* Disable the DMA Stream */
    DMA_Cmd(AUDIO_MAL_DMA_STREAM, DISABLE);
    
    /* Wait the DMA Stream to be effectively disabled */
    while (DMA_GetCmdStatus(AUDIO_MAL_DMA_STREAM) != DISABLE)
    {}
    
    /* Clear the Interrupt flag */
    DMA_ClearFlag(AUDIO_MAL_DMA_STREAM, AUDIO_MAL_DMA_FLAG_ALL); 
#endif /* USE_DMA_PAUSE_FEATURE */
  
  }
  else /* AUDIO_RESUME */
  {   
#ifdef USE_DMA_PAUSE_FEATURE
    /* Resume the I2S DMA Stream 
        Note. For the STM32F2xx devices, the DMA implements a pause feature, 
              by disabling the stream, all configuration is preserved and data 
              transfer is paused till the next enable of the stream.
              This feature is not available on STM32F1xx devices. */
    DMA_Cmd(AUDIO_MAL_DMA_STREAM, ENABLE);
    
#else
  /* Configure the buffer address and size */
  DMA_InitStructure.DMA_Memory0BaseAddr = (uint32_t)Addr;
  DMA_InitStructure.DMA_BufferSize = (uint32_t)(Size);

  /* Configure the DMA Stream with the new parameters */
  DMA_Init(AUDIO_MAL_DMA_STREAM, &DMA_InitStructure);
  
  /* Enable the I2S DMA Stream*/
  DMA_Cmd(AUDIO_MAL_DMA_STREAM, ENABLE);    
#endif /* USE_DMA_PAUSE_FEATURE */    
  
    /* If the I2S peripheral is still not enabled, enable it */
    if ((CODEC_I2S->I2SCFGR & I2S_ENABLE_MASK) == 0)
    {
      I2S_Cmd(CODEC_I2S, ENABLE);
    } 
  }  
}

/**
  * @brief  Stops audio stream playing on the used Media.
  * @param  None.
  * @retval None.
  */
void Audio_MAL_Stop(void)
{   
  /* Stop the Transfer on the I2S side: Stop and disable the DMA stream */
  DMA_Cmd(AUDIO_MAL_DMA_STREAM, DISABLE);

  /* Clear all the DMA flags for the next transfer */
  DMA_ClearFlag(AUDIO_MAL_DMA_STREAM, AUDIO_MAL_DMA_FLAG_TC |AUDIO_MAL_DMA_FLAG_HT | \
                                  AUDIO_MAL_DMA_FLAG_FE | AUDIO_MAL_DMA_FLAG_TE);
  
  /* Wait the DMA Stream to be effectively disabled */
  while (DMA_GetCmdStatus(AUDIO_MAL_DMA_STREAM) != DISABLE)
  {}

  /* Stop the current DMA request by resetting the I2S cell */
  Codec_AudioInterface_DeInit();
  
  /* Re-configure the I2S interface for the next paly operation */
  Codec_AudioInterface_Init(I2S_InitStructure.I2S_AudioFreq, ExternalClockVal);
}

/**
  * @brief  Returns the remaining data count to be processed by MAL layer.
  * @param  None.
  * @retval Number of processed data.
  */
uint32_t Audio_MAL_GetRemCount(void)
{
  /* Return the remaining number of data */
  return (uint32_t)(DMA_GetCurrDataCounter(AUDIO_MAL_DMA_STREAM));
}


/**
  * @brief  Initializes the SPIx peripheral according to the specified 
  *         parameters in the I2S_InitStruct. This is an alternative to the standard I2S_Init()
  *         function allowing dynamic modification of the external I2S clock source.
  * @param  SPIx: where x can be  2 or 3 to select the SPI peripheral (configured in I2S mode).
  * @param  I2S_InitStruct: pointer to an I2S_InitTypeDef structure that
  *         contains the configuration information for the specified SPI peripheral
  *         configured in I2S mode.
  * @param  I2sSrcClk: value of the I2S external source clock in Hz (ie. 12288000).
  * 
  * @note   The function calculates the optimal prescaler needed to obtain the most 
  *         accurate audio frequency (depending on the I2S clock source, the PLL values 
  *         and the product configuration). But in case the prescaler value is greater 
  *         than 511, the default value (0x02) will be configured instead.
  *  
  * @retval None
  */
void I2S_InitExt(SPI_TypeDef* SPIx, I2S_InitTypeDef* I2S_InitStruct, uint32_t I2sSrcClk)
{
  uint16_t tmpreg = 0, i2sdiv = 2, i2sodd = 0, packetlength = 1;
  uint32_t tmp = 0;
  
  /* Check the I2S parameters */
  assert_param(IS_SPI_23_PERIPH(SPIx));
  assert_param(IS_I2S_MODE(I2S_InitStruct->I2S_Mode));
  assert_param(IS_I2S_STANDARD(I2S_InitStruct->I2S_Standard));
  assert_param(IS_I2S_DATA_FORMAT(I2S_InitStruct->I2S_DataFormat));
  assert_param(IS_I2S_MCLK_OUTPUT(I2S_InitStruct->I2S_MCLKOutput));
  assert_param(IS_I2S_AUDIO_FREQ(I2S_InitStruct->I2S_AudioFreq));
  assert_param(IS_I2S_CPOL(I2S_InitStruct->I2S_CPOL));  

/*----------------------- SPIx I2SCFGR & I2SPR Configuration -----------------*/
  /* Clear I2SMOD, I2SE, I2SCFG, PCMSYNC, I2SSTD, CKPOL, DATLEN and CHLEN bits */
  SPIx->I2SCFGR &= ((uint16_t)0xF040); 
  SPIx->I2SPR = 0x0002;
  
  /* Get the I2SCFGR register value */
  tmpreg = SPIx->I2SCFGR;
  
  /* If the default value has to be written, reinitialize i2sdiv and i2sodd*/
  if(I2S_InitStruct->I2S_AudioFreq == I2S_AudioFreq_Default)
  {
    i2sodd = (uint16_t)0;
    i2sdiv = (uint16_t)2;   
  }
  /* If the requested audio frequency is not the default, compute the prescaler */
  else
  {
    /* Check the frame length (For the Prescaler computing) *******************/
    if(I2S_InitStruct->I2S_DataFormat == I2S_DataFormat_16b)
    {
      /* Packet length is 16 bits */
      packetlength = 1;
    }
    else
    {
      /* Packet length is 32 bits */
      packetlength = 2;
    }
    
    /* Compute the Real divider depending on the MCLK output state, with a floating point */
    if(I2S_InitStruct->I2S_MCLKOutput == I2S_MCLKOutput_Enable)
    {
      /* MCLK output is enabled */
      tmp = (uint16_t)(((((I2sSrcClk / 256) * 10) / I2S_InitStruct->I2S_AudioFreq)) + 5);
    }
    else
    {
      /* MCLK output is disabled */
      tmp = (uint16_t)(((((I2sSrcClk / (32 * packetlength)) *10 ) / I2S_InitStruct->I2S_AudioFreq)) + 5);
    }
    
    /* Remove the flatting point */
    tmp = tmp / 10;  
      
    /* Check the parity of the divider */
    i2sodd = (uint16_t)(tmp & (uint16_t)0x0001);
   
    /* Compute the i2sdiv prescaler */
    i2sdiv = (uint16_t)((tmp - i2sodd) / 2);
   
    /* Get the Mask for the Odd bit (SPI_I2SPR[8]) register */
    i2sodd = (uint16_t) (i2sodd << 8);
  }

  /* Test if the divider is 1 or 0 or greater than 0xFF */
  if ((i2sdiv < 2) || (i2sdiv > 0xFF))
  {
    /* Set the default values */
    i2sdiv = 2;
    i2sodd = 0;
  }

  /* Write to SPIx I2SPR register the computed value */
  SPIx->I2SPR = (uint16_t)((uint16_t)i2sdiv | (uint16_t)(i2sodd | (uint16_t)I2S_InitStruct->I2S_MCLKOutput));
 
  /* Configure the I2S with the SPI_InitStruct values */
  tmpreg |= (uint16_t)((uint16_t)SPI_I2SCFGR_I2SMOD | (uint16_t)(I2S_InitStruct->I2S_Mode | \
                  (uint16_t)(I2S_InitStruct->I2S_Standard | (uint16_t)(I2S_InitStruct->I2S_DataFormat | \
                  (uint16_t)I2S_InitStruct->I2S_CPOL))));
 
  /* Write to SPIx I2SCFGR */  
  SPIx->I2SCFGR = tmpreg;
}

/**
  * @}
  */ 


/**
  * @}
  */ 


/**
  * @}
  */ 
/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
