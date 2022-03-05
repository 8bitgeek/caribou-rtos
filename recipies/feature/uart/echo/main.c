/******************************************************************************
******************************************************************************/
#include <board.h>
#include <delay.h>

extern void feature_main(void* arg)
{
	fprintf(stderr,"type characters and observe echo...\n");
	for( ;; )
	{
		int ch = fgetc(stderr);

		if ( ch >= 0 )
		{
			hw_gpio_set(gpio_led0);
			
			msdelay(1);
			fputc(ch,stderr);
			
			hw_gpio_reset(gpio_led0);
		}

		caribou_thread_yield();
	}
}
