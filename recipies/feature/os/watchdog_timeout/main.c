/******************************************************************************
******************************************************************************/
#include <board.h>
#include <delay.h>
#include <syslog.h>
#include <syslog_printf.h>

static void watchdog_checkin(void);
static void watchdog_timeout(caribou_thread_t* thread);

static syslog_t 	syslog;

extern void feature_main(void* arg)
{
    syslog_init( &syslog, stderr, syslog_fputc );

    caribou_thread_watchdog_init( watchdog_checkin, watchdog_timeout );
    caribou_thread_watchdog_start( caribou_thread_current(), 100 );

    SYSLOG_PRINTF( &syslog, SYSLOG_DEBUG, "Starting..." );

	for( ;; )
	{
		hw_gpio_toggle(gpio_led0);
		SYSLOG_PRINTF( &syslog, SYSLOG_DEBUG, "%d", hw_gpio_state(gpio_led0));
		msdelay(128);
        caribou_thread_watchdog_feed_self();
	}
}

static void watchdog_checkin(void)
{
    //SYSLOG_PRINTF( &syslog, SYSLOG_DEBUG, "watchdog_checkin" );
}

static void watchdog_timeout(caribou_thread_t* thread)
{
    SYSLOG_PRINTF( &syslog, SYSLOG_DEBUG, "watchdog_timeout" );
    fflush(stderr);
}

