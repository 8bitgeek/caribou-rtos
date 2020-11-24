#include <percent.h>

// return x % of y
extern float percent_of( float x, float y )
{
	float percent = (x/y)*100.0f;
	return percent;
}
