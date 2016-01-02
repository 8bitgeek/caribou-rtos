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

namespace CARIBOU
{

	#define inherited CObject

	CList<CEnc28J60*>	CEnc28J60::mInstances;
	CSpinLock			CEnc28J60::mLocker;

	CEnc28J60::CEnc28J60(CSpi* spi, uint8_t* macaddr)
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

	CEnc28J60::CEnc28J60(CSpi* spi, CByteArray macaddr)
	: inherited()
	, mEnc28j60Bank(0)
	, mNextPacketPtr(0)
	, mSPI(spi)
	{
		CEnc28J60(spi,(uint8_t*)macaddr.data());
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

	uint16_t CEnc28J60::phyRead(uint8_t address)
	{
		// Set the right address and start the register read operation
		_write(MIREGADR, address);
		_write(MICMD, MICMD_MIIRD);

		for(volatile int x=0; x < 30; x++)
		{
			// FIXME - delay about 15 uS
		}

		// wait until the PHY read completes
		while(spi_read_write(MISTAT) & MISTAT_BUSY)
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
		writeBuffer(packet,len);

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
			readBuffer(packet,len);
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
		uint32_t level;

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
		uint16_t reg;
		int duplex;

		reg = phyRead(PHSTAT2);
		duplex = reg & PHSTAT2_DPXSTAT;

		return (reg & PHSTAT2_LSTAT) ? true : false;
	}

}