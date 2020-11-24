/******************************************************************************
******************************************************************************/
#include <board.h>
#include <sram.h>

#define RAM_SIZE_BYTES		(1024*128)
#define PATTERN_BUFFER_SZ	256
#define PATTERN_BYTE 		'A'


void feature_main( void )
{
	static uint8_t write_buffer[PATTERN_BUFFER_SZ];
	static uint8_t read_buffer[PATTERN_BUFFER_SZ];
	static uint8_t pattern_byte=PATTERN_BYTE;

	sram_setup();

	for( int32_t n=0; n < PATTERN_BUFFER_SZ; n++)
	{
		write_buffer[n]=pattern_byte = n;
	}

	for( ;; )
	{
		uint32_t address=0;
		caribou_tick_t time_start,time_end;

		/* write */
		time_start = caribou_state.jiffies;
		caribou_lock();
		for( address=0; address < RAM_SIZE_BYTES; address+=PATTERN_BUFFER_SZ )
		{
			sram_write_data( address, write_buffer, PATTERN_BUFFER_SZ );
		}
		caribou_unlock();
		time_end = caribou_state.jiffies;
		printf( "write.time=%dms\n", time_end-time_start );

		/* read */
		time_start = caribou_state.jiffies;
		caribou_lock();
		for( address=0; address < RAM_SIZE_BYTES; address+=PATTERN_BUFFER_SZ )
		{
			sram_read_data( address, read_buffer, PATTERN_BUFFER_SZ );
			if ( memcmp( write_buffer, read_buffer, PATTERN_BUFFER_SZ ) != 0 )
			{
				printf( "FAIL %08X\n", address );
			}
		}
		caribou_unlock();
		time_end = caribou_state.jiffies;
		printf( " read.time=%dms\n", time_end-time_start );
	}
}

