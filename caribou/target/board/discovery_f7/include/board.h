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
#include <caribou/lib/stdio.h>
#include <caribou/lib/stdarg.h>
#include <netconf.h>
#include <stm32f7xx_hal_dma.h>
#include <stm32f7xx_hal_spi.h>
#include <stm32f7xx_hal_gpio.h>

#ifdef __cplusplus
extern "C" {
#endif

#define SRAM_DEVICE_ADDR	((uint32_t)0x20000000)
#define SRAM_DEVICE_SIZE	((uint32_t)MPU_REGION_SIZE_512MB)

extern stdio_t* adp_io;

typedef struct
{
	uint16_t	phyAddress;
	uint32_t	ethInitStatus;
	uint8_t		ethLinkStatus;
} network_interface_t;

extern volatile network_interface_t network_interface;

extern caribou_gpio_t gpio_led1;
extern caribou_gpio_t gpio_led2;
extern caribou_gpio_t gpio_led3;
extern caribou_gpio_t gpio_led4;
extern caribou_gpio_t gpio_nav_left;
extern caribou_gpio_t gpio_nav_select;
extern caribou_gpio_t gpio_nav_up;
extern caribou_gpio_t gpio_nav_down;
extern caribou_gpio_t gpio_nav_right;
extern caribou_gpio_t gpio_oled_cd;
extern caribou_gpio_t gpio_oled_reset;
extern caribou_gpio_t gpio_oled_spi_sel;
extern caribou_gpio_t gpio_buzzer;
extern caribou_gpio_t gpio_mmc_cs;
extern caribou_gpio_t gpio_modbus_dir;
extern caribou_gpio_t gpio_eth_phy_nrst;
extern caribou_gpio_t gpio_adp_dir;

extern void beep(uint32_t freq_hz,uint32_t duration_ms);

extern void isr_phy_eth0(InterruptVector vector, void* arg);
extern void isr_eth0(InterruptVector vector, void* arg);

/*
* Priorities...
*/
#define	PRODUCT_THREAD_NORMAL_PRIO				(0)
#define	PRODUCT_THREAD_TCPIP_PRIO				(1)
#define PRODUCT_ETHIF_THREAD_PRIO				(1)
#define	PRODUCT_MODBUSRTUCLI_THREAD_PRIO		(0)
#define	PRODUCT_HTTP_THREAD_PRIO				(0)
#define	PRODUCT_FTP_THREAD_PRIO					(0)
#define	PRODUCT_MODBUSTCPSRV_THREAD_PRIO		(0)
#define	PRODUCT_MODBUSTCPSES_THREAD_PRIO		(1)
#define	PRODUCT_TELNET_THREAD_PRIO				(0)

/*
* stack sizes...
*/
#define PRODUCT_ADP_STACK_SZ					(1024*4)
#define DISPLAY_DRIVER_THREAD_STKSZ				(1024*4)
#define PRODUCT_TCPIP_DEF_STKSZ					(1024)
#define PRODUCT_ETHIF_THREAD_STACKSZ			(1024*2)
#define PRODUCT_THREAD_DEF_STKSZ				(1024)
#define PRODUCT_ADP_THREAD_STKSZ				(1024)
#define	PRODUCT_HTTP_SERVER_STK_SZ				(1024*2)
#define	PRODUCT_HTTP_THREAD_STK_SZ				(1024*16)
#define	PRODUCT_FTP_SERVER_STK_SZ				(1024)
#define	PRODUCT_FTP_THREAD_STK_SZ				(1024*8)
#define PRODUCT_MODBUSTCPSRV_THREAD_STK_SZ		(1024)
#define	PRODUCT_MODBUSTCPSES_THREAD_STK_SZ		(1024*2)
#define	PRODUCT_MODBUSRTUCLI_THREAD_STK_SZ		(1024)
#define PRODUCT_XFER_SESSION_STK_SZ				(1024)
#define PRODUCT_XFER_SERVER_STK_SZ				(1024)
#define	PRODUCT_MODBUS_SLAVE_SESSION_STK_SZ		(1024*2)
#define	PRODUCT_MODBUS_SLAVE_STK_SZ				(1024)
#define PRODUCT_MODBUS_TCP_SLAVE_STK_SZ			(1024)
#define	PRODUCT_TELNET_SERVER_STK_SZ			(1024)
#define	PRODUCT_TELNET_THREAD_STK_SZ			(1024*16)

extern int lwip_errno(int err);
extern void syslog(int lvl,bool timestamp,const char *format, ...);

#define SYSTEM_LOG								"system"
#define READINGS_LOG							"readings"
#define TRAFFIC_LOG								"traffic"
#define	DEBUG_LOG								"debug"

#define SYSTEM_LVL								(0)
#define	READINGS_LVL							(1)
#define	TRAFFIC_LVL								(2)
#define	DEBUG_LVL								(3)

/**
 * @brief Settings files...
 */

#define HTTP_SERVER_ROOT						"/htm"

/*******************************/

#define CONSOLE_USART							(5)					/* UART table offset */
#define	RS485_UART								(4)					/* UART Table Offset */
#define ADP_USART								(0)					/* UART table offset */

/** MMC */
#define	SPI_MMC									SPI1				/* The SPI port that is running the MMC card */
#define SPI_MMC_DMA_TX							DMA2
#define	SPI_MMC_DMA_RX							DMA2
#define SPI_MMC_TX_DMA_STREAM					DMA2_Stream3
#define SPI_MMC_RX_DMA_STREAM					DMA2_Stream2
#define SPI_MMC_TX_DMA_CHANNEL					DMA_CHANNEL_3
#define SPI_MMC_RX_DMA_CHANNEL					DMA_CHANNEL_3
#define DMA_FLAG_SPI_MMC_TC_TX					DMA_FLAG_TCIF2_7	/* DMA_FLAG_TCIF3 */
#define DMA_FLAG_SPI_MMC_TC_RX					DMA_FLAG_TCIF2_6	/* DMA_FLAG_TCIF2 */
#define DMA_ISR_TX								LISR
#define	DMA_ISR_RX								LISR
#define SPI_MMC_BUFFERSIZE						512

/** U8G */
#define SPI_U8G									SPI2
#define SPI_U8G_IRQn							SPI2_IRQn
#define SPI_U8G_DMA								DMA1
#define	SPI_U8G_DMA_IRQn						DMA1_Stream4_IRQn
#define SPI_U8G_TX_DMA_CHANNEL					DMA_Channel_0
#define SPI_U8G_TX_DMA_STREAM					DMA1_Stream4
#define SPI_U8G_TX_DMA_FLAG_TCIF				DMA_FLAG_TCIF0_4
#define SPI_U8G_RX_DMA_CHANNEL					DMA_Channel_0
#define SPI_U8G_RX_DMA_STREAM					DMA_FLAG_TCIF3_7
#define SPI_U8G_RX_DMA_FLAG_TCIF				DMA_FLAG_TCIF3
#define SPI_U8G_BUFFERSIZE						(SCREEN_WIDTH*4)

/* Ethernet pins configuration ************************************************/
   /*
        ETH_MII_RX_CLK/ETH_RMII_REF_CLK---> PA1		**
        ETH_MDIO -------------------------> PA2		**
        ETH_MII_RX_DV/ETH_RMII_CRS_DV ----> PA7		**

        ETH_MDC --------------------------> PC1		**
        ETH_PWR_DOWN/INT -----------------> PC2		**	
        ETH_MII_RXD0/ETH_RMII_RXD0 -------> PC4		**
        ETH_MII_RXD1/ETH_RMII_RXD1 -------> PC5		**

		ETH_MII_TX_EN/ETH_RMII_TX_EN -----> PG11	**
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
//#define ETH_LINK_EXTI_LINE				EXTI_Line2
//#define ETH_LINK_EXTI_PORT_SOURCE		EXTI_PortSourceGPIOC
//#define ETH_LINK_EXTI_PIN_SOURCE		EXTI_PinSource2
#define ETH_LINK_EXTI_IRQn				EXTI2_IRQn 
/* PC2 - DP83848I PHY PWR_DOWN/INT */
#define ETH_LINK_PIN					GPIO_Pin_2
#define ETH_LINK_GPIO_PORT				GPIOC
#define ETH_LINK_GPIO_CLK				RCC_AHB1Periph_GPIOC
/* PHY registers */
#define PHY_MICR						0x11				/* MII Interrupt Control Register */
#define PHY_MICR_INT_EN					((uint16_t)0x0002)	/* PHY Enable interrupts */
#define PHY_MICR_INT_OE					((uint16_t)0x0001)	/* PHY Enable output interrupt events */
#define PHY_MISR						0x12				/* MII Interrupt Status and Misc. Control Register */
#define PHY_MISR_LINK_INT_EN			((uint16_t)0x0020)	/* Enable Interrupt on change of link status */
#define PHY_LINK_STATUS					((uint16_t)0x2000)	/* PHY link status interrupt mask */

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
#define	CARIBOU_PORTA_MODE		PIN_MODE(0,GPIO_Mode_AN) |			/* ADC_0: MainSupply Measure */					\
								PIN_MODE(1,GPIO_Mode_AF) |			/* ETH_MII_RX_CLK/ETH_RMII_REF_CLK---> PA1 */	\
								PIN_MODE(2,GPIO_Mode_AF) |			/* ETH_MDIO -------------------------> PA2 */	\
								PIN_MODE(3,GPIO_Mode_IN) |			\
								PIN_MODE(4,GPIO_Mode_AN) |			/* DAC_Out1: 4-20ma output 1 */					\
								PIN_MODE(5,GPIO_Mode_AN) |			/* DAC_Out2: 4-20ma output 2 */					\
								PIN_MODE(6,GPIO_Mode_IN) |			/* ETH PHY Interrupt */							\
								PIN_MODE(7,GPIO_Mode_AF) |			/* ETH_MII_RX_DV/ETH_RMII_CRS_DV ----> PA7 */	\
								PIN_MODE(8,GPIO_Mode_AF) |			/* MCO1 - 25MHz out to PHY */					\
								PIN_MODE(9,GPIO_Mode_AF) |			/* USART1_TX / TIM1_CH2 - Transducer TX */		\
								PIN_MODE(10,GPIO_Mode_AF) |			/* USART1_RX / TIM1_CH3 - Transducer RX */		\
								PIN_MODE(11,GPIO_Mode_AF) |			/* OTG_FS_DM - Bluetooth Module */				\
								PIN_MODE(12,GPIO_Mode_AF) |			/* OTG_FS_DP - Bluetooth Module */				\
								PIN_MODE(13,GPIO_Mode_AF) |			/* JTMS/SWDIO */								\
								PIN_MODE(14,GPIO_Mode_AF) |			/* JTCK/SWCLK */								\
								PIN_MODE(15,GPIO_Mode_OUT)			/* SPI1_NSS - Micro SD Card Chip-Select  */

#define	CARIBOU_PORTA_OTYPER	PIN_OTYPER(0,GPIO_OType_PP) |		/* ADC_0: MainSupply Measure */					\
								PIN_OTYPER(1,GPIO_OType_PP) |		/* ETH_MII_RX_CLK/ETH_RMII_REF_CLK---> PA1 */	\
								PIN_OTYPER(2,GPIO_OType_OD) |		/* ETH_MDIO -------------------------> PA2 */	\
								PIN_OTYPER(3,GPIO_OType_PP) |		\
								PIN_OTYPER(4,GPIO_OType_PP) |		/* DAC_Out1: 4-20ma output 1 */					\
								PIN_OTYPER(5,GPIO_OType_PP) |		/* DAC_Out2: 4-20ma output 2 */					\
								PIN_OTYPER(6,GPIO_OType_PP) |		/* ETH PHY Interrupt */							\
								PIN_OTYPER(7,GPIO_OType_PP) |		/* ETH_MII_RX_DV/ETH_RMII_CRS_DV ----> PA7 */	\
								PIN_OTYPER(8,GPIO_OType_PP) |		/* MCO1 - 25MHz out to PHY */					\
								PIN_OTYPER(9,GPIO_OType_PP) |		/* USART1_TX / TIM1_CH2 - Transducer TX */		\
								PIN_OTYPER(10,GPIO_OType_PP) |		/* USART1_RX / TIM1_CH3 - Transducer RX */		\
								PIN_OTYPER(11,GPIO_OType_PP) |		/* OTG_FS_DM - Bluetooth Module */				\
								PIN_OTYPER(12,GPIO_OType_PP) |		/* OTG_FS_DP - Bluetooth Module */				\
								PIN_OTYPER(13,GPIO_OType_PP) |		/* JTMS/SWDIO */		\
								PIN_OTYPER(14,GPIO_OType_PP) |		/* JTCK/SWCLK */		\
								PIN_OTYPER(15,GPIO_OType_PP)		/* SPI1_NSS - Micro SD Card Chip-Select  */

#define	CARIBOU_PORTA_OSPEEDR	PIN_OSPEEDR(0,GPIO_Speed_2MHz) |	/* ADC_0: MainSupply Measure */					\
								PIN_OSPEEDR(1,GPIO_Speed_100MHz) |	/* ETH_MII_RX_CLK/ETH_RMII_REF_CLK---> PA1 */	\
								PIN_OSPEEDR(2,GPIO_Speed_100MHz) |	/* ETH_MDIO -------------------------> PA2 */	\
								PIN_OSPEEDR(3,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(4,GPIO_Speed_2MHz) |	/* DAC_Out1: 4-20ma output 1 */					\
								PIN_OSPEEDR(5,GPIO_Speed_2MHz) |	/* DAC_Out2: 4-20ma output 2 */					\
								PIN_OSPEEDR(6,GPIO_Speed_2MHz) |	/* ETH PHY Interrupt */							\
								PIN_OSPEEDR(7,GPIO_Speed_100MHz) |	/* ETH_MII_RX_DV/ETH_RMII_CRS_DV ----> PA7 */	\
								PIN_OSPEEDR(8,GPIO_Speed_100MHz) |	/* MCO1 - 25MHz out to PHY */					\
								PIN_OSPEEDR(9,GPIO_Speed_2MHz) |	/* USART1_TX / TIM1_CH2 - Transducer TX */		\
								PIN_OSPEEDR(10,GPIO_Speed_2MHz) |	/* USART1_RX / TIM1_CH3 - Transducer RX */		\
								PIN_OSPEEDR(11,GPIO_Speed_100MHz) |	/* OTG_FS_DM - Bluetooth Module */				\
								PIN_OSPEEDR(12,GPIO_Speed_100MHz) |	/* OTG_FS_DP - Bluetooth Module */				\
								PIN_OSPEEDR(13,GPIO_Speed_2MHz) |	/* JTMS/SWDIO */		\
								PIN_OSPEEDR(14,GPIO_Speed_2MHz) |	/* JTCK/SWCLK */		\
								PIN_OSPEEDR(15,GPIO_Speed_25MHz)	/* SPI1_NSS - Micro SD Card Chip-Select  */

#define	CARIBOU_PORTA_PUPDR		PIN_PUPDR(0,GPIO_PuPd_NOPULL) |		/* ADC_0: MainSupply Measure */					\
								PIN_PUPDR(1,GPIO_PuPd_NOPULL) |		/* ETH_MII_RX_CLK/ETH_RMII_REF_CLK---> PA1 */	\
								PIN_PUPDR(2,GPIO_PuPd_NOPULL) |		/* ETH_MDIO -------------------------> PA2 */	\
								PIN_PUPDR(3,GPIO_PuPd_NOPULL) |		\
								PIN_PUPDR(4,GPIO_PuPd_NOPULL) |		/* DAC_Out1: 4-20ma output 1 */					\
								PIN_PUPDR(5,GPIO_PuPd_NOPULL) |		/* DAC_Out2: 4-20ma output 2 */					\
								PIN_PUPDR(6,GPIO_PuPd_UP) |			/* ETH PHY Interrupt */							\
								PIN_PUPDR(7,GPIO_PuPd_NOPULL) |		/* ETH_MII_RX_DV/ETH_RMII_CRS_DV ----> PA7 */	\
								PIN_PUPDR(8,GPIO_PuPd_NOPULL) |		/* MCO1 - 25MHz out to PHY */					\
								PIN_PUPDR(9,GPIO_PuPd_NOPULL) |		/* USART1_TX / TIM1_CH2 - Transducer TX */		\
								PIN_PUPDR(10,GPIO_PuPd_UP) |		/* USART1_RX / TIM1_CH3 - Transducer RX */		\
								PIN_PUPDR(11,GPIO_PuPd_NOPULL) |	/* OTG_FS_DM - Bluetooth Module */				\
								PIN_PUPDR(12,GPIO_PuPd_NOPULL) |	/* OTG_FS_DP - Bluetooth Module */				\
								PIN_PUPDR(13,GPIO_PuPd_UP) |		/* JTMS/SWDIO */		\
								PIN_PUPDR(14,GPIO_PuPd_DOWN) |		/* JTCK/SWCLK */		\
								PIN_PUPDR(15,GPIO_PuPd_UP)			/* SPI1_NSS - Micro SD Card Chip-Select  */

#define	CARIBOU_PORTA_AFRL		PIN_AFR(0,GPIO_AF_GPIO) |			/* ADC_0: MainSupply Measure */					\
								PIN_AFR(1,GPIO_AF11_ETH) |			/* ETH_MII_RX_CLK/ETH_RMII_REF_CLK---> PA1 */	\
								PIN_AFR(2,GPIO_AF11_ETH) |			/* ETH_MDIO -------------------------> PA2 */	\
								PIN_AFR(3,GPIO_AF_GPIO) |			\
								PIN_AFR(4,GPIO_AF_GPIO) |			/* DAC_Out1: 4-20ma output 1 */					\
								PIN_AFR(5,GPIO_AF_GPIO) |			/* DAC_Out2: 4-20ma output 2 */					\
								PIN_AFR(6,GPIO_AF_GPIO) |			/* ETH PHY Interrupt */							\
								PIN_AFR(7,GPIO_AF11_ETH)			/* ETH_MII_RX_DV/ETH_RMII_CRS_DV ----> PA7 */	
#define	CARIBOU_PORTA_AFRH		PIN_AFR(0,GPIO_AF0_MCO) |			/* MCO1 - 25MHz out to PHY */					\
								PIN_AFR(1,GPIO_AF7_USART1) |		/* USART1_TX / TIM1_CH2 - Transducer TX */		\
								PIN_AFR(2,GPIO_AF7_USART1) |		/* USART1_RX / TIM1_CH3 - Transducer RX */		\
								PIN_AFR(3,GPIO_AF10_OTG_FS) |		/* OTG_FS_DM - Bluetooth Module */				\
								PIN_AFR(4,GPIO_AF10_OTG_FS) |		/* OTG_FS_DP - Bluetooth Module */				\
								PIN_AFR(5,GPIO_AF_GPIO) |			/* JTMS/SWDIO */		\
								PIN_AFR(6,GPIO_AF_GPIO) |			/* JTCK/SWCLK */		\
								PIN_AFR(7,GPIO_AF_GPIO)				/* SPI1_NSS - Micro SD Card Chip-Select  */
/**
 ** PORT B
 */
#define	CARIBOU_PORTB_MODE		PIN_MODE(0,GPIO_Mode_IN) |	\
								PIN_MODE(1,GPIO_Mode_IN) |	\
								PIN_MODE(2,GPIO_Mode_IN) |	\
								PIN_MODE(3,GPIO_Mode_AF) |			/* SPI1 SCK - Micro-SD */	\
								PIN_MODE(4,GPIO_Mode_AF) |			/* SPI1 MISO - Micro-SD */	\
								PIN_MODE(5,GPIO_Mode_AF) |			/* SPI1 MOSI - Micro-SD */	\
								PIN_MODE(6,GPIO_Mode_IN) |	\
								PIN_MODE(7,GPIO_Mode_IN) |			/* SPI1 Card Detect - Micro-SD */	\
								PIN_MODE(8,GPIO_Mode_IN) |	\
								PIN_MODE(9,GPIO_Mode_IN) |	\
								PIN_MODE(10,GPIO_Mode_IN) | \
								PIN_MODE(11,GPIO_Mode_IN) | \
								PIN_MODE(12,GPIO_Mode_IN) | \
								PIN_MODE(13,GPIO_Mode_IN) |	\
								PIN_MODE(14,GPIO_Mode_IN) |	\
								PIN_MODE(15,GPIO_Mode_IN)

#define	CARIBOU_PORTB_OTYPER	PIN_OTYPER(0,GPIO_OType_PP) |	\
								PIN_OTYPER(1,GPIO_OType_PP) |	\
								PIN_OTYPER(2,GPIO_OType_PP) |	\
								PIN_OTYPER(3,GPIO_OType_PP) |		/* SPI1 SCK - Micro-SD */	\
								PIN_OTYPER(4,GPIO_OType_PP) |		/* SPI1 MISO - Micro-SD */	\
								PIN_OTYPER(5,GPIO_OType_PP) |		/* SPI1 MOSI - Micro-SD */	\
								PIN_OTYPER(6,GPIO_OType_PP) |	\
								PIN_OTYPER(7,GPIO_OType_PP) |		/* SPI1 Card Detect - Micro-SD */	\
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
								PIN_OSPEEDR(3,GPIO_Speed_50MHz) |	/* SPI1 SCK - Micro-SD */	\
								PIN_OSPEEDR(4,GPIO_Speed_50MHz) |	/* SPI1 MISO - Micro-SD */	\
								PIN_OSPEEDR(5,GPIO_Speed_50MHz) |	/* SPI1 MOSI - Micro-SD */	\
								PIN_OSPEEDR(6,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(7,GPIO_Speed_2MHz) |	/* SPI1 Card Detect - Micro-SD */	\
								PIN_OSPEEDR(8,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(9,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(10,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(11,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(12,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(13,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(14,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(15,GPIO_Speed_2MHz)

#define	CARIBOU_PORTB_PUPDR		PIN_PUPDR(0,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(1,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(2,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(3,GPIO_PuPd_UP) |			/* SPI1 SCK - Micro-SD */	\
								PIN_PUPDR(4,GPIO_PuPd_UP) |			/* SPI1 MISO - Micro-SD */	\
								PIN_PUPDR(5,GPIO_PuPd_UP) |			/* SPI1 MOSI - Micro-SD */	\
								PIN_PUPDR(6,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(7,GPIO_PuPd_UP) |			/* SPI1 Card Detect - Micro-SD */	\
								PIN_PUPDR(8,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(9,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(10,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(11,GPIO_PuPd_UP) |	\
								PIN_PUPDR(12,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(13,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(14,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(15,GPIO_PuPd_NOPULL)

#define	CARIBOU_PORTB_AFRL		PIN_AFR(0,GPIO_AF_GPIO) |	\
								PIN_AFR(1,GPIO_AF_GPIO) |	\
								PIN_AFR(2,GPIO_AF_GPIO) |	\
								PIN_AFR(3,GPIO_AF5_SPI1) |			/* SPI1 SCK - Micro-SD */	\
								PIN_AFR(4,GPIO_AF5_SPI1) |			/* SPI1 MISO - Micro-SD */	\
								PIN_AFR(5,GPIO_AF5_SPI1) |			/* SPI1 MOSI - Micro-SD */	\
								PIN_AFR(6,GPIO_AF_GPIO) |	\
								PIN_AFR(7,GPIO_AF_GPIO)				/* SPI1 Card Detect - Micro-SD */	
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
								PIN_MODE(1,GPIO_Mode_AF) |			/* ETH_MDC --------------------------> PC1 */	\
								PIN_MODE(2,GPIO_Mode_IN) |	\
								PIN_MODE(3,GPIO_Mode_IN) |	\
								PIN_MODE(4,GPIO_Mode_AF) |			/* ETH_MII_RXD0/ETH_RMII_RXD0 -------> PC4 */	\
								PIN_MODE(5,GPIO_Mode_AF) |			/* ETH_MII_RXD1/ETH_RMII_RXD1 -------> PC5 */	\
								PIN_MODE(6,GPIO_Mode_AF) |			/* USART6 DEBUG TX */							\
								PIN_MODE(7,GPIO_Mode_AF) |			/* USART6 DEBUG RX */							\
								PIN_MODE(8,GPIO_Mode_IN) |	\
								PIN_MODE(9,GPIO_Mode_IN) |	\
								PIN_MODE(10,GPIO_Mode_IN) |	\
								PIN_MODE(11,GPIO_Mode_IN) |	\
								PIN_MODE(12,GPIO_Mode_IN) |	\
								PIN_MODE(13,GPIO_Mode_IN) | \
								PIN_MODE(14,GPIO_Mode_IN) | \
								PIN_MODE(15,GPIO_Mode_IN)

#define	CARIBOU_PORTC_OTYPER	PIN_OTYPER(0,GPIO_OType_PP) |	\
								PIN_OTYPER(1,GPIO_OType_PP) |		/* ETH_MDC --------------------------> PC1 */	\
								PIN_OTYPER(2,GPIO_OType_PP) |	\
								PIN_OTYPER(3,GPIO_OType_PP) |	\
								PIN_OTYPER(4,GPIO_OType_PP) |		/* ETH_MII_RXD0/ETH_RMII_RXD0 -------> PC4 */	\
								PIN_OTYPER(5,GPIO_OType_PP) |		/* ETH_MII_RXD1/ETH_RMII_RXD1 -------> PC5 */	\
								PIN_OTYPER(6,GPIO_OType_PP) |		/* USART6 DEBUG TX */							\
								PIN_OTYPER(7,GPIO_OType_PP) |		/* USART6 DEBUG RX */							\
								PIN_OTYPER(8,GPIO_OType_PP) |	\
								PIN_OTYPER(9,GPIO_OType_PP) |	\
								PIN_OTYPER(10,GPIO_OType_PP) |	\
								PIN_OTYPER(11,GPIO_OType_PP) |	\
								PIN_OTYPER(12,GPIO_OType_PP) |	\
								PIN_OTYPER(13,GPIO_OType_PP) |	\
								PIN_OTYPER(14,GPIO_OType_PP) |	\
								PIN_OTYPER(15,GPIO_OType_PP)

#define	CARIBOU_PORTC_OSPEEDR	PIN_OSPEEDR(0,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(1,GPIO_Speed_100MHz) |	/* ETH_MDC --------------------------> PC1 */	\
								PIN_OSPEEDR(2,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(3,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(4,GPIO_Speed_100MHz) |	/* ETH_MII_RXD0/ETH_RMII_RXD0 -------> PC4 */	\
								PIN_OSPEEDR(5,GPIO_Speed_100MHz) |	/* ETH_MII_RXD1/ETH_RMII_RXD1 -------> PC5 */	\
								PIN_OSPEEDR(6,GPIO_Speed_2MHz) |	/* USART6 DEBUG TX */							\
								PIN_OSPEEDR(7,GPIO_Speed_2MHz) |	/* USART6 DEBUG RX */							\
								PIN_OSPEEDR(8,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(9,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(10,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(11,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(12,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(13,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(14,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(15,GPIO_Speed_2MHz)

#define	CARIBOU_PORTC_PUPDR		PIN_PUPDR(0,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(1,GPIO_PuPd_NOPULL) |		/* ETH_MDC --------------------------> PC1 */	\
								PIN_PUPDR(2,GPIO_PuPd_NOPULL) |			\
								PIN_PUPDR(3,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(4,GPIO_PuPd_NOPULL) |		/* ETH_MII_RXD0/ETH_RMII_RXD0 -------> PC4 */	\
								PIN_PUPDR(5,GPIO_PuPd_NOPULL) |		/* ETH_MII_RXD1/ETH_RMII_RXD1 -------> PC5 */	\
								PIN_PUPDR(6,GPIO_PuPd_NOPULL) |		/* USART6 DEBUG TX */							\
								PIN_PUPDR(7,GPIO_PuPd_NOPULL) |		/* USART6 DEBUG RX */							\
								PIN_PUPDR(8,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(9,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(10,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(11,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(12,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(13,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(14,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(15,GPIO_PuPd_NOPULL)

#define	CARIBOU_PORTC_AFRL		PIN_AFR(0,GPIO_AF_GPIO) |	\
								PIN_AFR(1,GPIO_AF11_ETH) |			/* ETH_MDC --------------------------> PC1 */	\
								PIN_AFR(2,GPIO_AF_GPIO) |	\
								PIN_AFR(3,GPIO_AF_GPIO) |	\
								PIN_AFR(4,GPIO_AF11_ETH) |			/* ETH_MII_RXD0/ETH_RMII_RXD0 -------> PC4 */	\
								PIN_AFR(5,GPIO_AF11_ETH) |			/* ETH_MII_RXD1/ETH_RMII_RXD1 -------> PC5 */	\
								PIN_AFR(6,GPIO_AF8_USART6) |		/* USART6 DEBUG TX */							\
								PIN_AFR(7,GPIO_AF8_USART6)			/* USART6 DEBUG RX */							
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
#define	CARIBOU_PORTD_MODE		PIN_MODE(0,GPIO_Mode_AF) |			/* SDRAM - DQ2 */			\
								PIN_MODE(1,GPIO_Mode_AF) |			/* SDRAM - DQ3 */			\
								PIN_MODE(2,GPIO_Mode_IN) |	\
								PIN_MODE(3,GPIO_Mode_IN) |	\
								PIN_MODE(4,GPIO_Mode_OUT) |			/*MODBUS/RTU Direction Control */	\
								PIN_MODE(5,GPIO_Mode_IN) |	\
								PIN_MODE(6,GPIO_Mode_IN) |	\
								PIN_MODE(7,GPIO_Mode_IN) |	\
								PIN_MODE(8,GPIO_Mode_AF) |			/* SDRAM - DQ13 */			\
								PIN_MODE(9,GPIO_Mode_AF) |			/* SDRAM - DQ14 */			\
								PIN_MODE(10,GPIO_Mode_AF) | 		/* SDRAM - DQ15 */			\
								PIN_MODE(11,GPIO_Mode_IN) | \
								PIN_MODE(12,GPIO_Mode_IN) |	\
								PIN_MODE(13,GPIO_Mode_IN) |	\
								PIN_MODE(14,GPIO_Mode_AF) |			/* SDRAM - DQ0 */			\
								PIN_MODE(15,GPIO_Mode_AF)			/* SDRAM - DQ1 */			

#define	CARIBOU_PORTD_OTYPER	PIN_OTYPER(0,GPIO_OType_PP) |		/* SDRAM - DQ2 */			\
								PIN_OTYPER(1,GPIO_OType_PP) |		/* SDRAM - DQ3 */			\
								PIN_OTYPER(2,GPIO_OType_PP) |	\
								PIN_OTYPER(3,GPIO_OType_PP) |	\
								PIN_OTYPER(4,GPIO_OType_PP) |		/* MODBUS/RTU Direction Control */	\
								PIN_OTYPER(5,GPIO_OType_PP) |	\
								PIN_OTYPER(6,GPIO_OType_PP) |	\
								PIN_OTYPER(7,GPIO_OType_PP) |	\
								PIN_OTYPER(8,GPIO_OType_PP) |		/* SDRAM - DQ13 */			\
								PIN_OTYPER(9,GPIO_OType_PP) |		/* SDRAM - DQ14 */			\
								PIN_OTYPER(10,GPIO_OType_PP) |		/* SDRAM - DQ15 */			\
								PIN_OTYPER(11,GPIO_OType_PP) |	\
								PIN_OTYPER(12,GPIO_OType_PP) |	\
								PIN_OTYPER(13,GPIO_OType_PP) |		/* SDRAM - DQ0 */			\
								PIN_OTYPER(14,GPIO_OType_PP) |		/* SDRAM - DQ1 */			\
								PIN_OTYPER(15,GPIO_OType_PP)

#define	CARIBOU_PORTD_OSPEEDR	PIN_OSPEEDR(0,GPIO_Speed_100MHz) |	/* SDRAM - DQ2 */			\
								PIN_OSPEEDR(1,GPIO_Speed_100MHz) |	/* SDRAM - DQ3 */			\
								PIN_OSPEEDR(2,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(3,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(4,GPIO_Speed_2MHz) |	/* MODBUS/RTU Direction Control */	\
								PIN_OSPEEDR(5,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(6,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(7,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(8,GPIO_Speed_100MHz) |	/* SDRAM - DQ13 */			\
								PIN_OSPEEDR(9,GPIO_Speed_100MHz) |	/* SDRAM - DQ14 */			\
								PIN_OSPEEDR(10,GPIO_Speed_100MHz) |	/* SDRAM - DQ15 */			\
								PIN_OSPEEDR(11,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(12,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(13,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(14,GPIO_Speed_100MHz) |	/* SDRAM - DQ0 */			\
								PIN_OSPEEDR(15,GPIO_Speed_100MHz)	/* SDRAM - DQ1 */			

#define	CARIBOU_PORTD_PUPDR		PIN_PUPDR(0,GPIO_PuPd_NOPULL) |		/* SDRAM - DQ2 */			\
								PIN_PUPDR(1,GPIO_PuPd_NOPULL) |		/* SDRAM - DQ3 */			\
								PIN_PUPDR(2,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(3,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(4,GPIO_PuPd_NOPULL) |		/* MODBUS/RTU Direction Control */	\
								PIN_PUPDR(5,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(6,GPIO_PuPd_UP) |	\
								PIN_PUPDR(7,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(8,GPIO_PuPd_NOPULL) |		/* SDRAM - DQ13 */			\
								PIN_PUPDR(9,GPIO_PuPd_NOPULL) |		/* SDRAM - DQ14 */			\
								PIN_PUPDR(10,GPIO_PuPd_NOPULL) |	/* SDRAM - DQ15 */			\
								PIN_PUPDR(11,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(12,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(13,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(14,GPIO_PuPd_NOPULL) |	/* SDRAM - DQ0 */			\
								PIN_PUPDR(15,GPIO_PuPd_NOPULL)		/* SDRAM - DQ1 */			

#define	CARIBOU_PORTD_AFRL		PIN_AFR(0,GPIO_AF12_FMC) |			/* SDRAM - DQ2 */			\
								PIN_AFR(1,GPIO_AF12_FMC) |			/* SDRAM - DQ3 */			\
								PIN_AFR(2,GPIO_AF_GPIO) |	\
								PIN_AFR(3,GPIO_AF_GPIO) |	\
								PIN_AFR(4,GPIO_AF_GPIO) |			/* MODBUS/RTU Direction Control */	\
								PIN_AFR(5,GPIO_AF_GPIO) |	\
								PIN_AFR(6,GPIO_AF_GPIO) |	\
								PIN_AFR(7,GPIO_AF_GPIO)
#define	CARIBOU_PORTD_AFRH		PIN_AFR(0,GPIO_AF12_FMC) |			/* SDRAM - DQ13 */			\
								PIN_AFR(1,GPIO_AF12_FMC) |			/* SDRAM - DQ14 */			\
								PIN_AFR(2,GPIO_AF12_FMC) |			/* SDRAM - DQ15 */			\
								PIN_AFR(3,GPIO_AF_GPIO) |	\
								PIN_AFR(4,GPIO_AF_GPIO) |	\
								PIN_AFR(5,GPIO_AF_GPIO) |	\
								PIN_AFR(6,GPIO_AF12_FMC) |			/* SDRAM - DQ0 */			\
								PIN_AFR(7,GPIO_AF12_FMC)			/* SDRAM - DQ1 */			
/**
 ** PORT E
 */
#define	CARIBOU_PORTE_MODE		PIN_MODE(0,GPIO_Mode_AF) |			/* SDRAM - NBL0 */	\
								PIN_MODE(1,GPIO_Mode_AF) |			/* SDRAM - NBL1 */	\
								PIN_MODE(2,GPIO_Mode_IN) |	\
								PIN_MODE(3,GPIO_Mode_OUT) |			/* LED1 */					\
								PIN_MODE(4,GPIO_Mode_OUT) |			/* LED2 */					\
								PIN_MODE(5,GPIO_Mode_OUT) |			/* LED3 */					\
								PIN_MODE(6,GPIO_Mode_OUT) |			/* LED4*/					\
								PIN_MODE(7,GPIO_Mode_AF) |			/* SDRAM - DQ4 */			\
								PIN_MODE(8,GPIO_Mode_AF) |			/* SDRAM - DQ5 */			\
								PIN_MODE(9,GPIO_Mode_AF) |			/* SDRAM - DQ6 */			\
								PIN_MODE(10,GPIO_Mode_AF) | 		/* SDRAM - DQ7 */			\
								PIN_MODE(11,GPIO_Mode_AF) | 		/* SDRAM - DQ8 */			\
								PIN_MODE(12,GPIO_Mode_AF) | 		/* SDRAM - DQ9 */			\
								PIN_MODE(13,GPIO_Mode_AF) | 		/* SDRAM - DQ10 */			\
								PIN_MODE(14,GPIO_Mode_AF) | 		/* SDRAM - DQ11 */			\
								PIN_MODE(15,GPIO_Mode_AF)			/* SDRAM - DQ12 */			

#define	CARIBOU_PORTE_OTYPER	PIN_OTYPER(0,GPIO_OType_PP) |		/* SDRAM - NBL0 */	\
								PIN_OTYPER(1,GPIO_OType_PP) |		/* SDRAM - NBL0 */	\
								PIN_OTYPER(2,GPIO_OType_PP) |		\
								PIN_OTYPER(3,GPIO_OType_PP) |		/* LED1 */					\
								PIN_OTYPER(4,GPIO_OType_PP) |		/* LED2 */					\
								PIN_OTYPER(5,GPIO_OType_PP) |		/* LED3 */					\
								PIN_OTYPER(6,GPIO_OType_PP) |		/* LED4 */					\
								PIN_OTYPER(7,GPIO_OType_PP) |		/* SDRAM - DQ4 */			\
								PIN_OTYPER(8,GPIO_OType_PP) |		/* SDRAM - DQ5 */			\
								PIN_OTYPER(9,GPIO_OType_PP) |		/* SDRAM - DQ6 */			\
								PIN_OTYPER(10,GPIO_OType_PP) |		/* SDRAM - DQ7 */			\
								PIN_OTYPER(11,GPIO_OType_PP) |		/* SDRAM - DQ8 */			\
								PIN_OTYPER(12,GPIO_OType_PP) |		/* SDRAM - DQ9 */			\
								PIN_OTYPER(13,GPIO_OType_PP) |		/* SDRAM - DQ10 */			\
								PIN_OTYPER(14,GPIO_OType_PP) |		/* SDRAM - DQ11 */			\
								PIN_OTYPER(15,GPIO_OType_PP)		/* SDRAM - DQ12 */			

#define	CARIBOU_PORTE_OSPEEDR	PIN_OSPEEDR(0,GPIO_Speed_100MHz) |	/* SDRAM - NBL0 */	\
								PIN_OSPEEDR(1,GPIO_Speed_100MHz) |	/* SDRAM - NBL1 */	\
								PIN_OSPEEDR(2,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(3,GPIO_Speed_2MHz) |	/* LED1 */					\
								PIN_OSPEEDR(4,GPIO_Speed_2MHz) |	/* LED2 */					\
								PIN_OSPEEDR(5,GPIO_Speed_2MHz) |	/* LED3 */					\
								PIN_OSPEEDR(6,GPIO_Speed_2MHz) |	/* LED4 */					\
								PIN_OSPEEDR(7,GPIO_Speed_100MHz) |	/* SDRAM - DQ4 */			\
								PIN_OSPEEDR(8,GPIO_Speed_100MHz) |	/* SDRAM - DQ5 */			\
								PIN_OSPEEDR(9,GPIO_Speed_100MHz) |	/* SDRAM - DQ6 */			\
								PIN_OSPEEDR(10,GPIO_Speed_100MHz) |	/* SDRAM - DQ7 */			\
								PIN_OSPEEDR(11,GPIO_Speed_100MHz) |	/* SDRAM - DQ8 */			\
								PIN_OSPEEDR(12,GPIO_Speed_100MHz) |	/* SDRAM - DQ9 */			\
								PIN_OSPEEDR(13,GPIO_Speed_100MHz) |	/* SDRAM - DQ10 */			\
								PIN_OSPEEDR(14,GPIO_Speed_100MHz) |	/* SDRAM - DQ11 */			\
								PIN_OSPEEDR(15,GPIO_Speed_100MHz)	/* SDRAM - DQ12 */			

#define	CARIBOU_PORTE_PUPDR		PIN_PUPDR(0,GPIO_PuPd_NOPULL) |		/* SDRAM - NBL0 */	\
								PIN_PUPDR(1,GPIO_PuPd_NOPULL) |		/* SDRAM - NBL1 */	\
								PIN_PUPDR(2,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(3,GPIO_PuPd_NOPULL) |		/* LED1 */					\
								PIN_PUPDR(4,GPIO_PuPd_NOPULL) |		/* LED2 */					\
								PIN_PUPDR(5,GPIO_PuPd_NOPULL) |		/* LED3 */					\
								PIN_PUPDR(6,GPIO_PuPd_NOPULL) |		/* LED4 */					\
								PIN_PUPDR(7,GPIO_PuPd_NOPULL) |		/* SDRAM - DQ4 */			\
								PIN_PUPDR(8,GPIO_PuPd_NOPULL) |		/* SDRAM - DQ5 */			\
								PIN_PUPDR(9,GPIO_PuPd_NOPULL) |		/* SDRAM - DQ6 */			\
								PIN_PUPDR(10,GPIO_PuPd_NOPULL) |	/* SDRAM - DQ7 */			\
								PIN_PUPDR(11,GPIO_PuPd_NOPULL) |	/* SDRAM - DQ8 */			\
								PIN_PUPDR(12,GPIO_PuPd_NOPULL) |	/* SDRAM - DQ9 */			\
								PIN_PUPDR(13,GPIO_PuPd_NOPULL) |	/* SDRAM - DQ10 */			\
								PIN_PUPDR(14,GPIO_PuPd_NOPULL) |	/* SDRAM - DQ11 */			\
								PIN_PUPDR(15,GPIO_PuPd_NOPULL)		/* SDRAM - DQ12 */			

#define	CARIBOU_PORTE_AFRL		PIN_AFR(0,GPIO_AF12_FMC) |			/* SDRAM - NBL0 */	\
								PIN_AFR(1,GPIO_AF12_FMC) |			/* SDRAM - NBL1 */	\
								PIN_AFR(2,GPIO_AF_GPIO) |	\
								PIN_AFR(3,GPIO_AF_GPIO) |			/* LED1 */					\
								PIN_AFR(4,GPIO_AF_GPIO) |			/* LED2 */					\
								PIN_AFR(5,GPIO_AF_GPIO) |			/* LED3 */					\
								PIN_AFR(6,GPIO_AF_GPIO) |			/* LED4 */					\
								PIN_AFR(7,GPIO_AF12_FMC)			/* SDRAM - DQ4 */			
#define	CARIBOU_PORTE_AFRH		PIN_AFR(0,GPIO_AF12_FMC) |			/* SDRAM - DQ5 */			\
								PIN_AFR(1,GPIO_AF12_FMC) |			/* SDRAM - DQ6 */			\
								PIN_AFR(2,GPIO_AF12_FMC) |			/* SDRAM - DQ7 */			\
								PIN_AFR(3,GPIO_AF12_FMC) |			/* SDRAM - DQ8 */			\
								PIN_AFR(4,GPIO_AF12_FMC) |			/* SDRAM - DQ9 */			\
								PIN_AFR(5,GPIO_AF12_FMC) |			/* SDRAM - DQ10 */			\
								PIN_AFR(6,GPIO_AF12_FMC) |			/* SDRAM - DQ11 */			\
								PIN_AFR(7,GPIO_AF12_FMC)			/* SDRAM - DQ12 */			
/**
 ** PORT F
 */
#define	CARIBOU_PORTF_MODE		PIN_MODE(0,GPIO_Mode_AF) |			/* SDRAM - A0 */		\
								PIN_MODE(1,GPIO_Mode_AF) |			/* SDRAM - A1 */		\
								PIN_MODE(2,GPIO_Mode_AF) |			/* SDRAM - A2 */		\
								PIN_MODE(3,GPIO_Mode_AF) |			/* SDRAM - A3 */		\
								PIN_MODE(4,GPIO_Mode_AF) |			/* SDRAM - A4 */		\
								PIN_MODE(5,GPIO_Mode_AF) |			/* SDRAM - A5 */		\
								PIN_MODE(6,GPIO_Mode_IN) |	\
								PIN_MODE(7,GPIO_Mode_IN) |	\
								PIN_MODE(8,GPIO_Mode_IN) |	\
								PIN_MODE(9,GPIO_Mode_IN) |	\
								PIN_MODE(10,GPIO_Mode_IN) | \
								PIN_MODE(11,GPIO_Mode_AF) | 		/* SDRAM - RAS# */		\
								PIN_MODE(12,GPIO_Mode_AF) |			/* SDRAM - A6 */		\
								PIN_MODE(13,GPIO_Mode_AF) | 		/* SDRAM - A7 */		\
								PIN_MODE(14,GPIO_Mode_AF) | 		/* SDRAM - A8 */		\
								PIN_MODE(15,GPIO_Mode_AF)			/* SDRAM - A9 */		

#define	CARIBOU_PORTF_OTYPER	PIN_OTYPER(0,GPIO_OType_PP) |		/* SDRAM - A0 */		\
								PIN_OTYPER(1,GPIO_OType_PP) |		/* SDRAM - A1 */		\
								PIN_OTYPER(2,GPIO_OType_PP) |		/* SDRAM - A2 */		\
								PIN_OTYPER(3,GPIO_OType_PP) |		/* SDRAM - A3 */		\
								PIN_OTYPER(4,GPIO_OType_PP) |		/* SDRAM - A4 */		\
								PIN_OTYPER(5,GPIO_OType_PP) |		/* SDRAM - A5 */		\
								PIN_OTYPER(6,GPIO_OType_PP) |	\
								PIN_OTYPER(7,GPIO_OType_PP) |	\
								PIN_OTYPER(8,GPIO_OType_PP) |	\
								PIN_OTYPER(9,GPIO_OType_PP) |	\
								PIN_OTYPER(10,GPIO_OType_PP) |	\
								PIN_OTYPER(11,GPIO_OType_PP) |		/* SDRAM - RAS# */		\
								PIN_OTYPER(12,GPIO_OType_PP) |		/* SDRAM - A6 */		\
								PIN_OTYPER(13,GPIO_OType_PP) |		/* SDRAM - A7 */		\
								PIN_OTYPER(14,GPIO_OType_PP) |		/* SDRAM - A8 */		\
								PIN_OTYPER(15,GPIO_OType_PP)		/* SDRAM - A9 */		

#define	CARIBOU_PORTF_OSPEEDR	PIN_OSPEEDR(0,GPIO_Speed_100MHz) |	/* SDRAM - A0 */		\
								PIN_OSPEEDR(1,GPIO_Speed_100MHz) |	/* SDRAM - A1 */		\
								PIN_OSPEEDR(2,GPIO_Speed_100MHz) |	/* SDRAM - A2 */		\
								PIN_OSPEEDR(3,GPIO_Speed_100MHz) |	/* SDRAM - A3 */		\
								PIN_OSPEEDR(4,GPIO_Speed_100MHz) |	/* SDRAM - A4 */		\
								PIN_OSPEEDR(5,GPIO_Speed_100MHz) |	/* SDRAM - A5 */		\
								PIN_OSPEEDR(6,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(7,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(8,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(9,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(10,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(11,GPIO_Speed_100MHz) |	/* SDRAM - RAS# */		\
								PIN_OSPEEDR(12,GPIO_Speed_100MHz) |	/* SDRAM - A6 */		\
								PIN_OSPEEDR(13,GPIO_Speed_100MHz) |	/* SDRAM - A7 */		\
								PIN_OSPEEDR(14,GPIO_Speed_100MHz) |	/* SDRAM - A8 */		\
								PIN_OSPEEDR(15,GPIO_Speed_100MHz)	/* SDRAM - A9 */		

#define	CARIBOU_PORTF_PUPDR		PIN_PUPDR(0,GPIO_PuPd_NOPULL) |		/* SDRAM - A0 */		\
								PIN_PUPDR(1,GPIO_PuPd_NOPULL) |		/* SDRAM - A1 */		\
								PIN_PUPDR(2,GPIO_PuPd_NOPULL) |		/* SDRAM - A2 */		\
								PIN_PUPDR(3,GPIO_PuPd_NOPULL) |		/* SDRAM - A3 */		\
								PIN_PUPDR(4,GPIO_PuPd_NOPULL) |		/* SDRAM - A4 */		\
								PIN_PUPDR(5,GPIO_PuPd_NOPULL) |		/* SDRAM - A5 */		\
								PIN_PUPDR(6,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(7,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(8,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(9,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(10,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(11,GPIO_PuPd_NOPULL) |	/* SDRAM - RAS# */		\
								PIN_PUPDR(12,GPIO_PuPd_NOPULL) |	/* SDRAM - A6 */		\
								PIN_PUPDR(13,GPIO_PuPd_NOPULL) |	/* SDRAM - A7 */		\
								PIN_PUPDR(14,GPIO_PuPd_NOPULL) |	/* SDRAM - A8 */		\
								PIN_PUPDR(15,GPIO_PuPd_NOPULL)		/* SDRAM - A9 */		

#define	CARIBOU_PORTF_AFRL		PIN_AFR(0,GPIO_AF12_FMC) |			/* SDRAM - A0 */		\
								PIN_AFR(1,GPIO_AF12_FMC) |			/* SDRAM - A1 */		\
								PIN_AFR(2,GPIO_AF12_FMC) |			/* SDRAM - A2 */		\
								PIN_AFR(3,GPIO_AF12_FMC) |			/* SDRAM - A3 */		\
								PIN_AFR(4,GPIO_AF12_FMC) |			/* SDRAM - A4 */		\
								PIN_AFR(5,GPIO_AF12_FMC) |			/* SDRAM - A5 */		\
								PIN_AFR(6,GPIO_AF_GPIO) |	\
								PIN_AFR(7,GPIO_AF_GPIO)
#define	CARIBOU_PORTF_AFRH		PIN_AFR(0,GPIO_AF_GPIO) |	\
								PIN_AFR(1,GPIO_AF_GPIO) |	\
								PIN_AFR(2,GPIO_AF_GPIO) |	\
								PIN_AFR(3,GPIO_AF12_FMC) |			/* SDRAM - RAS# */		\
								PIN_AFR(4,GPIO_AF12_FMC) |			/* SDRAM - A6 */		\
								PIN_AFR(5,GPIO_AF12_FMC) |			/* SDRAM - A7 */		\
								PIN_AFR(6,GPIO_AF12_FMC) |			/* SDRAM - A8 */		\
								PIN_AFR(7,GPIO_AF12_FMC)			/* SDRAM - A9 */		
/**
 ** PORT G
 */
#define	CARIBOU_PORTG_MODE		PIN_MODE(0,GPIO_Mode_AF) |			/* SDRAM - A10 */		\
								PIN_MODE(1,GPIO_Mode_AF) |			/* SDRAM - A11 */		\
								PIN_MODE(2,GPIO_Mode_AF) |			/* SDRAM - A12 */		\
								PIN_MODE(3,GPIO_Mode_IN) |	\
								PIN_MODE(4,GPIO_Mode_AF) |			/* SDRAM - BA0 */		\
								PIN_MODE(5,GPIO_Mode_AF) |			/* SDRAM - BA1 */		\
								PIN_MODE(6,GPIO_Mode_IN) |	\
								PIN_MODE(7,GPIO_Mode_OUT) |			/* ADP - Direction Control */	\
								PIN_MODE(8,GPIO_Mode_AF) |			/* SDRAM - CLK */		\
								PIN_MODE(9,GPIO_Mode_IN) |	\
								PIN_MODE(10,GPIO_Mode_OUT) |		/* ETH PHY ~nRST */ \
								PIN_MODE(11,GPIO_Mode_AF) |			/* ETH_MII_TX_EN/ETH_RMII_TX_EN -----> PG11 */	\
								PIN_MODE(12,GPIO_Mode_IN) | \
								PIN_MODE(13,GPIO_Mode_AF) |			/* ETH_MII_TXD0/ETH_RMII_TXD0 -------> PG13 */	\
								PIN_MODE(14,GPIO_Mode_AF) |			/* ETH_MII_TXD1/ETH_RMII_TXD1 -------> PG14 */	\
								PIN_MODE(15,GPIO_Mode_AF)			/* SDRAM - CAS# */

#define	CARIBOU_PORTG_OTYPER	PIN_OTYPER(0,GPIO_OType_PP) |		/* SDRAM - A10 */		\
								PIN_OTYPER(1,GPIO_OType_PP) |		/* SDRAM - A11 */		\
								PIN_OTYPER(2,GPIO_OType_PP) |		/* SDRAM - A12 */		\
								PIN_OTYPER(3,GPIO_OType_PP) |	\
								PIN_OTYPER(4,GPIO_OType_PP) |		/* SDRAM - BA0 */		\
								PIN_OTYPER(5,GPIO_OType_PP) |		/* SDRAM - BA1 */		\
								PIN_OTYPER(6,GPIO_OType_PP) |	\
								PIN_OTYPER(7,GPIO_OType_PP) |		/* ADP - Direction Control */	\
								PIN_OTYPER(8,GPIO_OType_PP) |		/* SDRAM - CLK */		\
								PIN_OTYPER(9,GPIO_OType_PP) |	\
								PIN_OTYPER(10,GPIO_OType_OD) |		/* ETH PHY ~nRST */								\
								PIN_OTYPER(11,GPIO_OType_PP) |		/* ETH_MII_TX_EN/ETH_RMII_TX_EN -----> PG11 */	\
								PIN_OTYPER(12,GPIO_OType_PP) |	\
								PIN_OTYPER(13,GPIO_OType_PP) |		/* ETH_MII_TXD0/ETH_RMII_TXD0 -------> PG13 */	\
								PIN_OTYPER(14,GPIO_OType_PP) |		/* ETH_MII_TXD1/ETH_RMII_TXD1 -------> PG14 */	\
								PIN_OTYPER(15,GPIO_OType_PP)		/* SDRAM - CAS# */

#define	CARIBOU_PORTG_OSPEEDR	PIN_OSPEEDR(0,GPIO_Speed_100MHz) |	/* SDRAM - A10 */		\
								PIN_OSPEEDR(1,GPIO_Speed_100MHz) |	/* SDRAM - A10 */		\
								PIN_OSPEEDR(2,GPIO_Speed_100MHz) |	/* SDRAM - A10 */		\
								PIN_OSPEEDR(3,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(4,GPIO_Speed_100MHz) |	/* SDRAM - BA0 */		\
								PIN_OSPEEDR(5,GPIO_Speed_100MHz) |	/* SDRAM - BA1 */		\
								PIN_OSPEEDR(6,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(7,GPIO_Speed_2MHz) |	/* ADP - Direction Control */	\
								PIN_OSPEEDR(8,GPIO_Speed_100MHz) |	/* SDRAM - CLK */		\
								PIN_OSPEEDR(9,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(10,GPIO_Speed_2MHz) |	/* ETH PHY ~nRST */								\
								PIN_OSPEEDR(11,GPIO_Speed_50MHz) |	/* ETH_MII_TX_EN/ETH_RMII_TX_EN -----> PG11 */	\
								PIN_OSPEEDR(12,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(13,GPIO_Speed_100MHz) |	/* ETH_MII_TXD0/ETH_RMII_TXD0 -------> PG13 */	\
								PIN_OSPEEDR(14,GPIO_Speed_100MHz) |	/* ETH_MII_TXD1/ETH_RMII_TXD1 -------> PG14 */	\
								PIN_OSPEEDR(15,GPIO_Speed_100MHz)	/* SDRAM - CAS# */

#define	CARIBOU_PORTG_PUPDR		PIN_PUPDR(0,GPIO_PuPd_NOPULL) |		/* SDRAM - A10 */		\
								PIN_PUPDR(1,GPIO_PuPd_NOPULL) |		/* SDRAM - A11 */		\
								PIN_PUPDR(2,GPIO_PuPd_NOPULL) |		/* SDRAM - A12 */		\
								PIN_PUPDR(3,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(4,GPIO_PuPd_NOPULL) |		/* SDRAM - BA0 */		\
								PIN_PUPDR(5,GPIO_PuPd_NOPULL) |		/* SDRAM - BA1 */		\
								PIN_PUPDR(6,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(7,GPIO_PuPd_NOPULL) |		/* ADP - Direction Control */	\
								PIN_PUPDR(8,GPIO_PuPd_NOPULL) |		/* SDRAM - CLK */		\
								PIN_PUPDR(9,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(10,GPIO_PuPd_UP) |		/* ETH PHY ~nRST */								\
								PIN_PUPDR(11,GPIO_PuPd_NOPULL) |	/* ETH_MII_TX_EN/ETH_RMII_TX_EN -----> PG11 */	\
								PIN_PUPDR(12,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(13,GPIO_PuPd_NOPULL) |	/* ETH_MII_TXD0/ETH_RMII_TXD0 -------> PG13 */	\
								PIN_PUPDR(14,GPIO_PuPd_NOPULL) |	/* ETH_MII_TXD1/ETH_RMII_TXD1 -------> PG14 */	\
								PIN_PUPDR(15,GPIO_PuPd_NOPULL)		/* SDRAM - CAS# */

#define	CARIBOU_PORTG_AFRL		PIN_AFR(0,GPIO_AF12_FMC) |			/* SDRAM - A10 */		\
								PIN_AFR(1,GPIO_AF12_FMC) |			/* SDRAM - A11 */		\
								PIN_AFR(2,GPIO_AF12_FMC) |			/* SDRAM - A12 */		\
								PIN_AFR(3,GPIO_AF_GPIO) |	\
								PIN_AFR(4,GPIO_AF12_FMC) |			/* SDRAM - BA0 */		\
								PIN_AFR(5,GPIO_AF12_FMC) |			/* SDRAM - BA1 */		\
								PIN_AFR(6,GPIO_AF_GPIO) |	\
								PIN_AFR(7,GPIO_AF_GPIO)				/* ADP - Direction Control */	
#define	CARIBOU_PORTG_AFRH		PIN_AFR(0,GPIO_AF12_FMC) |			/* SDRAM - CLK */		\
								PIN_AFR(1,GPIO_AF_GPIO) |	\
								PIN_AFR(2,GPIO_AF_GPIO) |			/* ETH PHY ~nRST */ \
								PIN_AFR(3,GPIO_AF11_ETH) |			/* ETH_MII_TX_EN/ETH_RMII_TX_EN -----> PG11 */	\
								PIN_AFR(4,GPIO_AF_GPIO) |	\
								PIN_AFR(5,GPIO_AF11_ETH) |			/* ETH_MII_TXD0/ETH_RMII_TXD0 -------> PG13 */	\
								PIN_AFR(6,GPIO_AF11_ETH) |			/* ETH_MII_TXD1/ETH_RMII_TXD1 -------> PG14 */	\
								PIN_AFR(7,GPIO_AF12_FMC)			/* SDRAM - CAS# */
/**
 ** PORT H
 */
#define	CARIBOU_PORTH_MODE		PIN_MODE(0,GPIO_Mode_IN) |	\
								PIN_MODE(1,GPIO_Mode_IN) |	\
								PIN_MODE(2,GPIO_Mode_AF) |			/* SDRAM - CKE */			\
								PIN_MODE(3,GPIO_Mode_AF) |			/* SDRAM - CS# */			\
								PIN_MODE(4,GPIO_Mode_IN) |	\
								PIN_MODE(5,GPIO_Mode_AF) |			/* SDRAM - WE# */			\
								PIN_MODE(6,GPIO_Mode_IN) |	\
								PIN_MODE(7,GPIO_Mode_IN) |	\
								PIN_MODE(8,GPIO_Mode_IN) |	\
								PIN_MODE(9,GPIO_Mode_IN) |	\
								PIN_MODE(10,GPIO_Mode_IN) | \
								PIN_MODE(11,GPIO_Mode_IN) | \
								PIN_MODE(12,GPIO_Mode_IN) | \
								PIN_MODE(13,GPIO_Mode_IN) | \
								PIN_MODE(14,GPIO_Mode_OUT) |		/* OLED_RESET */			\
								PIN_MODE(15,GPIO_Mode_OUT)			/* OLE_CD */

#define	CARIBOU_PORTH_OTYPER	PIN_OTYPER(0,GPIO_OType_PP) |	\
								PIN_OTYPER(1,GPIO_OType_PP) |	\
								PIN_OTYPER(2,GPIO_OType_PP) |		/* SDRAM - CKE */			\
								PIN_OTYPER(3,GPIO_OType_PP) |		/* SDRAM - CS# */			\
								PIN_OTYPER(4,GPIO_OType_PP) |	\
								PIN_OTYPER(5,GPIO_OType_PP) |		/* SDRAM - WE# */			\
								PIN_OTYPER(6,GPIO_OType_PP) |	\
								PIN_OTYPER(7,GPIO_OType_PP) |	\
								PIN_OTYPER(8,GPIO_OType_PP) |	\
								PIN_OTYPER(9,GPIO_OType_PP) |	\
								PIN_OTYPER(10,GPIO_OType_PP) |	\
								PIN_OTYPER(11,GPIO_OType_PP) |	\
								PIN_OTYPER(12,GPIO_OType_PP) |	\
								PIN_OTYPER(13,GPIO_OType_PP) |	\
								PIN_OTYPER(14,GPIO_OType_PP) |		/* OLED_RESET */			\
								PIN_OTYPER(15,GPIO_OType_PP)		/* OLED_CD */

#define	CARIBOU_PORTH_OSPEEDR	PIN_OSPEEDR(0,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(1,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(2,GPIO_Speed_100MHz) |	/* SDRAM - CKE */			\
								PIN_OSPEEDR(3,GPIO_Speed_100MHz) |	/* SDRAM - CS# */			\
								PIN_OSPEEDR(4,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(5,GPIO_Speed_100MHz) |	/* SDRAM - WE# */			\
								PIN_OSPEEDR(6,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(7,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(8,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(9,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(10,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(11,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(12,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(13,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(14,GPIO_Speed_2MHz) |	/* OLED_RESET */			\
								PIN_OSPEEDR(15,GPIO_Speed_2MHz)		/* OLED_CD */

#define	CARIBOU_PORTH_PUPDR		PIN_PUPDR(0,GPIO_PuPd_NOPULL) |		\
								PIN_PUPDR(1,GPIO_PuPd_NOPULL) |		\
								PIN_PUPDR(2,GPIO_PuPd_NOPULL) |		/* SDRAM - CKE */			\
								PIN_PUPDR(3,GPIO_PuPd_NOPULL) |		/* SDRAM - CS# */			\
								PIN_PUPDR(4,GPIO_PuPd_NOPULL) |		\
								PIN_PUPDR(5,GPIO_PuPd_NOPULL) |		/* SDRAM - WE# */			\
								PIN_PUPDR(6,GPIO_PuPd_NOPULL) |		\
								PIN_PUPDR(7,GPIO_PuPd_NOPULL) |		\
								PIN_PUPDR(8,GPIO_PuPd_NOPULL) |		\
								PIN_PUPDR(9,GPIO_PuPd_NOPULL) |		\
								PIN_PUPDR(10,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(11,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(12,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(13,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(14,GPIO_PuPd_NOPULL) |	/* OLE_RESET */				\
								PIN_PUPDR(15,GPIO_PuPd_NOPULL)		/* OLED_CD */

#define	CARIBOU_PORTH_AFRL		PIN_AFR(0,GPIO_AF_GPIO) |	\
								PIN_AFR(1,GPIO_AF_GPIO) |	\
								PIN_AFR(2,GPIO_AF12_FMC) |			/* SDRAM - CKE */			\
								PIN_AFR(3,GPIO_AF12_FMC) |			/* SDRAM - CS# */			\
								PIN_AFR(4,GPIO_AF_GPIO) |	\
								PIN_AFR(5,GPIO_AF12_FMC) |			/* SDRAM - WE# */			\
								PIN_AFR(6,GPIO_AF_GPIO) |	\
								PIN_AFR(7,GPIO_AF_GPIO)
#define	CARIBOU_PORTH_AFRH		PIN_AFR(0,GPIO_AF_GPIO) |	\
								PIN_AFR(1,GPIO_AF_GPIO) |	\
								PIN_AFR(2,GPIO_AF_GPIO) |	\
								PIN_AFR(3,GPIO_AF_GPIO) |	\
								PIN_AFR(4,GPIO_AF_GPIO) |	\
								PIN_AFR(5,GPIO_AF_GPIO) |	\
								PIN_AFR(6,GPIO_AF_GPIO) |			/* OLE_RESET */				\
								PIN_AFR(7,GPIO_AF_GPIO)				/* OLED_CD */
/**
 ** PORT I
 */
#define	CARIBOU_PORTI_MODE		PIN_MODE(0,GPIO_Mode_OUT) |			/* SPI2_NSS - OLED */ \
								PIN_MODE(1,GPIO_Mode_AF) |			/* SPI2_SCK - OLED */ \
								PIN_MODE(2,GPIO_Mode_AF) |			/* SPI2_MISO = OLED */ \
								PIN_MODE(3,GPIO_Mode_AF) |			/* SPI2_MOSI - OLED */ \
								PIN_MODE(4,GPIO_Mode_OUT) |			/* BUZZER */			\
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

#define	CARIBOU_PORTI_OTYPER	PIN_OTYPER(0,GPIO_OType_PP) |		/* SPI2_NSS - OLED */ \
								PIN_OTYPER(1,GPIO_OType_PP) |		/* SPI2_SCK - OLED */ \
								PIN_OTYPER(2,GPIO_OType_PP) |		/* SPI2_MISO - OLED */ \
								PIN_OTYPER(3,GPIO_OType_PP) |		/* SPI2_MOSI - OLED */ \
								PIN_OTYPER(4,GPIO_OType_PP) |		/* BUZZER */	\
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

#define	CARIBOU_PORTI_OSPEEDR	PIN_OSPEEDR(0,GPIO_Speed_25MHz) |	/* SPI2_NSS - OLED */ \
								PIN_OSPEEDR(1,GPIO_Speed_25MHz) |	/* SPI2_SCK - OLED */ \
								PIN_OSPEEDR(2,GPIO_Speed_25MHz) |	/* SPI2_MISO = OLED */ \
								PIN_OSPEEDR(3,GPIO_Speed_25MHz) |	/* SPI2_MOSI - OLED */ \
								PIN_OSPEEDR(4,GPIO_Speed_2MHz) |	/* BUZZER */	\
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

#define	CARIBOU_PORTI_PUPDR		PIN_PUPDR(0,GPIO_PuPd_NOPULL) |		/* SPI2_NSS - OLED */ \
								PIN_PUPDR(1,GPIO_PuPd_NOPULL) |		/* SPI2_SCK - OLED */ \
								PIN_PUPDR(2,GPIO_PuPd_NOPULL) |		/* SPI2_MISO - OLED */ \
								PIN_PUPDR(3,GPIO_PuPd_NOPULL) |		/* SPI2_MOSI - OLED */ \
								PIN_PUPDR(4,GPIO_PuPd_NOPULL) |		/* BUZZER */	\
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

#define	CARIBOU_PORTI_AFRL		PIN_AFR(0,GPIO_AF_GPIO) |			/* SPI2_NSS - OLED */ \
								PIN_AFR(1,GPIO_AF5_SPI2) |			/* SPI2_SCK - OLED */ \
								PIN_AFR(2,GPIO_AF5_SPI2) |			/* SPI2_MISO = OLED */ \
								PIN_AFR(3,GPIO_AF5_SPI2) |			/* SPI2_MOSI - OLED */ \
								PIN_AFR(4,GPIO_AF_GPIO) |			/* BUZZER */		\
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
 ** PORT J
 */
#define	CARIBOU_PORTJ_MODE		PIN_MODE(0,GPIO_Mode_IN) |			/* DAC Error Flag 1 */		\
								PIN_MODE(1,GPIO_Mode_IN) |			/* DAC Error Flag 2 */		\
								PIN_MODE(2,GPIO_Mode_IN) |	\
								PIN_MODE(3,GPIO_Mode_IN) |	\
								PIN_MODE(4,GPIO_Mode_IN) |	\
								PIN_MODE(5,GPIO_Mode_IN) |	\
								PIN_MODE(6,GPIO_Mode_IN) |			/* NV_LEFT */				\
								PIN_MODE(7,GPIO_Mode_IN) |			/* NV_SELECT */				\
								PIN_MODE(8,GPIO_Mode_IN) |			/* NV_UP */					\
								PIN_MODE(9,GPIO_Mode_IN) |			/* NV_DOWN */				\
								PIN_MODE(10,GPIO_Mode_IN) | 		/* NV_RIGHT */				\
								PIN_MODE(11,GPIO_Mode_IN) | \
								PIN_MODE(12,GPIO_Mode_IN) | \
								PIN_MODE(13,GPIO_Mode_IN) | \
								PIN_MODE(14,GPIO_Mode_IN) | \
								PIN_MODE(15,GPIO_Mode_IN)

#define	CARIBOU_PORTJ_OTYPER	PIN_OTYPER(0,GPIO_OType_PP) |		/* DAC Error Flag 1 */		\
								PIN_OTYPER(1,GPIO_OType_PP) |		/* DAC Error Flag 2 */		\
								PIN_OTYPER(2,GPIO_OType_PP) |	\
								PIN_OTYPER(3,GPIO_OType_PP) |	\
								PIN_OTYPER(4,GPIO_OType_PP) |	\
								PIN_OTYPER(5,GPIO_OType_PP) |	\
								PIN_OTYPER(6,GPIO_OType_PP) |		/* NV_LEFT */				\
								PIN_OTYPER(7,GPIO_OType_PP) |		/* NV_SELECT */				\
								PIN_OTYPER(8,GPIO_OType_PP) |		/* NV_UP */					\
								PIN_OTYPER(9,GPIO_OType_PP) |		/* NV_DOWN */				\
								PIN_OTYPER(10,GPIO_OType_PP) |		/* NV_RIGHT */				\
								PIN_OTYPER(11,GPIO_OType_PP) |	\
								PIN_OTYPER(12,GPIO_OType_PP) |	\
								PIN_OTYPER(13,GPIO_OType_PP) |	\
								PIN_OTYPER(14,GPIO_OType_PP) |	\
								PIN_OTYPER(15,GPIO_OType_PP)

#define	CARIBOU_PORTJ_OSPEEDR	PIN_OSPEEDR(0,GPIO_Speed_2MHz) |	/* DAC Error Flag 1 */		\
								PIN_OSPEEDR(1,GPIO_Speed_2MHz) |	/* DAC Error Flag 2 */		\
								PIN_OSPEEDR(2,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(3,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(4,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(5,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(6,GPIO_Speed_2MHz) |	/* NV_LEFT */				\
								PIN_OSPEEDR(7,GPIO_Speed_2MHz) |	/* NV_SELECT */				\
								PIN_OSPEEDR(8,GPIO_Speed_2MHz) |	/* NV_UP */					\
								PIN_OSPEEDR(9,GPIO_Speed_2MHz) |	/* NV_DOWN */				\
								PIN_OSPEEDR(10,GPIO_Speed_2MHz) |	/* NV_RIGHT */				\
								PIN_OSPEEDR(11,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(12,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(13,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(14,GPIO_Speed_2MHz) |	\
								PIN_OSPEEDR(15,GPIO_Speed_2MHz)

#define	CARIBOU_PORTJ_PUPDR		PIN_PUPDR(0,GPIO_PuPd_NOPULL) |		/* DAC Error Flag 1 */		\
								PIN_PUPDR(1,GPIO_PuPd_NOPULL) |		/* DAC Error Flag 2 */		\
								PIN_PUPDR(2,GPIO_PuPd_NOPULL) |		\
								PIN_PUPDR(3,GPIO_PuPd_NOPULL) |		\
								PIN_PUPDR(4,GPIO_PuPd_NOPULL) |		\
								PIN_PUPDR(5,GPIO_PuPd_NOPULL) |		\
								PIN_PUPDR(6,GPIO_PuPd_UP) |			/* NV_LEFT */				\
								PIN_PUPDR(7,GPIO_PuPd_UP) |			/* NV_SELECT */				\
								PIN_PUPDR(8,GPIO_PuPd_UP) |			/* NV_UP */					\
								PIN_PUPDR(9,GPIO_PuPd_UP) |			/* NV_DOWN */				\
								PIN_PUPDR(10,GPIO_PuPd_UP) |		/* NV_RIGHT */				\
								PIN_PUPDR(11,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(12,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(13,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(14,GPIO_PuPd_NOPULL) |	\
								PIN_PUPDR(15,GPIO_PuPd_NOPULL)

#define	CARIBOU_PORTJ_AFRL		PIN_AFR(0,GPIO_AF_GPIO) |			/* DAC Error Flag 1 */		\
								PIN_AFR(1,GPIO_AF_GPIO) |			/* DAC Error Flag 2 */		\
								PIN_AFR(2,GPIO_AF_GPIO) |	\
								PIN_AFR(3,GPIO_AF_GPIO) |	\
								PIN_AFR(4,GPIO_AF_GPIO) |	\
								PIN_AFR(5,GPIO_AF_GPIO) |	\
								PIN_AFR(6,GPIO_AF_GPIO) |			/* NV_LEFT */				\
								PIN_AFR(7,GPIO_AF_GPIO)				/* NV_SELECT */				
#define	CARIBOU_PORTJ_AFRH		PIN_AFR(0,GPIO_AF_GPIO) |			/* NV_UP */					\
								PIN_AFR(1,GPIO_AF_GPIO) |			/* NV_DOWN */				\
								PIN_AFR(2,GPIO_AF_GPIO) |			/* NV_RIGHT */				\
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