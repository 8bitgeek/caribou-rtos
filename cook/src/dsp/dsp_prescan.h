#ifndef __DSP_PRESCAN_H__
#define __DSP_PRESCAN_H__

#include <board.h>
#include <dsp.h>

#ifdef __cplusplus
extern "C"
{
#endif

bool dsp_prescan ( dsp_t* dsp, uint32_t index_begin, uint32_t index_end, uint32_t* envelope_begin, uint32_t* envelope_end );

#ifdef __cplusplus
}
#endif

#endif 
