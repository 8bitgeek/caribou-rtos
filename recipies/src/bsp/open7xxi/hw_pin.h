#ifndef _HW_PIN_H_
#define _HW_PIN_H_

#include <board.h>


/*********************************************/


#define PIN_MODE_MASK(n)				(0x3<<(n*2))			/* 16 bits */
#define PIN_MODE(n,mode)				((mode&0x3)<<(n*2))		/* 16 bits, mode 2 bits */

#define	PIN_OTYPER_MASK(n)				(1<<n)					/* 16 bits */
#define	PIN_OTYPER(n,otyper)			((otyper&1)<<n)			/* 16 bits, otyper 1 bit */

#define PIN_OSPEEDR_MASK(n)				(0x3<<(n*2))			/* 16 bits */
#define PIN_OSPEEDR(n,ospeedr)			((ospeedr&0x3)<<(n*2))	/* 16 bits, mode 2 bits */

#define PIN_PUPDR_MASK(n)				(0x3<<(n*2))			/* 16 bits */
#define PIN_PUPDR(n,pupdr)				((pupdr&0x3)<<(n*2))	/* 16 bits, mode 2 bits */

#define PIN_AFR_MASK(n)					(0xf<<(n*4))			/* 8 bits */
#define PIN_AFR(n,afr)					((afr&0xf)<<(n*4))		/* 8 bits, mode 4 bits */

#define GPIO_AF_GPIO					0						/* Alternate Function GPIO or Default */
#define GPIO_AF_USART1					GPIO_AF7_USART1
#define GPIO_AF_USART2					GPIO_AF7_USART2
#define GPIO_AF_USART3					GPIO_AF7_USART3
#define GPIO_AF_USART6					GPIO_AF8_USART6
#define GPIO_AF_UART7					GPIO_AF8_UART7
#define GPIO_AF_SPI1					GPIO_AF5_SPI1
#define GPIO_AF_SPI2					GPIO_AF5_SPI2
#define GPIO_AF_TIM1					GPIO_AF1_TIM1
#define GPIO_AF_TIM2					GPIO_AF1_TIM2
#define GPIO_AF_TIM3					GPIO_AF2_TIM3
#define GPIO_AF_TIM4					GPIO_AF2_TIM4
#define GPIO_AF_TIM8					GPIO_AF3_TIM8
#define GPIO_AF_CAN1					GPIO_AF9_CAN1
#define GPIO_AF_FMC						GPIO_AF12_FMC

#define	GPIO_Mode_IN					(0x00)	/*!< GPIO Input Mode */
#define	GPIO_Mode_OUT					(0x01)	/*!< GPIO Output Mode */
#define	GPIO_Mode_AF					(0x02)	/*!< GPIO Alternate function Mode */
#define	GPIO_Mode_AN					(0x03)	/*!< GPIO Analog Mode */

#define	GPIO_OType_PP					(0x00)
#define	GPIO_OType_OD					(0x01)

#define	GPIO_Speed_2MHz					(0x00)	/*!< Low speed */
#define	GPIO_Speed_25MHz				(0x01)	/*!< Medium speed */
#define	GPIO_Speed_50MHz				(0x02)	/*!< Fast speed */
#define	GPIO_Speed_100MHz				(0x03)	/*!< High speed on 30 pF (80 MHz Output max speed on 15 pF) */

#define	GPIO_PuPd_NOPULL				(0x00)
#define	GPIO_PuPd_UP					(0x01)
#define	GPIO_PuPd_DOWN					(0x02)

/**
 ** PORT A
 */
#define	CARIBOU_PORTA_MODE		PIN_MODE(0,GPIO_Mode_IN) |			/* N/C 									*/	\
								PIN_MODE(1,GPIO_Mode_IN) |			/* N/C 									*/ 	\
								PIN_MODE(2,GPIO_Mode_IN) |			/* N/C 									*/ 	\
								PIN_MODE(3,GPIO_Mode_IN) |			/* N/C 									*/ 	\
								PIN_MODE(4,GPIO_Mode_IN) |			/* N/C 									*/ 	\
								PIN_MODE(5,GPIO_Mode_IN) |			/* N/C 									*/	\
								PIN_MODE(6,GPIO_Mode_IN) |			/* N/C 									*/	\
								PIN_MODE(7,GPIO_Mode_IN) |			/* N/C 									*/	\
								PIN_MODE(8,GPIO_Mode_IN) |			/* N/C 									*/	\
								PIN_MODE(9,GPIO_Mode_AF) |			/* USART1_TX: RS485_TX_ETR - TX Data	*/	\
								PIN_MODE(10,GPIO_Mode_AF) |			/* USART1_RX: RS485_RX_ETR - RX Data	*/	\
								PIN_MODE(11,GPIO_Mode_IN) |			/* N/C 									*/	\
								PIN_MODE(12,GPIO_Mode_IN) |			/* N/C 									*/	\
								PIN_MODE(13,GPIO_Mode_AF) |			/* JTMS/SWDIO 							*/	\
								PIN_MODE(14,GPIO_Mode_AF) |			/* JTCK/SWCLK							*/	\
								PIN_MODE(15,GPIO_Mode_IN)			/* N/C 									*/

#define	CARIBOU_PORTA_OTYPER	PIN_OTYPER(0,GPIO_OType_PP) |		\
								PIN_OTYPER(1,GPIO_OType_PP) |		\
								PIN_OTYPER(2,GPIO_OType_PP) |		\
								PIN_OTYPER(3,GPIO_OType_PP) |		\
								PIN_OTYPER(4,GPIO_OType_PP) |		\
								PIN_OTYPER(5,GPIO_OType_PP) |		\
								PIN_OTYPER(6,GPIO_OType_PP) |		\
								PIN_OTYPER(7,GPIO_OType_PP) |		\
								PIN_OTYPER(8,GPIO_OType_PP) |		\
								PIN_OTYPER(9,GPIO_OType_PP) |		\
								PIN_OTYPER(10,GPIO_OType_PP) |		\
								PIN_OTYPER(11,GPIO_OType_PP) |		\
								PIN_OTYPER(12,GPIO_OType_PP) |		\
								PIN_OTYPER(13,GPIO_OType_PP) |		\
								PIN_OTYPER(14,GPIO_OType_PP) |		\
								PIN_OTYPER(15,GPIO_OType_PP)		

#define	CARIBOU_PORTA_OSPEEDR	PIN_OSPEEDR(0,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(1,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(2,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(3,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(4,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(5,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(6,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(7,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(8,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(9,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(10,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(11,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(12,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(13,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(14,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(15,GPIO_Speed_2MHz)	

#define	CARIBOU_PORTA_PUPDR		PIN_PUPDR(0,GPIO_PuPd_NOPULL) |		\
								PIN_PUPDR(1,GPIO_PuPd_NOPULL) |		\
								PIN_PUPDR(2,GPIO_PuPd_NOPULL) |		\
								PIN_PUPDR(3,GPIO_PuPd_NOPULL) |		\
								PIN_PUPDR(4,GPIO_PuPd_NOPULL) |		\
								PIN_PUPDR(5,GPIO_PuPd_NOPULL) |		\
								PIN_PUPDR(6,GPIO_PuPd_NOPULL) |		\
								PIN_PUPDR(7,GPIO_PuPd_NOPULL) |		\
								PIN_PUPDR(8,GPIO_PuPd_NOPULL) |		\
								PIN_PUPDR(9,GPIO_PuPd_DOWN) |		\
								PIN_PUPDR(10,GPIO_PuPd_UP) |	    \
								PIN_PUPDR(11,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(12,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(13,GPIO_PuPd_UP) |		\
								PIN_PUPDR(14,GPIO_PuPd_DOWN) |		\
								PIN_PUPDR(15,GPIO_PuPd_UP)			

#define	CARIBOU_PORTA_AFRL		PIN_AFR(0,GPIO_AF_GPIO) |			\
								PIN_AFR(1,GPIO_AF_GPIO) |			\
								PIN_AFR(2,GPIO_AF_GPIO) |			\
								PIN_AFR(3,GPIO_AF_GPIO) |			\
								PIN_AFR(4,GPIO_AF_GPIO) |			\
								PIN_AFR(5,GPIO_AF_GPIO) |			\
								PIN_AFR(6,GPIO_AF_GPIO) |			\
								PIN_AFR(7,GPIO_AF_GPIO)				
#define	CARIBOU_PORTA_AFRH		PIN_AFR(0,GPIO_AF_GPIO) |			\
								PIN_AFR(1,GPIO_AF_USART1) |			\
								PIN_AFR(2,GPIO_AF_USART1) |			\
								PIN_AFR(3,GPIO_AF_GPIO) |			\
								PIN_AFR(4,GPIO_AF_GPIO) |			\
								PIN_AFR(5,GPIO_AF_GPIO) |			\
								PIN_AFR(6,GPIO_AF_GPIO) |			\
								PIN_AFR(7,GPIO_AF_GPIO)				
/**
 ** PORT B
 */
#define	CARIBOU_PORTB_MODE		PIN_MODE(0,GPIO_Mode_IN) |			/* N/C 									*/	\
								PIN_MODE(1,GPIO_Mode_IN) |			/* N/C 									*/	\
								PIN_MODE(2,GPIO_Mode_IN) |			/* N/C 									*/	\
								PIN_MODE(3,GPIO_Mode_IN) |			/* N/C 									*/	\
								PIN_MODE(4,GPIO_Mode_IN) |			/* N/C 									*/	\
								PIN_MODE(5,GPIO_Mode_IN) |			/* N/C									*/	\
								PIN_MODE(6,GPIO_Mode_OUT) |			/* GPIO: USERLED1						*/  \
								PIN_MODE(7,GPIO_Mode_OUT) |			/* GPIO: USERLED2						*/	\
								PIN_MODE(8,GPIO_Mode_IN) |			/* N/C 									*/	\
								PIN_MODE(9,GPIO_Mode_IN) |			/* N/C                                  */	\
								PIN_MODE(10,GPIO_Mode_IN) | 		/* N/C                                  */	\
								PIN_MODE(11,GPIO_Mode_IN) | 		/* N/C 									*/	\
								PIN_MODE(12,GPIO_Mode_IN) | 		/* N/C 									*/	\
								PIN_MODE(13,GPIO_Mode_IN) |			/* N/C 									*/	\
								PIN_MODE(14,GPIO_Mode_IN) |			/* N/C 									*/	\
								PIN_MODE(15,GPIO_Mode_IN)			/* N/C 									*/

#define	CARIBOU_PORTB_OTYPER	PIN_OTYPER(0,GPIO_OType_PP) |	\
								PIN_OTYPER(1,GPIO_OType_PP) |	\
								PIN_OTYPER(2,GPIO_OType_PP) |	\
								PIN_OTYPER(3,GPIO_OType_PP) |	\
								PIN_OTYPER(4,GPIO_OType_PP) |	\
								PIN_OTYPER(5,GPIO_OType_PP) |	\
								PIN_OTYPER(6,GPIO_OType_PP) |	\
								PIN_OTYPER(7,GPIO_OType_PP) |	\
								PIN_OTYPER(8,GPIO_OType_PP) |	\
								PIN_OTYPER(9,GPIO_OType_PP) |	\
								PIN_OTYPER(10,GPIO_OType_PP) |	\
								PIN_OTYPER(11,GPIO_OType_PP) |	\
								PIN_OTYPER(12,GPIO_OType_PP) |	\
								PIN_OTYPER(13,GPIO_OType_PP) |	\
								PIN_OTYPER(14,GPIO_OType_PP) |	\
								PIN_OTYPER(15,GPIO_OType_PP)

#define	CARIBOU_PORTB_OSPEEDR	PIN_OSPEEDR(0,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(1,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(2,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(3,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(4,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(5,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(6,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(7,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(8,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(9,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(10,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(11,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(12,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(13,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(14,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(15,GPIO_Speed_2MHz)

#define	CARIBOU_PORTB_PUPDR		PIN_PUPDR(0,GPIO_PuPd_DOWN) |		\
								PIN_PUPDR(1,GPIO_PuPd_DOWN) |		\
								PIN_PUPDR(2,GPIO_PuPd_DOWN) |		\
								PIN_PUPDR(3,GPIO_PuPd_DOWN) |		\
								PIN_PUPDR(4,GPIO_PuPd_DOWN) |		\
								PIN_PUPDR(5,GPIO_PuPd_DOWN) |		\
								PIN_PUPDR(6,GPIO_PuPd_DOWN) |		\
								PIN_PUPDR(7,GPIO_PuPd_DOWN) |		\
								PIN_PUPDR(8,GPIO_PuPd_DOWN) |		\
								PIN_PUPDR(9,GPIO_PuPd_DOWN) |		\
								PIN_PUPDR(10,GPIO_PuPd_DOWN) |		\
								PIN_PUPDR(11,GPIO_PuPd_DOWN) |		\
								PIN_PUPDR(12,GPIO_PuPd_DOWN) |		\
								PIN_PUPDR(13,GPIO_PuPd_DOWN) |		\
								PIN_PUPDR(14,GPIO_PuPd_DOWN) |		\
								PIN_PUPDR(15,GPIO_PuPd_DOWN)

#define	CARIBOU_PORTB_AFRL		PIN_AFR(0,GPIO_AF_GPIO) |			\
								PIN_AFR(1,GPIO_AF_GPIO) |			\
								PIN_AFR(2,GPIO_AF_GPIO) |			\
								PIN_AFR(3,GPIO_AF_GPIO) |			\
								PIN_AFR(4,GPIO_AF_GPIO) |			\
								PIN_AFR(5,GPIO_AF_GPIO) |			\
								PIN_AFR(6,GPIO_AF_GPIO) |			\
								PIN_AFR(7,GPIO_AF_GPIO)					
#define	CARIBOU_PORTB_AFRH		PIN_AFR(0,GPIO_AF_GPIO) |			\
								PIN_AFR(1,GPIO_AF_GPIO) |			\
								PIN_AFR(2,GPIO_AF_GPIO) |			\
								PIN_AFR(3,GPIO_AF_GPIO) |			\
								PIN_AFR(4,GPIO_AF_GPIO) |			\
								PIN_AFR(5,GPIO_AF_GPIO) |			\
								PIN_AFR(6,GPIO_AF_GPIO) |			\
								PIN_AFR(7,GPIO_AF_GPIO)
/**
 ** PORT C
 */
#define	CARIBOU_PORTC_MODE		PIN_MODE(0,GPIO_Mode_IN) |			/* N/C 									*/	\
								PIN_MODE(1,GPIO_Mode_IN) |			/* N/C 									*/	\
								PIN_MODE(2,GPIO_Mode_IN) |			/* N/C 									*/	\
								PIN_MODE(3,GPIO_Mode_IN) |			/* N/C 									*/	\
								PIN_MODE(4,GPIO_Mode_IN) |			/* N/C									*/	\
								PIN_MODE(5,GPIO_Mode_IN) |			/* N/C									*/	\
								PIN_MODE(6,GPIO_Mode_AF) |			/* EZBUS								*/  \
								PIN_MODE(7,GPIO_Mode_AF) |			/* EZBUS								*/  \
								PIN_MODE(8,GPIO_Mode_IN) |			/* N/C									*/ 	\
								PIN_MODE(9,GPIO_Mode_IN) |			/* N/C									*/	\
								PIN_MODE(10,GPIO_Mode_IN) |			/* N/C 									*/	\
								PIN_MODE(11,GPIO_Mode_IN) |			/* N/C 									*/	\
								PIN_MODE(12,GPIO_Mode_IN) |			/* N/C 									*/	\
								PIN_MODE(13,GPIO_Mode_IN) | 		/* N/C 									*/	\
								PIN_MODE(14,GPIO_Mode_IN) | 		/* N/C 									*/	\
								PIN_MODE(15,GPIO_Mode_IN)			/* N/C 									*/	\

#define	CARIBOU_PORTC_OTYPER	PIN_OTYPER(0,GPIO_OType_PP) |		\
								PIN_OTYPER(1,GPIO_OType_PP) |		\
								PIN_OTYPER(2,GPIO_OType_PP) |		\
								PIN_OTYPER(3,GPIO_OType_PP) |		\
								PIN_OTYPER(4,GPIO_OType_PP) |		\
								PIN_OTYPER(5,GPIO_OType_PP) |		\
								PIN_OTYPER(6,GPIO_OType_PP) |		\
								PIN_OTYPER(7,GPIO_OType_PP) |		\
								PIN_OTYPER(8,GPIO_OType_PP) |		\
								PIN_OTYPER(9,GPIO_OType_PP) |		\
								PIN_OTYPER(10,GPIO_OType_PP) |		\
								PIN_OTYPER(11,GPIO_OType_PP) |		\
								PIN_OTYPER(12,GPIO_OType_PP) |		\
								PIN_OTYPER(13,GPIO_OType_PP) |		\
								PIN_OTYPER(14,GPIO_OType_PP) |		\
								PIN_OTYPER(15,GPIO_OType_PP)

#define	CARIBOU_PORTC_OSPEEDR	PIN_OSPEEDR(0,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(1,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(2,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(3,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(4,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(5,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(6,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(7,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(8,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(9,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(10,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(11,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(12,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(13,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(14,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(15,GPIO_Speed_2MHz)

#define	CARIBOU_PORTC_PUPDR		PIN_PUPDR(0,GPIO_PuPd_NOPULL) |		\
								PIN_PUPDR(1,GPIO_PuPd_NOPULL) |		\
								PIN_PUPDR(2,GPIO_PuPd_NOPULL) |		\
								PIN_PUPDR(3,GPIO_PuPd_NOPULL) |		\
								PIN_PUPDR(4,GPIO_PuPd_NOPULL) |		\
								PIN_PUPDR(5,GPIO_PuPd_NOPULL) |		\
								PIN_PUPDR(6,GPIO_PuPd_NOPULL) |		\
								PIN_PUPDR(7,GPIO_PuPd_NOPULL) |		\
								PIN_PUPDR(8,GPIO_PuPd_NOPULL) |		\
								PIN_PUPDR(9,GPIO_PuPd_NOPULL) |		\
								PIN_PUPDR(10,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(11,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(12,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(13,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(14,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(15,GPIO_PuPd_NOPULL)

#define	CARIBOU_PORTC_AFRL		PIN_AFR(0,GPIO_AF_GPIO) |			\
								PIN_AFR(1,GPIO_AF_GPIO) |			\
								PIN_AFR(2,GPIO_AF_GPIO) |			\
								PIN_AFR(3,GPIO_AF_GPIO) |			\
								PIN_AFR(4,GPIO_AF_GPIO) |			\
								PIN_AFR(5,GPIO_AF_GPIO) |			\
								PIN_AFR(6,GPIO_AF_USART6) |			\
								PIN_AFR(7,GPIO_AF_USART6)										
#define	CARIBOU_PORTC_AFRH		PIN_AFR(0,GPIO_AF_GPIO) |			\
								PIN_AFR(1,GPIO_AF_GPIO) |			\
								PIN_AFR(2,GPIO_AF_GPIO) |			\
								PIN_AFR(3,GPIO_AF_GPIO) |			\
								PIN_AFR(4,GPIO_AF_GPIO) |			\
								PIN_AFR(5,GPIO_AF_GPIO) |			\
								PIN_AFR(6,GPIO_AF_GPIO) |			\
								PIN_AFR(7,GPIO_AF_GPIO)
/**
 ** PORT D
 */
#define	CARIBOU_PORTD_MODE		PIN_MODE(0,GPIO_Mode_AF) |			/* FMC_D2:     DQ2						*/	\
								PIN_MODE(1,GPIO_Mode_AF) |			/* FMC_D3:	   DQ3						*/	\
								PIN_MODE(2,GPIO_Mode_IN) |			/* N/C 									*/	\
								PIN_MODE(3,GPIO_Mode_IN) |			/* N/C									*/	\
								PIN_MODE(4,GPIO_Mode_IN) |			/* N/C									*/	\
								PIN_MODE(5,GPIO_Mode_IN) |			/* N/C									*/	\
								PIN_MODE(6,GPIO_Mode_IN) |			/* N/C									*/	\
								PIN_MODE(7,GPIO_Mode_IN) |			/* N/C									*/	\
								PIN_MODE(8,GPIO_Mode_AF) |			/* FMC_D13:	   DQ13						*/	\
								PIN_MODE(9,GPIO_Mode_AF) |			/* FMC_D14:	   DQ14						*/	\
								PIN_MODE(10,GPIO_Mode_AF) | 		/* FMC_D15:	   DQ15						*/	\
								PIN_MODE(11,GPIO_Mode_IN) |			/* N/C									*/	\
								PIN_MODE(12,GPIO_Mode_IN) |			/* N/C									*/	\
								PIN_MODE(13,GPIO_Mode_IN) |			/* N/C									*/	\
								PIN_MODE(14,GPIO_Mode_AF) |			/* FMC_D0:     DQ0						*/	\
								PIN_MODE(15,GPIO_Mode_AF)			/* FMC_D1:     DQ1						*/			

#define	CARIBOU_PORTD_OTYPER	PIN_OTYPER(0,GPIO_OType_PP) |	\
								PIN_OTYPER(1,GPIO_OType_PP) |	\
								PIN_OTYPER(2,GPIO_OType_PP) |	\
								PIN_OTYPER(3,GPIO_OType_PP) |	\
								PIN_OTYPER(4,GPIO_OType_PP) |	\
								PIN_OTYPER(5,GPIO_OType_PP) |	\
								PIN_OTYPER(6,GPIO_OType_PP) |	\
								PIN_OTYPER(7,GPIO_OType_PP) |	\
								PIN_OTYPER(8,GPIO_OType_PP) |	\
								PIN_OTYPER(9,GPIO_OType_PP) |	\
								PIN_OTYPER(10,GPIO_OType_PP) |	\
								PIN_OTYPER(11,GPIO_OType_PP) |	\
								PIN_OTYPER(12,GPIO_OType_PP) |	\
								PIN_OTYPER(13,GPIO_OType_PP) |	\
								PIN_OTYPER(14,GPIO_OType_PP) |	\
								PIN_OTYPER(15,GPIO_OType_PP)

#define	CARIBOU_PORTD_OSPEEDR	PIN_OSPEEDR(0,GPIO_Speed_100MHz) |	\
								PIN_OSPEEDR(1,GPIO_Speed_100MHz) |	\
								PIN_OSPEEDR(2,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(3,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(4,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(5,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(6,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(7,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(8,GPIO_Speed_100MHz) |	\
								PIN_OSPEEDR(9,GPIO_Speed_100MHz) |	\
								PIN_OSPEEDR(10,GPIO_Speed_100MHz) |	\
								PIN_OSPEEDR(11,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(12,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(13,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(14,GPIO_Speed_100MHz) |	\
								PIN_OSPEEDR(15,GPIO_Speed_100MHz)				

#define	CARIBOU_PORTD_PUPDR		PIN_PUPDR(0,GPIO_PuPd_NOPULL) |		\
								PIN_PUPDR(1,GPIO_PuPd_NOPULL) |		\
								PIN_PUPDR(2,GPIO_PuPd_DOWN) |		\
								PIN_PUPDR(3,GPIO_PuPd_DOWN) |		\
								PIN_PUPDR(4,GPIO_PuPd_DOWN) |		\
								PIN_PUPDR(5,GPIO_PuPd_DOWN) |		\
								PIN_PUPDR(6,GPIO_PuPd_DOWN) |		\
								PIN_PUPDR(7,GPIO_PuPd_DOWN) |		\
								PIN_PUPDR(8,GPIO_PuPd_NOPULL) |		\
								PIN_PUPDR(9,GPIO_PuPd_NOPULL) |		\
								PIN_PUPDR(10,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(11,GPIO_PuPd_DOWN) |		\
								PIN_PUPDR(12,GPIO_PuPd_DOWN) |		\
								PIN_PUPDR(13,GPIO_PuPd_DOWN) |		\
								PIN_PUPDR(14,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(15,GPIO_PuPd_NOPULL)					

#define	CARIBOU_PORTD_AFRL		PIN_AFR(0,GPIO_AF_FMC) |			\
								PIN_AFR(1,GPIO_AF_FMC) |			\
								PIN_AFR(2,GPIO_AF_GPIO) |			\
								PIN_AFR(3,GPIO_AF_GPIO) |			\
								PIN_AFR(4,GPIO_AF_GPIO) |			\
								PIN_AFR(5,GPIO_AF_GPIO) |			\
								PIN_AFR(6,GPIO_AF_GPIO) |			\
								PIN_AFR(7,GPIO_AF_GPIO)
#define	CARIBOU_PORTD_AFRH		PIN_AFR(0,GPIO_AF_FMC) |			\
								PIN_AFR(1,GPIO_AF_FMC) |			\
								PIN_AFR(2,GPIO_AF_FMC) |			\
								PIN_AFR(3,GPIO_AF_GPIO) |			\
								PIN_AFR(4,GPIO_AF_GPIO) |			\
								PIN_AFR(5,GPIO_AF_GPIO) |			\
								PIN_AFR(6,GPIO_AF_FMC) |			\
								PIN_AFR(7,GPIO_AF_FMC)						
/**
 ** PORT E
 */
#define	CARIBOU_PORTE_MODE		PIN_MODE(0,GPIO_Mode_AF) |			/* FMC_NBL0:   ~BL0						*/	\
								PIN_MODE(1,GPIO_Mode_AF) |			/* FMC_NBL1:   ~BL1						*/	\
								PIN_MODE(2,GPIO_Mode_IN) |			/* N/C 									*/	\
								PIN_MODE(3,GPIO_Mode_IN) |			/* N/C 									*/	\
								PIN_MODE(4,GPIO_Mode_IN) |			/* N/C 									*/	\
								PIN_MODE(5,GPIO_Mode_IN) |			/* N/C 									*/	\
								PIN_MODE(6,GPIO_Mode_IN) |			/* N/C 									*/	\
								PIN_MODE(7,GPIO_Mode_AF) |			/* FMC_D4:     D4						*/	\
								PIN_MODE(8,GPIO_Mode_AF) |			/* FMC_D5:     D5						*/	\
								PIN_MODE(9,GPIO_Mode_AF) |			/* FMC_D6:     D6						*/	\
								PIN_MODE(10,GPIO_Mode_AF) | 		/* FMC_D7:     D7						*/	\
								PIN_MODE(11,GPIO_Mode_AF) | 		/* FMC_D8:     D8						*/	\
								PIN_MODE(12,GPIO_Mode_AF) | 		/* FMC_D9:     D9						*/	\
								PIN_MODE(13,GPIO_Mode_AF) | 		/* FMC_D10:    D10						*/	\
								PIN_MODE(14,GPIO_Mode_AF) | 		/* FMC_D11:    D11						*/	\
								PIN_MODE(15,GPIO_Mode_AF)			/* FMC_D12:    D12						*/			

#define	CARIBOU_PORTE_OTYPER	PIN_OTYPER(0,GPIO_OType_PP) |			\
								PIN_OTYPER(1,GPIO_OType_PP) |			\
								PIN_OTYPER(2,GPIO_OType_PP) |			\
								PIN_OTYPER(3,GPIO_OType_PP) |			\
								PIN_OTYPER(4,GPIO_OType_PP) |			\
								PIN_OTYPER(5,GPIO_OType_PP) |			\
								PIN_OTYPER(6,GPIO_OType_PP) |			\
								PIN_OTYPER(7,GPIO_OType_PP) |			\
								PIN_OTYPER(8,GPIO_OType_PP) |			\
								PIN_OTYPER(9,GPIO_OType_PP) |			\
								PIN_OTYPER(10,GPIO_OType_PP) |			\
								PIN_OTYPER(11,GPIO_OType_PP) |			\
								PIN_OTYPER(12,GPIO_OType_PP) |			\
								PIN_OTYPER(13,GPIO_OType_PP) |			\
								PIN_OTYPER(14,GPIO_OType_PP) |			\
								PIN_OTYPER(15,GPIO_OType_PP)					

#define	CARIBOU_PORTE_OSPEEDR	PIN_OSPEEDR(0,GPIO_Speed_100MHz) |		\
								PIN_OSPEEDR(1,GPIO_Speed_100MHz) |		\
								PIN_OSPEEDR(2,GPIO_Speed_2MHz) |		\
								PIN_OSPEEDR(3,GPIO_Speed_2MHz) |		\
								PIN_OSPEEDR(4,GPIO_Speed_2MHz) |		\
								PIN_OSPEEDR(5,GPIO_Speed_2MHz) |		\
								PIN_OSPEEDR(6,GPIO_Speed_2MHz) |		\
								PIN_OSPEEDR(7,GPIO_Speed_100MHz) |		\
								PIN_OSPEEDR(8,GPIO_Speed_100MHz) |		\
								PIN_OSPEEDR(9,GPIO_Speed_100MHz) |		\
								PIN_OSPEEDR(10,GPIO_Speed_100MHz) |		\
								PIN_OSPEEDR(11,GPIO_Speed_100MHz) |		\
								PIN_OSPEEDR(12,GPIO_Speed_100MHz) |		\
								PIN_OSPEEDR(13,GPIO_Speed_100MHz) |		\
								PIN_OSPEEDR(14,GPIO_Speed_100MHz) |		\
								PIN_OSPEEDR(15,GPIO_Speed_100MHz)				

#define	CARIBOU_PORTE_PUPDR		PIN_PUPDR(0,GPIO_PuPd_NOPULL) |			\
								PIN_PUPDR(1,GPIO_PuPd_NOPULL) |			\
								PIN_PUPDR(2,GPIO_PuPd_NOPULL) |			\
								PIN_PUPDR(3,GPIO_PuPd_NOPULL) |			\
								PIN_PUPDR(4,GPIO_PuPd_NOPULL) |			\
								PIN_PUPDR(5,GPIO_PuPd_NOPULL) |			\
								PIN_PUPDR(6,GPIO_PuPd_NOPULL) |			\
								PIN_PUPDR(7,GPIO_PuPd_NOPULL) |			\
								PIN_PUPDR(8,GPIO_PuPd_NOPULL) |			\
								PIN_PUPDR(9,GPIO_PuPd_NOPULL) |			\
								PIN_PUPDR(10,GPIO_PuPd_NOPULL) |		\
								PIN_PUPDR(11,GPIO_PuPd_NOPULL) |		\
								PIN_PUPDR(12,GPIO_PuPd_NOPULL) |		\
								PIN_PUPDR(13,GPIO_PuPd_NOPULL) |		\
								PIN_PUPDR(14,GPIO_PuPd_NOPULL) |		\
								PIN_PUPDR(15,GPIO_PuPd_NOPULL)					

#define	CARIBOU_PORTE_AFRL		PIN_AFR(0,GPIO_AF_FMC) |				\
								PIN_AFR(1,GPIO_AF_FMC) |				\
								PIN_AFR(2,GPIO_AF_GPIO) |				\
								PIN_AFR(3,GPIO_AF_GPIO) |				\
								PIN_AFR(4,GPIO_AF_GPIO) |				\
								PIN_AFR(5,GPIO_AF_GPIO) |				\
								PIN_AFR(6,GPIO_AF_GPIO) |				\
								PIN_AFR(7,GPIO_AF_FMC)						
#define	CARIBOU_PORTE_AFRH		PIN_AFR(0,GPIO_AF_FMC) |				\
								PIN_AFR(1,GPIO_AF_FMC) |				\
								PIN_AFR(2,GPIO_AF_FMC) |				\
								PIN_AFR(3,GPIO_AF_FMC) |				\
								PIN_AFR(4,GPIO_AF_FMC) |				\
								PIN_AFR(5,GPIO_AF_FMC) |				\
								PIN_AFR(6,GPIO_AF_FMC) |				\
								PIN_AFR(7,GPIO_AF_FMC)						
/**
 ** PORT F
 */
#define	CARIBOU_PORTF_MODE		PIN_MODE(0,GPIO_Mode_AF) |			/* FMC_A0:     A0						*/	\
								PIN_MODE(1,GPIO_Mode_AF) |			/* FMC_A1:     A1						*/	\
								PIN_MODE(2,GPIO_Mode_AF) |			/* FMC_A2:     A2						*/	\
								PIN_MODE(3,GPIO_Mode_AF) |			/* FMC_A3:     A3						*/	\
								PIN_MODE(4,GPIO_Mode_AF) |			/* FMC_A4:     A4						*/	\
								PIN_MODE(5,GPIO_Mode_AF) |			/* FMC_A5:     A5						*/	\
								PIN_MODE(6,GPIO_Mode_IN) |			/* N/C									*/	\
								PIN_MODE(7,GPIO_Mode_IN) |			/* N/C									*/	\
								PIN_MODE(8,GPIO_Mode_IN) |			/* N/C									*/	\
								PIN_MODE(9,GPIO_Mode_IN) |			/* N/C									*/	\
								PIN_MODE(10,GPIO_Mode_IN) |			/* N/C									*/	\
								PIN_MODE(11,GPIO_Mode_AF) | 		/* FMC_SDNRAS: ~SDRAS					*/	\
								PIN_MODE(12,GPIO_Mode_AF) |			/* FMC_A6:     A6						*/	\
								PIN_MODE(13,GPIO_Mode_AF) | 		/* FMC_A7:     A7						*/	\
								PIN_MODE(14,GPIO_Mode_AF) | 		/* FMC_A8:     A8						*/	\
								PIN_MODE(15,GPIO_Mode_AF)			/* FMC_A9:     A9						*/

#define	CARIBOU_PORTF_OTYPER	PIN_OTYPER(0,GPIO_OType_PP) |				\
								PIN_OTYPER(1,GPIO_OType_PP) |				\
								PIN_OTYPER(2,GPIO_OType_PP) |				\
								PIN_OTYPER(3,GPIO_OType_PP) |				\
								PIN_OTYPER(4,GPIO_OType_PP) |				\
								PIN_OTYPER(5,GPIO_OType_PP) |				\
								PIN_OTYPER(6,GPIO_OType_PP)	|				\
								PIN_OTYPER(7,GPIO_OType_PP) |				\
								PIN_OTYPER(8,GPIO_OType_PP) |				\
								PIN_OTYPER(9,GPIO_OType_PP) |				\
								PIN_OTYPER(10,GPIO_OType_PP) |				\
								PIN_OTYPER(11,GPIO_OType_PP) |				\
								PIN_OTYPER(12,GPIO_OType_PP) |				\
								PIN_OTYPER(13,GPIO_OType_PP) |				\
								PIN_OTYPER(14,GPIO_OType_PP) |				\
								PIN_OTYPER(15,GPIO_OType_PP)				

#define	CARIBOU_PORTF_OSPEEDR	PIN_OSPEEDR(0,GPIO_Speed_100MHz) |			\
								PIN_OSPEEDR(1,GPIO_Speed_100MHz) |			\
								PIN_OSPEEDR(2,GPIO_Speed_100MHz) |			\
								PIN_OSPEEDR(3,GPIO_Speed_100MHz) |			\
								PIN_OSPEEDR(4,GPIO_Speed_100MHz) |			\
								PIN_OSPEEDR(5,GPIO_Speed_100MHz) |			\
								PIN_OSPEEDR(6,GPIO_Speed_2MHz) |			\
								PIN_OSPEEDR(7,GPIO_Speed_2MHz) |			\
								PIN_OSPEEDR(8,GPIO_Speed_2MHz) |			\
								PIN_OSPEEDR(9,GPIO_Speed_2MHz) |			\
								PIN_OSPEEDR(10,GPIO_Speed_2MHz) |			\
								PIN_OSPEEDR(11,GPIO_Speed_100MHz) |			\
								PIN_OSPEEDR(12,GPIO_Speed_100MHz) |			\
								PIN_OSPEEDR(13,GPIO_Speed_100MHz) |			\
								PIN_OSPEEDR(14,GPIO_Speed_100MHz) |			\
								PIN_OSPEEDR(15,GPIO_Speed_100MHz)			

#define	CARIBOU_PORTF_PUPDR		PIN_PUPDR(0,GPIO_PuPd_NOPULL) |				\
								PIN_PUPDR(1,GPIO_PuPd_NOPULL) |				\
								PIN_PUPDR(2,GPIO_PuPd_NOPULL) |				\
								PIN_PUPDR(3,GPIO_PuPd_NOPULL) |				\
								PIN_PUPDR(4,GPIO_PuPd_NOPULL) |				\
								PIN_PUPDR(5,GPIO_PuPd_NOPULL) |				\
								PIN_PUPDR(6,GPIO_PuPd_NOPULL) |				\
								PIN_PUPDR(7,GPIO_PuPd_NOPULL) |				\
								PIN_PUPDR(8,GPIO_PuPd_NOPULL) |				\
								PIN_PUPDR(9,GPIO_PuPd_NOPULL) |				\
								PIN_PUPDR(10,GPIO_PuPd_NOPULL) |			\
								PIN_PUPDR(11,GPIO_PuPd_NOPULL) |			\
								PIN_PUPDR(12,GPIO_PuPd_NOPULL) |			\
								PIN_PUPDR(13,GPIO_PuPd_NOPULL) |			\
								PIN_PUPDR(14,GPIO_PuPd_NOPULL) |			\
								PIN_PUPDR(15,GPIO_PuPd_NOPULL)				

#define	CARIBOU_PORTF_AFRL		PIN_AFR(0,GPIO_AF_FMC) |					\
								PIN_AFR(1,GPIO_AF_FMC) |					\
								PIN_AFR(2,GPIO_AF_FMC) |					\
								PIN_AFR(3,GPIO_AF_FMC) |					\
								PIN_AFR(4,GPIO_AF_FMC) |					\
								PIN_AFR(5,GPIO_AF_FMC) |					\
								PIN_AFR(6,GPIO_AF_GPIO) |					\
								PIN_AFR(7,GPIO_AF_GPIO)			
#define	CARIBOU_PORTF_AFRH		PIN_AFR(0,GPIO_AF_GPIO) |					\
								PIN_AFR(1,GPIO_AF_GPIO) |					\
								PIN_AFR(2,GPIO_AF_GPIO) |					\
								PIN_AFR(3,GPIO_AF_FMC) |					\
								PIN_AFR(4,GPIO_AF_FMC) |					\
								PIN_AFR(5,GPIO_AF_FMC) |					\
								PIN_AFR(6,GPIO_AF_FMC) |					\
								PIN_AFR(7,GPIO_AF_FMC)					
/**
 ** PORT G
 */
#define	CARIBOU_PORTG_MODE		PIN_MODE(0,GPIO_Mode_AF) |			/* FMC_A10:    A10						*/	\
								PIN_MODE(1,GPIO_Mode_AF) |			/* FMC_A11:    A11						*/	\
								PIN_MODE(2,GPIO_Mode_IN) |			/* N/C									*/	\
								PIN_MODE(3,GPIO_Mode_IN) |			/* N/C									*/	\
								PIN_MODE(4,GPIO_Mode_AF) |			/* FMC_BA0								*/	\
								PIN_MODE(5,GPIO_Mode_AF) |			/* FMC_BA1								*/	\
								PIN_MODE(6,GPIO_Mode_IN) |			/* N/C									*/	\
								PIN_MODE(7,GPIO_Mode_IN) |			/* N/C									*/	\
								PIN_MODE(8,GPIO_Mode_AF) |			/* FMC_SDCLK:  SDCLK					*/	\
								PIN_MODE(9,GPIO_Mode_IN) |			/* N/C									*/	\
								PIN_MODE(10,GPIO_Mode_IN) |			/* N/C									*/	\
								PIN_MODE(11,GPIO_Mode_IN) |			/* N/C									*/	\
								PIN_MODE(12,GPIO_Mode_IN) | 		/* N/C									*/	\
								PIN_MODE(13,GPIO_Mode_IN) |			/* N/C									*/	\
								PIN_MODE(14,GPIO_Mode_IN) |			/* N/C									*/	\
								PIN_MODE(15,GPIO_Mode_AF)			/* FMC_SDNCAS: ~SDCAS					*/	\

#define	CARIBOU_PORTG_OTYPER	PIN_OTYPER(0,GPIO_OType_PP) |				\
								PIN_OTYPER(1,GPIO_OType_PP) |				\
								PIN_OTYPER(2,GPIO_OType_PP) |				\
								PIN_OTYPER(3,GPIO_OType_PP) |				\
								PIN_OTYPER(4,GPIO_OType_PP) |				\
								PIN_OTYPER(5,GPIO_OType_PP) |				\
								PIN_OTYPER(6,GPIO_OType_PP) |				\
								PIN_OTYPER(7,GPIO_OType_PP) |				\
								PIN_OTYPER(8,GPIO_OType_PP) |				\
								PIN_OTYPER(9,GPIO_OType_PP) |				\
								PIN_OTYPER(10,GPIO_OType_PP) |				\
								PIN_OTYPER(11,GPIO_OType_PP) |				\
								PIN_OTYPER(12,GPIO_OType_PP) |				\
								PIN_OTYPER(13,GPIO_OType_PP) |				\
								PIN_OTYPER(14,GPIO_OType_PP) |				\
								PIN_OTYPER(15,GPIO_OType_PP)		

#define	CARIBOU_PORTG_OSPEEDR	PIN_OSPEEDR(0,GPIO_Speed_100MHz) |			\
								PIN_OSPEEDR(1,GPIO_Speed_100MHz) |			\
								PIN_OSPEEDR(2,GPIO_Speed_2MHz) |			\
								PIN_OSPEEDR(3,GPIO_Speed_2MHz) |			\
								PIN_OSPEEDR(4,GPIO_Speed_100MHz) |			\
								PIN_OSPEEDR(5,GPIO_Speed_100MHz) |			\
								PIN_OSPEEDR(6,GPIO_Speed_2MHz) |			\
								PIN_OSPEEDR(7,GPIO_Speed_2MHz) |			\
								PIN_OSPEEDR(8,GPIO_Speed_100MHz) |			\
								PIN_OSPEEDR(9,GPIO_Speed_2MHz) |			\
								PIN_OSPEEDR(10,GPIO_Speed_2MHz) |			\
								PIN_OSPEEDR(11,GPIO_Speed_2MHz) |			\
								PIN_OSPEEDR(12,GPIO_Speed_2MHz) |			\
								PIN_OSPEEDR(13,GPIO_Speed_2MHz) |			\
								PIN_OSPEEDR(14,GPIO_Speed_2MHz) |			\
								PIN_OSPEEDR(15,GPIO_Speed_100MHz)	

#define	CARIBOU_PORTG_PUPDR		PIN_PUPDR(0,GPIO_PuPd_NOPULL) |				\
								PIN_PUPDR(1,GPIO_PuPd_NOPULL) |				\
								PIN_PUPDR(2,GPIO_PuPd_DOWN) |				\
								PIN_PUPDR(3,GPIO_PuPd_DOWN) |				\
								PIN_PUPDR(4,GPIO_PuPd_NOPULL) |				\
								PIN_PUPDR(5,GPIO_PuPd_NOPULL) |				\
								PIN_PUPDR(6,GPIO_PuPd_DOWN) |				\
								PIN_PUPDR(7,GPIO_PuPd_DOWN) |				\
								PIN_PUPDR(8,GPIO_PuPd_NOPULL) |				\
								PIN_PUPDR(9,GPIO_PuPd_DOWN) |				\
								PIN_PUPDR(10,GPIO_PuPd_DOWN) |				\
								PIN_PUPDR(11,GPIO_PuPd_DOWN) |				\
								PIN_PUPDR(12,GPIO_PuPd_DOWN) |				\
								PIN_PUPDR(13,GPIO_PuPd_DOWN) |				\
								PIN_PUPDR(14,GPIO_PuPd_DOWN) |				\
								PIN_PUPDR(15,GPIO_PuPd_NOPULL)		

#define	CARIBOU_PORTG_AFRL		PIN_AFR(0,GPIO_AF_FMC) |					\
								PIN_AFR(1,GPIO_AF_FMC) |					\
								PIN_AFR(2,GPIO_AF_GPIO) |					\
								PIN_AFR(3,GPIO_AF_GPIO) |					\
								PIN_AFR(4,GPIO_AF_FMC) |					\
								PIN_AFR(5,GPIO_AF_FMC) |					\
								PIN_AFR(6,GPIO_AF_GPIO) |					\
								PIN_AFR(7,GPIO_AF_GPIO)					
#define	CARIBOU_PORTG_AFRH		PIN_AFR(0,GPIO_AF_FMC) |					\
								PIN_AFR(1,GPIO_AF_GPIO) |					\
								PIN_AFR(2,GPIO_AF_GPIO) |			 		\
								PIN_AFR(3,GPIO_AF_GPIO) |					\
								PIN_AFR(4,GPIO_AF_GPIO) |					\
								PIN_AFR(5,GPIO_AF_GPIO) |					\
								PIN_AFR(6,GPIO_AF_GPIO) |					\
								PIN_AFR(7,GPIO_AF_FMC)			
/**
 ** PORT H
 */
#define	CARIBOU_PORTH_MODE		PIN_MODE(0,GPIO_Mode_IN) |		\
								PIN_MODE(1,GPIO_Mode_IN) |		\
								PIN_MODE(2,GPIO_Mode_IN) |		\
								PIN_MODE(3,GPIO_Mode_IN) |		\
								PIN_MODE(4,GPIO_Mode_OUT) |		/* GPIO: USERLED3 						*/	\
								PIN_MODE(5,GPIO_Mode_AF) |		/* FMC_SDNWE:  ~SDWE					*/	\
								PIN_MODE(6,GPIO_Mode_AF) |		/* FMC_SDNE1:  ~SDE1					*/	\
								PIN_MODE(7,GPIO_Mode_AF) |		/* FMC_SDCKE0: SDCKE0					*/	\
								PIN_MODE(8,GPIO_Mode_IN) |		\
								PIN_MODE(9,GPIO_Mode_IN) |		\
								PIN_MODE(10,GPIO_Mode_IN) | 	\
								PIN_MODE(11,GPIO_Mode_IN) | 	\
								PIN_MODE(12,GPIO_Mode_IN) | 	\
								PIN_MODE(13,GPIO_Mode_IN) | 	\
								PIN_MODE(14,GPIO_Mode_IN) |	\
								PIN_MODE(15,GPIO_Mode_IN)	

#define	CARIBOU_PORTH_OTYPER	PIN_OTYPER(0,GPIO_OType_PP) |	\
								PIN_OTYPER(1,GPIO_OType_PP) |	\
								PIN_OTYPER(2,GPIO_OType_PP) |	\
								PIN_OTYPER(3,GPIO_OType_PP) |	\
								PIN_OTYPER(4,GPIO_OType_PP) |	\
								PIN_OTYPER(5,GPIO_OType_PP) |	\
								PIN_OTYPER(6,GPIO_OType_PP) |	\
								PIN_OTYPER(7,GPIO_OType_PP) |	\
								PIN_OTYPER(8,GPIO_OType_PP) |	\
								PIN_OTYPER(9,GPIO_OType_PP) |	\
								PIN_OTYPER(10,GPIO_OType_PP) |	\
								PIN_OTYPER(11,GPIO_OType_PP) |	\
								PIN_OTYPER(12,GPIO_OType_PP) |	\
								PIN_OTYPER(13,GPIO_OType_PP) |	\
								PIN_OTYPER(14,GPIO_OType_PP) |	\
								PIN_OTYPER(15,GPIO_OType_PP)		

#define	CARIBOU_PORTH_OSPEEDR	PIN_OSPEEDR(0,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(1,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(2,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(3,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(4,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(5,GPIO_Speed_100MHz) |	\
								PIN_OSPEEDR(6,GPIO_Speed_100MHz) |	\
								PIN_OSPEEDR(7,GPIO_Speed_100MHz) |	\
								PIN_OSPEEDR(8,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(9,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(10,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(11,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(12,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(13,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(14,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(15,GPIO_Speed_2MHz)		

#define	CARIBOU_PORTH_PUPDR		PIN_PUPDR(0,GPIO_PuPd_NOPULL) |		\
								PIN_PUPDR(1,GPIO_PuPd_NOPULL) |		\
								PIN_PUPDR(2,GPIO_PuPd_NOPULL) |		\
								PIN_PUPDR(3,GPIO_PuPd_NOPULL) |		\
								PIN_PUPDR(4,GPIO_PuPd_NOPULL) |		\
								PIN_PUPDR(5,GPIO_PuPd_NOPULL) |		\
								PIN_PUPDR(6,GPIO_PuPd_NOPULL) |		\
								PIN_PUPDR(7,GPIO_PuPd_NOPULL) |		\
								PIN_PUPDR(8,GPIO_PuPd_NOPULL) |		\
								PIN_PUPDR(9,GPIO_PuPd_NOPULL) |		\
								PIN_PUPDR(10,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(11,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(12,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(13,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(14,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(15,GPIO_PuPd_NOPULL)		

#define	CARIBOU_PORTH_AFRL		PIN_AFR(0,GPIO_AF_GPIO) |	\
								PIN_AFR(1,GPIO_AF_GPIO) |	\
								PIN_AFR(2,GPIO_AF_GPIO) |	\
								PIN_AFR(3,GPIO_AF_GPIO) |	\
								PIN_AFR(4,GPIO_AF_GPIO) |	\
								PIN_AFR(5,GPIO_AF_FMC) |	\
								PIN_AFR(6,GPIO_AF_FMC) |	\
								PIN_AFR(7,GPIO_AF_FMC)
#define	CARIBOU_PORTH_AFRH		PIN_AFR(0,GPIO_AF_GPIO) |	\
								PIN_AFR(1,GPIO_AF_GPIO) |	\
								PIN_AFR(2,GPIO_AF_GPIO) |	\
								PIN_AFR(3,GPIO_AF_GPIO) |	\
								PIN_AFR(4,GPIO_AF_GPIO) |	\
								PIN_AFR(5,GPIO_AF_GPIO) |	\
								PIN_AFR(6,GPIO_AF_GPIO) |	\
								PIN_AFR(7,GPIO_AF_GPIO)

/**
 ** PORT I
 */
#define	CARIBOU_PORTI_MODE		PIN_MODE(0,GPIO_Mode_IN) |		\
								PIN_MODE(1,GPIO_Mode_IN) |		\
								PIN_MODE(2,GPIO_Mode_IN) |		\
								PIN_MODE(3,GPIO_Mode_IN) |		\
								PIN_MODE(4,GPIO_Mode_IN) |		\
								PIN_MODE(5,GPIO_Mode_IN) |		\
								PIN_MODE(6,GPIO_Mode_IN) |		\
								PIN_MODE(7,GPIO_Mode_IN) |		\
								PIN_MODE(8,GPIO_Mode_OUT) |		/* GPIO: USERLED4 						*/		\
								PIN_MODE(9,GPIO_Mode_IN) |		\
								PIN_MODE(10,GPIO_Mode_IN) | 	\
								PIN_MODE(11,GPIO_Mode_IN) | 	\
								PIN_MODE(12,GPIO_Mode_IN) | 	\
								PIN_MODE(13,GPIO_Mode_IN) | 	\
								PIN_MODE(14,GPIO_Mode_IN) |		\
								PIN_MODE(15,GPIO_Mode_IN)	

#define	CARIBOU_PORTI_OTYPER	PIN_OTYPER(0,GPIO_OType_PP) |	\
								PIN_OTYPER(1,GPIO_OType_PP) |	\
								PIN_OTYPER(2,GPIO_OType_PP) |	\
								PIN_OTYPER(3,GPIO_OType_PP) |	\
								PIN_OTYPER(4,GPIO_OType_PP) |	\
								PIN_OTYPER(5,GPIO_OType_PP) |	\
								PIN_OTYPER(6,GPIO_OType_PP) |	\
								PIN_OTYPER(7,GPIO_OType_PP) |	\
								PIN_OTYPER(8,GPIO_OType_PP) |	\
								PIN_OTYPER(9,GPIO_OType_PP) |	\
								PIN_OTYPER(10,GPIO_OType_PP) |	\
								PIN_OTYPER(11,GPIO_OType_PP) |	\
								PIN_OTYPER(12,GPIO_OType_PP) |	\
								PIN_OTYPER(13,GPIO_OType_PP) |	\
								PIN_OTYPER(14,GPIO_OType_PP) |	\
								PIN_OTYPER(15,GPIO_OType_PP)		

#define	CARIBOU_PORTI_OSPEEDR	PIN_OSPEEDR(0,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(1,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(2,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(3,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(4,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(5,GPIO_Speed_100MHz) |	\
								PIN_OSPEEDR(6,GPIO_Speed_100MHz) |	\
								PIN_OSPEEDR(7,GPIO_Speed_100MHz) |	\
								PIN_OSPEEDR(8,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(9,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(10,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(11,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(12,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(13,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(14,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(15,GPIO_Speed_2MHz)		

#define	CARIBOU_PORTI_PUPDR		PIN_PUPDR(0,GPIO_PuPd_NOPULL) |		\
								PIN_PUPDR(1,GPIO_PuPd_NOPULL) |		\
								PIN_PUPDR(2,GPIO_PuPd_NOPULL) |		\
								PIN_PUPDR(3,GPIO_PuPd_NOPULL) |		\
								PIN_PUPDR(4,GPIO_PuPd_NOPULL) |		\
								PIN_PUPDR(5,GPIO_PuPd_NOPULL) |		\
								PIN_PUPDR(6,GPIO_PuPd_NOPULL) |		\
								PIN_PUPDR(7,GPIO_PuPd_NOPULL) |		\
								PIN_PUPDR(8,GPIO_PuPd_NOPULL) |		\
								PIN_PUPDR(9,GPIO_PuPd_NOPULL) |		\
								PIN_PUPDR(10,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(11,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(12,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(13,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(14,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(15,GPIO_PuPd_NOPULL)		

#define	CARIBOU_PORTI_AFRL		PIN_AFR(0,GPIO_AF_GPIO) |	\
								PIN_AFR(1,GPIO_AF_GPIO) |	\
								PIN_AFR(2,GPIO_AF_GPIO) |	\
								PIN_AFR(3,GPIO_AF_GPIO) |	\
								PIN_AFR(4,GPIO_AF_GPIO) |	\
								PIN_AFR(5,GPIO_AF_FMC) |	\
								PIN_AFR(6,GPIO_AF_FMC) |	\
								PIN_AFR(7,GPIO_AF_FMC)
#define	CARIBOU_PORTI_AFRH		PIN_AFR(0,GPIO_AF_GPIO) |	\
								PIN_AFR(1,GPIO_AF_GPIO) |	\
								PIN_AFR(2,GPIO_AF_GPIO) |	\
								PIN_AFR(3,GPIO_AF_GPIO) |	\
								PIN_AFR(4,GPIO_AF_GPIO) |	\
								PIN_AFR(5,GPIO_AF_GPIO) |	\
								PIN_AFR(6,GPIO_AF_GPIO) |	\
								PIN_AFR(7,GPIO_AF_GPIO)

extern void hw_pin_setup( void );


#endif
