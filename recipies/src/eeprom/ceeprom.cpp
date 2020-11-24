#include <ceeprom.h>

namespace MineAirQuality
{
	#define inherited MineAirQuality::CI2C

	CEEPROM::CEEPROM( caribou_gpio_t* scl, caribou_gpio_t* sda, caribou_gpio_t* wp, uint8_t bpp )
	: inherited(scl,sda)
	, mWP(wp)
	, mBPP(bpp)
	{
		setWriteProtect(true);
	}

	CEEPROM::~CEEPROM()
	{
		setWriteProtect(true);
	}

	void CEEPROM::setWriteProtect(bool state)
	{
        if ( mWP )
        {
            delay();
            delay();
            if ( state )
                caribou_gpio_set(mWP);
            else
                caribou_gpio_reset(mWP);
            delay();
            delay();
        }
	}

	/**
	 * @brief Write multiple bytes to the CEEPROM registers.
	 * @param addr The beginning address of the write operation.
	 * @param data A pointer to the data bytes to write.
	 * @param count The count of bytes to write.
	 * @return true on success.
	 */
	bool CEEPROM::multiByteWrite(uint32_t addr, void* data, uint8_t count)
	{
		bool rc=true;
		uint8_t* pdata = (uint8_t*)data;
		while(count && rc)
		{
			rc = multiByteWritePage(addr,pdata,&count);
			if ( rc )
			{
				addr += bpp();
				pdata += bpp();
				caribou_thread_sleep_current(from_ms(7));
			}
		}
		return rc;
	}

	/**
	 * @brief Write multiple bytes to the CEEPROM registers up to one page.
	 * @param addr The beginning address of the write operation.
	 * @param data A pointer to the data bytes to write.
	 * @param count The count of bytes to write.
	 * @return true on success.
	 */
	bool CEEPROM::multiByteWritePage(uint32_t addr, void* data, uint8_t* pcount)
	{
		bool nack=true;
		uint8_t page = (addr&0x700)>>7;
		uint8_t* pdata = static_cast<uint8_t*>(data);
		uint8_t count = (*pcount > bpp()) ? bpp() : *pcount;
		setWriteProtect(false);
		/* enter start condition */
		start();
		/* send device address and write-condition */
		nack = sendByte(deviceAddress()|page);
		if ( !nack ) /* ack? */
		{
			/* send the start address LSB */
			nack = sendByte(addr&0xFF);
			if ( !nack ) /* ack? */
			{
				/* write in the bytes... */
				for(uint8_t n=0; !nack && n < count; n++)
				{
					/* write the next byte */
					 nack = sendByte(pdata[n]);
				}
			}
		}
		/* signal the stop condition */
		stop();
		setWriteProtect(true);
		if ( !nack )
		{
			*pcount -= count;
		}
		return !nack;
	}

	/**
	 * @brief Read multiple bytes from the CEEPROM registers.
	 * @param addr The beginning address of the read operation.
	 * @param data A pointer to the buffer to read the data bytes in to.
	 * @param count The count of bytes to read.
	 * @return true on success.
	 */
	bool CEEPROM::multiByteRead(uint32_t addr, void* data, uint8_t count)
	{
		bool nack=true;
		uint8_t page = (addr&0x700)>>7;
		uint8_t* pdata = static_cast<uint8_t*>(data);
		/* enter start condition */
		start();
		/* send device address and write-condition and address MSB (page) */
		nack = sendByte(deviceAddress()|page);
		if ( !nack ) /* ack? */
		{
			/* send the start address LSB */
			nack = sendByte(addr&0xFF);
			if ( !nack ) /* ack? */
			{
				/* repeat start to begin the read operation */
				start();
				/* send device address and read-condition */
				nack = sendByte(deviceAddress()|1);
				/* read in the bytes... */
				for(uint8_t n=0; !nack && n < count; n++)
				{
					/* nack the last byte */
					pdata[n] = receiveByte((n==(count-1))?true:false);
				}
			}
		}
		/* signal the stop condition */
		stop();
		return !nack;
	}

	/**
	 * @brief Write a single byte to the CEEPROM registers.
	 * @param addr The address of the write operation.
	 * @param data The data byte value to write.
	 * @return true on success.
	 */
	bool CEEPROM::byteWrite(uint32_t addr, uint8_t data)
	{
		bool rc=multiByteWrite(addr, &data, 1);
		return rc;
	}

	/**
	 * @brief Read a single byte from the CEEPROM registers.
	 * @param addr The address of the read operation.
	 * @param data A pointer to the data byte storage to read into.
	 * @return true on success.
	 */
	bool CEEPROM::byteRead(uint32_t addr, uint8_t* data)
	{
		bool rc=multiByteRead(addr, data, 1);
		return rc;
	}

}