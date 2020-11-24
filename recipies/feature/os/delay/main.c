/******************************************************************************
******************************************************************************/
#include <board.h>
#include <delay.h>
#include <percent.h>
#include <math.h>

extern void feature_main(void* arg)
{
	register caribou_tick_t start;
	register caribou_tick_t delta;
	float error;

	for( ;; )
	{
		caribou_lock();
		start = caribou_state.jiffies;
		for(register uint32_t n=0; n < 1000; n++)
		{
			usdelay(1000);
		}
		delta = caribou_state.jiffies - start;
		caribou_unlock();

		error = fabsf(100.0f-percent_of((float)delta,1000.0f));
		
		printf( "delta %d error%% %.4f\n", delta, error );
	}
}
