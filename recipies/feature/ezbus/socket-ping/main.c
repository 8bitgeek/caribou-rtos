#include <board.h>
#include <ezbus.h>
#include <ezbus_flip.h>
#include <ezbus_port.h>
#include <syslog.h>
#include <syslog_printf.h>

static void setup_threads( void );
static void print_banner ( void );
static void ezapp_app_run(ezbus_t* ezbus);
static void ezbus_socket_open_peer ( ezbus_mac_t* mac, ezbus_address_t* peer_address );

static ezbus_port_t             port;
static ezbus_t                  ezbus;
static ezbus_socket_t           socket = EZBUS_SOCKET_INVALID;
static int                      send_number=0;
static int                      recv_number=0;
static bool                     recvd=true;
static syslog_t                 syslog;

extern void feature_main(void* arg)
{
    syslog_init( &syslog, stderr, syslog_fputc );

    ezbus_callback_setup( &port );

    if ( ezbus_port_open( &port, EZBUS_SPEED_DEF ) == EZBUS_ERR_OKAY )
    {
        SYSLOG_PRINTF( &syslog, SYSLOG_DEBUG, "ezbus init" );
        ezbus_init( &ezbus, &port );
        SYSLOG_PRINTF( &syslog, SYSLOG_DEBUG, "self %s", ezbus_address_string(&ezbus_self_address) );

        for(;;) /* forever... */
        {
            ezbus_run(&ezbus);
            ezapp_app_run(&ezbus);
        }
    }
    else
    {
        SYSLOG_PRINTF( &syslog, SYSLOG_DEBUG, "ezbus open failed" );
    }
}

extern bool ezbus_socket_callback_send ( ezbus_socket_t socket )
{
    if ( recvd )
    {
        char number[33];
        recvd=false;
        sprintf( number, "%d", send_number );
        return ezbus_socket_send( socket, number, ezbus_platform_strlen(number) ) > 0;
    }
    return false;
}

extern bool ezbus_socket_callback_recv ( ezbus_socket_t socket )
{
    char number[33];
    ezbus_platform_memset(number,0,33);
    if ( ezbus_socket_recv( socket, number, 32 ) > 0 )
    {
        recvd=true;
        //SYSLOG_PRINTF( &syslog, SYSLOG_DEBUG, "%d\t%d\t%d", socket, ezbus_socket_get_peer_socket(socket), recv_number);
        if ( recv_number != send_number-1 )
        {
            SYSLOG_PRINTF( &syslog, SYSLOG_DEBUG, "! %d\t%d\t%d != %d", socket, ezbus_socket_get_peer_socket(socket), recv_number, send_number-1);
        }
        recv_number = atoi(number);
        send_number++;
    }
    return true;
}

extern void ezbus_socket_callback_closing ( ezbus_socket_t closing_socket )
{
    if ( closing_socket == socket )
    {
        SYSLOG_PRINTF( &syslog, SYSLOG_DEBUG, "socket %d", socket );
        socket = EZBUS_SOCKET_INVALID;
        send_number=0;
        recv_number=0;
        recvd=true;
    }    
}

static ezbus_address_t* get_a_peer( ezbus_mac_t* mac )
{
    ezbus_address_t* rc = NULL;;
    for( int n=0; rc == NULL && n < ezbus_mac_peers_count( mac ); n++ )
    {
        ezbus_peer_t* peer = ezbus_mac_peers_at( mac, n );
        ezbus_address_t* peer_address = ezbus_peer_get_address( peer );
        if ( !ezbus_address_is_self(peer_address) )
        {
            SYSLOG_PRINTF( &syslog, SYSLOG_DEBUG, "%s %d", ezbus_address_string(peer_address), socket );
            rc = peer_address;
        }
    }
    return rc;
}

static void ezbus_socket_open_peer ( ezbus_mac_t* mac, ezbus_address_t* peer_address )
{
    if ( socket == EZBUS_SOCKET_INVALID )
    {
        socket = ezbus_socket_open( mac, peer_address, EZBUS_SOCKET_ANY );
        SYSLOG_PRINTF( &syslog, SYSLOG_DEBUG, "peer %s %d", ezbus_address_string(peer_address), socket );
    }
}

static void ezapp_app_run(ezbus_t* ezbus)
{
    if ( socket == EZBUS_SOCKET_INVALID )
    {
        ezbus_mac_t* mac = ezbus_mac( ezbus );
        ezbus_address_t* peer_address = get_a_peer( ezbus_mac( ezbus ) );
        if ( peer_address )
        {
            ezbus_socket_open_peer( mac, peer_address );
        }
    }
}


