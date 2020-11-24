#ifndef __HEAT_TX_H__
#define __HEAT_TX_H__

#include <board.h>

#ifdef __cplusplus
extern "C"
{
#endif

void   heat_setup      ( void );
void   heat_service    ( void );

void   heat_set_actual ( float actual );
float  heat_get_actual ( void );

void   heat_set_target ( float target );
float  heat_get_target ( void );

void   heat_set_active ( bool active );
bool   heat_get_active ( void );

void   heat_set_max_pwm( float max_pwm );
float  heat_get_pwm    ( void );

#ifdef __cplusplus
}
#endif

#endif 
