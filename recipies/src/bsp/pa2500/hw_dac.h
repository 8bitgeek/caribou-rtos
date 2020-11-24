#ifndef _HW_DAC_H_
#define _HW_DAC_H_

#include <board.h>

#ifdef __cplusplus
extern "C"
{
#endif

#define DAC_CHANNEL_1	1
#define DAC_CHANNEL_2 	2

extern void hw_dac_setup ( void );

extern void hw_dac_set   ( uint8_t channel, uint16_t value );

#ifdef __cplusplus
}
#endif

#endif
