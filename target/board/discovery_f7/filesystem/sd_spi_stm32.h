/******************************************************************************
* Copyright © 2015 Accutron Instruments Inc.
* All Rights Reserved
******************************************************************************/
#ifndef SD_SPI_STM32_H
#define SD_SPI_STM32_H

#include <stm32f7xx.h>
#include <ffconf.h>
#include <diskio.h>

#ifdef __cplusplus
extern "C" {
#endif

extern DSTATUS disk_initialize(BYTE drv);	/* Physical drive number (0) */

extern DSTATUS disk_status(BYTE drv);		/* Physical drive number (0) */

extern DRESULT disk_read (
	BYTE drv,			/* Physical drive number (0) */
	BYTE *buff,			/* Pointer to the data buffer to store read data */
	DWORD sector,		/* Start sector number (LBA) */
	UINT count			/* Sector count (1..255) */
);

extern DRESULT disk_write (
	BYTE drv,			/* Physical drive number (0) */
	const BYTE *buff,	/* Pointer to the data to be written */
	DWORD sector,		/* Start sector number (LBA) */
	UINT count			/* Sector count (1..255) */
);

extern DRESULT disk_ioctl (
	BYTE drv,		/* Physical drive number (0) */
	BYTE ctrl,		/* Control code */
	void *buff		/* Buffer to send/receive control data */
);

extern void disk_timerproc(void);

#ifdef __cplusplus
}
#endif

#endif /* SD_SPI_STM32_H */
