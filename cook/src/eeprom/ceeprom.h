#ifndef _MINEAIRQUALITY_EEPROM_H_
#define _MINEAIRQUALITY_EEPROM_H_

#include <caribou++.h>
#include <ci2c.h>

namespace MineAirQuality
{
	class CEEPROM : public MineAirQuality::CI2C
	{
		public:
			CEEPROM( caribou_gpio_t* scl, caribou_gpio_t* sda, caribou_gpio_t* wp, uint8_t bpp );
			virtual ~CEEPROM();

			bool				byteWrite(uint32_t addr, uint8_t data);
			bool				byteRead(uint32_t addr, uint8_t* data);
			bool				multiByteWrite(uint32_t addr, void* data, uint8_t count);
			bool				multiByteRead(uint32_t addr, void* data, uint8_t count);

		protected:

			inline uint8_t		deviceAddress() {return 0xA0;}
			inline uint8_t		bpp()			{return mBPP;}
			void				setWriteProtect(bool state);
			bool				multiByteWritePage(uint32_t addr, void* data, uint8_t* pcount);

		private:				

		caribou_gpio_t*			mWP;
		uint8_t					mBPP;	/* Bytes per page */
	};
}

#endif
