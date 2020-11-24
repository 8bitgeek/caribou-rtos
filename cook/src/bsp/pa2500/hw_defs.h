 
#ifndef _BOARD_DEFS_H_
#define _BOARD_DEFS_H_

#include <caribou.h>
#include <caribou/kernel/timer.h>
#include <caribou/dev/gpio.h>
#include <chip/chip.h>
#include <stm32l4xx.h>
#include <stm32l431xx.h>
#include <stm32l4xx_hal_dma.h>

#ifdef __cplusplus
extern "C"
{
#endif

/****/
#define PRODUCT_WATCHDOG_ENABLED		1

#define PRODUCT_HTTP_ROOT				"/"

#define PRODUCT_HTTP_ENABLED			(1)
#define PRODUCT_MODBUS_ENABLED			(1)
#define PRODUCT_PAP_ENABLED				(1)

#define PRODUCT_DEBUG_MODBUS_SERVER		(0)
#define PRODUCT_DEBUG_MODBUS_SESSION	(0)
#define PRODUCT_DEBUG_HTTP_SERVER		(0)
#define PRODUCT_DEBUG_HTTP_SESSION		(0)
#define PRODUCT_DEBUG_PAP_SESSION		(0)
#define PRODUCT_DEBUG_SETTINGS			(0)
#define PRODUCT_DEBUG_HEAP_FREE			(0)

#define PRODUCT_DESCRIPTION				"PIKEAERO.COM : PA2400 Modbus Gateway"
#define PRODUCT_HOSTNAME				"PA2400"
#define	PRODUCT_VERSION					"1.2.2"
#define PRODUCT_VERSION_HW				"C"
#define PRODUCT_COPYRIGHT				"Copyright(c)2019 by Pike Aerospace Research Corp."
#define PRODUCT_URL						"http://www.pikeaero.com/pa2400"
#define PRODUCT_COMPANY					"Pike Aerospace Research Corp."

#define PRODUCT_HTTP_SERVER_NAME		"httpd"
#define PRODUCT_HTTP_SESSION_NAME		"http"
#define PRODUCT_MODBUS_SERVER_NAME		"mbd"
#define PRODUCT_MODBUS_SESSION_NAME		"mb"

#define PRODUCT_HTTP_PORT				(80)
#define PRODUCT_HTTP_BACKLOG			(4)
#define PRODUCT_MODBUS_PORT				(502)
#define PRODUCT_MODBUS_BACKLOG			(2)

#define PRODUCT_WD_PERIOD_MS			(1024)
#if PRODUCT_WATCHDOG_ENABLED
	#define PRODUCT_HTTPD_WD_COUNT			(0)
	#define PRODUCT_HTTP_WD_COUNT			(200)
	#define PRODUCT_MBD_WD_COUNT			(0)
	#define PRODUCT_MB_WD_COUNT				(1000)
	#define PRODUCT_ETHIN_WD_COUNT			(200)
#else

	#define PRODUCT_HTTPD_WD_COUNT			(0)
	#define PRODUCT_HTTP_WD_COUNT			(0)
	#define PRODUCT_MBD_WD_COUNT			(0)
	#define PRODUCT_MB_WD_COUNT				(0)
	#define PRODUCT_ETHIN_WD_COUNT			(0)
#endif

#define PRODUCT_HTTP_SERVER_ROOT		"/"
#define MODBUS_SESSION_SEMAPHORE_COUNT	(1)

#define STATIC_ADDRESS(a1,a2,a3,a4) (uint32_t)(a1<<24)|(a2<<16)|(a3<<8)|(a4)
#define PIKEAERO_MULTICAST_GROUP			STATIC_ADDRESS(239,255,255,128)
#define PIKEAERO_MULTICAST_GROUP_STRING		"239.255.255.128"
#define PIKEAERO_MULTICAST_GROUP_OCTETS		{239,255,255,128}
#define PIKEAERO_MULTICAST_PORT				(5454)

#define	PIKEAERO_PAP_SIGNATURE							"PIKEAER0"	/* 'PIKEAER0' */
#define	PIKEAERO_PAP_SIGNATURE_SZ						8			/* 'PIKEAER0' */
#define	PIKEAERO_PAP_HOSTNAME_SZ						32			/* 'HOSTNAME' */
#define PIKEAERO_PAP_DHCP_MASK							0x01		/* DHCP bit mask */

#define PIKEAERO_PAP_TYPE_REQUEST_MASK                  0x0F
#define PIKEAERO_PAP_TYPE_RESPONSE_MASK                 0xF0

#define PIKEAERO_PAP_TYPE_DISCOVER_REQUEST				0x01		/* A discovery request was received */
#define PIKEAERO_PAP_TYPE_DISCOVER_RESPONSE				0x10		/* Discovery response sent out */

#define	PIKEAERO_PAP_TYPE_IP_SETTINGS_REQUEST			0x02		/* A request to change IP settings */
#define	PIKEAERO_PAP_TYPE_IP_SETTINGS_RESPONSE			0x20		/* A request to change IP settings */

#define	PIKEAERO_PAP_TYPE_RESET_REQUEST					0x03		/* A request to reset the device */
#define	PIKEAERO_PAP_TYPE_RESET_RESPONSE				0x30		/* A confirmation response to reset request */

#define PRODUCT_I2CSPEED				(25)
#define PRODUCT_EEPROM_BPP				(16)	/* EEPROM Bytes Per Page */

#define PRODUCT_FILE_XFR_BUFSZ			(256)

#define PRODUCT_HTTP_SEND_BUFFER_SZ		(720)	/* HTTP send buffer overflow size */
//#define PRODUCT_HTTP_SEND_BUFFER_SZ		(256)	/* HTTP send buffer overflow size */

#define PRODUCT_THREAD_NORMAL_PRIO		(1)
#define PRODUCT_DHCP_THREAD_PRIORITY	PRODUCT_THREAD_NORMAL_PRIO
#define PRODUCT_HTTP_THREAD_PRIO		PRODUCT_THREAD_NORMAL_PRIO
#define PRODUCT_HTTP_SESSION_PRIO		PRODUCT_THREAD_NORMAL_PRIO
#define PRODUCT_MODBUS_THREAD_PRIO		PRODUCT_THREAD_NORMAL_PRIO
#define PRODUCT_MODBUS_SESSION_PRIO		PRODUCT_THREAD_NORMAL_PRIO
#define PRODUCT_ETHIF_THREAD_PRIO		PRODUCT_THREAD_NORMAL_PRIO
#define PRODUCT_PAP_THREAD_PRIO			PRODUCT_THREAD_NORMAL_PRIO

#define PRODUCT_DHCP_THREAD_STACK_SZ	(780)
#define PRODUCT_HTTP_SERVER_STK_SZ		(512*3)
//#define PRODUCT_HTTP_THREAD_STK_SZ		(1024*3)
#define PRODUCT_HTTP_THREAD_STK_SZ		(512*5)
#define PRODUCT_MODBUS_SERVER_STK_SZ	(512*2)
#define PRODUCT_MODBUS_THREAD_STK_SZ	(512*2)
#define PRODUCT_ETHIF_THREAD_STK_SZ		(1200)
#define PRODUCT_PAP_THREAD_STK_SZ		(780)

#if PA_DEBUG
	extern int debug_printf(const char *format, ...);
#endif

#define ETH_IRQn				EXTI4_IRQn								/* ENC28J60 Interrupt pin IRQ vector */
#define	ETH_LINE				EXTI_Line4								/* ENC28J60 Interript pin */

#define	ENC28J60_SPI			SPI1
#if !defined(ENC28J60_USE_DMA)
	#define ENC28J60_USE_DMA	(0)
#endif
#define ENC28J60_MAX_PACKET		(1500)
#define ENC28J60_DMA_TX_CHAN	DMA1_Channel3
#define ENC28J60_DMA_RX_CNAN	DMA1_Channel2

#define ENC28J60_DMA_TX_CSELR 	DMA1_CSELR
#define ENC28J60_DMA_RX_CSELR 	DMA1_CSELR

#define ENC28J60_DMA_TX_CSEL	(0x01 << DMA_CSELR_C3S_Pos)
#define ENC28J60_DMA_RX_CSEL	(0x01 << DMA_CSELR_C2S_Pos)

/****/

#define TIM1_BUS_HZ			(80000000)
#define TIM2_BUS_HZ			TIM1_BUS_HZ
#define TIM16_BUS_HZ		TIM1_BUS_HZ

#define TX_TIM				TIM1
#define TX_TIM_TRG_IRQn		TIM1_TRG_COM_IRQn
#define	TX_TIM_CC_IRQn		TIM1_CC_IRQn
#define TX_TIM_UP_IRQn		TIM1_UP_TIM16_IRQn
#define TX_TIM_PWM_CHANNEL	PWM_CHANNEL_2
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
#define RX_TIM_BUS_HZ		TIM16_BUS_HZ							/* PWM Timer bus clock frequency */
#define RX_TIM_HZ			(40000000)								/* PWM Timer counter frequency */
#define RX_TIM_PERIOD_HZ	(500000)								/* PWM Period Frequency */
#define RX_TIM_OUT_TICKS	(RX_TIM_HZ/RX_TIM_PERIOD_HZ)			/* PWM period in PWM Counter clock ticks */

#define tim_precale(bus_hz,tim_hz) 		( ( bus_hz / tim_hz ) - 1 )
#define tim_period(tim_hz,period_hz)	( tim_hz / period_hz )

extern uint32_t SystemCoreClock;

#ifdef __cplusplus
}
#endif

#endif
