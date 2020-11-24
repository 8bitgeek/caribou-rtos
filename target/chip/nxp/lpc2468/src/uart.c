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

#define UART_INTERRUPT_MASK (U0IER_RBR_Interrupt_Enable | U0IER_THRE_Interrupt_Enable)

typedef struct
{
	uint32_t				base_address;		/// The base address of the device port.
	InterruptVector			vector;				/// The interrupt vector
	caribou_uart_config_t	config;				/// The UART configuration (baud,stop bits,parity,etc..) */
	uint32_t				status;				/// The device driver status bits.
	caribou_bytequeue_t*	rx;					/// The receive queue.
	caribou_bytequeue_t*	tx;					/// The transmit queue
} chip_uart_private_t;

chip_uart_private_t device_info[] =
{
	// UART0
	{ 
		UART0_BASE,														/// The base UART port address.
		Vector_UART0,													/// The interrupt vector for the UART port.
		CARIBOU_UART_CONFIG_INIT,										/// The UART BAUD rate
		0,																/// The device driver status bits.
		NULL,															/// The RX queue
		NULL,															/// The TX queue
	},
	// UART1
	{ 
		UART1_BASE,														/// The base UART port address.
		Vector_UART1,													/// The interrupt vector for the UART port.
		CARIBOU_UART_CONFIG_INIT,										/// The UART BAUD rate
		0,																/// The device driver status bits.
		NULL,															/// The RX queue
		NULL,															/// The TX queue
	},
	// UART2
	{ 
		UART2_BASE,														/// The base UART port address.
		Vector_UART2,													/// The interrupt vector for the UART port.
		CARIBOU_UART_CONFIG_INIT,										/// The UART BAUD rate
		0,																/// The device driver status bits.
		NULL,															/// The RX queue
		NULL,															/// The TX queue
	},
	// UART3
	{ 
		UART3_BASE,														/// The base UART port address.
		Vector_UART3,													/// The interrupt vector for the UART port.
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
	{ 
		&device_info[3], 
		caribou_uart_private_readfn, 
		caribou_uart_private_writefn, 
		caribou_uart_private_readqueuefn, 
		caribou_uart_private_writequeuefn, 
		caribou_uart_private_statefn 
	},
	{ NULL, NULL, NULL, NULL, NULL, NULL },
};


#define	BASE(x) (x->base_address)
#define	LSR(x)	((uint8_t*)BASE(x)+U0LSR_OFFSET)		/* Line Status Register */
#define THR(x)	((uint8_t*)BASE(x)+U0THR_OFFSET)		/* Transmitter Holding Register */
#define RBR(x)	((uint8_t*)BASE(x)+U0RBR_OFFSET)		/* Receive Buffer Register */
#define FCR(x)	((uint8_t*)BASE(x)+U0FCR_OFFSET)
#define IIR(x)	((uint8_t*)BASE(x)+U0IIR_OFFSET)		/* Interrupt Idendification Register */
#define IER(x)	((uint8_t*)BASE(x)+U0IER_OFFSET)		/* Interrupt Enable Register */

/// Enables device interrupts.
int chip_uart_int_enable(void* device)
{
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
	int rc = chip_uart_int_enabled(private_device);
    *(volatile uint32_t*)IER(private_device) |= UART_INTERRUPT_MASK;
	return rc;
}

/// Disables device interrupts.
/// @return the previous state
int chip_uart_int_disable(void* device)
{
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
	int rc = chip_uart_int_enabled(private_device);
	*(volatile uint32_t*)IER(private_device) &= ~UART_INTERRUPT_MASK;
	return rc;
}

/// Interrupts Enabled?
int chip_uart_int_enabled(void* device)
{
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
	int rc = *(volatile uint32_t*)IER(private_device) & UART_INTERRUPT_MASK;
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
    *(volatile uint8_t*)FCR(private_device) |= 0x07;	/* Enable FIFOs and reset them. */
}

/// Disables transmitting and receiving.
void chip_uart_disable(void* device)
{
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
    *(volatile uint8_t*)FCR(private_device) &= ~0x07;	/* Disable FIFOs and reset them. */
}

#define serWANTED_CLOCK_SCALING			( ( unsigned long ) 16 )
#define configCPU_CLOCK_HZ              fCCLK

/// Set the uart parameters
int chip_uart_set_config(void* device,caribou_uart_config_t* config)
{
	int rc=(-1);
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
	if ( !config )
	{
		config = &private_device->config;
	}
	chip_uart_int_enable(device);
	chip_uart_disable(device);

    /* Setup the baud rate:  Calculate the divisor value. */
    unsigned long ulWantedClock = (config->baud_rate*2) * serWANTED_CLOCK_SCALING;
    unsigned long ulDivisor = configCPU_CLOCK_HZ / ulWantedClock;
	
	/* Set the DLAB bit so we can access the divisor. */
	*((volatile uint8_t*)((uint8_t*)BASE(private_device)+U0LCR_OFFSET)) = 0x80;     /* DLAB = 1 */
	
    /* Setup the divisor. */
	*((volatile uint8_t*)((uint8_t*)BASE(private_device)+U0DLL_OFFSET)) = ( unsigned char ) ( ulDivisor & ( unsigned long ) 0xff );  /* fDIV % 256; */
    ulDivisor >>= 8;
	*((volatile uint8_t*)((uint8_t*)BASE(private_device)+U0DLM_OFFSET)) = ( unsigned char ) ( ulDivisor & ( unsigned long ) 0xff );    /* fDIV / 256; */

	/* Turn on the FIFO's and clear the buffers. */
    *((volatile uint8_t*)((uint8_t*)BASE(private_device)+U0FCR_OFFSET)) = 0x07;     /* Enable FIFOs and reset them. */

	/* Setup transmission format. */
	uint32_t lcr_value=0;
	switch( config->word_size )
	{
		case CARIBOU_UART_WORDSIZE_6:				/* Word size 6 bits */
			lcr_value |= 0x01;
			break;
		case CARIBOU_UART_WORDSIZE_7:				/* Word size 7 bits */
			lcr_value |= 0x02;
			break;
		case CARIBOU_UART_WORDSIZE_8:				/* Word size 8 bits */
			lcr_value |= 0x03;
			break;
	}

	switch( config->stop_bits )
	{
		case CARIBOU_UART_STOPBITS_1:				/* one stop bit */
			lcr_value &= ~(1<<2);
			break;
		case CARIBOU_UART_STOPBITS_2:				/* two stop bits */
			lcr_value |= (1<<2);
			break;
	}

	switch( config->parity_bits )
	{
		case CARIBOU_UART_PARITY_EVEN:				/* even parity bit */
			lcr_value |= 0x18;
			break;
		case CARIBOU_UART_PARITY_ODD:				/* odd parity_bit */
			lcr_value |= 0x08;
			break;
	}
	*((volatile uint8_t*)((uint8_t*)BASE(private_device)+U0LCR_OFFSET)) = lcr_value;	/* DLAB = 0 */

    
    /** UART1 Hardware handshaking? **/
    if ( private_device->vector == Vector_UART1 )
    {
        if ( config->flow_control == CARIBOU_UART_FLOW_RTS || config->flow_control == CARIBOU_UART_FLOW_RTS_CTS )
        {
            *((volatile uint8_t*)((uint8_t*)BASE(private_device)+U1MCR_OFFSET)) |= U1MCR_RTSen;
        }
        if ( config->flow_control == CARIBOU_UART_FLOW_CTS || config->flow_control == CARIBOU_UART_FLOW_RTS_CTS )
        {
            *((volatile uint8_t*)((uint8_t*)BASE(private_device)+U1MCR_OFFSET)) |= U1MCR_CTSen;
        }
    }

	chip_uart_enable(device);
	caribou_vector_install(private_device->vector,isr_uart,private_device);
	caribou_vector_enable(private_device->vector);
	chip_uart_int_enable(device);

	rc=0;
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

bool chip_uart_tx_ready(void* device)
{
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
	bool rc = (*(volatile uint8_t*)LSR(private_device) & U0LSR_THRE) ? true : false;
	//bool rc = (*(volatile uint8_t*)LSR(private_device) & U0LSR_TEMT) ? true : false;
	return rc;
}

bool chip_uart_tx_busy(void* device)
{
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
	//bool rc = (*(volatile uint8_t*)LSR(private_device) & U0LSR_THRE) ? true : false;
	bool rc = (*(volatile uint8_t*)LSR(private_device) & U0LSR_TEMT) ? false : true;
	return rc;
}

bool chip_uart_rx_ready(void* device)
{
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
	bool rc = (*(volatile uint8_t*)LSR(private_device) & U0LSR_RDR) ? true : false;
	return rc;
}

int chip_uart_tx_data(void* device,int ch)
{
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
	*(volatile uint8_t*)THR(private_device) = (ch&0xFF);
	return ch;
}

int chip_uart_rx_data(void* device)
{
    uint8_t rc;
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
	rc = (*(volatile uint8_t*)RBR(private_device));
    return rc;
}	

/* start the transmitter, usually enable transmitter interrupts, pend interrupt. */
bool chip_uart_first_byte=0; /* HACK */
void chip_uart_tx_start(void* device)
{
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
	if ( !chip_uart_first_byte )
    {
        /* prime the transmitter */
        chip_uart_first_byte=1;
        *(volatile uint8_t*)THR(private_device) = caribou_bytequeue_get(private_device->tx);
    }
    *(volatile uint32_t*)IER(private_device) |= U0IER_THRE_Interrupt_Enable;
}

/* Stop the transmitter, usually disable transmitter interrupts */
void chip_uart_tx_stop(void* device)
{
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
	*(volatile uint32_t*)IER(private_device) &= ~U0IER_THRE_Interrupt_Enable;
}

/// UART interrupt service routine
void isr_uart(InterruptVector vector,void* arg)
{
    volatile uint32_t rIIR;
    volatile uint32_t rLSR;
    volatile uint8_t rDB;
	chip_uart_private_t* device = (chip_uart_private_t*)arg;    // private device passed as isr argument
    while ( ((rIIR=(*(volatile uint32_t*)IIR(device))) & U0IIR_IntStatus) == 0 )
    {
       switch ( (rIIR>>1)&0x07 )
        {
            case 0x03:  /* Receive Line Status (RLS) */
                rLSR=(*(volatile uint32_t*)LSR(device));        
                break;
            case 0x06:  /* Character Time-out Indicator (CTI) */
            case 0x02:  /* Receive Data Available (RDA) */
                rDB = (*(volatile uint8_t*)RBR(device));
                device->status |= (caribou_bytequeue_put(device->rx,rDB) ? STDIO_STATE_RX_PENDING : STDIO_STATE_RX_OVERFLOW);
                break;
            case 0x01:  /* THRE Interrupt */
                // While transmitter empty and tx queue has data, then transmit...
                if ( !caribou_bytequeue_empty(device->tx) )
                {
                    rDB = caribou_bytequeue_get(device->tx);
                    chip_uart_tx_data(device,rDB);
                }
                else
                {
                    chip_uart_tx_stop(device);
                    chip_uart_first_byte=0;
                }
                rIIR=(*(volatile uint32_t*)IIR(device));
                break;
        }
    }
}

