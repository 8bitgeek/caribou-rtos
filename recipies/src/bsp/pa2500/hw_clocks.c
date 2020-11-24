#include <hw_clocks.h>

// static bool mcu_clock_setup_extern( void );
static void mcu_clock_setup( void );
static void peripheral_clock_setup( void );


extern void hw_clocks_setup( void )
{
	// if ( !mcu_clock_setup_extern() )
	// {
		mcu_clock_setup();
	// }
	peripheral_clock_setup();
}

static bool mcu_clock_setup_extern( void )
{
	volatile uint32_t timeout;

	/* Enable External 8 MHz Oscillator */
	RCC->CR |= RCC_CR_HSEON;
	for( timeout=10000; timeout > 0 && !(RCC->CR & RCC_CR_HSERDY); timeout-- );
	if ( timeout > 0 )
	{
		/* SYSCLK is 8MHz HSE */
		RCC->CFGR = RCC_CFGR_SW_1 | RCC_CFGR_STOPWUCK;

		/* Configure the PLL */
		RCC->PLLCFGR &= ~RCC_PLLCFGR_PLLSRC_Msk;
		RCC->PLLCFGR |= RCC_PLLCFGR_PLLSRC_HSE;						/* Select 8MHz HSE Clk Src */

		RCC->PLLCFGR &= ~RCC_PLLCFGR_PLLN_Msk;
		RCC->PLLCFGR |= (40 << RCC_PLLCFGR_PLLN_Pos);				/* 8MHz * 40 = 320MHz */

		RCC->PLLCFGR &= ~RCC_PLLCFGR_PLLM_Msk;		
		RCC->PLLCFGR |= ((2-1) << RCC_PLLCFGR_PLLM_Pos);			/* 320MHz / 2 = 160MHz */ 

		RCC->PLLCFGR &= ~(RCC_PLLCFGR_PLLR_1|RCC_PLLCFGR_PLLR_0);	/* 160MHz / 2 = 80MHz */
		
		RCC->PLLCFGR |= RCC_PLLCFGR_PLLREN;							/* Enable PLLCLK (/R) Output */

		/* Start the PLL */
		RCC->CR |= RCC_CR_PLLON;									/* Start PLL */
		while( !(RCC->CR & RCC_CR_PLLRDY) );						/* Wait for PLL Ready */

		/* Configure FLASH Wait States */
		FLASH->ACR |= FLASH_ACR_LATENCY_4WS;

		/* Select PLL as clock source */
		RCC->CFGR |= RCC_CFGR_SW_PLL;
		while((RCC->CFGR & RCC_CFGR_SWS)!=RCC_CFGR_SWS_PLL);

		/* Put UART1 on SYSCLK Clock */
	   	RCC->CCIPR &= ~RCC_CCIPR_USART1SEL_Msk;
	   	RCC->CCIPR |= RCC_CCIPR_USART1SEL_0;

	   	SystemCoreClockUpdate();
	   	return true;
	}
	return false;
}


static void mcu_clock_setup( void )
{
    /* Enable Internal 16 MHz Oscillator */
    RCC->CR |= RCC_CR_HSION | RCC_CR_HSIKERON;
    while ( !(RCC->CR & RCC_CR_HSIRDY) );

    /* SYSCLK is 16MHz HSI */
    RCC->CFGR = RCC_CFGR_SW_0 | RCC_CFGR_STOPWUCK;

    /* Configure the PLL */
    RCC->PLLCFGR |= RCC_PLLCFGR_PLLSRC_HSI;                     /* Select 16MHz HSI Clk Src */
    RCC->PLLCFGR |= (20 << RCC_PLLCFGR_PLLN_Pos);               /* 16MHz * 20 = 320MHz */
    RCC->PLLCFGR |= ((2-1) << RCC_PLLCFGR_PLLM_Pos);            /* 320MHz / 2 = 160MHz */
    RCC->PLLCFGR &= ~(RCC_PLLCFGR_PLLR_1|RCC_PLLCFGR_PLLR_0);   /* 160MHz / 2 = 80MHz */
    RCC->PLLCFGR |= RCC_PLLCFGR_PLLREN;                         /* Enable PLLCLK (/R) Output */

    /* Start the PLL */
    RCC->CR |= RCC_CR_PLLON;                                    /* Start PLL */
    while( !(RCC->CR & RCC_CR_PLLRDY) );                        /* Wait for PLL Ready */

    /* Configure FLASH Wait States */
    FLASH->ACR |= FLASH_ACR_LATENCY_4WS;

    /* Select PLL as clock source */
    RCC->CFGR |= RCC_CFGR_SW_PLL;
    while((RCC->CFGR & RCC_CFGR_SWS)!=RCC_CFGR_SWS_PLL);

    /* Put UART1 on HSI16 Clock */
    RCC->CCIPR &= ~RCC_CCIPR_USART1SEL_Msk;
    RCC->CCIPR |= RCC_CCIPR_USART1SEL_1;

    SystemCoreClockUpdate();
}

static void peripheral_clock_setup( void )
{
	
	RCC->CCIPR |= 	(
						RCC_CCIPR_ADCSEL_1 | RCC_CCIPR_ADCSEL_0
					);



	RCC->AHB1ENR |= (
						RCC_AHB1ENR_DMA1EN		|
                        RCC_AHB1ENR_DMA2EN		|
                        RCC_AHB1ENR_CRCEN
					);

	RCC->AHB2ENR |= ( 
						RCC_AHB2ENR_GPIOAEN		|
                        RCC_AHB2ENR_GPIOBEN		|
                        RCC_AHB2ENR_GPIOCEN		|
                        RCC_AHB2ENR_GPIOHEN		|
                        RCC_AHB2ENR_ADCEN
					);

	RCC->APB1ENR1 |=(
						RCC_APB1ENR1_WWDGEN		|
						RCC_APB1ENR1_CAN1EN		|
						RCC_APB1ENR1_SPI2EN		|
						RCC_APB1ENR1_TIM2EN		|
						RCC_APB1ENR1_LPTIM1EN	|
	                    RCC_APB1ENR1_USART2EN   |
					    RCC_APB1ENR1_USART3EN
					);

	RCC->APB1ENR2 |=(
						RCC_APB1ENR2_LPTIM2EN
					);

	RCC->APB2ENR |= (
						RCC_APB2ENR_SYSCFGEN	|
                        RCC_APB2ENR_USART1EN	|
                        RCC_APB2ENR_SPI1EN		|
                        RCC_APB2ENR_TIM1EN		|
                        RCC_APB2ENR_TIM15EN		|
                        RCC_APB2ENR_TIM16EN
					);
}
