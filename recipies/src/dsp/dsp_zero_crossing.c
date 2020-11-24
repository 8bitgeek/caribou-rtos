#include <dsp_zero_crossing.h>
#include <dsp_data_point.h>

#define sign_of(p) ( (p)->y < 0.0f ? -1.0f : 1.0f )

uint32_t dsp_zero_crossing ( dsp_t* dsp, uint32_t index_begin, uint32_t index_end )
{
	uint32_t time_of_flight=0;

	for( uint32_t x = index_begin; x < index_end; x += 2 )
	{
		point_t point[2];

		dsp_data_point_get( &dsp->array, x, &point[0] );
		dsp_data_point_get( &dsp->array, x+1, &point[1] );

		/* locate the approximate location of the zero crossing */
		if ( sign_of( &point[0] ) != sign_of( &point[1] ) )
		{
			/* FIXME */
		}
	}

	return time_of_flight;
}

