///////////////////////////////////////////////////////////////////////////////
//         Copyright (C) 2014 Pike Aerospace Research Corporation            //
///////////////////////////////////////////////////////////////////////////////
#include <lps25hb.h>
#include <lps25hb_reg.h>
#include <i2cio.h>
#include <i2c_callback.h>

typedef struct 
{ 
  uint8_t				status;
  uint8_t				ctrl_reg1;
  uint8_t				ctrl_reg2;
  uint8_t				ctrl_reg3;
  lps25hb_ctx_t         ctx;
  uint8_t               chip_id;
  uint8_t               device_id;
  uint32_t              tempc;
  int32_t               raw_pressure;
  uint32_t              pressure;
} lps25hb_t;

lps25hb_t lps25hb;

extern void lps25hb_setup ( 
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

	lps25hb.ctx.write_reg = i2c_callback_write;
	lps25hb.ctx.read_reg = i2c_callback_read;
	lps25hb.ctx.handle = hi2c;

	lps25hb.chip_id = chip_id;

	lps25hb_reset_set( &lps25hb.ctx, 1 );
	do
	{
		lps25hb_reset_get( &lps25hb.ctx, &reset_state );
	} while (reset_state);

	lps25hb_read_reg( &lps25hb.ctx, LPS25HB_CTRL_REG1, &lps25hb.ctrl_reg1, 1 );
	lps25hb_read_reg( &lps25hb.ctx, LPS25HB_CTRL_REG2, &lps25hb.ctrl_reg2, 1 );
	lps25hb_read_reg( &lps25hb.ctx, LPS25HB_CTRL_REG3, &lps25hb.ctrl_reg3, 1 );
	lps25hb.ctrl_reg1 = LPS25HB_CTRL_REG1_ODR1 | 1<<1;
	lps25hb.ctrl_reg2 = 1<<4;
	lps25hb_write_reg( &lps25hb.ctx, LPS25HB_CTRL_REG1, &lps25hb.ctrl_reg1, 1 );
	lps25hb_write_reg( &lps25hb.ctx, LPS25HB_CTRL_REG2, &lps25hb.ctrl_reg2, 1 );


	lps25hb_read_reg( &lps25hb.ctx, LPS25HB_CTRL_REG1, &lps25hb.ctrl_reg1, 1 );
	lps25hb_read_reg( &lps25hb.ctx, LPS25HB_CTRL_REG2, &lps25hb.ctrl_reg2, 1 );
	lps25hb_read_reg( &lps25hb.ctx, LPS25HB_CTRL_REG3, &lps25hb.ctrl_reg3, 1 );
}

extern void lps25hb_service( void )
{
	char buf[4];

  lps25hb.raw_pressure = 0;
  lps25hb.pressure = 0;

  lps25hb_status_get( &lps25hb.ctx, &lps25hb.status );

	lps25hb_device_id_get( &lps25hb.ctx, &lps25hb.device_id );

  if ( 1 /* lps25hb.status.p_da && lps25hb.status.t_da */)
  {
	 lps25hb_pressure_raw_get( &lps25hb.ctx, buf );
	 lps25hb.raw_pressure |= buf[0];
	 lps25hb.raw_pressure |= buf[1]<<8;
	 lps25hb.raw_pressure |= buf[2]<<16;
	 lps25hb.pressure = lps25hb.raw_pressure / 4096;
  }
}

extern uint8_t lps25hb_device_id()
{
	return lps25hb.device_id;
}

extern uint32_t lps25hb_raw_pressure()
{
	return lps25hb.raw_pressure;
}

extern uint32_t lps25hb_pressure()
{
	return lps25hb.pressure;
}

extern uint8_t lps25hb_status()
{
  return (uint8_t)lps25hb.status;
}

extern uint8_t lps25hb_ctrl_reg1()
{
  return (uint8_t)lps25hb.ctrl_reg1;
}

extern uint8_t lps25hb_ctrl_reg2()
{
  return (uint8_t)lps25hb.ctrl_reg2;
}

extern uint8_t lps25hb_ctrl_reg3()
{
  return (uint8_t)lps25hb.ctrl_reg3;
}
