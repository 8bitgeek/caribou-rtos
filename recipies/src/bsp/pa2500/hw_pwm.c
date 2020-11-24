
#include <hw_pwm.h>

void hw_pwm_setup ( TIM_TypeDef *tim, uint32_t period, uint32_t prescaler )
{

	tim->PSC = prescaler;

	/* setup channel 1 & channel 2 into PWM mode 1 */
	tim->CCMR1 |= (TIM_CCMR1_OC1M_2 | TIM_CCMR1_OC1M_1) | (TIM_CCMR1_OC2M_2 | TIM_CCMR1_OC2M_1);

	/* setup channel 3 & channel 4 into PWM mode 1 */
	tim->CCMR2 |= (TIM_CCMR2_OC3M_2 | TIM_CCMR2_OC3M_1) | (TIM_CCMR2_OC3M_2 | TIM_CCMR2_OC3M_1);

	/* setup the PWM period */
	tim->ARR = period;

	/* setup auto-reload is buffered */
	tim->CR1 = TIM_CR1_ARPE;

	tim->BDTR = 0;
}

void hw_pwm_start( TIM_TypeDef *tim )
{
	tim->CNT=0;
	tim->BDTR |= TIM_BDTR_MOE;
	tim->CR1  |= TIM_CR1_CEN;
}

void hw_pwm_stop( TIM_TypeDef *tim )
{
	tim->BDTR &= ~TIM_BDTR_MOE;
	tim->CCER &= ~( TIM_CCER_CC4E | TIM_CCER_CC3E | TIM_CCER_CC2E | TIM_CCER_CC1E );
	tim->CR1  &= ~TIM_CR1_CEN;
	tim->CNT=0;
}

bool hw_pwm_started( TIM_TypeDef *tim ) 
{
	return ( tim->CR1 & TIM_CR1_CEN );
}

void hw_pwm_set_repetition( TIM_TypeDef *tim, uint16_t count )
{
	tim->RCR = count-1;
}





void hw_pwm_chan_setup( TIM_TypeDef *tim, uint32_t channel, bool inverted )
{
	uint32_t param32, mask;

	if ( channel % 2 == 0 )
	{
		mask = 0xF0FF;
		param32 = 0x0800;
	}
	else
	{
		mask = 0xFFF0;
		param32 = 0x0008;
	}

	if ( channel < 3 )
		tim->CCMR1 = (tim->CCMR1 & mask) | param32;
	else
		tim->CCMR2 = (tim->CCMR2 & mask) | param32;

	param32 = inverted ? 0x2 : 0;
	param32 <<= ( (channel - 1) * 4);
	mask = ~(0x000F << ( (channel - 1) * 4));
	tim->CCER = (tim->CCER & mask) | param32;
}

void hw_pwm_chan_start( TIM_TypeDef *tim, uint32_t channel )
{
	tim->CCER |= (uint32_t)0x01 << ( (channel - 1) * 4 );
}

void hw_pwm_chan_stop( TIM_TypeDef *tim, uint32_t channel )
{
	tim->CCER &= ~((uint32_t)0x01 << ( (channel - 1) * 4 ));
}

void hw_pwm_chan_set_duty( TIM_TypeDef *tim, uint32_t channel, uint32_t duty )
{
	switch ( channel )
	{
		case PWM_CHANNEL_1: tim->CCR1 = duty; break;
		case PWM_CHANNEL_2: tim->CCR2 = duty; break;
		case PWM_CHANNEL_3: tim->CCR3 = duty; break;
		case PWM_CHANNEL_4: tim->CCR4 = duty; break;
	}
}

void hw_pwm_chan_start_all( TIM_TypeDef *tim )
{
	tim->CCER &= 0xEEEEEEEE;
}

void hw_pwm_chan_stop_all( TIM_TypeDef *tim )
{
	tim->CCER |= 0x11111111;
}

