#include <board.h>
#include <lwip/sockets.h>
#include <syslog.h>
#include <syslog_printf.h>
#include <caribou++.h>
#include <net.h>
#include <delay.h>
#include <chttpformserver.h>
#include <csettings.h>

static MineAirQuality::CHttpFormServer* httpFormServer = NULL;
static syslog_t syslog;

static void start_server();

extern "C" void board_idle()
{
    hw_gpio_toggle(gpio_led0);
}

extern "C" void feature_main(void* arg)
{
    caribou_thread_t* mainthread = (caribou_thread_t*)arg;
    CARIBOU::CCaribouMainThread::init(mainthread);
    
    syslog_init( &syslog, stderr, syslog_fputc );

    SYSLOG_PRINTF( &syslog, SYSLOG_DEBUG, "Starting...");

    new MineAirQuality::CSettings(&gpio_i2c_scl,&gpio_i2c_sda,&gpio_eeprom_wp);

    net_init();

    start_server();

    for(;;)
    {
        caribou_thread_yield();
    }
}

static void start_server()
{
    SYSLOG_PRINTF( &syslog, SYSLOG_DEBUG, "Starting Server...");
    httpFormServer = new MineAirQuality::CHttpFormServer(80);
    httpFormServer->start();
}