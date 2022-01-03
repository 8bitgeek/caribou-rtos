#ifndef _PIKEAERO_CSETTINGS_H_
#define _PIKEAERO_CSETTINGS_H_

#include <ceeprom.h>

#define		SETTINGS_MAX_HOSTNAME	(32)

#define		BAUD_110		110
#define		BAUD_300		300
#define		BAUD_1200		1200
#define		BAUD_2400		2400
#define		BAUD_4800		4800
#define		BAUD_9600		9600
#define		BAUD_14400		14400
#define		BAUD_19200		19200
#define		BAUD_28800		28800
#define		BAUD_38400		38400
#define		BAUD_57600		57600
#define		BAUD_115200		115200
#define		BAUD_230400		230400
#define		BAUD_460800		460800
#define		BAUD_921600		921600

namespace PikeAero
{
	class CSettings : public CEEPROM
	{
		public:

			typedef struct
			{
				union
				{
					uint32_t	word;						/* IPV4 address in word */
					uint16_t	words[2];					/* IPV4 address in words */
					uint8_t		octets[4];					/* IPV4 address in octets */
				};
			} __attribute__((packed)) ip_address;

			typedef struct
			{
				union
				{
					uint16_t	words[3];					/* MAC Address in words */
					uint8_t		octets[6];					/* MAC Address in octets */
				};
			} __attribute__((packed)) mac_address;

			typedef struct
			{
				uint8_t		dhcp;						/* DHCP Enabled */
				mac_address	mac;						/* MAC Address */
				ip_address	ip;							/* IP Address */
				ip_address	mask;						/* IP Mask */
				ip_address	gw;							/* IP Gateway */
				uint8_t		hostname[SETTINGS_MAX_HOSTNAME+1];
			} __attribute__((packed)) ethernet_settings_t;

			typedef struct
			{
				uint8_t		slave_id;					/* When TCP is Master RTU is slave */
				uint32_t	baud;						/* Baud Rate */
				uint16_t	timeout;					/* Timeout in ms. */
				uint8_t		bits;						/* Number of data bits (8,7) */
				uint8_t		parity;						/* Parity (0=none,1=odd,2=even) */
				uint8_t		stopbits;					/* Number of stop bits (1,2) */
				uint8_t		rtu;						/* RTU or ASCII (0=ASCII,1=RTU) */
			} __attribute__((packed)) serial_settings_t;

			typedef struct
			{
				uint8_t		slave_id;					/* When TCP is Master RTU is slave */
				uint16_t	tcpport;					/* TCP listen port (502) */
				uint16_t	timeout;					/* TCP Discionnect inactivity */
				uint8_t		tcpm;						/* TCP Is in Master Mode */
				ip_address	slave_ip;					/* Slave address when TCP Master */
			} __attribute__((packed)) modbus_settings_t;

			typedef struct
			{
				ethernet_settings_t	ethernet;			/* Ethernet Network settings */
				serial_settings_t	serial;				/* Serial port settings */
				modbus_settings_t	modbus;				/* Modbus port settings */
				uint32_t			checksum;			/* Settings record checksum */
			} __attribute__((packed)) settings_t;

			CSettings( caribou_gpio_t* scl, caribou_gpio_t* sda, caribou_gpio_t* wp );
			virtual ~CSettings();

			static CSettings*		instance()	{return mInstance;}

			settings_t*				setfactorysettings();	/* [re]initialize factory defaults */
			settings_t*				read();
			void					write();

			settings_t&				values()	{return mSettings;}

			#if PRODUCT_DEBUG_SETTINGS
				static void				dump(FILE* io);
			#endif

		private:

			settings_t*				initialize();
			uint32_t				checksum();

			static settings_t		mSettings;
			static CSettings*		mInstance;
	};
}

#endif /* _PIKEAERO_CSETTINGS_H_ */
