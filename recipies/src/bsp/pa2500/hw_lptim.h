#ifndef _HW_LPTIM_H_
#define _HW_LPTIM_H_

#include <board.h>

#ifdef __cplusplus
extern "C"
{
#endif

#define LPTIM_PRESCALE_DIV_1	0x00
#define LPTIM_PRESCALE_DIV_2	0x01
#define LPTIM_PRESCALE_DIV_4 	0x02
#define LPTIM_PRESCALE_DIV_8 	0x03
#define LPTIM_PRESCALE_DIV_16	0x04
#define LPTIM_PRESCALE_DIV_32	0x05
#define LPTIM_PRESCALE_DIV_64	0x06
#define LPTIM_PRESCALE_DIV_128	0x07 


void hw_lptim_setup 			( LPTIM_TypeDef *tim, uint8_t prescaler );
void hw_lptim_start        		( LPTIM_TypeDef *tim, bool oneshot );
void hw_lptim_stop         		( LPTIM_TypeDef *tim );
bool hw_lptim_started			( LPTIM_TypeDef *tim );

void hw_lptim_set_prescaler 	( LPTIM_TypeDef *tim, uint8_t prescaler );
void hw_lptim_set_out_polarity	( LPTIM_TypeDef *tim, bool invert );

void hw_lptim_set_arr			( LPTIM_TypeDef *tim, uint32_t cnt );
void hw_lptim_enable_arr_int  	( LPTIM_TypeDef *tim );
void hw_lptim_disable_arr_int 	( LPTIM_TypeDef *tim );
bool hw_lptim_arr_int_pending 	( LPTIM_TypeDef *tim );
void hw_lptim_arr_int_ack    	( LPTIM_TypeDef *tim );

void hw_lptim_set_cmp			( LPTIM_TypeDef *tim, uint32_t cnt );
void hw_lptim_enable_cmp_int	( LPTIM_TypeDef *tim );
void hw_lptim_disable_cmp_int	( LPTIM_TypeDef *tim );
bool hw_lptim_cmp_int_pending 	( LPTIM_TypeDef *tim );
void hw_lptim_cmp_int_ack     	( LPTIM_TypeDef *tim );

#ifdef __cplusplus
}
#endif

#endif
