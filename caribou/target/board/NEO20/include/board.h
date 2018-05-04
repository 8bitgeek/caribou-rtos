/******************************************************************************
* Copyright © 2005-2013 by Pike Aerospace Research Corporation
* All Rights Reserved
*
*   This file is part of CARIBOU RTOS
*
*   CARIBOU RTOS is free software: you can redistribute it and/or modify
*   it under the terms of the Beerware License Version 43.
*
* ----------------------------------------------------------------------------
* "THE BEER-WARE LICENSE" (Revision 43):
* <mike@pikeaero.com> wrote this file. As long as you retain this notice you
* can do whatever you want with this stuff. If we meet some day, and you think
* this stuff is worth it, you can buy me a beer in return ~ Mike Sharkey
* ----------------------------------------------------------------------------
******************************************************************************/
#ifndef _CARIBOU_BOARD_H_
#define _CARIBOU_BOARD_H_

#include <caribou.h>
#include <caribou/dev/gpio.h>
#include <chip/chip.h>
#include <netconf.h>
#include <stm32f4xx_dma.h>

#ifdef __cplusplus
extern "C" {
#endif

#define CONSOLE_USART			2						/* UART table offset */
#define	SPI_MMC					SPI2					/* The SPI port that is running the MMC card */
#define SPI_MMC_TX_DMA_STREAM	DMA1_Stream4
#define SPI_MMC_RX_DMA_STREAM	DMA1_Stream4
#define SPI_MMC_TX_DMA_CHANNEL	DMA_Channel_0
#define SPI_MMC_RX_DMA_CHANNEL	DMA_Channel_0
#define SPI_MMC_BUFFERSIZE		512

typedef struct
{
	uint16_t	phyAddress;
	uint32_t	ethInitStatus;
	uint8_t		ethLinkStatus;
} network_interface_t;

extern volatile network_interface_t network_interface;

extern caribou_gpio_t led1;
extern caribou_gpio_t led2;
extern caribou_gpio_t led3;
extern caribou_gpio_t led4;

/* Ethernet pins configuration ************************************************/
   /*
        ETH_MII_RX_CLK/ETH_RMII_REF_CLK---> PA1		**
        ETH_MDIO -------------------------> PA2		**
        ETH_MII_RX_DV/ETH_RMII_CRS_DV ----> PA7		**

        ETH_MDC --------------------------> PC1		**
        ETH_PWR_DOWN/INT -----------------> PC2		**	
        ETH_MII_RXD0/ETH_RMII_RXD0 -------> PC4		**
        ETH_MII_RXD1/ETH_RMII_RXD1 -------> PC5		**

		<< ETH_MII_TX_EN/ETH_RMII_TX_EN -----> PG11	**
		>> ETH_MII_TX_EN/ETH_RMII_TX_EN -----> PB11	**

        ETH_MII_TXD0/ETH_RMII_TXD0 -------> PG13	**
        ETH_MII_TXD1/ETH_RMII_TXD1 -------> PG14	**

------------------------------------------------------
        ETH_PPS_OUT ----------------------> PB5
        ETH_MII_CRS ----------------------> PH2		
        ETH_MII_COL ----------------------> PH3
        ETH_MII_RX_ER --------------------> PI10
        ETH_MII_RXD2 ---------------------> PH6
        ETH_MII_RXD3 ---------------------> PH7
        ETH_MII_TX_CLK -------------------> PC3
        ETH_MII_TXD2 ---------------------> PC2
        ETH_MII_TXD3 ---------------------> PB8
 	*/

/* Exported types ------------------------------------------------------------*/
/* Exported constants --------------------------------------------------------*/
#define DP83848_PHY_ADDRESS       0x01 /* Relative to STM324xG-EVAL Board */

/* Specific defines for EXTI line, used to manage Ethernet link status */
#define ETH_LINK_EXTI_LINE				EXTI_Line1
#define ETH_LINK_EXTI_PORT_SOURCE		EXTI_PortSourceGPIOE
#define ETH_LINK_EXTI_PIN_SOURCE		EXTI_PinSource1
#define ETH_LINK_EXTI_IRQn				EXTI1_IRQn 
/* PC2 - DP83848I PHY PWR_DOWN/INT */
#define ETH_LINK_PIN					GPIO_Pin_1
#define ETH_LINK_GPIO_PORT				GPIOE
#define ETH_LINK_GPIO_CLK				RCC_AHB1Periph_GPIOE
/* PHY registers */
#define PHY_MICR						0x11				/* MII Interrupt Control Register */
#define PHY_MICR_INT_EN					((uint16_t)0x0002)	/* PHY Enable interrupts */
#define PHY_MICR_INT_OE					((uint16_t)0x0001)	/* PHY Enable output interrupt events */
#define PHY_MISR						0x12				/* MII Interrupt Status and Misc. Control Register */
#define PHY_MISR_LINK_INT_EN			((uint16_t)0x0020)	/* Enable Interrupt on change of link status */
#define PHY_LINK_STATUS					((uint16_t)0x2000)	/* PHY link status interrupt mask */

/*********************************************/

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

/**
 ** PORT A
 */
#define	CARIBOU_PORTA_MODE		PIN_MODE(0,GPIO_Mode_IN) |	\
								PIN_MODE(1,GPIO_Mode_AF) |			/* ETH_MII_RX_CLK/ETH_RMII_REF_CLK---> PA1 */	\
								PIN_MODE(2,GPIO_Mode_AF) |			/* ETH_MDIO -------------------------> PA2 */	\
								PIN_MODE(3,GPIO_Mode_IN) |	\
								PIN_MODE(4,GPIO_Mode_IN) |	\
								PIN_MODE(5,GPIO_Mode_IN) |	\
								PIN_MODE(6,GPIO_Mode_IN) |	\
								PIN_MODE(7,GPIO_Mode_AF) |			/* ETH_MII_RX_DV/ETH_RMII_CRS_DV ----> PA7 */	\
								PIN_MODE(8,GPIO_Mode_IN) |	\
								PIN_MODE(9,GPIO_Mode_IN) |	\
								PIN_MODE(10,GPIO_Mode_IN) | \
								PIN_MODE(11,GPIO_Mode_IN) | \
								PIN_MODE(12,GPIO_Mode_IN) | \
								PIN_MODE(13,GPIO_Mode_AF) |			/* JTMS/SWDIO */		\
								PIN_MODE(14,GPIO_Mode_AF) |			/* JTCK/SWCLK */		\
								PIN_MODE(15,GPIO_Mode_AF)			/* JTDI */

#define	CARIBOU_PORTA_OTYPER	PIN_OTYPER(0,GPIO_OType_PP) |	\
								PIN_OTYPER(1,GPIO_OType_PP) |		/* ETH_MII_RX_CLK/ETH_RMII_REF_CLK---> PA1 */	\
								PIN_OTYPER(2,GPIO_OType_PP) |		/* ETH_MDIO -------------------------> PA2 */	\
								PIN_OTYPER(3,GPIO_OType_PP) |	\
								PIN_OTYPER(4,GPIO_OType_PP) |	\
								PIN_OTYPER(5,GPIO_OType_PP) |	\
								PIN_OTYPER(6,GPIO_OType_PP) |	\
								PIN_OTYPER(7,GPIO_OType_PP) |		/* ETH_MII_RX_DV/ETH_RMII_CRS_DV ----> PA7 */	\
								PIN_OTYPER(8,GPIO_OType_PP) |	\
								PIN_OTYPER(9,GPIO_OType_PP) |	\
								PIN_OTYPER(10,GPIO_OType_PP) |	\
								PIN_OTYPER(11,GPIO_OType_PP) |	\
								PIN_OTYPER(12,GPIO_OType_PP) |	\
								PIN_OTYPER(13,GPIO_OType_PP) |		/* JTMS/SWDIO */		\
								PIN_OTYPER(14,GPIO_OType_PP) |		/* JTCK/SWCLK */		\
								PIN_OTYPER(15,GPIO_OType_PP)		/* JTDI */

#define	CARIBOU_PORTA_OSPEEDR	PIN_OSPEEDR(0,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(1,GPIO_Speed_100MHz) |	/* ETH_MII_RX_CLK/ETH_RMII_REF_CLK---> PA1 */	\
								PIN_OSPEEDR(2,GPIO_Speed_100MHz) |	/* ETH_MDIO -------------------------> PA2 */	\
								PIN_OSPEEDR(3,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(4,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(5,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(6,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(7,GPIO_Speed_100MHz) |	/* ETH_MII_RX_DV/ETH_RMII_CRS_DV ----> PA7 */	\
								PIN_OSPEEDR(8,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(9,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(10,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(11,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(12,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(13,GPIO_Speed_2MHz) |	/* JTMS/SWDIO */		\
								PIN_OSPEEDR(14,GPIO_Speed_2MHz) |	/* JTCK/SWCLK */		\
								PIN_OSPEEDR(15,GPIO_Speed_2MHz)		/* JTDI */

#define	CARIBOU_PORTA_PUPDR		PIN_PUPDR(0,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(1,GPIO_PuPd_NOPULL) |		/* ETH_MII_RX_CLK/ETH_RMII_REF_CLK---> PA1 */	\
								PIN_PUPDR(2,GPIO_PuPd_NOPULL) |		/* ETH_MDIO -------------------------> PA2 */	\
								PIN_PUPDR(3,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(4,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(5,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(6,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(7,GPIO_PuPd_NOPULL) |		/* ETH_MII_RX_DV/ETH_RMII_CRS_DV ----> PA7 */	\
								PIN_PUPDR(8,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(9,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(10,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(11,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(12,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(13,GPIO_PuPd_UP) |		/* JTMS/SWDIO */		\
								PIN_PUPDR(14,GPIO_PuPd_DOWN) |		/* JTCK/SWCLK */		\
								PIN_PUPDR(15,GPIO_PuPd_UP)			/* JTDI */

#define	CARIBOU_PORTA_AFRL		PIN_AFR(0,GPIO_AF_GPIO) |	\
								PIN_AFR(1,GPIO_AF_ETH) |			/* ETH_MII_RX_CLK/ETH_RMII_REF_CLK---> PA1 */	\
								PIN_AFR(2,GPIO_AF_ETH) |			/* ETH_MDIO -------------------------> PA2 */	\
								PIN_AFR(3,GPIO_AF_GPIO) |	\
								PIN_AFR(4,GPIO_AF_GPIO) |	\
								PIN_AFR(5,GPIO_AF_GPIO) |	\
								PIN_AFR(6,GPIO_AF_GPIO) |	\
								PIN_AFR(7,GPIO_AF_ETH)				/* ETH_MII_RX_DV/ETH_RMII_CRS_DV ----> PA7 */	
#define	CARIBOU_PORTA_AFRH		PIN_AFR(0,GPIO_AF_GPIO) |	\
								PIN_AFR(1,GPIO_AF_GPIO) |	\
								PIN_AFR(2,GPIO_AF_GPIO) |	\
								PIN_AFR(3,GPIO_AF_GPIO) |	\
								PIN_AFR(4,GPIO_AF_GPIO) |	\
								PIN_AFR(5,GPIO_AF_GPIO) |			/* JTMS/SWDIO */		\
								PIN_AFR(6,GPIO_AF_GPIO) |			/* JTCK/SWCLK */		\
								PIN_AFR(7,GPIO_AF_GPIO)				/* JTDI */
/**
 ** PORT B
 */
#define	CARIBOU_PORTB_MODE		PIN_MODE(0,GPIO_Mode_OUT) |			/* LED0 */					\
								PIN_MODE(1,GPIO_Mode_OUT) |			/* LED1 */					\
								PIN_MODE(2,GPIO_Mode_OUT) |			/* LED2 */					\
								PIN_MODE(3,GPIO_Mode_AF) |			/* JTDO/TRACE */			\
								PIN_MODE(4,GPIO_Mode_AF) |			/* NJTRST */				\
								PIN_MODE(5,GPIO_Mode_IN) |	\
								PIN_MODE(6,GPIO_Mode_IN) |	\
								PIN_MODE(7,GPIO_Mode_IN) |	\
								PIN_MODE(8,GPIO_Mode_IN) |	\
								PIN_MODE(9,GPIO_Mode_IN) |	\
								PIN_MODE(10,GPIO_Mode_IN) | \
								PIN_MODE(11,GPIO_Mode_AF) |			/* ETH_MII_TX_EN/ETH_RMII_TX_EN -----> PB11 */	\
								PIN_MODE(12,GPIO_Mode_IN) | \
								PIN_MODE(13,GPIO_Mode_IN) |	\
								PIN_MODE(14,GPIO_Mode_IN) |	\
								PIN_MODE(15,GPIO_Mode_IN)

#define	CARIBOU_PORTB_OTYPER	PIN_OTYPER(0,GPIO_OType_PP) |	\
								PIN_OTYPER(1,GPIO_OType_PP) |	\
								PIN_OTYPER(2,GPIO_OType_PP) |	\
								PIN_OTYPER(3,GPIO_OType_PP) |		/* JTDO/TRACE */			\
								PIN_OTYPER(4,GPIO_OType_PP) |		/* NJTRST */				\
								PIN_OTYPER(5,GPIO_OType_PP) |	\
								PIN_OTYPER(6,GPIO_OType_PP) |	\
								PIN_OTYPER(7,GPIO_OType_PP) |	\
								PIN_OTYPER(8,GPIO_OType_PP) |	\
								PIN_OTYPER(9,GPIO_OType_PP) |	\
								PIN_OTYPER(10,GPIO_OType_PP) |	\
								PIN_OTYPER(11,GPIO_OType_PP) |		/* ETH_MII_TX_EN/ETH_RMII_TX_EN -----> PB11 */	\
								PIN_OTYPER(12,GPIO_OType_PP) |	\
								PIN_OTYPER(13,GPIO_OType_PP) |	\
								PIN_OTYPER(14,GPIO_OType_PP) |	\
								PIN_OTYPER(15,GPIO_OType_PP)

#define	CARIBOU_PORTB_OSPEEDR	PIN_OSPEEDR(0,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(1,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(2,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(3,GPIO_Speed_100MHz) |	/* JTDO/TRACE */			\
								PIN_OSPEEDR(4,GPIO_Speed_2MHz) |	/* NJTRST */				\
								PIN_OSPEEDR(5,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(6,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(7,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(8,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(9,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(10,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(11,GPIO_Speed_100MHz) |	/* ETH_MII_TX_EN/ETH_RMII_TX_EN -----> PB11 */	\
								PIN_OSPEEDR(12,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(13,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(14,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(15,GPIO_Speed_2MHz)

#define	CARIBOU_PORTB_PUPDR		PIN_PUPDR(0,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(1,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(2,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(3,GPIO_PuPd_NOPULL) |		/* JTDO/TRACE */			\
								PIN_PUPDR(4,GPIO_PuPd_UP) |			/* NJTRST */				\
								PIN_PUPDR(5,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(6,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(7,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(8,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(9,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(10,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(11,GPIO_PuPd_NOPULL) |	/* ETH_MII_TX_EN/ETH_RMII_TX_EN -----> PB11 */	\
								PIN_PUPDR(12,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(13,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(14,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(15,GPIO_PuPd_NOPULL)

#define	CARIBOU_PORTB_AFRL		PIN_AFR(0,GPIO_AF_GPIO) |	\
								PIN_AFR(1,GPIO_AF_GPIO) |	\
								PIN_AFR(2,GPIO_AF_GPIO) |	\
								PIN_AFR(3,GPIO_AF_GPIO) |			/* JTDO/TRACE */			\
								PIN_AFR(4,GPIO_AF_GPIO) |			/* NJTRST */				\
								PIN_AFR(5,GPIO_AF_GPIO) |	\
								PIN_AFR(6,GPIO_AF_GPIO) |	\
								PIN_AFR(7,GPIO_AF_GPIO)
#define	CARIBOU_PORTB_AFRH		PIN_AFR(0,GPIO_AF_GPIO) |	\
								PIN_AFR(1,GPIO_AF_GPIO) |	\
								PIN_AFR(2,GPIO_AF_GPIO) |	\
								PIN_AFR(3,GPIO_AF_ETH) |			/* ETH_MII_TX_EN/ETH_RMII_TX_EN -----> PB11 */	\
								PIN_AFR(4,GPIO_AF_GPIO) |	\
								PIN_AFR(5,GPIO_AF_GPIO) |	\
								PIN_AFR(6,GPIO_AF_GPIO) |	\
								PIN_AFR(7,GPIO_AF_GPIO)
/**
 ** PORT C
 */
#define	CARIBOU_PORTC_MODE		PIN_MODE(0,GPIO_Mode_IN) |	\
								PIN_MODE(1,GPIO_Mode_AF) |			/* ETH_MDC --------------------------> PC1 */	\
								PIN_MODE(2,GPIO_Mode_IN) |			/* PC2 - DP83848I PHY PWR_DOWN/INT */			\
								PIN_MODE(3,GPIO_Mode_IN) |	\
								PIN_MODE(4,GPIO_Mode_AF) |			/* ETH_MII_RXD0/ETH_RMII_RXD0 -------> PC4 */	\
								PIN_MODE(5,GPIO_Mode_AF) |			/* ETH_MII_RXD1/ETH_RMII_RXD1 -------> PC5 */	\
								PIN_MODE(6,GPIO_Mode_IN) |	\
								PIN_MODE(7,GPIO_Mode_IN) |	\
								PIN_MODE(8,GPIO_Mode_IN) |	\
								PIN_MODE(9,GPIO_Mode_IN) |	\
								PIN_MODE(10,GPIO_Mode_AF) |			/* TXD3 */	\
								PIN_MODE(11,GPIO_Mode_AF) |			/* RXD3 */	\
								PIN_MODE(12,GPIO_Mode_IN) | \
								PIN_MODE(13,GPIO_Mode_IN) | \
								PIN_MODE(14,GPIO_Mode_IN) | \
								PIN_MODE(15,GPIO_Mode_IN)

#define	CARIBOU_PORTC_OTYPER	PIN_OTYPER(0,GPIO_OType_PP) |	\
								PIN_OTYPER(1,GPIO_OType_PP) |		/* ETH_MDC --------------------------> PC1 */	\
								PIN_OTYPER(2,GPIO_OType_PP) |		/* PC2 - DP83848I PHY PWR_DOWN/INT */			\
								PIN_OTYPER(3,GPIO_OType_PP) |	\
								PIN_OTYPER(4,GPIO_OType_PP) |		/* ETH_MII_RXD0/ETH_RMII_RXD0 -------> PC4 */	\
								PIN_OTYPER(5,GPIO_OType_PP) |		/* ETH_MII_RXD1/ETH_RMII_RXD1 -------> PC5 */	\
								PIN_OTYPER(6,GPIO_OType_PP) |	\
								PIN_OTYPER(7,GPIO_OType_PP) |	\
								PIN_OTYPER(8,GPIO_OType_PP) |	\
								PIN_OTYPER(9,GPIO_OType_PP) |	\
								PIN_OTYPER(10,GPIO_OType_PP) |		/* TX3 */	\
								PIN_OTYPER(11,GPIO_OType_PP) |		/* RXD3 */	\
								PIN_OTYPER(12,GPIO_OType_PP) |	\
								PIN_OTYPER(13,GPIO_OType_PP) |	\
								PIN_OTYPER(14,GPIO_OType_PP) |	\
								PIN_OTYPER(15,GPIO_OType_PP)

#define	CARIBOU_PORTC_OSPEEDR	PIN_OSPEEDR(0,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(1,GPIO_Speed_100MHz) |	/* ETH_MDC --------------------------> PC1 */	\
								PIN_OSPEEDR(2,GPIO_Speed_2MHz) |	/* PC2 - DP83848I PHY PWR_DOWN/INT */			\
								PIN_OSPEEDR(3,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(4,GPIO_Speed_100MHz) |	/* ETH_MII_RXD0/ETH_RMII_RXD0 -------> PC4 */	\
								PIN_OSPEEDR(5,GPIO_Speed_100MHz) |	/* ETH_MII_RXD1/ETH_RMII_RXD1 -------> PC5 */	\
								PIN_OSPEEDR(6,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(7,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(8,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(9,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(10,GPIO_Speed_2MHz) |	/* TX3 */	\
								PIN_OSPEEDR(11,GPIO_Speed_2MHz) |	/* RX3 */	\
								PIN_OSPEEDR(12,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(13,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(14,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(15,GPIO_Speed_2MHz)

#define	CARIBOU_PORTC_PUPDR		PIN_PUPDR(0,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(1,GPIO_PuPd_NOPULL) |		/* ETH_MDC --------------------------> PC1 */	\
								PIN_PUPDR(2,GPIO_PuPd_UP) |			/* PC2 - DP83848I PHY PWR_DOWN/INT */			\
								PIN_PUPDR(3,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(4,GPIO_PuPd_NOPULL) |		/* ETH_MII_RXD0/ETH_RMII_RXD0 -------> PC4 */	\
								PIN_PUPDR(5,GPIO_PuPd_NOPULL) |		/* ETH_MII_RXD1/ETH_RMII_RXD1 -------> PC5 */	\
								PIN_PUPDR(6,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(7,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(8,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(9,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(10,GPIO_PuPd_NOPULL) |	/* TX3 */	\
								PIN_PUPDR(11,GPIO_PuPd_NOPULL) |	/* RX3 */	\
								PIN_PUPDR(12,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(13,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(14,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(15,GPIO_PuPd_NOPULL)

#define	CARIBOU_PORTC_AFRL		PIN_AFR(0,GPIO_AF_GPIO) |	\
								PIN_AFR(1,GPIO_AF_ETH) |			/* ETH_MDC --------------------------> PC1 */	\
								PIN_AFR(2,GPIO_AF_GPIO) |			/* PC2 - DP83848I PHY PWR_DOWN/INT */	\
								PIN_AFR(3,GPIO_AF_GPIO) |	\
								PIN_AFR(4,GPIO_AF_ETH) |			/* ETH_MII_RXD0/ETH_RMII_RXD0 -------> PC4 */	\
								PIN_AFR(5,GPIO_AF_ETH) |			/* ETH_MII_RXD1/ETH_RMII_RXD1 -------> PC5 */	\
								PIN_AFR(6,GPIO_AF_GPIO) |	\
								PIN_AFR(7,GPIO_AF_GPIO)
#define	CARIBOU_PORTC_AFRH		PIN_AFR(0,GPIO_AF_GPIO) |	\
								PIN_AFR(1,GPIO_AF_GPIO) |	\
								PIN_AFR(2,GPIO_AF_USART3) |			/* TX3 */	\
								PIN_AFR(3,GPIO_AF_USART3) |			/* RX3 */	\
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
 ** PORT E
 */
#define	CARIBOU_PORTE_MODE		PIN_MODE(0,GPIO_Mode_IN) |	\
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

#define	CARIBOU_PORTE_OTYPER	PIN_OTYPER(0,GPIO_OType_PP) |	\
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

#define	CARIBOU_PORTE_OSPEEDR	PIN_OSPEEDR(0,GPIO_Speed_2MHz) |	\
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

#define	CARIBOU_PORTE_PUPDR		PIN_PUPDR(0,GPIO_PuPd_NOPULL) |	\
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

#define	CARIBOU_PORTE_AFRL		PIN_AFR(0,GPIO_AF_GPIO) |	\
								PIN_AFR(1,GPIO_AF_GPIO) |	\
								PIN_AFR(2,GPIO_AF_GPIO) |	\
								PIN_AFR(3,GPIO_AF_GPIO) |	\
								PIN_AFR(4,GPIO_AF_GPIO) |	\
								PIN_AFR(5,GPIO_AF_GPIO) |	\
								PIN_AFR(6,GPIO_AF_GPIO) |	\
								PIN_AFR(7,GPIO_AF_GPIO)
#define	CARIBOU_PORTE_AFRH		PIN_AFR(0,GPIO_AF_GPIO) |	\
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
								PIN_MODE(11,GPIO_Mode_OUT) |			/* LED3 */			\
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
/**
 ** PORT G
 */
#define	CARIBOU_PORTG_MODE	PIN_MODE(0,GPIO_Mode_IN) |	\
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
								PIN_MODE(11,GPIO_Mode_IN) |	\
								PIN_MODE(12,GPIO_Mode_IN) | \
								PIN_MODE(13,GPIO_Mode_AF) |			/* ETH_MII_TXD0/ETH_RMII_TXD0 -------> PG13 */	\
								PIN_MODE(14,GPIO_Mode_AF) |			/* ETH_MII_TXD1/ETH_RMII_TXD1 -------> PG14 */	\
								PIN_MODE(15,GPIO_Mode_IN)

#define	CARIBOU_PORTG_OTYPER	PIN_OTYPER(0,GPIO_OType_PP) |	\
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
								PIN_OTYPER(13,GPIO_OType_PP) |		/* ETH_MII_TXD0/ETH_RMII_TXD0 -------> PG13 */	\
								PIN_OTYPER(14,GPIO_OType_PP) |		/* ETH_MII_TXD1/ETH_RMII_TXD1 -------> PG14 */	\
								PIN_OTYPER(15,GPIO_OType_PP)

#define	CARIBOU_PORTG_OSPEEDR	PIN_OSPEEDR(0,GPIO_Speed_2MHz) |	\
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
								PIN_OSPEEDR(13,GPIO_Speed_100MHz) |	/* ETH_MII_TXD0/ETH_RMII_TXD0 -------> PG13 */	\
								PIN_OSPEEDR(14,GPIO_Speed_100MHz) |	/* ETH_MII_TXD1/ETH_RMII_TXD1 -------> PG14 */	\
								PIN_OSPEEDR(15,GPIO_Speed_2MHz)

#define	CARIBOU_PORTG_PUPDR		PIN_PUPDR(0,GPIO_PuPd_NOPULL) |	\
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
								PIN_PUPDR(13,GPIO_PuPd_NOPULL) |	/* ETH_MII_TXD0/ETH_RMII_TXD0 -------> PG13 */	\
								PIN_PUPDR(14,GPIO_PuPd_NOPULL) |	/* ETH_MII_TXD1/ETH_RMII_TXD1 -------> PG14 */	\
								PIN_PUPDR(15,GPIO_PuPd_NOPULL)

#define	CARIBOU_PORTG_AFRL		PIN_AFR(0,GPIO_AF_GPIO) |	\
								PIN_AFR(1,GPIO_AF_GPIO) |	\
								PIN_AFR(2,GPIO_AF_GPIO) |	\
								PIN_AFR(3,GPIO_AF_GPIO) |	\
								PIN_AFR(4,GPIO_AF_GPIO) |	\
								PIN_AFR(5,GPIO_AF_GPIO) |	\
								PIN_AFR(6,GPIO_AF_GPIO) |	\
								PIN_AFR(7,GPIO_AF_GPIO)
#define	CARIBOU_PORTG_AFRH		PIN_AFR(0,GPIO_AF_GPIO) |	\
								PIN_AFR(1,GPIO_AF_GPIO) |	\
								PIN_AFR(2,GPIO_AF_GPIO) |	\
								PIN_AFR(3,GPIO_AF_GPIO) |	\
								PIN_AFR(4,GPIO_AF_GPIO) |	\
								PIN_AFR(5,GPIO_AF_ETH) |			/* ETH_MII_TXD0/ETH_RMII_TXD0 -------> PG13 */	\
								PIN_AFR(6,GPIO_AF_ETH) |			/* ETH_MII_TXD1/ETH_RMII_TXD1 -------> PG14 */	\
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

#define	CARIBOU_PORTH_OSPEEDR	PIN_OSPEEDR(0,GPIO_Speed_2MHz) |	\
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
/**
 ** PORT I
 */
#define	CARIBOU_PORTI_MODE		PIN_MODE(0,GPIO_Mode_AF) |			/* SPI3_NSS - MMC */ \
								PIN_MODE(1,GPIO_Mode_AF) |			/* SPI3_SCK - MMC */ \
								PIN_MODE(2,GPIO_Mode_AF) |			/* SPI3_MISO = MMC */ \
								PIN_MODE(3,GPIO_Mode_AF) |			/* SPI3_MOSI - MMC */ \
								PIN_MODE(4,GPIO_Mode_IN) |	\
								PIN_MODE(5,GPIO_Mode_IN) |	\
								PIN_MODE(6,GPIO_Mode_IN) |	\
								PIN_MODE(7,GPIO_Mode_IN) |	\
								PIN_MODE(8,GPIO_Mode_IN) |	\
								PIN_MODE(9,GPIO_Mode_IN) |	\
								PIN_MODE(10,GPIO_Mode_IN) |	\
								PIN_MODE(11,GPIO_Mode_IN) | \
								PIN_MODE(12,GPIO_Mode_IN) | \
								PIN_MODE(13,GPIO_Mode_IN) | \
								PIN_MODE(14,GPIO_Mode_IN) | \
								PIN_MODE(15,GPIO_Mode_IN)

#define	CARIBOU_PORTI_OTYPER	PIN_OTYPER(0,GPIO_OType_PP) |		/* SPI3_NSS - MMC */ \
								PIN_OTYPER(1,GPIO_OType_PP) |		/* SPI3_SCK - MMC */ \
								PIN_OTYPER(2,GPIO_OType_PP) |		/* SPI3_MISO = MMC */ \
								PIN_OTYPER(3,GPIO_OType_PP) |		/* SPI3_MOSI - MMC */ \
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

#define	CARIBOU_PORTI_OSPEEDR	PIN_OSPEEDR(0,GPIO_Speed_50MHz) |	/* SPI3_NSS - MMC */ \
								PIN_OSPEEDR(1,GPIO_Speed_50MHz) |	/* SPI3_SCK - MMC */ \
								PIN_OSPEEDR(2,GPIO_Speed_50MHz) |	/* SPI3_MISO = MMC */ \
								PIN_OSPEEDR(3,GPIO_Speed_50MHz) |	/* SPI3_MOSI - MMC */ \
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

#define	CARIBOU_PORTI_PUPDR		PIN_PUPDR(0,GPIO_PuPd_DOWN) |		/* SPI3_NSS - MMC */ \
								PIN_PUPDR(1,GPIO_PuPd_DOWN) |		/* SPI3_SCK - MMC */ \
								PIN_PUPDR(2,GPIO_PuPd_DOWN) |		/* SPI3_MISO - MMC */ \
								PIN_PUPDR(3,GPIO_PuPd_DOWN) |		/* SPI3_MOSI - MMC */ \
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

#define	CARIBOU_PORTI_AFRL		PIN_AFR(0,GPIO_AF_SPI2) |			/* SPI3_NSS - MMC */ \
								PIN_AFR(1,GPIO_AF_SPI2) |			/* SPI3_SCK - MMC */ \
								PIN_AFR(2,GPIO_AF_SPI2) |			/* SPI3_MISO = MMC */ \
								PIN_AFR(3,GPIO_AF_SPI2) |			/* SPI3_MOSI - MMC */ \
								PIN_AFR(4,GPIO_AF_GPIO) |	\
								PIN_AFR(5,GPIO_AF_GPIO) |	\
								PIN_AFR(6,GPIO_AF_GPIO) |	\
								PIN_AFR(7,GPIO_AF_GPIO)
#define	CARIBOU_PORTI_AFRH		PIN_AFR(0,GPIO_AF_GPIO) |	\
								PIN_AFR(1,GPIO_AF_GPIO) |	\
								PIN_AFR(2,GPIO_AF_GPIO) |	\
								PIN_AFR(3,GPIO_AF_GPIO) |	\
								PIN_AFR(4,GPIO_AF_GPIO) |	\
								PIN_AFR(5,GPIO_AF_GPIO) |	\
								PIN_AFR(6,GPIO_AF_GPIO) |	\
								PIN_AFR(7,GPIO_AF_GPIO)
/**
 ** @brief A hook to perform early board initialization. Static stacks are initialized, BSS is *NOT* initialized at this stage.
 **/
extern void early_init(void);

/**
 ** @brief A hook to perform late initialization. Static stacks, BSS, heap, and static constructors are all initialized at this stage.
 **/
extern void late_init(void);

/**
 ** @brief A hok for board specific idle time
 */
extern void board_idle(void);

#ifdef __cplusplus
}
#endif

#endif /* _CARIBOU_BOARD_H_ */