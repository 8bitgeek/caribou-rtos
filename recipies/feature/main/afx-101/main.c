/******************************************************************************
******************************************************************************/
#include <board.h>
#include <comms_thread.h>
#include <piezo.h>
#include <sram.h>
#include <rx-gain.h>

extern void thread_checkin_callback( void );
extern void thread_timeout_callback( caribou_thread_t* node );


extern void feature_main(void)
{
	for(;;)
	{
		caribou_thread_yield();
	}
}


/**
 * @brief Call-back from caribou main thread.
 */
extern void board_idle()
{
	static caribou_tick_t 	led_start 	= 0;

	if ( caribou_timer_ticks_timeout( led_start, from_ms(500) ) )
	{
		hw_gpio_toggle( gpio_led0 );
		hw_gpio_toggle( gpio_led1 );
		
		led_start = caribou_timer_ticks();
	}

	piezo_service();

	caribou_thread_yield();
}

#if PRODUCT_WATCHDOG_ENABLED
	extern void thread_checkin_callback( void )
	{
		chip_watchdog_feed();
	}

	extern void thread_timeout_callback( caribou_thread_t* node )
	{
		fprintf( stderr, ">>> '%s' triggered W/D timeout.\r\n",caribou_thread_name(node));
		fflush(stderr);
		for(;;);
	}
#endif

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

static void setup( void )
{
	print_banner();

	hw_adc_insert_channel ( HW_ADC_CHANNEL_7 );
	hw_adc_insert_channel ( HW_ADC_CHANNEL_8 );
	hw_adc_start();

	hw_opamp_enable();
	rx_gain_set( RX_GAIN_2 );

	hw_dac_set( DAC_V_CAP_CTL, 0xAFF );

	piezo_setup();
	piezo_set_firing_interval( 750 );
	piezo_set_driver_cycles( 32 );

	sram_setup();
}
