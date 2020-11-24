#include <heat.h>
#include <hw_lptim.h>
#include <linearmap.h>
#include <ds18b20.h>
#include <pid.h>

#define PID_PERIOD_MS		500
#define PID_KP 				1.0f
#define PID_KI				0.0125f
#define PID_KD				0.65f
#define BIT_FREQUENCY		10000000
#define BITS_PER_PERIOD		10000
#define PID_MAX_PWM_DEF 	70.0f

typedef struct 
{
	pid_t 	pid;
	float 	target;
	float	actual;
	float 	pwm;
} heat_t;

static heat_t heat;
static void   timer_set_pwm();



void heat_setup( void )
{
	memset(&heat,0,sizeof(heat_t));

	hw_lptim_setup            ( LPTIM1, LPTIM_PRESCALE_DIV_8 );
	hw_lptim_set_arr          ( LPTIM1, BITS_PER_PERIOD );
	timer_set_pwm     		  ( heat.pwm );
	hw_lptim_set_out_polarity ( LPTIM1, true );
	hw_lptim_start            ( LPTIM1, false );

	pid_create(&heat.pid, &heat.actual, &heat.pwm, &heat.target, PID_KP, PID_KI, PID_KD);
	pid_period(&heat.pid, PID_PERIOD_MS);
	pid_limits(&heat.pid, 0.0f, PID_MAX_PWM_DEF);
}

void heat_service( void )
{
	if ( pid_enabled(&heat.pid) != NULL )
	{
		if ( pid_service( &heat.pid ) )
		{
			timer_set_pwm();
		}
	}
	else
	{
		timer_set_pwm( 0.0f );
	}
}

void heat_set_actual( float actual )
{
	heat.actual = actual;
}

float heat_get_actual( void )
{
	return heat.actual;
}

void heat_set_target( float target )
{
	heat.target = target;
}

float heat_get_target( void )
{
	return heat.target;
}

void heat_set_active( bool active )
{
	pid_enable(&heat.pid, active);
}

bool heat_get_active ( void )
{
	return pid_enabled(&heat.pid);
}

void heat_set_max_pwm( float max_pwm )
{
	pid_limits(&heat.pid, 0.0f, max_pwm);
}

float heat_get_pwm( void )
{
	return heat.pwm;
}


static void timer_set_pwm( void )
{
	float scaled = linearmap( heat_get_pwm(), 0.0f, 100.0f, 0.0f, BITS_PER_PERIOD );
	hw_lptim_set_cmp( LPTIM1, scaled );
}

