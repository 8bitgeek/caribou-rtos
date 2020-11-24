#ifndef __DSP_DATA_POINT_H__
#define __DSP_DATA_POINT_H__

#include <board.h>
#include <point.h>
#include <array.h>

#ifdef __cplusplus
extern "C"
{
#endif

bool dsp_data_point_get( array_t* array, uint32_t x, point_t* point );

#ifdef __cplusplus
}
#endif

#endif 
