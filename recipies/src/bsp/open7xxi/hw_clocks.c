#include <hw_clocks.h>

static bool mcu_clock_setup_extern( void );
static void mcu_clock_setup( void );
static void peripheral_clock_setup( void );


extern void hw_clocks_setup( void )
{
	if ( !mcu_clock_setup_extern() )
	{
		mcu_clock_setup();
	}

    /* Start the PLL */
    RCC->CR |= RCC_CR_PLLON;									/* Start PLL */
    while( !(RCC->CR & RCC_CR_PLLRDY) );						/* Wait for PLL Ready */

    /* Configure FLASH Wait States */
    FLASH->ACR |= FLASH_ACR_LATENCY_4WS;

    /* Select PLL as clock source */
    RCC->CFGR |= RCC_CFGR_SW_PLL | RCC_CFGR_HPRE_DIV1 | RCC_CFGR_PPRE1_DIV4 | RCC_CFGR_PPRE2_DIV2;
    while((RCC->CFGR & RCC_CFGR_SWS)!=RCC_CFGR_SWS_PLL);

    /* Put UART1 on SYSCLK Clock */
    RCC->DCKCFGR2 |= RCC_DCKCFGR2_USART1SEL_0;
    RCC->DCKCFGR2 |= RCC_DCKCFGR2_USART2SEL_0;
    RCC->DCKCFGR2 |= RCC_DCKCFGR2_USART3SEL_0;
    RCC->DCKCFGR2 |= RCC_DCKCFGR2_UART4SEL_0;
    RCC->DCKCFGR2 |= RCC_DCKCFGR2_UART5SEL_0;
    RCC->DCKCFGR2 |= RCC_DCKCFGR2_USART6SEL_0;
    RCC->DCKCFGR2 |= RCC_DCKCFGR2_UART7SEL_0;
    RCC->DCKCFGR2 |= RCC_DCKCFGR2_UART8SEL_0;

    SystemCoreClockUpdate();

	peripheral_clock_setup();
}

static bool mcu_clock_setup_extern( void )
{
	volatile uint32_t timeout;

	/* Enable External 8 MHz Oscillator */
	RCC->CR |= RCC_CR_HSEON;
	for( timeout=20000; timeout > 0 && !(RCC->CR & RCC_CR_HSERDY); timeout-- );
	if ( timeout > 0 )
	{
		/* SYSCLK is HSI */
		RCC->CFGR &= ~RCC_CFGR_SW;

		/* Configure the PLL */
		RCC->PLLCFGR &= ~RCC_PLLCFGR_PLLSRC;
		RCC->PLLCFGR |= RCC_PLLCFGR_PLLSRC_HSE;						/* Select 8MHz HSE Clk Src */

		/* 
		 	PLLM[5:0]: Division factor for the main PLLs (PLL, PLLI2S and PLLSAI) input clock
			Set and cleared by software to divide the PLL and PLLI2S input clock before the VCO.
			These bits can be written only when the PLL and PLLI2S are disabled.
			Caution: The software has to set these bits correctly to ensure that the VCO input frequency
			ranges from 1 to 2 MHz. It is recommended to select a frequency of 2 MHz to limit
			PLL jitter.
			VCO input frequency = PLL input clock frequency / PLLM with 2 ≤ PLLM ≤ 63
			000000: PLLM = 0, wrong configuration
			000001: PLLM = 1, wrong configuration
			000010: PLLM = 2
			000011: PLLM = 3
			000100: PLLM = 4
			...
			111110: PLLM = 62
			111111: PLLM = 63
		*/
		RCC->PLLCFGR &= ~RCC_PLLCFGR_PLLM;		
		RCC->PLLCFGR |= 4;						/* 8MHz / 4 = 2MHz */

		/* 
		 	PLLN[8:0]: Main PLL (PLL) multiplication factor for VCO
			Set and cleared by software to control the multiplication factor of the VCO. These bits can
			be written only when PLL is disabled. Only half-word and word accesses are allowed to
			write these bits.
			Caution: The software has to set these bits correctly to ensure that the VCO output
			frequency is between 100 and 432 MHz.
			VCO output frequency = VCO input frequency × PLLN with 50 ≤ PLLN ≤ 432
			000000000: PLLN = 0, wrong configuration
			000000001: PLLN = 1, wrong configuration
			...
			000110010: PLLN = 50
			...
			001100011: PLLN = 99
			001100100: PLLN = 100
			...
			110110000: PLLN = 432
			110110001: PLLN = 433, wrong configuration
			...
			111111111: PLLN = 511, wrong configuration
			Note: Between 50 and 99, multiplication factors are possible for VCO input frequency higher
			than 1 MHz. However care must be taken to fulfill the minimum VCO output frequency
			as specified above.
		*/
		RCC->PLLCFGR &= ~RCC_PLLCFGR_PLLN;
		RCC->PLLCFGR |= (216 << 6);				/* 2MHz * 216 = 432MHz */

		/*
			PLLP[1:0]: Main PLL (PLL) division factor for main system clock
			Set and cleared by software to control the frequency of the general PLL output clock. These
			bits can be written only if PLL is disabled.
			Caution: The software has to set these bits correctly not to exceed 216 MHz on this domain.
			PLL output clock frequency = VCO frequency / PLLP with PLLP = 2, 4, 6, or 8
			00: PLLP = 2
			01: PLLP = 4
			10: PLLP = 6
			11: PLLP = 8
		*/
		RCC->PLLCFGR &= ~RCC_PLLCFGR_PLLP;      /* 432MHz / 2 = 216MHz */

	   	return true;
	}
	return false;
}


static void mcu_clock_setup( void )
{
	/* Enable Internal 16 MHz Oscillator */
	RCC->CR |= RCC_CR_HSION;
	while ( !(RCC->CR & RCC_CR_HSIRDY) );

	/* SYSCLK is 16MHz HSI */
	RCC->CFGR = RCC_CFGR_SW_0;

	/* 
		PLLM[5:0]: Division factor for the main PLLs (PLL, PLLI2S and PLLSAI) input clock
		Set and cleared by software to divide the PLL and PLLI2S input clock before the VCO.
		These bits can be written only when the PLL and PLLI2S are disabled.
		Caution: The software has to set these bits correctly to ensure that the VCO input frequency
		ranges from 1 to 2 MHz. It is recommended to select a frequency of 2 MHz to limit
		PLL jitter.
		VCO input frequency = PLL input clock frequency / PLLM with 2 ≤ PLLM ≤ 63
		000000: PLLM = 0, wrong configuration
		000001: PLLM = 1, wrong configuration
		000010: PLLM = 2
		000011: PLLM = 3
		000100: PLLM = 4
		...
		111110: PLLM = 62
		111111: PLLM = 63
	*/
	RCC->PLLCFGR &= ~RCC_PLLCFGR_PLLM;		
	RCC->PLLCFGR |= (8) << 0;			/* 16MHz / 8 = 2MHz */

	/* 
		PLLN[8:0]: Main PLL (PLL) multiplication factor for VCO
		Set and cleared by software to control the multiplication factor of the VCO. These bits can
		be written only when PLL is disabled. Only half-word and word accesses are allowed to
		write these bits.
		Caution: The software has to set these bits correctly to ensure that the VCO output
		frequency is between 100 and 432 MHz.
		VCO output frequency = VCO input frequency × PLLN with 50 ≤ PLLN ≤ 432
		000000000: PLLN = 0, wrong configuration
		000000001: PLLN = 1, wrong configuration
		...
		000110010: PLLN = 50
		...
		001100011: PLLN = 99
		001100100: PLLN = 100
		...
		110110000: PLLN = 432
		110110001: PLLN = 433, wrong configuration
		...
		111111111: PLLN = 511, wrong configuration
		Note: Between 50 and 99, multiplication factors are possible for VCO input frequency higher
		than 1 MHz. However care must be taken to fulfill the minimum VCO output frequency
		as specified above.
	*/
	RCC->PLLCFGR &= ~RCC_PLLCFGR_PLLN;
	RCC->PLLCFGR |= (216 << 6);				/* 2MHz * 216 = 432MHz */

	/*
		PLLP[1:0]: Main PLL (PLL) division factor for main system clock
		Set and cleared by software to control the frequency of the general PLL output clock. These
		bits can be written only if PLL is disabled.
		Caution: The software has to set these bits correctly not to exceed 216 MHz on this domain.
		PLL output clock frequency = VCO frequency / PLLP with PLLP = 2, 4, 6, or 8
		00: PLLP = 2
		01: PLLP = 4
		10: PLLP = 6
		11: PLLP = 8
	*/
	RCC->PLLCFGR &= ~RCC_PLLCFGR_PLLP;      /* 432MHz / 2 = 216MHz */
}


static void peripheral_clock_setup( void )
{
	RCC->APB2ENR |= RCC_APB2ENR_SYSCFGEN;

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
                        RCC_APB1ENR_DACEN		|
						RCC_APB1ENR_SPI2EN		);

	RCC->APB2ENR |= (	RCC_APB2ENR_ADC1EN		|
						RCC_APB2ENR_SPI1EN		|
						RCC_APB2ENR_SYSCFGEN	|
						RCC_APB2ENR_USART1EN	|
                        RCC_APB2ENR_USART6EN	|
						RCC_APB2ENR_TIM1EN		);

	RCC->AHB3ENR |= (	RCC_AHB3ENR_FMCEN		);
}

