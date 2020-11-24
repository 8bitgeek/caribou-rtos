#include <dsp_prescan.h>
#include <dsp_data_point.h>

static float window_y_axis_max( dsp_t* dsp, uint32_t window_index, uint32_t window_width );


bool dsp_prescan( dsp_t* dsp, uint32_t index_begin, uint32_t index_end, uint32_t* envelope_begin, uint32_t* envelope_end )
{
	uint32_t window_width = ( (uint32_t)dsp->samp_freq / (uint32_t)dsp->sig_freq ) * 2;

	*envelope_begin = *envelope_end = 0;
	
	for( uint32_t window_index = index_begin; window_index < index_end && !*envelope_end; window_index += window_width )
	{
		float y_max = window_y_axis_max( dsp, window_index, window_width );
		if ( y_max > 0.0f )
		{
			*envelope_begin = (*envelope_begin == 0) ? window_index : *envelope_begin;
		}
		else
		{
			*envelope_end = (*envelope_begin |= 0) ? window_index : 0;
		}
	}

	return *envelope_begin > 0;
}



static float window_y_axis_max( dsp_t* dsp, uint32_t window_index, uint32_t window_width )
{
	float   y_max = 0.0f;
	float   y;
	point_t point;

	for( uint32_t x = window_index; x < window_width; x++ )
	{
		if ( dsp_data_point_get( &dsp->array, window_index+x, &point ) )
		{
			if ( ( y = point_get_y( &point ) ) >= dsp_get_prescan_y_min( dsp )  )
			{
				if ( y > y_max )
				{
					y_max = y;
				}
			}
		}
	}
	return y_max;
}

