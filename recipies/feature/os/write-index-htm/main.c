/******************************************************************************
******************************************************************************/
#include <board.h>
#include <diskio.h>
#include <ff.h>
#include <delay.h>

static FATFS FatFs;

static bool do_file_io( void );
static void filesystem_setup( void );

extern void feature_main(void)
{
    DSTATUS status;
    FRESULT res;

    fprintf( stderr, "waiting for keypress\n");

    while ( fgetc(stderr) < 0 );

    fprintf( stderr, "starting...\n" );

    for(;;)
    {
        if ( (status=disk_initialize( 0 )) == 0 )
        { 
            fprintf( stderr, "disk initialized...\n" );

            if ( (res=f_mount( &FatFs, "", 0 ) ) == 0 )
            {
                fprintf( stderr, "mounted...\n" );

                for(;;)
                {
                    if ( do_file_io() )
                        return;
                    msdelay(1000);
                }
            }
            else
            {
                fprintf( stderr, "f_mount failed #%d\n", res);
            }
        }
        else
        {
            fprintf( stderr, "disk_initialize failed #%d\n", status );
        }
    }
    msdelay(1000);

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

static bool do_file_io( void )
{
	static char* write_buf = "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.1 Strict//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">\n<html>\n<head>\n<title>Hello World</title>\n</head>\n<body>\nHello World\n</body>\n</html>\n";
	static char read_buf[ 512 ];

	FIL fil;
	FRESULT rc;

	memset(read_buf,0,256);

	rc = f_open( &fil, "INDEX.HTM", FA_CREATE_ALWAYS | FA_READ | FA_WRITE );

	if ( rc == FR_OK )
	{
		UINT bytes_written;

		rc = f_write( &fil, write_buf, strlen(write_buf), &bytes_written );

		if ( rc == FR_OK && bytes_written == strlen(write_buf) )
		{

			rc = f_lseek( &fil, 0L );

			if( rc == FR_OK )
			{

				UINT bytes_read;

				rc = f_read( &fil, read_buf, strlen(write_buf), &bytes_read );

				fprintf( stderr, "%d %d %s\n", rc, bytes_read, read_buf);

				if ( rc == FR_OK && bytes_read == strlen(write_buf) )
				{

					fprintf( stderr, "write/read ok\n" );
				
				}
			}
		}

		f_close( &fil );
	}

	fprintf( stderr, "file io %d\n",rc );

    return rc==0;
}

