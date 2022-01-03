#include <board.h>
#include <lwip/sockets.h>
#include <syslog.h>
#include <syslog_printf.h>
#include <caribou++.h>
#include <net.h>
#include <delay.h>

#include <ctcpechoserver.h>

static PikeAero::CTcpEchoServer* tcpEchoServer = NULL;
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
    tcpEchoServer = new PikeAero::CTcpEchoServer(2000);
    tcpEchoServer->start();
}