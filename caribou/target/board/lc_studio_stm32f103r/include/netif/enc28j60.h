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
#include <caribou++.h>
#include <caribou++/cobject.h>
#include <caribou++/clist.h>
#include <caribou++/cspinlock.h>
#include <caribou++/cbytearray.h>
#include <netif/cspi.h>

#include <stm32f10x_gpio.h>

#ifndef _CENC28J60_H_
#define _CENC28J60_H_

namespace CARIBOU
{
	class CEnc28J60 : public CObject
	{
		public:
			CEnc28J60(CSPI* spi, uint8_t* macaddr=NULL);
			virtual ~CEnc28J60();
			static CEnc28J60*			instance(uint32_t idx);
			void						setMacAddr(CByteArray mac);
			CByteArray					macAddr();
			CSPI*						spi()	{return mSPI;}
			uint8_t						readOp(uint8_t op, uint8_t address);
			void						writeOp(uint8_t op, uint8_t address, uint8_t data);
			void						readBuffer(uint8_t* data,uint32_t len);
			void						writeBuffer(uint8_t* data,uint32_t len);
			void						setBank(uint8_t address);
			void						phyWrite(uint8_t address, uint32_t data);
			void						clkout(uint8_t clk);
			uint8_t						getrev(void);
			void						packetSend(uint8_t* packet,uint32_t len);
			uint32_t					packetReceive(uint8_t* packet,uint32_t maxlen);
			uint32_t					interruptDisable();
			void						interruptEnable(uint32_t level);
			bool						linkStatus();
		protected:
			uint8_t						spi_read_write(uint8_t wb);
			uint8_t						_read(uint8_t address);
			void						_write(uint8_t address, uint8_t data);
			uint8_t						mEnc28j60Bank;
			uint32_t					mNextPacketPtr;
			CSPI*						mSPI;
			static CList<CEnc28J60*>	mInstances;
			static CSpinLock			mLocker;
	};
}

#endif
