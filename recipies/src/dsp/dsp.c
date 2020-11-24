#include <dsp.h>

static void dsp_read_callback    ( uint32_t address, void* data, uint32_t size );
static void dsp_write_callback   ( uint32_t address, void* data, uint32_t size );

void dsp_setup( dsp_t* dsp )
{
	memset( dsp, 0, sizeof(dsp_t) );

	dsp->samp_freq     = 500000.0f;
	dsp->sig_freq      = 50000.0f;
	dsp->prescan_y_min = 1000.0f;
	dsp->index_begin   = 0;
	dsp->index_end     = array_get_size( &dsp->array );

	array_setup( &dsp->array, dsp_read_callback, dsp_write_callback );
}

void dsp_service( dsp_t* dsp )
{
	uint32_t index_begin = dsp_get_index_begin ( dsp );
	uint32_t index_end   = dsp_get_index_end   ( dsp );
	uint32_t envelope_begin;
	uint32_t envelope_end; 

	for( uint32_t index=0; index < dsp_get_index_end( dsp ); index++ )
	{
		if ( dsp_prescan( dsp, index_begin, index_end, &envelope_begin, &envelope_end ) )
		{
			// account for "never-ending" signal
			envelope_end = (envelope_end == 0) ? index_end : envelope_end; 

			dsp->time_of_flight = dsp_zero_crossing( dsp, envelope_begin, envelope_end  );
		}
	}
}



void dsp_set_samp_freq( dsp_t* dsp, float samp_freq )
{
	dsp->samp_freq = samp_freq;
}

float dsp_get_samp_freq( dsp_t* dsp )
{
	return dsp->samp_freq;
}

void  dsp_set_sig_freq ( dsp_t* dsp, float sig_freq )
{
	dsp->sig_freq = sig_freq;
}

float dsp_get_sig_freq ( dsp_t* dsp )
{
	return dsp->sig_freq;
}

void  dsp_set_prescan_y_min ( dsp_t* dsp, float y_min )
{
	dsp->prescan_y_min = y_min;
}

float dsp_get_prescan_y_min ( dsp_t* dsp )
{
	return dsp->prescan_y_min;
}

void dsp_set_index_begin ( dsp_t* dsp, uint32_t index_begin )
{
	dsp->index_begin = index_begin;
}

uint32_t dsp_get_index_begin ( dsp_t* dsp )
{
	return dsp->index_begin;
}

void dsp_set_index_end ( dsp_t* dsp, uint32_t index_end )
{
	dsp->index_end = index_end;
}

uint32_t dsp_get_index_end ( dsp_t* dsp )
{
	return dsp->index_end;
}



static void dsp_read_callback(uint32_t address, void* data, uint32_t size)
{
	sram_read_data_dma(address,data,size);
}

static void dsp_write_callback(uint32_t address, void* data, uint32_t size)
{
	sram_write_data_dma(address,data,size);
}
