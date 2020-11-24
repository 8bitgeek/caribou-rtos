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
		float x;
		for( x=-1000.0; x < 1000.0; x+=0.33 )
		{
            SYSLOG_PRINTF( &syslog, SYSLOG_DEBUG, "%.1g, %.2g, %.3g, %.4g, %.5g", x, x, x, x, x );
		}
	}
}
