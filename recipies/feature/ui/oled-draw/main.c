/******************************************************************************
******************************************************************************/
#include <board.h>
#include <u8x8cb.h>
#include <u8g2.h>
#include <delay.h>


static void  draw(uint32_t count);

extern void feature_main(void)
{
	uint32_t count=0;

	u8x8cb_setup( U8G2_R0, 0, 0, 0 );

	u8g2_InitDisplay(&u8g2);
	u8g2_SetPowerSave(&u8g2, 0);
	u8g2_SetFont(&u8g2, u8g2_font_helvR08_tf);
	u8g2_ClearBuffer(&u8g2);
	u8g2_SendBuffer(&u8g2);

	for( ;; )
	{
		msdelay(250);
		draw(count++);
	}
}


static void  draw(uint32_t count)
{
	static char print_buf[ 64 ];

	sprintf(print_buf, "%c0x%08X      ",count);
	u8g2_ClearBuffer(&u8g2);
	u8g2_DrawStr(&u8g2, 0,64, print_buf);
	u8g2_SendBuffer(&u8g2);	
}



