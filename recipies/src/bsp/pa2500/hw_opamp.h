#ifndef _HW_OPAMP_H_
#define _HW_OPAMP_H_

#include <board.h>
#include <hw_adc.h>

#ifdef __cplusplus
extern "C"
{
#endif

#define OPAMP_ADC_CHANNEL 	HW_ADC_CHANNEL_8

#define OPAMP_GAIN_1		0x0	// <follower>
#define OPAMP_GAIN_2		0x1	// 0x0
#define OPAMP_GAIN_4		0x2	// 0x1
#define OPAMP_GAIN_8		0x3	// 0x2
#define OPAMP_GAIN_16 		0x4	// 0x3

extern void 	hw_opamp_setup 		( void );

extern void 	hw_opamp_enable		( void );
extern void 	hw_opamp_disable 	( void );

extern void 	hw_opamp_set_gain	( uint8_t gain );
extern uint8_t	hw_opamp_get_gain   ( void );

extern void		hw_opamp_set_offset_p( uint8_t offset );
extern void		hw_opamp_set_offset_n( uint8_t offset );

extern uint8_t	hw_opamp_get_offset_p( void );
extern uint8_t	hw_opamp_get_offset_n( void );

#ifdef __cplusplus
}
#endif

#endif
