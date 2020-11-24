#include <hw_usart.h>

extern void hw_usart_setup( void )
{
	caribou_uart_config_t config;

    _stderr  = fopen(DEBUG_USART,"rw");
    //_stderr = _stdout = _stdin = fopen(DEBUG_USART,"rw");
	caribou_uart_init_config(&config);
	config.baud_rate	= CARIBOU_UART_BAUD_RATE_921600;
	config.word_size	= CARIBOU_UART_WORDSIZE_8;
	config.stop_bits	= CARIBOU_UART_STOPBITS_1;
	config.parity_bits	= CARIBOU_UART_PARITY_NONE;
	config.flow_control	= CARIBOU_UART_FLOW_NONE;
	caribou_uart_set_config(DEBUG_USART,&config);
}

