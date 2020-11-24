///////////////////////////////////////////////////////////////////////////////
//         Copyright (C) 2014 Pike Aerospace Research Corporation            //
///////////////////////////////////////////////////////////////////////////////
#ifndef __I2CIO_H_
#define __I2CIO_H_
#include <board.h>

#ifdef __cplusplus
extern "C"
{
#endif

typedef struct
{

	GPIO_TypeDef *	scl_port;
	uint16_t		scl_pin;

	GPIO_TypeDef *	sda_port;
	uint16_t		sda_pin;

	uint16_t		delay;

	uint8_t			chip_id;

} hi2c_t;

#define I2C_ACK 	false
#define I2C_NO_ACK	true


extern void		i2c_setup 		( 
								  hi2c_t* 		hi2c, 
								  GPIO_TypeDef* scl_port, 
								  uint16_t 		scl_pin, 
								  GPIO_TypeDef* sda_port, 
								  uint16_t 		sda_pin,
								  uint16_t 		delay,
								  uint8_t		chip_id
								);

extern void 	i2c_start_cond 	( hi2c_t* hi2c );
extern void 	i2c_stop_cond 	( hi2c_t* hi2c );
extern bool 	i2c_write_byte 	( hi2c_t* hi2c, uint8_t byte ); 
extern uint8_t 	i2c_read_byte 	( hi2c_t* hi2c, bool nack );

#ifdef __cplusplus
}
#endif

#endif /* __I2CIO_H_ */
