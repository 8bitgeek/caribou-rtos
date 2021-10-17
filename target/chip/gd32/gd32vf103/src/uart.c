/*
   _________    ____  ________  ____  __  __   ____  __________  _____
  / ____/   |  / __ \/  _/ __ )/ __ \/ / / /  / __ \/_  __/ __ \/ ___/
 / /   / /| | / /_/ // // __  / / / / / / /  / /_/ / / / / / / /\__ \ 
/ /___/ ___ |/ _, _// // /_/ / /_/ / /_/ /  / _, _/ / / / /_/ /___/ / 
\____/_/  |_/_/ |_/___/_____/\____/\____/  /_/ |_| /_/  \____//____/  
                                                                      

Copyleft © 2021 by Mike Sharkey 
mike@8bitgeek.com        

This file is part of CARIBOU RTOS

CARIBOU RTOS is free software: you can redistribute it and/or modify
it under the terms of the Beerware License Version 43.

----------------------------------------------------------------------------
"THE BEER-WARE LICENSE" (Revision 43):
<mike@8bitgeek.com> wrote this file. As long as you retain this notice you
can do whatever you want with this stuff. If we meet some day, and you think
this stuff is worth it, you can buy me a beer in return ~ Mike Sharkey
---------------------------------------------------------------------------- 
*/
#include <caribou/lib/stdio.h>
#include <caribou/lib/errno.h>
#include <caribou/lib/heap.h>
#include <caribou/lib/string.h>
#include <chip/chip.h>
#include <chip/uart.h>
#include <board.h>

typedef struct
{
	uint32_t				base_address;		/// The base USART port address.
	InterruptVector			vector;				/// The interrupt vector for the USART port.
	caribou_uart_config_t	config;				/// The UART configuration (baud,stop bits,parity,etc..) */
	uint32_t				status;				/// The device driver status bits.
	caribou_bytequeue_t*	rx;					/// The receive queue.
	caribou_bytequeue_t*	tx;					/// The transmit queue
} chip_uart_private_t;

chip_uart_private_t device_info[] =
{
	// USART0
	{ 
		USART0,															/// The base USART port address.
		USART0_IRQn,													/// The interrupt vector for the USART port.
		CARIBOU_UART_CONFIG_INIT,										/// The UART BAUD rate
		0,																/// The device driver status bits.
		NULL,															/// The RX queue
		NULL,															/// The TX queue
	},
	// USART1
	{ 
		USART1,															/// The base USART port address.
		USART1_IRQn,													/// The interrupt vector for the USART port.
		CARIBOU_UART_CONFIG_INIT,										/// The UART BAUD rate
		0,																/// The device driver status bits.
		NULL,															/// The RX queue
		NULL,															/// The TX queue
	},
	// USART2
	{ 
		USART2,															/// The base USART port address.
		USART2_IRQn,													/// The interrupt vector for the USART port.
		CARIBOU_UART_CONFIG_INIT,										/// The UART BAUD rate
		0,																/// The device driver status bits.
		NULL,															/// The RX queue
		NULL,															/// The TX queue
	},
	// UART3
	{ 
		UART3,															/// The base USART port address.
		UART3_IRQn,														/// The interrupt vector for the USART port.
		CARIBOU_UART_CONFIG_INIT,										/// The UART BAUD rate
		0,																/// The device driver status bits.
		NULL,															/// The RX queue
		NULL,															/// The TX queue
	},
	// UART4
	{ 
		UART4,															/// The base USART port address.
		UART4_IRQn,														/// The interrupt vector for the USART port.
		CARIBOU_UART_CONFIG_INIT,										/// The UART BAUD rate
		0,																/// The device driver status bits.
		NULL,															/// The RX queue
		NULL,															/// The TX queue
	},
	{	
		0, 
		0, 
		{0,0,0,0,0},
		0, 
		NULL,															/// The RX queue
		NULL,															/// The TX queue
	},
};

const stdio_t _stdio_[] =
{
	{ 
		&device_info[0], 
		caribou_uart_private_readfn, 
		caribou_uart_private_writefn, 
		caribou_uart_private_readqueuefn, 
		caribou_uart_private_writequeuefn, 
		caribou_uart_private_statefn 
	},
	{ 
		&device_info[1], 
		caribou_uart_private_readfn, 
		caribou_uart_private_writefn, 
		caribou_uart_private_readqueuefn, 
		caribou_uart_private_writequeuefn, 
		caribou_uart_private_statefn 
	},
	{ 
		&device_info[2], 
		caribou_uart_private_readfn, 
		caribou_uart_private_writefn, 
		caribou_uart_private_readqueuefn, 
		caribou_uart_private_writequeuefn, 
		caribou_uart_private_statefn 
	},
	{ NULL, NULL, NULL, NULL, NULL, NULL },
};

#define UART_INTERRUPT_MASK	(USART_INT_RBNE)

#define USART_STAT(usartx)            REG32((usartx) + (0x00000000U))   /*!< USART status register */
#define USART_DATA(usartx)            REG32((usartx) + (0x00000004U))   /*!< USART data register */
#define USART_BAUD(usartx)            REG32((usartx) + (0x00000008U))   /*!< USART baud rate register */
#define USART_CTL0(usartx)            REG32((usartx) + (0x0000000CU))   /*!< USART control register 0 */
#define USART_CTL1(usartx)            REG32((usartx) + (0x00000010U))   /*!< USART control register 1 */
#define USART_CTL2(usartx)            REG32((usartx) + (0x00000014U))   /*!< USART control register 2 */
#define USART_GP(usartx)              REG32((usartx) + (0x00000018U))   /*!< USART guard time and prescaler register */

/**
 * @brief Enables device interrupts.
 */
int chip_uart_int_enable(void* device)
{
	int rc = chip_uart_int_enabled(device);
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
	USART_CTL0(private_device->base_address) |= USART_CTL0_RBNEIE;
	return rc;
}

/**
 * @brief Disables device interrupts.
 * @return the previous state
 */
int chip_uart_int_disable(void* device)
{
	int rc = chip_uart_int_enabled(device);
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
	USART_CTL0(private_device->base_address) &= ~USART_CTL0_RBNEIE;
	return rc;
}

/**
 * @brief Interrupts Enabled?
 */
int chip_uart_int_enabled(void* device)
{
	int rc;
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
	/* get the interrupt enable bit status */
	rc = (USART_CTL0(private_device->base_address) & USART_CTL0_RBNEIE) ? true : false;
	return rc;
}

/**
 * @brief Set interrupts to a previous state
 * @return previous state
 */
int chip_uart_int_set(void* device, int state)
{
	int rc = chip_uart_int_enabled(device);
	if ( state )
		uart_enable_interrupts(device);
	else
		uart_disable_interrupts(device);
	return rc;
}

/// Set the uart parameters
int chip_uart_set_config(void* device,caribou_uart_config_t* config)
{
	int rc=(-1);
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
	if ( !config )
	{
		config = &private_device->config;
	}
	usart_disable(private_device->base_address);
	if ( config )
	{
		switch ( config->word_size )
		{
			default:
			case CARIBOU_UART_WORDSIZE_5:				/* Word size 5 bits */
			case CARIBOU_UART_WORDSIZE_6:				/* Word size 6 bits */
			case CARIBOU_UART_WORDSIZE_7:				/* Word size 7 bits */
			case CARIBOU_UART_WORDSIZE_8:				/* Word size 8 bits */
				usart_word_length_set(private_device->base_address,USART_WL_8BIT);
				break;
			case CARIBOU_UART_WORDSIZE_9:				/* Word size 9 bits */		
				usart_word_length_set(private_device->base_address,USART_WL_9BIT);
				break;
		}

		switch ( config->stop_bits )
		{
			case CARIBOU_UART_STOPBITS_05:
				usart_stop_bit_set(private_device->base_address,USART_STB_0_5BIT);
				break;
			default:
			case CARIBOU_UART_STOPBITS_1:
				usart_stop_bit_set(private_device->base_address,USART_STB_1BIT);
				break;
			case CARIBOU_UART_STOPBITS_15:
				usart_stop_bit_set(private_device->base_address,USART_STB_1_5BIT);
				break;
			case CARIBOU_UART_STOPBITS_2:
				usart_stop_bit_set(private_device->base_address,USART_STB_2BIT);
				break;
		}

		switch( config->parity_bits )
		{
			default:
			case CARIBOU_UART_PARITY_NONE:
				usart_parity_config(private_device->base_address,USART_PM_NONE);
				break;
			case CARIBOU_UART_PARITY_ODD:
				usart_parity_config(private_device->base_address,USART_PM_ODD);
				break;
			case CARIBOU_UART_PARITY_EVEN:
				usart_parity_config(private_device->base_address,USART_PM_EVEN);
				break;
		}

		switch( config->flow_control )
		{
			default:
			case CARIBOU_UART_FLOW_NONE:		/* no flow control */
				break;
			case CARIBOU_UART_FLOW_RTS:			/* RTS flow control */
				usart_hardware_flow_rts_config(private_device->base_address,USART_RTS_ENABLE);
				break;
			case CARIBOU_UART_FLOW_CTS:			/* CTS flow control */
				usart_hardware_flow_cts_config(private_device->base_address,USART_CTS_ENABLE);
				break;
			case CARIBOU_UART_FLOW_RTS_CTS:		/* RTS+CTS flow control */
				usart_hardware_flow_rts_config(private_device->base_address,USART_RTS_ENABLE);
				usart_hardware_flow_cts_config(private_device->base_address,USART_CTS_ENABLE);
				break;
		}

		usart_baudrate_set(private_device->base_address, config->baud_rate);
		usart_transmit_config(private_device->base_address,USART_TRANSMIT_ENABLE);
		usart_receive_config(private_device->base_address,USART_RECEIVE_ENABLE);
		usart_enable(private_device->base_address);
		caribou_vector_install(private_device->vector,caribou_uart_isr,private_device);
		caribou_vector_enable(private_device->vector);
		USART_CTL0(private_device->base_address) |= USART_CTL0_RBNEIE;
		rc=0;
	}
	return rc;
}

/**
 * @brief External open  a uart device
 */
int chip_uart_open(int fd)
{
	return fd;
}

/**
 * @brief External close  a uart device
 */
int chip_uart_close(int fd)
{
	return fd;
}

caribou_bytequeue_t* chip_uart_set_rx_queue(void* device, caribou_bytequeue_t* rx_queue)
{
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
	private_device->rx = rx_queue;
	return rx_queue;
}

caribou_bytequeue_t* chip_uart_set_tx_queue(void* device, caribou_bytequeue_t* tx_queue)
{
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
	private_device->tx = tx_queue;
	return tx_queue;
}

caribou_bytequeue_t* chip_uart_rx_queue(void* device)
{
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
	return private_device->rx;
}

caribou_bytequeue_t* chip_uart_tx_queue(void* device)
{
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
	return private_device->tx;
}

InterruptVector chip_uart_interrupt_vector(void* device)
{
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
	return private_device->vector;
}

uint32_t chip_uart_status(void* device)
{
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
	return private_device->status;
}

extern uint32_t chip_uart_set_status(void* device,uint32_t status)
{
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
	private_device->status = status;
	return private_device->status;
}

bool chip_uart_tx_busy(void* device)
{
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
	if ( (USART_STAT(private_device->base_address) & USART_STAT_TC))
		return false;
	return true;
}

bool chip_uart_tx_ready(void* device)
{
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
	bool rc = (USART_STAT(private_device->base_address) & USART_STAT_TBE) ? true : false;
	return rc;
}

bool chip_uart_rx_ready(void* device)
{
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
	bool rc = (USART_STAT(private_device->base_address) & USART_STAT_RBNE) ? true : false;
	return rc;
}

int chip_uart_tx_data(void* device,int ch)
{
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
	usart_data_transmit(private_device->base_address,ch);
	return ch;
}

int chip_uart_rx_data(void* device)
{
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
	return usart_data_receive(private_device->base_address);
}	

/**
 * @brief start the transmitter, usually enable transmitter interrupts, pend interrupt. 
 */
void chip_uart_tx_start(void* device)
{
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
	USART_CTL0(private_device->base_address) |= USART_CTL0_TBEIE;
}

/**
 * @brief Stop the transmitter, usually disable transmitter interrupts 
 */
void chip_uart_tx_stop(void* device)
{
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
	USART_CTL0(private_device->base_address) &= ~USART_CTL0_TBEIE;
}


