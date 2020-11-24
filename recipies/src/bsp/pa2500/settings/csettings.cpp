#include <csettings.h>
#include <coctetarray.h>

namespace MineAirQuality
{
	#define inherited MineAirQuality::CEEPROM

	CSettings::settings_t CSettings::mSettings;
	CSettings* CSettings::mInstance=NULL;

	CSettings::CSettings( caribou_gpio_t* scl, caribou_gpio_t* sda, caribou_gpio_t* wp )
	: inherited(scl,sda,wp,PRODUCT_EEPROM_BPP)
	{
		if ( mInstance == NULL )
			mInstance = this;
		#if PRODUCT_DEBUG_SETTINGS
			debug_printf("settings size=%d bytes\n",sizeof(settings_t));
		#endif
	}

	CSettings::~CSettings()
	{
		mInstance = NULL;
	}

	/**
	 * @brief [re]initialize factory defaults
	 * @return true on success.
	 */
	MineAirQuality::CSettings::settings_t* CSettings::setfactorysettings()
	{
		settings_t* rc=initialize();
		if ( rc != NULL )
		{
			write();
		}
		return rc;
	}

	/**
	 * @brief Read the settings record. If checksum is invalid, then initialize to defaults.
	 */
	CSettings::settings_t* CSettings::read()
	{
		settings_t* rc = NULL;
		if ( multiByteRead(0x0000,&mSettings,sizeof(settings_t)) )
		{
			if ( checksum() == mSettings.checksum )	// valid record?...
			{
				#if PRODUCT_DEBUG_SETTINGS
					fprintf( stderr, "settings: checksum match\n");;
				#endif
				rc = &mSettings;					// ...yes, use it...
			}
			#if PRODUCT_DEBUG_SETTINGS
				else
				{
					printf("settings: checksum mismatch\n");
				}
			#endif			
		}
		#if PRODUCT_DEBUG_SETTINGS
			else
			{
				printf("settings: multibyte read failed\n");
			}
		#endif

		if ( rc == NULL || COctetArray(rc->ethernet.mac.octets,6).isZero() || COctetArray(rc->ethernet.mac.octets,6).isOnes())
		{
			#if PRODUCT_DEBUG_SETTINGS
				fprintf( stderr, "settings: restoring factory settings\n");
			#endif
			rc = setfactorysettings();
		}
		return rc;
	}

	/**
	 * @brief Calculate the record checksum and commit the settings record.
	 */
	void CSettings::write()
	{
		mSettings.checksum = checksum();
		if ( multiByteWrite(0x0000,&mSettings,sizeof(settings_t)) )
		{
			#if PRODUCT_DEBUG_SETTINGS
				fprintf( stderr, "settings: multibyte write okay\n");
			#endif			
		}
		#if PRODUCT_DEBUG_SETTINGS
			else
			{
				printf("settings: multibyte write failed\n");
			}
		#endif
	}

	/**
	 * @brief Initialize the settings record to it's default state.
	 */
	CSettings::settings_t* CSettings::initialize()
	{
		memset(&mSettings,0,sizeof(settings_t));

		strcpy((char*)mSettings.ethernet.hostname,PRODUCT_HOSTNAME);

		mSettings.ethernet.dhcp = 1;

#if 0

		mSettings.ethernet.mac.octets[0]		= MAC_ADDR0;
		mSettings.ethernet.mac.octets[1]		= MAC_ADDR1;
		mSettings.ethernet.mac.octets[2]		= MAC_ADDR2;
		mSettings.ethernet.mac.octets[3]		= MAC_ADDR3;
		mSettings.ethernet.mac.octets[4]		= MAC_ADDR4;
		mSettings.ethernet.mac.octets[5]		= MAC_ADDR5;

		mSettings.ethernet.ip.octets[0]			= IP_ADDR0;
		mSettings.ethernet.ip.octets[1]			= IP_ADDR1;
		mSettings.ethernet.ip.octets[2]			= IP_ADDR2;
		mSettings.ethernet.ip.octets[3]			= IP_ADDR3;

		mSettings.ethernet.mask.octets[0]		= NETMASK_ADDR0;
		mSettings.ethernet.mask.octets[1]		= NETMASK_ADDR1;
		mSettings.ethernet.mask.octets[2]		= NETMASK_ADDR2;
		mSettings.ethernet.mask.octets[3]		= NETMASK_ADDR3;

		mSettings.ethernet.gw.octets[0]			= GW_ADDR0;
		mSettings.ethernet.gw.octets[1]			= GW_ADDR1;
		mSettings.ethernet.gw.octets[2]			= GW_ADDR2;
		mSettings.ethernet.gw.octets[3]			= GW_ADDR3;

#endif

		mSettings.serial.rtu					= 1;
		mSettings.serial.baud					= BAUD_9600;
		mSettings.serial.bits					= 8;
		mSettings.serial.parity					= 0;
		mSettings.serial.stopbits				= 1;
		mSettings.serial.timeout				= 1000;
		mSettings.serial.slave_id				= 1;

		mSettings.modbus.slave_id				= 1;
		mSettings.modbus.tcpport				= 502;
		mSettings.modbus.timeout				= 3000;
		mSettings.modbus.tcpm					= 0;
		mSettings.modbus.slave_ip.octets[0]		= 0;
		mSettings.modbus.slave_ip.octets[1]		= 0;
		mSettings.modbus.slave_ip.octets[2]		= 0;
		mSettings.modbus.slave_ip.octets[3]		= 0;


		mSettings.checksum = checksum();

		return &mSettings;
	}

	/**
	 * @brief Calculate the checksum of the current settings record.
	 * @return 32-bit checksum.
	 */
	uint32_t CSettings::checksum()
	{
		#if 0
			uint32_t ck=0;
			uint8_t* psettings = (uint8_t*)&mSettings;
			for(int n=0; n < sizeof(settings_t)-sizeof(uint32_t); n++)
			{
				ck += psettings[n];
			}
			return ~ck;
		#else
			uint8_t* psettings = (uint8_t*)&mSettings;
			CRC->CR |= CRC_CR_RESET;
			for(size_t n=0; n < sizeof(settings_t)-sizeof(uint32_t); n++)
			{
				CRC->DR = psettings[n];
			}
			return CRC->DR;
		#endif
	}

	#if PRODUCT_DEBUG_SETTINGS
		void CSettings::dump(FILE* io)
		{
			fprintf(io,"--ETHERNET--\n");
			fprintf(io,"DHCP:\t%d\n",mSettings.ethernet.dhcp);
			fprintf(io,"MAC:\t%02X:%02X:%02X:%02X:%02X:%02X\n",
						mSettings.ethernet.mac.octets[0],
                        mSettings.ethernet.mac.octets[1],
                        mSettings.ethernet.mac.octets[2],
                        mSettings.ethernet.mac.octets[3],
                        mSettings.ethernet.mac.octets[4],
                        mSettings.ethernet.mac.octets[5]);
			fprintf(io,"IP:\t%d.%d.%d.%d\n",
						mSettings.ethernet.ip.octets[0],
						mSettings.ethernet.ip.octets[1],
						mSettings.ethernet.ip.octets[2],
						mSettings.ethernet.ip.octets[3]);
			fprintf(io,"MASK:\t%d.%d.%d.%d\n",
						mSettings.ethernet.mask.octets[0],
						mSettings.ethernet.mask.octets[1],
						mSettings.ethernet.mask.octets[2],
						mSettings.ethernet.mask.octets[3]);
			fprintf(io,"GW:\t%d.%d.%d.%d\n",
						mSettings.ethernet.gw.octets[0],
						mSettings.ethernet.gw.octets[1],
						mSettings.ethernet.gw.octets[2],
						mSettings.ethernet.gw.octets[3]);
			fprintf(io,"--SERIAL--\n");
			fprintf(io,"RTU:\t%d\n",mSettings.serial.rtu);
			fprintf(io,"BAUD:\t%d\n",mSettings.serial.baud);
			fprintf(io,"BITS:\t%d\n",mSettings.serial.bits);
			fprintf(io,"PARITY:\t%d\n",mSettings.serial.parity);
			fprintf(io,"STOP:\t%d\n",mSettings.serial.stopbits);
			fprintf(io,"T/O:\t%d\n",mSettings.serial.timeout);
			fprintf(io,"--MODBUS/TCP--\n");
			fprintf(io,"PORT:\t%d\n",mSettings.modbus.tcpport);
			fprintf(io,"T/O:\t%d\n",mSettings.modbus.timeout);
			fprintf(io,"--CRC: 0x%04X--\n",mSettings.checksum);

		}
	#endif

}
