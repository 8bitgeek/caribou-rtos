#ifndef __DSP_SPLINE_H__
#define __DSP_SPLINE_H__

#include <board.h>
#include <point.h>

#ifdef __cplusplus
extern "C"
{
#endif

int spline( point_t pin[], uint32_t pin_sz,
            point_t pout[], uint32_t pout_sz );

#ifdef __cplusplus
}
#endif

#endif 
