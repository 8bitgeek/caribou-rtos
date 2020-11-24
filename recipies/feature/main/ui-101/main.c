/******************************************************************************
******************************************************************************/
#include <board.h>
#include <ui_thread.h>

static void print_banner( void );
static void setup( void );

static void service_filesystem_clock( void );

extern void feature_main(void)
{
	setup();
	for(;;)
	{
		caribou_thread_yield();
	}
}

/** Call-back from caribou main thread. */
extern void board_idle()
{
	service_filesystem_clock();
	//caribou_wfi();
	caribou_thread_yield();
}


static void print_banner()
{
	fprintf( stderr, "pclk=%d\n", SystemCoreClock );
	fprintf( stderr, "RCC_CFGR=%08X\n",RCC->CFGR );
	fprintf( stderr, "RCC_PLLCFGR=%08X\n",RCC->PLLCFGR );
	fprintf( stderr, "Heap: block size: %d bytes free: %d\n",heap_block_size(), heap_bytes_free());
	if ( RCC->CSR & RCC_CSR_LPWRRSTF )	fprintf( stderr, "[Low-power] " );
	if ( RCC->CSR & RCC_CSR_WWDGRSTF )	fprintf( stderr, "[Window watchdog] " );
	if ( RCC->CSR & RCC_CSR_IWDGRSTF )	fprintf( stderr, "[Independent watchdog] " );
	if ( RCC->CSR & RCC_CSR_SFTRSTF )	fprintf( stderr, "[Software] " );
	if ( RCC->CSR & RCC_CSR_BORRSTF )	fprintf( stderr, "[Brownout] " );
	if ( RCC->CSR & RCC_CSR_PINRSTF )	fprintf( stderr, "[PIN] " );
	if ( RCC->CSR & RCC_CSR_OBLRSTF )	fprintf( stderr, "[Option byte loader] " );
	if ( RCC->CSR & RCC_CSR_FWRSTF )	fprintf( stderr, "[Firewall] " );
	fprintf( stderr, "\n");
	fflush( stderr );
}

static void service_filesystem_clock( void )
{
	// Chan's filesystem needs 1ms service call from other thread context or on interrupt.
	static caribou_tick_t last_jiffies=0;
	if ( caribou_state.jiffies != last_jiffies )
	{
		disk_timerproc();
	}
}
