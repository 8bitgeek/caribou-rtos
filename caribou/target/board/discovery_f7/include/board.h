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
#define	CARIBOU_PORTA_MODE		PIN_MODE(0,GPIO_Mode_IN) |			/* ARD_A0 */				\
								PIN_MODE(1,GPIO_Mode_AF) |			/* RMII_REF_CLK */			\
								PIN_MODE(2,GPIO_Mode_AF) |			/* RMII_MDIO */				\
								PIN_MODE(3,GPIO_Mode_AF) |			/* ULPI_D0 */				\
								PIN_MODE(4,GPIO_Mode_AF) |			/* DCMI_HSYNC */			\
								PIN_MODE(5,GPIO_Mode_AF) |			/* ULPI_CK */				\
								PIN_MODE(6,GPIO_Mode_AF) |			/* DCMI_PIXCK */			\
								PIN_MODE(7,GPIO_Mode_AF) |			/* RMII_CRS_DV */			\
								PIN_MODE(8,GPIO_Mode_IN) |			/* ARD_D10 */				\
								PIN_MODE(9,GPIO_Mode_AF) |			/* VCP_TX / OTF_FS_VBUS */	\
								PIN_MODE(10,GPIO_Mode_AF) |			/* OTG_FS_ID */				\
								PIN_MODE(11,GPIO_Mode_AF) |			/* OTG_FS_N */				\
								PIN_MODE(12,GPIO_Mode_AF) |			/* OTG_FS_P */				\
								PIN_MODE(13,GPIO_Mode_AF) |			/* JTMS/SWDIO */			\
								PIN_MODE(14,GPIO_Mode_AF) |			/* JTCK/SWCLK */			\
								PIN_MODE(15,GPIO_Mode_IN)			/* ARD_D9  */

#define	CARIBOU_PORTA_OTYPER	PIN_OTYPER(0,GPIO_OType_PP) |		/* ARD_A0 */				\
								PIN_OTYPER(1,GPIO_OType_PP) |		/* RMII_REF_CLK */			\
								PIN_OTYPER(2,GPIO_OType_OD) |		/* RMII_MDIO */				\
								PIN_OTYPER(3,GPIO_OType_PP) |		/* ULPI_D0 */				\
								PIN_OTYPER(4,GPIO_OType_PP) |		/* DCMI_HSYNC */			\
								PIN_OTYPER(5,GPIO_OType_PP) |		/* ULPI_CK */				\
								PIN_OTYPER(6,GPIO_OType_PP) |		/* DCMI_PIXCK */			\
								PIN_OTYPER(7,GPIO_OType_PP) |		/* RMII_CRS_DV */			\
								PIN_OTYPER(8,GPIO_OType_PP) |		/* ARD_D10 */				\
								PIN_OTYPER(9,GPIO_OType_PP) |		/* VCP_TX / OTF_FS_VBUS */	\
								PIN_OTYPER(10,GPIO_OType_PP) |		/* OTG_FS_ID */				\
								PIN_OTYPER(11,GPIO_OType_PP) |		/* OTG_FS_N */				\
								PIN_OTYPER(12,GPIO_OType_PP) |		/* OTG_FS_P */				\
								PIN_OTYPER(13,GPIO_OType_PP) |		/* JTMS/SWDIO */			\
								PIN_OTYPER(14,GPIO_OType_PP) |		/* JTCK/SWCLK */			\
								PIN_OTYPER(15,GPIO_OType_PP)		/* ARD_D9  */

#define	CARIBOU_PORTA_OSPEEDR	PIN_OSPEEDR(0,GPIO_Speed_2MHz) |	/* ARD_A0 */				\
								PIN_OSPEEDR(1,GPIO_Speed_100MHz) |	/* RMII_REF_CLK */			\
								PIN_OSPEEDR(2,GPIO_Speed_100MHz) |	/* RMII_MDIO */				\
								PIN_OSPEEDR(3,GPIO_Speed_2MHz) |	/* ULPI_D0 */				\
								PIN_OSPEEDR(4,GPIO_Speed_2MHz) |	/* DCMI_HSYNC */			\
								PIN_OSPEEDR(5,GPIO_Speed_2MHz) |	/* ULPI_CK */				\
								PIN_OSPEEDR(6,GPIO_Speed_2MHz) |	/* DCMI_PIXCK */			\
								PIN_OSPEEDR(7,GPIO_Speed_100MHz) |	/* RMII_CRS_DV */			\
								PIN_OSPEEDR(8,GPIO_Speed_100MHz) |	/* ARD_D10 */				\
								PIN_OSPEEDR(9,GPIO_Speed_2MHz) |	/* VCP_TX / OTF_FS_VBUS */	\
								PIN_OSPEEDR(10,GPIO_Speed_2MHz) |	/* OTG_FS_ID */				\
								PIN_OSPEEDR(11,GPIO_Speed_100MHz) |	/* OTG_FS_N */				\
								PIN_OSPEEDR(12,GPIO_Speed_100MHz) |	/* OTG_FS_P */				\
								PIN_OSPEEDR(13,GPIO_Speed_2MHz) |	/* JTMS/SWDIO */			\
								PIN_OSPEEDR(14,GPIO_Speed_2MHz) |	/* JTCK/SWCLK */			\
								PIN_OSPEEDR(15,GPIO_Speed_25MHz)	/* ARD_D9  */

#define	CARIBOU_PORTA_PUPDR		PIN_PUPDR(0,GPIO_PuPd_NOPULL) |		/* ARD_A0 */				\
								PIN_PUPDR(1,GPIO_PuPd_NOPULL) |		/* RMII_REF_CLK */			\
								PIN_PUPDR(2,GPIO_PuPd_NOPULL) |		/* RMII_MDIO */				\
								PIN_PUPDR(3,GPIO_PuPd_NOPULL) |		/* ULPI_D0 */				\
								PIN_PUPDR(4,GPIO_PuPd_NOPULL) |		/* DCMI_HSYNC */			\
								PIN_PUPDR(5,GPIO_PuPd_NOPULL) |		/* ULPI_CK */				\
								PIN_PUPDR(6,GPIO_PuPd_UP) |			/* DCMI_PIXCK */			\
								PIN_PUPDR(7,GPIO_PuPd_NOPULL) |		/* RMII_CRS_DV */			\
								PIN_PUPDR(8,GPIO_PuPd_NOPULL) |		/* ARD_D10 */				\
								PIN_PUPDR(9,GPIO_PuPd_NOPULL) |		/* VCP_TX / OTF_FS_VBUS */	\
								PIN_PUPDR(10,GPIO_PuPd_UP) |		/* OTG_FS_ID */				\
								PIN_PUPDR(11,GPIO_PuPd_NOPULL) |	/* OTG_FS_N */				\
								PIN_PUPDR(12,GPIO_PuPd_NOPULL) |	/* OTG_FS_P */				\
								PIN_PUPDR(13,GPIO_PuPd_UP) |		/* JTMS/SWDIO */			\
								PIN_PUPDR(14,GPIO_PuPd_DOWN) |		/* JTCK/SWCLK */			\
								PIN_PUPDR(15,GPIO_PuPd_UP)			/* ARD_D9  */

#define	CARIBOU_PORTA_AFRL		PIN_AFR(0,GPIO_AF_GPIO) |			/* ARD_A0 */				\
								PIN_AFR(1,GPIO_AF11_ETH) |			/* RMII_REF_CLK */			\
								PIN_AFR(2,GPIO_AF11_ETH) |			/* RMII_MDIO */				\
								PIN_AFR(3,GPIO_AF_GPIO) |			/* ULPI_D0 */				\
								PIN_AFR(4,GPIO_AF_GPIO) |			/* DCMI_HSYNC */			\
								PIN_AFR(5,GPIO_AF_GPIO) |			/* ULPI_CK */				\
								PIN_AFR(6,GPIO_AF_GPIO) |			/* DCMI_PIXCK */			\
								PIN_AFR(7,GPIO_AF11_ETH)			/* RMII_CRS_DV */	
#define	CARIBOU_PORTA_AFRH		PIN_AFR(0,GPIO_AF0_MCO) |			/* ARD_D10 */				\
								PIN_AFR(1,GPIO_AF7_USART1) |		/* VCP_TX / OTF_FS_VBUS */	\
								PIN_AFR(2,GPIO_AF7_USART1) |		/* OTG_FS_ID */				\
								PIN_AFR(3,GPIO_AF10_OTG_FS) |		/* OTG_FS_N */				\
								PIN_AFR(4,GPIO_AF10_OTG_FS) |		/* OTG_FS_P */				\
								PIN_AFR(5,GPIO_AF_GPIO) |			/* JTMS/SWDIO */			\
								PIN_AFR(6,GPIO_AF_GPIO) |			/* JTCK/SWCLK */			\
								PIN_AFR(7,GPIO_AF_GPIO)				/* ARD_D9  */
/**
 ** PORT B
 */
#define	CARIBOU_PORTB_MODE		PIN_MODE(0,GPIO_Mode_IN) |			/* ULPI_D1 */				\
								PIN_MODE(1,GPIO_Mode_IN) |			/* ULPI_D2 */				\
								PIN_MODE(2,GPIO_Mode_IN) |			/* QSPI_CLK / PB2 */		\
								PIN_MODE(3,GPIO_Mode_AF) |			/* SWO */					\
								PIN_MODE(4,GPIO_Mode_AF) |			/* ARD_D3 */				\
								PIN_MODE(5,GPIO_Mode_AF) |			/* ULPI_D7 */				\
								PIN_MODE(6,GPIO_Mode_IN) |			/* QSPI_NCS */				\
								PIN_MODE(7,GPIO_Mode_IN) |			/* VCP_RX */				\
								PIN_MODE(8,GPIO_Mode_IN) |			/* EXT_SCL / DCMI_SCL / ARD_D15 */	\
								PIN_MODE(9,GPIO_Mode_IN) |			/* EXT_SDA / DCMI_SDA / ARD_D14 */	\
								PIN_MODE(10,GPIO_Mode_IN) |			/* ULPI_D3 */				\
								PIN_MODE(11,GPIO_Mode_IN) |			/* ULPI_D4 */				\
								PIN_MODE(12,GPIO_Mode_IN) |			/* ULPI_D5 */				\
								PIN_MODE(13,GPIO_Mode_IN) |			/* ULPI_D6 */				\
								PIN_MODE(14,GPIO_Mode_IN) |			/* ARD_D12 */				\
								PIN_MODE(15,GPIO_Mode_IN)			/* ARD_D11 */

#define	CARIBOU_PORTB_OTYPER	PIN_OTYPER(0,GPIO_OType_PP) |		/* ULPI_D1 */				\
								PIN_OTYPER(1,GPIO_OType_PP) |		/* ULPI_D2 */				\
								PIN_OTYPER(2,GPIO_OType_PP) |		/* QSPI_CLK / PB2 */		\
								PIN_OTYPER(3,GPIO_OType_PP) |		/* SWO */					\
								PIN_OTYPER(4,GPIO_OType_PP) |		/* ARD_D3 */				\
								PIN_OTYPER(5,GPIO_OType_PP) |		/* ULPI_D7 */				\
								PIN_OTYPER(6,GPIO_OType_PP) |		/* QSPI_NCS */				\
								PIN_OTYPER(7,GPIO_OType_PP) |		/* VCP_RX */				\
								PIN_OTYPER(8,GPIO_OType_PP) |		/* EXT_SCL / DCMI_SCL / ARD_D15 */	\
								PIN_OTYPER(9,GPIO_OType_PP) |		/* EXT_SDA / DCMI_SDA / ARD_D14 */	\
								PIN_OTYPER(10,GPIO_OType_PP) |		/* ULPI_D3 */				\
								PIN_OTYPER(11,GPIO_OType_PP) |		/* ULPI_D4 */				\
								PIN_OTYPER(12,GPIO_OType_PP) |		/* ULPI_D5 */				\
								PIN_OTYPER(13,GPIO_OType_PP) |		/* ULPI_D6 */				\
								PIN_OTYPER(14,GPIO_OType_PP) |		/* ARD_D12 */				\
								PIN_OTYPER(15,GPIO_OType_PP)		/* ARD_D11 */

#define	CARIBOU_PORTB_OSPEEDR	PIN_OSPEEDR(0,GPIO_Speed_2MHz) |	/* ULPI_D1 */				\
								PIN_OSPEEDR(1,GPIO_Speed_2MHz) |	/* ULPI_D2 */				\
								PIN_OSPEEDR(2,GPIO_Speed_2MHz) |	/* QSPI_CLK / PB2 */		\
								PIN_OSPEEDR(3,GPIO_Speed_50MHz) |	/* SWO */					\
								PIN_OSPEEDR(4,GPIO_Speed_50MHz) |	/* ARD_D3 */				\
								PIN_OSPEEDR(5,GPIO_Speed_50MHz) |	/* ULPI_D7 */				\
								PIN_OSPEEDR(6,GPIO_Speed_2MHz) |	/* QSPI_NCS */				\
								PIN_OSPEEDR(7,GPIO_Speed_2MHz) |	/* VCP_RX */				\
								PIN_OSPEEDR(8,GPIO_Speed_2MHz) |	/* EXT_SCL / DCMI_SCL / ARD_D15 */	\
								PIN_OSPEEDR(9,GPIO_Speed_2MHz) |	/* EXT_SDA / DCMI_SDA / ARD_D14 */	\
								PIN_OSPEEDR(10,GPIO_Speed_2MHz) |	/* ULPI_D3 */				\
								PIN_OSPEEDR(11,GPIO_Speed_2MHz) |	/* ULPI_D4 */				\
								PIN_OSPEEDR(12,GPIO_Speed_2MHz) |	/* ULPI_D5 */				\
								PIN_OSPEEDR(13,GPIO_Speed_2MHz) |	/* ULPI_D6 */				\
								PIN_OSPEEDR(14,GPIO_Speed_2MHz) |	/* ARD_D12 */				\
								PIN_OSPEEDR(15,GPIO_Speed_2MHz)		/* ARD_D11 */

#define	CARIBOU_PORTB_PUPDR		PIN_PUPDR(0,GPIO_PuPd_NOPULL) |		/* ULPI_D1 */				\
								PIN_PUPDR(1,GPIO_PuPd_NOPULL) |		/* ULPI_D2 */				\
								PIN_PUPDR(2,GPIO_PuPd_NOPULL) |		/* QSPI_CLK / PB2 */		\
								PIN_PUPDR(3,GPIO_PuPd_UP) |			/* SWO */					\
								PIN_PUPDR(4,GPIO_PuPd_UP) |			/* ARD_D3 */				\
								PIN_PUPDR(5,GPIO_PuPd_UP) |			/* ULPI_D7 */				\
								PIN_PUPDR(6,GPIO_PuPd_NOPULL) |		/* QSPI_NCS */				\
								PIN_PUPDR(7,GPIO_PuPd_UP) |			/* VCP_RX */				\
								PIN_PUPDR(8,GPIO_PuPd_NOPULL) |		/* EXT_SCL / DCMI_SCL / ARD_D15 */	\
								PIN_PUPDR(9,GPIO_PuPd_NOPULL) |		/* EXT_SDA / DCMI_SDA / ARD_D14 */	\
								PIN_PUPDR(10,GPIO_PuPd_NOPULL) |	/* ULPI_D3 */				\
								PIN_PUPDR(11,GPIO_PuPd_UP) |		/* ULPI_D4 */				\
								PIN_PUPDR(12,GPIO_PuPd_NOPULL) |	/* ULPI_D5 */				\
								PIN_PUPDR(13,GPIO_PuPd_NOPULL) |	/* ULPI_D6 */				\
								PIN_PUPDR(14,GPIO_PuPd_NOPULL) |	/* ARD_D12 */				\
								PIN_PUPDR(15,GPIO_PuPd_NOPULL)		/* ARD_D11 */

#define	CARIBOU_PORTB_AFRL		PIN_AFR(0,GPIO_AF_GPIO) |			/* ULPI_D1 */				\
								PIN_AFR(1,GPIO_AF_GPIO) |			/* ULPI_D2 */				\
								PIN_AFR(2,GPIO_AF_GPIO) |			/* QSPI_CLK / PB2 */		\
								PIN_AFR(3,GPIO_AF5_SPI1) |			/* SWO */					\
								PIN_AFR(4,GPIO_AF5_SPI1) |			/* ARD_D3 */				\
								PIN_AFR(5,GPIO_AF5_SPI1) |			/* ULPI_D7 */				\
								PIN_AFR(6,GPIO_AF_GPIO) |			/* QSPI_NCS */				\
								PIN_AFR(7,GPIO_AF_GPIO)				/* VCP_RX */	
#define	CARIBOU_PORTB_AFRH		PIN_AFR(0,GPIO_AF_GPIO) |			/* EXT_SCL / DCMI_SCL / ARD_D15 */	\
								PIN_AFR(1,GPIO_AF_GPIO) |			/* EXT_SDA / DCMI_SDA / ARD_D14 */	\
								PIN_AFR(2,GPIO_AF_GPIO) |			/* ULPI_D3 */				\
								PIN_AFR(3,GPIO_AF_GPIO) |			/* ULPI_D4 */				\
								PIN_AFR(4,GPIO_AF_GPIO) |			/* ULPI_D5 */				\
								PIN_AFR(5,GPIO_AF_GPIO) |			/* ULPI_D6 */				\
								PIN_AFR(6,GPIO_AF_GPIO) |			/* ARD_D12 */				\
								PIN_AFR(7,GPIO_AF_GPIO)				/* ARD_D11 */
/**
 ** PORT C
 */
#define	CARIBOU_PORTC_MODE		PIN_MODE(0,GPIO_Mode_IN) |			/* ULPI_STP */				\
								PIN_MODE(1,GPIO_Mode_AF) |			/* RMII_MDC */				\
								PIN_MODE(2,GPIO_Mode_IN) |			/* ULPI_DIR */				\
								PIN_MODE(3,GPIO_Mode_IN) |			/* FMC_SDCKE0 */			\
								PIN_MODE(4,GPIO_Mode_AF) |			/* RMII_RXD0 */				\
								PIN_MODE(5,GPIO_Mode_AF) |			/* RMII_RXD1 */				\
								PIN_MODE(6,GPIO_Mode_AF) |			/* ARD_D1 */				\
								PIN_MODE(7,GPIO_Mode_AF) |			/* ARD_D0 */				\
								PIN_MODE(8,GPIO_Mode_IN) |			/* uSD_D0 */				\
								PIN_MODE(9,GPIO_Mode_IN) |			/* uSD_D1 */				\
								PIN_MODE(10,GPIO_Mode_IN) |			/* uSD_D2 */				\
								PIN_MODE(11,GPIO_Mode_IN) |			/* uSD_D3 */				\
								PIN_MODE(12,GPIO_Mode_IN) |			/* uSD_CLK */				\
								PIN_MODE(13,GPIO_Mode_IN) |			/* uSD_Detect */			\
								PIN_MODE(14,GPIO_Mode_IN) |			/* PC14-OSC32_IN */			\
								PIN_MODE(15,GPIO_Mode_IN)			/* PC15-OSC32_OUT */

#define	CARIBOU_PORTC_OTYPER	PIN_OTYPER(0,GPIO_OType_PP) |		/* ULPI_STP */				\
								PIN_OTYPER(1,GPIO_OType_PP) |		/* RMII_MDC */				\
								PIN_OTYPER(2,GPIO_OType_PP) |		/* ULPI_DIR */				\
								PIN_OTYPER(3,GPIO_OType_PP) |		/* FMC_SDCKE0 */			\
								PIN_OTYPER(4,GPIO_OType_PP) |		/* RMII_RXD0 */				\
								PIN_OTYPER(5,GPIO_OType_PP) |		/* RMII_RXD1 */				\
								PIN_OTYPER(6,GPIO_OType_PP) |		/* ARD_D1 */				\
								PIN_OTYPER(7,GPIO_OType_PP) |		/* ARD_D0 */				\
								PIN_OTYPER(8,GPIO_OType_PP) |		/* uSD_D0 */				\
								PIN_OTYPER(9,GPIO_OType_PP) |		/* uSD_D1 */				\
								PIN_OTYPER(10,GPIO_OType_PP) |		/* uSD_D2 */				\
								PIN_OTYPER(11,GPIO_OType_PP) |		/* uSD_D3 */				\
								PIN_OTYPER(12,GPIO_OType_PP) |		/* uSD_CLK */				\
								PIN_OTYPER(13,GPIO_OType_PP) |		/* uSD_Detect */			\
								PIN_OTYPER(14,GPIO_OType_PP) |		/* PC14-OSC32_IN */			\
								PIN_OTYPER(15,GPIO_OType_PP)		/* PC15-OSC32_OUT */

#define	CARIBOU_PORTC_OSPEEDR	PIN_OSPEEDR(0,GPIO_Speed_2MHz) |	/* ULPI_STP */				\
								PIN_OSPEEDR(1,GPIO_Speed_100MHz) |	/* RMII_MDC */				\
								PIN_OSPEEDR(2,GPIO_Speed_2MHz) |	/* ULPI_DIR */				\
								PIN_OSPEEDR(3,GPIO_Speed_2MHz) |	/* FMC_SDCKE0 */			\
								PIN_OSPEEDR(4,GPIO_Speed_100MHz) |	/* RMII_RXD0 */				\
								PIN_OSPEEDR(5,GPIO_Speed_100MHz) |	/* RMII_RXD1 */				\
								PIN_OSPEEDR(6,GPIO_Speed_2MHz) |	/* ARD_D1 */				\
								PIN_OSPEEDR(7,GPIO_Speed_2MHz) |	/* ARD_D0 */				\
								PIN_OSPEEDR(8,GPIO_Speed_2MHz) |	/* uSD_D0 */				\
								PIN_OSPEEDR(9,GPIO_Speed_2MHz) |	/* uSD_D1 */				\
								PIN_OSPEEDR(10,GPIO_Speed_2MHz) |	/* uSD_D2 */				\
								PIN_OSPEEDR(11,GPIO_Speed_2MHz) |	/* uSD_D3 */				\
								PIN_OSPEEDR(12,GPIO_Speed_2MHz) |	/* uSD_CLK */				\
								PIN_OSPEEDR(13,GPIO_Speed_2MHz) |	/* uSD_Detect */			\
								PIN_OSPEEDR(14,GPIO_Speed_2MHz) |	/* PC14-OSC32_IN */			\
								PIN_OSPEEDR(15,GPIO_Speed_2MHz)		/* PC15-OSC32_OUT */

#define	CARIBOU_PORTC_PUPDR		PIN_PUPDR(0,GPIO_PuPd_NOPULL) |		/* ULPI_STP */				\
								PIN_PUPDR(1,GPIO_PuPd_NOPULL) |		/* RMII_MDC */				\
								PIN_PUPDR(2,GPIO_PuPd_NOPULL) |		/* ULPI_DIR */				\
								PIN_PUPDR(3,GPIO_PuPd_NOPULL) |		/* FMC_SDCKE0 */			\
								PIN_PUPDR(4,GPIO_PuPd_NOPULL) |		/* RMII_RXD0 */				\
								PIN_PUPDR(5,GPIO_PuPd_NOPULL) |		/* RMII_RXD1 */				\
								PIN_PUPDR(6,GPIO_PuPd_NOPULL) |		/* ARD_D1 */				\
								PIN_PUPDR(7,GPIO_PuPd_NOPULL) |		/* ARD_D0 */				\
								PIN_PUPDR(8,GPIO_PuPd_NOPULL) |		/* uSD_D0 */				\
								PIN_PUPDR(9,GPIO_PuPd_NOPULL) |		/* uSD_D1 */				\
								PIN_PUPDR(10,GPIO_PuPd_NOPULL) |	/* uSD_D2 */				\
								PIN_PUPDR(11,GPIO_PuPd_NOPULL) |	/* uSD_D3 */				\
								PIN_PUPDR(12,GPIO_PuPd_NOPULL) |	/* uSD_CLK */				\
								PIN_PUPDR(13,GPIO_PuPd_NOPULL) |	/* uSD_Detect */			\
								PIN_PUPDR(14,GPIO_PuPd_NOPULL) |	/* PC14-OSC32_IN */			\
								PIN_PUPDR(15,GPIO_PuPd_NOPULL)		/* PC15-OSC32_OUT */

#define	CARIBOU_PORTC_AFRL		PIN_AFR(0,GPIO_AF_GPIO) |			/* ULPI_STP */				\
								PIN_AFR(1,GPIO_AF11_ETH) |			/* RMII_MDC */				\
								PIN_AFR(2,GPIO_AF_GPIO) |			/* ULPI_DIR */				\
								PIN_AFR(3,GPIO_AF_GPIO) |			/* FMC_SDCKE0 */			\
								PIN_AFR(4,GPIO_AF11_ETH) |			/* RMII_RXD0 */				\
								PIN_AFR(5,GPIO_AF11_ETH) |			/* RMII_RXD1 */				\
								PIN_AFR(6,GPIO_AF8_USART6) |		/* ARD_D1 */				\
								PIN_AFR(7,GPIO_AF8_USART6)			/* ARD_D0 */							
#define	CARIBOU_PORTC_AFRH		PIN_AFR(0,GPIO_AF_GPIO) |			/* uSD_D0 */				\
								PIN_AFR(1,GPIO_AF_GPIO) |			/* uSD_D1 */				\
								PIN_AFR(2,GPIO_AF_GPIO) |			/* uSD_D2 */				\
								PIN_AFR(3,GPIO_AF_GPIO) |			/* uSD_D3 */				\
								PIN_AFR(4,GPIO_AF_GPIO) |			/* uSD_CLK */				\
								PIN_AFR(5,GPIO_AF_GPIO) |			/* uSD_Detect */			\
								PIN_AFR(6,GPIO_AF_GPIO) |			/* PC14-OSC32_IN */			\
								PIN_AFR(7,GPIO_AF_GPIO)				/* PC15-OSC32_OUT */
/**
 ** PORT D
 */
#define	CARIBOU_PORTD_MODE		PIN_MODE(0,GPIO_Mode_AF) |			/* FMC_D2 */				\
								PIN_MODE(1,GPIO_Mode_AF) |			/* FMC_D3 */				\
								PIN_MODE(2,GPIO_Mode_IN) |			/* uSD_CMD */				\
								PIN_MODE(3,GPIO_Mode_IN) |			/* DCMI_D5 */				\
								PIN_MODE(4,GPIO_Mode_OUT) |			/* OTG_FS_OverCurrent */	\
								PIN_MODE(5,GPIO_Mode_IN) |			/* OTG_FS_PowerSwitchOn */	\
								PIN_MODE(6,GPIO_Mode_IN) |			/* Audio_INT */				\
								PIN_MODE(7,GPIO_Mode_IN) |			/* SPDIF_RX0 */				\
								PIN_MODE(8,GPIO_Mode_AF) |			/* FMC_D13 */				\
								PIN_MODE(9,GPIO_Mode_AF) |			/* FMC_D14 */				\
								PIN_MODE(10,GPIO_Mode_AF) | 		/* FMC_D15 */				\
								PIN_MODE(11,GPIO_Mode_IN) |			/* QSPI_D0 */				\
								PIN_MODE(12,GPIO_Mode_IN) |			/* QSPI_D1 */				\
								PIN_MODE(13,GPIO_Mode_IN) |			/* QSPI_D2 */				\
								PIN_MODE(14,GPIO_Mode_AF) |			/* FMC_D0 */				\
								PIN_MODE(15,GPIO_Mode_AF)			/* FMC_D1 */			

#define	CARIBOU_PORTD_OTYPER	PIN_OTYPER(0,GPIO_OType_PP) |		/* FMC_D2 */				\
								PIN_OTYPER(1,GPIO_OType_PP) |		/* FMC_D3 */				\
								PIN_OTYPER(2,GPIO_OType_PP) |		/* uSD_CMD */				\
								PIN_OTYPER(3,GPIO_OType_PP) |		/* DCMI_D5 */				\
								PIN_OTYPER(4,GPIO_OType_PP) |		/* OTG_FS_OverCurrent */	\
								PIN_OTYPER(5,GPIO_OType_PP) |		/* OTG_FS_PowerSwitchOn */	\
								PIN_OTYPER(6,GPIO_OType_PP) |		/* Audio_INT */				\
								PIN_OTYPER(7,GPIO_OType_PP) |		/* SPDIF_RX0 */				\
								PIN_OTYPER(8,GPIO_OType_PP) |		/* FMC_D13 */				\
								PIN_OTYPER(9,GPIO_OType_PP) |		/* FMC_D14 */				\
								PIN_OTYPER(10,GPIO_OType_PP) |		/* FMC_D15 */				\
								PIN_OTYPER(11,GPIO_OType_PP) |		/* QSPI_D0 */				\
								PIN_OTYPER(12,GPIO_OType_PP) |		/* QSPI_D1 */				\
								PIN_OTYPER(13,GPIO_OType_PP) |		/* QSPI_D2 */				\
								PIN_OTYPER(14,GPIO_OType_PP) |		/* FMC_D0 */				\
								PIN_OTYPER(15,GPIO_OType_PP)		/* FMC_D1 */

#define	CARIBOU_PORTD_OSPEEDR	PIN_OSPEEDR(0,GPIO_Speed_100MHz) |	/* FMC_D2 */				\
								PIN_OSPEEDR(1,GPIO_Speed_100MHz) |	/* FMC_D3 */				\
								PIN_OSPEEDR(2,GPIO_Speed_2MHz) |	/* uSD_CMD */				\
								PIN_OSPEEDR(3,GPIO_Speed_2MHz) |	/* DCMI_D5 */				\
								PIN_OSPEEDR(4,GPIO_Speed_2MHz) |	/* OTG_FS_OverCurrent */	\
								PIN_OSPEEDR(5,GPIO_Speed_2MHz) |	/* OTG_FS_PowerSwitchOn */	\
								PIN_OSPEEDR(6,GPIO_Speed_2MHz) |	/* Audio_INT */				\
								PIN_OSPEEDR(7,GPIO_Speed_2MHz) |	/* SPDIF_RX0 */				\
								PIN_OSPEEDR(8,GPIO_Speed_100MHz) |	/* FMC_D13 */				\
								PIN_OSPEEDR(9,GPIO_Speed_100MHz) |	/* FMC_D14 */				\
								PIN_OSPEEDR(10,GPIO_Speed_100MHz) |	/* FMC_D15 */				\
								PIN_OSPEEDR(11,GPIO_Speed_2MHz) |	/* QSPI_D0 */				\
								PIN_OSPEEDR(12,GPIO_Speed_2MHz) |	/* QSPI_D1 */				\
								PIN_OSPEEDR(13,GPIO_Speed_2MHz) |	/* QSPI_D2 */				\
								PIN_OSPEEDR(14,GPIO_Speed_100MHz) |	/* FMC_D0 */				\
								PIN_OSPEEDR(15,GPIO_Speed_100MHz)	/* FMC_D1 */			

#define	CARIBOU_PORTD_PUPDR		PIN_PUPDR(0,GPIO_PuPd_NOPULL) |		/* FMC_D2 */				\
								PIN_PUPDR(1,GPIO_PuPd_NOPULL) |		/* FMC_D3 */				\
								PIN_PUPDR(2,GPIO_PuPd_NOPULL) |		/* uSD_CMD */				\
								PIN_PUPDR(3,GPIO_PuPd_NOPULL) |		/* DCMI_D5 */				\
								PIN_PUPDR(4,GPIO_PuPd_NOPULL) |		/* OTG_FS_OverCurrent */	\
								PIN_PUPDR(5,GPIO_PuPd_NOPULL) |		/* OTG_FS_PowerSwitchOn */	\
								PIN_PUPDR(6,GPIO_PuPd_UP) |			/* Audio_INT */				\
								PIN_PUPDR(7,GPIO_PuPd_NOPULL) |		/* SPDIF_RX0 */				\
								PIN_PUPDR(8,GPIO_PuPd_NOPULL) |		/* FMC_D13 */				\
								PIN_PUPDR(9,GPIO_PuPd_NOPULL) |		/* FMC_D14 */				\
								PIN_PUPDR(10,GPIO_PuPd_NOPULL) |	/* FMC_D15 */				\
								PIN_PUPDR(11,GPIO_PuPd_NOPULL) |	/* QSPI_D0 */				\
								PIN_PUPDR(12,GPIO_PuPd_NOPULL) |	/* QSPI_D1 */				\
								PIN_PUPDR(13,GPIO_PuPd_NOPULL) |	/* QSPI_D2 */				\
								PIN_PUPDR(14,GPIO_PuPd_NOPULL) |	/* FMC_D0 */				\
								PIN_PUPDR(15,GPIO_PuPd_NOPULL)		/* FMC_D1 */				

#define	CARIBOU_PORTD_AFRL		PIN_AFR(0,GPIO_AF12_FMC) |			/* FMC_D2 */				\
								PIN_AFR(1,GPIO_AF12_FMC) |			/* FMC_D3 */				\
								PIN_AFR(2,GPIO_AF_GPIO) |			/* uSD_CMD */				\
								PIN_AFR(3,GPIO_AF_GPIO) |			/* DCMI_D5 */				\
								PIN_AFR(4,GPIO_AF_GPIO) |			/* OTG_FS_OverCurrent */	\
								PIN_AFR(5,GPIO_AF_GPIO) |			/* OTG_FS_PowerSwitchOn */	\
								PIN_AFR(6,GPIO_AF_GPIO) |			/* Audio_INT */				\
								PIN_AFR(7,GPIO_AF_GPIO)				/* SPDIF_RX0 */
#define	CARIBOU_PORTD_AFRH		PIN_AFR(0,GPIO_AF12_FMC) |			/* FMC_D13 */				\
								PIN_AFR(1,GPIO_AF12_FMC) |			/* FMC_D14 */				\
								PIN_AFR(2,GPIO_AF12_FMC) |			/* FMC_D15 */				\
								PIN_AFR(3,GPIO_AF_GPIO) |			/* QSPI_D0 */				\
								PIN_AFR(4,GPIO_AF_GPIO) |			/* QSPI_D1 */				\
								PIN_AFR(5,GPIO_AF_GPIO) |			/* QSPI_D2 */				\
								PIN_AFR(6,GPIO_AF12_FMC) |			/* FMC_D0 */				\
								PIN_AFR(7,GPIO_AF12_FMC)			/* FMC_D1 */				
/**
 ** PORT E
 */
#define	CARIBOU_PORTE_MODE		PIN_MODE(0,GPIO_Mode_AF) |			/* FMC_NBL0 */				\
								PIN_MODE(1,GPIO_Mode_AF) |			/* FMC_NBL1 */				\
								PIN_MODE(2,GPIO_Mode_IN) |			/* QSPI_D2 */				\
								PIN_MODE(3,GPIO_Mode_OUT) |			/* OTG_HS_OverCurrent */	\
								PIN_MODE(4,GPIO_Mode_OUT) |			/* LCD_B0 */				\
								PIN_MODE(5,GPIO_Mode_OUT) |			/* DCMI_D6 */				\
								PIN_MODE(6,GPIO_Mode_OUT) |			/* DCMI_D7 */				\
								PIN_MODE(7,GPIO_Mode_AF) |			/* FMC_D4 */				\
								PIN_MODE(8,GPIO_Mode_AF) |			/* FMC_D5 */				\
								PIN_MODE(9,GPIO_Mode_AF) |			/* FMC_D6 */				\
								PIN_MODE(10,GPIO_Mode_AF) | 		/* FMC_D7 */				\
								PIN_MODE(11,GPIO_Mode_AF) | 		/* FMC_D8 */				\
								PIN_MODE(12,GPIO_Mode_AF) | 		/* FMC_D9 */				\
								PIN_MODE(13,GPIO_Mode_AF) | 		/* FMC_D10 */				\
								PIN_MODE(14,GPIO_Mode_AF) | 		/* FMC_D11 */				\
								PIN_MODE(15,GPIO_Mode_AF)			/* FMC_D12 */			

#define	CARIBOU_PORTE_OTYPER	PIN_OTYPER(0,GPIO_OType_PP) |		/* FMC_NBL0 */				\
								PIN_OTYPER(1,GPIO_OType_PP) |		/* FMC_NBL1 */				\
								PIN_OTYPER(2,GPIO_OType_PP) |		/* QSPI_D2 */				\
								PIN_OTYPER(3,GPIO_OType_PP) |		/* OTG_HS_OverCurrent */	\
								PIN_OTYPER(4,GPIO_OType_PP) |		/* LCD_B0 */				\
								PIN_OTYPER(5,GPIO_OType_PP) |		/* DCMI_D6 */				\
								PIN_OTYPER(6,GPIO_OType_PP) |		/* DCMI_D7 */				\
								PIN_OTYPER(7,GPIO_OType_PP) |		/* FMC_D4 */				\
								PIN_OTYPER(8,GPIO_OType_PP) |		/* FMC_D5 */				\
								PIN_OTYPER(9,GPIO_OType_PP) |		/* FMC_D6 */				\
								PIN_OTYPER(10,GPIO_OType_PP) |		/* FMC_D7 */				\
								PIN_OTYPER(11,GPIO_OType_PP) |		/* FMC_D8 */				\
								PIN_OTYPER(12,GPIO_OType_PP) |		/* FMC_D9 */				\
								PIN_OTYPER(13,GPIO_OType_PP) |		/* FMC_D10 */				\
								PIN_OTYPER(14,GPIO_OType_PP) |		/* FMC_D11 */				\
								PIN_OTYPER(15,GPIO_OType_PP)		/* FMC_D12 */			

#define	CARIBOU_PORTE_OSPEEDR	PIN_OSPEEDR(0,GPIO_Speed_100MHz) |	/* FMC_NBL0 */				\
								PIN_OSPEEDR(1,GPIO_Speed_100MHz) |	/* FMC_NBL1 */				\
								PIN_OSPEEDR(2,GPIO_Speed_2MHz) |	/* QSPI_D2 */				\
								PIN_OSPEEDR(3,GPIO_Speed_2MHz) |	/* OTG_HS_OverCurrent */	\
								PIN_OSPEEDR(4,GPIO_Speed_2MHz) |	/* LCD_B0 */				\
								PIN_OSPEEDR(5,GPIO_Speed_2MHz) |	/* DCMI_D6 */				\
								PIN_OSPEEDR(6,GPIO_Speed_2MHz) |	/* DCMI_D7 */				\
								PIN_OSPEEDR(7,GPIO_Speed_100MHz) |	/* FMC_D4 */				\
								PIN_OSPEEDR(8,GPIO_Speed_100MHz) |	/* FMC_D5 */				\
								PIN_OSPEEDR(9,GPIO_Speed_100MHz) |	/* FMC_D6 */				\
								PIN_OSPEEDR(10,GPIO_Speed_100MHz) |	/* FMC_D7 */				\
								PIN_OSPEEDR(11,GPIO_Speed_100MHz) |	/* FMC_D8 */				\
								PIN_OSPEEDR(12,GPIO_Speed_100MHz) |	/* FMC_D9 */				\
								PIN_OSPEEDR(13,GPIO_Speed_100MHz) |	/* FMC_D10 */				\
								PIN_OSPEEDR(14,GPIO_Speed_100MHz) |	/* FMC_D11 */				\
								PIN_OSPEEDR(15,GPIO_Speed_100MHz)	/* FMC_D12 */			

#define	CARIBOU_PORTE_PUPDR		PIN_PUPDR(0,GPIO_PuPd_NOPULL) |		/* FMC_NBL0 */				\
								PIN_PUPDR(1,GPIO_PuPd_NOPULL) |		/* FMC_NBL1 */				\
								PIN_PUPDR(2,GPIO_PuPd_NOPULL) |		/* QSPI_D2 */				\
								PIN_PUPDR(3,GPIO_PuPd_NOPULL) |		/* OTG_HS_OverCurrent */	\
								PIN_PUPDR(4,GPIO_PuPd_NOPULL) |		/* LCD_B0 */				\
								PIN_PUPDR(5,GPIO_PuPd_NOPULL) |		/* DCMI_D6 */				\
								PIN_PUPDR(6,GPIO_PuPd_NOPULL) |		/* DCMI_D7 */				\
								PIN_PUPDR(7,GPIO_PuPd_NOPULL) |		/* FMC_D4 */				\
								PIN_PUPDR(8,GPIO_PuPd_NOPULL) |		/* FMC_D5 */				\
								PIN_PUPDR(9,GPIO_PuPd_NOPULL) |		/* FMC_D6 */				\
								PIN_PUPDR(10,GPIO_PuPd_NOPULL) |	/* FMC_D7 */				\
								PIN_PUPDR(11,GPIO_PuPd_NOPULL) |	/* FMC_D8 */				\
								PIN_PUPDR(12,GPIO_PuPd_NOPULL) |	/* FMC_D9 */				\
								PIN_PUPDR(13,GPIO_PuPd_NOPULL) |	/* FMC_D10 */				\
								PIN_PUPDR(14,GPIO_PuPd_NOPULL) |	/* FMC_D11 */				\
								PIN_PUPDR(15,GPIO_PuPd_NOPULL)		/* FMC_D12 */			

#define	CARIBOU_PORTE_AFRL		PIN_AFR(0,GPIO_AF12_FMC) |			/* FMC_NBL0 */				\
								PIN_AFR(1,GPIO_AF12_FMC) |			/* FMC_NBL1 */				\
								PIN_AFR(2,GPIO_AF_GPIO) |			/* QSPI_D2 */				\
								PIN_AFR(3,GPIO_AF_GPIO) |			/* OTG_HS_OverCurrent */	\
								PIN_AFR(4,GPIO_AF_GPIO) |			/* LCD_B0 */				\
								PIN_AFR(5,GPIO_AF_GPIO) |			/* DCMI_D6 */				\
								PIN_AFR(6,GPIO_AF_GPIO) |			/* DCMI_D7 */				\
								PIN_AFR(7,GPIO_AF12_FMC)			/* FMC_D4 */			
#define	CARIBOU_PORTE_AFRH		PIN_AFR(0,GPIO_AF12_FMC) |			/* FMC_D5 */				\
								PIN_AFR(1,GPIO_AF12_FMC) |			/* FMC_D6 */				\
								PIN_AFR(2,GPIO_AF12_FMC) |			/* FMC_D7 */				\
								PIN_AFR(3,GPIO_AF12_FMC) |			/* FMC_D8 */				\
								PIN_AFR(4,GPIO_AF12_FMC) |			/* FMC_D9 */				\
								PIN_AFR(5,GPIO_AF12_FMC) |			/* FMC_D10 */				\
								PIN_AFR(6,GPIO_AF12_FMC) |			/* FMC_D11 */				\
								PIN_AFR(7,GPIO_AF12_FMC)			/* FMC_D12 */		
/**
 ** PORT F
 */
#define	CARIBOU_PORTF_MODE		PIN_MODE(0,GPIO_Mode_AF) |			/* FMC_A0 */				\
								PIN_MODE(1,GPIO_Mode_AF) |			/* FMC_A1 */				\
								PIN_MODE(2,GPIO_Mode_AF) |			/* FMC_A2 */				\
								PIN_MODE(3,GPIO_Mode_AF) |			/* FMC_A3 */				\
								PIN_MODE(4,GPIO_Mode_AF) |			/* FMC_A4 */				\
								PIN_MODE(5,GPIO_Mode_AF) |			/* FMC_A5 */				\
								PIN_MODE(6,GPIO_Mode_IN) |			/* ARD_A5 */				\
								PIN_MODE(7,GPIO_Mode_IN) |			/* ARD_A4 */				\
								PIN_MODE(8,GPIO_Mode_IN) |			/* ARD_A3 */				\
								PIN_MODE(9,GPIO_Mode_IN) |			/* ARD_A2 */				\
								PIN_MODE(10,GPIO_Mode_IN) |			/* ARD_A1 */				\
								PIN_MODE(11,GPIO_Mode_AF) | 		/* FMC_SDNRAS */			\
								PIN_MODE(12,GPIO_Mode_AF) |			/* FMC_A6 */				\
								PIN_MODE(13,GPIO_Mode_AF) | 		/* FMC_A7 */				\
								PIN_MODE(14,GPIO_Mode_AF) | 		/* FMC_A8 */				\
								PIN_MODE(15,GPIO_Mode_AF)			/* FMC_A9 */		

#define	CARIBOU_PORTF_OTYPER	PIN_OTYPER(0,GPIO_OType_PP) |		/* FMC_A0 */				\
								PIN_OTYPER(1,GPIO_OType_PP) |		/* FMC_A1 */				\
								PIN_OTYPER(2,GPIO_OType_PP) |		/* FMC_A2 */				\
								PIN_OTYPER(3,GPIO_OType_PP) |		/* FMC_A3 */				\
								PIN_OTYPER(4,GPIO_OType_PP) |		/* FMC_A4 */				\
								PIN_OTYPER(5,GPIO_OType_PP) |		/* FMC_A5 */				\
								PIN_OTYPER(6,GPIO_OType_PP) |		/* ARD_A5 */				\
								PIN_OTYPER(7,GPIO_OType_PP) |		/* ARD_A4 */				\
								PIN_OTYPER(8,GPIO_OType_PP) |		/* ARD_A3 */				\
								PIN_OTYPER(9,GPIO_OType_PP) |		/* ARD_A2 */				\
								PIN_OTYPER(10,GPIO_OType_PP) |		/* ARD_A1 */				\
								PIN_OTYPER(11,GPIO_OType_PP) |		/* FMC_SDNRAS */			\
								PIN_OTYPER(12,GPIO_OType_PP) |		/* FMC_A6 */				\
								PIN_OTYPER(13,GPIO_OType_PP) |		/* FMC_A7 */				\
								PIN_OTYPER(14,GPIO_OType_PP) |		/* FMC_A8 */				\
								PIN_OTYPER(15,GPIO_OType_PP)		/* FMC_A9 */		

#define	CARIBOU_PORTF_OSPEEDR	PIN_OSPEEDR(0,GPIO_Speed_100MHz) |	/* FMC_A0 */				\
								PIN_OSPEEDR(1,GPIO_Speed_100MHz) |	/* FMC_A1 */				\
								PIN_OSPEEDR(2,GPIO_Speed_100MHz) |	/* FMC_A2 */				\
								PIN_OSPEEDR(3,GPIO_Speed_100MHz) |	/* FMC_A3 */				\
								PIN_OSPEEDR(4,GPIO_Speed_100MHz) |	/* FMC_A4 */				\
								PIN_OSPEEDR(5,GPIO_Speed_100MHz) |	/* FMC_A5 */				\
								PIN_OSPEEDR(6,GPIO_Speed_2MHz) |	/* ARD_A5 */				\
								PIN_OSPEEDR(7,GPIO_Speed_2MHz) |	/* ARD_A4 */				\
								PIN_OSPEEDR(8,GPIO_Speed_2MHz) |	/* ARD_A3 */				\
								PIN_OSPEEDR(9,GPIO_Speed_2MHz) |	/* ARD_A2 */				\
								PIN_OSPEEDR(10,GPIO_Speed_2MHz) |	/* ARD_A1 */				\
								PIN_OSPEEDR(11,GPIO_Speed_100MHz) |	/* FMC_SDNRAS */			\
								PIN_OSPEEDR(12,GPIO_Speed_100MHz) |	/* FMC_A6 */				\
								PIN_OSPEEDR(13,GPIO_Speed_100MHz) |	/* FMC_A7 */				\
								PIN_OSPEEDR(14,GPIO_Speed_100MHz) |	/* FMC_A8 */				\
								PIN_OSPEEDR(15,GPIO_Speed_100MHz)	/* FMC_A9 */		

#define	CARIBOU_PORTF_PUPDR		PIN_PUPDR(0,GPIO_PuPd_NOPULL) |		/* FMC_A0 */				\
								PIN_PUPDR(1,GPIO_PuPd_NOPULL) |		/* FMC_A1 */				\
								PIN_PUPDR(2,GPIO_PuPd_NOPULL) |		/* FMC_A2 */				\
								PIN_PUPDR(3,GPIO_PuPd_NOPULL) |		/* FMC_A3 */				\
								PIN_PUPDR(4,GPIO_PuPd_NOPULL) |		/* FMC_A4 */				\
								PIN_PUPDR(5,GPIO_PuPd_NOPULL) |		/* FMC_A5 */				\
								PIN_PUPDR(6,GPIO_PuPd_NOPULL) |		/* ARD_A5 */				\
								PIN_PUPDR(7,GPIO_PuPd_NOPULL) |		/* ARD_A4 */				\
								PIN_PUPDR(8,GPIO_PuPd_NOPULL) |		/* ARD_A3 */				\
								PIN_PUPDR(9,GPIO_PuPd_NOPULL) |		/* ARD_A2 */				\
								PIN_PUPDR(10,GPIO_PuPd_NOPULL) |	/* ARD_A1 */				\
								PIN_PUPDR(11,GPIO_PuPd_NOPULL) |	/* FMC_SDNRAS */			\
								PIN_PUPDR(12,GPIO_PuPd_NOPULL) |	/* FMC_A6 */				\
								PIN_PUPDR(13,GPIO_PuPd_NOPULL) |	/* FMC_A7 */				\
								PIN_PUPDR(14,GPIO_PuPd_NOPULL) |	/* FMC_A8 */				\
								PIN_PUPDR(15,GPIO_PuPd_NOPULL)		/* FMC_A9 */		

#define	CARIBOU_PORTF_AFRL		PIN_AFR(0,GPIO_AF12_FMC) |			/* FMC_A0 */				\
								PIN_AFR(1,GPIO_AF12_FMC) |			/* FMC_A1 */				\
								PIN_AFR(2,GPIO_AF12_FMC) |			/* FMC_A2 */				\
								PIN_AFR(3,GPIO_AF12_FMC) |			/* FMC_A3 */				\
								PIN_AFR(4,GPIO_AF12_FMC) |			/* FMC_A4 */				\
								PIN_AFR(5,GPIO_AF12_FMC) |			/* FMC_A5 */				\
								PIN_AFR(6,GPIO_AF_GPIO) |			/* ARD_A5 */				\
								PIN_AFR(7,GPIO_AF_GPIO)				/* ARD_A4 */
#define	CARIBOU_PORTF_AFRH		PIN_AFR(0,GPIO_AF_GPIO) |			/* ARD_A3 */				\
								PIN_AFR(1,GPIO_AF_GPIO) |			/* ARD_A2 */				\
								PIN_AFR(2,GPIO_AF_GPIO) |			/* ARD_A1 */				\
								PIN_AFR(3,GPIO_AF12_FMC) |			/* FMC_SDNRAS */			\
								PIN_AFR(4,GPIO_AF12_FMC) |			/* FMC_A6 */				\
								PIN_AFR(5,GPIO_AF12_FMC) |			/* FMC_A7 */				\
								PIN_AFR(6,GPIO_AF12_FMC) |			/* FMC_A8 */				\
								PIN_AFR(7,GPIO_AF12_FMC)			/* FMC_A9 */		
/**
 ** PORT G
 */
#define	CARIBOU_PORTG_MODE		PIN_MODE(0,GPIO_Mode_AF) |			/* FMC_A10 */				\
								PIN_MODE(1,GPIO_Mode_AF) |			/* FMC_A11 */				\
								PIN_MODE(2,GPIO_Mode_AF) |			/* RMII_RXER */				\
								PIN_MODE(3,GPIO_Mode_IN) |			/* EXT_RST */				\
								PIN_MODE(4,GPIO_Mode_AF) |			/* FMC_BA0 */				\
								PIN_MODE(5,GPIO_Mode_AF) |			/* FMC_BA1 */				\
								PIN_MODE(6,GPIO_Mode_IN) |			/* ARD_D2 */				\
								PIN_MODE(7,GPIO_Mode_OUT) |			/* ARD_D4 */				\
								PIN_MODE(8,GPIO_Mode_AF) |			/* FMC_SDCLK */				\
								PIN_MODE(9,GPIO_Mode_IN) |			/* DCMI_VSYNC */			\
								PIN_MODE(10,GPIO_Mode_OUT) |		/* SAI2_SDB */				\
								PIN_MODE(11,GPIO_Mode_AF) |			/* RMII_TX_EN */			\
								PIN_MODE(12,GPIO_Mode_IN) |			/* LCD_B4 */				\
								PIN_MODE(13,GPIO_Mode_AF) |			/* RMII_TXD0 */				\
								PIN_MODE(14,GPIO_Mode_AF) |			/* RMII_TXD1 */				\
								PIN_MODE(15,GPIO_Mode_AF)			/* FMC_SDNCAS */

#define	CARIBOU_PORTG_OTYPER	PIN_OTYPER(0,GPIO_OType_PP) |		/* FMC_A10 */				\
								PIN_OTYPER(1,GPIO_OType_PP) |		/* FMC_A11 */				\
								PIN_OTYPER(2,GPIO_OType_PP) |		/* RMII_RXER */				\
								PIN_OTYPER(3,GPIO_OType_PP) |		/* EXT_RST */				\
								PIN_OTYPER(4,GPIO_OType_PP) |		/* FMC_BA0 */				\
								PIN_OTYPER(5,GPIO_OType_PP) |		/* FMC_BA1 */				\
								PIN_OTYPER(6,GPIO_OType_PP) |		/* ARD_D2 */				\
								PIN_OTYPER(7,GPIO_OType_PP) |		/* ARD_D4 */				\
								PIN_OTYPER(8,GPIO_OType_PP) |		/* FMC_SDCLK */				\
								PIN_OTYPER(9,GPIO_OType_PP) |		/* DCMI_VSYNC */			\
								PIN_OTYPER(10,GPIO_OType_OD) |		/* SAI2_SDB */				\
								PIN_OTYPER(11,GPIO_OType_PP) |		/* RMII_TX_EN */			\
								PIN_OTYPER(12,GPIO_OType_PP) |		/* LCD_B4 */				\
								PIN_OTYPER(13,GPIO_OType_PP) |		/* RMII_TXD0 */				\
								PIN_OTYPER(14,GPIO_OType_PP) |		/* RMII_TXD1 */				\
								PIN_OTYPER(15,GPIO_OType_PP)		/* FMC_SDNCAS */

#define	CARIBOU_PORTG_OSPEEDR	PIN_OSPEEDR(0,GPIO_Speed_100MHz) |	/* FMC_A10 */				\
								PIN_OSPEEDR(1,GPIO_Speed_100MHz) |	/* FMC_A10 */				\
								PIN_OSPEEDR(2,GPIO_Speed_100MHz) |	/* RMII_RXER */				\
								PIN_OSPEEDR(3,GPIO_Speed_2MHz) |	/* EXT_RST */				\
								PIN_OSPEEDR(4,GPIO_Speed_100MHz) |	/* FMC_BA0 */				\
								PIN_OSPEEDR(5,GPIO_Speed_100MHz) |	/* FMC_BA1 */				\
								PIN_OSPEEDR(6,GPIO_Speed_2MHz) |	/* ARD_D2 */				\
								PIN_OSPEEDR(7,GPIO_Speed_2MHz) |	/* ARD_D4 */				\
								PIN_OSPEEDR(8,GPIO_Speed_100MHz) |	/* FMC_SDCLK */				\
								PIN_OSPEEDR(9,GPIO_Speed_2MHz) |	/* DCMI_VSYNC */			\
								PIN_OSPEEDR(10,GPIO_Speed_2MHz) |	/* SAI2_SDB */				\
								PIN_OSPEEDR(11,GPIO_Speed_50MHz) |	/* RMII_TX_EN */			\
								PIN_OSPEEDR(12,GPIO_Speed_2MHz) |	/* LCD_B4 */				\
								PIN_OSPEEDR(13,GPIO_Speed_100MHz) |	/* RMII_TXD0 */				\
								PIN_OSPEEDR(14,GPIO_Speed_100MHz) |	/* RMII_TXD1 */				\
								PIN_OSPEEDR(15,GPIO_Speed_100MHz)	/* FMC_SDNCAS */

#define	CARIBOU_PORTG_PUPDR		PIN_PUPDR(0,GPIO_PuPd_NOPULL) |		/* FMC_A10 */				\
								PIN_PUPDR(1,GPIO_PuPd_NOPULL) |		/* FMC_A11 */				\
								PIN_PUPDR(2,GPIO_PuPd_NOPULL) |		/* RMII_RXER */				\
								PIN_PUPDR(3,GPIO_PuPd_NOPULL) |		/* EXT_RST */				\
								PIN_PUPDR(4,GPIO_PuPd_NOPULL) |		/* FMC_BA0 */				\
								PIN_PUPDR(5,GPIO_PuPd_NOPULL) |		/* FMC_BA1 */				\
								PIN_PUPDR(6,GPIO_PuPd_NOPULL) |		/* ARD_D2 */				\
								PIN_PUPDR(7,GPIO_PuPd_NOPULL) |		/* ARD_D4 */				\
								PIN_PUPDR(8,GPIO_PuPd_NOPULL) |		/* FMC_SDCLK */				\
								PIN_PUPDR(9,GPIO_PuPd_NOPULL) |		/* DCMI_VSYNC */			\
								PIN_PUPDR(10,GPIO_PuPd_UP) |		/* SAI2_SDB */				\
								PIN_PUPDR(11,GPIO_PuPd_NOPULL) |	/* RMII_TX_EN */			\
								PIN_PUPDR(12,GPIO_PuPd_NOPULL) |	/* LCD_B4 */				\
								PIN_PUPDR(13,GPIO_PuPd_NOPULL) |	/* RMII_TXD0 */				\
								PIN_PUPDR(14,GPIO_PuPd_NOPULL) |	/* RMII_TXD1 */				\
								PIN_PUPDR(15,GPIO_PuPd_NOPULL)		/* FMC_SDNCAS */

#define	CARIBOU_PORTG_AFRL		PIN_AFR(0,GPIO_AF12_FMC) |			/* FMC_A10 */				\
								PIN_AFR(1,GPIO_AF12_FMC) |			/* FMC_A11 */				\
								PIN_AFR(2,GPIO_AF12_FMC) |			/* RMII_RXER */				\
								PIN_AFR(3,GPIO_AF_GPIO) |			/* EXT_RST */				\
								PIN_AFR(4,GPIO_AF12_FMC) |			/* FMC_BA0 */				\
								PIN_AFR(5,GPIO_AF12_FMC) |			/* FMC_BA1 */				\
								PIN_AFR(6,GPIO_AF_GPIO) |			/* ARD_D2 */				\
								PIN_AFR(7,GPIO_AF_GPIO)				/* ARD_D4 */	
#define	CARIBOU_PORTG_AFRH		PIN_AFR(0,GPIO_AF12_FMC) |			/* FMC_SDCLK */				\
								PIN_AFR(1,GPIO_AF12_FMC) |			/* DCMI_VSYNC */			\
								PIN_AFR(2,GPIO_AF_GPIO) |			/* SAI2_SDB */				\
								PIN_AFR(3,GPIO_AF_GPIO) |			/* RMII_TX_EN */			\
								PIN_AFR(4,GPIO_AF11_ETH) |			/* LCD_B4 */				\
								PIN_AFR(5,GPIO_AF11_ETH) |			/* RMII_TXD0 */				\
								PIN_AFR(6,GPIO_AF11_ETH) |			/* RMII_TXD1 */				\
								PIN_AFR(7,GPIO_AF12_FMC)			/* FMC_SDNCAS */
/**
 ** PORT H
 */
#define	CARIBOU_PORTH_MODE		PIN_MODE(0,GPIO_Mode_IN) |			/* PH0/OSC_IN */			\
								PIN_MODE(1,GPIO_Mode_IN) |			/* PH1/OSC_OUT */			\
								PIN_MODE(2,GPIO_Mode_AF) |			/* NC2 */					\
								PIN_MODE(3,GPIO_Mode_AF) |			/* FMC_SDNE0 */				\
								PIN_MODE(4,GPIO_Mode_IN) |			/* ULPI_NXT */				\
								PIN_MODE(5,GPIO_Mode_AF) |			/* FMC_SDNWE */				\
								PIN_MODE(6,GPIO_Mode_IN) |			/* ARD_D6 */				\
								PIN_MODE(7,GPIO_Mode_IN) |			/* LCD_SCL / AUDIO_SCL */	\
								PIN_MODE(8,GPIO_Mode_IN) |			/* LCD_SDA / AUDIO_SDA */	\
								PIN_MODE(9,GPIO_Mode_IN) |			/* DCMI_D0 */				\
								PIN_MODE(10,GPIO_Mode_IN) |			/* DCMI_D1 */				\
								PIN_MODE(11,GPIO_Mode_IN) |			/* DCMI_D2 */				\
								PIN_MODE(12,GPIO_Mode_IN) |			/* DCMI_D3 */				\
								PIN_MODE(13,GPIO_Mode_IN) |			/* DCMI_PWR_EN */			\
								PIN_MODE(14,GPIO_Mode_OUT) |		/* DCMI_D4 */				\
								PIN_MODE(15,GPIO_Mode_OUT)			/* TP_PH15 */

#define	CARIBOU_PORTH_OTYPER	PIN_OTYPER(0,GPIO_OType_PP) |		/* PH0/OSC_IN */			\
								PIN_OTYPER(1,GPIO_OType_PP) |		/* PH1/OSC_OUT */			\
								PIN_OTYPER(2,GPIO_OType_PP) |		/* NC2 */					\
								PIN_OTYPER(3,GPIO_OType_PP) |		/* FMC_SDNE0 */				\
								PIN_OTYPER(4,GPIO_OType_PP) |		/* ULPI_NXT */				\
								PIN_OTYPER(5,GPIO_OType_PP) |		/* FMC_SDNWE */				\
								PIN_OTYPER(6,GPIO_OType_PP) |		/* ARD_D6 */				\
								PIN_OTYPER(7,GPIO_OType_PP) |		/* LCD_SCL / AUDIO_SCL */	\
								PIN_OTYPER(8,GPIO_OType_PP) |		/* LCD_SDA / AUDIO_SDA */	\
								PIN_OTYPER(9,GPIO_OType_PP) |		/* DCMI_D0 */				\
								PIN_OTYPER(10,GPIO_OType_PP) |		/* DCMI_D1 */				\
								PIN_OTYPER(11,GPIO_OType_PP) |		/* DCMI_D2 */				\
								PIN_OTYPER(12,GPIO_OType_PP) |		/* DCMI_D3 */				\
								PIN_OTYPER(13,GPIO_OType_PP) |		/* DCMI_PWR_EN */			\
								PIN_OTYPER(14,GPIO_OType_PP) |		/* DCMI_D4 */				\
								PIN_OTYPER(15,GPIO_OType_PP)		/* TP_PH15 */

#define	CARIBOU_PORTH_OSPEEDR	PIN_OSPEEDR(0,GPIO_Speed_2MHz) |	/* PH0/OSC_IN */			\
								PIN_OSPEEDR(1,GPIO_Speed_2MHz) |	/* PH1/OSC_OUT */			\
								PIN_OSPEEDR(2,GPIO_Speed_100MHz) |	/* NC2 */					\
								PIN_OSPEEDR(3,GPIO_Speed_100MHz) |	/* FMC_SDNE0 */				\
								PIN_OSPEEDR(4,GPIO_Speed_2MHz) |	/* ULPI_NXT */				\
								PIN_OSPEEDR(5,GPIO_Speed_100MHz) |	/* FMC_SDNWE */				\
								PIN_OSPEEDR(6,GPIO_Speed_2MHz) |	/* ARD_D6 */				\
								PIN_OSPEEDR(7,GPIO_Speed_2MHz) |	/* LCD_SCL / AUDIO_SCL */	\
								PIN_OSPEEDR(8,GPIO_Speed_2MHz) |	/* LCD_SDA / AUDIO_SDA */	\
								PIN_OSPEEDR(9,GPIO_Speed_2MHz) |	/* DCMI_D0 */				\
								PIN_OSPEEDR(10,GPIO_Speed_2MHz) |	/* DCMI_D1 */				\
								PIN_OSPEEDR(11,GPIO_Speed_2MHz) |	/* DCMI_D2 */				\
								PIN_OSPEEDR(12,GPIO_Speed_2MHz) |	/* DCMI_D3 */				\
								PIN_OSPEEDR(13,GPIO_Speed_2MHz) |	/* DCMI_PWR_EN */			\
								PIN_OSPEEDR(14,GPIO_Speed_2MHz) |	/* DCMI_D4 */				\
								PIN_OSPEEDR(15,GPIO_Speed_2MHz)		/* TP_PH15 */

#define	CARIBOU_PORTH_PUPDR		PIN_PUPDR(0,GPIO_PuPd_NOPULL) |		/* PH0/OSC_IN */			\
								PIN_PUPDR(1,GPIO_PuPd_NOPULL) |		/* PH1/OSC_OUT */			\
								PIN_PUPDR(2,GPIO_PuPd_NOPULL) |		/* NC2 */					\
								PIN_PUPDR(3,GPIO_PuPd_NOPULL) |		/* FMC_SDNE0 */				\
								PIN_PUPDR(4,GPIO_PuPd_NOPULL) |		/* ULPI_NXT */				\
								PIN_PUPDR(5,GPIO_PuPd_NOPULL) |		/* FMC_SDNWE */				\
								PIN_PUPDR(6,GPIO_PuPd_NOPULL) |		/* ARD_D6 */				\
								PIN_PUPDR(7,GPIO_PuPd_NOPULL) |		/* LCD_SCL / AUDIO_SCL */	\
								PIN_PUPDR(8,GPIO_PuPd_NOPULL) |		/* LCD_SDA / AUDIO_SDA */	\
								PIN_PUPDR(9,GPIO_PuPd_NOPULL) |		/* DCMI_D0 */				\
								PIN_PUPDR(10,GPIO_PuPd_NOPULL) |	/* DCMI_D1 */				\
								PIN_PUPDR(11,GPIO_PuPd_NOPULL) |	/* DCMI_D2 */				\
								PIN_PUPDR(12,GPIO_PuPd_NOPULL) |	/* DCMI_D3 */				\
								PIN_PUPDR(13,GPIO_PuPd_NOPULL) |	/* DCMI_PWR_EN */			\
								PIN_PUPDR(14,GPIO_PuPd_NOPULL) |	/* DCMI_D4 */				\
								PIN_PUPDR(15,GPIO_PuPd_NOPULL)		/* TP_PH15 */

#define	CARIBOU_PORTH_AFRL		PIN_AFR(0,GPIO_AF_GPIO) |			/* PH0/OSC_IN */			\
								PIN_AFR(1,GPIO_AF_GPIO) |			/* PH1/OSC_OUT */			\
								PIN_AFR(2,GPIO_AF12_FMC) |			/* NC2 */					\
								PIN_AFR(3,GPIO_AF12_FMC) |			/* FMC_SDNE0 */				\
								PIN_AFR(4,GPIO_AF_GPIO) |			/* ULPI_NXT */				\
								PIN_AFR(5,GPIO_AF12_FMC) |			/* FMC_SDNWE */				\
								PIN_AFR(6,GPIO_AF_GPIO) |			/* ARD_D6 */				\
								PIN_AFR(7,GPIO_AF_GPIO)				/* LCD_SCL / AUDIO_SCL */
#define	CARIBOU_PORTH_AFRH		PIN_AFR(0,GPIO_AF_GPIO) |			/* LCD_SDA / AUDIO_SDA */	\
								PIN_AFR(1,GPIO_AF_GPIO) |			/* DCMI_D0 */				\
								PIN_AFR(2,GPIO_AF_GPIO) |			/* DCMI_D1 */				\
								PIN_AFR(3,GPIO_AF_GPIO) |			/* DCMI_D2 */				\
								PIN_AFR(4,GPIO_AF_GPIO) |			/* DCMI_D3 */				\
								PIN_AFR(5,GPIO_AF_GPIO) |			/* DCMI_PWR_EN */			\
								PIN_AFR(6,GPIO_AF_GPIO) |			/* DCMI_D4 */				\
								PIN_AFR(7,GPIO_AF_GPIO)				/* TP_PH15 */
/**
 ** PORT I
 */
#define	CARIBOU_PORTI_MODE		PIN_MODE(0,GPIO_Mode_OUT) |			/* ARD_D5 */				\
								PIN_MODE(1,GPIO_Mode_AF) |			/* ARD_D13 */				\
								PIN_MODE(2,GPIO_Mode_AF) |			/* ARD_D8 */				\
								PIN_MODE(3,GPIO_Mode_AF) |			/* ARD_D7 */				\
								PIN_MODE(4,GPIO_Mode_OUT) |			/* SAI2_MCLKA */			\
								PIN_MODE(5,GPIO_Mode_IN) |			/* SAI2_SCKA */				\
								PIN_MODE(6,GPIO_Mode_IN) |			/* SAI2_SDA */				\
								PIN_MODE(7,GPIO_Mode_IN) |			/* SAI2_FSA */				\
								PIN_MODE(8,GPIO_Mode_IN) |			/* NC1 */					\
								PIN_MODE(9,GPIO_Mode_IN) |			/* LCD_VSYNC */				\
								PIN_MODE(10,GPIO_Mode_IN) |			/* LCD_HSYNC */				\
								PIN_MODE(11,GPIO_Mode_IN) |			/* B_USER */				\
								PIN_MODE(12,GPIO_Mode_IN) |			/* LCD_DISP */				\
								PIN_MODE(13,GPIO_Mode_IN) |			/* LCD_INT */				\
								PIN_MODE(14,GPIO_Mode_IN) |			/* LCD_CLK */				\
								PIN_MODE(15,GPIO_Mode_IN)			/* LCD_R0 */

#define	CARIBOU_PORTI_OTYPER	PIN_OTYPER(0,GPIO_OType_PP) |		/* ARD_D5 */				\
								PIN_OTYPER(1,GPIO_OType_PP) |		/* ARD_D13 */				\
								PIN_OTYPER(2,GPIO_OType_PP) |		/* ARD_D8 */				\
								PIN_OTYPER(3,GPIO_OType_PP) |		/* ARD_D7 */				\
								PIN_OTYPER(4,GPIO_OType_PP) |		/* SAI2_MCLKA */			\
								PIN_OTYPER(5,GPIO_OType_PP) |		/* SAI2_SCKA */				\
								PIN_OTYPER(6,GPIO_OType_PP) |		/* SAI2_SDA */				\
								PIN_OTYPER(7,GPIO_OType_PP) |		/* SAI2_FSA */				\
								PIN_OTYPER(8,GPIO_OType_PP) |		/* NC1 */					\
								PIN_OTYPER(9,GPIO_OType_PP) |		/* LCD_VSYNC */				\
								PIN_OTYPER(10,GPIO_OType_PP) |		/* LCD_HSYNC */				\
								PIN_OTYPER(11,GPIO_OType_PP) |		/* B_USER */				\
								PIN_OTYPER(12,GPIO_OType_PP) |		/* LCD_DISP */				\
								PIN_OTYPER(13,GPIO_OType_PP) |		/* LCD_INT */				\
								PIN_OTYPER(14,GPIO_OType_PP) |		/* LCD_CLK */				\
								PIN_OTYPER(15,GPIO_OType_PP)		/* LCD_R0 */

#define	CARIBOU_PORTI_OSPEEDR	PIN_OSPEEDR(0,GPIO_Speed_25MHz) |	/* ARD_D5 */				\
								PIN_OSPEEDR(1,GPIO_Speed_25MHz) |	/* ARD_D13 */				\
								PIN_OSPEEDR(2,GPIO_Speed_25MHz) |	/* ARD_D8 */				\
								PIN_OSPEEDR(3,GPIO_Speed_25MHz) |	/* ARD_D7 */				\
								PIN_OSPEEDR(4,GPIO_Speed_2MHz) |	/* SAI2_MCLKA */			\
								PIN_OSPEEDR(5,GPIO_Speed_2MHz) |	/* SAI2_SCKA */				\
								PIN_OSPEEDR(6,GPIO_Speed_2MHz) |	/* SAI2_SDA */				\
								PIN_OSPEEDR(7,GPIO_Speed_2MHz) |	/* SAI2_FSA */				\
								PIN_OSPEEDR(8,GPIO_Speed_2MHz) |	/* NC1 */					\
								PIN_OSPEEDR(9,GPIO_Speed_2MHz) |	/* LCD_VSYNC */				\
								PIN_OSPEEDR(10,GPIO_Speed_2MHz) |	/* LCD_HSYNC */				\
								PIN_OSPEEDR(11,GPIO_Speed_2MHz) |	/* B_USER */				\
								PIN_OSPEEDR(12,GPIO_Speed_2MHz) |	/* LCD_DISP */				\
								PIN_OSPEEDR(13,GPIO_Speed_2MHz) |	/* LCD_INT */				\
								PIN_OSPEEDR(14,GPIO_Speed_2MHz) |	/* LCD_CLK */				\
								PIN_OSPEEDR(15,GPIO_Speed_2MHz)		/* LCD_R0 */

#define	CARIBOU_PORTI_PUPDR		PIN_PUPDR(0,GPIO_PuPd_NOPULL) |		/* ARD_D5 */				\
								PIN_PUPDR(1,GPIO_PuPd_NOPULL) |		/* ARD_D13 */				\
								PIN_PUPDR(2,GPIO_PuPd_NOPULL) |		/* ARD_D8 */				\
								PIN_PUPDR(3,GPIO_PuPd_NOPULL) |		/* ARD_D7 */				\
								PIN_PUPDR(4,GPIO_PuPd_NOPULL) |		/* SAI2_MCLKA */			\
								PIN_PUPDR(5,GPIO_PuPd_NOPULL) |		/* SAI2_SCKA */				\
								PIN_PUPDR(6,GPIO_PuPd_NOPULL) |		/* SAI2_SDA */				\
								PIN_PUPDR(7,GPIO_PuPd_NOPULL) |		/* SAI2_FSA */				\
								PIN_PUPDR(8,GPIO_PuPd_NOPULL) |		/* NC1 */					\
								PIN_PUPDR(9,GPIO_PuPd_NOPULL) |		/* LCD_VSYNC */				\
								PIN_PUPDR(10,GPIO_PuPd_NOPULL) |	/* LCD_HSYNC */				\
								PIN_PUPDR(11,GPIO_PuPd_NOPULL) |	/* B_USER */				\
								PIN_PUPDR(12,GPIO_PuPd_NOPULL) |	/* LCD_DISP */				\
								PIN_PUPDR(13,GPIO_PuPd_NOPULL) |	/* LCD_INT */				\
								PIN_PUPDR(14,GPIO_PuPd_NOPULL) |	/* LCD_CLK */				\
								PIN_PUPDR(15,GPIO_PuPd_NOPULL)		/* LCD_R0 */

#define	CARIBOU_PORTI_AFRL		PIN_AFR(0,GPIO_AF_GPIO) |			/* ARD_D5 */				\
								PIN_AFR(1,GPIO_AF5_SPI2) |			/* ARD_D13 */				\
								PIN_AFR(2,GPIO_AF5_SPI2) |			/* ARD_D8 */				\
								PIN_AFR(3,GPIO_AF5_SPI2) |			/* ARD_D7 */				\
								PIN_AFR(4,GPIO_AF_GPIO) |			/* SAI2_MCLKA */			\
								PIN_AFR(5,GPIO_AF_GPIO) |			/* SAI2_SCKA */				\
								PIN_AFR(6,GPIO_AF_GPIO) |			/* SAI2_SDA */				\
								PIN_AFR(7,GPIO_AF_GPIO)				/* SAI2_FSA */
#define	CARIBOU_PORTI_AFRH		PIN_AFR(0,GPIO_AF_GPIO) |			/* NC1 */					\
								PIN_AFR(1,GPIO_AF_GPIO) |			/* LCD_VSYNC */				\
								PIN_AFR(2,GPIO_AF_GPIO) |			/* LCD_HSYNC */				\
								PIN_AFR(3,GPIO_AF_GPIO) |			/* B_USER */				\
								PIN_AFR(4,GPIO_AF_GPIO) |			/* LCD_DISP */				\
								PIN_AFR(5,GPIO_AF_GPIO) |			/* LCD_INT */				\
								PIN_AFR(6,GPIO_AF_GPIO) |			/* LCD_CLK */				\
								PIN_AFR(7,GPIO_AF_GPIO)				/* LCD_R0 */

/**
 ** PORT J
 */
#define	CARIBOU_PORTJ_MODE		PIN_MODE(0,GPIO_Mode_IN) |			/* LCD_R1 */				\
								PIN_MODE(1,GPIO_Mode_IN) |			/* LCD_R2 */				\
								PIN_MODE(2,GPIO_Mode_IN) |			/* LCD_R3 */				\
								PIN_MODE(3,GPIO_Mode_IN) |			/* LCD_R4 */				\
								PIN_MODE(4,GPIO_Mode_IN) |			/* LCD_R5 */				\
								PIN_MODE(5,GPIO_Mode_IN) |			/* LCD_R6 */				\
								PIN_MODE(6,GPIO_Mode_IN) |			/* LCD_R7 */				\
								PIN_MODE(7,GPIO_Mode_IN) |			/* LCD_G0 */				\
								PIN_MODE(8,GPIO_Mode_IN) |			/* LCD_G1 */				\
								PIN_MODE(9,GPIO_Mode_IN) |			/* LCD_G2 */				\
								PIN_MODE(10,GPIO_Mode_IN) | 		/* LCD_G3 */				\
								PIN_MODE(11,GPIO_Mode_IN) |			/* LCD_G4 */				\
								PIN_MODE(12,GPIO_Mode_IN) |			/* OTG_FS_VBUS */			\
								PIN_MODE(13,GPIO_Mode_IN) |			/* LCD_B1 */				\
								PIN_MODE(14,GPIO_Mode_IN) |			/* LCD_B2 */				\
								PIN_MODE(15,GPIO_Mode_IN)			/* LCD_B3 */

#define	CARIBOU_PORTJ_OTYPER	PIN_OTYPER(0,GPIO_OType_PP) |		/* LCD_R1 */				\
								PIN_OTYPER(1,GPIO_OType_PP) |		/* LCD_R2 */				\
								PIN_OTYPER(2,GPIO_OType_PP) |		/* LCD_R3 */				\
								PIN_OTYPER(3,GPIO_OType_PP) |		/* LCD_R4 */				\
								PIN_OTYPER(4,GPIO_OType_PP) |		/* LCD_R5 */				\
								PIN_OTYPER(5,GPIO_OType_PP) |		/* LCD_R6 */				\
								PIN_OTYPER(6,GPIO_OType_PP) |		/* LCD_R7 */				\
								PIN_OTYPER(7,GPIO_OType_PP) |		/* LCD_G0 */				\
								PIN_OTYPER(8,GPIO_OType_PP) |		/* LCD_G1 */				\
								PIN_OTYPER(9,GPIO_OType_PP) |		/* LCD_G2 */				\
								PIN_OTYPER(10,GPIO_OType_PP) |		/* LCD_G3 */				\
								PIN_OTYPER(11,GPIO_OType_PP) |		/* LCD_G4 */				\
								PIN_OTYPER(12,GPIO_OType_PP) |		/* OTG_FS_VBUS */			\
								PIN_OTYPER(13,GPIO_OType_PP) |		/* LCD_B1 */				\
								PIN_OTYPER(14,GPIO_OType_PP) |		/* LCD_B2 */				\
								PIN_OTYPER(15,GPIO_OType_PP)		/* LCD_B3 */

#define	CARIBOU_PORTJ_OSPEEDR	PIN_OSPEEDR(0,GPIO_Speed_2MHz) |	/* LCD_R1 */				\
								PIN_OSPEEDR(1,GPIO_Speed_2MHz) |	/* LCD_R2 */				\
								PIN_OSPEEDR(2,GPIO_Speed_2MHz) |	/* LCD_R3 */				\
								PIN_OSPEEDR(3,GPIO_Speed_2MHz) |	/* LCD_R4 */				\
								PIN_OSPEEDR(4,GPIO_Speed_2MHz) |	/* LCD_R5 */				\
								PIN_OSPEEDR(5,GPIO_Speed_2MHz) |	/* LCD_R6 */				\
								PIN_OSPEEDR(6,GPIO_Speed_2MHz) |	/* LCD_R7 */				\
								PIN_OSPEEDR(7,GPIO_Speed_2MHz) |	/* LCD_G0 */				\
								PIN_OSPEEDR(8,GPIO_Speed_2MHz) |	/* LCD_G1 */				\
								PIN_OSPEEDR(9,GPIO_Speed_2MHz) |	/* LCD_G2 */				\
								PIN_OSPEEDR(10,GPIO_Speed_2MHz) |	/* LCD_G3 */				\
								PIN_OSPEEDR(11,GPIO_Speed_2MHz) |	/* LCD_G4 */				\
								PIN_OSPEEDR(12,GPIO_Speed_2MHz) |	/* OTG_FS_VBUS */			\
								PIN_OSPEEDR(13,GPIO_Speed_2MHz) |	/* LCD_B1 */				\
								PIN_OSPEEDR(14,GPIO_Speed_2MHz) |	/* LCD_B2 */				\
								PIN_OSPEEDR(15,GPIO_Speed_2MHz)		/* LCD_B3 */

#define	CARIBOU_PORTJ_PUPDR		PIN_PUPDR(0,GPIO_PuPd_NOPULL) |		/* LCD_R1 */				\
								PIN_PUPDR(1,GPIO_PuPd_NOPULL) |		/* LCD_R2 */				\
								PIN_PUPDR(2,GPIO_PuPd_NOPULL) |		/* LCD_R3 */				\
								PIN_PUPDR(3,GPIO_PuPd_NOPULL) |		/* LCD_R4 */				\
								PIN_PUPDR(4,GPIO_PuPd_NOPULL) |		/* LCD_R5 */				\
								PIN_PUPDR(5,GPIO_PuPd_NOPULL) |		/* LCD_R6 */				\
								PIN_PUPDR(6,GPIO_PuPd_UP) |			/* LCD_R7 */				\
								PIN_PUPDR(7,GPIO_PuPd_UP) |			/* LCD_G0 */				\
								PIN_PUPDR(8,GPIO_PuPd_UP) |			/* LCD_G1 */				\
								PIN_PUPDR(9,GPIO_PuPd_UP) |			/* LCD_G2 */				\
								PIN_PUPDR(10,GPIO_PuPd_UP) |		/* LCD_G3 */				\
								PIN_PUPDR(11,GPIO_PuPd_NOPULL) |	/* LCD_G4 */				\
								PIN_PUPDR(12,GPIO_PuPd_NOPULL) |	/* OTG_FS_VBUS */			\
								PIN_PUPDR(13,GPIO_PuPd_NOPULL) |	/* LCD_B1 */				\
								PIN_PUPDR(14,GPIO_PuPd_NOPULL) |	/* LCD_B2 */				\
								PIN_PUPDR(15,GPIO_PuPd_NOPULL)		/* LCD_B3 */

#define	CARIBOU_PORTJ_AFRL		PIN_AFR(0,GPIO_AF_GPIO) |			/* LCD_R1 */				\
								PIN_AFR(1,GPIO_AF_GPIO) |			/* LCD_R2 */				\
								PIN_AFR(2,GPIO_AF_GPIO) |			/* LCD_R3 */				\
								PIN_AFR(3,GPIO_AF_GPIO) |			/* LCD_R4 */				\
								PIN_AFR(4,GPIO_AF_GPIO) |			/* LCD_R5 */				\
								PIN_AFR(5,GPIO_AF_GPIO) |			/* LCD_R6 */				\
								PIN_AFR(6,GPIO_AF_GPIO) |			/* LCD_R7 */				\
								PIN_AFR(7,GPIO_AF_GPIO)				/* LCD_G0 */				
#define	CARIBOU_PORTJ_AFRH		PIN_AFR(0,GPIO_AF_GPIO) |			/* LCD_G1 */				\
								PIN_AFR(1,GPIO_AF_GPIO) |			/* LCD_G2 */				\
								PIN_AFR(2,GPIO_AF_GPIO) |			/* LCD_G3 */				\
								PIN_AFR(3,GPIO_AF_GPIO) |			/* LCD_G4 */				\
								PIN_AFR(4,GPIO_AF_GPIO) |			/* OTG_FS_VBUS */			\
								PIN_AFR(5,GPIO_AF_GPIO) |			/* LCD_B1 */				\
								PIN_AFR(6,GPIO_AF_GPIO) |			/* LCD_B2 */				\
								PIN_AFR(7,GPIO_AF_GPIO)				/* LCD_B3 */
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