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
#include <caribou/kernel/interrupt.h>
#include <caribou/lib/stdio.h>
#include <caribou/lib/errno.h>
#include <caribou/lib/heap.h>
#include <caribou/lib/string.h>
#include <chip/chip.h>
#include <chip/uart.h>
#include <board.h>

#include <stm32f4xx.h>
#include <stm32f4xx_gpio.h>
#include <stm32f4xx_usart.h>
#include <stm32f4xx_rcc.h>
#include <stm32f4xx_dma.h>

typedef struct
{
	caribou_bytequeue_t*	queue;				/// The data queue
	bool					dma_enabled;		/// The DMA channel is enabled?
	DMA_Stream_TypeDef*		dma_stream;			/// The DMA stream.
	uint32_t				dma_channel;		/// The DMA channel.
	uint32_t				dma_source;			/// The Address of the peripheral port to use for DMA.
    uint32_t				dma_prio;			/// The DMA Channel priority
} chip_uart_queue_t;

typedef struct
{
	USART_TypeDef*			base_address;		/// The base USART port address.
	InterruptVector			vector;				/// The interrupt vector for the USART port.
	caribou_uart_config_t	config;				/// The UART configuration (baud,stop bits,parity,etc..) */
	uint32_t				status;				/// The device driver status bits.
	chip_uart_queue_t		rx;					/// The receive queue.
	chip_uart_queue_t		tx;					/// The transmit queue.
} chip_uart_private_t;

chip_uart_private_t device_info[] =
{
	// USART1 
	{ 
		(USART_TypeDef*)USART1_BASE,									/// The base USART port address.
		USART1_IRQn,													/// The interrupt vector for the USART port.
		CARIBOU_UART_CONFIG_INIT,										/// The UART BAUD rate
		0,																/// The device driver status bits.
		{NULL,false,DMA2_Stream5,DMA_Channel_4,(uint32_t)&USART1->DR,DMA_Priority_Low},		/// The RX queue
		{NULL,false,DMA2_Stream7,DMA_Channel_4,(uint32_t)&USART1->DR,DMA_Priority_Low},		/// The TX queue
	},
	// USART2
	{ 
		(USART_TypeDef*)USART2_BASE,
		USART2_IRQn,	
		CARIBOU_UART_CONFIG_INIT, 
		0, 
		{NULL,false,DMA1_Stream5,DMA_Channel_4,(uint32_t)&USART2->DR,DMA_Priority_Low},		/// The RX queue
		{NULL,false,DMA1_Stream6,DMA_Channel_4,(uint32_t)&USART2->DR,DMA_Priority_Low},		/// The TX queue
	},
	// USART3
	{ 
		(USART_TypeDef*)USART3_BASE,	
		USART3_IRQn,	
		CARIBOU_UART_CONFIG_INIT, 
		0, 
		{NULL,false,DMA1_Stream1,DMA_Channel_4,(uint32_t)&USART3->DR,DMA_Priority_Low},		/// The RX queue
		{NULL,false,DMA1_Stream3,DMA_Channel_4,(uint32_t)&USART3->DR,DMA_Priority_Low},		/// The TX queue
	},
	// UART4
	{ 
		(USART_TypeDef*)UART4_BASE,	
		UART4_IRQn,	
		CARIBOU_UART_CONFIG_INIT, 
		0, 
		{NULL,false,DMA1_Stream2,DMA_Channel_4,(uint32_t)&UART4->DR,DMA_Priority_Low},		/// The RX queue
		{NULL,false,DMA1_Stream4,DMA_Channel_4,(uint32_t)&UART4->DR,DMA_Priority_Low},		/// The TX queue
	},
	// UART5
	{ 
		(USART_TypeDef*)UART5_BASE,	
		UART5_IRQn,	
		CARIBOU_UART_CONFIG_INIT, 
		0, 
		{NULL,false,DMA1_Stream0,DMA_Channel_4,(uint32_t)&UART5->DR,DMA_Priority_Low},		/// The RX queue
		{NULL,false,DMA1_Stream7,DMA_Channel_4,(uint32_t)&UART5->DR,DMA_Priority_Low},		/// The TX queue
	},
	// USART6
	{ 
		(USART_TypeDef*)USART6_BASE,	
		USART6_IRQn,	
		CARIBOU_UART_CONFIG_INIT, 
		0, 
		{NULL,false,DMA2_Stream2,DMA_Channel_5,(uint32_t)&USART6->DR,DMA_Priority_Low},		/// The RX queue
		{NULL,false,DMA2_Stream6,DMA_Channel_5,(uint32_t)&USART6->DR,DMA_Priority_Low},		/// The TX queue
	},
	{	0, 
		0, 
		{0,0,0,0,0,0,0},
		0, 
		{NULL,false,0,0,0,0},
		{NULL,false,0,0,0,0},
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
	{ 
		&device_info[4], 
		caribou_uart_private_readfn,
		caribou_uart_private_writefn, 
		caribou_uart_private_readqueuefn, 
		caribou_uart_private_writequeuefn,
		caribou_uart_private_statefn 
	},
	{ 
		&device_info[5], 
		caribou_uart_private_readfn, 
		caribou_uart_private_writefn, 
		caribou_uart_private_readqueuefn, 
		caribou_uart_private_writequeuefn, 
		caribou_uart_private_statefn 
	},
	{ NULL, NULL, NULL, NULL, NULL, NULL },
};

static int chip_uart_enable_dma_rx(chip_uart_private_t* private_device);
static int chip_uart_disable_dma_rx(chip_uart_private_t* private_device);

static int chip_uart_enable_dma_tx(chip_uart_private_t* private_device);
static int chip_uart_disable_dma_tx(chip_uart_private_t* private_device);

static uint32_t chip_uart_interrupt_mask(chip_uart_private_t* private_device)
{
	uint32_t mask=0x00000000;
	if ( !private_device->rx.dma_enabled )
	{
		mask |= USART_CR1_RXNEIE;
	}
	return mask;
}

void chip_uart_enable(void* device)
{
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
	private_device->base_address->CR1 |= USART_CR1_UE;
}

void chip_uart_disable(void* device)
{
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
	private_device->base_address->CR1 &= ~USART_CR1_UE;
}

/// Enables device interrupts.
int chip_uart_int_enable(void* device)
{
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
	int rc = chip_uart_int_enabled(private_device);
	private_device->base_address->CR1 |= chip_uart_interrupt_mask(private_device);
	return rc;
}

/// Disables device interrupts.
/// @return the previous state
int chip_uart_int_disable(void* device)
{
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
	int rc = chip_uart_int_enabled(private_device);
   	private_device->base_address->CR1 &= ~chip_uart_interrupt_mask(private_device);
	return rc;
}

/// Interrupts Enabled?
int chip_uart_int_enabled(void* device)
{
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
	int rc = (private_device->base_address->CR1 & chip_uart_interrupt_mask(private_device)) ? 1 : 0;
	return rc;
}

/// Set interrupts to a previous state
int chip_uart_int_set(void* device, int state)
{
	int rc = chip_uart_int_enabled(device);
	if ( state )
		chip_uart_int_enable(device);
	else
		chip_uart_int_disable(device);
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

/**
 * @brief The DMA head pointer for the UART bytequeue channel.
 * @param d void* pointer assumed to be NULL or pointer to a DMA_Stream_TypeDef*
 * @return The offset expressed as positive integer relative to start of buffer.
 */
static uint16_t chip_uart_bytequeue_dma_head(caribou_bytequeue_t* queue,void* d)
{
	DMA_Stream_TypeDef* stream = (DMA_Stream_TypeDef*)d;
	uint16_t head = queue->size - stream->NDTR;
	return head;
}

/**
 * @brief Enable U(S)ART DMA on the receiver. 
 * Received bytes a placed round-robin into the the receivers's queue.
 */
static int chip_uart_enable_dma_rx(chip_uart_private_t* private_device)
{
	uint32_t channel = private_device->rx.dma_channel;
	DMA_Stream_TypeDef* stream = private_device->rx.dma_stream;

	chip_uart_disable_dma_rx(private_device);
	caribou_bytequeue_set_head_fn(private_device->rx.queue,chip_uart_bytequeue_dma_head,stream);

	stream->CR = 0;
	stream->CR =	(
						(channel & DMA_SxCR_CHSEL)	|					/* channel select */
                        private_device->rx.dma_prio	|					/* channel priority */
						DMA_SxCR_MINC				|					/* memory increment */
                        DMA_SxCR_CIRC									/* circular mode */
					);
	stream->NDTR =	(uint16_t)private_device->rx.queue->size;			/* the data size */
	stream->PAR =	(uint32_t)private_device->rx.dma_source;			/* the peripheral address */
	stream->M0AR =	(uint32_t)private_device->rx.queue->queue;			/* the destination memory address */

	/* Enable the USART Rx DMA request */
	private_device->base_address->CR3 |= USART_DMAReq_Rx;

	/* Let the device driver functions know that dma is enabled */
	private_device->rx.dma_enabled = true;

	/* Enable the DMA RX Stream */
	stream->CR |= DMA_SxCR_EN;
}

static int chip_uart_disable_dma_rx(chip_uart_private_t* private_device)
{
	uint32_t channel = private_device->rx.dma_channel;
	DMA_Stream_TypeDef* stream = private_device->rx.dma_stream;

	/* Disable the USART Rx DMA request */
	private_device->base_address->CR3 &= ~USART_DMAReq_Rx;

	/* Disaable the DMA RX Stream */
	stream->CR &= ~DMA_SxCR_EN;

   	private_device->rx.dma_enabled = false;
   	caribou_bytequeue_set_head_fn(private_device->rx.queue,NULL,NULL);
}

static int chip_uart_enable_dma_tx(chip_uart_private_t* private_device)
{
	DMA_InitTypeDef  DMA_InitStructure;

	chip_uart_disable_dma_tx(private_device);

	// TX
	DMA_InitStructure.DMA_Channel = private_device->tx.dma_channel;
	DMA_InitStructure.DMA_DIR = DMA_DIR_MemoryToPeripheral; // Transmit
	DMA_InitStructure.DMA_Memory0BaseAddr = (uint32_t)private_device->tx.queue->queue;
	DMA_InitStructure.DMA_BufferSize = (uint16_t)0; /* private_device->tx.queue->size; */ /* FIXME use size to control DMA transmitter size */
	DMA_InitStructure.DMA_PeripheralBaseAddr = private_device->tx.dma_source;
	DMA_InitStructure.DMA_PeripheralInc = DMA_PeripheralInc_Disable;
	DMA_InitStructure.DMA_MemoryInc = DMA_MemoryInc_Enable;
	DMA_InitStructure.DMA_PeripheralDataSize = DMA_PeripheralDataSize_Byte;
	DMA_InitStructure.DMA_MemoryDataSize = DMA_MemoryDataSize_Byte;
	DMA_InitStructure.DMA_Mode = DMA_Mode_Circular;
	DMA_InitStructure.DMA_Priority = private_device->tx.dma_prio;
	DMA_InitStructure.DMA_FIFOMode = DMA_FIFOMode_Enable;
	DMA_InitStructure.DMA_FIFOThreshold = DMA_FIFOThreshold_Full;
	DMA_InitStructure.DMA_MemoryBurst = DMA_MemoryBurst_Single;
	DMA_InitStructure.DMA_PeripheralBurst = DMA_PeripheralBurst_Single;

	DMA_Init(private_device->tx.dma_stream, &DMA_InitStructure);

	/* Enable the USART Tx DMA request */
	USART_DMACmd(private_device->base_address, USART_DMAReq_Tx, ENABLE);

	/* Enable DMA Stream Half Transfer and Transfer Complete interrupt */
	DMA_ITConfig(private_device->tx.dma_stream, DMA_IT_TC, ENABLE);
	DMA_ITConfig(private_device->tx.dma_stream, DMA_IT_HT, ENABLE);


	private_device->tx.dma_enabled = true;

	/* Disable the DMA TX Stream */
	DMA_Cmd(private_device->tx.dma_stream, DISABLE);  /* FIXME use ENABLE/DISABLE to control DMA TX flow */
}

static int chip_uart_disable_dma_tx(chip_uart_private_t* private_device)
{
	DMA_DeInit(private_device->tx.dma_stream);

	/* Disable the USART Tx DMA request */
	USART_DMACmd(private_device->base_address, USART_DMAReq_Tx, DISABLE);

	/* Disable DMA Stream Half Transfer and Transfer Complete interrupt */
	DMA_ITConfig(private_device->tx.dma_stream, DMA_IT_TC, DISABLE);
	DMA_ITConfig(private_device->tx.dma_stream, DMA_IT_HT, DISABLE);

	/* Disable the DMA RX Stream */
	DMA_Cmd(private_device->tx.dma_stream, ENABLE);

	private_device->tx.dma_enabled = false;
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
		USART_Init(private_device->base_address, &USART_InitStructure);
		USART_Cmd(private_device->base_address,ENABLE);

		if ( config->dma_mode != CARIBOU_UART_DMA_NONE )
		{
			/* dma channel(s) priority */
			switch( config->dma_prio )
			{
				case CARIBOU_UART_DMA_PRIO_DEFAULT:	
					break;
				case CARIBOU_UART_DMA_PRIO_LOW:		
					private_device->rx.dma_prio = DMA_Priority_Low;			
					break;
				case CARIBOU_UART_DMA_PRIO_MEDIUM:	
					private_device->rx.dma_prio = DMA_Priority_Medium;		
					break;
				case CARIBOU_UART_DMA_PRIO_HIGH:	
					private_device->rx.dma_prio = DMA_Priority_High;		
					break;
				case CARIBOU_UART_DMA_PRIO_HIGHEST:	
					private_device->rx.dma_prio = DMA_Priority_VeryHigh;	
					break;
			}
			caribou_vector_disable(private_device->vector);
           	private_device->base_address->CR1 &= ~chip_uart_interrupt_mask(private_device);
			if ( config->dma_mode & CARIBOU_UART_DMA_RX )
			{
				chip_uart_enable_dma_rx(private_device);
			}
			if ( config->dma_mode & CARIBOU_UART_DMA_TX )
			{
				chip_uart_enable_dma_tx(private_device);
			}
		}
		caribou_vector_install(private_device->vector,isr_uart,private_device);
		caribou_vector_enable(private_device->vector);
       	private_device->base_address->CR1 |= chip_uart_interrupt_mask(private_device);
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
	private_device->rx.queue = rx_queue;
	return rx_queue;
}

caribou_bytequeue_t* chip_uart_set_tx_queue(void* device, caribou_bytequeue_t* tx_queue)
{
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
	private_device->tx.queue = tx_queue;
	return tx_queue;
}

caribou_bytequeue_t* chip_uart_rx_queue(void* device)
{
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
	return private_device->rx.queue;
}

caribou_bytequeue_t* chip_uart_tx_queue(void* device)
{
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
	return private_device->tx.queue;
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
    return (private_device->base_address->SR & (USART_FLAG_RXNE|USART_FLAG_ORE)) ? true : false;
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
		while ( !device->rx.dma_enabled && chip_uart_rx_ready(device) )
		{
			if ( !caribou_bytequeue_put(device->rx.queue,chip_uart_rx_data(device) ) )
			{
				break;
			}
		}
		// While transmitter empty and tx queue has data, then transmit...
		while ( !caribou_bytequeue_empty(device->tx.queue) && chip_uart_tx_ready(device) )
		{
			chip_uart_tx_data(device,caribou_bytequeue_get(device->tx.queue));
		}
		// Disable transmitter empty interrupts so we don't re-enter the interrupt handler.
		if ( caribou_bytequeue_empty(device->tx.queue) )
		{
			chip_uart_tx_stop(device);
		}
	}
}

