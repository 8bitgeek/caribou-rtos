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
		for( x=-1000.0f; x < 1000.0f; x+=0.33f )
		{
            SYSLOG_PRINTF( &syslog, SYSLOG_DEBUG, "%.1f, %.2f, %.3f, %.4f, %.5f", x, x, x, x, x );
		}
	}
}
