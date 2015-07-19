/**
 * @file lis302dl.h
 * @brief LIS302DL accelerometer
 *
 * @section License
 *
 * Copyright (C) 2010-2014 Oryx Embedded. All rights reserved.
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 *
 * @author Oryx Embedded (www.oryx-embedded.com)
 * @version 1.4.2
 **/

#ifndef _LIS302DL_H
#define _LIS302DL_H

//Dependencies
#include "os_port.h"
#include "error.h"

//LIS302DL I2C slave address
#define LIS302DL_ADDR 0x38
//LIS302DL device identifier
#define LIS302DL_DEVICE_ID 0x3B

//LIS302DL registers
#define LIS302DL_REG_WHO_AM_I          0x0F
#define LIS302DL_REG_CTRL1             0x20
#define LIS302DL_REG_CTRL2             0x21
#define LIS302DL_REG_CTRL3             0x22
#define LIS302DL_REG_HP_FILTER_RESET   0x23
#define LIS302DL_REG_STATUS            0x27
#define LIS302DL_REG_OUT_X             0x29
#define LIS302DL_REG_OUT_Y             0x2B
#define LIS302DL_REG_OUT_Z             0x2D
#define LIS302DL_REG_FF_WU_CFG1        0x30
#define LIS302DL_REG_FF_WU_SRC1        0x31
#define LIS302DL_REG_FF_WU_THS1        0x32
#define LIS302DL_REG_FF_WU_DURATION1   0x33
#define LIS302DL_REG_FF_WU_CFG2        0x34
#define LIS302DL_REG_FF_WU_SRC2        0x35
#define LIS302DL_REG_FF_WU_THS2        0x36
#define LIS302DL_REG_FF_WU_DURATION2   0x37
#define LIS302DL_REG_CLICK_CFG         0x38
#define LIS302DL_REG_CLICK_SRC         0x39
#define LIS302DL_REG_CLICK_THS_Y_X     0x3B
#define LIS302DL_REG_CLICK_THS_Z       0x3C
#define LIS302DL_REG_CLICK_TIME_LIMIT  0x3D
#define LIS302DL_REG_CLICK_LATENCY     0x3E
#define LIS302DL_REG_CLICK_WINDOW      0x3F

//CTRL1 register
#define LIS302DL_CTRL1_DR              0x80
#define LIS302DL_CTRL1_PD              0x40
#define LIS302DL_CTRL1_FS              0x20
#define LIS302DL_CTRL1_STP             0x10
#define LIS302DL_CTRL1_STM             0x08
#define LIS302DL_CTRL1_ZEN             0x04
#define LIS302DL_CTRL1_YEN             0x02
#define LIS302DL_CTRL1_XEN             0x01

//CTRL2 register
#define LIS302DL_CTRL2_SIM             0x80
#define LIS302DL_CTRL2_BOOT            0x40
#define LIS302DL_CTRL2_FDS             0x10
#define LIS302DL_CTRL2_HP_FF_WU2       0x08
#define LIS302DL_CTRL2_HP_FF_WU1       0x04
#define LIS302DL_CTRL2_HP_COEFF2       0x02
#define LIS302DL_CTRL2_HP_COEFF1       0x01

//CTRL3 register
#define LIS302DL_CTRL3_IHL             0x80
#define LIS302DL_CTRL3_PP_OD           0x40
#define LIS302DL_CTRL3_I2CFG2          0x20
#define LIS302DL_CTRL3_I2CFG1          0x10
#define LIS302DL_CTRL3_I2CFG0          0x08
#define LIS302DL_CTRL3_I1CFG2          0x04
#define LIS302DL_CTRL3_I1CFG1          0x02
#define LIS302DL_CTRL3_I1CFG0          0x01

//STATUS register
#define LIS302DL_STATUS_ZYXOR          0x80
#define LIS302DL_STATUS_ZOR            0x40
#define LIS302DL_STATUS_YOR            0x20
#define LIS302DL_STATUS_XOR            0x10
#define LIS302DL_STATUS_ZYXDA          0x08
#define LIS302DL_STATUS_ZDA            0x04
#define LIS302DL_STATUS_YDA            0x02
#define LIS302DL_STATUS_XDA            0x01

//FF_WU_CFG1 register
#define LIS302DL_FF_WU_CFG1_AOI        0x80
#define LIS302DL_FF_WU_CFG1_LIR        0x40
#define LIS302DL_FF_WU_CFG1_ZHIE       0x20
#define LIS302DL_FF_WU_CFG1_ZLIE       0x10
#define LIS302DL_FF_WU_CFG1_YHIE       0x08
#define LIS302DL_FF_WU_CFG1_YLIE       0x04
#define LIS302DL_FF_WU_CFG1_XHIE       0x02
#define LIS302DL_FF_WU_CFG1_XLIE       0x01

//FF_WU_SRC1 register
#define LIS302DL_FF_WU_SRC1_IA         0x40
#define LIS302DL_FF_WU_SRC1_ZH         0x20
#define LIS302DL_FF_WU_SRC1_ZL         0x10
#define LIS302DL_FF_WU_SRC1_YH         0x08
#define LIS302DL_FF_WU_SRC1_YL         0x04
#define LIS302DL_FF_WU_SRC1_XH         0x02
#define LIS302DL_FF_WU_SRC1_XL         0x01

//FF_WU_THS1 register
#define LIS302DL_FF_WU_THS1_DCRM       0x80
#define LIS302DL_FF_WU_THS1_THS        0x7F

//FF_WU_CFG2 register
#define LIS302DL_FF_WU_CFG2_AOI        0x80
#define LIS302DL_FF_WU_CFG2_LIR        0x40
#define LIS302DL_FF_WU_CFG2_ZHIE       0x20
#define LIS302DL_FF_WU_CFG2_ZLIE       0x10
#define LIS302DL_FF_WU_CFG2_YHIE       0x08
#define LIS302DL_FF_WU_CFG2_YLIE       0x04
#define LIS302DL_FF_WU_CFG2_XHIE       0x02
#define LIS302DL_FF_WU_CFG2_XLIE       0x01

//FF_WU_SRC2 register
#define LIS302DL_FF_WU_SRC2_IA         0x40
#define LIS302DL_FF_WU_SRC2_ZH         0x20
#define LIS302DL_FF_WU_SRC2_ZL         0x10
#define LIS302DL_FF_WU_SRC2_YH         0x08
#define LIS302DL_FF_WU_SRC2_YL         0x04
#define LIS302DL_FF_WU_SRC2_XH         0x02
#define LIS302DL_FF_WU_SRC2_XL         0x01

//FF_WU_THS2 register
#define LIS302DL_FF_WU_THS2_DCRM       0x80
#define LIS302DL_FF_WU_THS2_THS        0x7F

//CLICK_CFG register
#define LIS302DL_CLICK_CFG_LIR         0x40
#define LIS302DL_CLICK_CFG_DOUBLE_Z    0x20
#define LIS302DL_CLICK_CFG_SINGLE_Z    0x10
#define LIS302DL_CLICK_CFG_DOUBLE_Y    0x08
#define LIS302DL_CLICK_CFG_SINGLE_Y    0x04
#define LIS302DL_CLICK_CFG_DOUBLE_X    0x02
#define LIS302DL_CLICK_CFG_SINGLE_X    0x01

//CLICK_SRC register
#define LIS302DL_CLICK_SRC_IA          0x40
#define LIS302DL_CLICK_SRC_DOUBLE_Z    0x20
#define LIS302DL_CLICK_SRC_SINGLE_Z    0x10
#define LIS302DL_CLICK_SRC_DOUBLE_Y    0x08
#define LIS302DL_CLICK_SRC_SINGLE_Y    0x04
#define LIS302DL_CLICK_SRC_DOUBLE_X    0x02
#define LIS302DL_CLICK_SRC_SINGLE_X    0x01

//LIS302DL related functions
error_t lis302dlInit(void);
error_t lis302dlGetAcc(int8_t *ax, int8_t *ay, int8_t *az);
error_t lis302dlWriteReg(uint8_t address, uint8_t data);
error_t lis302dlReadReg(uint8_t address, uint8_t *data);

#endif
