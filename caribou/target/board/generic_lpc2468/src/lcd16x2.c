/*
   _________    ____  ________  ____  __  __   ____  __________  _____
  / ____/   |  / __ \/  _/ __ )/ __ \/ / / /  / __ \/_  __/ __ \/ ___/
 / /   / /| | / /_/ // // __  / / / / / / /  / /_/ / / / / / / /\__ \ 
/ /___/ ___ |/ _, _// // /_/ / /_/ / /_/ /  / _, _/ / / / /_/ /___/ / 
\____/_/  |_/_/ |_/___/_____/\____/\____/  /_/ |_| /_/  \____//____/  
                                                                      

Copyright © 2014-2015 by Mike Sharkey
Copyleft © 2018 by Mike Sharkey 
mike@pikeaero.com        

This file is part of CARIBOU RTOS

CARIBOU RTOS is free software: you can redistribute it and/or modify
it under the terms of the Beerware License Version 43.

----------------------------------------------------------------------------
"THE BEER-WARE LICENSE" (Revision 43):
<mike@pikeaero.com> wrote this file. As long as you retain this notice you
can do whatever you want with this stuff. If we meet some day, and you think
this stuff is worth it, you can buy me a beer in return ~ Mike Sharkey
---------------------------------------------------------------------------- 

*/
#include <lcd16x2.h>

#define lcd_delay_ms(_ms)	caribou_thread_sleep_current(from_ms(_ms))

#define lcd_rs_hi()			caribou_gpio_set   (&lcd_rs)
#define lcd_rs_lo()			caribou_gpio_reset (&lcd_rs)

#define lcd_en_hi()			caribou_gpio_set   (&lcd_e)
#define lcd_en_lo()			caribou_gpio_reset (&lcd_e)

#define lcd_rw_hi()			caribou_gpio_set   (&lcd_rw)
#define lcd_rw_lo()			caribou_gpio_reset (&lcd_rw)

#define lcd_light_hi()		caribou_gpio_set   (&lcd_light)
#define lcd_light_lo()		caribou_gpio_reset (&lcd_light)

static void lcd_cmd_write( uint8_t cmd );
static void lcd_dat_write( uint8_t dat );
static void lcd_out_4( uint8_t );
static void lcd_latch();

void lcd_init( void )
{
	lcd_light_hi();
	lcd_rw_lo();
	lcd_delay_ms(15);
 	lcd_cmd_write(0x02);    /*send for initialization of LCD with nibble method */
    lcd_cmd_write(0x28);    /*use 2 line and initialize 5*7 matrix in (4-bit mode)*/
    lcd_cmd_write(0x01);    /*clear display screen*/
    lcd_cmd_write(0x0c);    /*display on cursor off*/
    lcd_cmd_write(0x06);    /*increment cursor (shift cursor to right)*/
    lcd_delay_ms(3);
}

void lcd_clear( void )
{
    lcd_cmd_write(0x01);    /*clear display screen*/
    lcd_delay_ms(3);
}

void lcd_goto( uint8_t x, uint8_t y)
{
	switch(y)
	{
		default:
		case 0:
			/* 1st row and column */
			lcd_cmd_write((0x80) | ((x) & 0x0f));	
			break;
		case 1:
			/* 2nd row and column */
			lcd_cmd_write((0xC0) | ((x) & 0x0f));	
			break;
	}  
}

void lcd_write( uint8_t* data, uint8_t len )
{
	while(len--)
	{
		lcd_dat_write( *data++ );
	}
}

static void lcd_out_4( uint8_t dat )
{
	caribou_gpio_write( &lcd_db4, (dat&0x01) );
	caribou_gpio_write( &lcd_db5, (dat&0x02) );
	caribou_gpio_write( &lcd_db6, (dat&0x04) );
	caribou_gpio_write( &lcd_db7, (dat&0x08) );
}

static void lcd_cmd_write( uint8_t cmd )
{
	lcd_rs_lo();			/* select cmd register */
	lcd_out_4( cmd >> 4 );	/* high nibble first */
	lcd_latch();			/* latch the data */
	lcd_out_4( cmd );		/* low nibble first */
	lcd_latch();			/* latch the data */
	lcd_delay_ms(3);
}

static void lcd_dat_write( uint8_t dat )
{
	lcd_rs_hi();			/* select data register */
	lcd_out_4( dat >> 4 );	/* high nibble first */
	lcd_latch();			/* latch the data */
	lcd_out_4( dat );		/* low nibble first */
	lcd_latch();			/* latch the data */
	lcd_delay_ms(3);
}

static void lcd_latch( void )
{
	lcd_en_hi();
	lcd_en_hi();
	lcd_en_hi();
	lcd_en_hi();
	lcd_en_hi();

	lcd_en_lo();
	lcd_en_lo();
	lcd_en_lo();
	lcd_en_lo();
	lcd_en_lo();
}