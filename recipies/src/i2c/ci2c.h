#ifndef _MINEAIRQUAITY_CI2C_H_
#define _MINEAIRQUAITY_CI2C_H_

#include <caribou++.h>
#include <caribou/dev/gpio.h>
#include <stm32l4xx.h>

namespace PikeAero
{
	class CI2C
	{
		public:
			CI2C( caribou_gpio_t* scl, caribou_gpio_t* sda, bool master=true );
			virtual ~CI2C();


		protected:

			void				start();
			void				stop();
			bool				sendByte(uint8_t data);
			uint8_t				receiveByte(bool sendack);

			virtual uint8_t		deviceAddress()=0;
			virtual void		arbitration_lost();

			void				delay( void );

		private:

			inline void			SCL_H()		{caribou_gpio_set(mSCL);}
			inline void			SCL_L()		{caribou_gpio_reset(mSCL);}
   
			inline void			SDA_H()		{caribou_gpio_set(mSDA);}
			inline void			SDA_L()		{caribou_gpio_reset(mSDA);}

			/**
			 * Set SCL as input and return current level of line, 0 or 1
			 */
			bool				read_SCL( void )
								{
									SCL_H(); // release the SCL line.
									return (mSCL->port->IDR & mSCL->pinmask) ? true : false;
								}


			/** 
			 * Set SDA as input and return current level of line, 0 or 1
			 */
			bool				read_SDA( void )
								{
									SDA_H(); // release the SDA line.
									return (mSDA->port->IDR & mSDA->pinmask) ? true : false;
								}

			void				write_bit( bool bit );
			bool				read_bit( void );

			caribou_gpio_t*		mSCL;
			caribou_gpio_t*		mSDA;
			bool				mMaster;
			bool				mStarted;
	};
}

#endif
