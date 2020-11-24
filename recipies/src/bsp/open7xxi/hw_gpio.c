#include <hw_gpio.h>

caribou_gpio_t gpio_led0		= CARIBOU_GPIO_INIT( GPIOB, CARIBOU_GPIO_PIN_6 );
caribou_gpio_t gpio_led1		= CARIBOU_GPIO_INIT( GPIOB, CARIBOU_GPIO_PIN_7 );
caribou_gpio_t gpio_led2		= CARIBOU_GPIO_INIT( GPIOH, CARIBOU_GPIO_PIN_4 );
caribou_gpio_t gpio_led3		= CARIBOU_GPIO_INIT( GPIOI, CARIBOU_GPIO_PIN_8 );
caribou_gpio_t gpio_rs485_dir   = CARIBOU_GPIO_INIT( GPIOH, CARIBOU_GPIO_PIN_4 );


extern void hw_gpio_setup( void )
{
	caribou_gpio_reset( &gpio_led0 );
	caribou_gpio_reset( &gpio_led1 );
	caribou_gpio_reset( &gpio_led2 );
	caribou_gpio_reset( &gpio_led3 );
    caribou_gpio_reset( &gpio_rs485_dir );
}
