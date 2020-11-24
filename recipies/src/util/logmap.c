#include <logmap.h>
#include <math.h>

extern float logmap( float x, float in_min, float in_max, float out_min, float out_max )
{
	float scale;

	out_min = logf( out_min );
	out_max = logf( out_max );

	// calculate adjustment factor
	scale = (out_max-out_min) / (in_max-in_min);

	return expf( out_min + scale*(x-in_min) );
}
