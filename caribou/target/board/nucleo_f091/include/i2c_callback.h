///////////////////////////////////////////////////////////////////////////////
//         Copyright (C) 2014 Pike Aerospace Research Corporation            //
///////////////////////////////////////////////////////////////////////////////
#ifndef __I2C_CALLBACK_H_
#define __I2C_CALLBACK_H_
#include <board.h>

extern int32_t i2c_callback_write( void *handle, uint8_t reg, uint8_t* data, uint16_t len );
extern int32_t i2c_callback_read ( void *handle, uint8_t reg, uint8_t* data, uint16_t len );

#endif /* __I2C_CALLBACK_H_ */
