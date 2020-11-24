/******************************************************************************
* Copyright © 2005-2013 by Pike Aerospace Research Corporation
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
#include <board.h>
#include <l3gd20.h>
#include <caribou/dev/uart.h>
#include <caribou/dev/gpio.h>
#include <caribou/lib/stdio.h>
#include <stm32f30x_spi.h>
#include <stm32f30x_i2c.h>
#include <stm32f30x_exti.h>
#include <stm32f30x_syscfg.h>

caribou_gpio_t  LED_NW      = CARIBOU_GPIO_INIT(GPIOE,CARIBOU_GPIO_PIN_8);
caribou_gpio_t  LED_N       = CARIBOU_GPIO_INIT(GPIOE,CARIBOU_GPIO_PIN_9);
caribou_gpio_t  LED_NE      = CARIBOU_GPIO_INIT(GPIOE,CARIBOU_GPIO_PIN_10);
caribou_gpio_t  LED_E       = CARIBOU_GPIO_INIT(GPIOE,CARIBOU_GPIO_PIN_11);
caribou_gpio_t  LED_SE      = CARIBOU_GPIO_INIT(GPIOE,CARIBOU_GPIO_PIN_12);
caribou_gpio_t  LED_S       = CARIBOU_GPIO_INIT(GPIOE,CARIBOU_GPIO_PIN_13);
caribou_gpio_t  LED_SW      = CARIBOU_GPIO_INIT(GPIOE,CARIBOU_GPIO_PIN_14);
caribou_gpio_t  LED_W       = CARIBOU_GPIO_INIT(GPIOE,CARIBOU_GPIO_PIN_15);
caribou_gpio_t	USER_BUTTON	= CARIBOU_GPIO_INIT(GPIOA,CARIBOU_GPIO_PIN_0);
caribou_gpio_t  MEMS_CS     = CARIBOU_GPIO_INIT(GPIOE,CARIBOU_GPIO_PIN_3);

/**
 * @brief Early initialization before heap and global initializations.
 */
void early_init()
{
	RCC_ClocksTypeDef SYS_Clocks;
	/* Enable HSE */   
	RCC_HSEConfig(RCC_HSE_ON);
	/* Wait till HSE is ready and if Time out is reached exit */
	while(RCC_WaitForHSEStartUp()!=SUCCESS);
	RCC_SYSCLKConfig(RCC_SYSCLKSource_HSE);
	//RCC_GetClocksFreq(&SYS_Clocks);

	SystemInit();
	SystemCoreClockUpdate();
	RCC_GetClocksFreq(&SYS_Clocks);

	/* Enable Peripheral Clocks... */
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_SYSCFG, ENABLE);

	/* Enable Peripheral Clocks... */
	RCC_AHBPeriphClockCmd(RCC_AHBPeriph_GPIOA,ENABLE);
	RCC_AHBPeriphClockCmd(RCC_AHBPeriph_GPIOB,ENABLE);
	RCC_AHBPeriphClockCmd(RCC_AHBPeriph_GPIOC,ENABLE);
	RCC_AHBPeriphClockCmd(RCC_AHBPeriph_GPIOD,ENABLE);
	RCC_AHBPeriphClockCmd(RCC_AHBPeriph_GPIOE,ENABLE);
	RCC_AHBPeriphClockCmd(RCC_AHBPeriph_GPIOF,ENABLE);
	
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_SPI1,ENABLE);

    RCC_APB1PeriphClockCmd(RCC_APB1Periph_I2C1,ENABLE);
    RCC_APB1PeriphClockCmd(RCC_APB1Periph_USART2,ENABLE);

	//RCC_APB2PeriphClockCmd(RCC_APB2Periph_USART1,ENABLE);
	//RCC_APB1PeriphClockCmd(RCC_APB1Periph_USART2,ENABLE);
	//RCC_APB1PeriphClockCmd(RCC_APB1Periph_USART3,ENABLE);
	//RCC_APB1PeriphClockCmd(RCC_APB1Periph_UART4,ENABLE);
	//RCC_APB1PeriphClockCmd(RCC_APB1Periph_UART5,ENABLE);
	//RCC_APB2PeriphClockCmd(RCC_APB2Periph_USART6,ENABLE);

	/* PORT A */
	GPIOA->MODER = CARIBOU_PORTA_MODE;
	GPIOA->OTYPER = CARIBOU_PORTA_OTYPER;
	GPIOA->OSPEEDR = CARIBOU_PORTA_OSPEEDR;
	GPIOA->PUPDR = CARIBOU_PORTA_PUPDR;
	GPIOA->AFR[0] = CARIBOU_PORTA_AFRL;
	GPIOA->AFR[1] = CARIBOU_PORTA_AFRH;
	/* POST B */
	GPIOB->MODER = CARIBOU_PORTB_MODE;
	GPIOB->OTYPER = CARIBOU_PORTB_OTYPER;
	GPIOB->OSPEEDR = CARIBOU_PORTB_OSPEEDR;
	GPIOB->PUPDR = CARIBOU_PORTB_PUPDR;
	GPIOB->AFR[0] = CARIBOU_PORTB_AFRL;
	GPIOB->AFR[1] = CARIBOU_PORTB_AFRH;
	/* POST C */
	GPIOC->MODER = CARIBOU_PORTC_MODE;
	GPIOC->OTYPER = CARIBOU_PORTC_OTYPER;
	GPIOC->OSPEEDR = CARIBOU_PORTC_OSPEEDR;
	GPIOC->PUPDR = CARIBOU_PORTC_PUPDR;
	GPIOC->AFR[0] = CARIBOU_PORTC_AFRL;
	GPIOC->AFR[1] = CARIBOU_PORTC_AFRH;
	/* POST D */
	GPIOD->MODER = CARIBOU_PORTD_MODE;
	GPIOD->OTYPER = CARIBOU_PORTD_OTYPER;
	GPIOD->OSPEEDR = CARIBOU_PORTD_OSPEEDR;
	GPIOD->PUPDR = CARIBOU_PORTD_PUPDR;
	GPIOD->AFR[0] = CARIBOU_PORTD_AFRL;
	GPIOD->AFR[1] = CARIBOU_PORTD_AFRH;
	/* POST E */
	GPIOE->MODER = CARIBOU_PORTE_MODE;
	GPIOE->OTYPER = CARIBOU_PORTE_OTYPER;
	GPIOE->OSPEEDR = CARIBOU_PORTE_OSPEEDR;
	GPIOE->PUPDR = CARIBOU_PORTE_PUPDR;
	GPIOE->AFR[0] = CARIBOU_PORTE_AFRL;
	GPIOE->AFR[1] = CARIBOU_PORTE_AFRH;
	/* POST F */
	GPIOF->MODER = CARIBOU_PORTF_MODE;
	GPIOF->OTYPER = CARIBOU_PORTF_OTYPER;
	GPIOF->OSPEEDR = CARIBOU_PORTF_OSPEEDR;
	GPIOF->PUPDR = CARIBOU_PORTF_PUPDR;
	GPIOF->AFR[0] = CARIBOU_PORTF_AFRL;
	GPIOF->AFR[1] = CARIBOU_PORTF_AFRH;

    caribou_gpio_set(&MEMS_CS);

    caribou_gpio_reset(&LED_N);
    caribou_gpio_reset(&LED_NE);
    caribou_gpio_reset(&LED_E);
    caribou_gpio_reset(&LED_SE);
    caribou_gpio_reset(&LED_S);
    caribou_gpio_reset(&LED_SW);
    caribou_gpio_reset(&LED_W);
    caribou_gpio_reset(&LED_NW);
}

void InitializeSPI()
{
    SPI_InitTypeDef init;

    SPI_StructInit(&init);
    init.SPI_Mode = SPI_Mode_Master;
    init.SPI_NSS = SPI_NSS_Soft;
    init.SPI_BaudRatePrescaler = SPI_BaudRatePrescaler_8; /* 8 MHz */
    SPI_Init(SPI1,&init);
    SPI_Cmd(SPI1,ENABLE);
}

void InitializeI2C()
{
    I2C_InitTypeDef init;

    I2C_StructInit(&init);
    I2C_Init(I2C1,&init);
    I2C_Cmd(I2C1,ENABLE);
}

/**
 * @brief Late initialization after heap and global initializations.
 */
void late_init()
{
	/**
	 * Open the standard I/O.
	 */
	 caribou_uart_config_t config;
	_stdout = _stdin = _stderr = fopen(CONSOLE_USART,"rw");
	caribou_uart_init_config(&config);
	config.baud_rate	= CARIBOU_UART_BAUD_RATE_9600;
	config.word_size	= CARIBOU_UART_WORDSIZE_8;
	config.stop_bits	= CARIBOU_UART_STOPBITS_1;
	config.parity_bits	= CARIBOU_UART_PARITY_NONE;
	config.flow_control	= /* CARIBOU_UART_FLOW_NONE */ CARIBOU_UART_FLOW_RTS_CTS;
	caribou_uart_set_config(CONSOLE_USART,&config);

    InitializeSPI();
    InitializeI2C();

}

/**
 * @brief Main thread idle time.
 */
void board_idle()
{
    static caribou_tick_t start = 0;
    uint8_t seq=rand();
    if ( caribou_timer_ticks_timeout(start,40) )
    {
        caribou_gpio_reset(&LED_N);
        caribou_gpio_reset(&LED_NE);
        caribou_gpio_reset(&LED_E);
        caribou_gpio_reset(&LED_SE);
        caribou_gpio_reset(&LED_S);
        caribou_gpio_reset(&LED_SW);
        caribou_gpio_reset(&LED_W);
        caribou_gpio_reset(&LED_NW);
        switch((seq)&0x07)
        {
            case 0: caribou_gpio_set(&LED_N);   break;
            case 1: caribou_gpio_set(&LED_NE);  break;
            case 2: caribou_gpio_set(&LED_E);   break;
            case 3: caribou_gpio_set(&LED_SE);  break;
            case 4: caribou_gpio_set(&LED_S);   break;
            case 5: caribou_gpio_set(&LED_SW);  break;
            case 6: caribou_gpio_set(&LED_W);   break;
            case 7: caribou_gpio_set(&LED_NW);  break;
        }
        start = caribou_timer_ticks();
    }
}

void board_thread(void* arg)
{
    static caribou_tick_t start = 0;
	static L3GD20_t io;
	io.SPIx = MEMS_SPI;
	io.CS = &MEMS_CS;
    L3GD20Init(&io);
	printf("WHO_AM_I=0x%02X\n",L3GD20WhoAmI(&io));
    for(;;)
    {
        if ( caribou_timer_ticks_timeout(start,1000) )
        {
            uint16_t gyroX;
            uint16_t gyroY;
            uint16_t gyroZ;
            L3GD20ReadGyro(&io,&gyroX,&gyroY,&gyroZ);
            printf("%d,%d,%d\n",gyroX,gyroY,gyroZ);
            start = caribou_timer_ticks();
        }
        caribou_thread_yield();
    }
}

