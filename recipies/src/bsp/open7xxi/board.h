 
#ifndef _BOARD_H_
#define _BOARD_H_

#include <hw_defs.h>
#include <hw_clocks.h>
#include <hw_gpio.h>

#include "stm32f7xx_hal.h"

extern void early_init ( void );
extern void late_init ( void );
extern void caribou_hw_init ( void );

extern uint32_t HAL_GetTick();

#endif
