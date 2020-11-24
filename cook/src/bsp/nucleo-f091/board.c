#include <board.h>

#include <hw_pin.h>
#include <hw_usart.h>

extern void early_init( void )
{
	hw_clocks_setup();
	hw_gpio_setup();
	hw_pin_setup();
}

extern void late_init( void )
{
	hw_usart_setup();
}

