/***************************************************************************
 *	Copyright © 2005-2011 by Pike Aerospace Research Corporation		   *
 *	info@pikeaero.com													   *
 ***************************************************************************/

#include <caribou.h>
#include <lcd16x2.h>

#define THREAD_STACK_SIZE	(1024)

uint32_t thread1_stack[THREAD_STACK_SIZE/4];
uint32_t thread2_stack[THREAD_STACK_SIZE/4];
uint32_t thread3_stack[THREAD_STACK_SIZE/4];

extern void thread1(void* arg)
{
	for(;;)
	{
		caribou_gpio_toggle(&gpio_led_d2);
		printf("thread1\n");
		fflush(stdout);
		caribou_thread_sleep_current(from_ms(500));
	}
}

extern void thread2(void* arg)
{
	for(;;)
	{
		caribou_gpio_toggle(&gpio_led_d3);
		printf("thread2\n");
		fflush(stdout);
		caribou_thread_sleep_current(from_ms(500));
	}
}

extern void thread3(void* arg)
{
	uint8_t cnt=0;
	static char* buf[32];

	lcd_init();

	for(;;)
	{
		sprintf(buf,"%d",cnt);
		lcd_goto(0,0);
		lcd_write(buf,strlen(buf));
		
		if ( !caribou_gpio_pinstate(&gpio_button_s1) )
		{
        	caribou_gpio_set(&gpio_led_d4);
			printf("s1\n");
			fflush(stdout);
		}
		else
		{
			caribou_gpio_reset(&gpio_led_d4);
		}


		if ( !caribou_gpio_pinstate(&gpio_button_s2) )
		{
        	caribou_gpio_set(&gpio_led_d5);
			printf("s2\n");
			fflush(stdout);
		}
		else
		{
			caribou_gpio_reset(&gpio_led_d5);
		}

		caribou_thread_yield();

        caribou_gpio_toggle(&gpio_led_d9);
	}
}

int main(int argc,char* argv[])
{
	caribou_init(0);
	caribou_thread_create("thread1",thread1,NULL,NULL,thread1_stack,THREAD_STACK_SIZE,1,0);
	caribou_thread_create("thread2",thread2,NULL,NULL,thread2_stack,THREAD_STACK_SIZE,1,0);
	caribou_thread_create("thread3",thread3,NULL,NULL,thread3_stack,THREAD_STACK_SIZE,1,0);
	caribou_exec();
}
                                          