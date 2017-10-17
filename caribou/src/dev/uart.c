/** ***************************************************************************
* @file
* @author Mike Sharkey <mike@pikeaero.com>.
* @copyright © 2005-2013 by Pike Aerospace Research Corporation
* @copyright © 2014-2015 by Mike Sharkey
* @details This file is part of CARIBOU RTOS
* CARIBOU RTOS is free software: you can redistribute it and/or modify
* it under the terms of the Beerware License Version 43.
* "THE BEER-WARE LICENSE" (Revision 43):
* Mike Sharkey <mike@pikeaero.com> wrote this file. 
* As long as you retain this notice you can do whatever you want with
* this stuff. If we meet some day, and you think this stuff is 
* worth it, you can buy me a beer in return ~ Mike Sharkey
******************************************************************************/
#include <caribou/kernel/thread.h>
#include <caribou/lib/stdio.h>
#include <caribou/lib/string.h>
#include <caribou/lib/errno.h>
#include <caribou/lib/heap.h>
#include <caribou/dev/uart.h>

#ifndef CARIBOU_UART_RX_BYTEQUEUE_SZ
	#define CARIBOU_UART_RX_BYTEQUEUE_SZ 128
#endif
#ifndef CARIBOU_UART_TX_BYTEQUEUE_SZ
	#define CARIBOU_UART_TX_BYTEQUEUE_SZ 32
#endif

CARIBOU_MUTEX_DECL(uart_mutex);

/// FIXME - gateway toward generalized device type...
void** caribou_device_of(int fd)
{
	stdio_t* io = &_stdio_[fd];
	void* device = io->device_private;
	return device;
}

/**
 * @brief Open a UART device for subsequent use.
 * @param ndev Specifies the device number to use.
 * @return The file descriptor or < 0 on error.
 */
int caribou_uart_open(int ndev,caribou_uart_config_t* config)
{
	int fd;
	errno = EOKAY;
	caribou_mutex_lock(&uart_mutex,0);
	if ( (fd = ndev) >= 0 )
	{
		stdio_t* io = &_stdio_[fd];
		void* device = io->device_private;
		caribou_bytequeue_free(chip_uart_rx_queue(device));
		caribou_bytequeue_free(chip_uart_tx_queue(device));
		chip_uart_set_rx_queue(device,NULL);
		chip_uart_set_tx_queue(device,NULL);
		if ( chip_uart_set_rx_queue(device,caribou_bytequeue_new(caribou_uart_queue_rx_sz())) )
		{
			if ( chip_uart_set_tx_queue(device,caribou_bytequeue_new(caribou_uart_queue_tx_sz())) )
			{
				chip_uart_set_config(device,NULL); /* set defaults */
				chip_uart_set_status(device,chip_uart_status(device) | STDIO_STATE_OPENED);
			}
			else
			{
				caribou_bytequeue_free(chip_uart_rx_queue(device));
				errno = ENOMEM;
			}
		}
		else
		{
			errno = ENOMEM;
		}
	}
	caribou_mutex_unlock(&uart_mutex);
	if ( fd >= 0 && config )
	{
		if ( caribou_uart_set_config(fd,config) < 0 )
		{
			caribou_uart_close(fd);
			fd = (-1);
		}
	}
	if ( chip_uart_open(fd) != fd )
	{
		caribou_uart_close(fd);
	}
	return fd;
}

/**
 * @brief Close a previously opened UART.
 * @param fd The opened UART file descriptor.
 * @return < 0 on error.
 */
int caribou_uart_close(int fd)
{
	int rc=0;
	errno = EOKAY;
	caribou_mutex_lock(&uart_mutex,0);
	stdio_t* io = &_stdio_[fd];
	void* device = io->device_private;
	chip_uart_int_disable(device);
	chip_vector_disable(chip_uart_interrupt_vector(device));
	caribou_bytequeue_free(chip_uart_rx_queue(device));
	caribou_bytequeue_free(chip_uart_tx_queue(device));
	chip_uart_set_rx_queue(device,NULL);
	chip_uart_set_tx_queue(device,NULL);
	chip_uart_set_status(device,chip_uart_status(device) & ~STDIO_STATE_OPENED);
	caribou_mutex_unlock(&uart_mutex);
	return rc;
}

/**
 * @brief Initialize the config record to contain sane values.
 */
void caribou_uart_init_config(caribou_uart_config_t* config)
{
	if ( config )
	{
		config->baud_rate	= CARIBOU_UART_BAUD_RATE_9600;
		config->word_size	= CARIBOU_UART_WORDSIZE_8;
		config->stop_bits	= CARIBOU_UART_STOPBITS_1;
		config->parity_bits	= CARIBOU_UART_PARITY_NONE;
		config->flow_control= CARIBOU_UART_FLOW_NONE;
		config->dma_mode	= CARIBOU_UART_DMA_NONE;
		config->dma_prio	= CARIBOU_UART_DMA_PRIO_DEFAULT;
	}
}

/**
 * @brief Set the UART configuration.
 * @param fd The opened UART file descriptor.
 * @return < 0 on error.
 */
int caribou_uart_set_config(int fd,caribou_uart_config_t* config)
{
	int rc = chip_uart_set_config(caribou_device_of(fd),config);
	return rc;
}

/**
 * @return The standard transmitter queue size in bytes.
 */
int	caribou_uart_queue_tx_sz()
{
	return CARIBOU_UART_TX_BYTEQUEUE_SZ;
}

/**
 * @return The standard receiver queue size in bytes.
 */
int	caribou_uart_queue_rx_sz()
{
	return CARIBOU_UART_RX_BYTEQUEUE_SZ;
}

caribou_bytequeue_t* caribou_uart_rx_queue(int fd)
{
	return chip_uart_rx_queue(caribou_device_of(fd));
}

caribou_bytequeue_t* caribou_uart_tx_queue(int fd)
{
	return chip_uart_tx_queue(caribou_device_of(fd));
}

/**
 * @brief Enable UART interrupts.
 * @param fd The open UART file descriptor.
 * @return The previous interrupt state.
 */
int caribou_uart_int_enable(int fd)
{
	int rc = chip_uart_int_enable(caribou_device_of(fd));
	return rc;
}

/**
 * @brief Disable UART interrupts.
 * @param fd The open UART file descriptor.
 * @return The previous interrupt state.
 */
int caribou_uart_int_disable(int fd)
{
	int rc = chip_uart_int_disable(caribou_device_of(fd));
	return rc;
}

/**
 * @brief Determine if the UART interrupts are enabled.
 * @param fd The open UART file descriptor.
 * @return The current interrupt state.
 */
int caribou_uart_int_enabled(int fd)
{
	int rc = chip_uart_int_enabled(caribou_device_of(fd));
	return rc;
}

/**
 * @brief Set the UART interrupt state.
 * @param fd The UART file descriptor.
 * @return void
 */
int caribou_uart_int_set(int fd,int state)
{
	int rc = chip_uart_int_set(caribou_device_of(fd),state);
	return rc;
}

/**
 * @brief Place a byte into the UART transmit buffer.
 * @return the byte.,
 */
int	caribou_uart_tx_data(int fd,int ch)
{
	chip_uart_tx_data(caribou_device_of(fd),ch);
}

/**
 * @brief Retrieve a byte from the UART holding register.
 */
int	caribou_uart_rx_data(int fd)
{
	return chip_uart_rx_data(caribou_device_of(fd));
}

/**
 * @brief Determine of the UART transmitter is busy.
 */
extern bool	caribou_uart_tx_busy(int fd)
{
	return chip_uart_tx_busy(caribou_device_of(fd));
}

/**
 * @brief Determine of the UART transmitter is ready to accept a byte.
 */
extern bool	caribou_uart_tx_ready(int fd)
{
	return chip_uart_tx_ready(caribou_device_of(fd));
}

/**
 * @brief Determine of receiver has data ready.
 */
extern bool	caribou_uart_rx_ready(int fd)
{
	return chip_uart_rx_ready(caribou_device_of(fd));
}

void caribou_uart_enable(int fd)
{
	chip_uart_enable(caribou_device_of(fd));
}

void caribou_uart_disable(int fd)
{
	chip_uart_disable(caribou_device_of(fd));
}

/// Device Driver read-data function.
/// @return number of bytes read, or < 0 + errno
int caribou_uart_private_readfn(stdio_t* io,void* data,int count)
{
	int rc=0;
	uint8_t* p = (uint8_t*)data;
	while (rc < count)
	{
		int c;
		if ( (c = caribou_bytequeue_get(chip_uart_rx_queue(io->device_private))) >= 0 )
		{
			p[rc++] = (uint8_t)(c&0xff);
			chip_uart_set_status(io->device_private,chip_uart_status(io->device_private) | STDIO_STATE_RX_PENDING);
		}
		else
		{
			caribou_thread_yield();
		}
	}
	return rc;
}

/// Device Driver write-data function.
int caribou_uart_private_writefn(stdio_t* io,void* data,int count)
{
	int rc=0;
	uint8_t* p = (uint8_t*)data;
	while( rc < count )
	{
		// Fill the transmitter queue as much as we can...
		if ( caribou_bytequeue_put(chip_uart_tx_queue(io->device_private),p[rc]) ) 
		{
			++rc;
		}
		else
		{
			caribou_thread_yield();
		}
		// Allow the interrupt service routine to empty out the tx queue a little...
		chip_uart_tx_start(io->device_private);
	}
	return rc;

}

extern int caribou_uart_private_flush(stdio_t* io)
{
	int fd = _fd(io);
	while( !caribou_bytequeue_empty(caribou_uart_tx_queue(fd)) )
	{
		chip_uart_tx_start(io->device_private);
		caribou_thread_yield();
	}
	while ( chip_uart_tx_busy(io->device_private) )
	{
		caribou_thread_yield();
	}
	return 0;
}

/// Device Driver read-data available function.
int caribou_uart_private_readqueuefn(stdio_t* io)
{
	return caribou_bytequeue_level(chip_uart_rx_queue(io->device_private));
}

/// Device Driver write-data pending.
int caribou_uart_private_writequeuefn(stdio_t* io)
{
	return caribou_bytequeue_level(chip_uart_tx_queue(io->device_private));
}

/// Return the device state.
int caribou_uart_private_statefn(stdio_t* io)
{
	return chip_uart_status(io->device_private);
}

