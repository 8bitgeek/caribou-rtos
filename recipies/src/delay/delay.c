#include <delay.h>

#pragma GCC push_options
#pragma GCC optimize ("Os")

void usdelay(register uint32_t us)
{
	while( us-- )
	{
		for(volatile uint32_t i=0; i < USDELAY_FACTOR; i++);
	}
}


void msdelay(uint32_t ms)
{
	uint32_t start = caribou_state.jiffies;
	while( caribou_state.jiffies - start <= (ms-1) )
	{
		caribou_thread_yield();
	}
}

#pragma GCC pop_options
