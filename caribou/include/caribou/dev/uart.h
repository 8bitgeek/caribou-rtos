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
#ifndef __CARIBOU_UART_H__
#define __CARIBOU_UART_H__

#include <caribou/kernel/types.h>
#include <caribou/lib/bytequeue.h>
#include <caribou/dev/gpio.h>

#ifdef __cplusplus
extern "C"
{
#endif

#if !defined(CARIBOU_UART_BAUD_RATE_DEFAULT)
	#define CARIBOU_UART_BAUD_RATE_DEFAULT		CARIBOU_UART_BAUD_RATE_9600
#endif

#if !defined(CARIBOU_UART_WORDSIZE_DEFAULT)
	#define CARIBOU_UART_WORDSIZE_DEFAULT		CARIBOU_UART_WORDSIZE_8
#endif

#if !defined(CARIBOU_UART_STOPBITS_DEFAULT)
	#define CARIBOU_UART_STOPBITS_DEFAULT		CARIBOU_UART_STOPBITS_1
#endif

#if !defined(CARIBOU_UART_PARITY_DEFAULT)
	#define CARIBOU_UART_PARITY_DEFAULT			CARIBOU_UART_PARITY_NONE
#endif

#if !defined(CARIBOU_UART_FLOW_DEFAULT)
	#define CARIBOU_UART_FLOW_DEFAULT			CARIBOU_UART_FLOW_NONE
#endif

/** Defines the UART baud rates. 
 *  Not all baud rates are supported on all platforms. 
 *  The measured baud rate will be dependent upon the hardware clock and
 *  UART clock divisor. 
 */
typedef enum
{
	CARIBOU_UART_BAUD_RATE_110=110,				/** 110 Baud */
	CARIBOU_UART_BAUD_RATE_300=300,				/** 300 Baud */
	CARIBOU_UART_BAUD_RATE_600=600,				/** 600 Baud */
	CARIBOU_UART_BAUD_RATE_1200=1200,			/** 1200 Baud */
	CARIBOU_UART_BAUD_RATE_2400=2400,			/** 2400 Baud */
	CARIBOU_UART_BAUD_RATE_4800=4800,			/** 4800 Baud */
	CARIBOU_UART_BAUD_RATE_9600=9600,			/** 9600 Baud */
	CARIBOU_UART_BAUD_RATE_19200=19200,			/** 19200 Baud */
	CARIBOU_UART_BAUD_RATE_28800=28800,			/** 28800 Baud */
	CARIBOU_UART_BAUD_RATE_38400=38400,			/** 38400 Baud */
	CARIBOU_UART_BAUD_RATE_56000=56000,			/** 56000 Baud */
	CARIBOU_UART_BAUD_RATE_57600=57600,			/** 57600 Baud */
	CARIBOU_UART_BAUD_RATE_115200=115200,		/** 115200 Baud */
	CARIBOU_UART_BAUD_RATE_128000=128000,		/** 128000 Baud */
	CARIBOU_UART_BAUD_RATE_153600=153600,		/** 153600 Baud */
	CARIBOU_UART_BAUD_RATE_230400=230400,		/** 230400 Baud */
	CARIBOU_UART_BAUD_RATE_256000=256000,		/** 256000 Baud */
	CARIBOU_UART_BAUD_RATE_460800=460800,		/** 460800 Baud */
	CARIBOU_UART_BAUD_RATE_921600=921600,		/** 921600 Baud */
	CARIBOU_UART_BAUD_RATE_1152000=1152000,		/** 1152000 Baud */
	CARIBOU_UART_BAUD_RATE_1792000=1792000,		/** 1792000 Baud */
	CARIBOU_UART_BAUD_RATE_1843200=1843200,		/** 1843200 Baud */
	CARIBOU_UART_BAUD_RATE_3584000=3584000,		/** 3584000 Baud */
	CARIBOU_UART_BAUD_RATE_3686400=3686400,		/** 3686400 Baud */
	CARIBOU_UART_BAUD_RATE_7168000=7168000,		/** 7168000 Baud */
	CARIBOU_UART_BAUD_RATE_7372800=7372800,		/** 7372800 Baud */
	CARIBOU_UART_BAUD_RATE_9000000=9000000,		/** 9000000 Baud */
	CARIBOU_UART_BAUD_RATE_10500000=10500000,	/** 10500000 Baud */
} caribou_uart_baud_t;

/** Defines the UART word sizes. Not all word sizes are supported on all platforms. */
typedef enum
{
	CARIBOU_UART_WORDSIZE_5=5,				/* Word size 5 bits */
	CARIBOU_UART_WORDSIZE_6=6,				/* Word size 6 bits */
	CARIBOU_UART_WORDSIZE_7=7,				/* Word size 7 bits */
	CARIBOU_UART_WORDSIZE_8=8,				/* Word size 8 bits */
	CARIBOU_UART_WORDSIZE_9=9,				/* Word size 9 bits */
} caribou_uart_word_t;

/** Defines the UART stop bit size. Not all are supported on all platforms. */
typedef enum
{
	CARIBOU_UART_STOPBITS_05=0,				/* 0.5 stop bits */
	CARIBOU_UART_STOPBITS_1,				/* 1 stop bits */
	CARIBOU_UART_STOPBITS_15,				/* 1.5 stop bits */
	CARIBOU_UART_STOPBITS_2,				/* 2 stop bits */	
} caribou_uart_stop_t;

/** Defines the UART word parity bit */
typedef enum
{
	CARIBOU_UART_PARITY_NONE=0,				/* no parity bit */
	CARIBOU_UART_PARITY_EVEN,				/* even parity bit */
	CARIBOU_UART_PARITY_ODD,				/* odd parity_bit */
} caribou_uart_parity_t;

/** Defines the UART flow control type */
typedef enum
{
	CARIBOU_UART_FLOW_NONE=0,				/* no flow control */
	CARIBOU_UART_FLOW_RTS=0x01,				/* RTS flow control */
	CARIBOU_UART_FLOW_CTS=0x02,				/* CTS flow control */
	CARIBOU_UART_FLOW_RTS_CTS=0x03,			/* RTS | CTS flow control */
	CARIBOU_UART_FLOW_RS485=0x04,			/* RS485 gpio tx/rx direction pin (UART) */
	CARIBOU_UART_FLOW_RS485_GPIO=0x08,		/* RS485 gpio tx/rx direction pin (GPIO) */
} caribou_uart_flow_t;

/** Defines the DMA modes */
typedef enum
{
	CARIBOU_UART_DMA_NONE=0,				/* no DMA in use */
	CARIBOU_UART_DMA_RX=0x01,				/* Use DMA on receive */
	CARIBOU_UART_DMA_TX=0x02,				/* Use DMA on transmit */
	CARIBOU_UART_DMA_RXTX=0x03,				/* Use DMA RX and TX */
} caribou_uart_dma_t;

typedef enum
{
	CARIBOU_UART_DMA_PRIO_DEFAULT	=	0,
	CARIBOU_UART_DMA_PRIO_LOW		=	1,
	CARIBOU_UART_DMA_PRIO_MEDIUM	=	2,
	CARIBOU_UART_DMA_PRIO_HIGH		=	3,
	CARIBOU_UART_DMA_PRIO_HIGHEST	=	4
} caribou_uart_dma_prio_t;

typedef struct
{
	caribou_uart_baud_t		baud_rate;		/* Baud Rate */
	caribou_uart_word_t		word_size;		/* Word Length */
	caribou_uart_stop_t		stop_bits;		/* Stop Bits */
	caribou_uart_parity_t	parity_bits;	/* Parity Bits */
	caribou_uart_flow_t		flow_control;	/* Flow Control */
	caribou_uart_dma_t		dma_mode;		/* The dma mode to use */
    caribou_uart_dma_prio_t	dma_prio;		/* The DMA priority */
	caribou_gpio_t*			gpio;			/* GPIO for tx/rx, ptt, control */
} caribou_uart_config_t;

#define	CARIBOU_UART_CONFIG_INIT { CARIBOU_UART_BAUD_RATE_9600, \
								   CARIBOU_UART_WORDSIZE_8,		\
								   CARIBOU_UART_STOPBITS_1,		\
								   CARIBOU_UART_PARITY_NONE,	\
								   CARIBOU_UART_FLOW_NONE,		\
								   CARIBOU_UART_DMA_NONE,		\
								   CARIBOU_UART_DMA_PRIO_DEFAULT }

#include <chip/uart.h>

extern int	caribou_uart_open(int devicenum,caribou_uart_config_t* config);
extern void	caribou_uart_init_config(caribou_uart_config_t* config);
extern int	caribou_uart_set_config(int fd,caribou_uart_config_t* config);
extern int	caribou_uart_close(int fd);

extern int	caribou_uart_int_enable(int fd);
extern int	caribou_uart_int_disable(int fd);
extern int	caribou_uart_int_enabled(int fd);
extern int	caribou_uart_int_set(int fd,int state);

extern caribou_bytequeue_t* caribou_uart_rx_queue(int fd);
extern caribou_bytequeue_t* caribou_uart_tx_queue(int fd);

extern void	caribou_uart_enable(int fd);
extern void	caribou_uart_disable(int fd);

extern int	caribou_uart_queue_tx_sz();
extern int	caribou_uart_queue_rx_sz();

extern int	caribou_uart_tx_data(int fd,int ch);
extern int	caribou_uart_rx_data(int fd);

extern bool	caribou_uart_tx_busy(int fd);
extern bool	caribou_uart_tx_ready(int fd);
extern bool	caribou_uart_rx_ready(int fd);

/// FIXME make really private declarations.
extern int caribou_uart_private_readfn(stdio_t* io,void* data,int count);		/// Device Driver read-data function.
extern int caribou_uart_private_writefn(stdio_t* io,void* data,int count);		/// Device Driver write-data function.
extern int caribou_uart_private_readqueuefn(stdio_t* io);						/// Device Driver read-data available function.
extern int caribou_uart_private_writequeuefn(stdio_t* io);						/// Device Driver write-data pending.
extern int caribou_uart_private_statefn(stdio_t* io);							/// Return the device state.
extern int caribou_uart_private_flush(stdio_t* io);								/// Flush the I/O queues

extern void** caribou_device_of(int fd);

#ifdef __cplusplus
}
#endif

#endif
