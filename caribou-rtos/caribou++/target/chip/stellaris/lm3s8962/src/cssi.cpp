/***************************************************************************
 *   Copyright © 2005-2013 by Pike Aerospace Research Corporation          *
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

#include "inc/hw_types.h"
#include "inc/hw_memmap.h"
#include "inc/hw_sysctl.h"
#include "inc/hw_uart.h"
#include "inc/hw_gpio.h"
#include "inc/hw_ssi.h"

#include "driverlib/sysctl.h"
#include "driverlib/gpio.h"
#include "driverlib/pin_map.h"
#include "driverlib/ssi.h"

#include "cobject.h"
#include "cssi.h"


namespace CARIBOU {

	#define inherited CObject

	CSsi::CSsi()
	: inherited()
	, mBase(SDC_SSI_BASE)
	{
	}

	CSsi::~CSsi()
	{
	}

	//*****************************************************************************
	//
	//! Configures the synchronous serial interface.
	//!
	//! \param ulSSIClk is the rate of the clock supplied to the SSI module.
	//! \param ulProtocol specifies the data transfer protocol.
	//! \param ulMode specifies the mode of operation.
	//! \param ulBitRate specifies the clock rate.
	//! \param ulDataWidth specifies number of bits transferred per frame.
	//!
	//! This function configures the synchronous serial interface.  It sets
	//! the SSI protocol, mode of operation, bit rate, and data width.
	//!
	//! The \e ulProtocol parameter defines the data frame format.  The
	//! \e ulProtocol parameter can be one of the following values:
	//! \b SSI_FRF_MOTO_MODE_0, \b SSI_FRF_MOTO_MODE_1, \b SSI_FRF_MOTO_MODE_2,
	//! \b SSI_FRF_MOTO_MODE_3, \b SSI_FRF_TI, or \b SSI_FRF_NMW.  The Motorola
	//! frame formats imply the following polarity and phase configurations:
	//!
	//! <pre>
	//! Polarity Phase       Mode
	//!   0       0   SSI_FRF_MOTO_MODE_0
	//!   0       1   SSI_FRF_MOTO_MODE_1
	//!   1       0   SSI_FRF_MOTO_MODE_2
	//!   1       1   SSI_FRF_MOTO_MODE_3
	//! </pre>
	//!
	//! The \e ulMode parameter defines the operating mode of the SSI module.  The
	//! SSI module can operate as a master or slave; if a slave, the SSI can be
	//! configured to disable output on its serial output line.  The \e ulMode
	//! parameter can be one of the following values: \b SSI_MODE_MASTER,
	//! \b SSI_MODE_SLAVE, or \b SSI_MODE_SLAVE_OD.
	//!
	//! The \e ulBitRate parameter defines the bit rate for the SSI.  This bit rate
	//! must satisfy the following clock ratio criteria:
	//!
	//! - FSSI >= 2 * bit rate (master mode)
	//! - FSSI >= 12 * bit rate (slave modes)
	//!
	//! where FSSI is the frequency of the clock supplied to the SSI module.
	//!
	//! The \e ulDataWidth parameter defines the width of the data transfers, and
	//! can be a value between 4 and 16, inclusive.
	//!
	//! The peripheral clock will be the same as the processor clock.  This will be
	//! the value returned by SysCtlClockGet(), or it can be explicitly hard coded
	//! if it is constant and known (to save the code/execution overhead of a call
	//! to SysCtlClockGet()).
	//!
	//! This function replaces the original SSIConfig() API and performs the same
	//! actions.  A macro is provided in <tt>ssi.h</tt> to map the original API to
	//! this API.
	//!
	//! \return None.
	//
	//*****************************************************************************
	void CSsi::hwConfigSetExpClk(uint32_t ulSSIClk,
					   uint32_t ulProtocol, uint32_t ulMode,
					   uint32_t ulBitRate, uint32_t ulDataWidth)
	{
		uint32_t ulMaxBitRate;
		uint32_t ulRegVal;
		uint32_t ulPreDiv;
		uint32_t ulSCR;
		uint32_t ulSPH_SPO;

		//
		// Set the mode.
		//
		ulRegVal = (ulMode == SSI_MODE_SLAVE_OD) ? SSI_CR1_SOD : 0;
		ulRegVal |= (ulMode == SSI_MODE_MASTER) ? 0 : SSI_CR1_MS;
		HWREG(mBase + SSI_O_CR1) = ulRegVal;

		//
		// Set the clock predivider.
		//
		ulMaxBitRate = ulSSIClk / ulBitRate;
		ulPreDiv = 0;
		do
		{
			ulPreDiv += 2;
			ulSCR = (ulMaxBitRate / ulPreDiv) - 1;
		}
		while(ulSCR > 255);
		HWREG(mBase + SSI_O_CPSR) = ulPreDiv;

		//
		// Set protocol and clock rate.
		//
		ulSPH_SPO = (ulProtocol & 3) << 6;
		ulProtocol &= SSI_CR0_FRF_M;
		ulRegVal = (ulSCR << 8) | ulSPH_SPO | ulProtocol | (ulDataWidth - 1);
		HWREG(mBase + SSI_O_CR0) = ulRegVal;
	}

	//*****************************************************************************
	//
	//! Enables the synchronous serial interface.
	//!
	//! This will enable operation of the synchronous serial interface.  It must be
	//! configured before it is enabled.
	//!
	//! \return None.
	//
	//*****************************************************************************
	void CSsi::hwEnable()
	{
		//
		// Read-modify-write the enable bit.
		//
		HWREG(mBase + SSI_O_CR1) |= SSI_CR1_SSE;
	}

	//*****************************************************************************
	//
	//! Disables the synchronous serial interface.
	//!
	//! This will disable operation of the synchronous serial interface.
	//!
	//! \return None.
	//
	//*****************************************************************************
	void CSsi::hwDisable()
	{
		//
		// Read-modify-write the enable bit.
		//
		HWREG(mBase + SSI_O_CR1) &= ~(SSI_CR1_SSE);
	}

	//*****************************************************************************
	//
	//! Enables individual SSI interrupt sources.
	//!
	//! \param ulIntFlags is a bit mask of the interrupt sources to be enabled.
	//!
	//! Enables the indicated SSI interrupt sources.  Only the sources that are
	//! enabled can be reflected to the processor interrupt; disabled sources have
	//! no effect on the processor.  The \e ulIntFlags parameter can be any of the
	//! \b SSI_TXFF, \b SSI_RXFF, \b SSI_RXTO, or \b SSI_RXOR values.
	//!
	//! \return None.
	//
	//*****************************************************************************
	void CSsi::hwIntEnable(uint32_t ulIntFlags)
	{
		//
		// Enable the specified interrupts.
		//
		HWREG(mBase + SSI_O_IM) |= ulIntFlags;
	}

	//*****************************************************************************
	//
	//! Disables individual SSI interrupt sources.
	//!
	//! \param ulIntFlags is a bit mask of the interrupt sources to be disabled.
	//!
	//! Disables the indicated SSI interrupt sources.  The \e ulIntFlags parameter
	//! can be any of the \b SSI_TXFF, \b SSI_RXFF, \b SSI_RXTO, or \b SSI_RXOR
	//! values.
	//!
	//! \return None.
	//
	//*****************************************************************************
	void CSsi::hwIntDisable(uint32_t ulIntFlags)
	{
		//
		// Disable the specified interrupts.
		//
		HWREG(mBase + SSI_O_IM) &= ~(ulIntFlags);
	}

	//*****************************************************************************
	//
	//! Gets the current interrupt status.
	//!
	//! \param bMasked is \b false if the raw interrupt status is required and
	//! \b true if the masked interrupt status is required.
	//!
	//! This returns the interrupt status for the SSI module.  Either the raw
	//! interrupt status or the status of interrupts that are allowed to reflect to
	//! the processor can be returned.
	//!
	//! \return The current interrupt status, enumerated as a bit field of
	//! \b SSI_TXFF, \b SSI_RXFF, \b SSI_RXTO, and \b SSI_RXOR.
	//
	//*****************************************************************************
	uint32_t CSsi::hwIntStatus(bool bMasked)
	{
		//
		// Return either the interrupt status or the raw interrupt status as
		// requested.
		//
		if(bMasked)
		{
			return(HWREG(mBase + SSI_O_MIS));
		}
		else
		{
			return(HWREG(mBase + SSI_O_RIS));
		}
	}

	//*****************************************************************************
	//
	//! Clears SSI interrupt sources.
	//!
	//! \param ulIntFlags is a bit mask of the interrupt sources to be cleared.
	//!
	//! The specified SSI interrupt sources are cleared, so that
	//! they no longer assert.  This must be done in the interrupt handler to
	//! keep it from being called again immediately upon exit.
	//! The \e ulIntFlags parameter can consist of either or both the \b SSI_RXTO
	//! and \b SSI_RXOR values.
	//!
	//! \note Since there is a write buffer in the Cortex-M3 processor, it may take
	//! several clock cycles before the interrupt source is actually cleared.
	//! Therefore, it is recommended that the interrupt source be cleared early in
	//! the interrupt handler (as opposed to the very last action) to avoid
	//! returning from the interrupt handler before the interrupt source is
	//! actually cleared.  Failure to do so may result in the interrupt handler
	//! being immediately reentered (since NVIC still sees the interrupt source
	//! asserted).
	//!
	//! \return None.
	//
	//*****************************************************************************
	void CSsi::hwIntClear(uint32_t ulIntFlags)
	{
		//
		// Clear the requested interrupt sources.
		//
		HWREG(mBase + SSI_O_ICR) = ulIntFlags;
	}

	//*****************************************************************************
	//
	//! Puts a data element into the SSI transmit FIFO.
	//!
	//! \param ulData data to be transmitted over the SSI interface.
	//!
	//! This function will place the supplied data into the transmit FIFO of
	//! the specified SSI module.
	//!
	//! \note The upper 32 - N bits of the \e ulData will be discarded by the
	//! hardware, where N is the data width as configured by SSIConfigSetExpClk().
	//! For example, if the interface is configured for 8-bit data width, the upper
	//! 24 bits of \e ulData will be discarded.
	//!
	//! \return None.
	//
	//*****************************************************************************
	void CSsi::hwDataPut(uint32_t ulData)
	{
		//
		// Wait until there is space.
		//
		while(!(HWREG(mBase + SSI_O_SR) & SSI_SR_TNF))		{}

		//
		// Write the data to the SSI.
		//
		HWREG(mBase + SSI_O_DR) = ulData;
	}

	//*****************************************************************************
	//
	//! Puts a data element into the SSI transmit FIFO.
	//!
	//! \param ulData data to be transmitted over the SSI interface.
	//!
	//! This function will place the supplied data into the transmit FIFO of
	//! the specified SSI module.  If there is no space in the FIFO, then this
	//! function will return a zero.
	//!
	//! This function replaces the original SSIDataNonBlockingPut() API and
	//! performs the same actions.  A macro is provided in <tt>ssi.h</tt> to map
	//! the original API to this API.
	//!
	//! \note The upper 32 - N bits of the \e ulData will be discarded by the
	//! hardware, where N is the data width as configured by SSIConfigSetExpClk().
	//! For example, if the interface is configured for 8-bit data width, the upper
	//! 24 bits of \e ulData will be discarded.
	//!
	//! \return Returns the number of elements written to the SSI transmit FIFO.
	//
	//*****************************************************************************
	int32_t CSsi::hwDataPutNonBlocking(uint32_t ulData)
	{
		//
		// Check for space to write.
		//
		if(HWREG(mBase + SSI_O_SR) & SSI_SR_TNF)
		{
			HWREG(mBase + SSI_O_DR) = ulData;
			return(1);
		}
		else
		{
			return(0);
		}
	}

	//*****************************************************************************
	//
	//! Gets a data element from the SSI receive FIFO.
	//!
	//! \param pulData pointer to a storage location for data that was received
	//! over the SSI interface.
	//!
	//! This function will get received data from the receive FIFO of the specified
	//! SSI module, and place that data into the location specified by the
	//! \e pulData parameter.
	//!
	//! \note Only the lower N bits of the value written to \e pulData will contain
	//! valid data, where N is the data width as configured by
	//! SSIConfigSetExpClk().  For example, if the interface is configured for
	//! 8-bit data width, only the lower 8 bits of the value written to \e pulData
	//! will contain valid data.
	//!
	//! \return None.
	//
	//*****************************************************************************
	void CSsi::hwDataGet(uint32_t *pulData)
	{
		//
		// Wait until there is data to be read.
		//
		while(!(HWREG(mBase + SSI_O_SR) & SSI_SR_RNE))			{}

		//
		// Read data from SSI.
		//
		*pulData = HWREG(mBase + SSI_O_DR);
	}

	//*****************************************************************************
	//
	//! Gets a data element from the SSI receive FIFO.
	//!
	//! \param pulData pointer to a storage location for data that was received
	//! over the SSI interface.
	//!
	//! This function will get received data from the receive FIFO of
	//! the specified SSI module, and place that data into the location specified
	//! by the \e ulData parameter.  If there is no data in the FIFO, then this
	//! function will return a zero.
	//!
	//! This function replaces the original SSIDataNonBlockingGet() API and
	//! performs the same actions.  A macro is provided in <tt>ssi.h</tt> to map
	//! the original API to this API.
	//!
	//! \note Only the lower N bits of the value written to \e pulData will contain
	//! valid data, where N is the data width as configured by
	//! SSIConfigSetExpClk().  For example, if the interface is configured for
	//! 8-bit data width, only the lower 8 bits of the value written to \e pulData
	//! will contain valid data.
	//!
	//! \return Returns the number of elements read from the SSI receive FIFO.
	//
	//*****************************************************************************
	int32_t CSsi::hwDataGetNonBlocking(uint32_t *pulData)
	{

		//
		// Check for data to read.
		//
		if(HWREG(mBase + SSI_O_SR) & SSI_SR_RNE)
		{
			*pulData = HWREG(mBase + SSI_O_DR);
			return(1);
		}
		else
		{
			return(0);
		}
	}

	//*****************************************************************************
	//
	//! Enable SSI DMA operation.
	//!
	//! \param ulDMAFlags is a bit mask of the DMA features to enable.
	//!
	//! The specified SSI DMA features are enabled.  The SSI can be
	//! configured to use DMA for transmit and/or receive data transfers.
	//! The \e ulDMAFlags parameter is the logical OR of any of the following
	//! values:
	//!
	//! - SSI_DMA_RX - enable DMA for receive
	//! - SSI_DMA_TX - enable DMA for transmit
	//!
	//! \note The uDMA controller must also be set up before DMA can be used
	//! with the SSI.
	//!
	//! \return None.
	//
	//*****************************************************************************
	void CSsi::hwDMAEnable(uint32_t ulDMAFlags)
	{
		//
		// Set the requested bits in the UART DMA control register.
		//
		HWREG(mBase + SSI_O_DMACTL) |= ulDMAFlags;
	}

	//*****************************************************************************
	//
	//! Disable SSI DMA operation.
	//!
	//! \param ulDMAFlags is a bit mask of the DMA features to disable.
	//!
	//! This function is used to disable SSI DMA features that were enabled
	//! by SSIDMAEnable().  The specified SSI DMA features are disabled.  The
	//! \e ulDMAFlags parameter is the logical OR of any of the following values:
	//!
	//! - SSI_DMA_RX - disable DMA for receive
	//! - SSI_DMA_TX - disable DMA for transmit
	//!
	//! \return None.
	//
	//*****************************************************************************
	void CSsi::hwDMADisable(uint32_t ulDMAFlags)
	{
		//
		// Clear the requested bits in the UART DMA control register.
		//
		HWREG(mBase + SSI_O_DMACTL) &= ~ulDMAFlags;
	}

	//*****************************************************************************
	//
	//! Determines whether the SSI transmitter is busy or not.
	//!
	//!
	//! Allows the caller to determine whether all transmitted bytes have cleared
	//! the transmitter hardware.  If \b false is returned, then transmit FIFO is
	//! empty and all bits of the last transmitted word have left the hardware
	//! shift register.
	//!
	//! \return Returns \b true if the SSI is transmitting or \b false if all
	//! transmissions are complete.
	//
	//*****************************************************************************
	bool CSsi::hwBusy()
	{
		//
		// Determine if the SSI is busy.
		//
		return((HWREG(mBase + SSI_O_SR) & SSI_SR_BSY) ? true : false);
	}

}
