///////////////////////////////////////////////////////////////////////////////
//         Copyright (C) 2014 Pike Aerospace Research Corporation            //
///////////////////////////////////////////////////////////////////////////////
#include <i2cio.h>

#define	SCL_H(hi2c)		(hi2c->scl_port->BSRR = hi2c->scl_pin)
#define SCL_L(hi2c)		(hi2c->scl_port->BRR  = hi2c->scl_pin)
   
#define SDA_H(hi2c)		(hi2c->sda_port->BSRR = hi2c->sda_pin)
#define	SDA_L(hi2c)		(hi2c->sda_port->BRR  = hi2c->sda_pin)

static bool started = false;

static void I2C_delay( hi2c_t* hi2c );

/**
 * Set SCL as input and return current level of line, 0 or 1
 */
static bool read_SCL( hi2c_t* hi2c )
{
	SCL_H(hi2c); // release the SCL line.
	return (hi2c->scl_port->IDR  & hi2c->scl_pin) ? true : false;
}

/** 
 * Set SDA as input and return current level of line, 0 or 1
 */
static bool read_SDA( hi2c_t* hi2c )
{
	SDA_H(hi2c); // release the SDA line.
	return (hi2c->sda_port->IDR  & hi2c->sda_pin) ? true : false;
}

void arbitration_lost( hi2c_t* hi2c )
{
	/* FIXME */
}


// Write a bit to I2C bus
static void i2c_write_bit( hi2c_t* hi2c, bool bit ) 
{
	if( bit ) 
		SDA_H(hi2c);
	else 
		SDA_L(hi2c);

	I2C_delay(hi2c);

	while( read_SCL(hi2c) == 0 ) 
	{ 
		// Clock stretching
		// You should add timeout to this loop
	}

	// SCL is high, now data is valid
	// If SDA is high, check that nobody else is driving SDA
	if( bit && ( read_SDA(hi2c) == 0 ) )
		arbitration_lost(hi2c);

	I2C_delay(hi2c);
	SCL_L(hi2c);
}

// Read a bit from I2C bus
static bool i2c_read_bit( hi2c_t* hi2c ) 
{
	bool bit;

	// Let the slave drive data
	read_SDA(hi2c);
	I2C_delay(hi2c);

	while( read_SCL(hi2c) == 0 ) 
	{ 
		// Clock stretching
		// You should add timeout to this loop
	}

	// SCL is high, now data is valid
	bit = read_SDA(hi2c);
	I2C_delay(hi2c);
	SCL_L(hi2c);

	return bit;
}

void I2C_delay( hi2c_t* hi2c ) 
{
	static volatile int v;
	for( v = 0; v < hi2c->delay; v++ );
}

/*************** PUBLIC ********************/

extern void i2c_setup( hi2c_t* hi2c, GPIO_TypeDef* scl_port, uint16_t scl_pin, GPIO_TypeDef* sda_port, uint16_t sda_pin, uint16_t delay, uint8_t chip_id )
{
	hi2c->scl_port = scl_port;
	hi2c->scl_pin  = scl_pin;
	hi2c->sda_port = sda_port;
	hi2c->sda_pin  = sda_pin;
	hi2c->delay = delay;
	hi2c->chip_id = chip_id;
}

extern void i2c_start_cond( hi2c_t* hi2c ) 
{
	if( started ) 
	{ 
	// if started, do a restart cond
	// set SDA to 1
	read_SDA(hi2c);
	I2C_delay(hi2c);

	while( read_SCL(hi2c) == 0 ) 
	{  
		// Clock stretching
		// You should add timeout to this loop
	}

	// Repeated start setup time, minimum 4.7us
	I2C_delay(hi2c);

	}

	if( read_SDA(hi2c) == 0 ) 
	{
		arbitration_lost(hi2c);
	}

	// SCL is high, set SDA from 1 to 0.
	SDA_L(hi2c);
	I2C_delay(hi2c);
	SCL_L(hi2c);
	started = true;

}

extern void i2c_stop_cond( hi2c_t* hi2c )
{
	// set SDA to 0
	SDA_L(hi2c);
	I2C_delay(hi2c);

	// Clock stretching
	while( read_SCL(hi2c) == 0 ) 
	{
		// add timeout to this loop.
	}

	// Stop bit setup time, minimum 4us
	I2C_delay(hi2c);

	// SCL is high, set SDA from 0 to 1
	SDA_H(hi2c);
	I2C_delay(hi2c);

	if( read_SDA(hi2c) == 0 ) 
	{
		arbitration_lost(hi2c);
	}

	I2C_delay(hi2c);
	started = false;
}

// Write a byte to I2C bus. Return 0 if ack by the slave.
extern bool i2c_write_byte( hi2c_t* hi2c, uint8_t byte ) 
{
	unsigned bit;
	bool     nack;

	for( bit = 0; bit < 8; bit++ ) 
	{
		i2c_write_bit( hi2c, ( byte & 0x80 ) != 0 );
		byte <<= 1;
	}

	nack = i2c_read_bit(hi2c);

	return nack;
}

// Read a byte from I2C bus
extern uint8_t i2c_read_byte( hi2c_t* hi2c, bool nack ) 
{
	uint8_t byte = 0;
	uint8_t bit;

	for( bit = 0; bit < 8; bit++ ) 
	{
		byte = ( byte << 1 ) | i2c_read_bit(hi2c);
	}

	i2c_write_bit( hi2c, nack );

	return byte;
}

