///////////////////////////////////////////////////////////////////////////////
//         Copyright (C) 2014 Pike Aerospace Research Corporation            //
///////////////////////////////////////////////////////////////////////////////
#ifndef __LPS22HB__H
#define __LPS22HB__H
#include <board.h>
#include <i2cio.h>
#include <lps22hb_reg.h>

#ifdef __cplusplus
extern "C"
{
#endif

extern void lps22hb_setup ( 
				  hi2c_t*       hi2c,
                  GPIO_TypeDef* scl_port, 
                  uint16_t      scl_pin, 
                  GPIO_TypeDef* sda_port, 
                  uint16_t      sda_pin,
                  uint16_t      delay,
                  uint8_t       chip_id
                );

extern void lps22hb_service( void );

extern uint8_t  lps22hb_device_id();
extern uint32_t lps22hb_raw_pressure();
extern int32_t	lps22hb_pressure();
extern int16_t  lps22hb_pressure_offset();
extern uint8_t  lps22hb_status();
extern uint8_t  lps22hb_ctrl_reg1();
extern uint8_t  lps22hb_ctrl_reg2();
extern uint8_t  lps22hb_ctrl_reg3();

#ifdef __cplusplus
}
#endif

#endif /* __LPS22HB__H */
