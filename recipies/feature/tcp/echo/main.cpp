#include <board.h>
#include <lwip/sockets.h>
#include <xprintf.h>
#include <caribou++.h>
#include <net.h>
#include <delay.h>

#include <ctcpechoserver.h>

#define TCP_ECHO_PORT (2000)

static PikeAero::CTcpEchoServer* tcpEchoServer = NULL;

static void start_server();

extern "C" void board_idle()
{
    hw_gpio_toggle(gpio_led0);
}

extern "C" void feature_main(void* arg)
{
    caribou_thread_t* mainthread = (caribou_thread_t*)arg;
    CARIBOU::CCaribouMainThread::init(mainthread);
    
    xfprintf( xstderr, "Starting network...\n");

    net_init();

    start_server();

    for(;;)
    {
        caribou_thread_yield();
    }
}

static void start_server()
{
    xfprintf( xstderr, "Echo server on port %d\n",TCP_ECHO_PORT);
    tcpEchoServer = new PikeAero::CTcpEchoServer(TCP_ECHO_PORT);
    tcpEchoServer->start();
}