#include <hw_tim.h>

void hw_tim_setup ( TIM_TypeDef *tim, uint32_t prescaler )
{

	hw_tim_set_prescaler( tim, prescaler );

	/* setup auto-reload is buffered */
	tim->CR1 = TIM_CR1_ARPE;

	tim->BDTR = 0;
}

void hw_tim_start( TIM_TypeDef *tim )
{
	tim->CNT=0;
	tim->BDTR |= TIM_BDTR_MOE;
	tim->CR1  |= TIM_CR1_CEN;
}

void hw_tim_stop( TIM_TypeDef *tim )
{
	tim->BDTR &= ~TIM_BDTR_MOE;
	tim->CR1  &= ~TIM_CR1_CEN;
	tim->CNT=0;
}

bool hw_tim_started( TIM_TypeDef *tim ) 
{
	return ( tim->CR1 & TIM_CR1_CEN );
}

void hw_tim_set_repetition( TIM_TypeDef *tim, uint16_t count )
{
	tim->RCR = count-1;
}

void hw_tim_set_prescaler( TIM_TypeDef *tim, uint32_t prescaler )
{
	tim->PSC = prescaler;
}

bool hw_tim_update_int_pending ( TIM_TypeDef *tim )
{
	return (tim->SR & TIM_SR_UIF) != 0;
}

void hw_tim_update_int_ack( TIM_TypeDef *tim )
{
	tim->SR &= ~TIM_SR_UIF;
}

void hw_tim_enable_update_int( TIM_TypeDef *tim )
{
	tim->DIER |= TIM_DIER_UIE;
}

void hw_tim_disable_update_int( TIM_TypeDef *tim )
{
	tim->DIER &= ~TIM_DIER_UIE;
}



void hw_tim_cc1_out_setup( TIM_TypeDef *tim, uint32_t channel, uint32_t cnt )
{
	tim->CCMR1 |= TIM_CCMR1_OC1PE;
	tim->CCR1 = (uint16_t)cnt;
}

void hw_tim_enable_update_dmarq( TIM_TypeDef *tim )
{
	tim->DIER |= TIM_DIER_UDE;
}

void hw_tim_disable_update_dmarq( TIM_TypeDef *tim )
{
	tim->DIER &= ~TIM_DIER_UDE;
}

void hw_tim_enable_cc1_int( TIM_TypeDef *tim )
{
	tim->DIER |= TIM_DIER_CC1IE;
}

void hw_tim_disable_cc1_int( TIM_TypeDef *tim )
{
	tim->DIER &= ~TIM_DIER_CC1IE;
}

bool hw_tim_cc1_int_pending( TIM_TypeDef *tim )
{
	return (tim->SR & TIM_SR_CC1IF) != 0;
}

void hw_tim_cc1_int_ack( TIM_TypeDef *tim )
{
	tim->SR &= ~TIM_SR_CC1IF;
}

