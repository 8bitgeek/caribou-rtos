/******************************************************************************
******************************************************************************/
#include <board.h>
#include <sram.h>

#define RAM_SIZE_BYTES		(1024*256)
#define PATTERN_BUFFER_SZ	(256)

static void dump( uint8_t* buf, uint32_t sz );

void feature_main( void )
{
	static uint8_t write_buffer[PATTERN_BUFFER_SZ];
	static uint8_t read_buffer[PATTERN_BUFFER_SZ];

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
			sram_write_data_dma( address, write_buffer, PATTERN_BUFFER_SZ );
		}
		time_end = caribou_state.jiffies;
		printf( "write.time=%dms\n", time_end-time_start );

		/* read */
		time_start = caribou_state.jiffies;
		for( address=0; address < RAM_SIZE_BYTES; address+=PATTERN_BUFFER_SZ )
		{
			sram_read_data_dma( address, read_buffer, PATTERN_BUFFER_SZ );
			if ( memcmp( write_buffer, read_buffer, PATTERN_BUFFER_SZ ) != 0 )
			{
				printf( "FAIL %08X\n", address );
				dump( write_buffer, PATTERN_BUFFER_SZ );
				printf( "-----\n" );
				dump( read_buffer, PATTERN_BUFFER_SZ );
				caribou_thread_sleep_current(from_ms(3000));
			}
		}
		time_end = caribou_state.jiffies;
		printf( " read.time=%dms\n", time_end-time_start );
	}
}

static void dump( uint8_t* buf, uint32_t sz )
{
	for(uint32_t n=0; n < sz; n++)
	{
		printf("%02X ", buf[n]);
	}
	printf("\n");
}
