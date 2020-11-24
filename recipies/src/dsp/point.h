#ifndef __POINT_H__
#define __POINT_H__

#include <board.h>

#ifdef __cplusplus
extern "C"
{
#endif

typedef struct 
{
	float	x;
	float 	y;
} point_t;

#define point_copy(p1,p2)     (p1)->x = (p2)->x; (p1)->y = (p2)->y
#define point_set(point,x,y)  (point)->x = (x); (point)->y = (y)
#define point_set_x(point,x)  (point)->x = (x)
#define point_get_x(point)    (point)->x
#define point_set_y(point,y)  (point)->y = (y)
#define point_get_y(point)    (point)->y

#ifdef __cplusplus
}
#endif

#endif 
