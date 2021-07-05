#include <hw_gpio.h>

caribou_gpio_t gpio_led0        = CARIBOU_GPIO_INIT(GPIOA,CARIBOU_GPIO_PIN_5);
caribou_gpio_t gpio_pb0         = CARIBOU_GPIO_INIT(GPIOC,CARIBOU_GPIO_PIN_13);
caribou_gpio_t gpio_rs485_dir   = CARIBOU_GPIO_INIT(GPIOA,CARIBOU_GPIO_PIN_12);

extern void hw_gpio_setup( void )
{
	hw_gpio_reset( gpio_led0 );
    hw_gpio_reset( gpio_rs485_dir );
}
