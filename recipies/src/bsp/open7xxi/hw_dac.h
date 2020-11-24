#ifndef _HW_DAC_H_
#define _HW_DAC_H_

#include <board.h>

#if !defined(DAC_CHANNEL_1)
    #define DAC_CHANNEL_1	1
#endif

#if !defined(DAC_CHANNEL_2)
    #define DAC_CHANNEL_2 	2
#endif

#define DAC_V_CAP_CTL   DAC_CHANNEL_2

extern void hw_dac_setup ( void );

extern void hw_dac_set   ( uint8_t channel, uint16_t value );

#endif
