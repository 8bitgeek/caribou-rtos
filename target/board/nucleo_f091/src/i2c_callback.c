#include <i2c_callback.h>
#include <i2cio.h>

extern int32_t i2c_callback_write( void *handle, uint8_t reg, uint8_t* data, uint16_t len )
{
	hi2c_t* hi2c = (hi2c_t*)handle;
	uint32_t rc=0;
	
	reg |= 0x80;	/* enable multi-register increment */

	i2c_start_cond( hi2c );
	
	rc |= i2c_write_byte (hi2c,hi2c->chip_id);
	rc |= i2c_write_byte (hi2c,reg);
	
	for( uint16_t count=0; count < len; count++ )
	{
		rc |= i2c_write_byte( hi2c, data[count] );
	}
	i2c_stop_cond( hi2c );
	
	return rc;
}

extern int32_t i2c_callback_read ( void *handle, uint8_t reg, uint8_t* data, uint16_t len )
{
	hi2c_t* hi2c = (hi2c_t*)handle;
	uint32_t rc=0;

	reg |= 0x80;	/* enable multi-register increment */

	i2c_start_cond( hi2c );
	
	rc |= i2c_write_byte (hi2c,hi2c->chip_id);
	rc |= i2c_write_byte (hi2c,reg);
	
	i2c_start_cond( hi2c );
	
	rc |= i2c_write_byte (hi2c,hi2c->chip_id|0x01);
	
	for( uint16_t count=0; count < len; count++ )
	{
		data[count] = i2c_read_byte( hi2c, (count==(len-1)) ? I2C_NO_ACK : I2C_ACK );
	}
	i2c_stop_cond( hi2c );

	return rc;
}

