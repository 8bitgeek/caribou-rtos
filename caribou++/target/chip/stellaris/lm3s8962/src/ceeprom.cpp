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
#include "ceeprom.h"

#define	EEPROM_SIZE	256
#define M24Cxx_DEVICE_SELECT 0x50

#include "inc/hw_types.h"
#include "driverlib/sysctl.h"
#include "inc/hw_memmap.h"
#include "inc/hw_i2c.h"
#include "driverlib/i2c.h"

namespace CARIBOU
{

	#define inherited CI2C

	CEEPROM::CEEPROM()
	: inherited()
	{
	}

	CEEPROM::~CEEPROM()
	{
	}

	/**
	* Write a data buffer.
	*/
	int CEEPROM::write(uint32_t addr, void* buf, size_t size)
	{
		uint8_t* p = (uint8_t*)buf;
		for(size_t n=0; n < size; n++)
		{
			masterWrite(addr++,p[n]);
		}
		return size;
		return size;
	}

	/**
	* Write a data buffer.
	*/
	int CEEPROM::write(uint32_t addr, CByteArray& buf, int size)
	{
		return write(addr,(uint8_t*)buf.data(),size<0?buf.size():size);
	}

	/**
	* Write a data buffer.
	*/
	int CEEPROM::write(uint32_t addr, CString& buf, int size)
	{
		if ( size < buf.length() )
		{
			buf.resize(size-1);
		}
		return write(addr,(uint8_t*)buf.data(),size<0?buf.length()+1:size);
	}

	/**
	* Read a data buffer.
	*/
	int CEEPROM::read(uint32_t addr, void* buf, size_t size)
	{
		uint8_t* p = (uint8_t*)buf;
		for(size_t n=0; n < size; n++)
		{
			p[n] = masterRead(addr++);
		}
		return size;
	}

	/**
	* Read a data buffer.
	*/
	int CEEPROM::read(uint32_t addr, CByteArray& buf, size_t size)
	{
		buf.resize(size);
		return read(addr,(void*)buf.data(),size);
	}

	/**
	* Read a data buffer.
	*/
	int CEEPROM::read(uint32_t addr, CString& buf, size_t size)
	{
		buf.resize(size);
		return read(addr,(void*)buf.data(),size);
	}

	/**
	* Low level write function
	* @param ch The byte to send.
	* @return 0 on success.
	*/
	int CEEPROM::masterWrite(uint32_t addr, uint8_t* buf, size_t size)
	{
		if ( size > 0 )
		{
			//
			// Set write mode
			//
			hwMasterSlaveAddrSet(deviceSelect(addr), false);

			//
			// Place the address to be sent in the data register
			//
			hwMasterDataPut((uint8_t)(addr&0x00FF));

			//
			// Initiate send of data from the master.
			//
			hwMasterControl(I2C_MASTER_CMD_BURST_SEND_START);

			//
			// Wait until master module is done transferring.
			//
			while(hwMasterBusy()) {}

			for(int n=0; n < size; n++)
			{
				//
				// Place the address to be sent in the data register
				//
				hwMasterDataPut(buf[n]);
				if ( n == size-1 )
				{
					//
					// Initiate send of data from the master.
					//
					hwMasterControl(I2C_MASTER_CMD_BURST_SEND_FINISH);
				}
				else
				{
					//
					// Initiate send of data from the master.
					//
					hwMasterControl(I2C_MASTER_CMD_BURST_SEND_CONT);
				}
					//
				// Wait until master module is done transferring.
				//
				while(hwMasterBusy()) {}

			}
		}
		return hwMasterErr();
	}

	/**
	* Low level write function (must be on 16 bytes bounds).
	* @param ch The byte to send.
	* @return 0 on success.
	*/
	int CEEPROM::masterWrite(uint32_t addr, uint8_t ch)
	{
		hwMasterDataGet(); // clear receiver
		do
		{
			//
			// Set write mode
			//
			hwMasterSlaveAddrSet(deviceSelect(addr), false);

			//
			// Place the address to be sent in the data register
			//
			hwMasterDataPut((uint8_t)(addr&0x00FF));

			//
			// Initiate send of data from the master.
			//
			hwMasterControl(I2C_MASTER_CMD_BURST_SEND_START);

			//
			// Wait until master module is done transferring.
			//
			while(hwMasterBusy()) {}


			//
			// Place the address to be sent in the data register
			//
			hwMasterDataPut(ch);

			//
			// Initiate send of data from the master.
			//
			hwMasterControl(I2C_MASTER_CMD_BURST_SEND_FINISH);

			//
			// Wait until master module is done transferring.
			//
			while(hwMasterBusy()) {}

		} while ( hwMasterErr() != 0 );
		return hwMasterErr();
	}

	/**
	* Low level read function
	* @param ch The byte to send.
	* @return 0 on success.
	*/
	int CEEPROM::masterRead(uint32_t addr)
	{
		int ch;

		do {
			//
			// Read junk from the receiver.
			//
			ch = hwMasterDataGet();

			//
			// Set write mode
			//
			hwMasterSlaveAddrSet(deviceSelect(addr), false);

			//
			// Place the address to be sent in the data register
			//
			hwMasterDataPut((uint8_t)(addr&0x00FF));

			//
			// Initiate send of data from the master.
			//
			hwMasterControl(I2C_MASTER_CMD_SINGLE_SEND);

			//
			// Wait until master module is done transferring.
			//
			while(hwMasterBusy()) {}

			//
			// Set receive mode
			//
			hwMasterSlaveAddrSet(deviceSelect(addr), true);

			//
			// Tell the master to read data.
			//
			hwMasterControl(I2C_MASTER_CMD_SINGLE_RECEIVE);

			//
			// Wait while the master bus is busy.
			//
			while(hwMasterBusy()) {}

			//
			// Read the data from the master.
			//
			ch = hwMasterDataGet();
		} while (  hwMasterErr() != 0 );
		return ch;
	}

	/**
	* Modify the device select address based on the address in the event that some select bit should be modified.
	* @param addr The address.
	* @return the select slace device select code.
	*/
	uint8_t CEEPROM::deviceSelect(uint32_t addr)
	{
		uint8_t cs=M24Cxx_DEVICE_SELECT;
		cs |= ((addr & 0x0700) >> 7);
		return cs;
	}

	/**
	* The size of teh EEPROM in bytes
	*/
	size_t CEEPROM::size()
	{
		return EEPROM_SIZE;
	}

	/**
	* Is the EEPROM erase?
	*/
	bool CEEPROM::erased()
	{
		for(int n=0; n < size(); n++)
		{
			uint8_t ch = masterRead(n);
			if ( ch != 0xFF )
				return false;
		}
		return true;
	}

	/**
	* Erase the EEPROM.
	*/
	bool CEEPROM::erase()
	{
		for(int n=0; n < size(); n++)
		{
			masterWrite(n,0xFF);
		}
		return true;
	}

} // CARIBOU
