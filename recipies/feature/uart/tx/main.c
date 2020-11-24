/******************************************************************************
******************************************************************************/
#include <board.h>
#include <delay.h>

extern void feature_main(void* arg)
{
	for(uint32_t y=0; ;y++)
	{
        fprintf( stderr, "%08X: ", y );
		for(int x=' '; x <= '~'; x++)
            fputc( x, stderr );
        fputc( '\r', stderr );
        fputc( '\n', stderr );
		msdelay(100);
	}
}
