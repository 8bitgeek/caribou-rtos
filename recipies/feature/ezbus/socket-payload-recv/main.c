#include <board.h>
#include <ezbus.h>
#include <ezbus_flip.h>
#include <ezbus_port.h>
#include <syslog.h>
#include <syslog_printf.h>

#if !defined(AFX_MAX_PACKET_SZ)
    #define AFX_MAX_PACKET_SZ   2048
#endif

typedef struct main
{
    ezbus_port_t    port;
    ezbus_t         ezbus;
    ezbus_socket_t  socket;
    syslog_t        syslog;
    uint32_t        bytes_recvd;
    uint8_t         send_buffer[AFX_MAX_PACKET_SZ];
    uint8_t         recv_buffer[AFX_MAX_PACKET_SZ];
    size_t          bytes_received;
    caribou_tick_t  timer_start;
} feature_state_t;

static feature_state_t feature_state;

static void init_send_buffer( void );
static void rotate_send_buffer( void );
static void setup_threads( void );
static void print_banner ( void );
static void ezapp_app_run(ezbus_t* ezbus);
static void ezbus_socket_open_peer ( ezbus_mac_t* mac, ezbus_address_t* peer_address );

extern void feature_main(void* arg)
{
    memset( &feature_state, 0, sizeof(feature_state_t) );
    feature_state.socket = EZBUS_SOCKET_INVALID;
    init_send_buffer();
    feature_state.timer_start = caribou_timer_ticks();

    syslog_init( &feature_state.syslog, stderr, syslog_fputc );

	SYSLOG_PRINTF( &feature_state.syslog, SYSLOG_DEBUG, "pclk=%d", SystemCoreClock );

    ezbus_callback_setup( &feature_state.port );

    if ( ezbus_port_open( &feature_state.port, EZBUS_SPEED_DEF ) == EZBUS_ERR_OKAY )
    {
        SYSLOG_PRINTF( &feature_state.syslog, SYSLOG_DEBUG, "ezbus init" );
        ezbus_init( &feature_state.ezbus, &feature_state.port );
        SYSLOG_PRINTF( &feature_state.syslog, SYSLOG_DEBUG, "self %s", ezbus_address_string(&ezbus_self_address) );

        for(;;) /* forever... */
        {
            static caribou_tick_t start=0;
            ezbus_run(&feature_state.ezbus);
            ezapp_app_run(&feature_state.ezbus);
            if ( caribou_timer_ticks_timeout(start,125) )
            {
                hw_gpio_toggle(gpio_led0);
                start = caribou_timer_ticks();
            }
        }
    }
    else
    {
        SYSLOG_PRINTF( &feature_state.syslog, SYSLOG_DEBUG, "ezbus open failed" );
    }
}

static void init_send_buffer( void )
{
    for(uint16_t n=0; n < AFX_MAX_PACKET_SZ; n++)
    {
        feature_state.send_buffer[n] = (uint8_t)(n&0xFF);
    }
}

static void rotate_send_buffer( void )
{
    uint8_t ch = feature_state.send_buffer[0];
    memmove(&feature_state.send_buffer[0],&feature_state.send_buffer[1],AFX_MAX_PACKET_SZ-1);
    feature_state.send_buffer[AFX_MAX_PACKET_SZ-1]=ch;
}


extern bool ezbus_socket_callback_send ( ezbus_socket_t socket )
{
    // char ch='\0';
    // return ezbus_socket_send( socket, &ch, 1 /* AFX_MAX_PACKET_SZ */ ) > 0;
    return false;
}

extern bool ezbus_socket_callback_recv ( ezbus_socket_t socket )
{
    int bytes_recvd=ezbus_socket_recv( socket, feature_state.recv_buffer, AFX_MAX_PACKET_SZ );
        feature_state.bytes_recvd += bytes_recvd;
        if ( caribou_timer_ticks() - feature_state.timer_start > 1000 )
        {
            SYSLOG_PRINTF( &feature_state.syslog, SYSLOG_DEBUG, "(%d) rx %d bps", bytes_recvd, feature_state.bytes_recvd*8 );
            feature_state.timer_start = caribou_timer_ticks(); 
            feature_state.bytes_recvd = 0;
        }

    return true;
}

extern void ezbus_socket_callback_closing ( ezbus_socket_t socket )
{
    if ( socket == feature_state.socket )
    {
        SYSLOG_PRINTF( &feature_state.syslog, SYSLOG_DEBUG, "socket %d", feature_state.socket );
        feature_state.socket = EZBUS_SOCKET_INVALID;
        feature_state.bytes_recvd = 0;
        feature_state.timer_start = caribou_timer_ticks(); 
        init_send_buffer();
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
            SYSLOG_PRINTF( &feature_state.syslog, SYSLOG_DEBUG, "%s %d", ezbus_address_string(peer_address), feature_state.socket );
            rc = peer_address;
        }
    }
    return rc;
}

static void ezbus_socket_open_peer ( ezbus_mac_t* mac, ezbus_address_t* peer_address )
{
    if ( feature_state.socket == EZBUS_SOCKET_INVALID )
    {
        feature_state.socket = ezbus_socket_open( mac, peer_address, EZBUS_SOCKET_ANY );
        SYSLOG_PRINTF( &feature_state.syslog, SYSLOG_DEBUG, "peer %s %d", ezbus_address_string(peer_address), feature_state.socket );
    }
}

static void ezapp_app_run(ezbus_t* ezbus)
{
    // if ( feature_state.socket == EZBUS_SOCKET_INVALID )
    // {
    //     ezbus_mac_t* mac = ezbus_mac( ezbus );
    //     ezbus_address_t* peer_address = get_a_peer( ezbus_mac( ezbus ) );
    //     if ( peer_address )
    //     {
    //         ezbus_socket_open_peer( mac, peer_address );
    //     }
    // }
}


