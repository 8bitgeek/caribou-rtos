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
#include <caribou/stdio.h>
#include <caribou/errno.h>
#include <caribou/heap.h>
#include <caribou/string.h>
#include <chip/chip.h>
#include <chip/uart.h>
#include <board.h>

#include <stm32l1xx.h>
#include <stm32l1xx_gpio.h>
#include <stm32l1xx_usart.h>
#include <stm32l1xx_rcc.h>

/// forward declarations.
static int readfn(struct _stdio_t* io,void* data,int count);		/// Device Driver read-data function.
static int writefn(struct _stdio_t* io,void* data,int count);		/// Device Driver write-data function.
static int readqueuefn(struct _stdio_t* io);						/// Device Driver read-data available function.
static int writequeuefn(struct _stdio_t* io);						/// Device Driver write-data pending.
static int statefn(struct _stdio_t* io);							/// Return the device state.

typedef struct
{
	USART_TypeDef*	base_address;		/// The base USART port address.
	InterruptVector	vector;				/// The interrupt vector for the USART port.
	uint32_t		ahb_periph;			/// The AHB Peripheral
	uint32_t		apb1_periph;		/// The APB1 Peripheral
	uint32_t		apb2_periph;		/// The APB2 Peripheral
	GPIO_TypeDef *	tx_gpio;			/// The GPIO tx port
	uint16_t		tx_gpio_pin;		/// The GPIO pin to enable the Tx on.
	uint8_t			tx_gpio_pinsource;	/// The GPIO pin source */
	GPIO_TypeDef *	rx_gpio;			/// The GPIO rx port
	uint16_t		rx_gpio_pin;		/// The GPIO pin to enable the Rx on.
	uint8_t			rx_gpio_pinsource;	/// The GPIO pin source */
	uint32_t		baud_rate;			/// The UART BAUD rate
	uint16_t		word_length;		/// The UART word length mode bits
	uint16_t		stop_bits;			/// The UART stop bits
	uint16_t		parity;				/// The UART parity bit
	uint32_t		status;				/// The device driver status bits.
	uint8_t*		rx_buffer;			/// The receive buffer
	uint16_t		rx_buffer_sz;		/// The receive buffer size
	uint16_t		rx_buffer_head;		/// The receive buffer head pointer.
	uint16_t		rx_buffer_tail;		/// The receive buffer tail pointer.
	uint8_t*		tx_buffer;			/// The transmit buffer
	uint16_t		tx_buffer_sz;		/// The transmit buffer size
	uint16_t		tx_buffer_head;		/// The transmit buffer head pointer.
	uint16_t		tx_buffer_tail;		/// The transmit buffer tail pointer.
} device_private_t;

device_private_t device_info[] =
{
	// USART1
	{ 
		(USART_TypeDef*)USART1_BASE,									/// The base USART port address.
		USART1_IRQn,													/// The interrupt vector for the USART port.
		RCC_AHBPeriph_GPIOB,											/// The AHB Peripheral
		0,																/// The APB1 Peripheral
		RCC_APB2Periph_USART1,											/// The APB2 Peripheral
		GPIOB,															/// The GPIO port
		GPIO_Pin_6,														/// The GPIO pin to enable the Tx on.
		GPIO_PinSource6,
		GPIOB,															/// The GPIO port
		GPIO_Pin_7,														/// The GPIO pin to enable the Rx on.
		GPIO_PinSource7,
		19200,															/// The UART BAUD rate
		USART_WordLength_8b,											/// The UART word length mode bits
		USART_StopBits_1,												/// The UART stop bits
		USART_Parity_No,												/// The UART parity bit
		0,																/// The device driver status bits.
		0,																/// The receive buffer
		0,																/// The receive buffer size
		0,																/// The receive buffer head pointer.
		0,																/// The receive buffer tail pointer.
		0,																/// The transmit buffer
		0,																/// The transmit buffer size
		0,																/// The transmit buffer head pointer.
		0																/// The transmit buffer tail pointer.
	},
	// USART2
	{ 
		(USART_TypeDef*)USART2_BASE,
		USART2_IRQn,	
		RCC_AHBPeriph_GPIOA,
		RCC_APB1Periph_USART2,
		0,						
		GPIOA, 
		GPIO_Pin_2,	
		GPIO_PinSource2,
		GPIOA, 
		GPIO_Pin_3,	
   		GPIO_PinSource3,
		9600, 
		USART_WordLength_8b, 
		USART_StopBits_1, 
		USART_Parity_No, 
		0, 
		0, 
		0, 
		0, 
		0, 
		0, 
		0, 
		0, 
		0 
	},
	// USART3
	{ 
		(USART_TypeDef*)USART3_BASE,	
		USART3_IRQn,	
		RCC_AHBPeriph_GPIOB,
		RCC_APB1Periph_USART3,
		0,
		GPIOB, 
		GPIO_Pin_10,	
		GPIO_PinSource10,
		GPIOB, 
		GPIO_Pin_11,
        GPIO_PinSource11,
		9600, 
		USART_WordLength_8b, 
		USART_StopBits_1, 
		USART_Parity_No, 
		0, 
		0, 
		0, 
		0, 
		0, 
		0, 
		0, 
		0, 
		0 
	},
	{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
};

const stdio_t _stdio_[] =
{
	{ &device_info[0], readfn, writefn, readqueuefn, writequeuefn, statefn },
	{ &device_info[1], readfn, writefn, readqueuefn, writequeuefn, statefn },
	{ &device_info[2], readfn, writefn, readqueuefn, writequeuefn, statefn },
	{ &device_info[3], readfn, writefn, readqueuefn, writequeuefn, statefn },
	{ NULL, NULL, NULL, NULL, NULL, NULL },
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
	int rc = (device->base_address->CR1 & USART_FLAG_RXNE) ? 1 : 0;
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
			while ( USART_GetFlagStatus(device->base_address, USART_FLAG_RXNE) != RESET )
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
	USART_InitTypeDef		USART_InitStructure;
	GPIO_InitTypeDef		GPIO_InitStructure;
	USART_ClockInitTypeDef	USART_ClockInitStructure;

	if ( device->ahb_periph )
		RCC_AHBPeriphClockCmd(device->ahb_periph, ENABLE);
	if ( device->apb1_periph )
		RCC_APB1PeriphClockCmd(device->apb1_periph, ENABLE);
	if ( device->apb2_periph )
		RCC_APB2PeriphClockCmd(device->apb2_periph, ENABLE);

	/* CLK output pin */
	//USART_ClockStructInit(&USART_ClockInitStructure);
	//USART_ClockInitStructure.USART_Clock = USART_Clock_Enable;
    //USART_ClockInit(device->base_address,&USART_ClockInitStructure);

	/* Configure USARTx pins:  Tx */
	GPIO_InitStructure.GPIO_Pin = device->tx_gpio_pin;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_2MHz;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
	GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;
	GPIO_Init(device->tx_gpio, &GPIO_InitStructure);
	GPIO_PinAFConfig(device->tx_gpio,device->tx_gpio_pinsource ,0x07 /* USARTx AF mapping */);

	/* Configure USARTx pins:  Rx */
	GPIO_InitStructure.GPIO_Pin = device->rx_gpio_pin;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_2MHz;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN;
	GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;
	GPIO_Init(device->rx_gpio, &GPIO_InitStructure);
	GPIO_PinAFConfig(device->rx_gpio,device->rx_gpio_pinsource ,0x07 /* USARTx AF mapping */);

	USART_InitStructure.USART_BaudRate = device->baud_rate;
	USART_InitStructure.USART_WordLength = device->word_length;
	USART_InitStructure.USART_StopBits = device->stop_bits;
	USART_InitStructure.USART_Parity = USART_Parity_No;
	USART_InitStructure.USART_HardwareFlowControl = USART_HardwareFlowControl_None;
	USART_InitStructure.USART_Mode = USART_Mode_Rx | USART_Mode_Tx;
	USART_Init(device->base_address, &USART_InitStructure);

	USART_Cmd(device->base_address,ENABLE);
    USART_ITConfig(device->base_address,USART_IT_RXNE,ENABLE);

    chip_vector_enable( device->vector );
}

/// De-Initialize the UART
static void uart_deinit(device_private_t* device)
{
    uart_disable_interrupts(device);
    chip_vector_disable(device->vector);
}

/// External open  a uart device
int uart_open(int ndev)
{
	int rc=(-1);
	int fd;
	caribou_errno_set(0);
	caribou_thread_lock();
	for(fd=0; !errno && rc < 0 && _stdio_[fd].device_private; fd++)
	{
		if ( fd == ndev )
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

