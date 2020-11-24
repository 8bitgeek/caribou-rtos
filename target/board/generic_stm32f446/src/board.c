/*
   _________    ____  ________  ____  __  __   ____  __________  _____
  / ____/   |  / __ \/  _/ __ )/ __ \/ / / /  / __ \/_  __/ __ \/ ___/
 / /   / /| | / /_/ // // __  / / / / / / /  / /_/ / / / / / / /\__ \ 
/ /___/ ___ |/ _, _// // /_/ / /_/ / /_/ /  / _, _/ / / / /_/ /___/ / 
\____/_/  |_/_/ |_/___/_____/\____/\____/  /_/ |_| /_/  \____//____/  
                                                                      

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
+#include <board.h>
#include <stm32f4xx_exti.h>
#include <stm32f4xx_syscfg.h>

caribou_gpio_t	LED1			= CARIBOU_GPIO_INIT(GPIOB,CARIBOU_GPIO_PIN_0);
caribou_gpio_t	LED2			= CARIBOU_GPIO_INIT(GPIOB,CARIBOU_GPIO_PIN_1);
caribou_gpio_t	MODBUS_DIR		= CARIBOU_GPIO_INIT(GPIOF,CARIBOU_GPIO_PIN_6);
caribou_gpio_t	NAVSW_Y1		= CARIBOU_GPIO_INIT(GPIOF,CARIBOU_GPIO_PIN_7);
caribou_gpio_t	NAVSW_Y2		= CARIBOU_GPIO_INIT(GPIOF,CARIBOU_GPIO_PIN_8);
caribou_gpio_t	NAVSW_Y0		= CARIBOU_GPIO_INIT(GPIOF,CARIBOU_GPIO_PIN_12);
caribou_gpio_t	DIAG_JUMPER		= CARIBOU_GPIO_INIT(GPIOE,CARIBOU_GPIO_PIN_8);
caribou_gpio_t	RUN_PROG_SWITCH	= CARIBOU_GPIO_INIT(GPIOE,CARIBOU_GPIO_PIN_7);

void early_init()
{
	RCC_ClocksTypeDef SYS_Clocks;
	/* Enable HSE */   
	RCC_HSEConfig(RCC_HSE_ON);
	/* Wait till HSE is ready and if Time out is reached exit */
	while(RCC_WaitForHSEStartUp()!=SUCCESS);
	RCC_SYSCLKConfig(RCC_SYSCLKSource_HSE);
	RCC_GetClocksFreq(&SYS_Clocks);

	SystemInit();
	SystemCoreClockUpdate();
	RCC_GetClocksFreq(&SYS_Clocks);

	/* Enable Peripheral Clocks... */
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_SYSCFG, ENABLE);

	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOA,ENABLE);
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOB,ENABLE);
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOC,ENABLE);
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOD,ENABLE);
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOE,ENABLE);
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOF,ENABLE);
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOG,ENABLE);
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOH,ENABLE);
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOI,ENABLE);
	
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_USART1,ENABLE);
	RCC_APB1PeriphClockCmd(RCC_APB1Periph_USART2,ENABLE);
	RCC_APB1PeriphClockCmd(RCC_APB1Periph_USART3,ENABLE);

	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_DMA1,ENABLE);
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_DMA2,ENABLE);
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_CRC,ENABLE);

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
	/* POST G */
	GPIOG->MODER = CARIBOU_PORTG_MODE;
	GPIOG->OTYPER = CARIBOU_PORTG_OTYPER;
	GPIOG->OSPEEDR = CARIBOU_PORTG_OSPEEDR;
	GPIOG->PUPDR = CARIBOU_PORTG_PUPDR;
	GPIOG->AFR[0] = CARIBOU_PORTG_AFRL;
	GPIOG->AFR[1] = CARIBOU_PORTG_AFRH;
	/* POST H */
	GPIOH->MODER = CARIBOU_PORTH_MODE;
	GPIOH->OTYPER = CARIBOU_PORTH_OTYPER;
	GPIOH->OSPEEDR = CARIBOU_PORTH_OSPEEDR;
	GPIOH->PUPDR = CARIBOU_PORTH_PUPDR;
	GPIOH->AFR[0] = CARIBOU_PORTH_AFRL;
	GPIOH->AFR[1] = CARIBOU_PORTH_AFRH;
	/* POST I */
	GPIOI->MODER = CARIBOU_PORTI_MODE;
	GPIOI->OTYPER = CARIBOU_PORTI_OTYPER;
	GPIOI->OSPEEDR = CARIBOU_PORTI_OSPEEDR;
	GPIOI->PUPDR = CARIBOU_PORTI_PUPDR;
	GPIOI->AFR[0] = CARIBOU_PORTI_AFRL;
	GPIOI->AFR[1] = CARIBOU_PORTI_AFRH;
}

void late_init()
{
	_stdout = _stdin = _stderr = fopen(CONSOLE_USART,"rw"); // USART3 is stdio
    caribou_gpio_reset(&LED1);
}

void board_idle()
{
	static uint64_t last0 =0L;
	static uint64_t last1 =0L;
	if ( (caribou_timer_ticks() - last0) > 64 )
	{
		caribou_gpio_toggle(&LED1);
		last0 = caribou_timer_ticks();
	}
	if ( (caribou_timer_ticks() - last1) > 500 )
	{
		caribou_gpio_toggle(&LED2);
		last1 = caribou_timer_ticks();
	}
	//caribou_wfi();
}