#include <ci2c.h>

namespace MineAirQuality
{
	CI2C::CI2C( caribou_gpio_t* scl, caribou_gpio_t* sda, bool master )
	: mSCL(scl)
	, mSDA(sda)
	, mMaster(master)
	, mStarted(false)
	{
    	caribou_gpio_set(mSDA);
		caribou_gpio_set(mSCL);
	}

	CI2C::~CI2C()
	{
	}

	void CI2C::arbitration_lost()
	{
		fprintf( stderr, "i2c arbitration lost\n" );
	}

	void CI2C::delay( void )
	{
		volatile int v;
		int i;

		#if defined(DEBUG)
		for( i = 0; i < PRODUCT_I2CSPEED / 2; i++ )
		#else
		for( i = 0; i < PRODUCT_I2CSPEED; i++ )
		#endif
		{
			v=i;
		}
	}

	void CI2C::write_bit( bool bit )
	{
		if( bit ) 
			SDA_H();
		else 
			SDA_L();

		delay();

		while( read_SCL() == 0 ) 
		{ 
			// Clock stretching
			// FIXME add timeout to this loop
		}

		// SCL is high, now data is valid
		// If SDA is high, check that nobody else is driving SDA
		if( bit && ( read_SDA() == 0 ) )
			arbitration_lost();

		delay();
		SCL_L();
	}

	bool CI2C::CI2C::read_bit( void )
	{
		bool bit;

		// Let the slave drive data
		read_SDA();
		delay();

		while( read_SCL() == 0 ) 
		{ 
			// Clock stretching
			// You should add timeout to this loop
		}

		// SCL is high, now data is valid
		bit = read_SDA();
		delay();
		SCL_L();

		return bit;
	}

	void CI2C::start()
	{
		if( mStarted ) 
		{ 
			// if started, do a restart cond
			// set SDA to 1
			read_SDA();
			delay();

			while( read_SCL() == 0 ) 
			{  
				// Clock stretching
				// FIXME add timeout to this loop
			}

			// Repeated start setup time, minimum 4.7us
			delay();

		}

		if( read_SDA() == 0 ) 
		{
			arbitration_lost();
		}

		// SCL is high, set SDA from 1 to 0.
		SDA_L();
		delay();
		SCL_L();
		mStarted = true;
	}

	void CI2C::stop()
	{
		// set SDA to 0
		SDA_L();
		delay();

		// Clock stretching
		while( read_SCL() == 0 ) 
		{
			// FIXME add timeout to this loop.
		}

		// Stop bit setup time, minimum 4us
		delay();

		// SCL is high, set SDA from 0 to 1
		SDA_H();
		delay();

		if( read_SDA() == 0 ) 
		{
			arbitration_lost();
		}

		delay();
		mStarted = false;
	}

	bool CI2C::sendByte(uint8_t data)
	{
		unsigned bit;
		bool     nack;

		for( bit = 0; bit < 8; bit++ ) 
		{
			write_bit( ( data & 0x80 ) != 0 );
			data <<= 1;
		}

		nack = read_bit();

		return nack;
	}

	uint8_t CI2C::receiveByte(bool sendack)
	{
		register unsigned char byte = 0;
		register unsigned char bit;

		for( bit = 0; bit < 8; bit++ ) 
		{
			byte = ( byte << 1 ) | read_bit();
		}

		write_bit( sendack );

		return byte;
	}

}