/******************************************************************************
******************************************************************************/
#include <board.h>
#include <diskio.h>
#include <ff.h>
#include <delay.h>

static void do_file_io( void );
static void filesystem_setup( void );

/* Format default drive and create a file */
extern void feature_main(void)
{
    /* Initialize a brand-new disk drive mapped to physical drive 0 */

    FRESULT res;
    BYTE work[FF_MAX_SS];         /* Working buffer */
    DWORD plist[] = {100, 0};  /* Divide the drive into two partitions */
                 /* {0x10000000, 100}; 256M sectors for 1st partition and left all for 2nd partition */
                 /* {20, 20, 20, 0}; 20% for 3 partitions each and remaing space is left not allocated */

    for(;;)
    {
        fprintf( stderr, "starting...\n") ;

        res = f_fdisk(0, plist, work);                    /* Divide physical drive 0 */
        if (res == FR_OK) 
        {
            fprintf( stderr, "success\n") ;
            return;
        }
        else
        {
            fprintf( stderr, "io error %d\n", res);
            msdelay(1000);
        }
    }
}


/** 
 * NOTE: Use CARIBOU board_idle() call-back to service Chan's filesystem clock every 1ms. 
 */
extern void board_idle()
{
	// Chan's filesystem needs 1ms service call from other thread context or on interrupt.
	static caribou_tick_t last_jiffies=0;
	if ( caribou_state.jiffies != last_jiffies )
	{
		disk_timerproc();
	}
}


