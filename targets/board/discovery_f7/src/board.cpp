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
#include <stm32f7xx.h>
#include <stm32f746xx.h>
#include <stm32f7xx_hal.h>
#include <stm32f7xx_hal_rcc.h>
#include <stm32f7xx_hal_eth.h>
#include <stm32f7xx_hal_gpio.h>
#include <stm32f7xx_hal_dma.h>
#include <stm32f7xx_hal_pwr.h>
#include <stm32f7xx_hal_tim.h>
#include <stm32f7xx_hal_flash_ex.h>
#include <stm32f7xx_conf.h>
#include <lwip/err.h>
#include <caribou++/cdatetime.h>
#include <caribou++/cfile.h>
#include <netif/ethernetif.h>
#include <caribou++/cmutex.h>

caribou_gpio_t led1	= CARIBOU_GPIO_INIT(GPIOH,CARIBOU_GPIO_PIN_2);
caribou_gpio_t led2	= CARIBOU_GPIO_INIT(GPIOH,CARIBOU_GPIO_PIN_3);
caribou_gpio_t led3	= CARIBOU_GPIO_INIT(GPIOI,CARIBOU_GPIO_PIN_8);
caribou_gpio_t led4	= CARIBOU_GPIO_INIT(GPIOI,CARIBOU_GPIO_PIN_10);
caribou_gpio_t mmc_cs = CARIBOU_GPIO_INIT(GPIOA,CARIBOU_GPIO_PIN_4);

volatile network_interface_t network_interface;

extern void isr_phy_eth0(InterruptVector vector, void* arg);
extern void isr_eth0(InterruptVector vector, void* arg);

/// translate a lwip err to an errno
int lwip_errno(int err)
{
	int rc=0;
	switch(err)
	{
		case ERR_MEM:			rc=ENOMEM;			break;	/* Out of memory error.     */
		case ERR_BUF:			rc=ENOSR;			break;	/* Buffer error.            */
		case ERR_TIMEOUT:		rc=ETIME;			break;	/* Timeout.                 */
		case ERR_RTE:			rc=EHOSTUNREACH;	break;	/* Routing problem.         */
		case ERR_INPROGRESS:	rc=EINPROGRESS;		break;	/* Operation in progress    */
		case ERR_VAL:			rc=EINVAL;			break;	/* Illegal value.           */
		case ERR_WOULDBLOCK:	rc=EAGAIN;			break;	/* Operation would block.   */
		case ERR_USE:			rc=EADDRINUSE;		break;	/* Address in use.          */
		case ERR_ISCONN:		rc=EISCONN;			break;	/* Already connected.       */
		case ERR_ABRT:			rc=ECONNABORTED;	break;	/* Connection aborted.      */
		case ERR_RST:			rc=ENETRESET;		break;	/* Connection reset.        */
		case ERR_CLSD:			rc=ENOTCONN;		break;	/* Connection closed.       */
		case ERR_CONN:			rc=ENOTCONN;		break;	/* Not connected.           */
		case ERR_ARG:			rc=EINVAL;			break;	/* Illegal argument.        */
		case ERR_IF:			rc=EIO;				break;	/* Low-level netif error    */
		default:				rc=err;				break;
	}
	return rc;
}

void SystemClock_Config(void)
{
	RCC_ClkInitTypeDef RCC_ClkInitStruct;
	RCC_OscInitTypeDef RCC_OscInitStruct;
	HAL_StatusTypeDef ret = HAL_OK;

	/* Enable HSE Oscillator and activate PLL with HSE as source */
	RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSE;
	RCC_OscInitStruct.HSEState = RCC_HSE_ON;
	RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
	RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSE;
	RCC_OscInitStruct.PLL.PLLM = 25;
	RCC_OscInitStruct.PLL.PLLN = 432;
	RCC_OscInitStruct.PLL.PLLP = RCC_PLLP_DIV2;
	RCC_OscInitStruct.PLL.PLLQ = 9;

	if ( HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK )
		for(;;);

	/* Activate the OverDrive to reach the 216 MHz Frequency */
	/* Do not use with MCO=25/50MHZ */
	//if ( HAL_PWREx_EnableOverDrive() != HAL_OK )
	//	for(;;);

	/* Select PLL as system clock source and configure the HCLK, PCLK1 and PCLK2 clocks dividers */
	RCC_ClkInitStruct.ClockType = (RCC_CLOCKTYPE_SYSCLK | RCC_CLOCKTYPE_HCLK | RCC_CLOCKTYPE_PCLK1 | RCC_CLOCKTYPE_PCLK2);
	RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
	RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
	RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV4;
	RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV2;

	if ( HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_7) != HAL_OK )
		for(;;);

	//RCC->DCKCFGR1 |= RCC_DCKCFGR1_TIMPRE;	/* Enable PPB Bus Prescalers */
}

void early_init()
{
	SystemClock_Config();
	HAL_Init();

	/* Enable Peripheral Clocks... */
	RCC->APB2ENR |= RCC_APB2ENR_SYSCFGEN;

	/* Enable ETHERNET clock  */
	RCC->AHB1ENR |= (	RCC_AHB1ENR_ETHMACEN	| 
						RCC_AHB1ENR_ETHMACRXEN	| 
						RCC_AHB1ENR_ETHMACTXEN	);

	/* Reset the Ethernet hardware */
	RCC->AHB1RSTR |= RCC_AHB1RSTR_ETHMACRST;	
	RCC->AHB1RSTR &= ~RCC_AHB1RSTR_ETHMACRST;

	/* Configure MII or RMII mode and MCO output */
	#if defined(MII_MODE)
		#if defined(PHY_CLOCK_MCO)
			/* Output HSE clock (25MHz) on MCO1 to clock the PHY */
			RCC->CFGR |= (RCC_MCO1SOURCE_HSE | RCC_MCODIV_1);
		#endif
		SYSCFG->PMC &= ~SYSCFG_PMC_MII_RMII_SEL;
	#elif defined(RMII_MODE)
		/* Output HSI (25MHz) on MCO pin to clock the PHY */
		RCC->CFGR |= (RCC_MCO1SOURCE_HSE | RCC_MCODIV_1);
		SYSCFG->PMC |= SYSCFG_PMC_MII_RMII_SEL;
	#endif

	RCC->AHB1ENR |= (	RCC_AHB1ENR_CRCEN		|
						RCC_AHB1ENR_DMA1EN		|
						RCC_AHB1ENR_DMA2EN		|
						RCC_AHB1ENR_DTCMRAMEN	|
						RCC_AHB1ENR_GPIOAEN		|
						RCC_AHB1ENR_GPIOBEN		|
						RCC_AHB1ENR_GPIOCEN		|
						RCC_AHB1ENR_GPIODEN		|
						RCC_AHB1ENR_GPIOEEN		|
						RCC_AHB1ENR_GPIOFEN		|
						RCC_AHB1ENR_GPIOGEN		|
						RCC_AHB1ENR_GPIOHEN		|
						RCC_AHB1ENR_GPIOIEN		|
						RCC_AHB1ENR_GPIOJEN		);
	
	RCC->AHB2ENR |= (	RCC_AHB2ENR_RNGEN		);

	RCC->APB1ENR |= (	RCC_APB1ENR_TIM2EN		|
						RCC_APB1ENR_USART2EN	|
						RCC_APB1ENR_USART3EN	|
						RCC_APB1ENR_UART7EN		|
						RCC_APB1ENR_SPI2EN		);

	RCC->APB2ENR |= (	RCC_APB2ENR_ADC1EN		|
						RCC_APB2ENR_SPI1EN		|
						RCC_APB2ENR_SYSCFGEN	|
						RCC_APB2ENR_USART1EN	|
                        RCC_APB2ENR_USART6EN	|
						RCC_APB2ENR_TIM1EN		);

	RCC->AHB3ENR |= (	RCC_AHB3ENR_FMCEN		);

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
	/* POST J */
	GPIOJ->MODER = CARIBOU_PORTJ_MODE;
	GPIOJ->OTYPER = CARIBOU_PORTJ_OTYPER;
	GPIOJ->OSPEEDR = CARIBOU_PORTJ_OSPEEDR;
	GPIOJ->PUPDR = CARIBOU_PORTJ_PUPDR;
	GPIOJ->AFR[0] = CARIBOU_PORTJ_AFRL;
	GPIOJ->AFR[1] = CARIBOU_PORTJ_AFRH;

    caribou_gpio_set(&gpio_mmc_cs);
    caribou_gpio_set(&gpio_led1);
    caribou_gpio_set(&gpio_led2);
    caribou_gpio_set(&gpio_led3);
    caribou_gpio_set(&gpio_led4);
	caribou_gpio_reset(&gpio_buzzer);

	/** Cortex M7 Disable D and I cache */
	#if CARIBOU_PROCESSOR_CACHE_ENABLE
		SCB_InvalidateICache();
		SCB_EnableICache();
		SCB_InvalidateDCache();
		SCB_EnableDCache();
	#endif

	SCB->SHCSR |= SCB_SHCSR_USGFAULTENA_Msk;	/* Enable Usage Fault */
	SCB->SHCSR |= SCB_SHCSR_BUSFAULTENA_Msk;	/* Enable Bus Fault */
	SCB->SHCSR |= SCB_SHCSR_MEMFAULTENA_Msk;	/* Enable Memory Fault */

	SCB->CCR |= SCB_CCR_DIV_0_TRP_Msk;			/* Trap Divide by Zero */
	/* SCB->CCR |= SCB_CCR_UNALIGN_TRP_Msk;	*/	/* FIXME - Trap unaligned data access */
    //SCB->CCR |= SCB_CCR_NONBASETHRDENA_Msk;		/* Processor can enter Thread mode from any level under control of EXC_RETURN */

    __DSB();
    __ISB();

}


static void InitializeRNG()
{
	RNG->CR = RNG_CR_RNGEN;						/* Enable RNG */
}

void late_init()
{
	caribou_uart_config_t	uart_config;

	caribou_init_clock();								/* we need jiffies for this */
	caribou_interrupts_enable();

	InitializeRNG();
	SDRAM_Init();										/** External SDRAM... */
	heap_init((void*)SDRAM_HEAP_BASE,(void*)SDRAM_HEAP_END);

	caribou_gpio_reset(&gpio_modbus_dir);

	/* Console UART */
	caribou_uart_init_config(&uart_config);
	_stderr =_stdout = _stdin = fopen(CONSOLE_USART,"rw");
	uart_config.baud_rate = CARIBOU_UART_BAUD_RATE_115200;
	caribou_uart_set_config(CONSOLE_USART,&uart_config);
}

