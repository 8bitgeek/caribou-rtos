#ifndef _HW_GPIO_H_
#define _HW_GPIO_H_

#include <board.h>

extern caribou_gpio_t gpio_led0;
extern caribou_gpio_t gpio_pb1;
extern caribou_gpio_t gpio_rs485_dir;

extern void hw_gpio_setup( void );

#define hw_gpio_toggle( pin ) 		caribou_gpio_toggle		( &pin )
#define hw_gpio_set( pin ) 	    	caribou_gpio_set   		( &pin )
#define hw_gpio_reset( pin ) 		caribou_gpio_reset 		( &pin )
#define hw_gpio_state( pin ) 		(caribou_gpio_pinstate	( &pin ) ? 1 : 0)
#define hw_gpio_write( pin, state)	(state?hw_gpio_set(pin):hw_gpio_reset(pin))

#endif
