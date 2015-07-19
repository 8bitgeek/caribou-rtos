/******************************************************************************
* Copyright © 2005-2012 by Pike Aerospace Research Corporation
* All Rights Reserved
*
*   This file is part of DaddyBASIC.
*
*   DaddyBASIC is free software: you can redistribute it and/or modify
*   it under the terms of the Beerware License Version 43.
*
* ----------------------------------------------------------------------------
* "THE BEER-WARE LICENSE" (Revision 43):
* <mike@pikeaero.com> wrote this file. As long as you retain this notice you
* can do whatever you want with this stuff. If we meet some day, and you think
* this stuff is worth it, you can buy me a beer in return ~ Mike Sharkey
* ----------------------------------------------------------------------------
******************************************************************************/
#include "cuart.h"

#define DEFAULT_RX_BUFFERSZ	16
#define DEFAULT_TX_BUFFERSZ	16

typedef struct
{
	USART_TypeDef*				base;			/// The base USART port address.
	InterruptVector				vector;			/// the interrupt vector for the USART port.
	uint8_t						rcc_enr_offset;	/// RCC enable register offset.
	uint32_t					rcc_enr_bit;	/// ECC peripheral enable bit.
	uint16_t					rx_gpio_pin;	/// The GPIO pin to enable the Rx on.
	uint16_t					tx_gpio_pin;	/// The GPIO pin to enable the Tx on.
} port_t;

static port_t ports[] =
{
	{ (USART_TypeDef*)USART1_BASE, Vector_USART1, 0x18, RCC_APB2ENR_USART1EN, GPIO_Pin_10, GPIO_Pin_9 },
	{ (USART_TypeDef*)USART2_BASE, Vector_USART2, 0x1C, RCC_APB1ENR_USART2EN, GPIO_Pin_3,  GPIO_Pin_2  },
};

namespace CARIBOU
{
	#define inherited CUart_Interface

	CUart_Device::CUart_Device(int port, uint32_t baud, uint32_t mode)
	: inherited(port,baud,mode)
	, mPort(port)
	, mBase(ports[mPort].base)
	{
		uint32_t* rcc_enr = (uint32_t*)(RCC_BASE+ports[mPort].rcc_enr_offset);
		GPIO_InitTypeDef  GPIO_InitStructure;
		USART_InitTypeDef USART_InitStructure;
		USART_DeInit(mBase);
		/// Enable GPIOA clock if it's not enabled already...
		RCC->AHBENR |= RCC_AHBENR_GPIOAEN;
		/// Enable the USART clock if it is not enabled already...
		rcc_enr[0] |= ports[mPort].rcc_enr_bit;
		/// Configure USART Rx (PA10) as input floating.
		GPIO_InitStructure.GPIO_Pin   = ports[mPort].rx_gpio_pin;
		GPIO_InitStructure.GPIO_Mode  = GPIO_Mode_IN;
		GPIO_InitStructure.GPIO_PuPd  = GPIO_PuPd_NOPULL;
		GPIO_Init(GPIOA, &GPIO_InitStructure);
		/// Configure USART Tx (PA9) as alternate function push-pull
		GPIO_InitStructure.GPIO_Pin   = ports[mPort].rx_gpio_pin;
		GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
		GPIO_InitStructure.GPIO_Mode  = GPIO_Mode_AF;
		GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;

		GPIO_Init(GPIOA, &GPIO_InitStructure);

		setBaud( baud );
		rxBuffer().resize(DEFAULT_RX_BUFFERSZ);
		txBuffer().resize(DEFAULT_TX_BUFFERSZ);
		CObject::installVectorIRQ(vector(),this);
		driver_vector_enable(vector());
		enable();
	}

	CUart_Device::~CUart_Device()
	{
		CObject::disableVector(vector());
		driver_vector_disable(vector());
		CObject::removeVectorIRQ(this);
	}

	/**
	** Get the device interrupt vector
	*/
	InterruptVector CUart_Device::vector()
	{
		return ports[mPort].vector;
	}

	/**
	* Open the device.
	*/
	bool CUart_Device::open(CIODevice::IOMode_t mode)
	{
		setMode(mode);
		enable();
	}

	/**
	* Close the device.
	*/
	void CUart_Device::close()
	{
		disable();
	}

	/**
	* Is the device open?
	*/
	bool CUart_Device::isOpen()
	{
		return true; /* FIXME */
	}

	/**
	* Return the number of bytes ready for read.
	*/
	int CUart_Device::bytesAvailable()
	{
		return mRxBuffer.length();
	}

	/**
	 ** @brief receive a hardware interrupt. If this object has register itself
	 ** @brief as in interrupt handler using CMachine::installVectorIRQ(...)
	 ** @brief for a particular vector. This interrupts will come in through this method.
	 **/
	void CUart_Device::irq(InterruptVector v)
	{
		int rx=0;
		int tx=0;
		uint32_t st = status(true);
		/* See if there is space in the transmit FIFO while we have data to transmit */
		driver_vector_disable(v);
		//driver_interrupts_disable();
		while ( *(volatile uint8_t*)mLSR & U0LSR_RDR )
		{
			rxBuffer().insert( *(volatile uint8_t*)mRBR );
			++rx;
		}
		while( !txBuffer().empty() && *(volatile uint8_t*)mLSR & U0LSR_THRE )
		{
			*(volatile uint8_t*)mTHR = txBuffer().remove();	/* Write this character to the transmit FIFO. */
			++tx;
		}
		//driver_interrupts_enable();
		driver_vector_enable(v);
		if ( rx ) rxHint(rx);
		if ( tx ) txHint(tx);
	}

	/*
	* The clock frequency supplied to the UART
	*/
	uint32_t CUart_Device::clock()
	{
		return fPCLK;
	}

	void CUart_Device::initialize()
	{
	}

	int CUart_Device::putchar(int ch)
	{
		uartTX((uint8_t)(ch&0xFF));
		return ch;
	}

	int CUart_Device::getchar()
	{
		driver_vector_disable(vector());
		if ( !rxBuffer().empty() )
		{
			int ch = rxBuffer().remove();
			driver_vector_enable(vector());
			return ch;
		}
		driver_vector_enable(vector());
		return -1;
	}

	/** turn dtr on */
	void CUart_Device::dtrOn()
	{
		/** FIXME */
	}

	/** turn dtr off */
	void CUart_Device::dtrOff()
	{
		/** FIXME */
	}

	bool CUart_Device::dtrState()
	{
		/** FIXME */
		return true;
	}

	void CUart_Device::setBaud(uint32_t baud)
	{
		USART_InitStructure.USART_BaudRate            = baud;
		USART_InitStructure.USART_WordLength          = USART_WordLength_8b;
		USART_InitStructure.USART_StopBits            = USART_StopBits_1;
		USART_InitStructure.USART_Parity              = USART_Parity_No ;
		USART_InitStructure.USART_HardwareFlowControl = USART_HardwareFlowControl_None;
		USART_InitStructure.USART_Mode                = USART_Mode_Rx | USART_Mode_Tx;
		USART_Init(mBase, &USART_InitStructure);
	}

	uint32_t CUart_Device::baud()
	{
		uint32_t currentBaud;
		uint32_t currentMode;
		getConfig(&currentBaud,&currentMode);
		return currentBaud;
	}

	void CUart_Device::setMode(uint32_t mode)
	{
		uint32_t currentBaud;
		uint32_t currentMode;
		getConfig(&currentBaud,&currentMode);
		setConfig(clock(),currentBaud,mode);
	}

	uint32_t CUart_Device::mode()
	{
		uint32_t currentBaud;
		uint32_t currentMode;
		getConfig(&currentBaud,&currentMode);
		return currentMode;
	}

	/**
	* @brief low level uart transmit character
	*/
	void CUart_Device::uartTX(uint8_t ch)
	{
		driver_vector_disable(vector());
		if ( uartTxReady() )
		{
			/* restart transmitter interrupt stream */
			*(volatile uint8_t*)mTHR = !txBuffer().empty() ? txBuffer().remove(ch) : ch;
		}
		else
		{
			driver_vector_enable(vector());
			while( txBuffer().full() ) {}
			txBuffer().insert(ch);
		}
		driver_vector_enable(vector());
	}

	//*****************************************************************************
	//! This returns the interrupt status for the specified UART.  Either the raw
	//! interrupt status or the status of interrupts that are allowed to reflect to
	//! the processor can be returned.
	//!
	//! \return Returns the current interrupt status, enumerated as a bit field of
	//! values described in UARTIntEnable().
	//*****************************************************************************
	uint32_t CUart_Device::status(bool bMasked)
	{
		return *(volatile uint32_t*)mIIR;
	}

	//*****************************************************************************
	//! The specified UART interrupt sources are cleared, so that they no longer
	//! assert.  This must be done in the interrupt handler to keep it from being
	//! called again immediately upon exit.
	//!
	//! The \e ulIntFlags parameter has the same definition as the \e ulIntFlags
	//! parameter to UARTIntEnable().
	//!
	//! \note Since there is a write buffer in the Cortex-M3 processor, it may take
	//! several clock cycles before the interrupt source is actually cleared.
	//! Therefore, it is recommended that the interrupt source be cleared early in
	//! the interrupt handler (as opposed to the very last action) to avoid
	//! returning from the interrupt handler before the interrupt source is
	//! actually cleared.  Failure to do so may result in the interrupt handler
	//! being immediately reentered (since NVIC still sees the interrupt source
	//! asserted).
	//*****************************************************************************
	void CUart_Device::clear(uint32_t ulIntFlags)
	{
		*(volatile uint32_t*)mIIR |= 1;
	}

	//*****************************************************************************
	//! Determines if there are any space left in the transmitter FIFO.
	//! This function returns a flag indicating whether or not there is space
	//! available in the transmit FIFO.
	//!
	//! \return Returns \b true if there is space in the transmit FIFO, and \b false
	//! if there is no space in the transmit FIFO.
	//*****************************************************************************
	bool CUart_Device::uartTxReady()
	{
		return *(volatile uint8_t*)mLSR & U0LSR_THRE;
	}

	//*****************************************************************************
	//! Determines if there are any characters in the receive FIFO.
	//! This function returns a flag indicating whether or not there is data
	//! available in the receive FIFO.
	//!
	//! \return Returns \b true if there is data in the receive FIFO, and \b false
	//! if there is no data in the receive FIFO.
	//*****************************************************************************
	bool CUart_Device::uartRXReady()
	{
		return *(volatile uint8_t*)mLSR & U0LSR_RDR;
	}

	//*****************************************************************************
	//! Sends a character to the port.
	//! \param ucData is the character to be transmitted.
	//!
	//! Writes the character \e ucData to the transmit FIFO for the specified port.
	//! This function does not block, so if there is no space available, then a
	//! \b false is returned, and the application will have to retry the function
	//! later.
	//!
	//! This function replaces the original UARTCharNonBlockingPut() API and
	//! performs the same actions.  A macro is provided in <tt>uart.h</tt> to map
	//! the original API to this API.
	//!
	//! \return Returns \b true if the character was successfully placed in the
	//! transmit FIFO, and \b false if there was no space available in the transmit
	//! FIFO.
	//
	//*****************************************************************************
	bool CUart_Device::txNonBlock(uint8_t ucData)
	{
		if ( uartTxReady() )
		{
			*(volatile uint8_t*)mTHR = ucData;
			return true;
		}
		return false;
	}

	//*****************************************************************************
	//
	//! Receives a character from the port.
	//!
	//! Gets a character from the receive FIFO for the specified port.
	//!
	//! This function replaces the original UARTCharNonBlockingGet() API and
	//! performs the same actions.  A macro is provided in <tt>uart.h</tt> to map
	//! the original API to this API.
	//!
	//! \return Returns the character read from the specified port, cast as a
	//! \e long.  A \b -1 will be returned if there are no characters present in
	//! the receive FIFO.  The UARTCharsAvail() function should be called before
	//! attempting to call this function.
	//
	//*****************************************************************************
	int32_t CUart_Device::rxNonBlock()
	{
		int32_t ch=(-1);
		if ( uartRXReady() )
		{
			ch = *(volatile uint8_t*)mRBR;
		}
		return ch;
	}

	//*****************************************************************************
	//
	//! Gets the current configuration of a UART.
	//!
	//! \param ulBase is the base address of the UART port.
	//! \param ulUARTClk is the rate of the clock supplied to the UART module.
	//! \param pulBaud is a pointer to storage for the baud rate.
	//! \param pulConfig is a pointer to storage for the data format.
	//!
	//! The baud rate and data format for the UART is determined, given an
	//! explicitly provided peripheral clock (hence the ExpClk suffix).  The
	//! returned baud rate is the actual baud rate; it may not be the exact baud
	//! rate requested or an ``official'' baud rate.  The data format returned in
	//! \e pulConfig is enumerated the same as the \e ulConfig parameter of
	//! UARTConfigSetExpClk().
	//!
	//! The peripheral clock will be the same as the processor clock.  This will be
	//! the value returned by SysCtlClockGet(), or it can be explicitly hard coded
	//! if it is constant and known (to save the code/execution overhead of a call
	//! to SysCtlClockGet()).
	//!
	//! This function replaces the original UARTConfigGet() API and performs the
	//! same actions.  A macro is provided in <tt>uart.h</tt> to map the original
	//! API to this API.
	//!
	//! \return None.
	//
	//*****************************************************************************
	void CUart_Device::getConfig(uint32_t *pulBaud, uint32_t *pulConfig)
	{
		/** FIXME */
		*pulBaud=9600;
		*pulConfig=0;
	}


	//*****************************************************************************
	//
	//! Enables transmitting and receiving.
	//!
	//! \param ulBase is the base address of the UART port.
	//!
	//! Sets the UARTEN, TXE, and RXE bits, and enables the transmit and receive
	//! FIFOs.
	//!
	//! \return None.
	//
	//*****************************************************************************
	void CUart_Device::enable()
	{
		USART_Cmd(mBase, ENABLE); // Enable USART
		dtrOn();
	}


	//*****************************************************************************
	//
	//! Disables transmitting and receiving.
	//!
	//! \param ulBase is the base address of the UART port.
	//!
	//! Clears the UARTEN, TXE, and RXE bits, then waits for the end of
	//! transmission of the current character, and flushes the transmit FIFO.
	//!
	//! \return None.
	//
	//*****************************************************************************
	void CUart_Device::disable()
	{
		dtrOff();
		USART_Cmd(mBase, DISABLE); // Enable USART
	}

	//*****************************************************************************
	//
	//! Enables individual UART interrupt sources.
	//!
	//! \param ulBase is the base address of the UART port.
	//! \param ulIntFlags is the bit mask of the interrupt sources to be enabled.
	//!
	//! Enables the indicated UART interrupt sources.  Only the sources that are
	//! enabled can be reflected to the processor interrupt; disabled sources have
	//! no effect on the processor.
	//!
	//! The \e ulIntFlags parameter is the logical OR of any of the following:
	//!
	//! - \b UART_INT_OE - Overrun Error interrupt
	//! - \b UART_INT_BE - Break Error interrupt
	//! - \b UART_INT_PE - Parity Error interrupt
	//! - \b UART_INT_FE - Framing Error interrupt
	//! - \b UART_INT_RT - Receive Timeout interrupt
	//! - \b UART_INT_TX - Transmit interrupt
	//! - \b UART_INT_RX - Receive interrupt
	//! - \b UART_INT_DSR - DSR interrupt
	//! - \b UART_INT_DCD - DCD interrupt
	//! - \b UART_INT_CTS - CTS interrupt
	//! - \b UART_INT_RI - RI interrupt
	//!
	//! \return None.
	//
	//*****************************************************************************
	void CUart_Device::enableInt(uint32_t ulIntFlags)
	{
		*(volatile uint32_t*)mIER |= ulIntFlags;
	}

	//*****************************************************************************
	//
	//! Disables individual UART interrupt sources.
	//!
	//! \param ulBase is the base address of the UART port.
	//! \param ulIntFlags is the bit mask of the interrupt sources to be disabled.
	//!
	//! Disables the indicated UART interrupt sources.  Only the sources that are
	//! enabled can be reflected to the processor interrupt; disabled sources have
	//! no effect on the processor.
	//!
	//! The \e ulIntFlags parameter has the same definition as the \e ulIntFlags
	//! parameter to UARTIntEnable().
	//!
	//! \return None.
	//
	//*****************************************************************************
	void CUart_Device::disableInt(uint32_t ulIntFlags)
	{
		*(volatile uint32_t*)mIER &= ~ulIntFlags;
	}

}


