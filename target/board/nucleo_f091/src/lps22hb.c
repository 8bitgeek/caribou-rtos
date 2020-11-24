///////////////////////////////////////////////////////////////////////////////
//         Copyright (C) 2014 Pike Aerospace Research Corporation            //
///////////////////////////////////////////////////////////////////////////////
#include <lps22hb.h>
#include <lps22hb_reg.h>
#include <i2cio.h>
#include <i2c_callback.h>

typedef struct 
{ 
  uint8_t				status;
  uint8_t				ctrl_reg1;
  uint8_t				ctrl_reg2;
  uint8_t				ctrl_reg3;
  lps22hb_ctx_t         ctx;
  uint8_t               chip_id;
  uint8_t               device_id;
  uint32_t              tempc;
  int32_t               raw_pressure;
  int32_t				pressure;
  int16_t				pressure_offset;
} lps22hb_t;

lps22hb_t lps22hb;

extern void lps22hb_setup ( 
                  hi2c_t*       hi2c,
                  GPIO_TypeDef* scl_port, 
                  uint16_t      scl_pin, 
                  GPIO_TypeDef* sda_port, 
                  uint16_t      sda_pin,
                  uint16_t      delay,
                  uint8_t       chip_id
                )
{
	uint8_t reset_state;

	i2c_setup( hi2c, scl_port, scl_pin, sda_port, sda_pin, delay, chip_id );

	lps22hb.ctx.write_reg = i2c_callback_write;
	lps22hb.ctx.read_reg = i2c_callback_read;
	lps22hb.ctx.handle = hi2c;

	lps22hb.chip_id = chip_id;

	lps22hb_reset_set( &lps22hb.ctx, 1 );
	do
	{
		lps22hb_reset_get( &lps22hb.ctx, &reset_state );
	} while (reset_state);

	lps22hb_read_reg( &lps22hb.ctx, LPS22HB_CTRL_REG1, &lps22hb.ctrl_reg1, 1 );
	lps22hb_read_reg( &lps22hb.ctx, LPS22HB_CTRL_REG2, &lps22hb.ctrl_reg2, 1 );
	lps22hb_read_reg( &lps22hb.ctx, LPS22HB_CTRL_REG3, &lps22hb.ctrl_reg3, 1 );
	lps22hb.ctrl_reg1 &= ~(0x7<<4);
	lps22hb.ctrl_reg1 |= (1<<5);
	lps22hb_write_reg( &lps22hb.ctx, LPS22HB_CTRL_REG1, &lps22hb.ctrl_reg1, 1 );
	lps22hb_write_reg( &lps22hb.ctx, LPS22HB_CTRL_REG2, &lps22hb.ctrl_reg2, 1 );


}

extern void lps22hb_service( void )
{
	char buf[4];

	lps22hb.raw_pressure = 0;
	lps22hb.pressure = 0;
	lps22hb.pressure_offset = 0;

	lps22hb_device_id_get( &lps22hb.ctx, &lps22hb.device_id );

	lps22hb_read_reg( &lps22hb.ctx, LPS22HB_STATUS, &lps22hb.status, 1);


	lps22hb_pressure_raw_get( &lps22hb.ctx, buf );
	lps22hb.raw_pressure |= buf[0];
	lps22hb.raw_pressure |= buf[1]<<8;
	lps22hb.raw_pressure |= buf[2]<<16;
	/* extend 2's complement... */
	if ( buf[2]&0x80 ) lps22hb.raw_pressure |= (0xFF<<24);
	
	lps22hb.pressure = (lps22hb.raw_pressure*100) / (4096);

	lps22hb_pressure_offset_get( &lps22hb.ctx, buf );
	lps22hb.pressure_offset |= buf[0];
    lps22hb.pressure_offset |= buf[1]<<8;
}

extern uint8_t lps22hb_device_id()
{
	return lps22hb.device_id;
}

extern uint32_t lps22hb_raw_pressure()
{
	return lps22hb.raw_pressure;
}

extern int32_t lps22hb_pressure()
{
	return lps22hb.pressure;
}

extern int16_t lps22hb_pressure_offset()
{
	return lps22hb.pressure_offset;
}

extern uint8_t lps22hb_status()
{
  return (uint8_t)lps22hb.status;
}

extern uint8_t lps22hb_ctrl_reg1()
{
  return (uint8_t)lps22hb.ctrl_reg1;
}

extern uint8_t lps22hb_ctrl_reg2()
{
  return (uint8_t)lps22hb.ctrl_reg2;
}

extern uint8_t lps22hb_ctrl_reg3()
{
  return (uint8_t)lps22hb.ctrl_reg3;
}
