#include <hw_lptim.h>

void hw_lptim_setup ( LPTIM_TypeDef *tim, uint8_t prescaler )
{
	tim->CR  |= LPTIM_CR_ENABLE;
	
	hw_lptim_set_prescaler( tim, prescaler );

	/* setup auto-reload is buffered */
	tim->CFGR |= LPTIM_CFGR_PRELOAD;
}

void hw_lptim_start( LPTIM_TypeDef *tim, bool oneshot )
{
	tim->CR  |= LPTIM_CR_ENABLE;
	tim->CNT=0;
	tim->CR |= (oneshot ? LPTIM_CR_SNGSTRT : LPTIM_CR_CNTSTRT);
}

void hw_lptim_stop( LPTIM_TypeDef *tim )
{
	tim->CR  &= ~LPTIM_CR_ENABLE;
	tim->CNT=0;
}

bool hw_lptim_started( LPTIM_TypeDef *tim ) 
{
	return ( tim->CR & LPTIM_CR_ENABLE );
}




void hw_lptim_set_prescaler( LPTIM_TypeDef *tim, uint8_t prescaler )
{
	prescaler &= 0x7;
	tim->CFGR &= ~LPTIM_CFGR_PRESC;
	tim->CFGR |= (prescaler << LPTIM_CFGR_PRESC_Pos);
}

void hw_lptim_set_out_polarity( LPTIM_TypeDef *tim, bool invert )
{
	if ( invert )
	{
		tim->CFGR |= LPTIM_CFGR_WAVPOL;
	}
	else
	{
		tim->CFGR &= ~LPTIM_CFGR_WAVPOL;
	}
}




void hw_lptim_set_arr( LPTIM_TypeDef *tim, uint32_t cnt )
{
	tim->ARR = (uint16_t)cnt;
}

void hw_lptim_enable_arr_int( LPTIM_TypeDef *tim )
{
	tim->IER |= LPTIM_IER_ARRMIE;
}

void hw_lptim_disable_arr_int( LPTIM_TypeDef *tim )
{
	tim->IER |= LPTIM_IER_ARRMIE;
}

bool hw_lptim_arr_int_pending( LPTIM_TypeDef *tim )
{
	return (tim->ISR & LPTIM_ISR_ARRM) != 0;
}

void hw_lptim_arr_int_ack( LPTIM_TypeDef *tim )
{
	tim->ICR = LPTIM_ICR_ARRMCF;
}




void hw_lptim_set_cmp( LPTIM_TypeDef *tim, uint32_t cnt )
{
	tim->CMP = (uint16_t)cnt;
}

void hw_lptim_enable_cmp_int( LPTIM_TypeDef *tim )
{
	tim->IER |= LPTIM_IER_CMPMIE;
}

void hw_lptim_disable_cmp_int( LPTIM_TypeDef *tim )
{
	tim->IER &= ~LPTIM_IER_CMPMIE;
}

bool hw_lptim_cmp_int_pending( LPTIM_TypeDef *tim )
{
	return (tim->ISR & LPTIM_ISR_CMPM) != 0;
}

void hw_lptim_cmp_int_ack( LPTIM_TypeDef *tim )
{
	tim->ICR = LPTIM_ICR_CMPMCF;
}
