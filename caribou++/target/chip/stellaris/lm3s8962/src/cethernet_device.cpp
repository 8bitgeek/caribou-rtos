/******************************************************************************
* Copyright © 2005-2012 by Pike Aerospace Research Corporation
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
#include "cethernet.h"
#include "cevent.h"
#include "ctimerevent.h"
#include "csettings.h"
#include "uip.h"
#include "uip_arp.h"
#include "clock.h"

//#define tBoolean bool

#include "hw_types.h"
#include "sysctl.h"
#include "hw_memmap.h"
#include "hw_ethernet.h"
#include "hw_gpio.h"
#include "gpio.h"
#include "ethernet.h"

#define	FLAG_PERIODIC_TIMER			0x01		/* periodic timer has expired */
#define	FLAG_ARP_TIMER				0x02		/* arp timer has expired */

#define UIP_PERIODIC_TIMER_MS   	250
#define UIP_ARP_TIMER_MS        	8000

//#define 	UDPBUF   ((struct uip_udpip_hdr *)&uip_buf[UIP_LLH_LEN])


//*****************************************************************************
//
// Macro for accessing the Ethernet header information in the buffer.
//
//*****************************************************************************
#define BUF                     ((struct uip_eth_hdr *)&uip_buf[0])

extern "C" void uip_log(char* s)
{
	//debug_printf("%s\n",s);
}

namespace CARIBOU
{

	CEthernet_Device*		CEthernet_Device::mEthernetInstance;
	struct uip_eth_addr		CEthernet_Device::mMacAddr;

	#define inherited CEthernet_Base

	CEthernet_Device::CEthernet_Device(const char* name, uint16_t stksize, uint16_t priority)
	 : inherited(name,stksize,priority)
	 , mBase(ETH_BASE)
	 , mRXPackets(0)
	 , mTXPackets(0)
	 , mDroppedPackets(0)
	 , mMemErrors(0)
	 , mPeriodicTimerID(0)
	 , mARPTimerID(0)
	 , mFlags(0)
	 , mTXQueueHead(0)
	 , mTXQueueTail(0)
	 , mRXQueueHead(0)
	 , mRXQueueTail(0)
	{
		mEthernetInstance = this;
		start();
	}

	CEthernet_Device::~CEthernet_Device()
	{
		mEthernetInstance = NULL;
	}

	/**
	 ** @brief called periodically by CTaskScheduler to do a piece of work.
	 ** @return 0 on success.
	 */
	void* CEthernet_Device::run()
	{
		void* rc=NULL;
		static struct uip_eth_addr sTempAddr;
		uint32_t temp;
		CSettings settings;

		for(int n=0; n < MAX_ETHERNET_TX_QUEUE; n++)
		{
			mTXQueue.append((tPacket*)malloc(sizeof(tPacket)));
		}

		for(int n=0; n < MAX_ETHERNET_RX_QUEUE; n++)
		{
			mRXQueue.append((tPacket*)malloc(sizeof(tPacket)));
		}

		CByteArray mac = settings.macAddr();
		CByteArray ip = settings.ipAddr();
		CByteArray mask = settings.ipMask();
		CByteArray gw = settings.ipGateway();

		mMacAddr.addr[0] = mac.at(0);
		mMacAddr.addr[1] = mac.at(1);
		mMacAddr.addr[2] = mac.at(2);
		mMacAddr.addr[3] = mac.at(3);
		mMacAddr.addr[4] = mac.at(4);
		mMacAddr.addr[5] = mac.at(5);

		/**
		 ** Hardware initialization
		 **/
		CObject::installVectorIRQ(CObject::Vector_ETHERNET,this);
		driver_hw_peripheral_enable(SYSCTL_PERIPH_ETH);
		/**
		 ** Enable transmit and receive...
		 **/
		HWREG(base() + MAC_O_RCTL) |= 1;
		HWREG(base() + MAC_O_TCTL) |= 1;

		hwMACAddrSet((uint8_t*)mac.data());
		uip_setethaddr(mMacAddr);
		//setEthernetLEDPins(GPIO_PORTF_BASE, GPIO_PIN_2 | GPIO_PIN_3);
		/**
		 ** Do whatever else is needed to initialize interface.
		 ** Disable all Ethernet Interrupts.
		 **/
		hwIntDisable((ETH_INT_PHY | ETH_INT_MDIO | ETH_INT_RXER | ETH_INT_RXOF | ETH_INT_TX | ETH_INT_TXER | ETH_INT_RX));
		hwIntClear(hwIntStatus(false));
		hwInitExpClk(driver_clock_freq());								/* Initialize the Ethernet Controller. */
		/**
		 ** Configure the Ethernet Controller for normal operation.
		 ** - Enable TX Duplex Mode
		 ** - Enable TX Padding
		 ** - Enable TX CRC Generation
		 **/
		hwConfigSet((ETH_CFG_TX_DPLXEN |ETH_CFG_TX_CRCEN |	ETH_CFG_TX_PADEN | ETH_CFG_RX_BADCRCDIS /* | ETH_CFG_RX_PRMSEN */ ));
		hwEnable();														/* Enable the Ethernet Controller transmitter and receiver. */
		CObject::enableVector(CObject::Vector_ETHERNET);				/* Enable the Ethernet Interrupt handler. */
		/**
		 ** Initialize uIP
		 **/
		uip_ipaddr_t ipaddr;
		uip_init();
		clock_init();
		uip_arp_init();
		if ( settings.dhcpEnabled() )
		{
			uip_ipaddr(ipaddr, 0,0,0,0);
			uip_sethostaddr(ipaddr);
			uip_ipaddr(ipaddr, 0,0,0,0);
			uip_setnetmask(ipaddr);
			uip_ipaddr(ipaddr, 0,0,0,0);
			uip_setdraddr(ipaddr);
			/**
			** Initialize the DHCP Client Application.
			*/
			//dhcpc_init(&mMacAddr.addr[0], 6);
			//dhcpc_request();
			//new CDHCPClient("dhcpd");
		}
		else
		{
			uip_ipaddr(ipaddr, ip.at(0),ip.at(1),ip.at(2),ip.at(3));
			uip_sethostaddr(ipaddr);
			uip_ipaddr(ipaddr, mask.at(0),mask.at(1),mask.at(2),mask.at(3));
			uip_setnetmask(ipaddr);
			uip_ipaddr(ipaddr, gw.at(0),gw.at(1),gw.at(2),gw.at(3));
			uip_setdraddr(ipaddr);
		}
		hwIntEnable(ETH_INT_RX | ETH_INT_TX);						/* Enable Ethernet TX and RX Packet Interrupts. */
		//hwIntEnable(ETH_INT_RX);						/* Enable Ethernet TX and RX Packet Interrupts. */

		/**
		** Start timers...
		*/
		CObject::installListener(this,CEvent::TimerEvent);
		mPeriodicTimerID = startTimer(UIP_PERIODIC_TIMER_MS);		/** The periodic timer */
		mARPTimerID = startTimer(UIP_ARP_TIMER_MS);					/** The ARP timer */

		/** work... */
		flagSet(FLAG_PERIODIC_TIMER);
		flagSet(FLAG_ARP_TIMER);
		while ( true )
		{
			do {
				if( !read() )
				{
					if ( flag(FLAG_PERIODIC_TIMER) )
					{
						flagClear( FLAG_PERIODIC_TIMER );
						periodicTimer();
					}
					if ( flag(FLAG_ARP_TIMER) )
					{
						flagClear(FLAG_ARP_TIMER);
						arpTimer();
					}
				}
			} while (!rxQueueEmpty());
			yield();
			addTcpListeners();
			removeTcpListeners();
		}
		return 0;
	}

	/**
	* @brief Called from potentially another thread to add a uIP listener. Executes in application thread.
	*/
	void CEthernet_Device::tcpListen( int16_t port )
	{
		mTCPListenerMutex.lock();
		mTCPListenerQueue.append(port);
		mTCPListenerMutex.unlock();
	}


	/**
	* @brief De-queue listener ports and set up tcp listeners. Executes in uIP thread.
	*/
	void CEthernet_Device::addTcpListeners()
	{
		if ( mTCPListenerQueue.count() )
		{
			mTCPListenerMutex.lock();
			uip_listen(HTONS(mTCPListenerQueue.take(0)));
			mTCPListenerMutex.unlock();
		}
	}

	/**
	* @brief Called from potentially another thread to remove a uIP listener. Executes in application thread.
	*/
	void CEthernet_Device::tcpUnListen( int16_t port )
	{
		mTCPListenerMutex.lock();
		mTCPUnListenerQueue.append(port);
		mTCPListenerMutex.unlock();
	}


	/**
	* @brief De-queue listener ports and set up tcp listeners. Executes in uIP thread.
	*/
	void CEthernet_Device::removeTcpListeners()
	{
		if ( mTCPUnListenerQueue.count() )
		{
			mTCPListenerMutex.lock();
			uip_unlisten(HTONS(mTCPUnListenerQueue.take(0)));
			mTCPListenerMutex.unlock();
		}
	}

	/**
	* Things to do when the periodic timer fires
	*/
	void CEthernet_Device::periodicTimer()
	{
		/** TCP */
		for(register int ulTemp = 0; ulTemp < UIP_CONNS; ulTemp++)
		{
			uip_periodic(ulTemp);

			/**
			** If the above function invocation resulted in data that
			** should be sent out on the network, the global variable
			** uip_len is set to a value > 0.
			*/
			if(uip_len > 0)
			{
				uip_arp_out();
				txEnqueue(uip_buf, uip_len);
				uip_len = 0;
			}
		}

		/** UDP **/
		for(register int ulTemp = 0; ulTemp < UIP_UDP_CONNS; ulTemp++)
		{
			uip_udp_periodic(ulTemp);

			/**
			** If the above function invocation resulted in data that
			** should be sent out on the network, the global variable
			** uip_len is set to a value > 0.
			*/
			if(uip_len > 0)
			{
				uip_arp_out();
				txEnqueue(uip_buf, uip_len);
				uip_len = 0;
			}
		}
	}

	/**
	* Things to do when the ARP timer fires.
	*/
	void CEthernet_Device::arpTimer()
	{
		uip_arp_timer();
	}

	int32_t CEthernet_Device::send()
	{
		return 0;
	}

	/**
	 ** Check for an RX Packet and read it.
	 */
	int32_t CEthernet_Device::read()
	{
		hwIntDisable(ETH_INT_RX);
		tPacket* packet = rxDequeue();
		if(packet != NULL && packet->len > 0)
		{
			/* Set uip_len for uIP stack usage. */
			memcpy(&uip_buf[0],packet->buf,packet->len);
			uip_len = (unsigned short)packet->len;
			hwIntEnable(ETH_INT_RX);
			switch (ntohs(BUF->type))
			{
				case UIP_ETHTYPE_IP:								/* Process incoming IP packets here. */
				{
					uip_arp_ipin();
					uip_input();
					/*
					** If the above function invocation resulted in data that
					** should be sent out on the network, the global variable
					** uip_len is set to a value > 0.
					*/
					if(uip_len > 0)
					{
						uip_arp_out();
						txEnqueue(uip_buf, uip_len);
						uip_len = 0;
					}
				}
				break;
				case UIP_ETHTYPE_ARP:								/* Process incoming ARP packets here. */
				{
					uip_arp_arpin();
					/*
					** If the above function invocation resulted in data that
					** should be sent out on the network, the global variable
					** uip_len is set to a value > 0.
					*/
					if(uip_len > 0)
					{
						txEnqueue(uip_buf, uip_len);
						uip_len = 0;
					}
				}
				break;
				default:
					return 0;
				break;
			}
			return packet->len;
		}
		else
		{
			hwIntEnable(ETH_INT_RX);
		}
		return 0;
	}

	/**
	 ** @brief Receive a software event.
	 ** @param e Contains the event type and sender.
	 **/
	void CEthernet_Device::event(CEvent* e)
	{
		inherited::event(e);
		if ( e->type() == CEvent::TimerEvent )
		{
			CTimerEvent* te = (CTimerEvent*)e;
			if ( te->timerId() == mPeriodicTimerID )
			{
				flagSet(FLAG_PERIODIC_TIMER);
			}
			else if ( te->timerId() == mARPTimerID )
			{
				flagSet(FLAG_ARP_TIMER);
			}
		}
	}

	/**
	* Dequeue the next ethernet buffer.
	*/
	CEthernet_Device::tPacket* CEthernet_Device::rxDequeue()
	{
		if ( !rxQueueEmpty() )
		{
			tPacket* p = mRXQueue.at(mRXQueueTail++);
			if ( mRXQueueTail >= MAX_ETHERNET_RX_QUEUE )
			{
				mRXQueueTail=0;
			}
			return p;
		}
		return NULL;
	}

	/**
	* Enqueue the next ethernet buffer and return a pointer to it.
	*/
	CEthernet_Device::tPacket* CEthernet_Device::rxEnqueue()
	{
		if ( !rxQueueFull() )
		{
			tPacket* p = mRXQueue.at(mRXQueueHead++);
			if ( mRXQueueHead >= MAX_ETHERNET_RX_QUEUE )
			{
				mRXQueueHead=0;
			}
			return p;
		}
		return NULL;
	}

	/**
	* @brief Determine if the transmit buffer is full
	*/
	bool CEthernet_Device::rxQueueFull()
	{
		if ( mRXQueueHead == mRXQueueTail-1 )
		{
			return true;
		}
		if ( mRXQueueHead == (MAX_ETHERNET_RX_QUEUE-1) && mRXQueueTail == 0 )
		{
			return true;
		}
		return false;
	}

	/**
	* @brief Detect the receive-queue is empty.
	*/
	bool CEthernet_Device::rxQueueEmpty()
	{
		return (mRXQueueHead == mRXQueueTail);
	}

	/**
	* @brief Enqueue some data to transmit
	* @return true of the buffer was enqueued
	*/
	bool CEthernet_Device::txEnqueue(uint8_t* buf, uint32_t len)
	{
		/* If there is nothing in the transmit queue, then try to trasnmit the packet directly.... */
		hwIntDisable(ETH_INT_TX);
		if ( txQueueEmpty() )
		{
			if ( hwPacketPutNonBlocking(buf,len) )
			{
				/* nothing more to do. */
				hwIntEnable(ETH_INT_TX);
				return true;
			}
		}
		/* Do we already have something else to transmit? */
		if ( !txQueueEmpty() )
		{
			/* get a pointer to the top of the queue... */
			tPacket* p = mTXQueue.at(mTXQueueTail);
			/* ...and try to transmit a packet... */
			if ( hwPacketPutNonBlocking(p->buf,p->len) )
			{
				/* okay, the transmitter accepted it, so de-queue it now. */
				txDequeue();
				hwIntEnable(ETH_INT_TX);
				return true;
			}
		}
		/* Enable interrupts and wait for the queue to empty before enquing the new packet... */
		hwIntEnable(ETH_INT_TX);
		while ( txQueueFull() )
		{
			yield();
		};
		return txEnqueue(buf,len);
	}

	/**
	* @brief Extract the next buffer from the transmit queue.
	* @return A pointer to the buffer or NULL.
	*/
	CEthernet_Device::tPacket* CEthernet_Device::txDequeue()
	{
		if ( !txQueueEmpty() )
		{
			tPacket* p = mTXQueue.at(mTXQueueTail++);
			if ( mTXQueueTail >= MAX_ETHERNET_TX_QUEUE )
			{
				mTXQueueTail=0;
			}
			return p;
		}
		return NULL;
	}

	/**
	* @brief Determine if the transmit queue is empty
	*/
	bool CEthernet_Device::txQueueEmpty()
	{
		return (mTXQueueHead == mTXQueueTail);
	}

	/**
	* @brief Determine if the transmit buffer is full
	*/
	bool CEthernet_Device::txQueueFull()
	{
		if ( mTXQueueHead == mTXQueueTail-1 )
		{
			return true;
		}
		if ( mTXQueueHead == (MAX_ETHERNET_TX_QUEUE-1) && mTXQueueTail == 0 )
		{
			return true;
		}
		return false;
	}

	/**
	 * Process tx and rx packets at the low-level interrupt.
	 *
	 * Should be called from the Stellaris Ethernet Interrupt Handler.  This
	 * function will read packets from the Stellaris Ethernet fifo and place them
	 * into a pbuf queue.  If the transmitter is idle and there is at least one packet
	 * on the transmit queue, it will place it in the transmit fifo and start the
	 * transmitter.
	 */
	void CEthernet_Device::irq(CObject::Vector v)
	{
		uint32_t ulTemp;

		/** Read and Clear the interrupt. */
		ulTemp = hwIntStatus(false);
		hwIntClear(ulTemp);

		/** Check to see if an RX Interrupt has occured. */
		if( ulTemp & ETH_INT_RX )
		{
			tPacket* p;
			/** Disable Ethernet RX Interrupt. */
			hwIntDisable(ETH_INT_RX);
			/** Try to get a packet buffer. */
			p = rxEnqueue();
			if ( p != NULL )
			{
				/** We got a packet buffer, transfer the data and size to the packet buffer */
				p->len = hwPacketGetNonBlocking(p->buf, UIP_BUFSIZE + 2);
				/** Re-enable ethernet RX Interrupt only if we've read the packet out, otherwise we'll be right back here. */
				hwIntEnable(ETH_INT_RX);
			}
		}
		/** Check to see if a TX Interrupt has occured. */
		if( ulTemp & ETH_INT_TX )
		{
			hwIntDisable(ETH_INT_TX);
			if ( !txQueueEmpty() )
			{
				/** Get a pointer to the top of the queue... */
				tPacket* p = mTXQueue.at(mTXQueueTail);
				/** ...and try to transmit a packet... */
				if ( hwPacketPutNonBlocking(p->buf,p->len) )
				{
					/** Okay, the transmitter accepted it, so de-queue it now... */
					txDequeue();
				}
			}
			hwIntEnable(ETH_INT_TX);
		}
	}

	//*****************************************************************************
	//
	//! Sets the configuration of the Ethernet controller.
	//!
	//! \param ulConfig is the configuration for the controller.
	//!
	//! After the EthernetInitExpClk() function has been called, this API function
	//! can be used to configure the various features of the Ethernet controller.
	//!
	//! The Ethernet controller provides three control registers that are used
	//! to configure the controller's operation.  The transmit control register
	//! provides settings to enable full duplex operation, to auto-generate the
	//! frame check sequence, and to pad the transmit packets to the minimum
	//! length as required by the IEEE standard.  The receive control register
	//! provides settings to enable reception of packets with bad frame check
	//! sequence values and to enable multi-cast or promiscuous modes.  The
	//! timestamp control register provides settings that enable support logic in
	//! the controller that allow the use of the General Purpose Timer 3 to capture
	//! timestamps for the transmitted and received packets.
	//!
	//! The \e ulConfig parameter is the logical OR of the following values:
	//!
	//! - \b ETH_CFG_TS_TSEN - Enable TX and RX interrupt status as CCP timer
	//! inputs
	//! - \b ETH_CFG_RX_BADCRCDIS - Disable reception of packets with a bad CRC
	//! - \b ETH_CFG_RX_PRMSEN - Enable promiscuous mode reception (all packets)
	//! - \b ETH_CFG_RX_AMULEN - Enable reception of multicast packets
	//! - \b ETH_CFG_TX_DPLXEN - Enable full duplex transmit mode
	//! - \b ETH_CFG_TX_CRCEN - Enable transmit with auto CRC generation
	//! - \b ETH_CFG_TX_PADEN - Enable padding of transmit data to minimum size
	//!
	//! These bit-mapped values are programmed into the transmit, receive, and/or
	//! timestamp control register.
	//!
	//! \return None.
	//
	//*****************************************************************************
	void CEthernet_Device::hwConfigSet(uint32_t ulConfig)
	{
		uint32_t ulTemp;

		/* Set	up the Transmit Control Register. */
		ulTemp  = HWREG(mBase + MAC_O_TCTL);
		ulTemp &= ~(MAC_TCTL_DUPLEX | MAC_TCTL_CRC | MAC_TCTL_PADEN);
		ulTemp |= ulConfig & 0x0FF;
		HWREG(mBase + MAC_O_TCTL) = ulTemp;

		/* Setup the Receive Control Register. */
		ulTemp  = HWREG(mBase + MAC_O_RCTL);
		ulTemp &= ~(MAC_RCTL_BADCRC | MAC_RCTL_PRMS | MAC_RCTL_AMUL);
		ulTemp |= (ulConfig >> 8) & 0x0FF;
		HWREG(mBase + MAC_O_RCTL) = ulTemp;

		/* Setup the Time Stamp Configuration register. */
		ulTemp = HWREG(mBase + MAC_O_TS);
		ulTemp &= ~(MAC_TS_TSEN);
		ulTemp |= (ulConfig >> 16) & 0x0FF;
		HWREG(mBase + MAC_O_TS) = ulTemp;
	}

	//*****************************************************************************
	//
	//! Gets the current configuration of the Ethernet controller.
	//!
	//! This function will query the control registers of the Ethernet controller
	//! and return a bit-mapped configuration value.
	//!
	//! \sa The description of the EthernetConfigSet() function provides detailed
	//! information for the bit-mapped configuration values that will be returned.
	//!
	//! \return Returns the bit-mapped Ethernet controller configuration value.
	//
	//*****************************************************************************
	uint32_t CEthernet_Device::hwConfigGet()
	{
		unsigned long ulConfig;

		/*
		** Read and return the Ethernet controller configuration parameters,
		** properly shifted into the appropriate bit field positions.
		*/
		ulConfig = HWREG(mBase + MAC_O_TS) << 16;
		ulConfig |= (HWREG(mBase + MAC_O_RCTL) & ~(MAC_RCTL_RXEN)) << 8;
		ulConfig |= HWREG(mBase + MAC_O_TCTL) & ~(MAC_TCTL_TXEN);
		return(ulConfig);
	}

	//*****************************************************************************
	//! Sets the MAC address of the Ethernet controller.
	//!
	//! \param pucMACAddr is the pointer to the array of MAC-48 address octets.
	//!
	//! This function will program the IEEE-defined MAC-48 address specified in
	//! \e pucMACAddr into the Ethernet controller.  This address is used by the
	//! Ethernet controller for hardware-level filtering of incoming Ethernet
	//! packets (when promiscuous mode is not enabled).
	//!
	//! The MAC-48 address is defined as 6 octets, illustrated by the following
	//! example address.  The numbers are shown in hexadecimal format.
	//!
	//!         AC-DE-48-00-00-80
	//!
	//! In this representation, the first three octets (AC-DE-48) are the
	//! Organizationally Unique Identifier (OUI).  This is a number assigned by
	//! the IEEE to an organization that requests a block of MAC addresses.  The
	//! last three octets (00-00-80) are a 24-bit number managed by the OUI owner
	//! to uniquely identify a piece of hardware within that organization that is
	//! to be connected to the Ethernet.
	//!
	//! In this representation, the octets are transmitted from left to right,
	//! with the ``AC'' octet being transmitted first and the ``80'' octet being
	//! transmitted last.  Within an octet, the bits are transmitted LSB to MSB.
	//! For this address, the first bit to be transmitted would be ``0'', the LSB
	//! of ``AC'', and the last bit to be transmitted would be ``1'', the MSB of
	//! ``80''.
	//!
	//! \return None.
	//*****************************************************************************
	void CEthernet_Device::hwMACAddrSet(unsigned char *pucMACAddr)
	{
		unsigned long ulTemp;
		unsigned char *pucTemp = (unsigned char *)&ulTemp;
		/*
		** Program the MAC Address into the device.  The first four bytes of the
		** MAC Address are placed into the IA0 register.  The remaining two bytes
		** of the MAC address are placed into the IA1 register.
		*/
		pucTemp[0] = pucMACAddr[0];
		pucTemp[1] = pucMACAddr[1];
		pucTemp[2] = pucMACAddr[2];
		pucTemp[3] = pucMACAddr[3];
		HWREG(base() + MAC_O_IA0) = ulTemp;
		ulTemp = 0;
		pucTemp[0] = pucMACAddr[4];
		pucTemp[1] = pucMACAddr[5];
		HWREG(base() + MAC_O_IA1) = ulTemp;
	}

	//*****************************************************************************
	//! Gets the MAC address of the Ethernet controller.
	//!
	//! \param pucMACAddr is the pointer to the location in which to store the
	//! array of MAC-48 address octets.
	//!
	//! This function will read the currently programmed MAC address into the
	//! \e pucMACAddr buffer.
	//!
	//! \sa Refer to EthernetMACAddrSet() API description for more details about
	//! the MAC address format.
	//!
	//! \return None.
	//*****************************************************************************
	void CEthernet_Device::hwMACAddrGet(uint8_t *pucMACAddr)
	{
		unsigned long ulTemp;
		unsigned char *pucTemp = (unsigned char *)&ulTemp;
		/* Read the MAC address from the device.  The first four bytes of the
		 * MAC address are read from the IA0 register.  The remaining two bytes
		 * of the MAC addres */
		ulTemp = HWREG(base() + MAC_O_IA0);
		pucMACAddr[0] = pucTemp[0];
		pucMACAddr[1] = pucTemp[1];
		pucMACAddr[2] = pucTemp[2];
		pucMACAddr[3] = pucTemp[3];
		ulTemp = HWREG(base() + MAC_O_IA1);
		pucMACAddr[4] = pucTemp[0];
		pucMACAddr[5] = pucTemp[1];
	}

	//*****************************************************************************
	//! Disables the Ethernet controller.
	//!
	//! When terminating operations on the Ethernet interface, this function should
	//! be called.  This function will disable the transmitter and receiver, and
	//! will clear out the receive FIFO.
	//!
	//! \return None.
	//*****************************************************************************
	void CEthernet_Device::hwDisable()
	{
		HWREG(base() + MAC_O_RCTL) |= MAC_RCTL_RSTFIFO;								/** Reset the receive FIFO. */
		HWREG(base() + MAC_O_TCTL) &= ~(MAC_TCTL_TXEN);								/** Disable the Ethernet transmitter. */
		HWREG(base() + MAC_O_RCTL) &= ~(MAC_RCTL_RXEN);								/** Disable the Ethernet receiver. */
		HWREG(base() + MAC_O_RCTL) |= MAC_RCTL_RSTFIFO;								/** Reset the receive FIFO again, after the receiver has been disabled. */
	}

	//*****************************************************************************
	//! Enables the Ethernet controller for normal operation.
	//!
	//! Once the Ethernet controller has been configured using the
	//! EthernetConfigSet() function and the MAC address has been programmed using
	//! the EthernetMACAddrSet() function, this API function can be called to
	//! enable the controller for normal operation.
	//!
	//! This function will enable the controller's transmitter and receiver, and
	//! will reset the receive FIFO.
	//!
	//! \return None.
	//*****************************************************************************
	void CEthernet_Device::hwEnable()
	{
		HWREG(base() + MAC_O_RCTL) |= MAC_RCTL_RSTFIFO;								/** Reset the receive FIFO. */
		HWREG(base() + MAC_O_RCTL) |= MAC_RCTL_RXEN;								/** Enable the Ethernet receiver. */
		HWREG(base() + MAC_O_TCTL) |= MAC_TCTL_TXEN;								/** Enable Ethernet transmitter. */
		HWREG(base() + MAC_O_RCTL) |= MAC_RCTL_RSTFIFO;								/** Reset the receive FIFO again, after the receiver has been enabled. */
	}

	//*****************************************************************************
	//
	//! Check for packet available from the Ethernet controller.
	//!
	//! The Ethernet controller provides a register that contains the number of
	//! packets available in the receive FIFO.  When the last bytes of a packet are
	//! successfully received (that is, the frame check sequence bytes), the packet
	//! count is incremented.  Once the packet has been fully read (including the
	//! frame check sequence bytes) from the FIFO, the packet count will be
	//! decremented.
	//!
	//! \return Returns \b true if there are one or more packets available in the
	//! receive FIFO, including the current packet being read, and \b false
	//! otherwise.
	//
	//*****************************************************************************
	bool CEthernet_Device::hwPacketAvail()
	{
		/* Return the availability of packets. */
		return((HWREG(mBase + MAC_O_NP) & MAC_NP_NPR_M) ? true : false);
	}

	//*****************************************************************************
	//
	//! Checks for packet space available in the Ethernet controller.
	//!
	//! The Ethernet controller's transmit FIFO is designed to support a single
	//! packet at a time.  After the packet has been written into the FIFO, the
	//! transmit request bit must be set to enable the transmission of the packet.
	//! Only after the packet has been transmitted can a new packet be written
	//! into the FIFO.  This function will simply check to see if a packet is
	//! in progress.  If so, there is no space available in the transmit FIFO.
	//!
	//! \return Returns \b true if a space is available in the transmit FIFO, and
	//! \b false otherwise.
	//
	//*****************************************************************************
	bool CEthernet_Device::hwSpaceAvail()
	{
		/* Return the availability of space. */
		return((HWREG(mBase + MAC_O_TR) & MAC_TR_NEWTX) ? false : true);
	}

	//*****************************************************************************
	//
	//! \internal
	//!
	//! Internal function for reading a packet from the Ethernet controller.
	//!
	//! \param pucBuf is the pointer to the packet buffer.
	//! \param lBufLen is the maximum number of bytes to be read into the buffer.
	//!
	//! Based on the following table of how the receive frame is stored in the
	//! receive FIFO, this function will extract a packet from the FIFO and store
	//! it in the packet buffer that was passed in.
	//!
	//! Format of the data in the RX FIFO is as follows:
	//!
	//! \verbatim
	//! +---------+----------+----------+----------+----------+
	//! |         | 31:24    | 23:16    | 15:8     | 7:0      |
	//! +---------+----------+----------+----------+----------+
	//! | Word 0  | DA 2     | DA 1     | FL MSB   | FL LSB   |
	//! +---------+----------+----------+----------+----------+
	//! | Word 1  | DA 6     | DA 5     | DA 4     | DA 3     |
	//! +---------+----------+----------+----------+----------+
	//! | Word 2  | SA 4     | SA 3     | SA 2     | SA 1     |
	//! +---------+----------+----------+----------+----------+
	//! | Word 3  | FT LSB   | FT MSB   | SA 6     | SA 5     |
	//! +---------+----------+----------+----------+----------+
	//! | Word 4  | DATA 4   | DATA 3   | DATA 2   | DATA 1   |
	//! +---------+----------+----------+----------+----------+
	//! | Word 5  | DATA 8   | DATA 7   | DATA 6   | DATA 5   |
	//! +---------+----------+----------+----------+----------+
	//! | Word 6  | DATA 12  | DATA 11  | DATA 10  | DATA 9   |
	//! +---------+----------+----------+----------+----------+
	//! | ...     |          |          |          |          |
	//! +---------+----------+----------+----------+----------+
	//! | Word X  | DATA n   | DATA n-1 | DATA n-2 | DATA n-3 |
	//! +---------+----------+----------+----------+----------+
	//! | Word Y  | FCS 4    | FCS 3    | FCS 2    | FCS 1    |
	//! +---------+----------+----------+----------+----------+
	//! \endverbatim
	//!
	//! Where FL is Frame Length, (FL + DA + SA + FT + DATA + FCS) Bytes.
	//! Where DA is Destination (MAC) Address.
	//! Where SA is Source (MAC) Address.
	//! Where FT is Frame Type (or Frame Length for Ethernet).
	//! Where DATA is Payload Data for the Ethernet Frame.
	//! Where FCS is the Frame Check Sequence.
	//!
	//! \return Returns the negated packet length \b -n if the packet is too large
	//! for \e pucBuf, and returns the packet length \b n otherwise.
	//
	//*****************************************************************************
	int32_t CEthernet_Device::hwPacketGetInternal(uint8_t *pucBuf, int32_t lBufLen)
	{
		register uint32_t ulTemp;
		register int32_t lFrameLen, lTempLen;
		register int32_t i = 0;

		/*
		** Read WORD 0 (see format above) from the FIFO, set the receive
		** Frame Length and store the first two bytes of the destination
		** address in the receive buffer.
		*/
		ulTemp = HWREG(mBase + MAC_O_DATA);
		lFrameLen = (long)(ulTemp & 0xFFFF);
		pucBuf[i++] = (unsigned char) ((ulTemp >> 16) & 0xff);
		pucBuf[i++] = (unsigned char) ((ulTemp >> 24) & 0xff);

		/*
		** Read all but the last WORD into the receive buffer.
		*/
		lTempLen = (lBufLen < (lFrameLen - 6)) ? lBufLen : (lFrameLen - 6);
		while(i <= (lTempLen - 4))
		{
			*(unsigned long *)&pucBuf[i] = HWREG(mBase + MAC_O_DATA);
			i += 4;
		}

		/*
		** Read the last 1, 2, or 3 BYTES into the buffer
		*/
		if(i < lTempLen)
		{
			ulTemp = HWREG(mBase + MAC_O_DATA);
			if(i == lTempLen - 3)
			{
				pucBuf[i++] = ((ulTemp >>  0) & 0xff);
				pucBuf[i++] = ((ulTemp >>  8) & 0xff);
				pucBuf[i++] = ((ulTemp >> 16) & 0xff);
				i += 1;
			}
			else if(i == lTempLen - 2)
			{
				pucBuf[i++] = ((ulTemp >>  0) & 0xff);
				pucBuf[i++] = ((ulTemp >>  8) & 0xff);
				i += 2;
			}
			else if(i == lTempLen - 1)
			{
				pucBuf[i++] = ((ulTemp >>  0) & 0xff);
				i += 3;
			}
		}

		/*
		** Read any remaining WORDS (that did not fit into the buffer).
		*/
		while(i < (lFrameLen - 2))
		{
			ulTemp = HWREG(mBase + MAC_O_DATA);
			i += 4;
		}

		/*
		** If frame was larger than the buffer, return the "negative" frame length
		*/
		lFrameLen -= 6;
		if(lFrameLen > lBufLen)
		{
			return(-lFrameLen);
		}

		/*
		** Return the Frame Length
		*/
		return lFrameLen;
	}

	//*****************************************************************************
	//
	//! Receives a packet from the Ethernet controller.
	//!
	//! \param pucBuf is the pointer to the packet buffer.
	//! \param lBufLen is the maximum number of bytes to be read into the buffer.
	//!
	//! This function reads a packet from the receive FIFO of the controller and
	//! places it into \e pucBuf.  If no packet is available the function will
	//! return immediately.  Otherwise, the function will read the entire packet
	//! from the receive FIFO.  If there are more bytes in the packet than will fit
	//! into \e pucBuf (as specified by \e lBufLen), the function will return the
	//! negated length of the packet and the buffer will contain \e lBufLen bytes
	//! of the packet.  Otherwise, the function will return the length of the
	//! packet that was read and \e pucBuf will contain the entire packet
	//! (excluding the frame check sequence bytes).
	//!
	//! This function replaces the original EthernetPacketNonBlockingGet() API and
	//! performs the same actions.  A macro is provided in <tt>ethernet.h</tt> to
	//! map the original API to this API.
	//!
	//! \note This function will return immediately if no packet is available.
	//!
	//! \return Returns \b 0 if no packet is available, the negated packet length
	//! \b -n if the packet is too large for \e pucBuf, and the packet length \b n
	//! otherwise.
	//
	//*****************************************************************************
	int32_t CEthernet_Device::hwPacketGetNonBlocking(uint8_t *pucBuf,int32_t lBufLen)
	{
		/*
		** Check to see if any packets are available.
		*/
		if((HWREG(mBase + MAC_O_NP) & MAC_NP_NPR_M) != 0)
		{
			/*
			** Read the packet, and return.
			*/
			return hwPacketGetInternal(pucBuf, lBufLen);
		}
		return 0;
	}

	//*****************************************************************************
	//
	//! Waits for a packet from the Ethernet controller.
	//!
	//! \param pucBuf is the pointer to the packet buffer.
	//! \param lBufLen is the maximum number of bytes to be read into the buffer.
	//!
	//! This function reads a packet from the receive FIFO of the controller and
	//! places it into \e pucBuf.  The function will wait until a packet is
	//! available in the FIFO.  Then the function will read the entire packet
	//! from the receive FIFO.  If there are more bytes in the packet than will
	//! fit into \e pucBuf (as specified by \e lBufLen), the function will return
	//! the negated length of the packet and the buffer will contain \e lBufLen
	//! bytes of the packet.  Otherwise, the function will return the length of
	//! the packet that was read and \e pucBuf will contain the entire packet
	//! (excluding the frame check sequence bytes).
	//!
	//! \note This function is blocking and will not return until a packet arrives.
	//!
	//! \return Returns the negated packet length \b -n if the packet is too large
	//! for \e pucBuf, and returns the packet length \b n otherwise.
	//
	//*****************************************************************************
	int32_t CEthernet_Device::hwPacketGet(uint8_t *pucBuf, int32_t lBufLen)
	{
		/*
		** Wait for a packet to become available
		*/
		while((HWREG(mBase + MAC_O_NP) & MAC_NP_NPR_M) == 0) {}


		/*
		** Read the packet
		/*/
		return hwPacketGetInternal(pucBuf, lBufLen);
	}

	//*****************************************************************************
	//
	//! \internal
	//!
	//! Internal function for sending a packet to the Ethernet controller.
	//!
	//! \param pucBuf is the pointer to the packet buffer.
	//! \param lBufLen is number of bytes in the packet to be transmitted.
	//!
	//! Puts a packet into the transmit FIFO of the controller.
	//!
	//! Format of the data in the TX FIFO is as follows:
	//!
	//! \verbatim
	//! +---------+----------+----------+----------+----------+
	//! |         | 31:24    | 23:16    | 15:8     | 7:0      |
	//! +---------+----------+----------+----------+----------+
	//! | Word 0  | DA 2     | DA 1     | PL MSB   | PL LSB   |
	//! +---------+----------+----------+----------+----------+
	//! | Word 1  | DA 6     | DA 5     | DA 4     | DA 3     |
	//! +---------+----------+----------+----------+----------+
	//! | Word 2  | SA 4     | SA 3     | SA 2     | SA 1     |
	//! +---------+----------+----------+----------+----------+
	//! | Word 3  | FT LSB   | FT MSB   | SA 6     | SA 5     |
	//! +---------+----------+----------+----------+----------+
	//! | Word 4  | DATA 4   | DATA 3   | DATA 2   | DATA 1   |
	//! +---------+----------+----------+----------+----------+
	//! | Word 5  | DATA 8   | DATA 7   | DATA 6   | DATA 5   |
	//! +---------+----------+----------+----------+----------+
	//! | Word 6  | DATA 12  | DATA 11  | DATA 10  | DATA 9   |
	//! +---------+----------+----------+----------+----------+
	//! | ...     |          |          |          |          |
	//! +---------+----------+----------+----------+----------+
	//! | Word X  | DATA n   | DATA n-1 | DATA n-2 | DATA n-3 |
	//! +---------+----------+----------+----------+----------+
	//! \endverbatim
	//!
	//! Where PL is Payload Length, (DATA) only
	//! Where DA is Destination (MAC) Address
	//! Where SA is Source (MAC) Address
	//! Where FT is Frame Type (or Frame Length for Ethernet)
	//! Where DATA is Payload Data for the Ethernet Frame
	//!
	//! \return Returns the negated packet length \b -lBufLen if the packet is too
	//! large for FIFO, and the packet length \b lBufLen otherwise.
	//
	//*****************************************************************************
	int32_t CEthernet_Device::hwPacketPutInternal(uint8_t *pucBuf,
	int32_t lBufLen)
	{
		unsigned long ulTemp;
		register long i = 0;

		/*
		** If the packet is too large, return the negative packet length as
		** an error code.
		*/
		if(lBufLen > (2048 - 2))
		{
			return(-lBufLen);
		}

		/*
		** Build and write WORD 0 (see format above) to the transmit FIFO.
		*/
		ulTemp = (unsigned long)(lBufLen - 14);
		ulTemp |= (pucBuf[i++] << 16);
		ulTemp |= (pucBuf[i++] << 24);
		HWREG(mBase + MAC_O_DATA) = ulTemp;

		/*
		** Write each subsequent WORD n to the transmit FIFO, except for the last
		** WORD (if the word does not contain 4 bytes).
		*/
		while(i <= (lBufLen - 4))
		{
			HWREG(mBase + MAC_O_DATA) = *(unsigned long *)&pucBuf[i];
			i += 4;
		}

		/*
		** Build the last word of the remaining 1, 2, or 3 bytes, and store
		** the WORD into the transmit FIFO.
		*/
		if(i != lBufLen)
		{
			if(i == (lBufLen - 3))
			{
				ulTemp  = (pucBuf[i++] <<  0);
				ulTemp |= (pucBuf[i++] <<  8);
				ulTemp |= (pucBuf[i++] << 16);
				HWREG(mBase + MAC_O_DATA) = ulTemp;
			}
			else if(i == (lBufLen - 2))
			{
				ulTemp  = (pucBuf[i++] <<  0);
				ulTemp |= (pucBuf[i++] <<  8);
				HWREG(mBase + MAC_O_DATA) = ulTemp;
			}
			else if(i == (lBufLen - 1))
			{
				ulTemp  = (pucBuf[i++] <<  0);
				HWREG(mBase + MAC_O_DATA) = ulTemp;
			}
		}

		/*
		** Activate the transmitter
		*/
		HWREG(mBase + MAC_O_TR) = MAC_TR_NEWTX;

		/*
		** Return the Buffer Length transmitted.
		*/
		return lBufLen;
	}

	//*****************************************************************************
	//
	//! Sends a packet to the Ethernet controller.
	//!
	//! \param ulBase is the base address of the controller.
	//! \param pucBuf is the pointer to the packet buffer.
	//! \param lBufLen is number of bytes in the packet to be transmitted.
	//!
	//! This function writes \e lBufLen bytes of the packet contained in \e pucBuf
	//! into the transmit FIFO of the controller and then activates the
	//! transmitter for this packet.  If no space is available in the FIFO, the
	//! function will return immediately.  If space is available, the
	//! function will return once \e lBufLen bytes of the packet have been placed
	//! into the FIFO and the transmitter has been started.  The function will not
	//! wait for the transmission to complete.  The function will return the
	//! negated \e lBufLen if the length is larger than the space available in
	//! the transmit FIFO.
	//!
	//! This function replaces the original EthernetPacketNonBlockingPut() API and
	//! performs the same actions.  A macro is provided in <tt>ethernet.h</tt> to
	//! map the original API to this API.
	//!
	//! \note This function does not block and will return immediately if no space
	//! is available for the transmit packet.
	//!
	//! \return Returns \b 0 if no space is available in the transmit FIFO, the
	//! negated packet length \b -lBufLen if the packet is too large for FIFO, and
	//! the packet length \b lBufLen otherwise.
	//
	//*****************************************************************************
	int32_t CEthernet_Device::hwPacketPutNonBlocking(uint8_t* pucBuf,int32_t lBufLen)
	{
		/*
		** Check if the transmit FIFO is in use and return the appropriate code.
		*/
		if(HWREG(mBase + MAC_O_TR) & MAC_TR_NEWTX)
		{
			return(0);
		}

		/*
		** Send the packet and return.
		*/
		return hwPacketPutInternal(pucBuf, lBufLen);
	}

	//*****************************************************************************
	//
	//! Waits to send a packet from the Ethernet controller.
	//!
	//! \param ulBase is the base address of the controller.
	//! \param pucBuf is the pointer to the packet buffer.
	//! \param lBufLen is number of bytes in the packet to be transmitted.
	//!
	//! This function writes \e lBufLen bytes of the packet contained in \e pucBuf
	//! into the transmit FIFO of the controller and then activates the transmitter
	//! for this packet.  This function will wait until the transmit FIFO is empty.
	//! Once space is available, the function will return once \e lBufLen bytes of
	//! the packet have been placed into the FIFO and the transmitter has been
	//! started.  The function will not wait for the transmission to complete.  The
	//! function will return the negated \e lBufLen if the length is larger than
	//! the space available in the transmit FIFO.
	//!
	//! \note This function blocks and will wait until space is available for the
	//! transmit packet before returning.
	//!
	//! \return Returns the negated packet length \b -lBufLen if the packet is too
	//! large for FIFO, and the packet length \b lBufLen otherwise.
	//
	//*****************************************************************************
	int32_t
	CEthernet_Device::hwPacketPut(uint8_t *pucBuf, int32_t lBufLen)
	{
		/*
		** Wait for current packet (if any) to complete.
		*/
		while(HWREG(mBase + MAC_O_TR) & MAC_TR_NEWTX)		{}

		/*
		** Send the packet and return.
		*/
		return hwPacketPutInternal(pucBuf, lBufLen);
	}



	//*****************************************************************************
	//! Disables individual Ethernet interrupt sources.
	//!
	//! \param ulIntFlags is the bit mask of the interrupt sources to be disabled.
	//!
	//! Disables the indicated Ethernet interrupt sources.  Only the sources that
	//! are enabled can be reflected to the processor interrupt; disabled sources
	//! have no effect on the processor.
	//!
	//! The \e ulIntFlags parameter has the same definition as the \e ulIntFlags
	//! parameter to EthernetIntEnable().
	//!
	//! \return None.
	//*****************************************************************************
	void CEthernet_Device::hwIntDisable(uint32_t ulIntFlags)
	{
		HWREG(base() + MAC_O_IM) &= ~ulIntFlags;									/** Disable the specified interrupts. */
	}

	//*****************************************************************************
	//! Enables individual Ethernet interrupt sources.
	//!
	//! \param ulIntFlags is the bit mask of the interrupt sources to be enabled.
	//!
	//! Enables the indicated Ethernet interrupt sources.  Only the sources that
	//! are enabled can be reflected to the processor interrupt; disabled sources
	//! have no effect on the processor.
	//!
	//! The \e ulIntFlags parameter is the logical OR of any of the following:
	//!
	//! - \b ETH_INT_PHY - An interrupt from the PHY has occurred.  The integrated
	//! PHY supports a number of interrupt conditions.  The PHY register, PHY_MR17,
	//! must be read to determine which PHY interrupt has occurred.  This register
	//! can be read using the EthernetPHYRead() API function.
	//! - \b ETH_INT_MDIO - This interrupt indicates that a transaction on the
	//! management interface has completed successfully.
	//! - \b ETH_INT_RXER - This interrupt indicates that an error has occurred
	//! during reception of a frame.  This error can indicate a length mismatch, a
	//! CRC failure, or an error indication from the PHY.
	//! - \b ETH_INT_RXOF - This interrupt indicates that a frame has been received
	//! that exceeds the available space in the RX FIFO.
	//! - \b ETH_INT_TX - This interrupt indicates that the packet stored in the TX
	//! FIFO has been successfully transmitted.
	//! - \b ETH_INT_TXER - This interrupt indicates that an error has occurred
	//! during the transmission of a packet.  This error can be either a retry
	//! failure during the back-off process, or an invalid length stored in the TX
	//! FIFO.
	//! - \b ETH_INT_RX - This interrupt indicates that one (or more) packets are
	//! available in the RX FIFO for processing.
	//!
	//! \return None.
	//*****************************************************************************
	void CEthernet_Device::hwIntEnable(uint32_t ulIntFlags)
	{
		HWREG(base() + MAC_O_IM) |= ulIntFlags;										/** Enable the specified interrupts. */
	}



	//*****************************************************************************
	//! Gets the current Ethernet interrupt status.
	//!
	//! \param bMasked is false if the raw interrupt status is required and true
	//! if the masked interrupt status is required.
	//!
	//! This returns the interrupt status for the Ethernet controller.  Either the
	//! raw interrupt status or the status of interrupts that are allowed to
	//! reflect to the processor can be returned.
	//!
	//! \return Returns the current interrupt status, enumerated as a bit field of
	//! values described in EthernetIntEnable().
	//*****************************************************************************
	uint32_t CEthernet_Device::hwIntStatus(bool bMasked)
	{
		unsigned long ulStatus;
		ulStatus = HWREG(base() + MAC_O_RIS);										/** Read the unmasked status. */
		if(bMasked)																	/** If masked status is requested, mask it off. */
		{
			ulStatus &= HWREG(base() + MAC_O_IM);
		}
		return(ulStatus);															/** Return the interrupt status value. */
	}

	//*****************************************************************************
	//! Clears Ethernet interrupt sources.
	//!
	//! \param ulIntFlags is a bit mask of the interrupt sources to be cleared.
	//!
	//! The specified Ethernet interrupt sources are cleared so that they no longer
	//! assert.  This must be done in the interrupt handler to keep it from being
	//! called again immediately upon exit.
	//!
	//! The \e ulIntFlags parameter has the same definition as the \e ulIntFlags
	//! parameter to EthernetIntEnable().
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
	//*****************************************************************************
	void CEthernet_Device::hwIntClear(uint32_t ulIntFlags)
	{
		HWREG(base() + MAC_O_IACK) = ulIntFlags;									/** Clear the requested interrupt sources. */
	}


	//*****************************************************************************
	//! Initializes the Ethernet controller for operation.
	//!
	//! \param ulEthClk is the rate of the clock supplied to the Ethernet module.
	//!
	//! This function will prepare the Ethernet controller for first time use in
	//! a given hardware/software configuration.  This function should be called
	//! before any other Ethernet API functions are called.
	//!
	//! The peripheral clock will be the same as the processor clock.  This will be
	//! the value returned by SysCtlClockGet(), or it can be explicitly hard-coded
	//! if it is constant and known (to save the code/execution overhead of a call
	//! to CObject::fMCLK()).
	//!
	//! \note If the device configuration is changed (for example, the system clock
	//! is reprogrammed to a different speed), then the Ethernet controller must be
	//! disabled by calling the CEthernet_Device::disable() function and the controller must
	//! be reinitialized by calling the CEthernet_Device::initializeClock() function again.  After
	//! the controller has been reinitialized, the controller should be
	//! reconfigured using the appropriate Ethernet API calls.
	//!
	//! \return None.
	//*****************************************************************************
	void CEthernet_Device::hwInitExpClk(uint32_t ulEthClk)
	{
		unsigned long ulDiv;

		// Set the Management Clock Divider register for access to the PHY
		// register set (via EthernetPHYRead/Write).
		//
		// The MDC clock divided down from the system clock using the following
		// formula.  A maximum of 2.5MHz is allowed for F(mdc).
		//
		//      F(mdc) = F(sys) / (2 * (div + 1))
		//      div = (F(sys) / (2 * F(mdc))) - 1
		//      div = (F(sys) / 2 / F(mdc)) - 1
		//
		// Note: Because we should round up, to ensure we don't violate the
		// maximum clock speed, we can simplify this as follows:
		//
		//      div = F(sys) / 2 / F(mdc)
		//
		// For example, given a system clock of 6.0MHz, and a div value of 1,
		// the mdc clock would be programmed as 1.5 MHz.
		//
		ulDiv = (ulEthClk / 2) / 2500000;
		HWREG(base() + MAC_O_MDV) = (ulDiv & MAC_MDV_DIV_M);
	}

	//*****************************************************************************
	//
	//! Writes to the PHY register.
	//!
	//! \param ucRegAddr is the address of the PHY register to be accessed.
	//! \param ulData is the data to be written to the PHY register.
	//!
	//! This function will write the \e ulData to the PHY register specified by
	//! \e ucRegAddr.
	//!
	//! \return None.
	//
	//*****************************************************************************
	void
	CEthernet_Device::hwPHYWrite(uint8_t ucRegAddr,uint32_t ulData)
	{
		/*
		** Wait for any pending transaction to complete.
		*/
		while(HWREG(mBase + MAC_O_MCTL) & MAC_MCTL_START)	{}

		/*
		** Program the DATA to be written.
		*/
		HWREG(mBase + MAC_O_MTXD) = ulData & MAC_MTXD_MDTX_M;

		/*
		** Program the PHY register address and initiate the transaction.
		*/
		HWREG(mBase + MAC_O_MCTL) = (((ucRegAddr << 3) & MAC_MCTL_REGADR_M) | MAC_MCTL_WRITE | MAC_MCTL_START);

		/*
		** Wait for the write transaction to complete.
		*/
		while(HWREG(mBase + MAC_O_MCTL) & MAC_MCTL_START)	{}
	}

	//*****************************************************************************
	//
	//! Reads from a PHY register.
	//!
	//! \param ulBase is the base address of the controller.
	//! \param ucRegAddr is the address of the PHY register to be accessed.
	//!
	//! This function will return the contents of the PHY register specified by
	//! \e ucRegAddr.
	//!
	//! \return Returns the 16-bit value read from the PHY.
	//
	//*****************************************************************************
	uint32_t CEthernet_Device::hwPHYRead(unsigned char ucRegAddr)
	{
		/*
		** Wait for any pending transaction to complete.
		*/
		while(HWREG(mBase + MAC_O_MCTL) & MAC_MCTL_START)	{}

		//
		// Program the PHY register address and initiate the transaction.
		//
		HWREG(mBase + MAC_O_MCTL) = (((ucRegAddr << 3) & MAC_MCTL_REGADR_M) | MAC_MCTL_START);

		//
		// Wait for the transaction to complete.
		//
		while(HWREG(mBase + MAC_O_MCTL) & MAC_MCTL_START)	{}

		//
		// Return the PHY data that was read.
		//
		return(HWREG(mBase + MAC_O_MRXD) & MAC_MRXD_MDRX_M);
	}

	//*****************************************************************************
	//! Configures pin(s) for use by the Ethernet peripheral as LED signals.
	//!
	//! \param ulPort is the base address of the GPIO port.
	//! \param ucPins is the bit-packed representation of the pin(s).
	//!
	//! The Ethernet peripheral provides two signals that can be used to drive
	//! an LED (e.g. for link status/activity).  This function provides a typical
	//! configuration for the pins.
	//!
	//! The pin(s) are specified using a bit-packed byte, where each bit that is
	//! set identifies the pin to be accessed, and where bit 0 of the byte
	//! represents GPIO port pin 0, bit 1 represents GPIO port pin 1, and so on.
	//!
	//! \note This cannot be used to turn any pin into an Ethernet LED pin; it only
	//! configures an Ethernet LED pin for proper operation.
	//!
	//! \return None.
	//*****************************************************************************
	void CEthernet_Device::setEthernetLEDPins(uint32_t ulPort,uint8_t ucPins)
	{
		/** Make the pin(s) be peripheral controlled. */
		driver_hw_set_gpio_dirmode(ulPort, ucPins, GPIO_DIR_MODE_HW);
		/** Set the pad(s) for standard push-pull operation. */
		driver_hw_set_gpio_padconfig(ulPort, ucPins, GPIO_STRENGTH_8MA, GPIO_PIN_TYPE_STD);
	}


} // namespace CARIBOU


