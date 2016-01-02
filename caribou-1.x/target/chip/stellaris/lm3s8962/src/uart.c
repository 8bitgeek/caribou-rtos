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
#include <caribou/kernel/interrupt.h>
#include <chip/chip.h>
#include <chip/uart.h>
#include <board.h>

#include <inc/lm3s8962.h>
#include <inc/hw_types.h>
#include <inc/hw_sysctl.h>
#include <inc/hw_nvic.h>
#include <inc/hw_memmap.h>
#include <inc/hw_uart.h>
#include <inc/hw_gpio.h>
#include <inc/hw_ints.h>

#include <driverlib/sysctl.h>
#include <driverlib/gpio.h>
#include <driverlib/uart.h>
#include <driverlib/pin_map.h>

typedef struct
{
	uint32_t				base_address;		/// The base address of the device port.
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
		UART0_BASE,														/// The base USART port address.
		INT_UART0,														/// The interrupt vector for the USART port.
		CARIBOU_UART_CONFIG_INIT,										/// The UART BAUD rate
		0,																/// The device driver status bits.
		NULL,															/// The RX queue
		NULL,															/// The TX queue
	},
	// USART1
	{ 
		UART1_BASE,														/// The base USART port address.
		INT_UART1,														/// The interrupt vector for the USART port.
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
	{ NULL, NULL, NULL, NULL, NULL, NULL },
};

//#define UART_INTERRUPTS (UART_INT_RX | | UART_INT_RTIM | UART_INT_RT)
#define UART_INTERRUPT_MASK (UART_INT_RX | UART_INT_RT)
#define FIFO_LEVEL_INTS  (UART_FIFO_RX4_8 | UART_FIFO_TX1_8)
//#define FIFO_ENABLED 0 /* UART_LCRH_FEN */
#define FIFO_ENABLED UART_LCRH_FEN

/// Enables device interrupts.
int chip_uart_int_enable(void* device)
{
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
	int rc = chip_uart_int_enabled(private_device);
	HWREG(private_device->base_address + UART_O_IM) |= UART_INTERRUPT_MASK;
	return rc;
}

/// Disables device interrupts.
/// @return the previous state
int chip_uart_int_disable(void* device)
{
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
	int rc = chip_uart_int_enabled(private_device);
	HWREG(private_device->base_address + UART_O_IM) &= ~UART_INTERRUPT_MASK;
	return rc;
}

/// Interrupts Enabled?
int chip_uart_int_enabled(void* device)
{
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
	int rc = HWREG(private_device->base_address + UART_O_IM) & UART_INTERRUPT_MASK ? 1 : 0;
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
void chip_uart_enable(void* device)
{
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
    // Enable the FIFO.
    HWREG(private_device->base_address + UART_O_LCRH) |= FIFO_ENABLED;   /** FIXME - should be able to use FIFO */
    // Enable RX, TX, and the UART.
    HWREG(private_device->base_address + UART_O_CTL) |= (UART_CTL_UARTEN | UART_CTL_TXE | UART_CTL_RXE);
}

/// Disables transmitting and receiving.
void chip_uart_disable(void* device)
{
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
    // Disable the FIFO.
    HWREG(private_device->base_address + UART_O_LCRH) &= ~(FIFO_ENABLED);
    // Disable the UART.
    HWREG(private_device->base_address + UART_O_CTL) &= ~(UART_CTL_UARTEN | UART_CTL_TXE | UART_CTL_RXE);
}

/// Set the uart parameters
int chip_uart_set_config(void* device,caribou_uart_config_t* config)
{
	unsigned long ulBaud;
	unsigned long ulDiv;
	unsigned long ulUARTClk = chip_clock_freq();
	int rc=(0);
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
	if ( !config )
	{
		config = &private_device->config;
	}
	ulBaud = config->baud_rate;
	// Stop the UART.
	chip_uart_disable(device);
	// Is the required baud rate greater than the maximum rate supported
	// without the use of high speed mode?
	if((private_device->base_address * 16) > ulUARTClk)
	{
		// Enable high speed mode.
		HWREG(private_device->base_address + UART_O_CTL) |= UART_CTL_HSE;
		// Half the supplied baud rate to compensate for enabling high speed
		// mode.  This allows the following code to be common to both cases.
		ulBaud /= 2;
	}
	else
	{
		// Disable high speed mode.
		HWREG(private_device->base_address + UART_O_CTL) &= ~(UART_CTL_HSE);
	}
	// Compute the fractional baud rate divider.
	ulDiv = (((ulUARTClk * 8) / ulBaud) + 1) / 2;
	// Set the baud rate.
	HWREG(private_device->base_address + UART_O_IBRD) = ulDiv / 64;
	HWREG(private_device->base_address + UART_O_FBRD) = ulDiv % 64;
	
	// Set the word length...
	HWREG(private_device->base_address + UART_O_LCRH) &= ~(3<<5);
	switch ( config->word_size )
	{
		default:
		case CARIBOU_UART_WORDSIZE_5:				/* Word size 5 bits */
			HWREG(private_device->base_address + UART_O_LCRH) |= (0<<5);
			break;
		case CARIBOU_UART_WORDSIZE_6:				/* Word size 6 bits */
			HWREG(private_device->base_address + UART_O_LCRH) |= (1<<5);
			break;
		case CARIBOU_UART_WORDSIZE_7:				/* Word size 7 bits */
			HWREG(private_device->base_address + UART_O_LCRH) |= (2<<5);
			break;
		case CARIBOU_UART_WORDSIZE_8:				/* Word size 8 bits */
			HWREG(private_device->base_address + UART_O_LCRH) |= (3<<5);
			break;
		case CARIBOU_UART_WORDSIZE_9:				/* Word size 9 bits */		
			HWREG(private_device->base_address + UART_O_LCRH) |= (3<<5);
			break;	
	}

	// Set the stop bits...
	HWREG(private_device->base_address + UART_O_LCRH) &= ~(1<<3);
	switch ( config->stop_bits )
	{
		default:
		case CARIBOU_UART_STOPBITS_05:
		case CARIBOU_UART_STOPBITS_1:
		case CARIBOU_UART_STOPBITS_15:
			/* one stop bit - 0.5 & 1.5 not supported - default */
			break;
		case CARIBOU_UART_STOPBITS_2:
			HWREG(private_device->base_address + UART_O_LCRH) |= (1<<3);
			break;
	}

	// Set the parity...
	HWREG(private_device->base_address + UART_O_LCRH) &= ~(3<<1);
	switch( config->parity_bits )
	{
		default:
		case CARIBOU_UART_PARITY_NONE:
			break;
		case CARIBOU_UART_PARITY_ODD:
			HWREG(private_device->base_address + UART_O_LCRH) |= (1<<1);
			break;
		case CARIBOU_UART_PARITY_EVEN:
			HWREG(private_device->base_address + UART_O_LCRH) |= (3<<1);
			break;
	}

	HWREG(private_device->base_address + UART_O_IFLS) = FIFO_LEVEL_INTS;
	// Clear the flags register.
	HWREG(private_device->base_address + UART_O_FR) = 0;
	caribou_vector_install(private_device->vector,isr_uart,private_device);
	caribou_vector_enable(private_device->vector);
	// Enable receiver interrupts
	HWREG(private_device->base_address + UART_O_IM) |= UART_INTERRUPT_MASK;
	// Start the UART.
    chip_uart_enable(device);

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

/**
 * @brief Indicates that the transmitter is still busy shifting out data.
 */
bool chip_uart_tx_busy(void* device)
{
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
	bool rc = (HWREG(private_device->base_address + UART_O_FR) & UART_FR_BUSY) ? true : false;
	return rc;
}

bool chip_uart_tx_ready(void* device)
{
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
    bool rc = (HWREG(private_device->base_address + UART_O_FR) & UART_FR_TXFF) ? false : true;
	return rc;
}

bool chip_uart_rx_ready(void* device)
{
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
	bool rc = (HWREG(private_device->base_address + UART_O_FR) & UART_FR_RXFE) ? false : true;
	return rc;
}

int chip_uart_tx_data(void* device,int ch)
{
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
	HWREG(private_device->base_address + UART_O_DR) = ch;
	return ch;
}

int chip_uart_rx_data(void* device)
{
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
	return (HWREG(private_device->base_address + UART_O_DR) & 0xFF);
}	

/* start the transmitter, usually enable transmitter interrupts, pend interrupt. */
void chip_uart_tx_start(void* device)
{
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
    HWREG(private_device->base_address + UART_O_IM) |= UART_INT_TX;
	chip_vector_pend(private_device->vector);
}

/* Stop the transmitter, usually disable transmitter interrupts */
void chip_uart_tx_stop(void* device)
{
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
    HWREG(private_device->base_address + UART_O_IM) &= ~UART_INT_TX;
	chip_vector_unpend(private_device->vector);
}

/// UART interrupt service routine
void isr_uart(InterruptVector vector,void* arg)
{
	chip_uart_private_t* device = (chip_uart_private_t*)arg; // private device passed as isr argument
	uint32_t status = HWREG(device->base_address + UART_O_MIS);
	HWREG(device->base_address + UART_O_ICR) = status;
	if ( device->vector == vector )
	{
		// Empty out the UART receiver..
		while ( chip_uart_rx_ready(device) )
		{
			if ( !caribou_bytequeue_put(device->rx,chip_uart_rx_data(device) ) )
			{
				device->status |= STDIO_STATE_RX_OVERFLOW;
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
			// Disable transmitter empty interrupts so we don't re-enter the interrupt handler.
		}
		if ( caribou_bytequeue_empty(device->tx) )
		{
			chip_uart_tx_stop(device);
		}
	}
}


