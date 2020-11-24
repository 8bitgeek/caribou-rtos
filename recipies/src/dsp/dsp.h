#ifndef __DSP_TX_H__
#define __DSP_TX_H__

#include <board.h>
#include <array.h>

#ifdef __cplusplus
extern "C"
{
#endif

typedef struct 
{
	array_t		array;
	float		samp_freq;
	float		sig_freq;
	uint32_t 	index_begin;
	uint32_t	index_end;
	float		prescan_y_min;
	uint32_t	time_of_flight;
} dsp_t;

void  dsp_setup        ( dsp_t* dsp );
void  dsp_service      ( dsp_t* dsp );

void  dsp_set_samp_freq( dsp_t* dsp, float samp_freq );
float dsp_get_samp_freq( dsp_t* dsp );

void  dsp_set_sig_freq ( dsp_t* dsp, float sig_freq );
float dsp_get_sig_freq ( dsp_t* dsp );

void  dsp_set_prescan_y_min    ( dsp_t* dsp, float y_min );
float dsp_get_prescan_y_min    ( dsp_t* dsp );

void  	 dsp_set_index_begin   ( dsp_t* dsp, uint32_t index_begin );
uint32_t dsp_get_index_begin   ( dsp_t* dsp );

void  	 dsp_set_index_end     ( dsp_t* dsp, uint32_t index_end );
uint32_t dsp_get_index_end     ( dsp_t* dsp );

#ifdef __cplusplus
}
#endif

#endif 
