#include <ezbus_callback.h>
#include <hw_gpio.h>
#include <ezbus.h>
#include <ezbus_flip.h>
#include <ezbus_port.h>

#if defined(EZBUS_USE_FLOW_CALLBACK)

extern void ezbus_callback_setup( ezbus_port_t* port )
{
    ezbus_port_init_struct( port );

    ezbus_platform_port_set_name(port,EZBUS_USART_NO);
    ezbus_platform_port_set_handle(port,NULL);
    ezbus_platform_port_set_dir_gpio(port,&gpio_rs485_dir,NULL);
}

extern bool ezbus_platform_set_tx( ezbus_platform_port_t* port, bool enable )
{
    if ( enable )
    {
        caribou_gpio_set( ezbus_platform_port_get_dir_gpio_tx(port) );
    }
    else
    {
        ezbus_platform_drain(port);
        caribou_gpio_reset( ezbus_platform_port_get_dir_gpio_tx(port) );
    }
    return enable;
}

#endif
