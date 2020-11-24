/******************************************************************************
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
#ifndef _CARIBOU_L3GD20_H_
#define _CARIBOU_L3GD20_H_

#include <board.h>

#if !defined(L3GD20_SPI)
	#define L3GD20_SPI		SPI1
#endif

#define	L3GD20_WHO_AM_I			(0x0F)
#define	L3GD20_CTRL_REG1		(0x20)
#define	L3GD20_CTRL_REG2		(0x21)
#define	L3GD20_CTRL_REG3		(0x22)
#define	L3GD20_CTRL_REG4		(0x23)
#define	L3GD20_CTRL_REG5		(0x24)
#define	L3GD20_REFERENCE		(0x25)
#define	L3GD20_OUT_TEMP			(0x26)
#define	L3GD20_STATUS_REG		(0x27)
#define	L3GD20_OUT_X_L			(0x28)
#define	L3GD20_OUT_X_H			(0x29)
#define	L3GD20_OUT_Y_L			(0x2A)
#define	L3GD20_OUT_Y_H			(0x2B)
#define	L3GD20_OUT_Z_L			(0x2C)
#define	L3GD20_OUT_Z_H			(0x2D)
#define	L3GD20_FIFO_CTL_REG		(0x2E)
#define	L3GD20_FIFO_SRC_REG		(0x2F)
#define	L3GD20_INT1_CFG			(0x30)
#define	L3GD20_INT1_SRC			(0x31)
#define	L3GD20_INT1_THS_XH		(0x32)
#define	L3GD20_INT1_THS_XL		(0x33)
#define	L3GD20_INT1_THS_YH		(0x34)
#define	L3GD20_INT1_THS_YL		(0x35)
#define	L3GD20_INT1_THS_ZH		(0x36)
#define	L3GD20_INT1_THS_ZL		(0x37)
#define	L3GD20_INT1_DURATION	(0x38)

/** L3GD20_CTRL_REG1 bit definitions */
#define	L3GD20_CTRL_YEN			(1<<0)
#define	L3GD20_CTRL_XEN			(1<<1)
#define	L3GD20_CTRL_ZEN			(1<<2)
#define	L3GD20_CTRL_PD			(1<<3)
#define	L3GD20_CTRL_BW0			(1<<4)
#define	L3GD20_CTRL_BW1			(1<<5)
#define	L3GD20_CTRL_DR0			(1<<6)
#define	L3GD20_CTRL_DR1			(1<<7)

/** L3GD20_CTRL_REG2 bit definitions */
#define	L3GD20_CTRL_HPCF0		(1<<0)
#define	L3GD20_CTRL_HPCF1		(1<<1)
#define	L3GD20_CTRL_HPCF2		(1<<2)
#define	L3GD20_CTRL_HPCF3		(1<<3)
#define	L3GD20_CTRL_HPM0		(1<<4)
#define	L3GD20_CTRL_HPM1		(1<<5)

/** L3GD20_CTRL_REG3 bit definitions */
#define	L3GD20_CTRL_I2_EMPTY	(1<<0)
#define	L3GD20_CTRL_I2_ORUN		(1<<1)
#define	L3GD20_CTRL_I2_WTM		(1<<2)
#define	L3GD20_CTRL_I2_DRDY		(1<<3)
#define	L3GD20_CTRL_PP_OD		(1<<4)
#define	L3GD20_CTRL_H_L_ACTIVE	(1<<5)
#define	L3GD20_CTRL_I1_BOOT		(1<<6)
#define	L3GD20_CTRL_I1_INT1		(1<<7)

/** L3GD20_CTRL_REG4 bit definitions */
#define	L3GD20_CTRL_SIM			(1<<0)
#define	L3GD20_CTRL_FS0			(1<<4)
#define	L3GD20_CTRL_FS1			(1<<5)
#define	L3GD20_CTRL_BLE			(1<<6)
#define	L3GD20_CTRL_BDU			(1<<7)

/** L3GD20_CTRL_REG5 bit definitions */
#define	L3GD20_CTRL_OUT_SEL0	(1<<0)
#define	L3GD20_CTRL_OUT_SEL1	(1<<1)
#define	L3GD20_CTRL_INT1_SEL0	(1<<2)
#define	L3GD20_CTRL_INT1_SEL1	(1<<3)
#define	L3GD20_CTRL_HPEN		(1<<4)
#define	L3GD20_CTRL_FIFO_EN		(1<<6)
#define	L3GD20_CTRL_BOOT		(1<<7)

/** L3GD20_REFERENCE bit definitions */
#define	L3GD20_REFERENCE_REF0	(1<<0)
#define	L3GD20_REFERENCE_REF1	(1<<1)
#define	L3GD20_REFERENCE_REF2	(1<<2)
#define	L3GD20_REFERENCE_REF3	(1<<3)
#define	L3GD20_REFERENCE_REF4	(1<<4)
#define	L3GD20_REFERENCE_REF5	(1<<5)
#define	L3GD20_REFERENCE_REF6	(1<<6)
#define	L3GD20_REFERENCE_REF7	(1<<7)

/** L3GD20_OUT_TEMP bit definitions */
#define	L3GD20_REFERENCE_TEMP0	(1<<0)
#define	L3GD20_REFERENCE_TEMP1	(1<<1)
#define	L3GD20_REFERENCE_TEMP2	(1<<2)
#define	L3GD20_REFERENCE_TEMP3	(1<<3)
#define	L3GD20_REFERENCE_TEMP4	(1<<4)
#define	L3GD20_REFERENCE_TEMP5	(1<<5)
#define	L3GD20_REFERENCE_TEMP6	(1<<6)
#define	L3GD20_REFERENCE_TEMP7	(1<<7)

/** L3GD20_STATUS_REG bit definitions */
#define	L3GD20_STATUS_XDA		(1<<0)
#define	L3GD20_STATUS_YDA		(1<<1)
#define	L3GD20_STATUS_ZDA		(1<<2)
#define	L3GD20_STATUS_ZXYDA		(1<<3)
#define	L3GD20_STATUS_XOR		(1<<4)
#define	L3GD20_STATUS_YOR		(1<<5)
#define	L3GD20_STATUS_ZOR		(1<<6)
#define	L3GD20_STATUS_ZYXOR		(1<<7)

#ifdef __cplusplus
extern "C" {
#endif

typedef struct
{
	SPI_TypeDef*	SPIx;	/* SPI Device */
	caribou_gpio_t*	CS;		/* SPI Chip Select GPIO */
} L3GD20_t;

extern void L3GD20Init( L3GD20_t* io );
extern uint8_t L3GD20WhoAmI( L3GD20_t* io );
extern void L3GD20ReadGyro( L3GD20_t* io, uint16_t* x, uint16_t* y, uint16_t* z );

#ifdef __cplusplus
}
#endif

#endif /* _CARIBOU_L3GD20_H_ */