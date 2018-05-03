/******************************************************************************
* Copyright © 2014 by Pike Aerospace Research Corporation
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
#ifndef _CARIBOU_NOKIA_5110_H_
#define _CARIBOU_NOKIA_5110_H_

#include <caribou.h>

#ifdef __cplusplus
extern "C" {
#endif

#define PCD8544_NOP					(0x00)				// NOP

#define PCD8544_FSET				(0x20)				// Function Set
#define	PCD8544_FSET_PD				(PCD8544_FSET|0x04)	// Power Down
#define	PCD8544_FSET_V				(PCD8544_FSET|0x02)	// Vertical Addressing
#define	PCD8544_FSET_H				(PCD8544_FSET|0x01)	// Use High Instruction Set

/** H==0 */

#define	PCD8544_DISC				(0x08)				// Display Configuration
#define PCD8544_DISC_D				(PCD8544_DISC|0x04)
#define	PCD8544_DISC_E				(PCD8544_DISC|0x01)

#define	PCD8544_ADDR_Y				(0x40)				// Address Y
#define	PCD8544_ADDR_X				(0x80)				// Address X

/** H==1 */

#define	PCD8544_TC					(0x04)				// Temperature Coefficient
#define	PCD8544_TC0					(PCD8544_TC|0x01)
#define	PCD8544_TC1					(PCD8544_TC|0x02)

#define PCD8544_BS					(0x10)				// Bias System
#define	PCD8544_BS0					(PCD8544_BS|0x01)
#define	PCD8544_BS1					(PCD8544_BS|0x02)
#define	PCD8544_BS2					(PCD8544_BS|0x04)

#define PCD8544_VOP					(0x80)				// VOP
#define PCD8544_VOP0				(PCD8544_VOP|0x01)
#define PCD8544_VOP1				(PCD8544_VOP|0x02)
#define PCD8544_VOP2				(PCD8544_VOP|0x04)
#define PCD8544_VOP3				(PCD8544_VOP|0x08)
#define PCD8544_VOP4				(PCD8544_VOP|0x10)
#define PCD8544_VOP5				(PCD8544_VOP|0x20)
#define PCD8544_VOP6				(PCD8544_VOP|0x40)

#define NOKIA_5110_WIDTH_PX			(84)	/* Total width in pixels. */
#define	NOKIA_5110_ROWS_BANK		(8)		/* Rows per bank. */
#define	NOKIA_5110_BANKS			(6)		/* Number of segments */
#define NOKIA_5110_HEIGHT_PX		(NOKIA_5110_ROWS_BANK*NOKIA_5110_BANKS)
#define NOKIA_5110_SEGMENT_BYTES	((NOKIA_5110_ROWS_BANK*NOKIA_5110_WIDTH_PX)/8)
#define	NOKIA_5110_DISPLAY_BYTES	(NOKIA_5110_SEGMENT_BYTES*NOKIA_5110_BANKS)

void nokia_5110_init();
void nokia_5110_run(void* arg);
void nokia_5110_reset();
void nokia_5110_set_initial_state();

bool lcd_put_pixel(uint8_t x, uint8_t y, bool pixel);
bool lcd_get_pixel(uint8_t x, uint8_t y);
bool lcd_fill_test_pattern(uint8_t pattern);

#ifdef __cplusplus
}
#endif

#endif /* _CARIBOU_NOKIA_5110_H_ */
