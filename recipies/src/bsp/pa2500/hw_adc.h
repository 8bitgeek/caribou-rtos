#ifndef _HW_ADC_H_
#define _HW_ADC_H_

#include <board.h>

#ifdef __cplusplus
extern "C"
{
#endif

#define HW_ADC_CHANNELS 19

#define HW_ADC_CHANNEL_0	0
#define HW_ADC_CHANNEL_1	1
#define HW_ADC_CHANNEL_2	2
#define HW_ADC_CHANNEL_3	3
#define HW_ADC_CHANNEL_4	4
#define HW_ADC_CHANNEL_5	5
#define HW_ADC_CHANNEL_6	6
#define HW_ADC_CHANNEL_7	7
#define HW_ADC_CHANNEL_8	8
#define HW_ADC_CHANNEL_9	9
#define HW_ADC_CHANNEL_10	10
#define HW_ADC_CHANNEL_11	11
#define HW_ADC_CHANNEL_12	12
#define HW_ADC_CHANNEL_13	13
#define HW_ADC_CHANNEL_14	14
#define HW_ADC_CHANNEL_15	15
#define HW_ADC_CHANNEL_16	16
#define HW_ADC_CHANNEL_17	17
#define HW_ADC_CHANNEL_18	18

extern void 	 hw_adc_setup          	( void );

extern void 	 hw_adc_start			( void );
extern void 	 hw_adc_stop  		 	( void );

extern bool 	 hw_adc_overrun 		( void );
extern void 	 hw_adc_insert_channel 	( uint32_t channel );
extern uint16_t	 hw_adc_read_channel	( uint32_t channel );
extern uint16_t* hw_adc_data_ptr		( uint32_t channel );

#ifdef __cplusplus
}
#endif

#endif
