#ifndef __DS18B20_H__
#define __DS18B20_H__

#include <board.h>

#ifdef __cplusplus
extern "C"
{
#endif

extern void  ds18b20_setup     ( void );

extern float ds18b20_degrees_c ( void );

extern void ds18b20_timing_test( void );

#ifdef __cplusplus
}
#endif

#endif 
