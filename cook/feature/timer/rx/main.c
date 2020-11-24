/******************************************************************************
******************************************************************************/
#include <board.h>
#include <delay.h>
#include <hw_pwm.h>
#include <hw_gpio.h>

#define gpio_pin			gpio_ram0_nss

// #define TIMER_FREQ			RX_TIM_PERIOD_HZ
#define TIMER_FREQ			250000

typedef enum
{
	idle=0,
	active,
	complete
} timer_state_t;

typedef struct
{

	caribou_tick_t 	start_time;
	caribou_tick_t 	interval;
	uint32_t		cycles;
	timer_state_t	state;

} timer_t;

static volatile timer_t timer;

static void timer_irq	( InterruptVector vector, void* arg );

static void timer_setup 	( void );
static void timer_service 	( void );


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
	memset(&timer,0,sizeof(timer_t));

	timer.cycles = 255;
	timer.interval = 2;
	
	hw_pwm_setup( RX_TIM, tim_period( RX_TIM_HZ, TIMER_FREQ ), tim_precale( RX_TIM_BUS_HZ, RX_TIM_HZ ) );

	caribou_vector_install( RX_TIM_IRQn, timer_irq, NULL );
	caribou_vector_enable( RX_TIM_IRQn );
}


static void timer_service( void )
{
	switch( timer.state )
	{
		default:
		case idle:
			if ( caribou_timer_ticks_timeout( timer.start_time, from_ms(timer.interval) ) )
			{
				timer.state = active;
				hw_pwm_chan_setup   	( RX_TIM, RX_TIM_PWM_CHANNEL, false );
				hw_pwm_chan_set_duty	( RX_TIM, RX_TIM_PWM_CHANNEL, (tim_period( RX_TIM_HZ, TIMER_FREQ ) / 2) );
				hw_pwm_enable_update_int( RX_TIM );
				hw_pwm_enable_cc1_int   ( RX_TIM );
				hw_pwm_set_repetition	( RX_TIM, timer.cycles );
				hw_pwm_chan_start   	( RX_TIM, RX_TIM_PWM_CHANNEL );
				hw_pwm_start        	( RX_TIM );
				timer.start_time = caribou_timer_ticks();
			}
			break;

		case active:
			break;

		case complete:
			{
				putchar('*');
				timer.state = idle;
			}
			break;
	}
}


static void timer_irq( InterruptVector vector, void* arg )
{
	if ( hw_pwm_update_int_pending( RX_TIM ) )
	{
		hw_pwm_ack_update_int( RX_TIM );
		hw_pwm_chan_stop( RX_TIM, RX_TIM_PWM_CHANNEL );
		hw_pwm_stop( RX_TIM );
		hw_pwm_disable_update_int( RX_TIM );
		timer.state = complete;
	}
	else
	if ( hw_pwm_cc1_int_pending( RX_TIM ) )
	{
		hw_pwm_cc1_int_ack( RX_TIM );
		caribou_gpio_set(&gpio_pin);
		caribou_gpio_reset(&gpio_pin);
	}
}
