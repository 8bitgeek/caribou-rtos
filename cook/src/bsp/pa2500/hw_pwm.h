
#ifndef __HW_PWM_H__
#define __HW_PWM_H__

#include <board.h>

#ifdef __cplusplus
extern "C"
{
#endif

#define PWM_CHANNEL_1     1
#define PWM_CHANNEL_2     2
#define PWM_CHANNEL_3     3
#define PWM_CHANNEL_4     4

void hw_pwm_setup 			( TIM_TypeDef *tim, uint32_t period, uint32_t prescaler );
void hw_pwm_start        	( TIM_TypeDef *tim );
void hw_pwm_stop         	( TIM_TypeDef *tim );
bool hw_pwm_started			( TIM_TypeDef *tim );
void hw_pwm_set_repetition	( TIM_TypeDef *tim, uint16_t count );

void hw_pwm_chan_setup		( TIM_TypeDef *tim, uint32_t channel, bool inverted );
void hw_pwm_chan_start 		( TIM_TypeDef *tim, uint32_t channel );
void hw_pwm_chan_stop 		( TIM_TypeDef *tim, uint32_t channel );
void hw_pwm_chan_set_duty	( TIM_TypeDef *tim, uint32_t channel, uint32_t duty );

void hw_pwm_chan_start_all 	( TIM_TypeDef *tim );
void hw_pwm_chan_stop_all 	( TIM_TypeDef *tim );

#define hw_pwm_update_int_pending(tim)	(tim->SR & TIM_SR_UIF)
#define hw_pwm_ack_update_int(tim) 		(tim->SR &= ~TIM_SR_UIF)
#define hw_pwm_enable_update_int(tim)   (tim->DIER |= TIM_DIER_UIE)
#define hw_pwm_disable_update_int(tim) 	(tim->DIER &= ~TIM_DIER_UIE)

#define hw_pwm_enable_cc1_int(tim)		(tim->DIER |= TIM_DIER_CC1IE)
#define hw_pwm_disable_cc1_int(tim)		(tim->DIER &= ~TIM_DIER_CC1IE)
#define hw_pwm_cc1_int_pending(tim)		((tim->SR & TIM_SR_CC1IF) != 0)
#define hw_pwm_cc1_int_ack(tim)			(tim->SR &= ~TIM_SR_CC1IF)

#define hw_pwm_enable_cc2_int(tim)		(tim->DIER |= TIM_DIER_CC2IE)
#define hw_pwm_disable_cc2_int(tim)		(tim->DIER &= ~TIM_DIER_CC2IE)
#define hw_pwm_cc2_int_pending(tim)		((tim->SR & TIM_SR_CC2IF) != 0)
#define hw_pwm_cc2_int_ack(tim)			(tim->SR &= ~TIM_SR_CC2IF)

#ifdef __cplusplus
}
#endif

#endif
