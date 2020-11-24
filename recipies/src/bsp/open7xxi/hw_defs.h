 
#ifndef _BOARD_DEFS_H_
#define _BOARD_DEFS_H_

#include <caribou.h>
#include <caribou/kernel/timer.h>
#include <caribou/dev/gpio.h>
#include <chip/chip.h>
#include <stm32f7xx.h>
#include <stm32f746xx.h>
#include <stm32f7xx_hal_dma.h>

#define TIM1_BUS_HZ			(108000000)
#define TIM2_BUS_HZ			(54000000)
#define TIM14_BUS_HZ		(54000000)

#define TX_TIM				TIM1
#define TX_TIM_TRG_IRQn		TIM1_TRG_COM_IRQn
#define	TX_TIM_CC_IRQn		TIM1_CC_IRQn
#define TX_TIM_UP_IRQn		TIM1_UP_TIM16_IRQn
#define TX_TIM_PWM_CHANNEL	PWM_CHANNEL_1
#define TX_TIM_BUS_HZ		TIM1_BUS_HZ								/* PWM Timer bus clock frequency */
#define TX_TIM_HZ			(40000000)								/* PWM Timer counter frequency */
#define TX_TIM_PERIOD_HZ	(50000)									/* PWM Period Frequency */
#define TX_TIM_OUT_TICKS	(TX_TIM_HZ/TX_TIM_PERIOD_HZ)			/* PWM period in PWM Counter clock ticks */

#define TOF_TIM				TIM2
#define TOF_TIM_TRG_IRQn	TIM2_IRQn
#define	TOF_TIM_CC_IRQn		TIM2_IRQn
#define TOF_TIM_BUS_HZ		TIM2_BUS_HZ								/* PWM Timer bus clock frequency */
#define TOF_TIM_HZ			(10000000)								/* PWM Timer counter frequency */

#define RX_TIM				TIM16									/* Drives DMA channel 6 MEM2SPI1 */
#define RX_TIM_IRQn			TIM1_UP_TIM16_IRQn						/* TIM16 Global Interrupt shared with TIM1 Update */
#define RX_TIM_PWM_CHANNEL	PWM_CHANNEL_1
#define RX_TIM_BUS_HZ		TIM14_BUS_HZ							/* PWM Timer bus clock frequency */
#define RX_TIM_HZ			(40000000)								/* PWM Timer counter frequency */
#define RX_TIM_PERIOD_HZ	(500000)								/* PWM Period Frequency */
#define RX_TIM_OUT_TICKS	(RX_TIM_HZ/RX_TIM_PERIOD_HZ)			/* PWM period in PWM Counter clock ticks */

#define tim_precale(bus_hz,tim_hz) 		( ( bus_hz / tim_hz ) - 1 )
#define tim_period(tim_hz,period_hz)	( tim_hz / period_hz )

extern uint32_t SystemCoreClock;

#endif
