/******************************************************************************
******************************************************************************/
#include <board.h>
#include <sram.h>
#include <syslog.h>
#include <syslog_printf.h>

#define PATTERN_BUFFER_SZ	(256)

static syslog_t syslog;

static void dump( uint8_t* buf, uint32_t sz );

void feature_main( void )
{
	static uint8_t write_buffer[PATTERN_BUFFER_SZ];
	static uint8_t read_buffer[PATTERN_BUFFER_SZ];

    syslog_init( &syslog, stderr, syslog_fputc );

    SYSLOG_PRINTF( &syslog, SYSLOG_DEBUG, "Setup...");

	sram_setup();

	for( int32_t n=0; n < PATTERN_BUFFER_SZ; n++)
	{
		write_buffer[n]=(n&0xFF);
	}

	for( ;; )
	{
		uint32_t address=0;
		caribou_tick_t time_start,time_end;

		/* write */
		time_start = caribou_state.jiffies;
		for( address=0; address < RAM_SIZE_BYTES; address+=PATTERN_BUFFER_SZ )
		{
			sram_write_data( address, write_buffer, PATTERN_BUFFER_SZ );
		}
		time_end = caribou_state.jiffies;
		SYSLOG_PRINTF( &syslog, SYSLOG_DEBUG, "write.time=%dms", time_end-time_start );

		/* read */
		time_start = caribou_state.jiffies;
		for( address=0; address < RAM_SIZE_BYTES; address+=PATTERN_BUFFER_SZ )
		{
			sram_read_data( address, read_buffer, PATTERN_BUFFER_SZ );
			if ( memcmp( write_buffer, read_buffer, PATTERN_BUFFER_SZ ) != 0 )
			{
				SYSLOG_PRINTF( &syslog, SYSLOG_DEBUG, "FAIL %08X", address );
				// dump( write_buffer, PATTERN_BUFFER_SZ );
				// SYSLOG_PRINTF( &syslog, SYSLOG_DEBUG, "-----" );
				// dump( read_buffer, PATTERN_BUFFER_SZ );
				caribou_thread_sleep_current(from_ms(100));
			}
		}
		time_end = caribou_state.jiffies;
		SYSLOG_PRINTF( &syslog, SYSLOG_DEBUG, " read.time=%dms", time_end-time_start );
	}
}

static void dump( uint8_t* buf, uint32_t sz )
{
	for(uint32_t n=0; n < sz; n++)
	{
		SYSLOG_PRINTF( &syslog, SYSLOG_DEBUG,"%02X ", buf[n]);
	}
	SYSLOG_PRINTF( &syslog, SYSLOG_DEBUG,"");
}

