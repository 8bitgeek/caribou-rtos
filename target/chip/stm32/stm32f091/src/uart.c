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

#include <stm32f0xx.h>
#include <stm32f0xx_gpio.h>
#include <stm32f0xx_usart.h>
#include <stm32f0xx_rcc.h>
#include <stm32f0xx_dma.h>

//  DMA1_Ch1_IRQn               = 9,      /*!< DMA1 Channel 1 Interrupt                                        */
//  DMA1_Ch2_3_DMA2_Ch1_2_IRQn  = 10,     /*!< DMA1 Channel 2 and 3 & DMA2 Channel 1 and 2 Interrupts          */
//  DMA1_Ch4_7_DMA2_Ch3_5_IRQn  = 11,     /*!< DMA1 Channel 4 to 7 & DMA2 Channel 3 to 5 Interrupts            */

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
    uint32_t				dma_prio;			/// The DMA Channel priority
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
		{	/// The RX queue DMA1 Channel 1
			NULL,								/// I/O Byte Queue
			false,								/// DMA Enabled
			DMA1,								/// DMA Controller
			DMA_RMPCR1_CH1_USART1_RX,			/// DMA Channel Remap
			DMA1_Channel1,						/// DMA Channel
			DMA1_Ch1_IRQn,						/// DMA Channel Interrupt Vector
            DMA_ISR_TCIF1,						/// DMA Transfer Complete Interrupt Flag.
			(uint32_t)&USART1->RDR,				/// Receive Data Register
			DMA_Priority_Low					/// DMA Channel Priority
		},		
		{	/// The TX queue DMA1 Channel 4
			NULL,								/// I/O Byte Queue
			false,								/// DMA Enabled
			DMA1,								/// DMA Controller
			DMA_RMPCR1_CH4_USART1_TX,			/// DMA Channel Remap
			DMA1_Channel4,						/// DMA Channel
            DMA1_Ch4_7_DMA2_Ch3_5_IRQn,			/// DMA Channel Interrupt Vector
            DMA_ISR_TCIF4,						/// DMA Transfer Complete Interrupt Flag.
			(uint32_t)&USART1->TDR,				/// Transmit Data Register
			DMA_Priority_Low					/// DMA Channel Priority
		},		
	},
	// USART2
	{ 
		(USART_TypeDef*)USART2_BASE,			/// The base USART port address.
		USART2_IRQn,							/// The interrupt vector for the USART port.
		CARIBOU_UART_CONFIG_INIT,				/// The UART BAUD rate
		0,										/// The device driver status bits.
		{	/// The RX queue DMA1 Channel 5
			NULL,
			false,
			DMA1,
			DMA_RMPCR1_CH5_USART2_RX,
			DMA1_Channel5,
            DMA1_Ch4_7_DMA2_Ch3_5_IRQn,
            DMA_ISR_TCIF5,						/// DMA Transfer Complete Interrupt Flag.
			(uint32_t)&USART2->RDR,
			DMA_Priority_Low
		},		
		{	/// The TX queue DMA1 Channel 7
			NULL,
			false,
			DMA1,
			DMA_RMPCR1_CH7_USART2_TX,
			DMA1_Channel7,
            DMA1_Ch4_7_DMA2_Ch3_5_IRQn,
            DMA_ISR_TCIF7,						/// DMA Transfer Complete Interrupt Flag.
			(uint32_t)&USART2->TDR,
			DMA_Priority_Low
		},		
	},
	// USART3
	{ 
		(USART_TypeDef*)USART3_BASE,			/// The base USART port address.
		USART3_8_IRQn,							/// The interrupt vector for the USART port.
		CARIBOU_UART_CONFIG_INIT,				/// The UART BAUD rate
		0,										/// The device driver status bits.
		{	/// The RX queue DMA1 Channel 6
			NULL,
			false,
			DMA1,
			DMA_RMPCR1_CH6_USART3_RX,
			DMA1_Channel6,
            DMA1_Ch4_7_DMA2_Ch3_5_IRQn,
            DMA_ISR_TCIF6,						/// DMA Transfer Complete Interrupt Flag.
			(uint32_t)&USART3->RDR,
			DMA_Priority_Low
		},		
		{	/// The TX queue DMA2 Channel 1
			NULL,
			false,
			DMA2,
			DMA_RMPCR2_CH1_USART3_TX,
			DMA2_Channel1,
            DMA1_Ch2_3_DMA2_Ch1_2_IRQn,
            DMA_ISR_TCIF1,						/// DMA Transfer Complete Interrupt Flag.
			(uint32_t)&USART3->TDR,
			DMA_Priority_Low
		},		
	},
	// USART4
	{ 
		(USART_TypeDef*)USART4_BASE,			/// The base USART port address.
		USART3_8_IRQn,							/// The interrupt vector for the USART port.
		CARIBOU_UART_CONFIG_INIT,				/// The UART BAUD rate
		0,										/// The device driver status bits.
		{	/// The RX queue DMA2 Channel 2
			NULL,
			false,
			DMA2,
			DMA_RMPCR2_CH2_USART4_RX,
			DMA2_Channel2,
            DMA1_Ch2_3_DMA2_Ch1_2_IRQn,
            DMA_ISR_TCIF2,						/// DMA Transfer Complete Interrupt Flag.
			(uint32_t)&USART4->RDR,
			DMA_Priority_Low
		},		
		{	/// The TX queue DMA2 Channel 4
			NULL,
			false,
			DMA2,
			DMA_RMPCR2_CH4_USART4_TX,
			DMA2_Channel4,
            DMA1_Ch4_7_DMA2_Ch3_5_IRQn,
            DMA_ISR_TCIF4,						/// DMA Transfer Complete Interrupt Flag.
			(uint32_t)&USART4->TDR,
			DMA_Priority_Low
		},		
	},
	// USART5
	{ 
		(USART_TypeDef*)USART5_BASE,			/// The base USART port address.
		USART3_8_IRQn,							/// The interrupt vector for the USART port.
		CARIBOU_UART_CONFIG_INIT,				/// The UART BAUD rate
		0,										/// The device driver status bits.
		{	/// The RX queue DMA2 Channel 3
			NULL,
			false,
			DMA2,
			DMA_RMPCR2_CH3_USART5_RX,
			DMA2_Channel3,
            DMA1_Ch4_7_DMA2_Ch3_5_IRQn,
            DMA_ISR_TCIF3,						/// DMA Transfer Complete Interrupt Flag.
			(uint32_t)&USART5->RDR,
			DMA_Priority_Low
		},		
		{	/// The TX queue DMA1 Channel 4
			NULL,
			false,
			DMA1,
			DMA_RMPCR2_CH5_USART5_TX,
			DMA2_Channel5,
            DMA1_Ch4_7_DMA2_Ch3_5_IRQn,
            DMA_ISR_TCIF4,						/// DMA Transfer Complete Interrupt Flag.
			(uint32_t)&USART5->TDR,
			DMA_Priority_Low
		},		
	},
	// USART6
	{ 
		(USART_TypeDef*)USART6_BASE,			/// The base USART port address.
		USART3_8_IRQn,							/// The interrupt vector for the USART port.
		CARIBOU_UART_CONFIG_INIT,				/// The UART BAUD rate
		0,										/// The device driver status bits.
		{	/// The RX queue DMA2 Channel 2
			NULL,
			false,
			DMA2,
			DMA_RMPCR2_CH2_USART6_RX,
			DMA2_Channel2,
			DMA1_Ch2_3_DMA2_Ch1_2_IRQn,
			DMA_ISR_TCIF2,
			(uint32_t)&USART1->RDR,
			DMA_Priority_Low
		},		
		{	/// The TX queue DMA1 Channel 1
			NULL,
			false,
			DMA2,
			DMA_RMPCR2_CH1_USART6_TX,
			DMA2_Channel1,
			DMA1_Ch2_3_DMA2_Ch1_2_IRQn,
			DMA_ISR_TCIF1,
			(uint32_t)&USART6->TDR,
			DMA_Priority_Low
		},		
	},
	// USART7
	{ 
		(USART_TypeDef*)USART7_BASE,			/// The base USART port address.
		USART3_8_IRQn,							/// The interrupt vector for the USART port.
		CARIBOU_UART_CONFIG_INIT,				/// The UART BAUD rate
		0,										/// The device driver status bits.
		{	/// The RX queue no DMA
			NULL,
			false,
			NULL,
			0,
			0,
			0,
			0,
			(uint32_t)&USART7->RDR,
			0
		},		
		{	/// The TX queue no DMA
			NULL,
			false,
			NULL,
			0,
			0,
			0,
			0,
			(uint32_t)&USART7->TDR,
			0
		},		
	},
	// USART8
	{ 
		(USART_TypeDef*)USART8_BASE,			/// The base USART port address.
		USART3_8_IRQn,							/// The interrupt vector for the USART port.
		CARIBOU_UART_CONFIG_INIT,				/// The UART BAUD rate
		0,										/// The device driver status bits.
		{	/// The RX queue No DMA
			NULL,
			false,
			NULL,
			0,
			0,
			0,
			0,
			(uint32_t)&USART8->RDR,
			0
		},		
		{	/// The TX queue No DMA
			NULL,
			false,
			NULL,
			0,
			0,
			0,
			0,
			(uint32_t)&USART8->TDR,
			0
		},		
	},
	{	
		0,
		0, 
		{0,0,0,0,0},
		0, 
		{NULL,0,0,NULL,NULL,0},					/// The RX queue
		{NULL,0,0,NULL,NULL,0},					/// The TX queue
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
#if !defined(CARIBOU_COMPACT)  /* Value-Line STM32F0xx or only use first USART */
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
	{ 
		&device_info[6], 
		caribou_uart_private_readfn, 
		caribou_uart_private_writefn, 
		caribou_uart_private_readqueuefn, 
		caribou_uart_private_writequeuefn, 
		caribou_uart_private_statefn 
	},
	{ 
		&device_info[7], 
		caribou_uart_private_readfn, 
		caribou_uart_private_writefn, 
		caribou_uart_private_readqueuefn, 
		caribou_uart_private_writequeuefn, 
		caribou_uart_private_statefn 
	},
#endif
	{ NULL, NULL, NULL, NULL, NULL, NULL },
};

static int chip_uart_enable_dma_rx(chip_uart_private_t* private_device);
static int chip_uart_disable_dma_rx(chip_uart_private_t* private_device);

static int chip_uart_enable_dma_tx(chip_uart_private_t* private_device);
static int chip_uart_disable_dma_tx(chip_uart_private_t* private_device);

static void isr_uart_dma(InterruptVector vector,void* arg);
static void isr_uart(InterruptVector vector,void* arg);

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
	//uint32_t channel_remap = private_device->rx.dma_channel_remap;

	chip_uart_disable_dma_rx(private_device);

	/* Set the bytequeue head-pointer callback function to use DMA byte count... */
	caribou_bytequeue_set_head_fn(private_device->rx.queue,chip_uart_bytequeue_dma_head,channel);

	/* Configure the channel remap... */
	if ( (uint32_t)channel > (uint32_t)DMA2_BASE )	/* Is DMA2? */
	{
		DMA2->RMPCR |= private_device->rx.dma_channel_remap;
	}
	else	/* Must be DMA1... */
	{
		DMA1->RMPCR |= private_device->rx.dma_channel_remap;
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
	private_device->base_address->CR3 |= USART_DMAReq_Rx;

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
	//uint32_t channel_remap = private_device->rx.dma_channel_remap;

	/* Disable the USART Rx DMA request */
	private_device->base_address->CR3 &= ~USART_DMAReq_Rx;

	/* Disable the DMA RX Stream */
	channel->CCR &= ~DMA_CCR_EN;

   	private_device->rx.dma_enabled = false;
   	caribou_bytequeue_set_head_fn(private_device->rx.queue,NULL,NULL);

   	return 0;
}

static int chip_uart_enable_dma_tx(chip_uart_private_t* private_device)
{
	DMA_Channel_TypeDef* channel = private_device->tx.dma_channel;
	//uint32_t channel_remap = private_device->tx.dma_channel_remap;

	chip_uart_disable_dma_tx(private_device);

	/* Set the bytequeue tail-pointer callback function to use DMA byte count... */
	caribou_bytequeue_set_tail_fn(private_device->tx.queue,chip_uart_bytequeue_dma_tail,channel);

	/* Configure the channel remap... */
	if ( (uint32_t)channel > (uint32_t)DMA2_BASE )	/* Is DMA2? */
	{
		DMA2->RMPCR |= private_device->tx.dma_channel_remap;
	}
	else	/* Must be DMA1... */
	{
		DMA1->RMPCR |= private_device->tx.dma_channel_remap;
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
	private_device->base_address->CR3 |= USART_DMAReq_Tx;

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
	//uint32_t channel_remap = private_device->rx.dma_channel_remap;

	/* Disable the USART Rx DMA request */
	private_device->base_address->CR3 &= ~USART_DMAReq_Tx;

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
		private_device->base_address->CR1 |= USART_CR1_UE;	/* enable the UART */
		
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

		/* If we're already doing a DMA transfer, then nothing to do, else start it... */
		if ( !(channel->CCR & DMA_CCR_EN) )
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
				channel->CCR |= DMA_CCR_TCIE;

				/* Enable The DMA Tx Stream */
				channel->CCR |= DMA_CCR_EN;
			}
		}
	}
	else
	{
		if ( private_device->config.flow_control & CARIBOU_UART_FLOW_RS485_GPIO )
		{
			caribou_gpio_set(private_device->config.gpio);
		}
		private_device->base_address->CR1 |= USART_CR1_TXEIE;
	}
}

/* Stop the transmitter, usually disable transmitter interrupts */
void chip_uart_tx_stop(void* device)
{
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
    	/*
	 ** NOTE ON RS485: We want to wait until the last byte is completely transmitted
	 ** before we release the TX/RX gate. This means we have to spin-wait 
	 ** for the last bytes to finish. This is obviously sub-optimal when called
	 ** from an interrupt handler.
	 */
	if ( private_device->config.flow_control & CARIBOU_UART_FLOW_RS485_GPIO )
	{
		while ( chip_uart_tx_busy(device) );
		caribou_gpio_reset(private_device->config.gpio);
	}
	DMA_Channel_TypeDef* channel        = private_device->tx.dma_channel;
	channel->CCR &= ~DMA_CCR_EN;
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
			DMA_Channel_TypeDef* channel = private_device->tx.dma_channel;
			/* clear the interrupt */
			private_device->tx.dma->IFCR = private_device->tx.dma_tcif;
            channel->CCR &= DMA_CCR_EN;
            chip_uart_tx_start( private_device );
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

