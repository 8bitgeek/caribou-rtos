#ifndef __DSP_CALLBACK_H__
#define __DSP_CALLBACK_H__

#include <board.h>

#ifdef __cplusplus
extern "C"
{
#endif

#define CB_DATA 					0x000
#define CB_CTRL     				0x100

#define CB_CTRL_WAVE_BEGIN			0x010
#define CB_CTRL_WAVE_END 			0x020

#define CB_CTRL_WAVE_ID_MASK		0x00F
#define CB_CTRL_WAVE_ID_ACTUAL		0x001
#define CB_CTRL_WAVE_ID_CALCULATED	0x002
#define CB_CTRL_WAVE_ID_PRESCAN		0x003

#define cb_ctrl(c,w)			((c)|(w))

/**
 * @arg ctrl The kind of data 
 * @arg p pointer to the data
 * @arg size the size of the data in bytes
 */
typedef void (*dsp_callback_fn_t)(uint16_t,void*,uint32_t);

void              dsp_callback_setup    ( void );
void              dsp_callback_set_diag ( dsp_callback_fn_t callback_fn );
dsp_callback_fn_t dsp_callback_get_diag ( void );

#ifdef __cplusplus
}
#endif

#endif 
