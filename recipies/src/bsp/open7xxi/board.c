#include <board.h>

#include <hw_dma.h>
#include <hw_exti.h>
#include <hw_pin.h>
#include <hw_usart.h>
#include <hw_dac.h>
#include <hw_tim.h>
#include <hw_adc.h>
#include <hw_sdram.h>

hw_adc_t board_adc;

extern void early_init( void )
{
	hw_clocks_setup();
	hw_gpio_setup();
	hw_pin_setup();
}

extern void late_init( void )
{
	hw_usart_setup();
    hw_exti_setup();
   	hw_dac_setup();
   	hw_adc_setup(&board_adc,ADC1,ADC_IRQn);
}

extern void caribou_hw_init( void )
{
	hw_sdram_setup();
}

uint32_t HAL_GetTick()
{
	return caribou_timer_ticks();
}