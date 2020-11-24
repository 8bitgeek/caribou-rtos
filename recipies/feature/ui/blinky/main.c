/******************************************************************************
******************************************************************************/
#include <board.h>
#include <delay.h>

extern void feature_main(void* arg)
{
	for( ;; )
	{
		hw_gpio_toggle(gpio_led0);
		msdelay(500);
	}
}
