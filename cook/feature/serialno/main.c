#include <board.h>
#include <serialno.h>
#include <syslog.h>
#include <syslog_printf.h>

static serialno_t   serialno;
static syslog_t     syslog;

extern void feature_main(void* arg)
{
	uint32_t count=0;
    syslog_init( &syslog, stderr, syslog_fputc );
	serialno_get(&serialno);
	for( ;; )
	{
		SYSLOG_PRINTF( &syslog, SYSLOG_DEBUG, "%d, %s",++count,serialno_get_hex(&serialno) );
		msdelay(100);
		caribou_thread_yield();
	}
}
