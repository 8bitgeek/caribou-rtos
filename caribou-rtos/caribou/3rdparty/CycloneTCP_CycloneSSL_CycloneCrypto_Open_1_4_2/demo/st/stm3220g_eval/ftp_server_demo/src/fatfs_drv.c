/**
  ******************************************************************************
  * @file    fatfs_drv.c
  * @author  MCD Application Team
  * @version V1.3.0
  * @date    14-January-2013
  * @brief   This file contains FATFS file system functions
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; COPYRIGHT 2013 STMicroelectronics</center></h2>
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
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "stm32f2xx.h"
#include "stm322xg_eval_sdio_sd.h"
#include "ff.h"
#include "diskio.h"
#include "freertos.h"

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
#define USE_FS_RTC                 1
#define BLOCK_SIZE                 512 /* Block Size in Bytes */
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
static volatile DSTATUS Stat = STA_NOINIT;	/* Disk status */

/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/


/**
  * @brief  Initialize Disk Drive
  * @param  drv : driver index
  * @retval DSTATUS : operation status
  */
DSTATUS disk_initialize ( BYTE drv )
{
   NVIC_InitTypeDef NVIC_InitStructure;
   Stat = STA_NOINIT;

   NVIC_InitStructure.NVIC_IRQChannel = SDIO_IRQn;
   NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 0;
   NVIC_InitStructure.NVIC_IRQChannelSubPriority = 0;
   NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
   NVIC_Init(&NVIC_InitStructure);
   NVIC_InitStructure.NVIC_IRQChannel = SD_SDIO_DMA_IRQn;
   NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 1;
   NVIC_Init(&NVIC_InitStructure);

   if(SD_Init() == 0)
   {
      Stat &= ~STA_NOINIT;
   }

   return Stat;
}

/**
   * @brief  Get Disk Status
   * @param  drv : driver index
   * @retval DSTATUS : operation status
  */
DSTATUS disk_status ( BYTE drv)
{
   Stat = STA_NOINIT;

   if (SD_Detect() != SD_PRESENT)
   {
      Stat |= STA_NODISK;
   }

   if(SD_GetStatus() == 0)
   {
      Stat &= ~STA_NOINIT;
   }

   return Stat;
}

/**
  * @brief  Read Sector(s)
  * @param  drv : driver index
  * @param  buff : Pointer to the data buffer to store read data
  * @param  sector : Start sector number
  * param   count : Sector count (1..255)
  * @retval DSTATUS : operation status
  */
DRESULT disk_read (
                   BYTE drv,			/* Physical drive number (0) */
                   BYTE *buff,			/* Pointer to the data buffer to store read data */
                   DWORD sector,		/* Start sector number (LBA) */
                   UINT count			/* Sector count (1..255) */
                     )
{
   uint32_t timeout  = 100000;
   SD_Error sdstatus = SD_OK;
   DWORD  scratch [BLOCK_SIZE / 4] ;  // Alignment ensured, need enough stack

   portENTER_CRITICAL();

   if (SD_Detect() != SD_PRESENT)
   {
    portEXIT_CRITICAL();
    return(RES_NOTRDY);
   }

   if ((DWORD)buff & 3) // DMA Alignment issue, do single up to aligned buffer
   {
    while (count--)
    {
      SD_ReadBlock((BYTE *)scratch, (uint32_t )((sector + count) * BLOCK_SIZE) ,BLOCK_SIZE);
      /* Check if the Transfer is finished */
      sdstatus = SD_WaitReadOperation();

      while(SD_GetStatus() != SD_TRANSFER_OK)
      {

        if (timeout-- == 0)
        {
          portEXIT_CRITICAL();
          return RES_ERROR;
        }
      }
      memcpy (&buff[count * BLOCK_SIZE] ,scratch, BLOCK_SIZE);
    }
   }
   else
   {
    SD_ReadMultiBlocks((BYTE *)buff, (uint32_t )(sector * BLOCK_SIZE), BLOCK_SIZE, count);

    /* Check if the Transfer is finished */
    sdstatus = SD_WaitReadOperation();

    while(SD_GetStatus() != SD_TRANSFER_OK)
    {

      if (timeout-- == 0)
      {
        portEXIT_CRITICAL();
        return RES_ERROR;
      }
    }
   }
   if (sdstatus == SD_OK)
   {
    portEXIT_CRITICAL();
    return RES_OK;
   }
   portEXIT_CRITICAL();

   return RES_NOTRDY;
}
/**
  * @brief  write Sector(s)
  * @param  drv : driver index
  * @param  buff : Pointer to the data to be written
  * @param  sector : Start sector number
  * @param  count :  Sector count (1..255)
  * @retval DSTATUS : operation status
  */

#if _READONLY == 0
DRESULT disk_write (
                    BYTE drv,			/* Physical drive number (0) */
                    const BYTE *buff,	/* Pointer to the data to be written */
                    DWORD sector,		/* Start sector number (LBA) */
                    UINT count			/* Sector count (1..255) */
                      )
{
   SD_Error sdstatus = SD_OK;
   uint32_t timeout = 1000000;
   DWORD  scratch [BLOCK_SIZE / 4] ; // Alignment ensured, need enough stack

   portENTER_CRITICAL();

   if (SD_Detect() != SD_PRESENT)
   {
     portEXIT_CRITICAL();
     return(RES_NOTRDY);
   }

   if ((DWORD)buff & 3) // DMA Alignment issue, do single up to aligned buffer
   {
     while (count--)
     {
       memcpy (scratch, &buff[count * BLOCK_SIZE], BLOCK_SIZE);

       SD_WriteBlock((BYTE *)scratch, (uint32_t )((sector + count) * BLOCK_SIZE), BLOCK_SIZE);

       /* Check if the Transfer is finished */
       sdstatus = SD_WaitWriteOperation();

       while(SD_GetStatus() != SD_TRANSFER_OK)
       {
         if (timeout-- == 0)
         {
           portEXIT_CRITICAL();
           return RES_ERROR;
         }
       }
     }
   }
   else
   {
     SD_WriteMultiBlocks((BYTE *)buff, (uint32_t )(sector * BLOCK_SIZE), BLOCK_SIZE, count);
     /* Check if the Transfer is finished */
     sdstatus = SD_WaitWriteOperation();
     while(SD_GetStatus() != SD_TRANSFER_OK)
     {
       if (timeout-- == 0)
       {
         portEXIT_CRITICAL();
         return RES_ERROR;
       }
     }
   }
   if (sdstatus == SD_OK)
   {
     portEXIT_CRITICAL();
     return RES_OK;
   }
   portEXIT_CRITICAL();

   return RES_NOTRDY;
}
#endif /* _READONLY == 0 */


/**
  * @brief  I/O control operation
  * @param  drv : driver index
  * @param  ctrl : ontrol code
  * @param  buff : Buffer to send/receive control data
  * @retval DSTATUS : operation status
  */


#if _USE_IOCTL != 0
DRESULT disk_ioctl (
                    BYTE drv,/* Physical drive number (0) */
                    BYTE ctrl,/* Control code */
                    void *buff/* Buffer to send/receive control data */
                      )
{
  DRESULT res;
  SD_CardInfo SDCardInfo;

  if (drv >= _VOLUMES) return RES_PARERR;

  res = RES_ERROR;

  if (Stat & STA_NOINIT) return RES_NOTRDY;

  switch (ctrl) {
  case CTRL_SYNC :		/* Make sure that no pending write process */
    res = RES_OK;
    break;

  case GET_SECTOR_COUNT :	/* Get number of sectors on the disk (DWORD) */
    SD_GetCardInfo(&SDCardInfo);
    *(DWORD*)buff = SDCardInfo.CardCapacity / BLOCK_SIZE;

    res = RES_OK;
    break;

  case GET_SECTOR_SIZE :	/* Get R/W sector size (WORD) */
    *(WORD*)buff = BLOCK_SIZE;
    res = RES_OK;
    break;

  case GET_BLOCK_SIZE :	/* Get erase block size in unit of sector (DWORD) */
    if(drv == 0)
    {
      *(DWORD*)buff = BLOCK_SIZE;
    }
    else
    {
      *(DWORD*)buff = 32;
    }


    break;


  default:
    res = RES_PARERR;
  }



  return res;
}
#endif /* _USE_IOCTL != 0 */
/**
  * @brief  Get Time from RTC
  * @param  None
  * @retval Time in DWORD
  */

DWORD get_fattime (void)
{
  DWORD time = 0;
#ifdef USE_FS_RTC
  RTC_TimeTypeDef   RTC_TimeStructure;
  RTC_DateTypeDef   RTC_DateStructure;

  BYTE rtcYear , rtcMon , rtcMday, rtcHour, rtcMin, rtcSec;

  /* Get info from RTC here */
  RTC_GetTime(RTC_Format_BIN, &RTC_TimeStructure);

  rtcSec    =  RTC_TimeStructure.RTC_Seconds;
  rtcMin    =  RTC_TimeStructure.RTC_Minutes;
  rtcHour   =  RTC_TimeStructure.RTC_Hours;

  RTC_GetDate(RTC_Format_BIN, &RTC_DateStructure);

  rtcYear =  RTC_DateStructure.RTC_Year;
  rtcMon =  RTC_DateStructure.RTC_Month;
  rtcMday =  RTC_DateStructure.RTC_Date;

  /* Pack date and time into a DWORD variable */
  time =	  (((DWORD)rtcYear) << 25)
                 | ((DWORD)rtcMon << 21)
                 | ((DWORD)rtcMday << 16)
                 | (WORD)(rtcHour << 11)
                 | (WORD)(rtcMin << 5)
                 | (WORD)(rtcSec >> 1);
#endif
  return time;
}

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
