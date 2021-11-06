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
#include "chip.h"
#include "chip_uart.h"
#include "board.h"
#include "stdio.h"
#include "errno.h"
#include "heap.h"
#include <caribou/string.h>

#include "stm32f0xx.h"
#include "stm32f0xx_gpio.h"
#include "stm32f0xx_usart.h"
#include "stm32f0xx_rcc.h"

/// forward declarations.
static int readfn(struct _stdio_t* io,void* data,int count);		/// Device Driver read-data function.
static int writefn(struct _stdio_t* io,void* data,int count);		/// Device Driver write-data function.
static int readqueuefn(struct _stdio_t* io);						/// Device Driver read-data available function.
static int writequeuefn(struct _stdio_t* io);						/// Device Driver write-data pending.
static int statefn(struct _stdio_t* io);							/// Return the device state.

typedef struct
{
	USART_TypeDef*	base_address;	/// The base USART port address.
	InterruptVector	vector;			/// the interrupt vector for the USART port.
	uint8_t			rcc_enr_offset;	/// RCC enable register offset.
	uint32_t		rcc_enr_bit;	/// ECC peripheral enable bit.
	uint16_t		rx_gpio_pin;	/// The GPIO pin to enable the Rx on.
	uint16_t		tx_gpio_pin;	/// The GPIO pin to enable the Tx on.
	uint32_t		baud_rate;		/// The UART BAUD rate
	uint32_t		uart_mode;		/// The UART mode bits
	uint32_t		status;			/// The device driver status bits.
	uint8_t*		rx_buffer;		/// The receive buffer
	uint16_t		rx_buffer_sz;	/// The receive buffer size
	uint16_t		rx_buffer_head;	/// The receive buffer head pointer.
	uint16_t		rx_buffer_tail;	/// The receive buffer tail pointer.
	uint8_t*		tx_buffer;		/// The transmit buffer
	uint16_t		tx_buffer_sz;	/// The transmit buffer size
	uint16_t		tx_buffer_head;	/// The transmit buffer head pointer.
	uint16_t		tx_buffer_tail;	/// The transmit buffer tail pointer.
} device_private_t;

device_private_t device_info[] =
{
	{ (USART_TypeDef*)USART1_BASE, Vector_USART1, 0x18, RCC_APB2ENR_USART1EN, GPIO_Pin_10, GPIO_Pin_9, 9600, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
	{ (USART_TypeDef*)USART2_BASE, Vector_USART2, 0x1C, RCC_APB1ENR_USART2EN, GPIO_Pin_3,  GPIO_Pin_2, 9600, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
	{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
};

stdio_t _stdio_[] =
{
	{ "uart0",	&device_info[0], readfn, writefn, readqueuefn, writequeuefn, statefn },
	{ "uart1",	&device_info[1], readfn, writefn, readqueuefn, writequeuefn, statefn },
	{ "null",	&device_info[2], readfn, writefn, readqueuefn, writequeuefn, statefn },
	{ NULL,	NULL, NULL, NULL, NULL, NULL, NULL },
};

//#define UART_INTERRUPTS (UART_INT_RX | UART_INT_RT)
#define UART_INTERRUPTS UART_INT_RX

/// Enables device interrupts.
static void uart_enable_interrupts(device_private_t* device)
{
	USART_ITConfig(device->base_address, USART_IT_RXNE, ENABLE);
}

/// Disables device interrupts.
/// @return the previous state
static int uart_disable_interrupts(device_private_t* device)
{
	int rc = (USART_GetFlagStatus(device->base_address, USART_IT_RXNE) == SET ? 1 : 0);
	USART_ITConfig(device->base_address, USART_IT_RXNE, DISABLE);
	return rc;
}

/// Interrupts Enabled?
static int uart_interrupts_enabled(device_private_t* device)
{
	int rc = (USART_GetFlagStatus(device->base_address, USART_IT_RXNE) == SET ? 1 : 0);
	return rc;
}

/// Set interrupts to a previous state
static void uart_interrupts_set(device_private_t* device, int state)
{
	if ( state )
		uart_enable_interrupts(device);
	else
		uart_disable_interrupts(device);
}

/// Is the queue full?
static bool buffer_full(device_private_t* device, uint16_t sz, uint16_t head, uint16_t tail)
{
	int state = uart_disable_interrupts(device);
	bool rc = ( head == tail-1 || (head == sz-1 && tail == 0) );
	uart_interrupts_set(device, state);
	return rc;
}

/// Is the queue empty?
static bool buffer_empty(device_private_t* device, uint16_t sz, uint16_t head, uint16_t tail)
{
	int state = uart_disable_interrupts(device);
	bool rc = ( head == tail );
	uart_interrupts_set(device, state);
	return rc;
}

/// Put into ring buffer...
static bool buffer_put(device_private_t* device, uint8_t c, uint8_t* buffer, uint16_t sz, uint16_t* head, uint16_t tail)
{
	int state = uart_disable_interrupts(device);
	bool rc = !( *head == tail-1 || (*head == sz-1 && tail == 0) ); // not full?
	if ( rc )
	{
		buffer[*head] = c;
		*head = *head + 1;
		if ( *head >= sz )
			*head = 0;
	}
	uart_interrupts_set(device, state);
	return rc;
}

/// Get from ring buffer...
static int buffer_get(device_private_t* device, uint8_t* buffer, uint16_t sz, uint16_t head, uint16_t* tail)
{
	int rc = -1;
	int state = uart_disable_interrupts(device);
	if ( head != *tail ) // ? not empty?
	{
		rc = buffer[*tail];
		*tail = *tail + 1;
		if ( *tail >= sz )
			*tail = 0;
	}
	uart_interrupts_set(device, state);
	return rc;
}

/// Calculate the ring buffer level....
static int buffer_level(device_private_t* device, uint16_t sz, uint16_t head, uint16_t tail)
{
	int rc = 0;
	int state = uart_disable_interrupts(device);
	if ( head > tail )
	{
		rc = head-tail;
	}
	else if ( head < tail )
	{
		rc = sz - (tail-head);
	}
	uart_interrupts_set(device, state);
	return rc;
}

/// UART interrupt service routine
void isr_uart(InterruptVector vector)
{
	int ndevice;
	device_private_t* device;
	for(ndevice=0; device_info[ndevice].base_address; ndevice++)
	{
		device = &device_info[ndevice];
		if ( device->vector == vector )
		{
			uint8_t c;
			// while UART rx buff not empty, and rx ring buff not full, then empty UART rx buf...
			while ( USART_GetFlagStatus(device->base_address, USART_FLAG_RXNE) != RESET && !buffer_full(device, device->rx_buffer_sz, device->rx_buffer_head, device->rx_buffer_tail) )
			{
				buffer_put(device,USART_ReceiveData(device->base_address),device->rx_buffer, device->rx_buffer_sz, &device->rx_buffer_head, device->rx_buffer_tail);
			}
			break;
		}
	}
}

/// Enables transmitting and receiving.
static void uart_enable(device_private_t* device)
{
	USART_Cmd(device->base_address, ENABLE);
}

/// Disables transmitting and receiving.
static void uart_disable(device_private_t* device)
{
	USART_Cmd(device->base_address, DISABLE);
}

/// Gets the current configuration of a UART.
static void get_uart_config(device_private_t* device, uint32_t clock, uint32_t *pulBaud, uint32_t *pulConfig)
{
	*pulBaud=9600;
	*pulConfig=0;
}

/// Set the uart parameters
static void set_uart_config(device_private_t* device, uint32_t ulUARTClk, uint32_t ulBaud, uint32_t ulConfig)
{
	USART_InitTypeDef USART_InitStructure;
	USART_InitStructure.USART_BaudRate            = ulBaud;
	USART_InitStructure.USART_WordLength          = USART_WordLength_8b;
	USART_InitStructure.USART_StopBits            = USART_StopBits_1;
	USART_InitStructure.USART_Parity              = USART_Parity_No ;
	USART_InitStructure.USART_HardwareFlowControl = USART_HardwareFlowControl_None;
	USART_InitStructure.USART_Mode                = USART_Mode_Rx | USART_Mode_Tx;
	USART_Init(device->base_address, &USART_InitStructure);
}

/// Initialize the UART
static void uart_init(device_private_t* device)
{
	USART_InitTypeDef USART_InitStructure;
	GPIO_InitTypeDef GPIO_InitStructure;

	RCC_AHBPeriphClockCmd(RCC_AHBPeriph_GPIOA, ENABLE);

	RCC_APB2PeriphClockCmd(RCC_APB2Periph_USART1,ENABLE);

	GPIO_PinAFConfig(GPIOA, GPIO_PinSource9, GPIO_AF_1);
	GPIO_PinAFConfig(GPIOA, GPIO_PinSource10, GPIO_AF_1);

	/* Configure USART1 pins:  Rx and Tx ----------------------------*/
	GPIO_InitStructure.GPIO_Pin =  GPIO_Pin_9 | GPIO_Pin_10;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
	GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_UP;
	GPIO_Init(GPIOA, &GPIO_InitStructure);

	USART_InitStructure.USART_BaudRate = 9600;
	USART_InitStructure.USART_WordLength = USART_WordLength_8b;
	USART_InitStructure.USART_StopBits = USART_StopBits_1;
	USART_InitStructure.USART_Parity = USART_Parity_No;
	USART_InitStructure.USART_HardwareFlowControl = USART_HardwareFlowControl_None;
	USART_InitStructure.USART_Mode = USART_Mode_Rx | USART_Mode_Tx;
	USART_Init(USART1, &USART_InitStructure);

	USART_Cmd(USART1,ENABLE);
}

/// De-Initialize the UART
static void uart_deinit(device_private_t* device)
{
    uart_disable_interrupts(device);
    chip_vector_disable(device->vector);
}

/// External open  a uart device
int chip_uart_open(const char* name)
{
	int rc=(-1);
	int fd;
	caribou_errno_set(0);
	caribou_thread_lock();
	for(fd=0; !errno && rc < 0 && _stdio_[fd].name; fd++)
	{
		if ( strcmp( _stdio_[fd].name, name ) == 0 )
		{
			stdio_t* stdio = &_stdio_[fd];
			device_private_t* device = stdio->device_private;
			if ( !(device->status & STDIO_STATE_OPENED) )
			{
				device->rx_buffer = (uint8_t*)malloc(UART_RX_BUFFER_SZ);
				if (device->rx_buffer)
				{
					device->tx_buffer = (uint8_t*)malloc(UART_TX_BUFFER_SZ);
					if ( device->tx_buffer )
					{
						device->rx_buffer_sz = UART_RX_BUFFER_SZ;
						device->tx_buffer_sz = UART_TX_BUFFER_SZ;
						device->rx_buffer_head = 0;
						device->rx_buffer_tail = 0;
						device->tx_buffer_head = 0;
						device->tx_buffer_tail = 0;
						rc = fd;
						uart_init(device);
					}
					else
					{
						free(device->rx_buffer);
						device->rx_buffer = NULL;
						caribou_errno_set(ENOMEM);
					}
				}
				else
				{
					caribou_errno_set(ENOMEM);
				}
			}
			else
			{
				caribou_errno_set(EACCES);
			}
		}
	}
	caribou_thread_unlock();
	if (rc<0 && !errno)
		caribou_errno_set(ENOENT);
	return rc;
}

/// External close  a uart device
int chip_uart_close(int fd)
{
	int rc=0;
	caribou_errno_set(0);
	caribou_thread_lock();
	stdio_t* stdio = &_stdio_[fd];
	device_private_t* device = stdio->device_private;
	if ( device->status & STDIO_STATE_OPENED )
	{
		free(device->rx_buffer);
		free(device->tx_buffer);
		uart_deinit(device);
		device->status = 0;
	}
	else
	{
		caribou_errno_set(EBADF);
		rc=-1;
	}
	caribou_thread_unlock();
	return rc;
}

/// Device Driver read-data function.
/// @return number of bytes read, or < 0 + errno
static int readfn(stdio_t* io,void* data,int count)
{
	int rc=0;
	caribou_errno_set(0);
	if ( io )
	{
		device_private_t* device = (device_private_t*)io->device_private;
		if ( device )
		{
			if ( device->status & STDIO_STATE_OPENED )
			{
				while (rc < count)
				{
					int c;
					if ( (c = buffer_get(device, device->rx_buffer, device->rx_buffer_sz, device->rx_buffer_head, &device->rx_buffer_tail)) >= 0 )
					{
						((uint8_t*)data)[rc++] = (uint8_t)(c&0xff);
					}
					else
					{
						caribou_thread_yield();
					}
				}
			}
			else
			{
				caribou_errno_set(EIO);
				rc=-1;
			}
		}
		else
		{
			caribou_errno_set(EBADF);
			rc=-1;
		}
	}
	else
	{
		caribou_errno_set(EBADF);
		rc=-1;
	}
	return rc;
}

/// Device Driver write-data function.
static int writefn(stdio_t* io,void* data,int count)
{
	int rc=0;
	caribou_errno_set(0);
	if ( io )
	{
		device_private_t* device = (device_private_t*)io->device_private;
		if ( device )
		{
			if ( device->status & STDIO_STATE_OPENED )
			{
				int tx_stalled;
				int c;
				while( rc < count )
				{
					c = ((char*)data)[rc++];
					while ( USART_GetFlagStatus(device->base_address, USART_FLAG_TXE) == RESET )
						caribou_thread_yield();
					USART_SendData (device->base_address,(c&0xFF));
				}
			}
			else
			{
				caribou_errno_set(EIO);
				rc=-1;
			}
		}
		else
		{
			caribou_errno_set(EBADF);
			rc=-1;
		}
	}
	else
	{
		caribou_errno_set(EBADF);
		rc=-1;
	}
	return rc;
}

/// Device Driver read-data available function.
static int readqueuefn(stdio_t* io)
{
	int rc=0;
	caribou_errno_set(0);
	if ( io )
	{
		device_private_t* device = (device_private_t*)io->device_private;
		if ( device )
		{
			if ( device->status & STDIO_STATE_OPENED )
			{
				rc = buffer_level(device, device->rx_buffer_sz, device->rx_buffer_head, device->rx_buffer_tail);
			}
			else
			{
				caribou_errno_set(EIO);
				rc=-1;
			}
		}
		else
		{
			caribou_errno_set(EBADF);
			rc=-1;
		}
	}
	else
	{
		caribou_errno_set(EBADF);
		rc=-1;
	}
	return rc;
}

/// Device Driver write-data pending.
static int writequeuefn(stdio_t* io)
{
	int rc=0;
	caribou_errno_set(0);
	if ( io )
	{
		device_private_t* device = (device_private_t*)io->device_private;
		if ( device )
		{
			if ( device->status & STDIO_STATE_OPENED )
			{
				rc = buffer_level(device, device->tx_buffer_sz, device->tx_buffer_head, device->tx_buffer_tail);
			}
			else
			{
				caribou_errno_set(EIO);
				rc=-1;
			}
		}
		else
		{
			caribou_errno_set(EBADF);
			rc=-1;
		}
	}
	else
	{
		caribou_errno_set(EBADF);
		rc=-1;
	}
	return rc;
}

/// Return the device state.
static int statefn(stdio_t* io)
{
	int rc=0;
	caribou_errno_set(0);
	if ( io )
	{
		device_private_t* device = (device_private_t*)io->device_private;
		if ( device )
		{
			if ( device->status & STDIO_STATE_OPENED )
			{
				return device->status;
			}
			else
			{
				caribou_errno_set(EIO);
				rc=-1;
			}
		}
		else
		{
			caribou_errno_set(EBADF);
			rc=-1;
		}
	}
	else
	{
		caribou_errno_set(EBADF);
		rc=-1;
	}
	return rc;
}

/// Put a character to the iart.
static int chip_uart_putchar(stdio_t* io, int c)
{
	device_private_t* device = (device_private_t*)io->device_private;
	while ( USART_GetFlagStatus(device->base_address, USART_FLAG_TXE) != RESET )
		caribou_thread_yield();
	USART_SendData(device->base_address,(c&0xFF));
	return c;
}

/// Get a character from the uart.
static int chip_uart_getchar(stdio_t* io)
{
	int ch;
	device_private_t* device = (device_private_t*)io->device_private;
	while( USART_GetFlagStatus(device->base_address, USART_FLAG_RXNE) == RESET )
		caribou_thread_yield();
	ch = USART_ReceiveData(device->base_address);
	return ch;
}

