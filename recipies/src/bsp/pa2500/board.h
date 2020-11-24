 
#ifndef _BOARD_H_
#define _BOARD_H_

#include <hw_defs.h>
#include <hw_clocks.h>
#include <hw_gpio.h>

#ifdef __cplusplus
extern "C"
{
#endif

#define SRAM_SPI				SPI1
#define RAM_CHIP_SIZE_BYTES		(1024*128)
#define RAM_SIZE_BYTES 			(RAM_CHIP_SIZE_BYTES*2)

#define ENC28J60_SPI           SPI1

extern char* board_get_hostname( void );

extern void early_init ( void );
extern void late_init  ( void );

#ifdef __cplusplus
}
#endif

#endif
