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
#ifndef _PIKEAERO_LCD16X2_H_
#define _PIKEAERO_LCD16X2_H_

#include <caribou.h>
#include <caribou/dev/gpio.h>

#ifdef __cplusplus
extern "C"
{
#endif

#define lcd_rs 		gpio_lcd_rs
#define lcd_rw 		gpio_lcd_rw
#define lcd_e 		gpio_lcd_e
#define lcd_db4 	gpio_lcd_db4
#define lcd_db5 	gpio_lcd_db5
#define lcd_db6 	gpio_lcd_db6
#define lcd_db7 	gpio_lcd_db7
#define lcd_light	gpio_lcd_light

void lcd_init	( void );
void lcd_clear 	( void );
void lcd_goto  	( uint8_t x, uint8_t y);
void lcd_write 	( uint8_t* data, uint8_t len );

#ifdef __cplusplus
}
#endif

#endif

