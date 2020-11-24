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
    // FATFS fs;           /* Filesystem object */
    // FIL fil;            /* File object */
    FRESULT res;        /* API result code */
    // UINT bw;            /* Bytes written */
    BYTE work[FF_MAX_SS]; /* Work area (larger is better for processing time) */

    fprintf( stderr, "waiting for keypress\n");

    while ( fgetc(stderr) < 0 );

    fprintf( stderr, "starting...\n") ;

    for(;;)
    {
        /* Format the default drive with default parameters */
        res = f_mkfs("", FM_FAT32, 4096, work, sizeof(work)) ;
        if (res == FR_OK) 
        {
            fprintf( stderr, "success\n") ;
        }
        else
        {
            fprintf( stderr, "io error %d\n", res);
        }
    
        msdelay(1000);
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


