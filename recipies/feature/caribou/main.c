/******************************************************************************
******************************************************************************/
#include <board.h>

#if !defined(THREAD_STK_SZ)
	#define THREAD_STK_SZ		(4096)
#endif

static uint32_t 			feature_stack[ THREAD_STK_SZ/sizeof(uint32_t) ];
static caribou_thread_t* 	feature_thread=NULL;

extern void __attribute__((weak)) feature_main( void* arg );

/** trap stdlib linkages */
void* _sbrk ( int incr )
{
	fprintf(stderr, "\n_sbrk encountered!!!\n");
	chip_reset();
	return NULL;
}

extern int main(void)
{
	caribou_init(0);
	feature_thread = caribou_thread_create( "feature_main", feature_main, NULL, caribou_thread_current(), feature_stack, THREAD_STK_SZ, 1, 0 );
   	caribou_exec();
	return 0;
}

void feature_main( void* arg )
{
    for(;;);
}