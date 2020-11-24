#include <ds18b20.h>
#include <delay.h>
	
#define DECIMAL_STEPS_12BIT		625						/** 0.0625 */
#define CMD_READROM				0x33					/** Initiate Read ROM */
#define CMD_CONVERT_T			0x44					/** Initiate Temperature Conversion. */
#define	CMD_SKIPROM				0xCC					/** Skip ROM addressing scheme (only one sensor). */
#define	CMD_READ_SCRATCHPAD		0xBE					/** Read 9 bytes of scratchpad. */

typedef union
{
	struct {
		uint8_t		tc_lsb;			/* Temperature C LSB */
		uint8_t		tc_msb;			/* Temperature C MSB */
		uint8_t		user1;			/* User data 1 */
		uint8_t		user2;			/* User data 2 */
		uint8_t		config;			/* configuration register */
		uint8_t		reserved1;
		uint8_t		reserved2;
		uint8_t		reserved3;
		uint8_t		crc;			/* 8 bit CRC code */
	} registers;
	uint8_t bytes[9];
} __attribute__((packed)) ds18b20_scratchpad_t;


typedef union
{
	struct {
		uint8_t		family;			/* Family Code */
		uint8_t		sn[6];			/* Serial Number */
		uint8_t		crc;			/* 8 bit CRC code */
	} registers;
   	uint8_t bytes[8];
} __attribute__((packed)) ds18b20_rom_t;

static ds18b20_scratchpad_t	ds18b20_scratchpad;
static ds18b20_rom_t		ds18b20_rom;

#define input_ds18b20_pin() 	(caribou_gpio_pinstate(&gpio_ds18b20) ? 1 : 0)
#define output_ds18b20_pin(c) 	caribou_gpio_write(&gpio_ds18b20,c)
	
static bool 	ds18b20_reset 			( void );
static bool 	ds18b20_read_bit 		( void );
static void 	ds18b20_write_bit 		( bool data );
static void 	ds18b20_write_byte 		( uint8_t c );
static uint8_t 	ds18b20_read_byte 		( void );
static bool 	ds18b20_read_celcius 	( uint8_t* digit,uint16_t* decimal );
static uint8_t 	calc_crc_bit 			( uint8_t shift_reg, uint8_t data_bit );
static uint8_t 	calc_crc 				( uint8_t* bytes, int count );


extern void ds18b20_setup( void )
{
	memset(&ds18b20_scratchpad,0,sizeof(ds18b20_scratchpad_t));
	memset(&ds18b20_rom,0,sizeof(ds18b20_rom_t));
	output_ds18b20_pin(1);
	ds18b20_reset();
}

extern float ds18b20_degrees_c( void )
{
	float tc=0.0;
	int8_t digit=0;
	uint16_t decimal=0;

	if ( ds18b20_read_celcius((uint8_t*)&digit,&decimal) )
	{
		tc = (float)digit;
		tc += (float)decimal * 0.0001;
	}

	return tc;
}

extern void ds18b20_timing_test()
{
		output_ds18b20_pin(0);
		usdelay(100);
		output_ds18b20_pin(1);
		usdelay(100);
		output_ds18b20_pin(0);
		usdelay(100);
		output_ds18b20_pin(1);
		usdelay(100);

		output_ds18b20_pin(0);
		usdelay(50);
		output_ds18b20_pin(1);
		usdelay(50);
		output_ds18b20_pin(0);
		usdelay(50);
		output_ds18b20_pin(1);
		usdelay(50);

		output_ds18b20_pin(0);
		usdelay(10);
		output_ds18b20_pin(1);
		usdelay(10);
		output_ds18b20_pin(0);
		usdelay(10);
		output_ds18b20_pin(1);
		usdelay(10);

}

/**
 ** @brief Reset the DS18B20 and wait for presence acknowlegement.
 */
static bool ds18b20_reset( void )
{
	bool rc=false;
	output_ds18b20_pin(0);						/** Pull low. */
	usdelay(500);								/** For 500 us. */
	output_ds18b20_pin(1);						/** Pull output up. */
	usdelay(60);
	rc = input_ds18b20_pin();					/** Sample the initial state (reply). */
	usdelay(500);								/** For 500 us. */
	return !rc;
}

/**
 ** @brief Read in a bit from the DS18B20 device.
 ** @brief Return a bool repersenting the state of the bit true (1), false (0).
 */
static bool ds18b20_read_bit( void )
{
	bool rc;
	__disable_irq();
	output_ds18b20_pin(0);							/** Read bit sequence... */
	usdelay(1);
	output_ds18b20_pin(1);
	usdelay(14);
	rc = input_ds18b20_pin();						/** Read the bit. */
	__enable_irq();
	usdelay(45);
	return rc;
}

/**
 ** @brief Write a bit to the DS18B20 device.
 ** @param data Write a bit represented by a bool where true (1) false (0).
 */
static void ds18b20_write_bit( bool data )
{
	__disable_irq();
	output_ds18b20_pin(0);							/** Write a (0) bit... */
	usdelay(1);										/** Change to a (1) bit... */
	output_ds18b20_pin(data);						/** if 1 bit, release line, else hold low */
	__enable_irq();
	usdelay(60);
	output_ds18b20_pin(1);							/** release the line */
}

/**
 ** @brief Write a byte to the DS18B20 device LSB first.
 */
static void ds18b20_write_byte( uint8_t c )
{
	for( int8_t i=0; i < 8; i++ )
	{
		ds18b20_write_bit(c&1);
		c >>= 1;
	}
}

/**
 ** @brief Read a character from the DS18B20 LSB first.
 ** @return The character received.
 */
static uint8_t ds18b20_read_byte( void )
{
	uint8_t c=0;
	for( int8_t i=0; i < 8; i++)
	{
		c >>= 1;
		c |= (ds18b20_read_bit()<<7);
	}
	return c;
}

/**
 ** @return degrees in celsius
 */
static bool ds18b20_read_celcius(uint8_t* digit,uint16_t* decimal)
{
	bool rc=false;
	if ( (rc=ds18b20_reset()) )										/* Reset */
	{
		ds18b20_write_byte(CMD_SKIPROM);							/* Skip ROM and start temperature conversion */
		ds18b20_write_byte(CMD_CONVERT_T);							/* Start temperature conversion */
		while(!ds18b20_read_bit()) msdelay(64);						/* Wait until conversion is complete... */
		//Reset, skip ROM and send command to read Scratchpad
		if ( (rc=ds18b20_reset()) )									/* Reset */
		{
			ds18b20_write_byte(CMD_SKIPROM);
			ds18b20_write_byte(CMD_READ_SCRATCHPAD);
			for(int x=0; x < 9; x++)								/* Read Scratchpad ... */
			{
				ds18b20_scratchpad.bytes[x]=ds18b20_read_byte();			/* ...bytes */
			}
			if ( (rc=(calc_crc(ds18b20_scratchpad.bytes,8) == ds18b20_scratchpad.registers.crc )) )
			{
				if ( (rc=ds18b20_reset()) )
				{
					//ds18b20_write_byte(CMD_SKIPROM);
					ds18b20_write_byte(CMD_READROM);
					for(int x=0; x < 8; x++)								/* Read ROM ... */
					{
						ds18b20_rom.bytes[x]=ds18b20_read_byte();			/* ...bytes */
					}
					if ( (rc=calc_crc(ds18b20_rom.bytes,7) == ds18b20_rom.registers.crc) )
					{
						//Store temperature integer digits and decimal digits
						*digit=ds18b20_scratchpad.registers.tc_lsb>>4;
						*digit|=(ds18b20_scratchpad.registers.tc_msb&0xf)<<4;
						//Store decimal digits
						*decimal=ds18b20_scratchpad.registers.tc_lsb&0xf;
						*decimal*=DECIMAL_STEPS_12BIT;
					}
				}
			}
		}
	}
	return rc;
}

static uint8_t calc_crc_bit(uint8_t shift_reg, uint8_t data_bit)
{
	uint8_t fb;
	fb = (shift_reg & 0x01) ^ data_bit;	/* exclusive or least sig bit of current shift reg with the data bit */
	shift_reg = shift_reg >> 1;			/* shift one place to the right */
	if (fb==1)
	{
		shift_reg = shift_reg ^ 0x8C;	/* CRC ^ binary 1000 1100 */
	}
	return shift_reg; 
}

/**
 * @brief Calculate the crc
 */
static uint8_t calc_crc(uint8_t* bytes, int count)
{
	uint8_t crc=0;
	for(int n_byte=0; n_byte < count; n_byte++)
	{
		uint8_t byte = bytes[n_byte];
		for(int n_bit=0; n_bit < 8; n_bit++)
		{
			crc = calc_crc_bit(crc,byte&0x01);
			byte>>=1;
		}
	}
	return crc;
}

