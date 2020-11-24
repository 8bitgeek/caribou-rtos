#include <hw_gpio.h>

caribou_gpio_t	gpio_enc28j60_nss	= CARIBOU_GPIO_INIT( GPIOA, CARIBOU_GPIO_PIN_4  );
caribou_gpio_t	gpio_enc28j60_reset	= CARIBOU_GPIO_INIT( GPIOA, CARIBOU_GPIO_PIN_15 );
caribou_gpio_t	gpio_enc28j60_int	= CARIBOU_GPIO_INIT( GPIOB, CARIBOU_GPIO_PIN_4  );

caribou_gpio_t gpio_ds18b20			= CARIBOU_GPIO_INIT( GPIOB, CARIBOU_GPIO_PIN_5  );
caribou_gpio_t gpio_ram0_nss		= CARIBOU_GPIO_INIT( GPIOB, CARIBOU_GPIO_PIN_12 );
caribou_gpio_t gpio_led0			= CARIBOU_GPIO_INIT( GPIOB, CARIBOU_GPIO_PIN_0  );

caribou_gpio_t gpio_gpio0			= CARIBOU_GPIO_INIT( GPIOB, CARIBOU_GPIO_PIN_2  );
caribou_gpio_t gpio_gpio1			= CARIBOU_GPIO_INIT( GPIOC, CARIBOU_GPIO_PIN_13 );
caribou_gpio_t gpio_rs485_dir   	= CARIBOU_GPIO_INIT( GPIOA, CARIBOU_GPIO_PIN_12 );

caribou_gpio_t	gpio_eeprom_wp		= CARIBOU_GPIO_INIT( GPIOB, CARIBOU_GPIO_PIN_3 );
caribou_gpio_t	gpio_i2c_scl		= CARIBOU_GPIO_INIT( GPIOB, CARIBOU_GPIO_PIN_6 );
caribou_gpio_t	gpio_i2c_sda		= CARIBOU_GPIO_INIT( GPIOB, CARIBOU_GPIO_PIN_7 );

extern void hw_gpio_setup( void )
{
	hw_gpio_set  ( gpio_eeprom_wp );
	hw_gpio_set  ( gpio_i2c_sda );
	hw_gpio_set  ( gpio_i2c_scl );

	hw_gpio_set  ( gpio_ds18b20  );
	hw_gpio_set  ( gpio_enc28j60_nss  );
	hw_gpio_set  ( gpio_enc28j60_reset  );
	hw_gpio_set  ( gpio_ram0_nss );
	hw_gpio_reset( gpio_led0 );

	hw_gpio_set  ( gpio_gpio0 );
	hw_gpio_reset( gpio_gpio1 );

    hw_gpio_reset( gpio_rs485_dir );

}
