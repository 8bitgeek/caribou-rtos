/***************************************************************************
 *   Copyright © 2005-2012 by Pike Aerospace Research Corporation          *
 *   info@pikeaero.com                                                     *
 *                                                                         *
 *   This program is free software: you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation, either version 3 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 *   This program is distributed in the hope that it will be useful,       *
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
 *   GNU General Public License for more details.                          *
 *                                                                         *
 *   You should have received a copy of the GNU General Public License     *
 *   along with this program.  If not, see <http://www.gnu.org/licenses/>. *
 **************************************************************************/
#include "cuart_device.h"

#include "inc/hw_types.h"
#include "inc/hw_memmap.h"
#include "inc/hw_sysctl.h"
#include "inc/hw_uart.h"
#include "inc/hw_gpio.h"
#include "driverlib/uart.h"
#include "driverlib/sysctl.h"
#include "driverlib/gpio.h"
#include "driverlib/pin_map.h"

#define DEFAULT_RX_BUFFERSZ	128
#define DEFAULT_TX_BUFFERSZ	128

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
#define UART_INTERRUPTS				(UART_INT_TX | UART_INT_RX | UART_INT_RT)

typedef struct
{
	uint32_t					base;		// the base port address
	InterruptVector				vector;		// the interrupt vector for the port.
	uint32_t					dtrport;	// the DTR port
	uint8_t						dtrpin;		// the DTR pin
} port_t;

static port_t ports[] =
{
	{ UART0_BASE, Vector_UART0, 0, 0 }, /** FIXME add DTR port/pins */
	{ UART1_BASE, Vector_UART1, 0, 0 },
	{ UART2_BASE, Vector_UART2, 0, 0 },
#if 0
	{ UART3_BASE, Vector_UART3, 0, 0 },
	{ UART4_BASE, Vector_UART4, 0, 0 },
	{ UART5_BASE, Vector_UART5, 0, 0 },
	{ UART6_BASE, Vector_UART6, 0, 0 },
	{ UART7_BASE, Vector_UART7, 0, 0 },
#endif
};

namespace CARIBOU
{
	#define inherited CUart_Interface

	CUart_Device::CUart_Device(int port, uint32_t baud, uint32_t mode)
	: CUart_Interface(port,baud,mode)
	, mPort(port)
	{
		setConfig(clock(), baud, mode);
		rxBuffer().resize(DEFAULT_RX_BUFFERSZ);
		txBuffer().resize(DEFAULT_TX_BUFFERSZ);
		CObject::installVectorIRQ(vector(),this);
		CObject::enableVector(vector());				/* ensure the vector is enabled */
		enableInt(UART_INTERRUPTS);
		dtrOn();
	}

	CUart_Device::~CUart_Device()
	{
		disableInt(UART_INTERRUPTS);
		CObject::removeVectorIRQ(this);
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
		return (HWREG(base() + UART_O_LCRH) & UART_LCRH_FEN &&
				(HWREG(base() + UART_O_CTL) & (UART_CTL_UARTEN | UART_CTL_TXE | UART_CTL_RXE) ) );

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
		uint32_t ulStatus = status(true); /* get the interrupt status */
		clear(ulStatus);				/* clear the interrupt pending flags */

		/* See if there is space in the transmit FIFO while we have data to transmit */
		while( !txBuffer().empty() && !(HWREG(base() + UART_O_FR) & UART_FR_TXFF) )
		{
			HWREG(base() + UART_O_DR) = txBuffer().remove();	/* Write this character to the transmit FIFO. */
		}

		while ( !(HWREG(base() + UART_O_FR) & UART_FR_RXFE) )
		{
			rxBuffer().insert(HWREG(base() + UART_O_DR));
		}
		//wakeup();
	}

	uint32_t CUart_Device::clock()
	{
		return chip_clock_freq();
	}

	uint32_t CUart_Device::base()
	{
		return ports[mPort].base;
	}

	InterruptVector CUart_Device::vector()
	{
		return ports[mPort].vector;
	}

	void CUart_Device::initialize()
	{
		/* UART0: Set GPIO A0 and A1 as UART pins. */
		chip_hw_peripheral_enable(SYSCTL_PERIPH_UART0);
		chip_hw_peripheral_enable(SYSCTL_PERIPH_GPIOA);
		chip_hw_set_pintype_uart(GPIO_PORTA_BASE, GPIO_PIN_0 | GPIO_PIN_1);

		/* UART1: Set GPIO D2 and D3 as UART pins. */
		chip_hw_peripheral_enable(SYSCTL_PERIPH_UART1);
		chip_hw_peripheral_enable(SYSCTL_PERIPH_GPIOD);
		chip_hw_set_pintype_uart(GPIO_PORTD_BASE, GPIO_PIN_2 | GPIO_PIN_3);

	}

	int CUart_Device::putchar(int ch)
	{
		uartTX((uint8_t)(ch&0xFF));
		return ch;
	}

	int CUart_Device::getchar()
	{
		disableInt(UART_INT_RX);
		if ( !rxBuffer().empty() )
		{
			int ch = rxBuffer().remove();
			enableInt(UART_INT_RX);
			return ch;
		}
		enableInt(UART_INT_RX);
		return -1;
	}

	/** turn dtr on */
	void CUart_Device::dtrOn()
	{
		/*S* FIXME */
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

	/**
	* @brief low level uart transmit character
	*/
	void CUart_Device::uartTX(uint8_t ch)
	{
		disableInt(UART_INTERRUPTS);
		if ( !(HWREG(base() + UART_O_FR) & UART_FR_TXFF) )
		{
			/* restart transmitter interrupt stream */
			HWREG(base() + UART_O_DR) = !txBuffer().empty() ? txBuffer().remove(ch) : ch;
			enableInt(UART_INTERRUPTS);
		}
		else
		{
			enableInt(UART_INTERRUPTS);
			while( txBuffer().full() ) {}
			txBuffer().insert(ch);
		}
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
		/* Return either the interrupt status or the raw interrupt status as requested. */
		if(bMasked)
		{
			return(HWREG(base() + UART_O_MIS));
		}
		else
		{
			return(HWREG(base() + UART_O_RIS));
		}
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
		/* Clear the requested interrupt sources. */
		HWREG(base() + UART_O_ICR) = ulIntFlags;
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
		/* Return the availability of characters. */
		return ((HWREG(base() + UART_O_FR) & UART_FR_TXFF) ? false : true);

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
		/* Return the availability of characters. */
		return ((HWREG(base() + UART_O_FR) & UART_FR_RXFE) ? false : true);
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
		/* See if there is space in the transmit FIFO. */
		if(!(HWREG(base() + UART_O_FR) & UART_FR_TXFF))
		{
			/* Write this character to the transmit FIFO. */
			HWREG(base() + UART_O_DR) = ucData;
			return(true);
		}
		else
		{
			 return(false);
		}
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
		/* See if there are any characters in the receive FIFO. */
		if(!(HWREG(base() + UART_O_FR) & UART_FR_RXFE))
		{
			/* Read and return the next character. */
			return(HWREG(base() + UART_O_DR));
		}
		return(-1);
	}

	void CUart_Device::setBaud(uint32_t baud)
	{
		uint32_t ulBaud;
		uint32_t ulConfig;
		getConfig(&ulBaud,&ulConfig);
		setConfig(clock(),baud,ulConfig);
	}

	uint32_t CUart_Device::baud()
	{
		uint32_t ulBaud;
		uint32_t ulConfig;
		getConfig(&ulBaud,&ulConfig);
		return ulBaud;
	}

	void CUart_Device::setMode(uint32_t mode)
	{
		uint32_t ulBaud;
		uint32_t ulConfig;
		getConfig(&ulBaud,&ulConfig);
		setConfig(clock(),ulBaud,mode);
	}

	uint32_t CUart_Device::mode()
	{
		uint32_t ulBaud;
		uint32_t ulConfig;
		getConfig(&ulBaud,&ulConfig);
		return ulConfig;
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
	void CUart_Device::setConfig(uint32_t ulUARTClk, uint32_t ulBaud, uint32_t ulConfig)
	{
		unsigned long ulDiv;
		//
		// Stop the UART.
		//
		disable();

		//
		// Is the required baud rate greater than the maximum rate supported
		// without the use of high speed mode?
		//
		if((base() * 16) > ulUARTClk)
		{
			//
			// Enable high speed mode.
			//
			HWREG(base() + UART_O_CTL) |= UART_CTL_HSE;

			//
			// Half the supplied baud rate to compensate for enabling high speed
			// mode.  This allows the following code to be common to both cases.
			//
			ulBaud /= 2;
		}
		else
		{
			//
			// Disable high speed mode.
			//
			HWREG(base() + UART_O_CTL) &= ~(UART_CTL_HSE);
		}

		//
		// Compute the fractional baud rate divider.
		//
		ulDiv = (((ulUARTClk * 8) / ulBaud) + 1) / 2;

		//
		// Set the baud rate.
		//
		HWREG(base() + UART_O_IBRD) = ulDiv / 64;
		HWREG(base() + UART_O_FBRD) = ulDiv % 64;

		//
		// Set parity, data length, and number of stop bits.
		//
		HWREG(base() + UART_O_LCRH) = ulConfig;

		//
		// Clear the flags register.
		//
		HWREG(base() + UART_O_FR) = 0;

		//
		// Start the UART.
		//
		enable();
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
		unsigned long ulInt, ulFrac;

		//
		// Compute the baud rate.
		//
		ulInt = HWREG(base() + UART_O_IBRD);
		ulFrac = HWREG(base() + UART_O_FBRD);
		*pulBaud = (clock() * 4) / ((64 * ulInt) + ulFrac);

		//
		// See if high speed mode enabled.
		//
		if(HWREG(base() + UART_O_CTL) & UART_CTL_HSE)
		{
			//
			// High speed mode is enabled so the actual baud rate is actually
			// double what was just calculated.
			//
			*pulBaud *= 2;
		}

		//
		// Get the parity, data length, and number of stop bits.
		//
		*pulConfig = (HWREG(base() + UART_O_LCRH) &
					  (UART_LCRH_SPS | UART_LCRH_WLEN_M | UART_LCRH_STP2 |
					   UART_LCRH_EPS | UART_LCRH_PEN));
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
		//
		// Enable the FIFO.
		//
		HWREG(base() + UART_O_LCRH) |= UART_LCRH_FEN;

		//
		// Enable RX, TX, and the UART.
		//
		HWREG(base() + UART_O_CTL) |= (UART_CTL_UARTEN | UART_CTL_TXE | UART_CTL_RXE);

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
		//
		// Wait for end of TX.
		//
		//while(HWREG(base() + UART_O_FR) & UART_FR_BUSY)
		//{
		//	yield();
		//}

		//
		// Disable the FIFO.
		//
		HWREG(base() + UART_O_LCRH) &= ~(UART_LCRH_FEN);

		//
		// Disable the UART.
		//
		HWREG(base() + UART_O_CTL) &= ~(UART_CTL_UARTEN | UART_CTL_TXE | UART_CTL_RXE);
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
		/* Enable the specified interrupts. */
		HWREG(base() + UART_O_IM) |= ulIntFlags;
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
		/* Disable the specified interrupts. */
		HWREG(base() + UART_O_IM) &= ~(ulIntFlags);
	}

}


