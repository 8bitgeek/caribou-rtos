/******************************************************************************
******************************************************************************/
#include <board.h>
#include <delay.h>
#include <hw_lptim.h>
#include <linearmap.h>

#define BIT_FREQUENCY	10000000
#define BITS_PER_PERIOD	10000

static void  timer_setup          ( void );
static void  timer_service        ( void );
static void  timer_set_percent_pwm( float percent );
static float timer_step_pwm       ( void );

static caribou_tick_t 	period_start;

extern void feature_main(void* arg)
{
	timer_setup();

	for( ;; )
	{
		timer_service();
	}
}

static void timer_setup( void )
{
	hw_lptim_setup            ( LPTIM1, LPTIM_PRESCALE_DIV_8 );
	hw_lptim_set_arr          ( LPTIM1, BITS_PER_PERIOD );
	hw_lptim_set_cmp		  ( LPTIM1, BITS_PER_PERIOD/2 );
	hw_lptim_set_out_polarity ( LPTIM1, false );
	hw_lptim_start            ( LPTIM1, false );

	period_start = caribou_timer_ticks();
}

static void timer_service( void )
{
	if ( caribou_timer_ticks_timeout(period_start,from_ms(10)) )
	{
		timer_set_percent_pwm( timer_step_pwm() );
		period_start = caribou_timer_ticks();
	}
	caribou_thread_yield();
}

static void timer_set_percent_pwm( float percent )
{
	float scaled = linearmap( percent, 0.0f, 100.0f, 0.0f, BITS_PER_PERIOD );
	hw_lptim_set_cmp( LPTIM1, scaled );
}

static float timer_step_pwm( void )
{
	static float pwm_percent=0.0f;

	pwm_percent += 1.0f;

	if ( pwm_percent > 100.0f )
		pwm_percent = 0.0f;

	return pwm_percent;
}
