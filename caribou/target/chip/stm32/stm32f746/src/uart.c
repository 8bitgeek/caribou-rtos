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

#include <stm32f7xx.h>
#include <stm32f7xx_hal_gpio.h>
#include <stm32f7xx_hal_uart.h>
#include <stm32f7xx_hal_rcc.h>
#include <stm32f7xx_hal_dma.h>

typedef struct
{
	caribou_bytequeue_t*	queue;				/// The data queue
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
		{NULL,DMA2_Stream5,DMA_CHANNEL_4,(uint32_t)&USART1->RDR,DMA_PRIORITY_LOW},		/// The RX queue
		{NULL,DMA2_Stream7,DMA_CHANNEL_4,(uint32_t)&USART1->TDR,DMA_PRIORITY_LOW},		/// The TX queue
	},
	// USART2
	{ 
		(USART_TypeDef*)USART2_BASE,
		USART2_IRQn,	
		CARIBOU_UART_CONFIG_INIT, 
		0, 
		{NULL,DMA1_Stream5,DMA_CHANNEL_4,(uint32_t)&USART2->RDR,DMA_PRIORITY_LOW},		/// The RX queue
		{NULL,DMA1_Stream6,DMA_CHANNEL_4,(uint32_t)&USART2->TDR,DMA_PRIORITY_LOW},		/// The TX queue
	},
	// USART3
	{ 
		(USART_TypeDef*)USART3_BASE,	
		USART3_IRQn,	
		CARIBOU_UART_CONFIG_INIT, 
		0, 
		{NULL,DMA1_Stream1,DMA_CHANNEL_4,(uint32_t)&USART3->RDR,DMA_PRIORITY_LOW},		/// The RX queue
		{NULL,DMA1_Stream3,DMA_CHANNEL_4,(uint32_t)&USART3->TDR,DMA_PRIORITY_LOW},		/// The TX queue
	},
	// UART4
	{ 
		(USART_TypeDef*)UART4_BASE,	
		UART4_IRQn,	
		CARIBOU_UART_CONFIG_INIT, 
		0, 
		{NULL,DMA1_Stream2,DMA_CHANNEL_4,(uint32_t)&UART4->RDR,DMA_PRIORITY_LOW},		/// The RX queue
		{NULL,DMA1_Stream4,DMA_CHANNEL_4,(uint32_t)&UART4->TDR,DMA_PRIORITY_LOW},		/// The TX queue
	},
	// UART5
	{ 
		(USART_TypeDef*)UART5_BASE,	
		UART5_IRQn,	
		CARIBOU_UART_CONFIG_INIT, 
		0, 
		{NULL,DMA1_Stream0,DMA_CHANNEL_4,(uint32_t)&UART5->RDR,DMA_PRIORITY_LOW},		/// The RX queue
		{NULL,DMA1_Stream7,DMA_CHANNEL_4,(uint32_t)&UART5->TDR,DMA_PRIORITY_LOW},		/// The TX queue
	},
	// USART6
	{ 
		(USART_TypeDef*)USART6_BASE,	
		USART6_IRQn,	
		CARIBOU_UART_CONFIG_INIT, 
		0, 
		{NULL,DMA2_Stream2,DMA_CHANNEL_5,(uint32_t)&USART6->RDR,DMA_PRIORITY_LOW},		/// The RX queue
		{NULL,DMA2_Stream6,DMA_CHANNEL_5,(uint32_t)&USART6->TDR,DMA_PRIORITY_LOW},		/// The TX queue
	},
	{	0, 
		0, 
		{0,0,0,0,0},
		0, 
		{NULL,0,0,0},
		{NULL,0,0,0},
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

#define UART_INTERRUPT_MASK	(USART_CR1_RXNEIE)

/// Enables device interrupts.
int chip_uart_int_enable(void* device)
{
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
	int rc = chip_uart_int_enabled(private_device);
    private_device->base_address->CR1 |= UART_INTERRUPT_MASK;
	return rc;
}

/// Disables device interrupts.
/// @return the previous state
int chip_uart_int_disable(void* device)
{
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
	int rc = chip_uart_int_enabled(private_device);
    private_device->base_address->CR1 &= ~UART_INTERRUPT_MASK;
	return rc;
}

/// Interrupts Enabled?
int chip_uart_int_enabled(void* device)
{
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
	int rc = (private_device->base_address->CR1 & (USART_IT_RXNE & USART_IT_TXE)) ? 1 : 0;
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
static void uart_enable(chip_uart_private_t* device)
{
	USART_Cmd(device->base_address, ENABLE);
}

/// Disables transmitting and receiving.
static void uart_disable(chip_uart_private_t* device)
{
	USART_Cmd(device->base_address, DISABLE);
}

static int chip_uart_disable_dma(chip_uart_private_t* private_device)
{
#if 0
	DMA_DeInit(private_device->rx.dma_stream);
	DMA_DeInit(private_device->tx.dma_stream);

	/* Disable the USART Rx DMA request */
	USART_DMACmd(private_device->base_address, USART_DMAReq_Rx, DISABLE);
	USART_DMACmd(private_device->base_address, USART_DMAReq_Tx, DISABLE);

	/* Disable DMA Stream Half Transfer and Transfer Complete interrupt */
	DMA_ITConfig(private_device->rx.dma_stream, DMA_IT_TC, DISABLE);
	DMA_ITConfig(private_device->rx.dma_stream, DMA_IT_HT, DISABLE);

	DMA_ITConfig(private_device->tx.dma_stream, DMA_IT_TC, DISABLE);
	DMA_ITConfig(private_device->tx.dma_stream, DMA_IT_HT, DISABLE);

	/* Disable the DMA RX Stream */
	DMA_Cmd(private_device->rx.dma_stream, ENABLE);
	DMA_Cmd(private_device->tx.dma_stream, ENABLE);
#endif

}

static int chip_uart_enable_dma(chip_uart_private_t* private_device)
{
	DMA_InitTypeDef  DMA_InitStructure;

#if 0
	chip_uart_disable_dma(private_device);

	// RX
	DMA_InitStructure.DMA_Channel = private_device->rx.dma_channel;
	DMA_InitStructure.DMA_DIR = DMA_DIR_PeripheralToMemory; // Receive
	DMA_InitStructure.DMA_Memory0BaseAddr = (uint32_t)private_device->rx.queue->queue;
	DMA_InitStructure.DMA_BufferSize = (uint16_t)private_device->rx.queue->size;
	DMA_InitStructure.DMA_PeripheralBaseAddr = private_device->rx.dma_source;
	DMA_InitStructure.DMA_PeripheralInc = DMA_PeripheralInc_Disable;
	DMA_InitStructure.DMA_MemoryInc = DMA_MemoryInc_Enable;
	DMA_InitStructure.DMA_PeripheralDataSize = DMA_PeripheralDataSize_Byte;
	DMA_InitStructure.DMA_MemoryDataSize = DMA_MemoryDataSize_Byte;
	DMA_InitStructure.DMA_Mode = DMA_Mode_Circular;
	DMA_InitStructure.DMA_Priority = private_device->rx.dma_prio;
	DMA_InitStructure.DMA_FIFOMode = DMA_FIFOMode_Enable;
	DMA_InitStructure.DMA_FIFOThreshold = DMA_FIFOThreshold_Full;
	DMA_InitStructure.DMA_MemoryBurst = DMA_MemoryBurst_Single;
	DMA_InitStructure.DMA_PeripheralBurst = DMA_PeripheralBurst_Single;

	DMA_Init(private_device->rx.dma_stream, &DMA_InitStructure);

	/* Enable the USART Rx DMA request */
	USART_DMACmd(private_device->base_address, USART_DMAReq_Rx, ENABLE);

	/* Enable DMA Stream Half Transfer and Transfer Complete interrupt */
	DMA_ITConfig(private_device->rx.dma_stream, DMA_IT_TC, ENABLE);
	DMA_ITConfig(private_device->rx.dma_stream, DMA_IT_HT, ENABLE);

	/* Enable the DMA RX Stream */
	DMA_Cmd(private_device->rx.dma_stream, ENABLE);
#endif

#if 0
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

	/* Disable the DMA TX Stream */
	DMA_Cmd(private_device->tx.dma_stream, DISABLE);  /* FIXME use ENABLE/DISABLE to control DMA TX flow */
#endif
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
	
	/*##-1- Configure the UART peripheral ######################################*/
	/* Put the USART peripheral in the Asynchronous mode (UART Mode) */
	/*
	 * UART configured as follows:
	 *	- Word Length = 8 Bits
	 *	- Stop Bit = One Stop bit
	 *	- Parity = None
	 *	- BaudRate = 9600 baud
	 *	- Hardware flow control disabled (RTS and CTS signals) 
	 */
	if ( config )
	{
		UART_HandleTypeDef			UartHandle;
		UartHandle.Instance        = private_device->base_address;
		UartHandle.Init.BaudRate   = (int)config->baud_rate;

        switch ( config->word_size )
		{
			default:
			case CARIBOU_UART_WORDSIZE_5:				/* Word size 5 bits */
			case CARIBOU_UART_WORDSIZE_6:				/* Word size 6 bits */
			case CARIBOU_UART_WORDSIZE_7:				/* Word size 7 bits */
			case CARIBOU_UART_WORDSIZE_8:				/* Word size 8 bits */
				UartHandle.Init.WordLength = UART_WORDLENGTH_8B;
				break;
			case CARIBOU_UART_WORDSIZE_9:				/* Word size 9 bits */		
				UartHandle.Init.WordLength = UART_WORDLENGTH_9B;
				break;
		}

		switch ( config->stop_bits )
		{
			default:
			case CARIBOU_UART_STOPBITS_05:
			case CARIBOU_UART_STOPBITS_1:
			case CARIBOU_UART_STOPBITS_15:
				UartHandle.Init.StopBits = UART_STOPBITS_1;
				break;
			case CARIBOU_UART_STOPBITS_2:
				UartHandle.Init.StopBits = UART_STOPBITS_2;
				break;
		}
	
		switch( config->parity_bits )
		{
			default:
			case CARIBOU_UART_PARITY_NONE:
				UartHandle.Init.Parity = USART_PARITY_NONE;
				break;
			case CARIBOU_UART_PARITY_ODD:
				UartHandle.Init.Parity = USART_PARITY_ODD;
				break;
			case CARIBOU_UART_PARITY_EVEN:
				UartHandle.Init.Parity = USART_PARITY_EVEN;
				break;
		}

		switch( config->flow_control )
		{
			default:
			case CARIBOU_UART_FLOW_NONE:		/* no flow control */
				UartHandle.Init.HwFlowCtl = UART_HWCONTROL_NONE;
				break;
			case CARIBOU_UART_FLOW_RTS:			/* RTS flow control */
				UartHandle.Init.HwFlowCtl = UART_HWCONTROL_RTS;
				break;
			case CARIBOU_UART_FLOW_CTS:			/* CTS flow control */
				UartHandle.Init.HwFlowCtl = UART_HWCONTROL_CTS;
				break;
			case CARIBOU_UART_FLOW_RTS_CTS:		/* RTS+CTS flow control */
				UartHandle.Init.HwFlowCtl = UART_HWCONTROL_RTS_CTS;
				break;
		}
		
		UartHandle.Init.Mode = UART_MODE_TX_RX;
		UartHandle.AdvancedInit.AdvFeatureInit = UART_ADVFEATURE_NO_INIT; 
		if(HAL_UART_DeInit(&UartHandle) == HAL_OK)
		{
			if(HAL_UART_Init(&UartHandle) == HAL_OK)
			{
				private_device->base_address->CR1 |= USART_CR1_UE; /* Enable the USART */
				if(config->dma_mode)
				{
					chip_uart_enable_dma(private_device);
				}
				else
				{
					private_device->base_address->CR1 &= ~(	USART_CR1_RXNEIE |
															USART_CR1_TXEIE  |
															USART_CR1_TCIE   |
															USART_CR1_CMIE   |
															USART_CR1_IDLEIE |
															USART_CR1_EOBIE  |
															USART_CR1_RTOIE  );
					caribou_vector_install(private_device->vector,isr_uart,private_device);
					caribou_vector_enable(private_device->vector);
					private_device->base_address->CR1 |= USART_CR1_RXNEIE; /* Enable RX Interrupts */ 
				}
				rc=0;
			}
		}
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
    bool rc = (private_device->base_address->ISR & USART_ISR_TC) ? false : true;
	return rc;
}

bool chip_uart_tx_ready(void* device)
{
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
    bool rc = (private_device->base_address->ISR & USART_ISR_TXE) ? true : false;
	return rc;
}

bool chip_uart_rx_ready(void* device)
{
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
	uint32_t sr = private_device->base_address->ISR;
    bool rc = (sr & USART_ISR_RXNE) ? true : false;
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
	private_device->base_address->CR1 |= USART_CR1_TXEIE;
}

/* Stop the transmitter, usually disable transmitter interrupts */
void chip_uart_tx_stop(void* device)
{
	chip_uart_private_t* private_device = (chip_uart_private_t*)device;
	private_device->base_address->CR1 &= ~USART_CR1_TXEIE;
	private_device->base_address->ICR |= USART_ICR_TCCF;
}

/// UART interrupt service routine
void isr_uart(InterruptVector vector,void* arg)
{
	chip_uart_private_t* device = (chip_uart_private_t*)arg; // private device passed as isr argument
	if ( device->vector == vector )
	{
		// Empty out the UART receiver..
		while ( chip_uart_rx_ready(device) )
		{
			if ( !caribou_bytequeue_put(device->rx.queue,chip_uart_rx_data(device) ) )
			{
				device->status |= STDIO_STATE_RX_OVERFLOW;
			}
			device->status |= STDIO_STATE_RX_PENDING;
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

/**
  * @brief  Tx Transfer completed callback
  * @param  UartHandle: UART handle. 
  * @note   This example shows a simple way to report end of IT Tx transfer, and 
  *         you can add your own implementation. 
  * @retval None
  */
void HAL_UART_TxCpltCallback(UART_HandleTypeDef *UartHandle)
{
  /* Set transmission flag: transfer complete */
  //UartReady = SET;

  
}

/**
  * @brief  Rx Transfer completed callback
  * @param  UartHandle: UART handle
  * @note   This example shows a simple way to report end of DMA Rx transfer, and 
  *         you can add your own implementation.
  * @retval None
  */
void HAL_UART_RxCpltCallback(UART_HandleTypeDef *UartHandle)
{
  /* Set transmission flag: transfer complete */
  //UartReady = SET;
  
  
}

/**
  * @brief  UART error callbacks
  * @param  UartHandle: UART handle
  * @note   This example shows a simple way to report transfer error, and you can
  *         add your own implementation.
  * @retval None
  */
void HAL_UART_ErrorCallback(UART_HandleTypeDef *UartHandle)
{
    Error_Handler();
}


