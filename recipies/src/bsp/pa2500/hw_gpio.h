#ifndef _HW_GPIO_H_
#define _HW_GPIO_H_

#include <board.h>

#ifdef __cplusplus
extern "C"
{
#endif

extern caribou_gpio_t gpio_enc28j60_nss;
extern caribou_gpio_t gpio_enc28j60_reset;
extern caribou_gpio_t gpio_enc28j60_int;
extern caribou_gpio_t gpio_ds18b20;
extern caribou_gpio_t gpio_ram0_nss;
extern caribou_gpio_t gpio_led0;
extern caribou_gpio_t gpio_gpio0;
extern caribou_gpio_t gpio_gpio1;
extern caribou_gpio_t gpio_rs485_dir;
extern caribou_gpio_t gpio_eeprom_wp;
extern caribou_gpio_t gpio_i2c_scl;
extern caribou_gpio_t gpio_i2c_sda;

extern void hw_gpio_setup( void );

#define hw_gpio_toggle( pin ) 		caribou_gpio_toggle		( &pin )
#define hw_gpio_set( pin ) 	    	caribou_gpio_set   		( &pin )
#define hw_gpio_reset( pin ) 		caribou_gpio_reset 		( &pin )
#define hw_gpio_state( pin ) 		(caribou_gpio_pinstate	( &pin ) ? 1 : 0)
#define hw_gpio_write( pin, state)	(state?hw_gpio_set(pin):hw_gpio_reset(pin))

#ifdef __cplusplus
}
#endif

#endif
