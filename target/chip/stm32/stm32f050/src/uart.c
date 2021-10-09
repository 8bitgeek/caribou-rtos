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
#include <chip/chip.h>
#include <chip/uart.h>
#include <caribou/stdio.h>
#include <caribou/errno.h>
#include <caribou/heap.h>
#include <caribou/string.h>

#include <stm32f0xx.h>
#include <stm32f0xx_gpio.h>
#include <stm32f0xx_usart.h>
#include <stm32f0xx_rcc.h>

#define UART_INTERRUPT_MASK	(USART_CR1_RXNEIE)

static chip_uart_private_t device_info[] =
{
	{ 
		(USART_TypeDef*)USART1_BASE,									/// The base USART port address.
		USART1_IRQn,													/// The interrupt vector for the USART port.
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
	}
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
	{ NULL, NULL, NULL, NULL, NULL, NULL },
};

/// Enables device interrupts.
int chip_uart_int_enable(chip_uart_private_t* device)
{
	int rc = chip_uart_int_enabled(device);
	USART_ITConfig(device->base_address, UART_INTERRUPT_MASK, ENABLE);
	return rc;
}

/// Disables device interrupts.
/// @return the previous state
int chip_uart_int_disable(chip_uart_private_t* device)
{
	int rc = chip_uart_int_enabled(device);
	USART_ITConfig(device->base_address, UART_INTERRUPT_MASK, DISABLE);
	return rc;
}

/// Interrupts Enabled?
int chip_uart_int_enabled(chip_uart_private_t* device)
{
	int rc = (device->base_address->CR1 & UART_INTERRUPT_MASK) ? 1 : 0;
	return rc;
}

/// Set interrupts to a previous state
int chip_uart_int_set(chip_uart_private_t* device, int state)
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
int chip_uart_set_config(int fd,caribou_uart_config_t* config)
{
	int rc=(-1);
	stdio_t* stdio = &_stdio_[fd];
	chip_uart_private_t* device = stdio->device_private;
	USART_Cmd(device->base_address,DISABLE);
	if ( config )
	{
		USART_InitTypeDef USART_InitStructure;
		USART_InitStructure.USART_BaudRate = (int)config->baud_rate;
		USART_InitStructure.USART_WordLength = (int)config->word_size;

		switch ( config->stop_bits )
		{
			case CARIBOU_UART_STOPBITS_05:
				//USART_InitStructure.USART_StopBits = USART_StopBits_0_5;
				//break;
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
		USART_Init(device->base_address, &USART_InitStructure);
		USART_Cmd(device->base_address,ENABLE);
		chip_vector_enable(device->vector);
		USART_ITConfig(device->base_address,UART_INTERRUPT_MASK,ENABLE);
		rc=fd;
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

bool chip_uart_tx_ready(chip_uart_private_t* device)
{
	bool rc = (USART_GetFlagStatus(device->base_address, USART_FLAG_TXE) != RESET);
	return rc;
}

bool chip_uart_rx_ready(chip_uart_private_t* device)
{
	bool rc = (USART_GetFlagStatus(device->base_address, USART_FLAG_RXNE) != RESET);
	return rc;
}

/* start the transmitter, usually enable transmitter interrupts, pend interrupt. */
void chip_uart_tx_start(chip_uart_private_t* device)
{
	device->base_address->CR1 |= USART_CR1_TXEIE;
}

/* Stop the transmitter, usually disable transmitter interrupts */
void chip_uart_tx_stop(chip_uart_private_t* device)
{
	device->base_address->CR1 &= ~USART_CR1_TXEIE;
}

/// UART interrupt service routine
void isr_uart(InterruptVector vector)
{
	for(int ndevice=0; device_info[ndevice].base_address; ndevice++)
	{
		chip_uart_private_t* device = &device_info[ndevice];
		if ( device->vector == vector )
		{
			// Empty out the UART receiver..
			while ( !caribou_bytequeue_full(device->rx) && chip_uart_rx_ready(device) )
			{
				caribou_bytequeue_put(device->rx,device->base_address->RDR);
			}
			// While transmitter empty and tx queue has data, then transmit...
			if ( !caribou_bytequeue_empty(device->tx) )
			{
				// Transmitter shift register is ready?
				if ( chip_uart_tx_ready(device) )
				{
					device->base_address->TDR = caribou_bytequeue_get(device->tx);
				}
				// Disable transmitter empty interrupts so we don't re-enter the interrupt handler.
				if ( caribou_bytequeue_empty(device->tx) )
				{
					chip_uart_tx_stop(device);
				}
			}
			break;
		}
	}
}


