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
#ifndef CARIBOUCETHERNET_DEVICE_H
#define CARIBOUCETHERNET_DEVICE_H

#include "caribou++.h"
#include "cevent.h"
#include "cringbuffer.h"
#include "clist.h"
#include "cmutex.h"
#include "cethernet_interface.h"
#include "uip.h"
#include "cspinlock.h"

namespace CARIBOU {

	/**
	 ** @brief Implements the ethernet device.
	 **/
	class CEthernet_Device : public  CEthernet_Interface
	{
			typedef struct
			{
				int32_t	len;
				uint8_t	buf[UIP_BUFSIZE + 2];
			} tPacket;

		public:
			CEthernet_Device(const char* name, uint16_t stksize=DEFAULT_STACK_SIZE, uint16_t priority=NORMALPRIO);
			virtual ~CEthernet_Device();

			/**
			 ** @brief Called periodically by CTaskScheduler to do a piece of work.
			 ** @return 0 on success.
			 **/
			virtual	void*					run();

			/**
			 ** @brief Receive a software event.
			 **/
			virtual	void					event(CEvent* e);

			/**
			 ** @brief receive a hardware interrupt. If this object has register itself
			 ** @brief as in interrupt handler using CMachine::installVectorIRQ(...)
			 ** @brief for a particular vector. This interrupts will come in through this method.
			 **/
			virtual	void					irq(CObject::Vector v);

			/**
			 ** @brief Return the base address of the ethernet peripheral
			 **/
			inline uint32_t					base()				{return mBase;}
			static CEthernet_Device*		instance(int n=0)	{return mEthernetInstance;}
			static CEthernet_Device*		instance(const char* name) {return mEthernetInstance;}

			int32_t							send();
			int32_t							read();

			uint32_t						interruptStatus(bool bMasked);
			void							interruptEnable(uint32_t ulIntFlags);
			void							interruptDisable(uint32_t ulIntFlags);
			void							disableDisable(uint32_t ulIntFlags);
			void							clearInterrupt(uint32_t ulIntFlags);

			/** stats */
			inline uint32_t					rxPackets()						{return mRXPackets;}
			inline uint32_t					txPackets()						{return mTXPackets;}
			inline uint32_t					droppedPackets()				{return mDroppedPackets;}

			/** tcp */
			void							tcpListen( int16_t port );
			void							tcpUnListen( int16_t port );

		protected:
			void							hwInitExpClk(uint32_t ulEthClk);
			void							hwConfigSet(uint32_t ulConfig);
			uint32_t						hwConfigGet();
			void							hwMACAddrSet(uint8_t *pucMACAddr);
			void							hwMACAddrGet(uint8_t *pucMACAddr);
			void							hwEnable();
			void							hwDisable();
			bool							hwPacketAvail();
			bool							hwSpaceAvail();
			int32_t							hwPacketGetNonBlocking(uint8_t *pucBuf, int32_t lBufLen);
			int32_t							hwPacketGet(uint8_t *pucBuf, int32_t lBufLen);
			int32_t							hwPacketPutNonBlocking(uint8_t *pucBuf, int32_t lBufLen);
			int32_t							hwPacketPut(uint8_t *pucBuf, int32_t lBufLen);
			void							hwIntEnable(uint32_t ulIntFlags);
			void							hwIntDisable(uint32_t ulIntFlags);
			uint32_t						hwIntStatus(bool bMasked);
			void							hwIntClear(uint32_t ulIntFlags);
			void							hwPHYWrite(uint8_t ucRegAddr, uint32_t ulData);
			uint32_t						hwPHYRead(uint8_t ucRegAddr);

		private:

			/** tcp */
			void							addTcpListeners();
			void							removeTcpListeners();

			inline void						flagSet(uint8_t n)		{mFlags |= n;}
			inline void						flagClear(uint8_t n)	{mFlags &= ~n;}
			inline uint8_t					flag(uint8_t n)			{return (mFlags | n);}

			int32_t							hwPacketGetInternal(uint8_t *pucBuf, int32_t lBufLen);
			int32_t							hwPacketPutInternal(uint8_t *pucBuf, int32_t lBufLen);

			void							setEthernetLEDPins(uint32_t ulPort,uint8_t ucPins);

			void							periodicTimer();
			void							arpTimer();
			void							dump(const char* buf, int len);

			/* receive-buffer management */
			tPacket*						rxEnqueue();
			tPacket*						rxDequeue();
			bool							rxQueueEmpty();
			bool							rxQueueFull();

			/* transmit-buffer management */
			bool							txEnqueue(uint8_t* buf, uint32_t len);
			tPacket*						txDequeue();
			bool							txQueueEmpty();
			bool							txQueueFull();

		private:
			static CEthernet*				mEthernetInstance;
			static struct uip_eth_addr		mMacAddr;

			uint32_t						mBase;

			/** tcp */
			CMutex							mTCPListenerMutex;					/** syncronize listener list */
			CList<uint16_t> 				mTCPListenerQueue;					/** que of listener ports */
			CList<uint16_t> 				mTCPUnListenerQueue;				/** que of listener ports */

			/** statistic */
			uint32_t						mRXPackets;							/** count number of tx packets */
			uint32_t						mTXPackets;							/** count number of tx packets */
			uint32_t						mDroppedPackets;					/** count number of dropped packets */
			uint32_t						mMemErrors;							/** count mem faults */
			void*							mPeriodicTimerID;					/** The periodic timer */
			void*							mARPTimerID;						/** The ARP timer */
			uint8_t							mFlags;								/** Various flags */

			/* receive-buffer management */
			CList<tPacket*> 				mTXQueue;							/** receive buffers */
			uint8_t							mTXQueueHead;						/** head pointer */
			uint8_t							mTXQueueTail;						/** tail pointer */

			CList<tPacket*> 				mRXQueue;							/** receive buffers */
			uint8_t							mRXQueueHead;						/** head pointer */
			uint8_t							mRXQueueTail;						/** tail pointer */
	};

} /* namespace CARIBOU */

#endif
