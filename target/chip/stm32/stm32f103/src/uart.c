/******************************************************************************
* Copyright © 2005-2013 by Pike Aerospace Research Corporation
* All Rights Reserved
*
*   This file is part of CARIBOU RTOS
*
*   CARIBOU RTOS is free software: you can redistribute it and/or modify
*   it under the terms of the Beerware License Version 43.
*
* ----------------------------------------------------------------------------
* "THE BEER-WARE LICENSE" (Revision 43):
* <mike@pikeaero.com> wrote this file. As long as you retain this notice you
* can do whatever you want with this stuff. If we meet some day, and you think
* this stuff is worth it, you can buy me a beer in return ~ Mike Sharkey
* ----------------------------------------------------------------------------
******************************************************************************/
#include <caribou/lib/stdio.h>
#include <caribou/lib/errno.h>
#include <caribou/lib/heap.h>
#include <caribou/lib/string.h>
#include <chip/chip.h>
#include <chip/uart.h>
#include <board.h>

#include <stm32f10x.h>
#include <stm32f10x_gpio.h>
#include <stm32f10x_usart.h>
#include <stm32f10x_rcc.h>

typedef struct
{
	USART_TypeDef*			base_address;		/// The base USART port address.
	InterruptVector			vector;				/// The interrupt vector for the USART port.
	caribou_uart_config_t	config;				/// The UART configuration (baud,stop bits,parity,etc..) */
	uint32_t				status;				/// The device driver status bits.
	caribou_bytequeue_t*	rx;					/// The receive queue.
	caribou_bytequeue_t*	tx;					/// The transmit queue
} chip_uart_private_t;

chip_uart_private_t device_info[] =
{
	// USART1
	{ 
		(USART_TypeDef*)USART1_BASE,									/// The base USART port address.
		USART1_IRQn,													/// The interrupt vector for the USART port.
		CARIBOU_UART_CONFIG_INIT,										/// The UART BAUD rate
		0,																/// The device driver status bits.
		NULL,															/// The RX queue
		NULL,															/// The TX queue
	},
	// USART2
	{ 
		(USART_TypeDef*)USART2_BASE,									/// The base USART port address.
		USART2_IRQn,													/// The interrupt vector for the USART port.
		CARIBOU_UART_CONFIG_INIT,										/// The UART BAUD rate
		0,																/// The device driver status bits.
		NULL,															/// The RX queue
		NULL,															/// The TX queue
	},
	// USART3
	{ 
		(USART_TypeDef*)USART3_BASE,									/// The base USART port address.
		USART3_IRQn,													/// The interrupt vector for the USART port.
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

#define UART_INTERRUPT_MASK	(USART_IT_RXNE)

/// Enables device interrupts.
int chip_uart_int_enable(void* device)
{
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
	int rc = chip_uart_int_enabled(private_device);
	USART_ITConfig(private_device->base_address, UART_INTERRUPT_MASK, ENABLE);
	return rc;
}

/// Disables device interrupts.
/// @return the previous state
int chip_uart_int_disable(void* device)
{
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
	int rc = chip_uart_int_enabled(private_device);
	USART_ITConfig(private_device->base_address, UART_INTERRUPT_MASK, DISABLE);
	return rc;
}

/// Interrupts Enabled?
int chip_uart_int_enabled(void* device)
{
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
	int rc = (private_device->base_address->CR1 & UART_INTERRUPT_MASK) ? 1 : 0;
	return rc;
}

/// Set interrupts to a previous state
int chip_uart_int_set(void* device, int state)
{
	int rc = chip_uart_int_enabled(device);
	if ( state )
		uart_enable_interrupts(device);
	else
		uart_disable_interrupts(device);
	return rc;
}

/// Enables transmitting and receiving.
static void uart_enable(chip_uart_private_t* device)
{
	USART_Cmd(device->base_address, ENABLE);
}

/// Disables transmitting and receiving.
static void uart_disable(chip_uart_private_t* device)
{
	USART_Cmd(device->base_address, DISABLE);
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
	USART_Cmd(private_device->base_address,DISABLE);
	if ( config )
	{
		USART_InitTypeDef USART_InitStructure;
		USART_InitStructure.USART_BaudRate = (int)config->baud_rate;
		USART_InitStructure.USART_WordLength = (int)config->word_size;

		switch ( config->word_size )
		{
			default:
			case CARIBOU_UART_WORDSIZE_5:				/* Word size 5 bits */
			case CARIBOU_UART_WORDSIZE_6:				/* Word size 6 bits */
			case CARIBOU_UART_WORDSIZE_7:				/* Word size 7 bits */
			case CARIBOU_UART_WORDSIZE_8:				/* Word size 8 bits */
				USART_InitStructure.USART_WordLength = USART_WordLength_8b;
				break;
			case CARIBOU_UART_WORDSIZE_9:				/* Word size 9 bits */		
				USART_InitStructure.USART_WordLength = USART_WordLength_9b;
				break;
		}

		switch ( config->stop_bits )
		{
			case CARIBOU_UART_STOPBITS_05:
				USART_InitStructure.USART_StopBits = USART_StopBits_0_5;
				break;
			default:
			case CARIBOU_UART_STOPBITS_1:
				USART_InitStructure.USART_StopBits = USART_StopBits_1;
				break;
			case CARIBOU_UART_STOPBITS_15:
				USART_InitStructure.USART_StopBits = USART_StopBits_1_5;
				break;
			case CARIBOU_UART_STOPBITS_2:
				USART_InitStructure.USART_StopBits = USART_StopBits_2;
				break;
		}

		switch( config->parity_bits )
		{
			default:
			case CARIBOU_UART_PARITY_NONE:
				USART_InitStructure.USART_Parity = USART_Parity_No;
				break;
			case CARIBOU_UART_PARITY_ODD:
				USART_InitStructure.USART_Parity = USART_Parity_Odd;
				break;
			case CARIBOU_UART_PARITY_EVEN:
				USART_InitStructure.USART_Parity = USART_Parity_Even;
				break;
		}

		switch( config->flow_control )
		{
			default:
			case CARIBOU_UART_FLOW_NONE:		/* no flow control */
				USART_InitStructure.USART_HardwareFlowControl = USART_HardwareFlowControl_None;
				break;
			case CARIBOU_UART_FLOW_RTS:			/* RTS flow control */
				USART_InitStructure.USART_HardwareFlowControl = USART_HardwareFlowControl_RTS;
				break;
			case CARIBOU_UART_FLOW_CTS:			/* CTS flow control */
				USART_InitStructure.USART_HardwareFlowControl = USART_HardwareFlowControl_CTS;
				break;
			case CARIBOU_UART_FLOW_RTS_CTS:		/* RTS+CTS flow control */
				USART_InitStructure.USART_HardwareFlowControl = USART_HardwareFlowControl_RTS_CTS;
				break;
		}

		USART_InitStructure.USART_Mode = USART_Mode_Rx | USART_Mode_Tx;
		USART_Init(private_device->base_address, &USART_InitStructure);
		//if ( (USART_InitStructure.USART_Parity == USART_Parity_Odd || USART_InitStructure.USART_Parity == USART_Parity_Even) &&
		//     USART_InitStructure.USART_WordLength == USART_WordLength_9b )
		//{
		//	private_device->base_address->CR1 |= USART_CR1_M;
		//}
		//else
		//{
		//	private_device->base_address->CR1 &= ~USART_CR1_M;
		//}
		USART_Cmd(private_device->base_address,ENABLE);
		caribou_vector_install(private_device->vector,isr_uart,private_device);
		caribou_vector_enable(private_device->vector);
		USART_ITConfig(private_device->base_address,UART_INTERRUPT_MASK,ENABLE);
		rc=0;
	}
	return rc;
}

/// External open  a uart device
int chip_uart_open(int fd)
{
	return fd;
}

/// External close  a uart device
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
    bool rc = (private_device->base_address->SR & USART_FLAG_TC) ? false : true;
	return rc;
}

bool chip_uart_tx_ready(void* device)
{
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
    bool rc = (private_device->base_address->SR & USART_FLAG_TXE) ? true : false;
	return rc;
}

bool chip_uart_rx_ready(void* device)
{
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
	uint32_t sr = private_device->base_address->SR;
    bool rc = (sr & USART_FLAG_RXNE) ? true : false;
	return rc;
}

int chip_uart_tx_data(void* device,int ch)
{
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
	private_device->base_address->DR = ch;
	return ch;
}

int chip_uart_rx_data(void* device)
{
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
	return private_device->base_address->DR;
}	

/* start the transmitter, usually enable transmitter interrupts, pend interrupt. */
void chip_uart_tx_start(void* device)
{
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
	private_device->base_address->CR1 |= USART_CR1_TXEIE;
}

/* Stop the transmitter, usually disable transmitter interrupts */
void chip_uart_tx_stop(void* device)
{
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
	private_device->base_address->CR1 &= ~USART_CR1_TXEIE;
}

/// UART interrupt service routine
void isr_uart(InterruptVector vector,void* arg)
{
	chip_uart_private_t* device = (chip_uart_private_t*)arg; // private device passed as isr argument
	if ( device->vector == vector )
	{
		// Empty out the UART receiver..
		while ( chip_uart_rx_ready(device) )
		{
			if ( !caribou_bytequeue_put(device->rx,chip_uart_rx_data(device) ) )
			{
				device->status |= STDIO_STATE_RX_OVERFLOW;
				break;
			}
			device->status |= STDIO_STATE_RX_PENDING;
		}
		// While transmitter empty and tx queue has data, then transmit...
		if ( !caribou_bytequeue_empty(device->tx) )
		{
			// Transmitter shift register is ready?
			if ( chip_uart_tx_ready(device) )
			{
				chip_uart_tx_data(device,caribou_bytequeue_get(device->tx));
			}
		}
		// Disable transmitter empty interrupts so we don't re-enter the interrupt handler.
		if ( caribou_bytequeue_empty(device->tx) )
		{
			chip_uart_tx_stop(device);
		}
	}
}

