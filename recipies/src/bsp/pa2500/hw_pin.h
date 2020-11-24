#ifndef _HW_PIN_H_
#define _HW_PIN_H_

#include <board.h>

#ifdef __cplusplus
extern "C"
{
#endif

/*********************************************/

typedef enum
{
  GPIO_Mode_IN   = 0x00, /*!< GPIO Input Mode              */
  GPIO_Mode_OUT  = 0x01, /*!< GPIO Output Mode             */
  GPIO_Mode_AF   = 0x02, /*!< GPIO Alternate function Mode */
  GPIO_Mode_AN   = 0x03  /*!< GPIO Analog In/Out Mode      */
} GPIOMode_TypeDef;

// #define IS_GPIO_MODE(MODE) (((MODE) == GPIO_Mode_IN)|| ((MODE) == GPIO_Mode_OUT) || ((MODE) == GPIO_Mode_AF)|| ((MODE) == GPIO_Mode_AN))
typedef enum
{
  GPIO_OType_PP = 0x00,
  GPIO_OType_OD = 0x01
} GPIOOType_TypeDef;

#define IS_GPIO_OTYPE(OTYPE) (((OTYPE) == GPIO_OType_PP) || ((OTYPE) == GPIO_OType_OD))

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
#define GPIO_AF_USART1			GPIO_AF7_USART1
#define GPIO_AF_USART2			GPIO_AF7_USART2
#define GPIO_AF_USART3 			GPIO_AF7_USART3
#define GPIO_AF_SPI1			GPIO_AF5_SPI1
#define GPIO_AF_SPI2			GPIO_AF5_SPI2
#define GPIO_AF_LPTIM1 			GPIO_AF1_LPTIM1
#define GPIO_AF_LPTIM2			GPIO_AF14_LPTIM2
#define GPIO_AF_TIM1			GPIO_AF1_TIM1
#define GPIO_AF_CAN1			GPIO_AF9_CAN1

/**
 ** PORT A
 */
#define	CARIBOU_PORTA_MODE		PIN_MODE(0,GPIO_Mode_IN) |			/* ~ETH_WOL */		\
								PIN_MODE(1,GPIO_Mode_OUT) |			/* SRAM_WP */		\
								PIN_MODE(2,GPIO_Mode_AF) |			/* DEBUG_TX */		\
								PIN_MODE(3,GPIO_Mode_AF) |			/* DEBUG_RX */		\
								PIN_MODE(4,GPIO_Mode_OUT) |			/* ETH_NSS */		\
								PIN_MODE(5,GPIO_Mode_AF) |			/* ETH_SCK */		\
								PIN_MODE(6,GPIO_Mode_AF) |			/* ETH_MISO */		\
								PIN_MODE(7,GPIO_Mode_AF) |			/* ETH_MOSI */		\
								PIN_MODE(8,GPIO_Mode_OUT) |			/* ~SRAM_HOLD */	\
								PIN_MODE(9,GPIO_Mode_AF) |			/* UART_TX */		\
								PIN_MODE(10,GPIO_Mode_AF) |			/* UART_RX */		\
								PIN_MODE(11,GPIO_Mode_IN) |			/* UART_CTS */		\
								PIN_MODE(12,GPIO_Mode_OUT) |		/* UART_RTS */		\
								PIN_MODE(13,GPIO_Mode_AF) |			/* SWDIO */			\
								PIN_MODE(14,GPIO_Mode_AF) |			/* SWCLK */			\
								PIN_MODE(15,GPIO_Mode_OUT)			/* ~ETH_RESET */

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
								PIN_OTYPER(15,GPIO_OType_OD)		

#define	CARIBOU_PORTA_OSPEEDR	PIN_OSPEEDR(0,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(1,GPIO_SPEED_FREQ_MEDIUM) |	\
								PIN_OSPEEDR(2,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(3,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(4,GPIO_SPEED_FREQ_HIGH) |	\
								PIN_OSPEEDR(5,GPIO_SPEED_FREQ_HIGH) |	\
								PIN_OSPEEDR(6,GPIO_SPEED_FREQ_HIGH) |	\
								PIN_OSPEEDR(7,GPIO_SPEED_FREQ_HIGH) |	\
								PIN_OSPEEDR(8,GPIO_SPEED_FREQ_MEDIUM) |	\
								PIN_OSPEEDR(9,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(10,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(11,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(12,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(13,GPIO_SPEED_FREQ_HIGH) |	\
								PIN_OSPEEDR(14,GPIO_SPEED_FREQ_HIGH) |	\
								PIN_OSPEEDR(15,GPIO_SPEED_FREQ_MEDIUM)	

#define	CARIBOU_PORTA_PUPDR		PIN_PUPDR(0,GPIO_PULLUP) |			\
								PIN_PUPDR(1,GPIO_NOPULL) |			\
								PIN_PUPDR(2,GPIO_NOPULL) |			\
								PIN_PUPDR(3,GPIO_NOPULL) |			\
								PIN_PUPDR(4,GPIO_NOPULL) |			\
								PIN_PUPDR(5,GPIO_NOPULL) |			\
								PIN_PUPDR(6,GPIO_PULLDOWN) |		\
								PIN_PUPDR(7,GPIO_NOPULL) |			\
								PIN_PUPDR(8,GPIO_NOPULL) |			\
								PIN_PUPDR(9,GPIO_NOPULL) |			\
								PIN_PUPDR(10,GPIO_PULLUP) |			\
								PIN_PUPDR(11,GPIO_NOPULL) |			\
								PIN_PUPDR(12,GPIO_NOPULL) |			\
								PIN_PUPDR(13,GPIO_PULLUP) |			\
								PIN_PUPDR(14,GPIO_PULLDOWN) |		\
								PIN_PUPDR(15,GPIO_PULLUP)			

#define	CARIBOU_PORTA_AFRL		PIN_AFR(0,GPIO_AF_GPIO) |			\
								PIN_AFR(1,GPIO_AF_GPIO) |			\
								PIN_AFR(2,GPIO_AF_USART2) |			\
								PIN_AFR(3,GPIO_AF_USART2) |			\
								PIN_AFR(4,GPIO_AF_GPIO) |			\
								PIN_AFR(5,GPIO_AF_SPI1) |			\
								PIN_AFR(6,GPIO_AF_SPI1) |			\
								PIN_AFR(7,GPIO_AF_SPI1)			
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
#define	CARIBOU_PORTB_MODE		PIN_MODE(0,GPIO_Mode_OUT) |			/* STATUS */		\
								PIN_MODE(1,GPIO_Mode_IN) |			/* ~INIT */			\
								PIN_MODE(2,GPIO_Mode_AF) |			/* GPIO0 (LPTIM1_OUT)*/			\
								PIN_MODE(3,GPIO_Mode_OUT) |			/* EEPROM_WP */		\
								PIN_MODE(4,GPIO_Mode_IN) |			/* ~ETH_INT */		\
								PIN_MODE(5,GPIO_Mode_OUT) |			/* DS18B20 */		\
								PIN_MODE(6,GPIO_Mode_OUT) |			/* EEPROM_SCL */	\
								PIN_MODE(7,GPIO_Mode_OUT) |			/* EEPROM_SDA */	\
								PIN_MODE(8,GPIO_Mode_IN) |			/* CAN1_RX */		\
								PIN_MODE(9,GPIO_Mode_IN) |			/* CAN1_TX */		\
								PIN_MODE(10,GPIO_Mode_AF) |			/* USART3_TX: DEBUG_TXD */	\
								PIN_MODE(11,GPIO_Mode_AF) |			/* USART3_RX: DEBUG_RXD */	\
								PIN_MODE(12,GPIO_Mode_OUT) |		/* ~SRAM_CS */		\
								PIN_MODE(13,GPIO_Mode_AF) |			/* SRAM_SCK */		\
								PIN_MODE(14,GPIO_Mode_AF) |			/* SRAM_MISO */		\
								PIN_MODE(15,GPIO_Mode_AF)			/* SRAM_MOSI */

#define	CARIBOU_PORTB_OTYPER	PIN_OTYPER(0,GPIO_OType_PP) |		\
								PIN_OTYPER(1,GPIO_OType_PP) |		\
								PIN_OTYPER(2,GPIO_OType_PP) |		\
								PIN_OTYPER(3,GPIO_OType_PP) |		\
								PIN_OTYPER(4,GPIO_OType_PP) |		\
								PIN_OTYPER(5,GPIO_OType_OD) |		\
								PIN_OTYPER(6,GPIO_OType_OD) |		\
								PIN_OTYPER(7,GPIO_OType_OD) |		\
								PIN_OTYPER(8,GPIO_OType_PP) |		\
								PIN_OTYPER(9,GPIO_OType_PP) |		\
								PIN_OTYPER(10,GPIO_OType_PP) |		\
								PIN_OTYPER(11,GPIO_OType_PP) |		\
								PIN_OTYPER(12,GPIO_OType_PP) |		\
								PIN_OTYPER(13,GPIO_OType_PP) |		\
								PIN_OTYPER(14,GPIO_OType_PP) |		\
								PIN_OTYPER(15,GPIO_OType_PP)		

#define	CARIBOU_PORTB_OSPEEDR	PIN_OSPEEDR(0,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(1,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(2,GPIO_SPEED_FREQ_MEDIUM) |	\
								PIN_OSPEEDR(3,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(4,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(5,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(6,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(7,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(8,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(9,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(10,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(11,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(12,GPIO_SPEED_FREQ_MEDIUM) |	\
								PIN_OSPEEDR(13,GPIO_SPEED_FREQ_HIGH) |	\
								PIN_OSPEEDR(14,GPIO_SPEED_FREQ_HIGH) |	\
								PIN_OSPEEDR(15,GPIO_SPEED_FREQ_HIGH)	

#define	CARIBOU_PORTB_PUPDR		PIN_PUPDR(0,GPIO_NOPULL) |			\
								PIN_PUPDR(1,GPIO_PULLUP) |			\
								PIN_PUPDR(2,GPIO_NOPULL) |			\
								PIN_PUPDR(3,GPIO_NOPULL) |			\
								PIN_PUPDR(4,GPIO_PULLUP) |			\
								PIN_PUPDR(5,GPIO_PULLUP) |			\
								PIN_PUPDR(6,GPIO_PULLUP) |			\
								PIN_PUPDR(7,GPIO_PULLUP) |			\
								PIN_PUPDR(8,GPIO_NOPULL) |			\
								PIN_PUPDR(9,GPIO_NOPULL) |			\
								PIN_PUPDR(10,GPIO_NOPULL) |			\
								PIN_PUPDR(11,GPIO_NOPULL) |			\
								PIN_PUPDR(12,GPIO_NOPULL) |			\
								PIN_PUPDR(13,GPIO_NOPULL) |			\
								PIN_PUPDR(14,GPIO_NOPULL) |			\
								PIN_PUPDR(15,GPIO_NOPULL)			

#define	CARIBOU_PORTB_AFRL		PIN_AFR(0,GPIO_AF_GPIO) |			\
								PIN_AFR(1,GPIO_AF_GPIO) |			\
								PIN_AFR(2,GPIO_AF_LPTIM1) |			\
								PIN_AFR(3,GPIO_AF_GPIO) |			\
								PIN_AFR(4,GPIO_AF_GPIO) |			\
								PIN_AFR(5,GPIO_AF_GPIO) |			\
								PIN_AFR(6,GPIO_AF_GPIO) |			\
								PIN_AFR(7,GPIO_AF_GPIO)				
#define	CARIBOU_PORTB_AFRH		PIN_AFR(0,GPIO_AF_GPIO) |			\
								PIN_AFR(1,GPIO_AF_GPIO) |			\
								PIN_AFR(2,GPIO_AF_USART3) |			\
								PIN_AFR(3,GPIO_AF_USART3) |			\
								PIN_AFR(4,GPIO_AF_GPIO) |			\
								PIN_AFR(5,GPIO_AF_SPI2) |			\
								PIN_AFR(6,GPIO_AF_SPI2) |			\
								PIN_AFR(7,GPIO_AF_SPI2)				

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
								PIN_MODE(10,GPIO_Mode_IN) | \
								PIN_MODE(11,GPIO_Mode_IN) | \
								PIN_MODE(12,GPIO_Mode_IN) | \
								PIN_MODE(13,GPIO_Mode_IN) | 		/* GPIO1 */			\
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

#define	CARIBOU_PORTC_OSPEEDR	PIN_OSPEEDR(0,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(1,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(2,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(3,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(4,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(5,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(6,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(7,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(8,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(9,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(10,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(11,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(12,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(13,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(14,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(15,GPIO_SPEED_FREQ_LOW)

#define	CARIBOU_PORTC_PUPDR		PIN_PUPDR(0,GPIO_NOPULL) |	\
								PIN_PUPDR(1,GPIO_NOPULL) |	\
								PIN_PUPDR(2,GPIO_NOPULL) |	\
								PIN_PUPDR(3,GPIO_NOPULL) |	\
								PIN_PUPDR(4,GPIO_NOPULL) |	\
								PIN_PUPDR(5,GPIO_NOPULL) |	\
								PIN_PUPDR(6,GPIO_NOPULL) |	\
								PIN_PUPDR(7,GPIO_NOPULL) |	\
								PIN_PUPDR(8,GPIO_NOPULL) |	\
								PIN_PUPDR(9,GPIO_NOPULL) |	\
								PIN_PUPDR(10,GPIO_NOPULL) |	\
								PIN_PUPDR(11,GPIO_NOPULL) |	\
								PIN_PUPDR(12,GPIO_NOPULL) |	\
								PIN_PUPDR(13,GPIO_PULLDOWN) |	\
								PIN_PUPDR(14,GPIO_PULLDOWN) |	\
								PIN_PUPDR(15,GPIO_PULLDOWN)

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
 ** PORT H
 */
#define	CARIBOU_PORTH_MODE		PIN_MODE(0,GPIO_Mode_IN) |	\
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

#define	CARIBOU_PORTH_OSPEEDR	PIN_OSPEEDR(0,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(1,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(2,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(3,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(4,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(5,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(6,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(7,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(8,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(9,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(10,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(11,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(12,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(13,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(14,GPIO_SPEED_FREQ_LOW) |	\
								PIN_OSPEEDR(15,GPIO_SPEED_FREQ_LOW)

#define	CARIBOU_PORTH_PUPDR		PIN_PUPDR(0,GPIO_PULLDOWN) |	\
								PIN_PUPDR(1,GPIO_PULLDOWN) |	\
								PIN_PUPDR(2,GPIO_PULLDOWN) |	\
								PIN_PUPDR(3,GPIO_PULLDOWN) |	\
								PIN_PUPDR(4,GPIO_PULLDOWN) |	\
								PIN_PUPDR(5,GPIO_PULLDOWN) |	\
								PIN_PUPDR(6,GPIO_PULLDOWN) |	\
								PIN_PUPDR(7,GPIO_PULLDOWN) |	\
								PIN_PUPDR(8,GPIO_PULLDOWN) |	\
								PIN_PUPDR(9,GPIO_PULLDOWN) |	\
								PIN_PUPDR(10,GPIO_PULLDOWN) |	\
								PIN_PUPDR(11,GPIO_PULLDOWN) |	\
								PIN_PUPDR(12,GPIO_PULLDOWN) |	\
								PIN_PUPDR(13,GPIO_PULLDOWN) |	\
								PIN_PUPDR(14,GPIO_PULLDOWN) |	\
								PIN_PUPDR(15,GPIO_PULLDOWN)

#define	CARIBOU_PORTH_AFRL		PIN_AFR(0,GPIO_AF_GPIO) |	\
								PIN_AFR(1,GPIO_AF_GPIO) |	\
								PIN_AFR(2,GPIO_AF_GPIO) |	\
								PIN_AFR(3,GPIO_AF_GPIO) |	\
								PIN_AFR(4,GPIO_AF_GPIO) |	\
								PIN_AFR(5,GPIO_AF_GPIO) |	\
								PIN_AFR(6,GPIO_AF_GPIO) |	\
								PIN_AFR(7,GPIO_AF_GPIO)
#define	CARIBOU_PORTH_AFRH		PIN_AFR(0,GPIO_AF_GPIO) |	\
								PIN_AFR(1,GPIO_AF_GPIO) |	\
								PIN_AFR(2,GPIO_AF_GPIO) |	\
								PIN_AFR(3,GPIO_AF_GPIO) |	\
								PIN_AFR(4,GPIO_AF_GPIO) |	\
								PIN_AFR(5,GPIO_AF_GPIO) |	\
								PIN_AFR(6,GPIO_AF_GPIO) |	\
								PIN_AFR(7,GPIO_AF_GPIO)



extern void hw_pin_setup( void );

#ifdef __cplusplus
}
#endif

#endif
