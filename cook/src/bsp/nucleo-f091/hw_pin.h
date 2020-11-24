#ifndef _HW_PIN_H_
#define _HW_PIN_H_

#include <board.h>


/*********************************************/

// typedef enum
// {
//   GPIO_Mode_IN   = 0x00, /*!< GPIO Input Mode              */
//   GPIO_Mode_OUT  = 0x01, /*!< GPIO Output Mode             */
//   GPIO_Mode_AF   = 0x02, /*!< GPIO Alternate function Mode */
//   GPIO_Mode_AN   = 0x03  /*!< GPIO Analog In/Out Mode */      
// } GPIOMode_TypeDef;

// // #define IS_GPIO_MODE(MODE) (((MODE) == GPIO_Mode_IN)|| ((MODE) == GPIO_Mode_OUT) || ((MODE) == GPIO_Mode_AF)|| ((MODE) == GPIO_Mode_AN))
// typedef enum
// {
//   GPIO_OType_PP = 0x00,
//   GPIO_OType_OD = 0x01
// } GPIOOType_TypeDef;

// #define IS_GPIO_OTYPE(OTYPE) (((OTYPE) == GPIO_OType_PP) || ((OTYPE) == GPIO_OType_OD))

#define PIN_MODE_MASK(n)		(0x3<<(n*2))			/* 16 bits */
#define PIN_MODE(n,mode)		((mode&0x3)<<(n*2))		/* 16 bits, mode 2 bits */

#define	PIN_OTYPER_MASK(n)		(1<<n)					/* 16 bits */
#define	PIN_OTYPER(n,otyper)	((otyper&1)<<n)			/* 16 bits, otyper 1 bit */

#define PIN_OSPEEDR_MASK(n)		(0x3<<(n*2))			/* 16 bits */
#define PIN_OSPEEDR(n,ospeedr)	((ospeedr&0x3)<<(n*2))	/* 16 bits, mode 2 bits */

#define PIN_PUPDR_MASK(n)		(0x3<<(n*2))			/* 16 bits */
#define PIN_PUPDR(n,pupdr)		((pupdr&0x3)<<(n*2))	/* 16 bits, mode 2 bits */

#define PIN_AFR_MASK(n)			(0xf<<(n*4))			/* 8 bits */
#define PIN_AFR(n,afr)			((afr&0xf)<<(n*4))		/* 8 bits, mode 4 bits */

#define GPIO_AF_GPIO			0						/* Alternate Function GPIO or Default */
#define GPIO_AF_USART1			GPIO_AF_1
#define GPIO_AF_USART2			GPIO_AF_1
#define GPIO_AF_USART4			GPIO_AF_4

/**
 ** PORT A
 */
#define	CARIBOU_PORTA_MODE		PIN_MODE(0,GPIO_Mode_AF) |		/* USART4_TX */ \
								PIN_MODE(1,GPIO_Mode_AF) |		/* USART4_RX */ \
								PIN_MODE(2,GPIO_Mode_AF) |		/* USART2_TX */ \
								PIN_MODE(3,GPIO_Mode_AF) |		/* USART2_RX */ \
								PIN_MODE(4,GPIO_Mode_IN) |		\
								PIN_MODE(5,GPIO_Mode_OUT) |		/* LD2 (Green LED) */ \
								PIN_MODE(6,GPIO_Mode_IN) |		\
								PIN_MODE(7,GPIO_Mode_IN) |		\
								PIN_MODE(8,GPIO_Mode_IN) |		\
								PIN_MODE(9,GPIO_Mode_IN) |		\
								PIN_MODE(10,GPIO_Mode_IN) |		\
								PIN_MODE(11,GPIO_Mode_IN) |		\
								PIN_MODE(12,GPIO_Mode_IN) |		\
								PIN_MODE(13,GPIO_Mode_AF) |		/* SWDIO */			\
								PIN_MODE(14,GPIO_Mode_AF) |		/* SWCLK */			\
								PIN_MODE(15,GPIO_Mode_IN)

#define	CARIBOU_PORTA_OTYPER	PIN_OTYPER(0,GPIO_OType_PP) |	\
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
								PIN_OTYPER(13,GPIO_OType_PP) |		/* SWDIO */		\
								PIN_OTYPER(14,GPIO_OType_PP) |		/* SWCLK */		\
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
								PIN_OSPEEDR(13,GPIO_Speed_10MHz) |	\
								PIN_OSPEEDR(14,GPIO_Speed_10MHz) |	\
								PIN_OSPEEDR(15,GPIO_Speed_2MHz)	

#define	CARIBOU_PORTA_PUPDR		PIN_PUPDR(0,GPIO_PuPd_NOPULL) |	 \
								PIN_PUPDR(1,GPIO_PuPd_NOPULL) |	 \
								PIN_PUPDR(2,GPIO_PuPd_NOPULL) |	 \
								PIN_PUPDR(3,GPIO_PuPd_NOPULL) |	 \
								PIN_PUPDR(4,GPIO_PuPd_NOPULL) |	 \
								PIN_PUPDR(5,GPIO_PuPd_NOPULL) |	 \
								PIN_PUPDR(6,GPIO_PuPd_NOPULL) |	 \
								PIN_PUPDR(7,GPIO_PuPd_NOPULL) |	 \
								PIN_PUPDR(8,GPIO_PuPd_NOPULL) |	 \
								PIN_PUPDR(9,GPIO_PuPd_NOPULL) |	 \
								PIN_PUPDR(10,GPIO_PuPd_NOPULL) | \
								PIN_PUPDR(11,GPIO_PuPd_NOPULL) | \
								PIN_PUPDR(12,GPIO_PuPd_NOPULL) | \
								PIN_PUPDR(13,GPIO_PuPd_UP) |	 /* SWDIO */			\
								PIN_PUPDR(14,GPIO_PuPd_DOWN) |	 /* SWCLK */			\
								PIN_PUPDR(15,GPIO_PuPd_NOPULL)

#define	CARIBOU_PORTA_AFRL		PIN_AFR(0,GPIO_AF_USART4) |		\
								PIN_AFR(1,GPIO_AF_USART4) |		\
								PIN_AFR(2,GPIO_AF_USART2) |		\
								PIN_AFR(3,GPIO_AF_USART2) |		\
								PIN_AFR(4,GPIO_AF_GPIO) |		\
								PIN_AFR(5,GPIO_AF_GPIO) |		\
								PIN_AFR(6,GPIO_AF_GPIO) |		\
								PIN_AFR(7,GPIO_AF_GPIO)					
#define	CARIBOU_PORTA_AFRH		PIN_AFR(0,GPIO_AF_GPIO) |		\
								PIN_AFR(1,GPIO_AF_GPIO) |		\
								PIN_AFR(2,GPIO_AF_GPIO) |		\
								PIN_AFR(3,GPIO_AF_GPIO) |		\
								PIN_AFR(4,GPIO_AF_GPIO) |		\
								PIN_AFR(5,GPIO_AF_0) |			/* JTMS/SWDIO */		\
								PIN_AFR(6,GPIO_AF_0) |			/* JTCK/SWCLK */		\
								PIN_AFR(7,GPIO_AF_GPIO)
/**
 ** PORT B
 */
#define	CARIBOU_PORTB_MODE		PIN_MODE(0,GPIO_Mode_IN) |	\
								PIN_MODE(1,GPIO_Mode_IN) |	\
								PIN_MODE(2,GPIO_Mode_IN) |	\
								PIN_MODE(3,GPIO_Mode_OUT) |	\
								PIN_MODE(4,GPIO_Mode_IN) |	\
								PIN_MODE(5,GPIO_Mode_IN) |	\
								PIN_MODE(6,GPIO_Mode_IN) |	\
								PIN_MODE(7,GPIO_Mode_IN) |	\
								PIN_MODE(8,GPIO_Mode_OUT) |		/* SCL */ \
								PIN_MODE(9,GPIO_Mode_OUT) |		/* SDA */ \
								PIN_MODE(10,GPIO_Mode_IN) |	\
								PIN_MODE(11,GPIO_Mode_IN) | \
								PIN_MODE(12,GPIO_Mode_IN) | \
								PIN_MODE(13,GPIO_Mode_IN) |	\
								PIN_MODE(14,GPIO_Mode_IN) |	\
								PIN_MODE(15,GPIO_Mode_IN)

#define	CARIBOU_PORTB_OTYPER	PIN_OTYPER(0,GPIO_OType_PP) |	\
								PIN_OTYPER(1,GPIO_OType_PP) |	\
								PIN_OTYPER(2,GPIO_OType_PP) |	\
								PIN_OTYPER(3,GPIO_OType_PP) |	\
								PIN_OTYPER(4,GPIO_OType_PP) |	\
								PIN_OTYPER(5,GPIO_OType_PP) |	\
								PIN_OTYPER(6,GPIO_OType_PP) |	\
								PIN_OTYPER(7,GPIO_OType_PP) |	\
								PIN_OTYPER(8,GPIO_OType_OD) |	\
								PIN_OTYPER(9,GPIO_OType_OD) |	\
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

#define	CARIBOU_PORTB_PUPDR		PIN_PUPDR(0,GPIO_PuPd_NOPULL) |		\
								PIN_PUPDR(1,GPIO_PuPd_NOPULL) |		\
								PIN_PUPDR(2,GPIO_PuPd_NOPULL) |		\
								PIN_PUPDR(3,GPIO_PuPd_NOPULL) |		\
								PIN_PUPDR(4,GPIO_PuPd_NOPULL) |		\
								PIN_PUPDR(5,GPIO_PuPd_NOPULL) |		\
								PIN_PUPDR(6,GPIO_PuPd_NOPULL) |		\
								PIN_PUPDR(7,GPIO_PuPd_NOPULL) |		\
								PIN_PUPDR(8,GPIO_PuPd_UP) |			\
								PIN_PUPDR(9,GPIO_PuPd_UP) |			\
								PIN_PUPDR(10,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(11,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(12,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(13,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(14,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(15,GPIO_PuPd_NOPULL)

#define	CARIBOU_PORTB_AFRL		PIN_AFR(0,GPIO_AF_GPIO) |	\
								PIN_AFR(1,GPIO_AF_GPIO) |	\
								PIN_AFR(2,GPIO_AF_GPIO) |	\
								PIN_AFR(3,GPIO_AF_GPIO) |	\
								PIN_AFR(4,GPIO_AF_GPIO) |	\
								PIN_AFR(5,GPIO_AF_GPIO) |	\
								PIN_AFR(6,GPIO_AF_GPIO) |	\
								PIN_AFR(7,GPIO_AF_GPIO)
#define	CARIBOU_PORTB_AFRH		PIN_AFR(0,GPIO_AF_GPIO) |	\
								PIN_AFR(1,GPIO_AF_GPIO) |	\
								PIN_AFR(2,GPIO_AF_GPIO) |	\
								PIN_AFR(3,GPIO_AF_GPIO) |	\
								PIN_AFR(4,GPIO_AF_GPIO) |	\
								PIN_AFR(5,GPIO_AF_GPIO) |	\
								PIN_AFR(6,GPIO_AF_GPIO) |	\
								PIN_AFR(7,GPIO_AF_GPIO)


/**
 ** PORT C
 */
#define	CARIBOU_PORTC_MODE		PIN_MODE(0,GPIO_Mode_IN) |	\
								PIN_MODE(1,GPIO_Mode_IN) |	\
								PIN_MODE(2,GPIO_Mode_IN) |	\
								PIN_MODE(3,GPIO_Mode_IN) |	\
								PIN_MODE(4,GPIO_Mode_IN) |	\
								PIN_MODE(5,GPIO_Mode_IN) |	\
								PIN_MODE(6,GPIO_Mode_IN) |	\
								PIN_MODE(7,GPIO_Mode_IN) |	\
								PIN_MODE(8,GPIO_Mode_IN) |	\
								PIN_MODE(9,GPIO_Mode_IN) |	\
								PIN_MODE(10,GPIO_Mode_IN) |	\
								PIN_MODE(11,GPIO_Mode_IN) |	\
								PIN_MODE(12,GPIO_Mode_IN) | \
								PIN_MODE(13,GPIO_Mode_IN) |			/* B1 (USER BUTTON) */	\
								PIN_MODE(14,GPIO_Mode_IN) | \
								PIN_MODE(15,GPIO_Mode_IN)

#define	CARIBOU_PORTC_OTYPER	PIN_OTYPER(0,GPIO_OType_PP) |	\
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

#define	CARIBOU_PORTC_PUPDR		PIN_PUPDR(0,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(1,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(2,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(3,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(4,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(5,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(6,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(7,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(8,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(9,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(10,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(11,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(12,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(13,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(14,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(15,GPIO_PuPd_NOPULL)

#define	CARIBOU_PORTC_AFRL		PIN_AFR(0,GPIO_AF_GPIO) |	\
								PIN_AFR(1,GPIO_AF_GPIO) |	\
								PIN_AFR(2,GPIO_AF_GPIO) |	\
								PIN_AFR(3,GPIO_AF_GPIO) |	\
								PIN_AFR(4,GPIO_AF_GPIO) |	\
								PIN_AFR(5,GPIO_AF_GPIO) |	\
								PIN_AFR(6,GPIO_AF_GPIO) |	\
								PIN_AFR(7,GPIO_AF_GPIO)
#define	CARIBOU_PORTC_AFRH		PIN_AFR(0,GPIO_AF_GPIO) |	\
								PIN_AFR(1,GPIO_AF_GPIO) |	\
								PIN_AFR(2,GPIO_AF_GPIO) |	\
								PIN_AFR(3,GPIO_AF_GPIO) |	\
								PIN_AFR(4,GPIO_AF_GPIO) |	\
								PIN_AFR(5,GPIO_AF_GPIO) |	\
								PIN_AFR(6,GPIO_AF_GPIO) |	\
								PIN_AFR(7,GPIO_AF_GPIO)
/**
 ** PORT D
 */
#define	CARIBOU_PORTD_MODE		PIN_MODE(0,GPIO_Mode_IN) |	\
								PIN_MODE(1,GPIO_Mode_IN) |	\
								PIN_MODE(2,GPIO_Mode_IN) |	\
								PIN_MODE(3,GPIO_Mode_IN) |	\
								PIN_MODE(4,GPIO_Mode_IN) |	\
								PIN_MODE(5,GPIO_Mode_IN) |	\
								PIN_MODE(6,GPIO_Mode_IN) |	\
								PIN_MODE(7,GPIO_Mode_IN) |	\
								PIN_MODE(8,GPIO_Mode_IN) |	\
								PIN_MODE(9,GPIO_Mode_IN) |	\
								PIN_MODE(10,GPIO_Mode_IN) | \
								PIN_MODE(11,GPIO_Mode_IN) | \
								PIN_MODE(12,GPIO_Mode_IN) | \
								PIN_MODE(13,GPIO_Mode_IN) | \
								PIN_MODE(14,GPIO_Mode_IN) | \
								PIN_MODE(15,GPIO_Mode_IN)

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

#define	CARIBOU_PORTD_OSPEEDR	PIN_OSPEEDR(0,GPIO_Speed_2MHz) |	\
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

#define	CARIBOU_PORTD_PUPDR		PIN_PUPDR(0,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(1,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(2,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(3,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(4,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(5,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(6,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(7,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(8,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(9,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(10,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(11,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(12,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(13,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(14,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(15,GPIO_PuPd_NOPULL)

#define	CARIBOU_PORTD_AFRL		PIN_AFR(0,GPIO_AF_GPIO) |	\
								PIN_AFR(1,GPIO_AF_GPIO) |	\
								PIN_AFR(2,GPIO_AF_GPIO) |	\
								PIN_AFR(3,GPIO_AF_GPIO) |	\
								PIN_AFR(4,GPIO_AF_GPIO) |	\
								PIN_AFR(5,GPIO_AF_GPIO) |	\
								PIN_AFR(6,GPIO_AF_GPIO) |	\
								PIN_AFR(7,GPIO_AF_GPIO)
#define	CARIBOU_PORTD_AFRH		PIN_AFR(0,GPIO_AF_GPIO) |	\
								PIN_AFR(1,GPIO_AF_GPIO) |	\
								PIN_AFR(2,GPIO_AF_GPIO) |	\
								PIN_AFR(3,GPIO_AF_GPIO) |	\
								PIN_AFR(4,GPIO_AF_GPIO) |	\
								PIN_AFR(5,GPIO_AF_GPIO) |	\
								PIN_AFR(6,GPIO_AF_GPIO) |	\
								PIN_AFR(7,GPIO_AF_GPIO)
/**
 ** PORT F
 */
#define	CARIBOU_PORTF_MODE		PIN_MODE(0,GPIO_Mode_IN) |	\
								PIN_MODE(1,GPIO_Mode_IN) |	\
								PIN_MODE(2,GPIO_Mode_IN) |	\
								PIN_MODE(3,GPIO_Mode_IN) |	\
								PIN_MODE(4,GPIO_Mode_IN) |	\
								PIN_MODE(5,GPIO_Mode_IN) |	\
								PIN_MODE(6,GPIO_Mode_IN) |	\
								PIN_MODE(7,GPIO_Mode_IN) |	\
								PIN_MODE(8,GPIO_Mode_IN) |	\
								PIN_MODE(9,GPIO_Mode_IN) |	\
								PIN_MODE(10,GPIO_Mode_IN) | \
								PIN_MODE(11,GPIO_Mode_IN) | \
								PIN_MODE(12,GPIO_Mode_IN) | \
								PIN_MODE(13,GPIO_Mode_IN) | \
								PIN_MODE(14,GPIO_Mode_IN) | \
								PIN_MODE(15,GPIO_Mode_IN)

#define	CARIBOU_PORTF_OTYPER	PIN_OTYPER(0,GPIO_OType_PP) |	\
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

#define	CARIBOU_PORTF_OSPEEDR	PIN_OSPEEDR(0,GPIO_Speed_2MHz) |	\
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

#define	CARIBOU_PORTF_PUPDR		PIN_PUPDR(0,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(1,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(2,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(3,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(4,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(5,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(6,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(7,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(8,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(9,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(10,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(11,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(12,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(13,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(14,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(15,GPIO_PuPd_NOPULL)

#define	CARIBOU_PORTF_AFRL		PIN_AFR(0,GPIO_AF_GPIO) |	\
								PIN_AFR(1,GPIO_AF_GPIO) |	\
								PIN_AFR(2,GPIO_AF_GPIO) |	\
								PIN_AFR(3,GPIO_AF_GPIO) |	\
								PIN_AFR(4,GPIO_AF_GPIO) |	\
								PIN_AFR(5,GPIO_AF_GPIO) |	\
								PIN_AFR(6,GPIO_AF_GPIO) |	\
								PIN_AFR(7,GPIO_AF_GPIO)
#define	CARIBOU_PORTF_AFRH		PIN_AFR(0,GPIO_AF_GPIO) |	\
								PIN_AFR(1,GPIO_AF_GPIO) |	\
								PIN_AFR(2,GPIO_AF_GPIO) |	\
								PIN_AFR(3,GPIO_AF_GPIO) |	\
								PIN_AFR(4,GPIO_AF_GPIO) |	\
								PIN_AFR(5,GPIO_AF_GPIO) |	\
								PIN_AFR(6,GPIO_AF_GPIO) |	\
								PIN_AFR(7,GPIO_AF_GPIO)


extern void hw_pin_setup( void );


#endif
