/******************************************************************************
* Copyright © 2005-2012 by Pike Aerospace Research Corporation
* All Rights Reserved
*
*   This file is part of CARIBOU RTOS.
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
#ifndef CARIBOUCUART_DRIVER_H
#define CARIBOUCUART_DRIVER_H

#include "caribou++.h"
#include "cringbuffer.h"
#include "cuart_interface.h"

namespace CARIBOU {

	/**
	 * LPC2468 UART Device Driver
	*/
	class CUart_Driver : public CUart_Interface
	{
		public:
			CUart_Driver(int port, uint32_t baud, uint32_t mode);
			virtual ~CUart_Driver();

			static	void				initialize();

			virtual	bool				open(CIODevice::IOMode_t mode);
			virtual	void				close();
			virtual bool				isOpen();

			virtual bool				canSeek()						{return false;}
			virtual	int					tell()							{return -1;}
			virtual	int					seek(int offset, int whence)	{return -1;}
			virtual	int					rewind()						{return -1;}

			virtual	int					bytesAvailable();

			virtual	void				dtrOn();
			virtual	void				dtrOff();
			virtual	bool				dtrState();

			virtual void				enable();
			virtual void				disable();

			virtual int					putchar(int ch);
			virtual	int					getchar();

			virtual	uint16_t			port()							{return mPort;}

			virtual void				setBaud(uint32_t baud);
			virtual uint32_t			baud();

			virtual void				setMode(uint32_t mode);
			virtual uint32_t			mode();

		protected:

			virtual void				irq(InterruptVector vector);

			virtual	void				uartTX(uint8_t ch);
			virtual	bool				uartTxReady();
			virtual	bool				uartRXReady();
			virtual bool				txNonBlock(uint8_t ucData);
			virtual	int32_t				rxNonBlock();
			CRingBuffer&				rxBuffer()				{return mRxBuffer;}
			CRingBuffer&				txBuffer()				{return mTxBuffer;}

			virtual	void				rxHint(int rx) {}	// override to be notified when data is received
			virtual	void				txHint(int tx) {}	// override to be notified when data is transmitted

			uint32_t					clock();

			inline void*					base()					{return mBase;}
			inline InterruptVector		vector()				{return mVector;}

		private:
			uint32_t					status(bool bMasked);
			void						clear(uint32_t ulIntFlags);
			void						enableInt(uint32_t ulIntFlags);
			void						disableInt(uint32_t ulIntFlags);
			void						setConfig(uint32_t ulUARTClk, uint32_t ulBaud, uint32_t ulConfig);
			void						getConfig(uint32_t *pulBaud, uint32_t *pulConfig);

			uint16_t					mPort; 		// The logical device port#.
			void*						mBase;		// base port address.
			void*						mLSR;		// Line Status Register
			void*						mTHR;		// Transmitter Holding Register
			void*						mRBR;		// Receive Buffer Register
			void*						mFCR;
			void*						mIIR;		// Interrupt Idendification Register
			void*						mIER;		// Interrupt Enable Register
			InterruptVector				mVector;	// The interrupt vector.

			CRingBuffer					mRxBuffer;	// receive buffer
			CRingBuffer					mTxBuffer;	// transmit buffer
	};

} /* namespace CARIBOU */

#endif
