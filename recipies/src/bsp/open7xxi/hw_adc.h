#ifndef _HW_ADC_H_
#define _HW_ADC_H_

#include <board.h>
#include <hw_dma.h>

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

#define HW_ADC_EXTSEL_0    0
#define HW_ADC_EXTSEL_1    (ADC_CR2_EXTSEL_0)
#define HW_ADC_EXTSEL_2    (ADC_CR2_EXTSEL_1)
#define HW_ADC_EXTSEL_3    (ADC_CR2_EXTSEL_1|ADC_CR2_EXTSEL_0)
#define HW_ADC_EXTSEL_4    (ADC_CR2_EXTSEL_2)
#define HW_ADC_EXTSEL_5    (ADC_CR2_EXTSEL_2|ADC_CR2_EXTSEL_0)
#define HW_ADC_EXTSEL_6    (ADC_CR2_EXTSEL_2|ADC_CR2_EXTSEL_1)
#define HW_ADC_EXTSEL_7    (ADC_CR2_EXTSEL_2|ADC_CR2_EXTSEL_1|ADC_CR2_EXTSEL_0)
#define HW_ADC_EXTSEL_8    (ADC_CR2_EXTSEL_3)
#define HW_ADC_EXTSEL_9    (ADC_CR2_EXTSEL_3|ADC_CR2_EXTSEL_0)
#define HW_ADC_EXTSEL_10   (ADC_CR2_EXTSEL_3|ADC_CR2_EXTSEL_1)
#define HW_ADC_EXTSEL_11   (ADC_CR2_EXTSEL_3|ADC_CR2_EXTSEL_1|ADC_CR2_EXTSEL_0)
#define HW_ADC_EXTSEL_12   (ADC_CR2_EXTSEL_3|ADC_CR2_EXTSEL_2)
#define HW_ADC_EXTSEL_13   (ADC_CR2_EXTSEL_3|ADC_CR2_EXTSEL_2|ADC_CR2_EXTSEL_0)
#define HW_ADC_EXTSEL_14   (ADC_CR2_EXTSEL_3|ADC_CR2_EXTSEL_2|ADC_CR2_EXTSEL_1)
#define HW_ADC_EXTSEL_15   (ADC_CR2_EXTSEL_3|ADC_CR2_EXTSEL_2|ADC_CR2_EXTSEL_1|ADC_CR2_EXTSEL_0)

#define HW_ADC_EXTSEL_TIM1_CH1      HW_ADC_EXTSEL_0    
#define HW_ADC_EXTSEL_TIM1_CH2      HW_ADC_EXTSEL_1    
#define HW_ADC_EXTSEL_TIM1_CH3      HW_ADC_EXTSEL_2    
#define HW_ADC_EXTSEL_TIM2_CH2      HW_ADC_EXTSEL_3    
#define HW_ADC_EXTSEL_TIM5_TRGO     HW_ADC_EXTSEL_4    
#define HW_ADC_EXTSEL_TIM4_CH4      HW_ADC_EXTSEL_5    
#define HW_ADC_EXTSEL_TIM3_CH4      HW_ADC_EXTSEL_6    
#define HW_ADC_EXTSEL_TIM8_TRGO     HW_ADC_EXTSEL_7    
#define HW_ADC_EXTSEL_TIM8_TRGO2    HW_ADC_EXTSEL_8    
#define HW_ADC_EXTSEL_TIM1_TRGO     HW_ADC_EXTSEL_9    
#define HW_ADC_EXTSEL_TIM1_TRGO2    HW_ADC_EXTSEL_10   
#define HW_ADC_EXTSEL_TIM2_TRGO     HW_ADC_EXTSEL_11   
#define HW_ADC_EXTSEL_TIM4_TRGO     HW_ADC_EXTSEL_12   
#define HW_ADC_EXTSEL_TIM6_TRGO     HW_ADC_EXTSEL_13   
#define HW_ADC_EXTSEL_RESERVED      HW_ADC_EXTSEL_14   
#define HW_ADC_EXTSEL_EXTI_LINE11   HW_ADC_EXTSEL_15   

#define HW_ADC_JEXTSEL_TIM1_TRGO    HW_ADC_EXTSEL_0    
#define HW_ADC_JEXTSEL_TIM1_CH4     HW_ADC_EXTSEL_1    
#define HW_ADC_JEXTSEL_TIM2_TRGO    HW_ADC_EXTSEL_2    
#define HW_ADC_JEXTSEL_TIM2_CH1     HW_ADC_EXTSEL_3    
#define HW_ADC_JEXTSEL_TIM3_CH4     HW_ADC_EXTSEL_4    
#define HW_ADC_JEXTSEL_TIM4_TRGO    HW_ADC_EXTSEL_5    
#define HW_ADC_JEXTSEL_RESERVED1    HW_ADC_EXTSEL_6    
#define HW_ADC_JEXTSEL_TIM8_CH4     HW_ADC_EXTSEL_7    
#define HW_ADC_JEXTSEL_TIM1_TRGO2   HW_ADC_EXTSEL_8    
#define HW_ADC_JEXTSEL_TIM8_TRGO    HW_ADC_EXTSEL_9    
#define HW_ADC_JEXTSEL_TIM8_TRGO2   HW_ADC_EXTSEL_10   
#define HW_ADC_JEXTSEL_TIM3_CH3     HW_ADC_EXTSEL_11   
#define HW_ADC_JEXTSEL_TIM5_TRGO    HW_ADC_EXTSEL_12   
#define HW_ADC_JEXTSEL_TIM3_CH1     HW_ADC_EXTSEL_13   
#define HW_ADC_JEXTSEL_TIM6_TRGO    HW_ADC_EXTSEL_14   
#define HW_ADC_JEXTSEL_RESERVED2    HW_ADC_EXTSEL_15   

#define HW_ADC_EXTEN_DISABLE        0
#define HW_ADC_EXTEN_RISE           ADC_CR2_EXTEN_0
#define HW_ADC_EXTEN_FALL           ADC_CR2_EXTEN_1
#define HW_ADC_EXTEN_RISE_FALL      (ADC_CR2_EXTEN_1|ADC_CR2_EXTEN_0)

#define HW_ADC_JEXTEN_DISABLE       0
#define HW_ADC_JEXTEN_RISE          ADC_CR2_JEXTEN_0
#define HW_ADC_JEXTEN_FALL          ADC_CR2_JEXTEN_1
#define HW_ADC_JEXTEN_RISE_FALL     (ADC_CR2_JEXTEN_1|ADC_CR2_JEXTEN_0)

typedef struct 
{
	uint16_t	channel_data[HW_ADC_CHANNELS];
	uint16_t*	channel_data_ptr[HW_ADC_CHANNELS];
	bool 		overrun;
	uint8_t		channel_count;
	hw_dma_t*	dma;
} adc_state_t;

typedef struct _hw_adc_t
{
    ADC_Common_TypeDef* common;
    ADC_TypeDef*        device;
    IRQn_Type           irqn;
    adc_state_t         state;
} hw_adc_t;

extern void 	 hw_adc_setup          	( hw_adc_t* adc, ADC_TypeDef* device, IRQn_Type irqn );

extern void 	 hw_adc_start			( hw_adc_t* adc );
extern void 	 hw_adc_stop  		 	( hw_adc_t* adc );

extern void      hw_adc_set_extsel      ( hw_adc_t* adc, uint32_t extsel );
extern uint32_t  hw_adc_get_extsel      ( hw_adc_t* adc );
extern void      hw_adc_set_exten       ( hw_adc_t* adc, uint32_t exten );
extern uint32_t  hw_adc_get_exten       ( hw_adc_t* adc );
extern void      hw_adc_swstart         ( hw_adc_t* adc );
extern bool      hw_adc_started         ( hw_adc_t* adc );

extern void      hw_adc_set_jextsel     ( hw_adc_t* adc, uint32_t jextsel );
extern uint32_t  hw_adc_get_jextsel     ( hw_adc_t* adc );
extern void      hw_adc_set_jexten      ( hw_adc_t* adc, uint32_t jexten );
extern uint32_t  hw_adc_get_jexten      ( hw_adc_t* adc );
extern void      hw_adc_jswstart        ( hw_adc_t* adc );
extern bool      hw_adc_jstarted        ( hw_adc_t* adc );

extern bool 	 hw_adc_overrun 		( hw_adc_t* adc );
extern void 	 hw_adc_insert_channel 	( hw_adc_t* adc, uint32_t channel );
extern uint16_t	 hw_adc_read_channel	( hw_adc_t* adc, uint32_t channel );
extern uint16_t* hw_adc_data_ptr		( hw_adc_t* adc, uint32_t channel );

#endif
