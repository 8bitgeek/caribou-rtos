/******************************************************************************
******************************************************************************/
#include <board.h>
#include <delay.h>

static void dump( void* buf, uint32_t sz );

void feature_main( void )
{
	uint16_t* ram_buffer = (uint16_t*)hw_sdram_base();
	int count=0;

	for( ;; )
	{
		bool fail=false;
		register uint32_t size = hw_sdram_size()/2;
		register uint32_t index;
		register uint16_t d=0;

        for(index=0; index < size; index++)
        {
            ram_buffer[index] = d++;
        }
		
		msdelay(100);

		d=0;
        for(index=0; index < size; index++)
        {
            if ( ram_buffer[index] != d )
			{
				fail=true;
				break;
			}
			++d;
        }

		if ( fail )
		{
			fprintf( stderr, "%d: fail ", ++count );
	        dump(&ram_buffer[index],8);
		}
		else
		{
			fprintf( stderr, "%08d: %d words OK\n", caribou_timer_ticks(), size );
		}
		
	}
}

static void dump( void* buf, uint32_t sz )
{
	fprintf(stderr,"@0x%08X:",buf);
    uint8_t* p = (uint8_t*)buf;
	for(uint32_t n=0; n < sz; n++)
	{
		fprintf(stderr,"%02X ", p[n]);
	}
	fprintf(stderr,"\n");
}

