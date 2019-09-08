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

#include <stm32l4xx.h>
#include <stm32l4xx_hal_gpio.h>
#include <stm32l4xx_hal_usart.h>
#include <stm32l4xx_hal_rcc_ex.h>
#include <stm32l4xx_hal_rcc.h>
#include <stm32l4xx_hal_dma.h>

#ifndef HSI_VALUE
	#define HSI_VALUE 16000000U
#endif

#ifndef LSE_VALUE
	#define LSE_VALUE 32768U
#endif

#define USART_BRR_MIN    0x10U        /* USART BRR minimum authorized value */
#define USART_BRR_MAX    0xFFFFU      /* USART BRR maximum authorized value */

#define USART_CR1_FIELDS          ((uint32_t)(USART_CR1_M | USART_CR1_PCE | USART_CR1_PS | \
                                              USART_CR1_TE | USART_CR1_RE  | USART_CR1_OVER8))    /*!< USART CR1 fields of parameters set by USART_SetConfig API */
#define USART_CR2_FIELDS          ((uint32_t)(USART_CR2_CPHA | USART_CR2_CPOL | \
                                              USART_CR2_CLKEN | USART_CR2_LBCL | USART_CR2_STOP)) /*!< USART CR2 fields of parameters set by USART_SetConfig API */

typedef struct
{
	caribou_bytequeue_t*	queue;				/// The data queue
	bool					dma_enabled;		/// The DMA channel is enabled?
	DMA_TypeDef*			dma;				/// The DMA controller.
	uint32_t				dma_channel_remap;	/// The DMA channel remap selector.
	DMA_Channel_TypeDef*	dma_channel;		/// The DMA channel.
	InterruptVector			dma_vector;			/// The DMA channel interrupt vector.
	uint32_t				dma_tcif;			/// The DMA channel transfer complete interrupt flag.
	uint32_t				dma_port;			/// The Address of the peripheral port to use for DMA.
	uint32_t				dma_prio;			/// The channel priority (low) 0 -> 3 (very high)
} chip_uart_queue_t;

typedef struct
{
	USART_TypeDef*			base_address;		/// The base USART port address.
	InterruptVector			vector;				/// The interrupt vector for the USART port.
	caribou_uart_config_t	config;				/// The UART configuration (baud,stop bits,parity,etc..) */
	uint32_t				status;				/// The device driver status bits.
	chip_uart_queue_t		rx;					/// The receive queue.
	chip_uart_queue_t		tx;					/// The transmit queue
} chip_uart_private_t;

chip_uart_private_t device_info[] =
{
	// USART1
	{ 
		(USART_TypeDef*)USART1_BASE,			/// The base USART port address.
		USART1_IRQn,							/// The interrupt vector for the USART port.
		CARIBOU_UART_CONFIG_INIT,				/// The UART BAUD rate
		0,										/// The device driver status bits.
		{	/// The RX queue DMA1 Channel 5
			NULL,								/// I/O Byte Queue
			false,								/// DMA Enabled
			DMA1,								/// DMA Controller
			(0x02 << DMA_CSELR_C5S_Pos),		/// DMA Channel Remap
			DMA1_Channel5,						/// DMA Channel
			DMA1_Channel5_IRQn,					/// DMA Channel Interrupt Vector
            DMA_ISR_TCIF5,						/// DMA Transfer Complete Interrupt Flag.
			(uint32_t)&USART1->RDR,				/// Receive D
            DMA_CCR_PL_0
		},		
		{	/// The TX queue DMA1 Channel 4
			NULL,								/// I/O Byte Queue
			false,								/// DMA Enabled
			DMA1,								/// DMA Controller
			(0x02 << DMA_CSELR_C4S_Pos),		/// DMA Channel Remap
			DMA1_Channel4,						/// DMA Channel
            DMA1_Channel4_IRQn,					/// DMA Channel Interrupt Vector
            DMA_ISR_TCIF4,						/// DMA Transfer Complete Interrupt Flag.
			(uint32_t)&USART1->TDR,				/// Transmit Data Register
            DMA_CCR_PL_0
		},		
	},
	// USART2
	{ 
		(USART_TypeDef*)USART2_BASE,			/// The base USART port address.
		USART2_IRQn,							/// The interrupt vector for the USART port.
		CARIBOU_UART_CONFIG_INIT,				/// The UART BAUD rate
		0,										/// The device driver status bits.
		{	/// The RX queue DMA1 Channel 6
			NULL,
			false,
			DMA1,
			(0x02 << DMA_CSELR_C6S_Pos),
			DMA1_Channel6,
            DMA1_Channel6_IRQn,
            DMA_ISR_TCIF6,						/// DMA Transfer Complete Interrupt Flag.
			(uint32_t)&USART2->RDR,
            DMA_CCR_PL_0
		},		
		{	/// The TX queue DMA1 Channel 7
			NULL,
			false,
			DMA1,
			(0x02 << DMA_CSELR_C7S_Pos),
			DMA1_Channel7,
            DMA1_Channel7_IRQn,
            DMA_ISR_TCIF7,						/// DMA Transfer Complete Interrupt Flag.
			(uint32_t)&USART2->TDR,
            DMA_CCR_PL_0
		},		
	},
	// USART3
	{ 
		(USART_TypeDef*)USART3_BASE,			/// The base USART port address.
		USART3_IRQn,							/// The interrupt vector for the USART port.
		CARIBOU_UART_CONFIG_INIT,				/// The UART BAUD rate
		0,										/// The device driver status bits.
		{	/// The RX queue DMA1 Channel 3
			NULL,
			false,
			DMA1,
			(0x02 << DMA_CSELR_C3S_Pos),
			DMA1_Channel3,
            DMA1_Channel3_IRQn,
            DMA_ISR_TCIF3,						/// DMA Transfer Complete Interrupt Flag.
			(uint32_t)&USART3->RDR,
            DMA_CCR_PL_0
		},		
		{	/// The TX queue DMA1 Channel 2
			NULL,
			false,
			DMA1,
			(0x02 << DMA_CSELR_C2S_Pos),
			DMA1_Channel2,
            DMA1_Channel2_IRQn,
            DMA_ISR_TCIF2,						/// DMA Transfer Complete Interrupt Flag.
			(uint32_t)&USART3->TDR,
            DMA_CCR_PL_0
		},		
	},
	{	
		(USART_TypeDef*)0,
		(InterruptVector)0, 
		CARIBOU_UART_CONFIG_INIT,
		0,
		{0,0,0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0,0,0},
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
	{ NULL, NULL, NULL, NULL, NULL, NULL },
};

static int chip_uart_enable_dma_rx(chip_uart_private_t* private_device);
static int chip_uart_disable_dma_rx(chip_uart_private_t* private_device);

static int chip_uart_enable_dma_tx(chip_uart_private_t* private_device);
static int chip_uart_disable_dma_tx(chip_uart_private_t* private_device);

static void isr_uart_dma(InterruptVector vector,void* arg);
static void isr_uart(InterruptVector vector,void* arg);

static uint32_t chip_usart_set_config(USART_TypeDef *usart, USART_InitTypeDef* Init);

static uint32_t chip_uart_interrupt_mask(chip_uart_private_t* private_device)
{
	uint32_t mask=0x00000000;
	if ( !private_device->rx.dma_enabled )
	{
		mask |= USART_CR1_RXNEIE;
	}
	return mask;
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
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
	private_device->base_address->CR1 |= USART_CR1_UE;
}

/// Disables transmitting and receiving.
static void uart_disable(chip_uart_private_t* device)
{
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
	private_device->base_address->CR1 &= ~USART_CR1_UE;
}

/**
 * @brief The DMA head pointer for the UART bytequeue channel.
 * @param d void* pointer assumed to be NULL or pointer to a DMA_Stream_TypeDef*
 * @return The offset expressed as positive integer relative to start of buffer.
 */
static uint16_t chip_uart_bytequeue_dma_head(caribou_bytequeue_t* queue,void* d)
{
	DMA_Channel_TypeDef* channel = (DMA_Channel_TypeDef*)d;
	uint16_t head = queue->size - channel->CNDTR;
	return head;
}

/**
 * @brief The DMA tail pointer for the UART bytequeue channel.
 * @param d void* pointer assumed to be NULL or pointer to a DMA_Stream_TypeDef*
 * @return The offset expressed as positive integer relative to start of buffer.
 */
static uint16_t chip_uart_bytequeue_dma_tail(caribou_bytequeue_t* queue,void* d)
{
	DMA_Channel_TypeDef* channel = (DMA_Channel_TypeDef*)d;
	uint16_t head = queue->size - channel->CNDTR;
	return head;
}

/**
 * @brief Enable U(S)ART DMA on the receiver. 
 * Received bytes a placed round-robin into the the receivers's queue.
 */
static int chip_uart_enable_dma_rx(chip_uart_private_t* private_device)
{
	DMA_Channel_TypeDef* channel = private_device->rx.dma_channel;

	chip_uart_disable_dma_rx(private_device);

	/* Set the bytequeue head-pointer callback function to use DMA byte count... */
	caribou_bytequeue_set_head_fn(private_device->rx.queue,chip_uart_bytequeue_dma_head,channel);

	/* Configure the channel remap... */
	if ( (uint32_t)channel > (uint32_t)DMA2_BASE )	/* Is DMA2? */
	{
		DMA2_CSELR->CSELR |= private_device->rx.dma_channel_remap;
	}
	else	/* Must be DMA1... */
	{
		DMA1_CSELR->CSELR |= private_device->rx.dma_channel_remap;
	}

	channel->CCR = 0;
	channel->CCR |=	(
						private_device->rx.dma_prio	|					/* channel priority */
                        DMA_CCR_MINC				|					/* memory increment */
						DMA_CCR_CIRC									/* circular mode */
					);

	channel->CNDTR = (uint16_t)private_device->rx.queue->size;			/* the data size */
	channel->CPAR = (uint32_t)private_device->rx.dma_port;				/* the peripheral address */
	channel->CMAR = (uint32_t)private_device->rx.queue->queue;			/* the destination memory address */

	/* Enable the USART Rx DMA request */
	private_device->base_address->CR3 |= USART_CR3_DMAR;

	/* Let the device driver functions know that dma is enabled */
	private_device->rx.dma_enabled = true;

	/* Install and enable the DMA interrupt vector */
	caribou_vector_install(private_device->rx.dma_vector,isr_uart_dma,private_device);
	caribou_vector_enable(private_device->rx.dma_vector);

	/* Enable the DMA RX Stream */
	channel->CCR |= DMA_CCR_EN;

	return 0;
}

static int chip_uart_disable_dma_rx(chip_uart_private_t* private_device)
{
	DMA_Channel_TypeDef* channel = private_device->rx.dma_channel;

	/* Disable the USART Rx DMA request */
	private_device->base_address->CR3 &= ~USART_CR3_DMAR;

	/* Disable the DMA RX Stream */
	channel->CCR &= ~DMA_CCR_EN;

   	private_device->rx.dma_enabled = false;
   	caribou_bytequeue_set_head_fn(private_device->rx.queue,NULL,NULL);

   	return 0;
}

static int chip_uart_enable_dma_tx(chip_uart_private_t* private_device)
{
	DMA_Channel_TypeDef* channel = private_device->tx.dma_channel;

	chip_uart_disable_dma_tx(private_device);

	/* Set the bytequeue tail-pointer callback function to use DMA byte count... */
	caribou_bytequeue_set_tail_fn(private_device->tx.queue,chip_uart_bytequeue_dma_tail,channel);

	/* Configure the channel remap... */
	if ( (uint32_t)channel > (uint32_t)DMA2_BASE )	/* Is DMA2? */
	{
		DMA2_CSELR->CSELR |= private_device->tx.dma_channel_remap;
	}
	else	/* Must be DMA1... */
	{
		DMA1_CSELR->CSELR |= private_device->tx.dma_channel_remap;
	}

	channel->CCR = 0;
	channel->CCR |=	(
						private_device->tx.dma_prio	|					/* channel priority */
                        DMA_CCR_MINC				|					/* memory increment */
						DMA_CCR_DIR										/* from memory to peripheral */
					);


	channel->CNDTR = (uint16_t)0; /* private_device->tx.queue->size; */	/* the data size */
	channel->CPAR = (uint32_t)private_device->tx.dma_port;				/* the peripheral address */
	channel->CMAR = (uint32_t)private_device->tx.queue->queue;			/* the source memory address */

	/* Enable the USART Tx DMA request */
	private_device->base_address->CR3 |= USART_CR3_DMAT;

	/* Install and enable the DMA interrupt vector */
	caribou_vector_install(private_device->tx.dma_vector,isr_uart_dma,private_device);
	caribou_vector_enable(private_device->tx.dma_vector);

	/* Let the device driver functions know that dma is enabled */
	private_device->tx.dma_enabled = true;

	/* Disable the DMA Tx Stream */
	channel->CCR &= ~DMA_CCR_EN;

	return 0;
}

static int chip_uart_disable_dma_tx(chip_uart_private_t* private_device)
{
	DMA_Channel_TypeDef* channel = private_device->rx.dma_channel;

	/* Disable the USART Rx DMA request */
	private_device->base_address->CR3 &= ~USART_CR3_DMAT;

	/* Disable the DMA RX Stream */
	channel->CCR &= ~DMA_CCR_EN;

   	private_device->tx.dma_enabled = false;

   	return 0;
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
	private_device->base_address->CR1 &= ~USART_CR1_UE;	/* disable the UART */
	if ( config )
	{
		USART_InitTypeDef USART_InitStructure;
		memset(&USART_InitStructure,0,sizeof(USART_InitTypeDef));
		USART_InitStructure.BaudRate = (int)config->baud_rate;
		USART_InitStructure.WordLength = (int)config->word_size;

		switch ( config->word_size )
		{
			default:
			case CARIBOU_UART_WORDSIZE_5:				/* Word size 5 bits */
			case CARIBOU_UART_WORDSIZE_6:				/* Word size 6 bits */
			case CARIBOU_UART_WORDSIZE_7:				/* Word size 7 bits */
			case CARIBOU_UART_WORDSIZE_8:				/* Word size 8 bits */
				USART_InitStructure.WordLength = USART_WORDLENGTH_8B;
				break;
			case CARIBOU_UART_WORDSIZE_9:				/* Word size 9 bits */		
				USART_InitStructure.WordLength = USART_WORDLENGTH_9B;
				break;
		}

		switch ( config->stop_bits )
		{
			case CARIBOU_UART_STOPBITS_05:
				//USART_InitStructure.USART_StopBits = USART_StopBits_0_5;
				//break;
			default:
			case CARIBOU_UART_STOPBITS_1:
				USART_InitStructure.StopBits = USART_STOPBITS_1;
				break;
			case CARIBOU_UART_STOPBITS_15:
				USART_InitStructure.StopBits = USART_STOPBITS_1_5;
				break;
			case CARIBOU_UART_STOPBITS_2:
				USART_InitStructure.StopBits = USART_STOPBITS_2;
				break;
		}

		switch( config->parity_bits )
		{
			default:
			case CARIBOU_UART_PARITY_NONE:
				USART_InitStructure.Parity = USART_PARITY_NONE;
				break;
			case CARIBOU_UART_PARITY_ODD:
				USART_InitStructure.Parity = USART_PARITY_ODD;
				break;
			case CARIBOU_UART_PARITY_EVEN:
				USART_InitStructure.Parity = USART_PARITY_EVEN;
				break;
		}

		switch( config->flow_control )
		{
			default:
			case CARIBOU_UART_FLOW_NONE:		/* no flow control */
			case CARIBOU_UART_FLOW_RTS:			/* RTS flow control */
			case CARIBOU_UART_FLOW_CTS:			/* CTS flow control */
			case CARIBOU_UART_FLOW_RTS_CTS:		/* RTS+CTS flow control */
				break;
		}

		USART_InitStructure.Mode = USART_MODE_TX_RX;
		chip_usart_set_config(private_device->base_address, &USART_InitStructure);
		private_device->base_address->CR1 |= USART_CR1_UE;	/* enable the UART */
		
		if ( config->dma_mode != CARIBOU_UART_DMA_NONE )
		{
			/* dma channel(s) priority */
			switch( config->dma_prio )
			{
				case CARIBOU_UART_DMA_PRIO_DEFAULT:	
					break;
				case CARIBOU_UART_DMA_PRIO_LOW:		
					private_device->rx.dma_prio = 0;			
					break;
				case CARIBOU_UART_DMA_PRIO_MEDIUM:	
					private_device->rx.dma_prio = DMA_CCR_PL_0;		
					break;
				case CARIBOU_UART_DMA_PRIO_HIGH:	
					private_device->rx.dma_prio = DMA_CCR_PL_1;		
					break;
				case CARIBOU_UART_DMA_PRIO_HIGHEST:	
					private_device->rx.dma_prio = DMA_CCR_PL_1|DMA_CCR_PL_0;	
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

		/* Install and Enable the UART Interrupt Vector */
		caribou_vector_install(private_device->vector,isr_uart,private_device);
		caribou_vector_enable(private_device->vector);
		/* Enable the UART peripheral Interrupt Enable Flags */
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
    bool rc = (private_device->base_address->ISR & USART_FLAG_TC) ? false : true;
	return rc;
}

bool chip_uart_tx_ready(void* device)
{
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
    bool rc = (private_device->base_address->ISR & USART_FLAG_TXE) ? true : false;
	return rc;
}

bool chip_uart_rx_ready(void* device)
{
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
	uint32_t sr = private_device->base_address->ISR;
    bool rc = (sr & (USART_FLAG_RXNE|USART_FLAG_ORE)) ? true : false;
	return rc;
}

int chip_uart_tx_data(void* device,int ch)
{
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
	private_device->base_address->TDR = ch;
	return ch;
}

int chip_uart_rx_data(void* device)
{
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
	return private_device->base_address->RDR;
}	

/* start the transmitter, usually enable transmitter interrupts, pend interrupt. */
void chip_uart_tx_start(void* device)
{
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
	if ( private_device->tx.dma_enabled )
	{
		/* Get a pointer to the DMA channel from the private device */
		DMA_Channel_TypeDef* channel = private_device->tx.dma_channel;

		/* Is the channel already running? */
		if ( channel->CCR & DMA_CCR_EN )
		{
			/* If we're already doing a DMA transfer, then nothing to do, else start it... */
			if ( channel->CCR & DMA_CCR_EN )
			{
				uint32_t dmaBytes=0;		/* Number of bytes to transfer */
				uint32_t qHead = (uint32_t)caribou_bytequeue_head(private_device->tx.queue);
				uint32_t qTail = (uint32_t)caribou_bytequeue_tail(private_device->tx.queue);

				if ( qHead > qTail )
				{
					/* We will not wrap around the bytequeue buffer on this pass. */
					dmaBytes = qHead - qTail;
				}
				else
				if ( qHead < qTail )
				{
					/* We will wrap around, so we have to do this in two stages. First, DMA up until the wrap,
					   generate an interrupt at that point, then start the remainder. */
					dmaBytes = caribou_bytequeue_size(private_device->tx.queue) - qTail;
				}

				/* Do we have anything to do? */
				if ( dmaBytes > 0 )
				{
					/* Populate the channel source memory pointer and the number of transfers */
					channel->CMAR = (uint32_t)&private_device->tx.queue->queue[qTail];	/* the source memory address */
					channel->CNDTR = dmaBytes;

					/* Enable channel interrupt after completion */
					channel->CCR |= private_device->tx.dma_tcif;
	
					/* Enable The DMA Tx Stream */
					channel->CCR |= DMA_CCR_EN;
				}
			}
		}
	}
	else
	{
		private_device->base_address->CR1 |= USART_CR1_TXEIE;
	}
}

/* Stop the transmitter, usually disable transmitter interrupts */
void chip_uart_tx_stop(void* device)
{
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
	private_device->base_address->CR1 &= ~USART_CR1_TXEIE;
}

/* UART DMA interrupt service routine */
static void isr_uart_dma(InterruptVector vector,void* arg)
{
	/* private device passed as isr argument */
	chip_uart_private_t* private_device = (chip_uart_private_t*)arg;

	if ( private_device->tx.dma_vector == vector )						
	{
		/* DMA Transmit interrupt */
		if ( private_device->tx.dma->ISR & private_device->tx.dma_tcif )
		{
			/* clear the interrupt */
			private_device->tx.dma->IFCR = private_device->tx.dma_tcif;
		}
	}
	else
	if ( private_device->rx.dma_vector == vector )						
	{
		/* DMA Receiver interrupt */
		if ( private_device->tx.dma->ISR & private_device->rx.dma_tcif )
		{
		}
	}
}

/* UART interrupt service routine */
static void isr_uart(InterruptVector vector,void* arg)
{
	/* private device passed as isr argument */
	chip_uart_private_t* device = (chip_uart_private_t*)arg;
	 
	if ( device->vector == vector )
	{
		// Empty out the UART receiver..
		while ( !device->rx.dma_enabled && chip_uart_rx_ready(device) )
		{
			if ( !caribou_bytequeue_put(device->rx.queue,chip_uart_rx_data(device) ) )
			{
				device->status |= STDIO_STATE_RX_OVERFLOW;
			}
			device->status |= STDIO_STATE_RX_PENDING;
            device->base_address->ICR = USART_ICR_ORECF; // clear the overrun flag 
		}
		// While transmitter empty and tx queue has data, then transmit...
		if ( !caribou_bytequeue_empty(device->tx.queue) )
		{
			// Transmitter shift register is ready?
			if ( chip_uart_tx_ready(device) )
			{
				chip_uart_tx_data(device,caribou_bytequeue_get(device->tx.queue));
			}
		}
		// Disable transmitter empty interrupts so we don't re-enter the interrupt handler.
		if ( caribou_bytequeue_empty(device->tx.queue) )
		{
			chip_uart_tx_stop(device);
		}
		device->base_address->ICR = USART_ICR_ORECF; // clear the overrun flag 
	}
}

#if 1
#define LOCAL_USART_GETCLOCKSOURCE(__HANDLE__,__CLOCKSOURCE__)       \
  do {                                                         \
    if(__HANDLE__ == USART1)                       \
    {                                                          \
       switch(__HAL_RCC_GET_USART1_SOURCE())                   \
       {                                                       \
        case RCC_USART1CLKSOURCE_PCLK2:                        \
          (__CLOCKSOURCE__) = USART_CLOCKSOURCE_PCLK2;         \
          break;                                               \
        case RCC_USART1CLKSOURCE_HSI:                          \
          (__CLOCKSOURCE__) = USART_CLOCKSOURCE_HSI;           \
          break;                                               \
        case RCC_USART1CLKSOURCE_SYSCLK:                       \
          (__CLOCKSOURCE__) = USART_CLOCKSOURCE_SYSCLK;        \
          break;                                               \
        case RCC_USART1CLKSOURCE_LSE:                          \
          (__CLOCKSOURCE__) = USART_CLOCKSOURCE_LSE;           \
          break;                                               \
        default:                                               \
          (__CLOCKSOURCE__) = USART_CLOCKSOURCE_UNDEFINED;     \
          break;                                               \
       }                                                       \
    }                                                          \
    else if(__HANDLE__ == USART2)                  \
    {                                                          \
       switch(__HAL_RCC_GET_USART2_SOURCE())                   \
       {                                                       \
        case RCC_USART2CLKSOURCE_PCLK1:                        \
          (__CLOCKSOURCE__) = USART_CLOCKSOURCE_PCLK1;         \
          break;                                               \
        case RCC_USART2CLKSOURCE_HSI:                          \
          (__CLOCKSOURCE__) = USART_CLOCKSOURCE_HSI;           \
          break;                                               \
        case RCC_USART2CLKSOURCE_SYSCLK:                       \
          (__CLOCKSOURCE__) = USART_CLOCKSOURCE_SYSCLK;        \
          break;                                               \
        case RCC_USART2CLKSOURCE_LSE:                          \
          (__CLOCKSOURCE__) = USART_CLOCKSOURCE_LSE;           \
          break;                                               \
        default:                                               \
          (__CLOCKSOURCE__) = USART_CLOCKSOURCE_UNDEFINED;     \
          break;                                               \
       }                                                       \
    }                                                          \
    else if(__HANDLE__ == USART3)                  \
    {                                                          \
       switch(__HAL_RCC_GET_USART3_SOURCE())                   \
       {                                                       \
        case RCC_USART3CLKSOURCE_PCLK1:                        \
          (__CLOCKSOURCE__) = USART_CLOCKSOURCE_PCLK1;         \
          break;                                               \
        case RCC_USART3CLKSOURCE_HSI:                          \
          (__CLOCKSOURCE__) = USART_CLOCKSOURCE_HSI;           \
          break;                                               \
        case RCC_USART3CLKSOURCE_SYSCLK:                       \
          (__CLOCKSOURCE__) = USART_CLOCKSOURCE_SYSCLK;        \
          break;                                               \
        case RCC_USART3CLKSOURCE_LSE:                          \
          (__CLOCKSOURCE__) = USART_CLOCKSOURCE_LSE;           \
          break;                                               \
        default:                                               \
          (__CLOCKSOURCE__) = USART_CLOCKSOURCE_UNDEFINED;     \
          break;                                               \
       }                                                       \
    }                                                          \
    else                                                       \
    {                                                          \
      (__CLOCKSOURCE__) = USART_CLOCKSOURCE_UNDEFINED;         \
    }                                                          \
  } while(0)
#endif

/**
  * @brief Configure the USART peripheral.
  * @param husart USART handle.
  * @retval HAL status
  */
static uint32_t chip_usart_set_config(USART_TypeDef *usart, USART_InitTypeDef* Init)
{
  uint32_t tmpreg;
  USART_ClockSourceTypeDef				clocksource;
  uint32_t ret        = 0;
  uint16_t brrtemp;
  uint32_t usartdiv                    = 0x00000000;


  /*-------------------------- USART CR1 Configuration -----------------------*/
  /* Clear M, PCE, PS, TE and RE bits and configure
  *  the USART Word Length, Parity and Mode:
  *  set the M bits according to Init->WordLength value
  *  set PCE and PS bits according to Init->Parity value
  *  set TE and RE bits according to Init->Mode value
  *  force OVER8 to 1 to allow to reach the maximum speed (Fclock/8) */
  tmpreg = (uint32_t)Init->WordLength | Init->Parity | Init->Mode | USART_CR1_OVER8;
  MODIFY_REG(usart->CR1, USART_CR1_FIELDS, tmpreg);

  /*---------------------------- USART CR2 Configuration ---------------------*/
  /* Clear and configure the USART Clock, CPOL, CPHA, LBCL STOP and SLVEN bits:
   * set CPOL bit according to Init->CLKPolarity value
   * set CPHA bit according to Init->CLKPhase value
   * set LBCL bit according to Init->CLKLastBit value (used in SPI master mode only)
   * set STOP[13:12] bits according to Init->StopBits value */
  tmpreg = 0;
  //tmpreg = (uint32_t)(USART_CLOCK_ENABLE);
  tmpreg |= (uint32_t)Init->CLKLastBit;
  tmpreg |= ((uint32_t)Init->CLKPolarity | (uint32_t)Init->CLKPhase);
  tmpreg |= (uint32_t)Init->StopBits;
  MODIFY_REG(usart->CR2, USART_CR2_FIELDS, tmpreg);

#if defined(USART_PRESC_PRESCALER)
  /*-------------------------- USART PRESC Configuration -----------------------*/
  /* Configure
   * - USART Clock Prescaler : set PRESCALER according to Init->ClockPrescaler value */
  MODIFY_REG(usart->PRESC, USART_PRESC_PRESCALER, Init->ClockPrescaler);
#endif

  /*-------------------------- USART BRR Configuration -----------------------*/
  /* BRR is filled-up according to OVER8 bit setting which is forced to 1     */
  LOCAL_USART_GETCLOCKSOURCE(usart, clocksource);

  switch (clocksource)
  {
    case USART_CLOCKSOURCE_PCLK1:
#if defined(USART_PRESC_PRESCALER)
      usartdiv = (uint32_t)(USART_DIV_SAMPLING8(HAL_RCC_GetPCLK1Freq(), Init->BaudRate, Init->ClockPrescaler));
#else
      usartdiv = (uint32_t)(USART_DIV_SAMPLING8(HAL_RCC_GetPCLK1Freq(), Init->BaudRate));
#endif
      break;
    case USART_CLOCKSOURCE_PCLK2:
#if defined(USART_PRESC_PRESCALER)
      usartdiv = (uint32_t)(USART_DIV_SAMPLING8(HAL_RCC_GetPCLK2Freq(), Init->BaudRate, Init->ClockPrescaler));
#else
      usartdiv = (uint32_t)(USART_DIV_SAMPLING8(HAL_RCC_GetPCLK2Freq(), Init->BaudRate));
#endif
      break;
    case USART_CLOCKSOURCE_HSI:
#if defined(USART_PRESC_PRESCALER)
      usartdiv = (uint32_t)(USART_DIV_SAMPLING8(HSI_VALUE, Init->BaudRate, Init->ClockPrescaler));
#else
      usartdiv = (uint32_t)(USART_DIV_SAMPLING8(HSI_VALUE, Init->BaudRate));
#endif
      break;
    case USART_CLOCKSOURCE_SYSCLK:
#if defined(USART_PRESC_PRESCALER)
      usartdiv = (uint32_t)(USART_DIV_SAMPLING8(HAL_RCC_GetSysClockFreq(), Init->BaudRate, Init->ClockPrescaler));
#else
      usartdiv = (uint32_t)(USART_DIV_SAMPLING8(HAL_RCC_GetSysClockFreq(), Init->BaudRate));
#endif
      break;
    case USART_CLOCKSOURCE_LSE:
#if defined(USART_PRESC_PRESCALER)
      usartdiv = (uint32_t)(USART_DIV_SAMPLING8(LSE_VALUE, Init->BaudRate, Init->ClockPrescaler));
#else
      usartdiv = (uint32_t)(USART_DIV_SAMPLING8(LSE_VALUE, Init->BaudRate));
#endif
      break;
    default:
      ret = HAL_ERROR;
      break;
  }

  /* USARTDIV must be greater than or equal to 0d16 and smaller than or equal to ffff */
  if ((usartdiv >= USART_BRR_MIN) && (usartdiv <= USART_BRR_MAX))
  {
    brrtemp = (uint16_t)(usartdiv & 0xFFF0U);
    brrtemp |= (uint16_t)((usartdiv & (uint16_t)0x000FU) >> 1U);
    usart->BRR = brrtemp;
  }
  else
  {
    ret = HAL_ERROR;
  }

#if defined(USART_CR1_FIFOEN)
  /* Initialize the number of data to process during RX/TX ISR execution */
  husart->NbTxDataToProcess = 1U;
  husart->NbRxDataToProcess = 1U;
#endif

  return ret;
}
