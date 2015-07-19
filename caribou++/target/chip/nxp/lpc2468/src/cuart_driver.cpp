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
#include "lpc2468.h"
#include "target.h"

#define DEFAULT_RX_BUFFERSZ	256
#define DEFAULT_TX_BUFFERSZ	256

// U0IER_RBR_Interrupt_Enable					# RX Data Available
// U0IER_THRE_Interrupt_Enable					# TX Holding Register Empty
// U0IER_Rx_Line_Status_Interrupt_Enable		# Line Status Interrupts
// U0IER_ABEOIntEn								# Enf of Autobaud
// U0IER_ABTOIntEn								# Autobaud Timeout

typedef struct
{
	uint32_t*					base;			// the base port address
	uint32_t*					pinsel;			// pin select register
	InterruptVector				vector;			// the interrupt vector for the port.
	uint32_t					intflags;		// the interrupt flag bits
	uint32_t					pinselbits;
} port_t;

static port_t ports[] =
{
	{ (uint32_t*)UART0_BASE, (uint32_t*)0xE002C000, Vector_UART0, (U0IER_RBR_Interrupt_Enable | U0IER_THRE_Interrupt_Enable), 0x40000050 },
	{ (uint32_t*)UART1_BASE, (uint32_t*)0xE002C010, Vector_UART1, (U1IER_RBR_Interrupt_Enable | U1IER_THRE_Interrupt_Enable), 0x0000000A },
	{ (uint32_t*)UART2_BASE, (uint32_t*)0xE002C000, Vector_UART2, (U2IER_RBR_Interrupt_Enable | U2IER_THRE_Interrupt_Enable), 0x00500000 },
};

namespace CARIBOU
{
	#define inherited CUart_Interface

	CUart_Driver::CUart_Driver(int port, uint32_t baud, uint32_t mode)
	: inherited(port,baud,mode)
	, mPort(port)
	, mBase(ports[mPort].base)
	, mLSR((uint8_t*)mBase+U0LSR_OFFSET)
	, mTHR((uint8_t*)mBase+U0THR_OFFSET)
	, mRBR((uint8_t*)mBase+U0RBR_OFFSET)
	, mFCR((uint8_t*)mBase+U0FCR_OFFSET)
	, mIIR((uint8_t*)mBase+U0IIR_OFFSET)
	, mIER((uint8_t*)mBase+U0IER_OFFSET)
	, mVector(ports[mPort].vector)
	{
		*(ports[mPort].pinsel) |= ports[mPort].pinselbits;
		setConfig(clock(), baud, mode);
		rxBuffer().resize(DEFAULT_RX_BUFFERSZ);
		txBuffer().resize(DEFAULT_TX_BUFFERSZ);
		CObject::installVectorIRQ(vector(),this);
		driver_vector_enable(vector());
		enable();
	}

	CUart_Driver::~CUart_Driver()
	{
		CObject::disableVector(vector());
		driver_vector_disable(vector());
		CObject::removeVectorIRQ(this);
	}

	/**
	* Open the device.
	*/
	bool CUart_Driver::open(CIODevice::IOMode_t mode)
	{
		setMode(mode);
		enable();
	}

	/**
	* Close the device.
	*/
	void CUart_Driver::close()
	{
		disable();
	}

	/**
	* Is the device open?
	*/
	bool CUart_Driver::isOpen()
	{
		return *(volatile uint8_t*)mFCR & 0x07;
	}

	/**
	* Return the number of bytes ready for read.
	*/
	int CUart_Driver::bytesAvailable()
	{
		return mRxBuffer.length();
	}

	/**
	 ** @brief receive a hardware interrupt. If this object has register itself
	 ** @brief as in interrupt handler using CMachine::installVectorIRQ(...)
	 ** @brief for a particular vector. This interrupts will come in through this method.
	 **/
	void CUart_Driver::irq(InterruptVector v)
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
	uint32_t CUart_Driver::clock()
	{
		return fPCLK;
	}

	void CUart_Driver::initialize()
	{
	}

	int CUart_Driver::putchar(int ch)
	{
		uartTX((uint8_t)(ch&0xFF));
		return ch;
	}

	int CUart_Driver::getchar()
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
	void CUart_Driver::dtrOn()
	{
		/** FIXME */
	}

	/** turn dtr off */
	void CUart_Driver::dtrOff()
	{
		/** FIXME */
	}

	bool CUart_Driver::dtrState()
	{
		/** FIXME */
		return true;
	}

	void CUart_Driver::setBaud(uint32_t baud)
	{
		uint32_t currentBaud;
		uint32_t currentMode;
		getConfig(&currentBaud,&currentMode);
		setConfig(clock(),baud,currentMode);
	}

	uint32_t CUart_Driver::baud()
	{
		uint32_t currentBaud;
		uint32_t currentMode;
		getConfig(&currentBaud,&currentMode);
		return currentBaud;
	}

	void CUart_Driver::setMode(uint32_t mode)
	{
		uint32_t currentBaud;
		uint32_t currentMode;
		getConfig(&currentBaud,&currentMode);
		setConfig(clock(),currentBaud,mode);
	}

	uint32_t CUart_Driver::mode()
	{
		uint32_t currentBaud;
		uint32_t currentMode;
		getConfig(&currentBaud,&currentMode);
		return currentMode;
	}

	/**
	* @brief low level uart transmit character
	*/
	void CUart_Driver::uartTX(uint8_t ch)
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
	uint32_t CUart_Driver::status(bool bMasked)
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
	void CUart_Driver::clear(uint32_t ulIntFlags)
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
	bool CUart_Driver::uartTxReady()
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
	bool CUart_Driver::uartRXReady()
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
	bool CUart_Driver::txNonBlock(uint8_t ucData)
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
	int32_t CUart_Driver::rxNonBlock()
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
	//! Sets the configuration of a UART.
	//!
	//! \param ulBase is the base address of the UART port.
	//! \param ulUARTClk is the rate of the clock supplied to the UART module.
	//! \param ulBaud is the desired baud rate.
	//! \param ulConfig is the data format for the port (number of data bits,
	//! number of stop bits, and parity).
	//!
	//! This function will configure the UART for operation in the specified data
	//! format.  The baud rate is provided in the \e ulBaud parameter and the data
	//! format in the \e ulConfig parameter.
	//!
	//! The \e ulConfig parameter is the logical OR of three values: the number of
	//! data bits, the number of stop bits, and the parity.  \b UART_CONFIG_WLEN_8,
	//! \b UART_CONFIG_WLEN_7, \b UART_CONFIG_WLEN_6, and \b UART_CONFIG_WLEN_5
	//! select from eight to five data bits per byte (respectively).
	//! \b UART_CONFIG_STOP_ONE and \b UART_CONFIG_STOP_TWO select one or two stop
	//! bits (respectively).  \b UART_CONFIG_PAR_NONE, \b UART_CONFIG_PAR_EVEN,
	//! \b UART_CONFIG_PAR_ODD, \b UART_CONFIG_PAR_ONE, and \b UART_CONFIG_PAR_ZERO
	//! select the parity mode (no parity bit, even parity bit, odd parity bit,
	//! parity bit always one, and parity bit always zero, respectively).
	//!
	//! The peripheral clock will be the same as the processor clock.  This will be
	//! the value returned by SysCtlClockGet(), or it can be explicitly hard coded
	//! if it is constant and known (to save the code/execution overhead of a call
	//! to SysCtlClockGet()).
	//!
	//! This function replaces the original UARTConfigSet() API and performs the
	//! same actions.  A macro is provided in <tt>uart.h</tt> to map the original
	//! API to this API.
	//!
	//! \return None.
	//
	//*****************************************************************************
	void CUart_Driver::setConfig(uint32_t ulUARTClk, uint32_t ulBaud, uint32_t ulConfig)
	{
		uint32_t fDIV = ulUARTClk / (ulBaud*16);
		uint8_t divlo = fDIV & 0xFF;
		uint8_t divhi = (fDIV>>8)&0xFF;
		*(ports[mPort].pinsel) |= ports[mPort].pinselbits;		/* pin select */
        *((volatile uint8_t*)((uint8_t*)base()+U0LCR_OFFSET)) = 0x83;	/* 8 bits, no Parity, 1 Stop bit */
		//*((volatile uint8_t*)((uint8_t*)base()+U0FCR_OFFSET)) = 0x07;	/* Enable FIFOs and reset them. */
		*((volatile uint8_t*)((uint8_t*)base()+U0DLL_OFFSET)) = divlo+1; // 0x4A; // fDIV % 256;
		*((volatile uint8_t*)((uint8_t*)base()+U0DLM_OFFSET)) = divhi; // fDIV / 256;
		*((volatile uint8_t*)((uint8_t*)base()+U0LCR_OFFSET)) = 0x03;	/* DLAB = 0 */
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
	void CUart_Driver::getConfig(uint32_t *pulBaud, uint32_t *pulConfig)
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
	void CUart_Driver::enable()
	{
		*(volatile uint8_t*)mFCR |= 0x07;	/* Enable FIFOs and reset them. */
		enableInt(ports[mPort].intflags);
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
	void CUart_Driver::disable()
	{
		dtrOff();
		disableInt(ports[mPort].intflags);
		*(volatile uint8_t*)mFCR &= ~0x07;	/* Disable FIFOs and reset them. */
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
	void CUart_Driver::enableInt(uint32_t ulIntFlags)
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
	void CUart_Driver::disableInt(uint32_t ulIntFlags)
	{
		*(volatile uint32_t*)mIER &= ~ulIntFlags;
	}

}


