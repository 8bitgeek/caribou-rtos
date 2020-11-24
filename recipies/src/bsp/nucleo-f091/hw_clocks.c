#include <hw_clocks.h>

static void mcu_clock_setup( void );
static void peripheral_clock_setup( void );


extern void hw_clocks_setup( void )
{
	mcu_clock_setup();
	peripheral_clock_setup();
}

static void mcu_clock_setup( void )
{
    RCC->CR &= ~RCC_CR_HSEON;                                   /* Turn HSE Off to enable GPIOF */
    RCC->CR |= RCC_CR_HSION;                                    /* Turn HSI On */
    
    RCC->CFGR &= ~(
                   RCC_CFGR_SW          |                       /* Select HSI as clock source */
                   RCC_CFGR_PLLMULL     |                       /* Clear PLL multiplier */
                   RCC_CFGR_PLLSRC      |                       /* HSI/2 is PLL clock source */
                   RCC_CFGR_PPRE        |                       /* PCLK Prescaler 1:1 */
                   RCC_CFGR_HPRE                                /* HCLK Prescaler 1:1 */
                  );

    while((!RCC->CR) & RCC_CR_HSIRDY);                            /* Wait for HSI ready */

    FLASH->ACR |= (FLASH_ACR_LATENCY | FLASH_ACR_PRFTBE);   /* Add one-wait-state to FLASH */
    RCC->CFGR |= RCC_CFGR_PLLMULL12;                        /* (8MHz/2) x 12 = 48MHz */
    RCC->CR |= RCC_CR_PLLON;                                /* Start PLL */
    while((!RCC->CR) & RCC_CR_PLLRDY);                        /* Wait for PLL Ready */
    RCC->CFGR |= RCC_CFGR_SW_PLL;                           /* Select PLL as SYSCLK */
    while((RCC->CFGR & RCC_CFGR_SWS)!=RCC_CFGR_SWS_PLL);    /* Wait for switch to PLL */

    SystemCoreClockUpdate();
}

static void peripheral_clock_setup( void )
{
    RCC->AHBENR |=  (   RCC_AHBPeriph_DMA1      |
                        RCC_AHBPeriph_GPIOA     |
                        RCC_AHBPeriph_GPIOB     |
                        RCC_AHBPeriph_GPIOC     |
                        RCC_AHBPeriph_GPIOD     |
                        RCC_AHBPeriph_GPIOF     );

    RCC->APB1ENR |= (   RCC_APB1Periph_USART2   |
                        RCC_APB1Periph_USART4   |
                        RCC_APB1Periph_I2C1     |
                        RCC_APB1Periph_TIM3     |
                        RCC_APB1Periph_WWDG     |
                        RCC_APB1Periph_PWR      );

    RCC->APB2ENR |= (   RCC_APB2Periph_USART1   |
                        RCC_APB2Periph_ADC1     |
                        RCC_APB2Periph_TIM1     );
}
