#ifndef _HW_TIM_H_
#define _HW_TIM_H_

#include <board.h>

void hw_tim_setup 				( TIM_TypeDef *tim, uint32_t prescaler );
void hw_tim_start        		( TIM_TypeDef *tim );
void hw_tim_stop         		( TIM_TypeDef *tim );
bool hw_tim_started				( TIM_TypeDef *tim );
void hw_tim_set_repetition		( TIM_TypeDef *tim, uint16_t count );
void hw_tim_set_prescaler 		( TIM_TypeDef *tim, uint32_t prescaler );

void hw_tim_enable_update_int  	( TIM_TypeDef *tim );
void hw_tim_disable_update_int 	( TIM_TypeDef *tim );
bool hw_tim_update_int_pending 	( TIM_TypeDef *tim );
void hw_tim_update_int_ack    	( TIM_TypeDef *tim );

void hw_tim_enable_update_dmarq	( TIM_TypeDef *tim );
void hw_tim_disable_update_dmarq( TIM_TypeDef *tim );

void hw_tim_cc1_out_setup		( TIM_TypeDef *tim, uint32_t channel, uint32_t cnt );
void hw_tim_enable_cc1_int		( TIM_TypeDef *tim );
void hw_tim_disable_cc1_int		( TIM_TypeDef *tim );
bool hw_tim_cc1_int_pending 	( TIM_TypeDef *tim );
void hw_tim_cc1_int_ack     	( TIM_TypeDef *tim );


#endif
