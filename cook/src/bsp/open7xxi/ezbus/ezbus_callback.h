#ifndef _EZBUS_CALLBACK_H_
#define _EZBUS_CALLBACK_H_

#include <board.h>
#include <ezbus_port.h>

#if defined(EZBUS_USE_FLOW_CALLBACK)

extern void ezbus_callback_setup( ezbus_port_t* port );

#define ezbus_platform_port_set_dir_gpio(p,tx,rx)   ((p)->platform_port.dir_tx_pin=(tx)); ((p)->platform_port.ndir_rx_pin=(rx))
#define ezbus_platform_port_get_dir_gpio_tx(p)      ((p)->dir_tx_pin)
#define ezbus_platform_port_get_dir_gpio_rx(p)      ((p)->ndir_rx_pin)

#endif

#endif

