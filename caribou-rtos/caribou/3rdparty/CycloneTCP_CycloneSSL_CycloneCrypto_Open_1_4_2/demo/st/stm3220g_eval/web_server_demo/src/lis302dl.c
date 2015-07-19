/**
 * @file lis302dl.c
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

//Dependencies
#include "lis302dl.h"
#include "debug.h"

#if defined(USE_STM322xG_EVAL)
   #include "stm322xg_eval_ioe.h"
#elif defined(USE_STM324xG_EVAL)
   #include "stm324xg_eval_ioe.h"
#endif


/**
 * @brief LIS302DL initialization
 * @return Error code
 **/

error_t lis302dlInit(void)
{
   error_t error;
   uint8_t value;

   //Debug message
   TRACE_INFO("Initializing LIS302DL accelerometer...\r\n");

   //Read device identification register
   error = lis302dlReadReg(LIS302DL_REG_WHO_AM_I, &value);
   //Any error to report?
   if(error) return error;

   //Check device identifier
   if(value != LIS302DL_DEVICE_ID)
      return ERROR_WRONG_IDENTIFIER;

   //Power up LIS302DL
   error = lis302dlWriteReg(LIS302DL_REG_CTRL1, LIS302DL_CTRL1_PD |
      LIS302DL_CTRL1_ZEN | LIS302DL_CTRL1_YEN | LIS302DL_CTRL1_XEN);
   //Any error to report?
   if(error) return error;

   //Successful initialization
   return NO_ERROR;
}


/**
 * @brief Get acceleration data
 * @param[out] ax Acceleration value (X axis)
 * @param[out] ay Acceleration value (Y axis)
 * @param[out] az Acceleration value (Z axis)
 * @param[in] data Register value
 * @return Error code
 **/

error_t lis302dlGetAcc(int8_t *ax, int8_t *ay, int8_t *az)
{
   error_t error;

   //Retrieve acceleration along the X axis
   error = lis302dlReadReg(LIS302DL_REG_OUT_X, (uint8_t *) ax);

   //Retrieve acceleration along the Y axis
   if(!error)
      error = lis302dlReadReg(LIS302DL_REG_OUT_Y, (uint8_t *) ay);

   //Retrieve acceleration along the Z axis
   if(!error)
      error = lis302dlReadReg(LIS302DL_REG_OUT_Z, (uint8_t *) az);

   //Return status code
   return error;
}


/**
 * @brief Write LIS302DL register
 * @param[in] address Register address
 * @param[in] data Register value
 * @return Error code
 **/

error_t lis302dlWriteReg(uint8_t address, uint8_t data)
{
   uint_t ret;

   //Write specified register
   ret = I2C_WriteDeviceRegister(LIS302DL_ADDR, address, data);

   //Return status code
   return (ret == IOE_OK) ? NO_ERROR : ERROR_FAILURE;
}


/**
 * @brief Read LIS302DL register
 * @param[in] address Register address
 * @param[out] data Register value
 * @return Error code
 **/

error_t lis302dlReadReg(uint8_t address, uint8_t *data)
{
   //Read register contents
   *data = I2C_ReadDeviceRegister(LIS302DL_ADDR, address);

   //Successful read operation
   return NO_ERROR;
}
