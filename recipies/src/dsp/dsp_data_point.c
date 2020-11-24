#include <dsp_data_point.h>
#include <array.h>

bool dsp_data_point_get( array_t* array, uint32_t x, point_t* point )
{
	if ( x < array_get_size(array) )
	{
		float y = array_read_float_at( array, x );
		point->x = x;
		point->y = y;
		return true;
	}
	return false;
}
