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
#include "stm32f10x_spi.h"
#include "stm32f10x_gpio.h"
#include "stm32f10x_rcc.h"
#include "netif/enc28j60.h"
#include <stdio.h>


// ENC28J60 Control Registers
// Control register definitions are a combination of address,
// bank number, and Ethernet/MAC/PHY indicator bits.
// - Register address        (bits 0-4)
// - Bank number        (bits 5-6)
// - MAC/PHY indicator        (bit 7)
#define ADDR_MASK        0x1F
#define BANK_MASK        0x60
#define SPRD_MASK        0x80
// All-bank registers
#define EIE              0x1B
#define EIR              0x1C
#define ESTAT            0x1D
#define ECON2            0x1E
#define ECON1            0x1F
// Bank 0 registers
#define ERDPTL           (0x00|0x00)
#define ERDPTH           (0x01|0x00)
#define EWRPTL           (0x02|0x00)
#define EWRPTH           (0x03|0x00)
#define ETXSTL           (0x04|0x00)
#define ETXSTH           (0x05|0x00)
#define ETXNDL           (0x06|0x00)
#define ETXNDH           (0x07|0x00)
#define ERXSTL           (0x08|0x00)
#define ERXSTH           (0x09|0x00)
#define ERXNDL           (0x0A|0x00)
#define ERXNDH           (0x0B|0x00)
#define ERXRDPTL         (0x0C|0x00)
#define ERXRDPTH         (0x0D|0x00)
#define ERXWRPTL         (0x0E|0x00)
#define ERXWRPTH         (0x0F|0x00)
#define EDMASTL          (0x10|0x00)
#define EDMASTH          (0x11|0x00)
#define EDMANDL          (0x12|0x00)
#define EDMANDH          (0x13|0x00)
#define EDMADSTL         (0x14|0x00)
#define EDMADSTH         (0x15|0x00)
#define EDMACSL          (0x16|0x00)
#define EDMACSH          (0x17|0x00)
// Bank 1 registers
#define EHT0             (0x00|0x20)
#define EHT1             (0x01|0x20)
#define EHT2             (0x02|0x20)
#define EHT3             (0x03|0x20)
#define EHT4             (0x04|0x20)
#define EHT5             (0x05|0x20)
#define EHT6             (0x06|0x20)
#define EHT7             (0x07|0x20)
#define EPMM0            (0x08|0x20)
#define EPMM1            (0x09|0x20)
#define EPMM2            (0x0A|0x20)
#define EPMM3            (0x0B|0x20)
#define EPMM4            (0x0C|0x20)
#define EPMM5            (0x0D|0x20)
#define EPMM6            (0x0E|0x20)
#define EPMM7            (0x0F|0x20)
#define EPMCSL           (0x10|0x20)
#define EPMCSH           (0x11|0x20)
#define EPMOL            (0x14|0x20)
#define EPMOH            (0x15|0x20)
#define EWOLIE           (0x16|0x20)
#define EWOLIR           (0x17|0x20)
#define ERXFCON          (0x18|0x20)
#define EPKTCNT          (0x19|0x20)
// Bank 2 registers
#define MACON1           (0x00|0x40|0x80)
#define MACON2           (0x01|0x40|0x80)
#define MACON3           (0x02|0x40|0x80)
#define MACON4           (0x03|0x40|0x80)
#define MABBIPG          (0x04|0x40|0x80)
#define MAIPGL           (0x06|0x40|0x80)
#define MAIPGH           (0x07|0x40|0x80)
#define MACLCON1         (0x08|0x40|0x80)
#define MACLCON2         (0x09|0x40|0x80)
#define MAMXFLL          (0x0A|0x40|0x80)
#define MAMXFLH          (0x0B|0x40|0x80)
#define MAPHSUP          (0x0D|0x40|0x80)
#define MICON            (0x11|0x40|0x80)
#define MICMD            (0x12|0x40|0x80)
#define MIREGADR         (0x14|0x40|0x80)
#define MIWRL            (0x16|0x40|0x80)
#define MIWRH            (0x17|0x40|0x80)
#define MIRDL            (0x18|0x40|0x80)
#define MIRDH            (0x19|0x40|0x80)
// Bank 3 registers
#define MAADR1           (0x00|0x60|0x80)
#define MAADR0           (0x01|0x60|0x80)
#define MAADR3           (0x02|0x60|0x80)
#define MAADR2           (0x03|0x60|0x80)
#define MAADR5           (0x04|0x60|0x80)
#define MAADR4           (0x05|0x60|0x80)
#define EBSTSD           (0x06|0x60)
#define EBSTCON          (0x07|0x60)
#define EBSTCSL          (0x08|0x60)
#define EBSTCSH          (0x09|0x60)
#define MISTAT           (0x0A|0x60|0x80)
#define EREVID           (0x12|0x60)
#define ECOCON           (0x15|0x60)
#define EFLOCON          (0x17|0x60)
#define EPAUSL           (0x18|0x60)
#define EPAUSH           (0x19|0x60)
// PHY registers
#define PHCON1           0x00
#define PHSTAT1          0x01
#define PHHID1           0x02
#define PHHID2           0x03
#define PHCON2           0x10
#define PHSTAT2          0x11
#define PHIE             0x12
#define PHIR             0x13
#define PHLCON           0x14

// ENC28J60 ERXFCON Register Bit Definitions
#define ERXFCON_UCEN     0x80
#define ERXFCON_ANDOR    0x40
#define ERXFCON_CRCEN    0x20
#define ERXFCON_PMEN     0x10
#define ERXFCON_MPEN     0x08
#define ERXFCON_HTEN     0x04
#define ERXFCON_MCEN     0x02
#define ERXFCON_BCEN     0x01
// ENC28J60 EIE Register Bit Definitions
#define EIE_INTIE        0x80
#define EIE_PKTIE        0x40
#define EIE_DMAIE        0x20
#define EIE_LINKIE       0x10
#define EIE_TXIE         0x08
#define EIE_WOLIE        0x04
#define EIE_TXERIE       0x02
#define EIE_RXERIE       0x01
// ENC28J60 EIR Register Bit Definitions
#define EIR_PKTIF        0x40
#define EIR_DMAIF        0x20
#define EIR_LINKIF       0x10
#define EIR_TXIF         0x08
#define EIR_WOLIF        0x04
#define EIR_TXERIF       0x02
#define EIR_RXERIF       0x01
// ENC28J60 ESTAT Register Bit Definitions
#define ESTAT_INT        0x80
#define ESTAT_LATECOL    0x10
#define ESTAT_RXBUSY     0x04
#define ESTAT_TXABRT     0x02
#define ESTAT_CLKRDY     0x01
// ENC28J60 ECON2 Register Bit Definitions
#define ECON2_AUTOINC    0x80
#define ECON2_PKTDEC     0x40
#define ECON2_PWRSV      0x20
#define ECON2_VRPS       0x08
// ENC28J60 ECON1 Register Bit Definitions
#define ECON1_TXRST      0x80
#define ECON1_RXRST      0x40
#define ECON1_DMAST      0x20
#define ECON1_CSUMEN     0x10
#define ECON1_TXRTS      0x08
#define ECON1_RXEN       0x04
#define ECON1_BSEL1      0x02
#define ECON1_BSEL0      0x01
// ENC28J60 MACON1 Register Bit Definitions
#define MACON1_LOOPBK    0x10
#define MACON1_TXPAUS    0x08
#define MACON1_RXPAUS    0x04
#define MACON1_PASSALL   0x02
#define MACON1_MARXEN    0x01
// ENC28J60 MACON2 Register Bit Definitions
#define MACON2_MARST     0x80
#define MACON2_RNDRST    0x40
#define MACON2_MARXRST   0x08
#define MACON2_RFUNRST   0x04
#define MACON2_MATXRST   0x02
#define MACON2_TFUNRST   0x01
// ENC28J60 MACON3 Register Bit Definitions
#define MACON3_PADCFG2   0x80
#define MACON3_PADCFG1   0x40
#define MACON3_PADCFG0   0x20
#define MACON3_TXCRCEN   0x10
#define MACON3_PHDRLEN   0x08
#define MACON3_HFRMLEN   0x04
#define MACON3_FRMLNEN   0x02
#define MACON3_FULDPX    0x01
// ENC28J60 MICMD Register Bit Definitions
#define MICMD_MIISCAN    0x02
#define MICMD_MIIRD      0x01
// ENC28J60 MISTAT Register Bit Definitions
#define MISTAT_NVALID    0x04
#define MISTAT_SCAN      0x02
#define MISTAT_BUSY      0x01
// ENC28J60 PHY PHCON1 Register Bit Definitions
#define PHCON1_PRST      0x8000
#define PHCON1_PLOOPBK   0x4000
#define PHCON1_PPWRSV    0x0800
#define PHCON1_PDPXMD    0x0100
// ENC28J60 PHY PHSTAT1 Register Bit Definitions
#define PHSTAT1_PFDPX    0x1000
#define PHSTAT1_PHDPX    0x0800
#define PHSTAT1_LLSTAT   0x0004
#define PHSTAT1_JBSTAT   0x0002
// ENC28J60 PHY PHCON2 Register Bit Definitions
#define PHCON2_FRCLINK   0x4000
#define PHCON2_TXDIS     0x2000
#define PHCON2_JABBER    0x0400
#define PHCON2_HDLDIS    0x0100

// ENC28J60 Packet Control Byte Bit Definitions
#define PKTCTRL_PHUGEEN  0x08
#define PKTCTRL_PPADEN   0x04
#define PKTCTRL_PCRCEN   0x02
#define PKTCTRL_POVERRIDE 0x01

// SPI operation codes
#define ENC28J60_READ_CTRL_REG       0x00
#define ENC28J60_READ_BUF_MEM        0x3A
#define ENC28J60_WRITE_CTRL_REG      0x40
#define ENC28J60_WRITE_BUF_MEM       0x7A
#define ENC28J60_BIT_FIELD_SET       0x80
#define ENC28J60_BIT_FIELD_CLR       0xA0
#define ENC28J60_SOFT_RESET          0xFF

// The RXSTART_INIT should be zero. See Rev. B4 Silicon Errata
// buffer boundaries applied to internal 8K ram
// the entire available packet buffer space is allocated
//
// start with recbuf at 0/
#define RXSTART_INIT     0x0
// receive buffer end
#define RXSTOP_INIT      (0x1FFF-0x0600-1)
// start TX buffer at 0x1FFF-0x0600, pace for one full ethernet frame (~1500 bytes)
#define TXSTART_INIT     (0x1FFF-0x0600)
// stp TX buffer at end of mem
#define TXSTOP_INIT      0x1FFF
//
// max frame length which the conroller will accept:
#define        MAX_FRAMELEN        1500        // (note: maximum ethernet frame length would be 1518)
//#define MAX_FRAMELEN     600

#define 	ENC28J60_CS	 		GPIO_Pin_4
#define 	ENC28J60_CSL()		(GPIOD->ODR &= ~(1<<9))//GPIOA->BRR = ENC28J60_CS;
#define 	ENC28J60_CSH()		(GPIOD->ODR |= 1<<9)//GPIOA->BSRR = ENC28J60_CS;

namespace CARIBOU
{

	#define inherited CObject

	CList<CEnc28J60*>	CEnc28J60::mInstances;
	CSpinLock			CEnc28J60::mLocker;

	CEnc28J60::CEnc28J60(CSPI* spi, uint8_t* macaddr)
	: inherited()
	, mEnc28j60Bank(0)
	, mNextPacketPtr(0)
	, mSPI(spi)
	{
		mLocker.lock();
		mInstances.append(this);
		mLocker.unlock();

		//enc28j60CSinit();
		ENC28J60_CSH();

		//enc28j60SetSCK();
		//enc28j60HWreset();
		// perform system reset
		writeOp(ENC28J60_SOFT_RESET, 0, ENC28J60_SOFT_RESET);
		//	Del_1ms(250);
		// check CLKRDY bit to see if reset is complete
			// The CLKRDY does not work. See Rev. B4 Silicon Errata point. Just wait.
		//while(!(_read(ESTAT) & ESTAT_CLKRDY));
		// do bank 0 stuff
		// initialize receive buffer
		// 16-bit transfers, must write low byte first
		// set receive buffer start address
		mNextPacketPtr = RXSTART_INIT;
			// Rx start
		_write(ERXSTL, RXSTART_INIT&0xFF);
		_write(ERXSTH, RXSTART_INIT>>8);
		// set receive pointer address
		_write(ERXRDPTL, RXSTART_INIT&0xFF);
		_write(ERXRDPTH, RXSTART_INIT>>8);
		// RX end
		_write(ERXNDL, RXSTOP_INIT&0xFF);
		_write(ERXNDH, RXSTOP_INIT>>8);
		// TX start
		_write(ETXSTL, TXSTART_INIT&0xFF);
		_write(ETXSTH, TXSTART_INIT>>8);
		// TX end
		_write(ETXNDL, TXSTOP_INIT&0xFF);
		_write(ETXNDH, TXSTOP_INIT>>8);
		// do bank 1 stuff, packet filter:
		// For broadcast packets we allow only ARP packtets
		// All other packets should be unicast only for our mac (MAADR)
		//
		// The pattern to match on is therefore
		// Type     ETH.DST
		// ARP      BROADCAST
		// 06 08 -- ff ff ff ff ff ff -> ip checksum for theses bytes=f7f9
		// in binary these poitions are:11 0000 0011 1111
		// This is hex 303F->EPMM0=0x3f,EPMM1=0x30
		_write(ERXFCON, ERXFCON_UCEN|ERXFCON_CRCEN|ERXFCON_PMEN);
		_write(EPMM0, 0x3f);
		_write(EPMM1, 0x30);
		_write(EPMCSL, 0xf9);
		_write(EPMCSH, 0xf7);
		//
		//
		// do bank 2 stuff
		// enable MAC receive
		_write(MACON1, MACON1_MARXEN|MACON1_TXPAUS|MACON1_RXPAUS);
		// bring MAC out of reset
		_write(MACON2, 0x00);
		// enable automatic padding to 60bytes and CRC operations
		writeOp(ENC28J60_BIT_FIELD_SET, MACON3, MACON3_PADCFG0|MACON3_TXCRCEN|MACON3_FRMLNEN|MACON3_FULDPX);
		// set inter-frame gap (non-back-to-back)
		_write(MAIPGL, 0x12);
		_write(MAIPGH, 0x0C);
		// set inter-frame gap (back-to-back)
		_write(MABBIPG, 0x12);
		// Set the maximum packet size which the controller will accept
		// Do not send packets longer than MAX_FRAMELEN:
		_write(MAMXFLL, MAX_FRAMELEN&0xFF);	
		_write(MAMXFLH, MAX_FRAMELEN>>8);
		// do bank 3 stuff
		// write MAC address
		if ( macaddr != NULL )
			setMacAddr(CByteArray((char*)macaddr,6));

		phyWrite(PHCON1, PHCON1_PDPXMD);

		// no loopback of transmitted frames
		phyWrite(PHCON2, PHCON2_HDLDIS);
		// switch to bank 0
		setBank(ECON1);
		// enable interrutps
		writeOp(ENC28J60_BIT_FIELD_SET, EIE, EIE_INTIE|EIE_PKTIE);
		// enable packet reception
		writeOp(ENC28J60_BIT_FIELD_SET, ECON1, ECON1_RXEN);
	}

	CEnc28J60::~CEnc28J60()
	{
		mLocker.lock();
		mInstances.take(mInstances.indexOf(this));
		mLocker.unlock();
	}


	CEnc28J60* CEnc28J60::instance(uint32_t idx)
	{
		CEnc28J60* rc=NULL;
		mLocker.lock();
		if ( idx < mInstances.count() )
		{
			rc = mInstances.at(idx);
		}
		mLocker.unlock();
		return rc;
	}

	void CEnc28J60::setMacAddr(CByteArray mac)
	{
		// NOTE: MAC address in ENC28J60 is byte-backward
		_write(MAADR5, mac.at(0));	
		_write(MAADR4, mac.at(1));	
		_write(MAADR3, mac.at(2));	
		_write(MAADR2, mac.at(3));	
		_write(MAADR1, mac.at(4));	
		_write(MAADR0, mac.at(5));	
	}

	CByteArray CEnc28J60::macAddr()
	{
		// NOTE: MAC address in ENC28J60 is byte-backward
		CByteArray rc;
		rc.append( _read(MAADR5) );
		rc.append( _read(MAADR4) );
		rc.append( _read(MAADR3) );
		rc.append( _read(MAADR2) );
		rc.append( _read(MAADR1) );
		rc.append( _read(MAADR0) );
		return rc;
	}

	uint8_t CEnc28J60::readOp(uint8_t op, uint8_t address)
	{
		uint8_t dat = 0;

		ENC28J60_CSL();

		dat = op | (address & ADDR_MASK);
		spi_read_write(dat);
		dat = spi_read_write(0xFF);
		// do dummy read if needed (for mac and mii, see datasheet page 29)
		if(address & 0x80)
		{
			dat = spi_read_write(0xFF);
		}
		// release CS
		ENC28J60_CSH();
		return dat;
	}

	void CEnc28J60::writeOp(uint8_t op, uint8_t address, uint8_t data)
	{
		uint8_t dat = 0;
  
		ENC28J60_CSL();
		// issue write command
		dat = op | (address & ADDR_MASK);
		spi_read_write(dat);
		// write data
		dat = data;
		spi_read_write(dat);
		ENC28J60_CSH();
	}

	void CEnc28J60::readBuffer(uint8_t* data,uint32_t len)
	{
		ENC28J60_CSL();
		// issue read command
		spi_read_write(ENC28J60_READ_BUF_MEM);
		while(len)
		{
			len--;
			// read data
			*data = (uint8_t)spi_read_write(0);
			data++;
		}
		*data='\0';
		ENC28J60_CSH();
	}

	void CEnc28J60::writeBuffer(uint8_t* data,uint32_t len)
	{
		ENC28J60_CSL();
		// issue write command
		spi_read_write(ENC28J60_WRITE_BUF_MEM);

		while(len)
		{
			len--;
			spi_read_write(*data);
			data++;
		}
		ENC28J60_CSH();
	}

	void CEnc28J60::setBank(uint8_t address)
	{
		// set the bank (if needed)
		if((address & BANK_MASK) != mEnc28j60Bank)
		{
			// set the bank
			writeOp(ENC28J60_BIT_FIELD_CLR, ECON1, (ECON1_BSEL1|ECON1_BSEL0));
			writeOp(ENC28J60_BIT_FIELD_SET, ECON1, (address & BANK_MASK)>>5);
			mEnc28j60Bank = (address & BANK_MASK);
		}
	}

	uint8_t CEnc28J60::_read(uint8_t address)
	{
		// set the bank
		setBank(address);
		// do the read
		return readOp(ENC28J60_READ_CTRL_REG, address);
	}

	void CEnc28J60::_write(uint8_t address, uint8_t data)
	{
		// set the bank
		setBank(address);
		// do the write
		writeOp(ENC28J60_WRITE_CTRL_REG, address, data);
	}

	uint16_t phyRead(uint8_t address)
	{
		// Set the right address and start the register read operation
		_write(MIREGADR, address);
		_write(MICMD, MICMD_MIIRD);

		for(volatile int x=0; x < 30; x++)
		{
			// FIXME - delay about 15 uS
		}

		// wait until the PHY read completes
		while(spi_read(MISTAT) & MISTAT_BUSY)
		{
			// caribou_thread_yield()
		}

		// reset reading bit
		_write(MICMD, 0x00);

		return (_read(MIRDH));
	}

	void CEnc28J60::phyWrite(uint8_t address, uint32_t data)
	{
		// set the PHY register address
		_write(MIREGADR, address);
		// write the PHY data
		_write(MIWRL, data);
		_write(MIWRH, data>>8);
		// wait until the PHY write completes
		while(_read(MISTAT) & MISTAT_BUSY)
		{
			// caribou_thread_yield()
		}
	}

	void CEnc28J60::clkout(uint8_t clk)
	{
		//setup clkout: 2 is 12.5MHz:
		_write(ECOCON, clk & 0x7);
	}

	// read the revision of the chip:
	uint8_t CEnc28J60::getrev(void)
	{
		return(_read(EREVID));
	}

	void CEnc28J60::packetSend(uint8_t* packet,uint32_t len)
	{
		// Set the write pointer to start of transmit buffer area
		_write(EWRPTL, TXSTART_INIT&0xFF);
		_write(EWRPTH, TXSTART_INIT>>8);

		// Set the TXND pointer to correspond to the packet size given
		_write(ETXNDL, (TXSTART_INIT+len)&0xFF);
		_write(ETXNDH, (TXSTART_INIT+len)>>8);

		// write per-packet control byte (0x00 means use macon3 settings)
		writeOp(ENC28J60_WRITE_BUF_MEM, 0, 0x00);

		// copy the packet into the transmit buffer
		writeBuffer(len, packet);

		// send the contents of the transmit buffer onto the network
		writeOp(ENC28J60_BIT_FIELD_SET, ECON1, ECON1_TXRTS);

		// Reset the transmit logic problem. See Rev. B4 Silicon Errata point 12.
		if( (_read(EIR) & EIR_TXERIF) )
		{
			writeOp(ENC28J60_BIT_FIELD_CLR, ECON1, ECON1_TXRTS);
		}
	}

	// Gets a packet from the network receive buffer, if one is available.
	// The packet will by headed by an ethernet header.
	//      maxlen  The maximum acceptable length of a retrieved packet.
	//      packet  Pointer where packet data should be stored.
	// Returns: Packet length in bytes if a packet was retrieved, zero otherwise.
	uint32_t CEnc28J60::packetReceive(uint8_t* packet,uint32_t maxlen)
	{
		uint32_t rxstat;
		uint32_t len;

		// check if a packet has been received and buffered
		//if( !(_read(EIR) & EIR_PKTIF) ){
		// The above does not work. See Rev. B4 Silicon Errata point 6.
		if( _read(EPKTCNT) ==0 )
		{
			return(0);
		}

		// Set the read pointer to the start of the received packet
		_write(ERDPTL, (mNextPacketPtr));
		_write(ERDPTH, (mNextPacketPtr)>>8);

		// read the next packet pointer
		mNextPacketPtr  = readOp(ENC28J60_READ_BUF_MEM, 0);
		mNextPacketPtr |= readOp(ENC28J60_READ_BUF_MEM, 0)<<8;

		// read the packet length (see datasheet page 43)
		len  = readOp(ENC28J60_READ_BUF_MEM, 0);
		len |= readOp(ENC28J60_READ_BUF_MEM, 0)<<8;

		len-=4; //remove the CRC count
		// read the receive status (see datasheet page 43)
		rxstat  = readOp(ENC28J60_READ_BUF_MEM, 0);
		rxstat |= readOp(ENC28J60_READ_BUF_MEM, 0)<<8;
		// limit retrieve length
		if (len>maxlen-1)
		{
			len=maxlen-1;
		}

		// check CRC and symbol errors (see datasheet page 44, table 7-3):
		// The ERXFCON.CRCEN is set by default. Normally we should not
		// need to check this.
		if ((rxstat & 0x80)==0)
		{
			// invalid
			len=0;
		}
		else
		{
			// copy the packet from the receive buffer
			readBuffer(len, packet);
		}
		// Move the RX read pointer to the start of the next received packet
		// This frees the memory we just read out
		_write(ERXRDPTL, (mNextPacketPtr));
		_write(ERXRDPTH, (mNextPacketPtr)>>8);

		// decrement the packet counter indicate we are done with this packet
		writeOp(ENC28J60_BIT_FIELD_SET, ECON2, ECON2_PKTDEC);
		return(len);
	}

    /// SPI1 read/write a single byte
	/// @param wb Write Byte
	/// @return read byte.
	uint8_t CEnc28J60::spi_read_write(uint8_t wb)
	{
		/** FIXME - place in interrupt handler, or even better, DMA... */

		/* Wait for DR register to clear */
		while(SPI_I2S_GetFlagStatus(mSPI->device(), SPI_I2S_FLAG_TXE) == RESET);

		/* Send byte through the SPI1 peripheral */
		SPI_I2S_SendData(mSPI->device(), wb);

		/* Wait to receive a byte */
		while(SPI_I2S_GetFlagStatus(mSPI->device(), SPI_I2S_FLAG_RXNE) == RESET);

		/* Return the byte read from the SPI bus */
		return SPI_I2S_ReceiveData(mSPI->device());
	}

	uint32_t CEnc28J60::interruptDisable()
	{
		rt_uint32_t level;

		/* switch to bank 0 */
		setBank(EIE);

		/* get last interrupt level */
		level = _read(EIE);

		/* disable interrutps */
		writeOp(ENC28J60_BIT_FIELD_CLR, EIE, level);

		return level;
	}

	void CEnc28J60::interruptEnable(uint32_t level)
	{
		/* switch to bank 0 */
		setBank(EIE);
		writeOp(ENC28J60_BIT_FIELD_SET, EIE, level);
	}

	bool CEnc28J60::linkStatus()
	{
		rt_uint16_t reg;
		int duplex;

		reg = enc28j60_phy_read(PHSTAT2);
		duplex = reg & PHSTAT2_DPXSTAT;

		if (reg & PHSTAT2_LSTAT)
		{
			/* on */
			return RT_TRUE;
		}
		else
		{
			/* off */
			return RT_FALSE;
		}
	}

}