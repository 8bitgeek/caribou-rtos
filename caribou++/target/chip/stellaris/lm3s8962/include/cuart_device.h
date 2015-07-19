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
#ifndef CARIBOUCUARTDEVICE_H
#define CARIBOUCUARTDEVICE_H

#include "caribou++.h"
#include "ciostream.h"
#include "ciodevice.h"
#include "cevent.h"
#include "cringbuffer.h"
#include "cuart_interface.h"

#include "inc/hw_types.h"

#define UART_DEFAULT_BAUD 9600

namespace CARIBOU {

	/**
	 * Device specific uart implementation
	 * @author Michael Sharkey <mike@pikeaero.com>
	*/
	class CUart_Device : public CUart_Interface
	{
		public:
			CUart_Device(int port, uint32_t baud, uint32_t mode);
			virtual ~CUart_Device();

			static	void				initialize();

			virtual	bool				open(CIODevice::IOMode_t mode);
			virtual	void				close();
			virtual bool				isOpen();

			virtual bool				canSeek()						{return false;}
			virtual	int					tell()							{return -1;}
			virtual	int					seek(int offset, int whence)	{return -1;}
			virtual	int					rewind()						{return -1;}


			virtual	int					bytesAvailable();

			uint16_t					port() {return mPort;}

			virtual	void				dtrOn();
			virtual	void				dtrOff();
			virtual	bool				dtrState();

			virtual void				enable();
			virtual void				disable();

			int							putchar(int ch);
			int							getchar();

			void						setBaud(uint32_t baud);
			uint32_t					baud();

			void						setMode(uint32_t mode);
			uint32_t					mode();


		protected:

			virtual void				irq(InterruptVector vector);

			virtual	void				uartTX(uint8_t ch);
			virtual	bool				uartTxReady();
			virtual	bool				uartRXReady();
			virtual bool				txNonBlock(uint8_t ucData);
			virtual	int32_t				rxNonBlock();
			CRingBuffer&				rxBuffer()				{return mRxBuffer;}
			CRingBuffer&				txBuffer()				{return mTxBuffer;}

			uint32_t					clock();
			uint32_t					base();
			InterruptVector				vector();

		private:
			uint32_t					status(bool bMasked);
			void						clear(uint32_t ulIntFlags);
			void						enableInt(uint32_t ulIntFlags);
			void						disableInt(uint32_t ulIntFlags);
			void						setConfig(uint32_t ulUARTClk, uint32_t ulBaud, uint32_t ulConfig);
			void						getConfig(uint32_t *pulBaud, uint32_t *pulConfig);

			uint16_t					mPort; 		// The logical device port#.
			CRingBuffer					mRxBuffer;	// receive buffer
			CRingBuffer					mTxBuffer;	// transmit buffer
	};

} /* namespace CARIBOU */

#endif
