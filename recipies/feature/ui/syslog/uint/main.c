/******************************************************************************
******************************************************************************/
#include <board.h>
#include <syslog.h>
#include <syslog_printf.h>

static syslog_t 	syslog;

extern void feature_main(void* arg)
{
	syslog_init( &syslog, stderr, syslog_fputc );

	for( ;; )
	{
		uint32_t x;

		for( x=-1000; x != 1000; x++ )
		{
			SYSLOG_PRINTF( &syslog, SYSLOG_DEBUG, "%1u, %2u, %3u, %4u, %5u", x, x, x, x, x );
		}
	}
}
