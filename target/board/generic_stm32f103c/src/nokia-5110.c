/******************************************************************************
* Copyright © 2013 by Pike Aerospace Research Corporation
* All Rights Reserved
*
*   This file is part of CARIBOU RTOS
*
*   CARIBOU RTOS is free software: you can redistribute it and/or modify
*   it under the terms of the Beerware License Version 43.
*
* ----------------------------------------------------------------------------
* "THE BEER-WARE LICENSE" (Revision 43):
* <mike@pikeaero.com> wrote this file. As long as you retain this notice you
* can do whatever you want with this stuff. If we meet some day, and you think
* this stuff is worth it, you can buy me a beer in return ~ Mike Sharkey
* ----------------------------------------------------------------------------
******************************************************************************/
#include <caribou.h>
#include <caribou/dev/gpio.h>
#include <nokia-5110.h>
#include <spi-dma.h>

static caribou_gpio_t lcd_reset			= CARIBOU_GPIO_INIT(GPIOB,CARIBOU_GPIO_PIN_5);
static caribou_gpio_t lcd_back_light	= CARIBOU_GPIO_INIT(GPIOB,CARIBOU_GPIO_PIN_6);
static caribou_gpio_t lcd_data_control	= CARIBOU_GPIO_INIT(GPIOA,CARIBOU_GPIO_PIN_6); /* LCD Data/~Control */
static caribou_gpio_t lcd_chip_select	= CARIBOU_GPIO_INIT(GPIOA,CARIBOU_GPIO_PIN_4);

typedef struct
{
	uint8_t command_buffer[NOKIA_5110_SEGMENT_BYTES];
	uint8_t display_buffer[NOKIA_5110_DISPLAY_BYTES];
	uint8_t	x;
	uint8_t	y;
} nokia_5110_t;

nokia_5110_t nokia_5110;

/**
 * @brief Place a pixel in pixel X,Y coordinates into the display buffer.
 * @param x The horizontal pixel position.
 * @param y The vertical pixel position.
 * @param pixel The pixel state 1=on, 0=off
 */
bool lcd_put_pixel(uint8_t x, uint8_t y, bool pixel)
{
}

/**
 * @brief Get a pixel from the pixel X,Y coordinates from the display buffer.
 * @param x The horizontal pixel position.
 * @param y The vertical pixel position.
 * @return true if the pixel is on, else false.
 */
bool lcd_get_pixel(uint8_t x, uint8_t y)
{
}

void nokia_5110_reset()
{
	caribou_gpio_reset(&lcd_reset);
	caribou_thread_sleep_current(from_ms(2));
	caribou_gpio_set(&lcd_reset);
}

bool lcd_fill_test_pattern(uint8_t pattern)
{
	memset(&nokia_5110.display_buffer[0],pattern,NOKIA_5110_DISPLAY_BYTES);
}

void nokia_5110_set_initial_state()
{
	caribou_gpio_reset(&lcd_data_control);
	caribou_gpio_reset(&lcd_chip_select);

	SPI_I2S_SendData(SPI_MASTER,PCD8544_NOP);		// Sense D/~C State
	SPI_I2S_SendData(SPI_MASTER,PCD8544_NOP);		// Sense D/~C State

	SPI_I2S_SendData(SPI_MASTER,PCD8544_FSET_H);	// H=1
	SPI_I2S_SendData(SPI_MASTER,PCD8544_VOP4);		// Set LCD Vop(Contrast)
	//SPI_I2S_SendData(SPI_MASTER,PCD8544_TC1);		// Set Temperature Coefficient
	//SPI_I2S_SendData(SPI_MASTER,PCD8544_BS1);		// LCD bias mode 1:48
	SPI_I2S_SendData(SPI_MASTER,PCD8544_FSET);		// H=0
	SPI_I2S_SendData(SPI_MASTER,PCD8544_DISC_D);	// LCD Normal Mode

	caribou_gpio_set(&lcd_chip_select);
	caribou_gpio_set(&lcd_data_control);
}

void nokia_5110_init()
{
	caribou_gpio_set(&lcd_chip_select);
	caribou_gpio_set(&lcd_data_control);

	spi_dma_init(&nokia_5110.display_buffer[0],NOKIA_5110_DISPLAY_BYTES);
	lcd_fill_test_pattern(0x0F);

	//nokia_5110_reset();
	while(1)
	nokia_5110_set_initial_state();

	caribou_gpio_reset(&lcd_chip_select);
	spi_dma_start();
    caribou_gpio_set(&lcd_back_light);
}

void nokia_5110_run(void* arg)
{
    nokia_5110_init();
	for(;;)
	{
		caribou_thread_yield();
	}
}
