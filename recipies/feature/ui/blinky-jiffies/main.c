/******************************************************************************
******************************************************************************/
#include <board.h>
#include <delay.h>

extern void feature_main(void* arg)
{
    caribou_tick_t t = caribou_timer_ticks();
	for( ;; )
	{
        if ( caribou_timer_ticks() != t )
        {
		    hw_gpio_toggle(gpio_led0);
            t = caribou_timer_ticks();
        }
	}
}
