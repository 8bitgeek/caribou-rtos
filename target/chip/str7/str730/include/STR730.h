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
#ifndef __STR730_H__
#define __STR730_H__

#include "types.h"


	typedef signed long						s32;
	typedef signed short					s16;
	typedef signed char						s8;

	typedef volatile signed long			vs32;
	typedef volatile signed short			vs16;
	typedef volatile signed char			vs8;

	typedef unsigned long					u32;
	typedef unsigned short					u16;
	typedef unsigned char					u8;

	typedef volatile unsigned long			vu32;
	typedef volatile unsigned short			vu16;
	typedef volatile unsigned char			vu8;

	typedef volatile unsigned long  const	vuc32;  /* Read Only */
	typedef volatile unsigned short const	vuc16;  /* Read Only */
	typedef volatile unsigned char  const	vuc8;   /* Read Only */

	#ifndef EXT
	#define EXT extern
	#endif /* EXT */

	/*-------------------------------FLASH -----------------------------------------*/
	typedef struct
	{
		vu32  CR0;
		vu32  CR1;
		vu32  DR0;
		vu32  DR1;
		vu32  AR;
		vu32  ER;
	} FLASHR_TypeDef;


	typedef struct
	{
		vu32  NVWPAR;
		u32   EMPTY;
		vu32  NVAPR0;
		vu32  NVAPR1;
	} FLASHPR_TypeDef;

	/* Flash operation enable bit mask */
	#define	FLASH_LOCK				0x00000010
	#define	FLASH_INTP				0x00100000
	#define	FLASH_INTM				0x00200000
	#define FLASH_SPR				0x01000000
	#define FLASH_SER				0x08000000
	#define FLASH_DWPG				0x10000000
	#define FLASH_WPG				0x20000000
	#define FLASH_SUSP				0x40000000
	#define FLASH_WMS				0x80000000

    /* Flash bank 0 sectors */
	#define FLASH_BANK0_SECTOR0		0x00000001  /* Bank 0 sector 0 */
	#define FLASH_BANK0_SECTOR1		0x00000002  /* Bank 0 sector 1 */
	#define FLASH_BANK0_SECTOR2		0x00000004  /* Bank 0 sector 2 */
	#define FLASH_BANK0_SECTOR3		0x00000008  /* Bank 0 sector 3 */
	#define FLASH_BANK0_SECTOR4		0x00000010  /* Bank 0 sector 4 */
	#define FLASH_BANK0_SECTOR5		0x00000020  /* Bank 0 sector 5 */
	#define FLASH_BANK0_SECTOR6		0x00000040  /* Bank 0 sector 6 */
	#define FLASH_BANK0_SECTOR7		0x00000080  /* Bank 0 sector 7 */
	/* Flash bank 0 module */
	#define FLASH_BANK0_MODULE		0x000000FF  /* Bank 0 module   */

	/* Flash bank 1 sectors */
	#define FLASH_BANK1_SECTOR0		0x00010000  /* Bank 1 sector 0 */
	#define FLASH_BANK1_SECTOR1		0x00020000  /* Bank 1 sector 1 */
	/* Flash bank 1 module */
	#define FLASH_BANK1_MODULE		0x00030000  /* Bank 1 module   */


	/*------------------- Power, Reset and Clocks Unit------------------------------*/
	typedef struct
	{
		vu32  CCR   ;      /*Clock Control Register*/
		vu32  VRCTR ;      /*Voltage Regulator Control Register*/
		vu32  CFR ;        /*Clock Flag Register*/
		u32   EMPTY1[3];
		vu32  PLLCR  ;     /*PLL Configuration Register*/
		u32   EMPTY2 ;
		vu32  SMR ;        /*System Mode Register*/
		u32   EMPTY3 ;
		vu32  RTCPR ;      /*Real Time Clock Programming Register*/
	} PRCCU_TypeDef;

	/* Main oscillator 4MHz */
	#define RCCU_OSC_MAIN		4000000
	/* Backup (RC) Oscillator 2MHz */
	#define RCCU_OSC_RC			2000000

	/* PRCCU CCR (Clock Control Register) */
	#define PRCCU_LPOWFI		0x0001
	#define PRCCU_WFI_CKSEL		0x0002
	#define PRCCU_SRESEN		0x0008
	#define PRCCU_EN_LOCK		0x0080
	#define PRCCU_EN_CK2_16		0x0200
	#define PRCCU_EN_STOP		0x0400
	#define PRCCU_EN_HALT		0x0800

	/* PRCCU VRCTR (Voltage Regulator Control Register) */
	#define PRCCU_VROK			0x0004
	#define PRCCU_VROFF_REG		0x0008
	#define PRCCU_VRLPW			0x0010

	/* PRCCU CFR (Clock Flag Register) */
	#define PRCCU_CSU_CKSEL		0x0001
	#define PRCCU_LOCK			0x0002
	#define PRCCU_CK2_16		0x0008
	#define PRCCU_SOFTRES		0x0020
	#define PRCCU_WDGRES		0x0040
	#define PRCCU_LVD_INT		0x0100
	#define PRCCU_LOCK_I		0x0800
	#define PRCCU_CK2_16_I		0x2000
	#define PRCCU_STOP_I		0x4000
	#define PRCCU_DIV2			0x8000

	/* PRCCU PLLCR (PLL Configuration Register) */
	#define PRCCU_DX0			0x0001
	#define PRCCU_DX1			0x0002
	#define PRCCU_DX2			0x0004
	#define PRCCU_MX0			0x0010
	#define PRCCU_MX1			0x0020
	#define PRCCU_FREF_RANGE	0x0040
	#define PRCCU_FREEN			0x0080

	/* PLL Multiplication Factors */
	#define PRCCU_PLLMUL_12		PRCCU_MX0
	#define PRCCU_PLLMUL_16		(PRCCU_MX0|PRCCU_MX1)
	#define PRCCU_PLLMUL_20		0
	#define PRCCU_PLLMUL_28		PRCCU_MX1

	/* PLL Division Factors */
	#define PRCCU_PLLDIV_1		0
	#define PRCCU_PLLDIV_2		(PRCCU_DX0)
	#define PRCCU_PLLDIV_3		(PRCCU_DX1)
	#define PRCCU_PLLDIV_4		(PRCCU_DX1|PRCCU_DX0)
	#define PRCCU_PLLDIV_5		(PRCCU_DX2)
	#define PRCCU_PLLDIV_6		(PRCCU_DX2|PRCCU_DX0)
	#define PRCCU_PLLDIV_7		(PRCCU_DX2|PRCCU_DX1)
	#define PRCCU_PLLDIV_CLOCK2	(PRCCU_DX2|PRCCU_DX1|PRCCU_DX0)

	/** System mode register */
	#define PRCCU_HALT			0x0002
	#define	PRCCU_WFI			0x0001

	/*----------------   Native Arbiter Registers ----------------------------------*/

	typedef  struct
	{
		vu32  TOR;
		vu32  PRIOR;
		u32   EMPTY;
		vu32  CTLR;
	} ARB_TypeDef;
	/*----------------   System Configuration Registers ----------------------------*/
	typedef struct
	{
		vu32  R0     ;    /*Configuration Register 0*/
		vu32  EITE0  ;    /*External Interrupt Trigger Event Register 0*/
		vu32  PCGR0  ;    /*Peripheral Clock Gating Register 0*/
		vu32  PCGR1  ;    /*Peripheral Clock Gating Register 1*/
		vu32  PECGR0 ;    /*Peripheral Emulation Clock Gating Register 0*/
		vu32  PECGR1 ;    /*Peripheral Emulation Clock Gating Register 1*/
		vu32  PCGRB0 ;    /*Peripheral Clock Gating Register B0*/
		vu32  PCGRB1 ;    /*Peripheral Clock Gating Register B1*/
		vu32  TIMSR  ;    /*TIM External Clock Select Register*/
		vu32  EITE1  ;    /*External Interrupt Trigger Event Register 1*/
		vu32  EITE2  ;    /*External Interrupt Trigger Event Register 2*/
		vu32  ESPR   ;    /*Emulation Serial Protection Register*/
		vu32  R1     ;    /*Configuration Register 1*/
		vuc32 DIDR   ;    /*Device Identification Register*/
	}CFG_TypeDef;

	#define	CFG_PCGR0_RAM		(1<<0)
	#define	CFG_PCGR0_I2C0		(1<<1)
	#define	CFG_PCGR0_WIU		(1<<2)
	#define	CFG_PCGR0_UART0		(1<<4)
	#define	CFG_PCGR0_UART1		(1<<5)
	#define	CFG_PCGR0_TIM0		(1<<6)
	#define	CFG_PCGR0_TIM1		(1<<7)
	#define	CFG_PCGR0_TB0		(1<<8)
	#define	CFG_PCGR0_CAN0		(1<<10)
	#define	CFG_PCGR0_CAN1		(1<<11)
	#define	CFG_PCGR0_PWM0		(1<<12)
	#define	CFG_PCGR0_PWM1		(1<<13)
	#define	CFG_PCGR0_PWM2		(1<<14)
	#define	CFG_PCGR0_PWM3		(1<<15)
	#define	CFG_PCGR0_PWM4		(1<<16)
	#define	CFG_PCGR0_PWM5		(1<<17)
	#define	CFG_PCGR0_PORT0		(1<<18)
	#define	CFG_PCGR0_PORT1		(1<<19)
	#define	CFG_PCGR0_PORT2		(1<<20)
	#define	CFG_PCGR0_PORT3		(1<<21)
	#define	CFG_PCGR0_PORT4		(1<<22)
	#define	CFG_PCGR0_PORT5		(1<<23)
	#define	CFG_PCGR0_PORT6		(1<<24)
	#define	CFG_PCGR0_BSPI0		(1<<25)
	#define	CFG_PCGR0_BSPI1		(1<<26)
	#define	CFG_PCGR0_BSPI2		(1<<27)
	#define	CFG_PCGR0_ADC		(1<<28)
	#define	CFG_PCGR0_EIC		(1<<29)
	#define	CFG_PCGR0_WUT		(1<<30)

	#define CFG_PCGR1_I2C1		(1<<0)
	#define CFG_PCGR1_TIM5		(1<<3)
	#define CFG_PCGR1_TIM6		(1<<4)
	#define CFG_PCGR1_TIM7		(1<<5)
	#define CFG_PCGR1_TIM8		(1<<6)
	#define CFG_PCGR1_TIM9		(1<<7)
	#define CFG_PCGR1_UART2		(1<<8)
	#define CFG_PCGR1_UART3		(1<<9)
	#define CFG_PCGR1_TB1		(1<<13)
	#define CFG_PCGR1_TB2		(1<<14)
	#define CFG_PCGR1_TIM2		(1<<16)
	#define CFG_PCGR1_TIM3		(1<<17)
	#define CFG_PCGR1_TIM4		(1<<18)
	#define CFG_PCGR1_RTC		(1<<19)
	#define CFG_PCGR1_DMA0		(1<<20)
	#define CFG_PCGR1_DMA1		(1<<21)
	#define CFG_PCGR1_DMA2		(1<<22)
	#define CFG_PCGR1_DMA3		(1<<23)
	#define CFG_PCGR1_NBA		(1<<29)
	#define CFG_PCGR1_AHB		(1<<30)


	/*----------------------------AHB BRIDGE --------------------------------------*/
	typedef struct
	{
		vu32  TOR;
		vu32  PRIOR;
		u32   EMPTY;
		vu32  CTLR;
	} AHB_TypeDef;

	/**************************APB  System memory Map*******************************/

	/*----------------------------APB BRIDGE --------------------------------------*/
	typedef struct
	{
		vu32  BSR;
		vu32  TOR;
		vuc32 OMR;
		vuc32 TOER;
	} APB_TypeDef;

	/*----------------  Clock Monitor Unit ----------------------------------------*/
	typedef  struct
	{
		vu16  RCCTL     ;  /* RCOscillator Control Register */
		u16   EMPTY1    ;
		vuc16 FDISP     ;  /* Frequency Display Register*/
		u16   EMPTY2    ;
		vu16  FRH       ;  /* Frequency Reference High Register*/
		u16   EMPTY3    ;
		vu16  FRL       ;  /* Frequency Reference Low Register*/
		u16   EMPTY4    ;
		vu16  CTRL      ;  /* Control Register*/
		u16   EMPTY5    ;
		vu16  STAT      ;  /* Status Register*/
		u16   EMPTY6    ;
		vu16  IS        ;  /* Interrupt Status Register*/
		u16   EMPTY7    ;
		vu16  IM        ;  /* Interrupt Mask Register*/
		u16   EMPTY8    ;
		vu16  EOCV      ;  /* End Of Countvalue Register*/
		u16   EMPTY9    ;
		vu16  WE        ;  /* Writing Enable Register*/
		u16   EMPTY10   ;
	} CMU_TypeDef;
	/* CMU IM/IS (Interrupt Mask / Interrupt Status registers)*/
	#define CMU_OLRM		0x0001
	#define CMU_EOCM		0x0002
	#define CMU_FLLM		0x0004
	#define CMU_ROIM		0x0008

	/* CMU STAT (Status Register) */
	#define CMU_CKON0		0x0001
	#define CMU_CKON1		0x0002
	#define CMU_CKON2		0x0004
	#define CMU_RON			0x0008
	#define CMU_CRF			0x0010


	/* CMU CTRL (Control Register) */
	#define CMU_CKSEL0		0x0001
	#define CMU_CKSEL1		0x0002
	#define CMU_CKSEL2		0x0004
	#define CMU_REN			0x0008
	#define CMU_SFM			0x0010
	#define CMU_RCSS		0x0020
	#define CMU_RCHSE		0x0040
	#define CMU_RCFS		0x0080
	#define CMU_RCFR		0x0100
	#define CMU_CRFR		0x0200
	#define CMU_OSCS		0x0400

	/* CMU WE (Write Enable) */
	#define CMU_KEY1		0x50FA
	#define CMU_KEY2		0xAF05

	/*---------------------- Buffered Serial Port Interface ----------------------*/
	typedef struct
	{
		vuc16 RXR;        /*Receive Register*/
		u16   EMPTY1;
		vu16  TXR;        /*Transmit Register*/
		u16   EMPTY2;
		vu16  CSR1;       /*control Status Register 1*/
		u16   EMPTY3;
		vu16  CSR2;       /*Control Status Register 2*/
		u16   EMPTY4;
		vu16  CLK;        /*Master Clock Divider Register*/
		u16   EMPTY5;
		vu16  CSR3;       /*Control Status Register 3*/
		u16   EMPTY6;
	} BSPI_TypeDef;

	/* BSPI Control/status register 1 (CSR1) */
	#define BSPI_BSPE			0x0001
	#define BSPI_MSTR			0x0002
	#define BSPI_RIE(n)			(0x000C & (n<<2))
	#define BSPI_BEIE			0x0080
	#define BSPI_CPOL			0x0100
	#define BSPI_CPHA			0x0200
	#define BSPI_WL(n)			(0x0C00 & (n<<10))
	#define BSPI_RFEN(n)			(0xF000 & (n<<12))

	/* BSPI Control/status register 2 (CSR2) */
	#define BSPI_DFIFO			0x0001
	#define BSPI_BERR			0x0004
	#define BSPI_RFNE			0x0008
	#define BSPI_RFF			0x0010
	#define BSPI_ROFL			0x0020
	#define BSPI_TFE			0x0040
	#define BSPI_TUFL			0x0080
	#define BSPI_TFF			0x0100
	#define BSPI_TFNE			0x0200
	#define BSPI_TFEN(n)		(0x3C00 & (n<<10))
	#define BSPI_TIE(n)			(0xC000 & (n<<14))

	/* BSPI Control/status register 3 (CSR3) */
	#define BSPI_MASK_SS		0x0001
	#define BSPI_DMA_EN			0x0002
	#define BSPI_TBURST_LEN(n)	(0x000C & (n<<2))
	#define BSPI_RBURST_LEN(n)	(0x0020 & (n<<4))
	#define BSPI_TREQ_EN		0x0040
	#define BSPI_RREQ_EN		0x0080

	/* BSPI Transmit register (TXR) */
	#define BSPI_TX8(n)			(0xFF00 & (n<<8))

	/*---------------------- I2C  ------------------------------------------------*/
	typedef  struct
	{
		vu8  CR;
		u8   EMPTY1[3];
		vuc8 SR1;
		u8   EMPTY2[3];
		vuc8 SR2;
		u8   EMPTY3[3];
		vu8  CCR;
		u8   EMPTY4[3];
		vu8  OAR1;
		u8   EMPTY5[3];
		vu8  OAR2;
		u8   EMPTY6[3];
		vu8  DR;
		u8   EMPTY7[3];
		vu8  ECCR;
		u8   EMPTY8[3];
	} I2C_TypeDef;

	/*------------------- Universal Asynchronous Receiver Transmitter ------------*/
	typedef struct
	{
		vu16  BR;       /*BaudRate register*/
		u16   EMPTY1;
		vu16  TxBUFR;   /*TxBuffer Register*/
		u16   EMPTY2;
		vuc16 RxBUFR;   /*RxBuffer Register*/
		u16   EMPTY3;
		vu16  CR;       /*Control Register*/
		u16   EMPTY4;
		vu16  IER;      /*IntEnable Register*/
		u16   EMPTY5;
		vuc16 SR;       /*Status Register*/
		u16   EMPTY6;
		u16   EMPTY7;
		u16   EMPTY8;
		vu16  TOR;      /*Timeout Register*/
		u16   EMPTY9;
		vu16  TxRSTR;   /*TxReset register*/
		u16   EMPTY10;
		vu16  RxRSTR;   /*RxReset register*/
		u16   EMPTY11;
	} UART_TypeDef;
	/* UART Mode*/
	#define  UART_Mode_8D    0x0001
	#define  UART_Mode_7D_P  0x0003
	#define  UART_Mode_9D    0x0004
	#define  UART_Mode_8D_W  0x0005
	#define  UART_Mode_8D_P  0x0007

	/* UART StopBits*/
	#define  UART_StopBits_0_5  0x0000
	#define  UART_StopBits_1    0x0008
	#define  UART_StopBits_1_5  0x0010
	#define  UART_StopBits_2    0x0018

	#define UART_Parity         0x0020      /* UART Parity*/
	#define UART_LoopBack       0x0040      /* UART Loop_Standard*/
	#define UART_RUN			0x0080      /* UART RUN */
	#define UART_Rx_EN			0x0100      /* UART Rx Enabled */
    #define UART_SC_EN          0x0200      /* UART SC Enable */
    #define UART_FIFO			0x0400      /* UART FIFO*/

	/* UART Reset FIFO*/
	#define  UART_RxFIFO        0x5555
	#define  UART_TxFIFO        0x5555

	/* UART status register SR */
	#define UART_SR_TxFull          0x0200
	#define UART_SR_RxHalfFull      0x0100
	#define UART_SR_TimeOutIdle     0x0080
	#define UART_SR_TimeOutNotEmpty 0x0040
	#define UART_SR_OverrunError    0x0020
	#define UART_SR_FrameError      0x0010
	#define UART_SR_ParityError     0x0008
	#define UART_SR_TxHalfEmpty     0x0004
	#define UART_SR_TxEmpty         0x0002
	#define UART_SR_RxBufNotEmpty   0x0001

	/* UART Interrupt definition */
	#define UART_IT_RxHalfFull      0x0100
	#define UART_IT_TimeOutIdle     0x0080
	#define UART_IT_TimeOutNotEmpty 0x0040
	#define UART_IT_OverrunError    0x0020
	#define UART_IT_FrameError      0x0010
	#define UART_IT_ParityError     0x0008
	#define UART_IT_TxHalfEmpty     0x0004
	#define UART_IT_TxEmpty         0x0002
	#define UART_IT_RxBufNotEmpty   0x0001

	/*----------------  Analog to Digital Converter -----------------------*/
	typedef struct
	{
		vu16  CLR0 ;
		u16   EMPTY1;
		vu16  CLR1 ;
		u16   EMPTY2;
		vu16  CLR2 ;
		u16   EMPTY3;
		vu16  CLR3 ;
		u16   EMPTY4;
		vu16  CLR4 ;
		u16   EMPTY5;
		vu16  TRA0 ;
		u16   EMPTY6;
		vu16  TRA1 ;
		u16   EMPTY7;
		vu16  TRA2 ;
		u16   EMPTY8;
		vu16  TRA3 ;
		u16   EMPTY9;
		vu16  TRB0 ;
		u16   EMPTY10;
		vu16  TRB1 ;
		u16   EMPTY11;
		vu16  TRB2 ;
		u16   EMPTY12;
		vu16  TRB3 ;
		u16   EMPTY13;
		vu16  DMAR ;
		u16   EMPTY14[7];
		vu16  DMAE ;
		u16   EMPTY15  ;
		vu16  PBR  ;
		u16   EMPTY16;
		vu16  IMR  ;
		u16   EMPTY17;
		vuc16 D0 ;
		u16   EMPTY18;
		vuc16 D1 ;
		u16   EMPTY19;
		vuc16 D2 ;
		u16   EMPTY20;
		vuc16 D3 ;
		u16   EMPTY21;
		vuc16 D4 ;
		u16   EMPTY22;
		vuc16 D5 ;
		u16   EMPTY23;
		vuc16 D6 ;
		u16   EMPTY24;
		vuc16 D7 ;
		u16   EMPTY25;
		vuc16 D8 ;
		u16   EMPTY26;
		vuc16 D9 ;
		u16   EMPTY27;
		vuc16 D10;
		u16   EMPTY28;
		vuc16 D11 ;
		u16   EMPTY29;
		vuc16 D12 ;
		u16   EMPTY30;
		vuc16 D13 ;
		u16   EMPTY31;
		vuc16 D14 ;
		u16   EMPTY32;
		vuc16 D15 ;
		u16   EMPTY33;
	} ADC_TypeDef;

	/* ADC control status flags */
	#define    ADC_FLAG_ECH								0x0001
	#define    ADC_FLAG_EOC								0x0002
	#define    ADC_FLAG_JECH							0x0004
	#define    ADC_FLAG_JEOC							0x0008

	/* ADC Interrupt sources */
	#define    ADC_IT_None								0x0000
	#define    ADC_IT_ECH								0x0001
	#define    ADC_IT_EOC								0x0002
	#define    ADC_IT_JECH								0x0004
	#define    ADC_IT_JEOC								0x0008

	/* ADC Channels */
	#define  ADC_CHANNEL0   0x0
	#define  ADC_CHANNEL1   0x1
	#define  ADC_CHANNEL2   0x2
	#define  ADC_CHANNEL3   0x3
	#define  ADC_CHANNEL4   0x4
	#define  ADC_CHANNEL5   0x5
	#define  ADC_CHANNEL6   0x6
	#define  ADC_CHANNEL7   0x7
	#define  ADC_CHANNEL8   0x8
	#define  ADC_CHANNEL9   0x9
	#define  ADC_CHANNEL10  0xA
	#define  ADC_CHANNEL11  0xB
	#define  ADC_CHANNEL12  0xC
	#define  ADC_CHANNEL13  0xD
	#define  ADC_CHANNEL14  0xE
	#define  ADC_CHANNEL15  0xF

	/* ADC DMA Channels */
	#define  ADC_DMA_CHANNEL0   0x0001
	#define  ADC_DMA_CHANNEL1   0x0002
	#define  ADC_DMA_CHANNEL2   0x0004
	#define  ADC_DMA_CHANNEL3   0x0008
	#define  ADC_DMA_CHANNEL4   0x0010
	#define  ADC_DMA_CHANNEL5   0x0020
	#define  ADC_DMA_CHANNEL6   0x0040
	#define  ADC_DMA_CHANNEL7   0x0080
	#define  ADC_DMA_CHANNEL8   0x0100
	#define  ADC_DMA_CHANNEL9   0x0200
	#define  ADC_DMA_CHANNEL10  0x0400
	#define  ADC_DMA_CHANNEL11  0x0800
	#define  ADC_DMA_CHANNEL12  0x1000
	#define  ADC_DMA_CHANNEL13  0x2000
	#define  ADC_DMA_CHANNEL14  0x4000
	#define  ADC_DMA_CHANNEL15  0x8000

	/* Control Logic Register 0 (CLR0) */
	#define ADC_START           0x0001
	#define ADC_CAL             0x0002

    /* Control Logic Register 1 (CLR1) */
	#define ADC_SPEN            0x8000
	#define ADC_CNVP(n)         ( ( n & 0x07 ) << 5 )
	#define ADC_SMPP(n)         ( ( n & 0x07 ) << 0 )

    /* Control Logic Register 2 (CLR2) */
	#define ADC_MODE			0x8000
	#define ADC_NCH(n)          ( ( n & 0x0F ) << 6 )
	#define ADC_FCH(n)          ( ( n & 0x0F ) << 0 )

    /* Control Logic Reguster 3 (CLR3) */
    #define ADC_JSTART          0x8000
	#define ADC_JNCH(n)         ( ( n & 0x0F ) << 6 )
	#define ADC_JFCH(n)         ( ( n & 0x0F ) << 0 )

	/* Control Logic register 4 (CLR4) */
	#define ADC_PWDN            0x8000
    #define ADC_ACKO            0x4000
    #define ADC_NOAVRG          0x0020


	/*-------------------- General Purpose IO ports---------------------------*/
	typedef struct
	{
		vu16  PC0;
		u16   EMPTY1;
		vu16  PC1;
		u16   EMPTY2;
		vu16  PC2;
		u16   EMPTY3;
		vu16  PD;
		u16   EMPTY4;
	} GPIO_TypeDef;
	/* GPIO Pins define */
	#define GPIO_PIN_NONE   0x0000
	#define GPIO_PIN_0      0x0001
	#define GPIO_PIN_1      0x0002
	#define GPIO_PIN_2      0x0004
	#define GPIO_PIN_3      0x0008
	#define GPIO_PIN_4      0x0010
	#define GPIO_PIN_5      0x0020
	#define GPIO_PIN_6      0x0040
	#define GPIO_PIN_7      0x0080
	#define GPIO_PIN_8      0x0100
	#define GPIO_PIN_9      0x0200
	#define GPIO_PIN_10     0x0400
	#define GPIO_PIN_11     0x0800
	#define GPIO_PIN_12     0x1000
	#define GPIO_PIN_13     0x2000
	#define GPIO_PIN_14     0x4000
	#define GPIO_PIN_15     0x8000
	#define GPIO_PIN_ALL    0xFFFF

	/* GPIO Modes define */
	#define GPIO_HI_AIN_TRI    0x0001
	#define GPIO_IN_TRI_TTL    0x0002
	#define GPIO_INOUT_WP      0x0003
	#define GPIO_OUT_OD        0x0004
	#define GPIO_OUT_PP        0x0005
	#define GPIO_AF_OD         0x0006
	#define GPIO_AF_PP         0x0007

	/* GPIO MSB and LSB Bytes define */
	#define GPIO_LSB   0x0000
	#define GPIO_MSB   0x0008

	/*--------------------------Real Time Clock ------------------------------*/
	typedef struct
	{
		vu16  CRH;
		u16   EMPTY1;
		vu16  CRL;
		u16   EMPTY2;
		vu16  PRLH;
		u16   EMPTY3;
		vu16  PRLL;
		u16   EMPTY4;
		vu16  DIVH;
		u16   EMPTY5;
		vu16  DIVL;
		u16   EMPTY6;
		vu16  CNTH;
		u16   EMPTY7;
		vu16  CNTL;
		u16   EMPTY8;
		vu16  ALRH;
		u16   EMPTY9;
		vu16  ALRL;
		u16   EMPTY10;
	} RTC_TypeDef;

	/* RTC Interrupt defines */
	#define RTC_IT_GL     0x08
	#define RTC_IT_OV     0x04
	#define RTC_IT_ALA    0x02
	#define RTC_IT_SEC    0x01
	#define RTC_IT_ALL    0x0F

	/* RTC Flags defines */
	#define RTC_FLAG_GL     0x08
	#define RTC_FLAG_OV     0x04
	#define RTC_FLAG_ALA    0x02
	#define RTC_FLAG_SEC	0x01

	/* Configuration Flag Mask */
	#define RTC_CNF			0x0010

	/* Last task finished Mask */
	#define RTC_RTOFF		0x0020

	/*-------------- Enhanced Interrupt Controller ----------------------------*/
	typedef struct
	{
		vu32  ICR      ;   /*  Interrupt Control Register*/
		vuc32 CICR     ;   /*  Current Interrupt Channel Register*/
		vu32  CIPR     ;   /*  Current Interrupt Priority Register*/
		u32   EMPTY1   ;
		vu32  FIER     ;   /*  Fast Interrupt Enable Register*/
		vu32  FIPR     ;   /*  Fast Interrupt Pending Register*/
		vu32  IVR      ;   /*  Interrupt Vector Register*/
		vu32  FIR      ;   /*  Fast Interrupt Register*/
		vu32  IER0     ;   /*  Interrupt Enable Register0*/
		vu32  IER1     ;   /*  Interrupt Enable Register1*/
		u32   EMPTY3[6];
		vu32  IPR0     ;   /*  Interrupt Pending Register0*/
		vu32  IPR1     ;   /*  Interrupt Pending Register1*/
		u32   EMPTY4[6];
		vu32  SIRn[64] ;   /*  Source Interrupt registers- Channel n*/
	} EIC_TypeDef;
	/* External Interrupts requests */

	#define EIC_IRQ_EN     0x01
	#define EIC_FIQ_EN     0x02

	/*-------------------------- Wake-up/Interrupt Unit-----------------------*/

	typedef  struct
	{
		vu32  CTRL  ;   /*Control Register*/
		vu32  MR    ;   /*Mask Register*/
		vu32  TR    ;   /*Trigger Register*/
		vu32  PR    ;   /*Pending Register*/
		vu32  INTR  ;   /*Software Interrupt Register*/
	} WIU_TypeDef;

	/*----------------------------------- Wake-Up Timer-----------------------*/
	typedef struct
	{
		vu16  CR    ;   /*Control Register*/
		u16   EMPTY1;
		vu16  PR    ;   /*Prescaler Register*/
		u16   EMPTY2;
		vu16  VR    ;   /*Pre-load Value Register*/
		u16   EMPTY3;
		vuc16 CNT  ;   /*Counter Register*/
		u16   EMPTY4;
		vu16  SR    ;   /*Status Register*/
		u16   EMPTY5;
		vu16  MR    ;   /*Mask Register*/
		u16   EMPTY6;
	} WUT_TypeDef;

	/*-------------------- Extended Function TIMer ---------------------------*/

	typedef  struct
	{
		vuc16 ICAR;   /* Input Capture A Register*/
		u16   EMPTY1;
		vuc16 ICBR;   /* Input Capture B Register*/
		u16   EMPTY2;
		vu16  OCAR;   /* Output Compare A Register*/
		u16   EMPTY3;
		vu16  OCBR;   /* Input Capture B Register*/
		u16   EMPTY4;
		vu16  CNTR;   /* Counter Register */
		u16   EMPTY5;
		vu16  CR1;    /* Control Register 1 */
		u16   EMPTY6;
		vu16  CR2;    /* Control Register 2 */
		u16   EMPTY7;
		vu16  SR;     /* Status Register */
		u16   EMPTY8;
	} TIM_TypeDef;

	/* Timer Control Register 1 */
	#define TIM_EN				0x8000 /* Timer Count Enable */
	#define TIM_PWMI      	    0x4000 /* PWM INPUT Mode */
    #define TIM_DMAS1           0x2000 /* DMA source select 1:0 */
    #define TIM_DMAS0           0x1000 /* DMA source select 0:1 */
	#define TIM_ICAPA           0x0000 /* Input Capture Channel A DMA Source */
	#define TIM_OCMPA           0x1000 /* OUTPUT Compare Channel A DMA Source */
	#define TIM_ICAPB           0x2000 /* Input Capture Channel B DMA Source */
	#define TIM_OCMPB           0x3000 /* OUTPUT Compare Channel A DMA Source */
    #define TIM_FOLVB           0x0800 /* Forces OLVLB to be copied to the OCMPB pin */
    #define TIM_FOLVA           0x0400 /* Forces OLVLA to be copied to the OCMPA pin */
    #define TIM_OLVLB           0x0200 /* Output Level B */
    #define TIM_OLVLA           0x0100 /* Output Level A */
    #define TIM_OCBE            0x0080 /* Output Compare B Enable */
    #define TIM_OCAE            0x0040 /* Output Compare A Enable */
    #define TIM_OPM             0x0020 /* One Pulse Mode */
    #define TIM_PWM             0x0010 /* Pulse Width Modulation */
    #define TIM_IEDGB           0x0008 /* Input Edge B */
    #define TIM_IEDGA           0x0004 /* Input Edge A */
    #define TIM_EXEDG           0x0002 /* External Clock Edge */
    #define TIM_ECKEN           0x0001 /* External Clock Enable */

	/* Timer Control Register 2 */
    #define TIM_ICAIE           0x8000 /* Input Capture A Interrupt Enable */
    #define TIM_OCAIE           0x4000 /* Output Compare A Interrupt Enable */
    #define TIM_TOIE            0x2000 /* Timer Overflow Interrupt Enable */
    #define TIM_ICBIE           0x1000 /* Input Capture B Interrupt Enable */
    #define TIM_OCBIE           0x0800 /* Output Compare B Interrupt Enable */
    #define TIM_DMAIE           0x0400 /* DMA Enable */

    /* Timer Status Register */
    #define TIM_ICFA            0x8000 /* Input Capture Flag A */
    #define TIM_OCFA            0x4000 /* Output Compare Flag A */
    #define TIM_TOF             0x2000 /* Timer Overflow */
    #define TIM_ICFB            0x1000 /* Input Capture Flag B */
    #define TIM_OCFB            0x0800 /* Output Compare Flag B */

	/*-------------------------------- TimeBase timer-------------------------*/
	typedef  struct
	{
		vu16  CR  ;
		u16   EMPTY1;
		vu16  PR  ;
		u16   EMPTY2;
		vu16  VR  ;
		u16   EMPTY3;
		vuc16 CNT ;
		u16   EMPTY4;
		vu16  SR  ;
		u16   EMPTY5;
		vu16  MR  ;
		u16   EMPTY6;
	} TB_TypeDef;
	/*CLOCK SOURCE*/
	#define TB_EE		0x0004
	/*TB Start/Stop counter*/
	#define TB_SC		0x0002
	/*TB Enable/Disable end of count interrupt request*/
	#define TB_ECM		0x0001
	/* TB Enf of Count bit */
	#define TB_EC 0x0001

	/*----------------------------- Pulse Width Modulator----------------------*/
	typedef  struct
	{
		vu16  PRS0  ;
		u16   EMPTY1;
		vu16  PRS1  ;
		u16   EMPTY2;
		vu16  PEN  ;
		u16   EMPTY3;
		vu16  PLS ;
		u16   EMPTY4;
		vu16  CPI  ;
		u16   EMPTY5;
		vu16  IM  ;
		u16   EMPTY6[3];
		vu16  DUT  ;
		u16   EMPTY7;
		vu16  PER  ;
		u16   EMPTY8;
	} PWM_TypeDef;

	/* PWM Prescaler 0 value */
	#define	PWM_PR0(n)	(n&0x0007)
	/* PWM Prescaler 1 value */
	#define	PWM_PR1(n)	(n&0x001f)
	/* PWM enable bit */
	#define	PWM_PE		0x0001
	/* PWM output level polarity bit */
	#define	PWM_PL		0x0001
	/* PWM compare period interrupt bit */
	#define	PWM_CP		0x0001
	/* PWM interrupt mask bit */
	#define	PWM_IM		0x0001

	/*----------------------------- WatchDoG Timer ---------------------------*/
	typedef  struct
	{
		vu16  CR;        /*WDG Control register*/
		u16   EMPTY1;
		vu16  PR;        /*WDG Presclar register*/
		u16   EMPTY2;
		vu16  VR;        /*WDG pre-load Value Register*/
		u16   EMPTY3;
		vuc16 CNT;       /*WDG Counter Register*/
		u16   EMPTY4;
		vu16  SR;        /*WDG Status Register*/
		u16   EMPTY5;
		vu16  MR;        /*WDG Mask Register*/
		u16   EMPTY6;
		vu16  KR;        /*WDG Key Register*/
		u16   EMPTY7;
	} WDG_TypeDef;
	/*WDG/Timer Select*/
	#define WDG_CR_WE 0x0001
	/*WDG Start/Stop counter*/
	#define WDG_CR_SC 0x0002
	/*WDG EXT_CK/CK Select*/
	#define WDG_CR_EE 0x0004
	/*WDG Enable/Disable end of count interrupt request*/
	#define WDG_MR_ECM 0x0001
    /*WDG End Count EC flag */
    #define WDG_EC     0x0001
	/*WDG Sequence*/
	#define WDG_KEY1 0xA55A
	#define WDG_KEY2 0x5AA5
	/*------------------------ DMA Controller ------------------------------------*/

	typedef  struct
	{
		vu16  SOURCEL0;   /*DMA source base address low 0 register*/
		u16   EMPTY1;
		vu16  SOURCEH0;   /*DMA source base address high 0 register*/
		u16   EMPTY2;
		vu16  DESTL0;     /*DMA destination base address low 0 register*/
		u16   EMPTY3;
		vu16  DESTH0;     /*DMA destination base address high 0 register*/
		u16   EMPTY4;
		vu16  MAX0;       /*DMA Maximum count register*/
		u16   EMPTY5;
		vu16  CTRL0;      /*DMA Control register*/
		u16   EMPTY6;
		vuc16 SOCURRH0;    /*DMA Current Source address high 0 register*/
		u16   EMPTY7;
		vuc16 SOCURRL0;    /*DMA Current Source address low 0 register*/
		u16   EMPTY8;
		vuc16 DECURRH0;    /*DMA Current Destination address high 0 register*/
		u16   EMPTY9;
		vuc16 DECURRL0;    /*DMA Current Destination address low 0 register*/
		u16   EMPTY10;
		vuc16 TCNT0;       /*DMA Terminal Counter Register*/
		u16   EMPTY11;
		vu16  LUBUff0;    /*DMA Last Used Buffer location register*/
		u16   EMPTY12[9];
		vu16  SOURCEL1;   /*DMA source base address low 1 register*/
		u16   EMPTY13;
		vu16  SOURCEH1;   /*DMA source base address high 1 register*/
		u16   EMPTY14;
		vu16  DESTL1;     /*DMA destination base address low 1 register*/
		u16   EMPTY15;
		vu16  DESTH1;     /*DMA destination base address high 1 register*/
		u16   EMPTY16;
		vu16  MAX1;       /*DMA Maximum count register*/
		u16   EMPTY17;
		vu16  CTRL1;      /*DMA Control register*/
		u16   EMPTY18;
		vuc16 SOCURRH1;   /*DMA Current Source address high 1 register*/
		u16   EMPTY19;
		vuc16 SOCURRL1;   /*DMA Current Source address low 1 register*/
		u16   EMPTY20;
		vuc16 DECURRH1;   /*DMA Current Destination address high 1 register*/
		u16   EMPTY21;
		vuc16 DECURRL1;   /*DMA Current Destination address low 1 register*/
		u16   EMPTY22;
		vuc16 TCNT1;      /*DMA Terminal Counter Register*/
		u16   EMPTY23;
		vu16  LUBUff1;    /*DMA Last Used Buffer location register*/
		u16   EMPTY24[9];
		vu16  SOURCEL2;   /*DMA source base address low 2 register*/
		u16   EMPTY25;
		vu16  SOURCEH2;   /*DMA source base address high 2 register*/
		u16   EMPTY26;
		vu16  DESTL2;     /*DMA destination base address low 2 register*/
		u16   EMPTY27;
		vu16  DESTH2;     /*DMA destination base address high 2 register*/
		u16   EMPTY28;
		vu16  MAX2;       /*DMA Maximum count register*/
		u16   EMPTY29;
		vu16  CTRL2;      /*DMA Control register*/
		u16   EMPTY30;
		vuc16 SOCURRH2;   /*DMA Current Source address high 2 register*/
		u16   EMPTY31;
		vuc16 SOCURRL2;   /*DMA Current Source address low 2 register*/
		u16   EMPTY32;
		vuc16 DESCURRH2;  /*DMA Current Destination address high 2 register*/
		u16   EMPTY33;
		vuc16 DESCURRL2;  /*DMA Current Destination address low 2 register*/
		u16   EMPTY34;
		vuc16 TCNT2;      /*DMA Terminal Counter Register*/
		u16   EMPTY35;
		vu16  LUBUff2;    /*DMA Last Used Buffer location register*/
		u16   EMPTY36[9];
		vu16  SOURCEL3;   /*DMA source base address low 3 register*/
		u16   EMPTY37;
		vu16  SOURCEH3;   /*DMA source base address high 3 register*/
		u16   EMPTY38;
		vu16  DESTL3;     /*DMA destination base address low 3 register*/
		u16   EMPTY39;
		vu16  DESTH3;     /*DMA destination base address high 3 register*/
		u16   EMPTY40;
		vu16  MAX3;       /*DMA Maximum count register*/
		u16   EMPTY41;
		vu16  CTRL3;      /*DMA Control register*/
		u16   EMPTY42;
		vuc16 SOCURRH3;   /*DMA Current Source address high 3 register*/
		u16   EMPTY43;
		vuc16 SOCURRL3;   /*DMA Current Source address low 3 register*/
		u16   EMPTY44;
		vuc16 DECURRH3;   /*DMA Current Destination address high 3 register*/
		u16   EMPTY45;
		vuc16 DECURRL3;   /*DMA Current Destination address low 3 register*/
		u16   EMPTY46;
		vuc16 TCNT3;      /*DMA Terminal Counter Register*/
		u16   EMPTY47;
		vu16  LUBUff3;    /*DMA Last Used Buffer location register*/
		u16   EMPTY48;
		vu16  MASK;       /*DMA Interrupt Mask Register*/
		u16   EMPTY49;
		vu16  CLR;        /*DMA Interrupt Clear Register*/
		u16   EMPTY50;
		vuc16 STATUS;     /*DMA Interrupt Status Register*/
		u16   EMPTY51;
		vu16  Last;       /*DMA Last Flag Register*/
		u16   EMPTY52;
	} DMA_TypeDef;

	/*------------------------------ Controller Area Network  ------------------*/

	typedef  struct
	{
		vu16  CRR;			/*IFn Command request Register*/
		u16   EMPTY1;
		vu16  CMR;			/*IFn Command Mask Register*/
		u16   EMPTY2;
		vu16  M1R;			/*IFn Message Mask 1 Register*/
		u16   EMPTY3;
		vu16  M2R;			/*IFn Message Mask 2 Register*/
		u16   EMPTY4;
		vu16  A1R;			/*IFn Message Arbitration 1 Register*/
		u16   EMPTY5;
		vu16  A2R;			/*IFn Message Arbitration 2 Register*/
		u16   EMPTY6;
		vu16  MCR;			/*IFn Message Control Register*/
		u16   EMPTY7;
		vu16  DA1R;		        /*IFn DATA A 1 Register*/
		u16   EMPTY8;
		vu16  DA2R;		        /*IFn DATA A 2 Register*/
		u16   EMPTY9;
		vu16  DB1R;		        /*IFn DATA B 1 Register*/
		u16   EMPTY10;
		vu16  DB2R;		        /*IFn DATA B 2 Register*/
		u16   EMPTY11[27];
	} CAN_MsgObj_TypeDef;


	typedef  struct
	{
		vu16  CR;		/*Control Register*/
		u16   EMPTY1;
		vu16  SR;	        /*Status Register*/
		u16   EMPTY2;
		vuc16 ERR;		/*Error counter Register*/
		u16   EMPTY3;
		vu16  BTR;		/*Bit Timing Register*/
		u16   EMPTY4;
		vuc16 IDR;		/*Interrupt Identifier Register*/
		u16   EMPTY5;
		vu16  TESTR;		/*Test Register*/
		u16   EMPTY6;
		vu16  BRPR;		/*BRP Extension Register*/
		u16   EMPTY7[3];
		CAN_MsgObj_TypeDef sMsgObj[2];
		u16   EMPTY8[16];
		vuc16 TXR1R;		/*Transmission request 1 Register*/
		u16   EMPTY9;
		vuc16 TXR2R;		/*Transmission Request 2 Register*/
		u16   EMPTY10[13];
		vuc16 ND1R;		/*New Data 1 Register*/
		u16   EMPTY11;
		vuc16 ND2R;		/*New Data 2 Register*/
		u16   EMPTY12[13];
		vuc16 IP1R;		/*Interrupt Pending 1 Register*/
		u16   EMPTY13;
		vuc16 IP2R;		/*Interrupt Pending 2 Register*/
		u16   EMPTY14[13];
		vuc16 MV1R;		/*Message Valid 1 Register*/
		u16   EMPTY15;
		vuc16 MV2R;		/*Message VAlid 2 Register*/
		u16   EMPTY16;
	} CAN_TypeDef;

	/******************************************************************************
	*                   Peripherals' Base addresses
	******************************************************************************/

	#define APB                 0xFFFF8000
	#define FLASHR_BASE         0x80100000
	#define FLASHPR_BASE        0x8010DFB0
	#define CFG_BASE            0x40000000
	#define PRCCU_BASE          0x60000000
	#define ARB_BASE            0x20000000

	#define APB_BASE        APB
	#define I2C0_BASE       (APB + 0x400)
	#define I2C1_BASE       (APB + 0x800)
	#define TB0_BASE        (APB + 0x1800)
	#define TB1_BASE        (APB + 0x1900)
	#define TB2_BASE        (APB + 0x1A00)
	#define UART0_BASE      (APB + 0x1C00)
	#define UART1_BASE      (APB + 0x2000)
	#define UART2_BASE      (APB + 0x1E00)
	#define UART3_BASE      (APB + 0x2200)
	#define WDG_BASE        (APB + 0x2400)
	#define WUT_BASE        (APB + 0x2600)
	#define TIM0_BASE       (APB + 0x2800)
	#define TIM1_BASE       (APB + 0x2C00)
	#define TIM5_BASE       (APB + 0x3000)
	#define TIM6_BASE       (APB + 0x3080)
	#define TIM7_BASE       (APB + 0x3100)
	#define TIM8_BASE       (APB + 0x3180)
	#define TIM9_BASE       (APB + 0x3200)
	#define WIU_BASE        (APB + 0x3800)
	#define CAN0_BASE       (APB + 0x4400)
	#define CAN1_BASE       (APB + 0x4800)
	#define CAN2_BASE       (APB + 0x4C00)
	#define PWM0_BASE       (APB + 0x5000)
	#define PWM1_BASE       (APB + 0x5040)
	#define PWM2_BASE       (APB + 0x5080)
	#define PWM3_BASE       (APB + 0x50C0)
	#define PWM4_BASE       (APB + 0x5100)
	#define PWM5_BASE       (APB + 0x5140)
	#define GPIO0_BASE      (APB + 0x5400)
	#define GPIO1_BASE      (APB + 0x5410)
	#define GPIO2_BASE      (APB + 0x5420)
	#define GPIO3_BASE      (APB + 0x5430)
	#define GPIO4_BASE      (APB + 0x5440)
	#define GPIO5_BASE      (APB + 0x5450)
	#define GPIO6_BASE      (APB + 0x5460)
	#define BSPI0_BASE      (APB + 0x5800)
	#define BSPI1_BASE      (APB + 0x5C00)
	#define BSPI2_BASE      (APB + 0x6000)
	#define TIM2_BASE       (APB + 0x6400)
	#define TIM3_BASE       (APB + 0x6800)
	#define TIM4_BASE       (APB + 0x6C00)
	#define DMA0_BASE       (APB + 0x7000)
	#define DMA1_BASE       (APB + 0x7100)
	#define DMA2_BASE       (APB + 0x7200)
	#define DMA3_BASE       (APB + 0x7300)
	#define RTC_BASE        (APB + 0x7400)
	#define CMU_BASE        (APB + 0x7600)
	#define ADC_BASE        (APB + 0x7800)
	#define EIC_BASE        (APB + 0x7C00)



	/*****************************************************************************
							IPs' declaration
	*****************************************************************************/

	/*----------------- Non Debug Mode -----------------------------------------*/

	#ifndef LIBDEBUG
	/******************** Peripherals ******************************/
		#define FLASHR        ((FLASHR_TypeDef  *)  FLASHR_BASE)
		#define FLASHPR       ((FLASHPR_TypeDef *)  FLASHPR_BASE)
		#define PRCCU         ((PRCCU_TypeDef   *)  PRCCU_BASE)
		#define ARB           ((ARB_TypeDef     *)  ARB_BASE)
		#define CFG           ((CFG_TypeDef     *)  CFG_BASE)
		#define I2C0          ((I2C_TypeDef     *)  I2C0_BASE)
		#define I2C1          ((I2C_TypeDef     *)  I2C1_BASE)
		#define TB0           ((TB_TypeDef      *)  TB0_BASE)
		#define TB1           ((TB_TypeDef      *)  TB1_BASE)
		#define TB2           ((TB_TypeDef      *)  TB2_BASE)
		#define UART0         ((UART_TypeDef    *)  UART0_BASE)
		#define UART1         ((UART_TypeDef    *)  UART1_BASE)
		#define UART2         ((UART_TypeDef    *)  UART2_BASE)
		#define UART3         ((UART_TypeDef    *)  UART3_BASE)
		#define WDG           ((WDG_TypeDef     *)  WDG_BASE)
		#define WUT           ((WUT_TypeDef     *)  WUT_BASE)
		#define TIM0          ((TIM_TypeDef     *)  TIM0_BASE)
		#define TIM1          ((TIM_TypeDef     *)  TIM1_BASE)
		#define TIM5          ((TIM_TypeDef     *)  TIM5_BASE)
		#define TIM6          ((TIM_TypeDef     *)  TIM6_BASE)
		#define TIM7          ((TIM_TypeDef     *)  TIM7_BASE)
		#define TIM8          ((TIM_TypeDef     *)  TIM8_BASE)
		#define TIM9          ((TIM_TypeDef     *)  TIM9_BASE)
		#define WIU           ((WIU_TypeDef     *)  WIU_BASE)
		#define CAN0          ((CAN_TypeDef     *)  CAN0_BASE)
		#define CAN1          ((CAN_TypeDef     *)  CAN1_BASE)
		#define CAN2          ((CAN_TypeDef     *)  CAN2_BASE)
		#define PWM0          ((PWM_TypeDef     *)  PWM0_BASE)
		#define PWM1          ((PWM_TypeDef     *)  PWM1_BASE)
		#define PWM2          ((PWM_TypeDef     *)  PWM2_BASE)
		#define PWM3          ((PWM_TypeDef     *)  PWM3_BASE)
		#define PWM4          ((PWM_TypeDef     *)  PWM4_BASE)
		#define PWM5          ((PWM_TypeDef     *)  PWM5_BASE)
		#define GPIO0         ((GPIO_TypeDef    *)  GPIO0_BASE)
		#define GPIO1         ((GPIO_TypeDef    *)  GPIO1_BASE)
		#define GPIO2         ((GPIO_TypeDef    *)  GPIO2_BASE)
		#define GPIO3         ((GPIO_TypeDef    *)  GPIO3_BASE)
		#define GPIO4         ((GPIO_TypeDef    *)  GPIO4_BASE)
		#define GPIO5         ((GPIO_TypeDef    *)  GPIO5_BASE)
		#define GPIO6         ((GPIO_TypeDef    *)  GPIO6_BASE)
		#define BSPI0         ((BSPI_TypeDef    *)  BSPI0_BASE)
		#define BSPI1         ((BSPI_TypeDef    *)  BSPI1_BASE)
		#define BSPI2         ((BSPI_TypeDef    *)  BSPI2_BASE)
		#define TIM2          ((TIM_TypeDef     *)  TIM2_BASE)
		#define TIM3          ((TIM_TypeDef     *)  TIM3_BASE)
		#define TIM4          ((TIM_TypeDef     *)  TIM4_BASE)
		#define DMA0          ((DMA_TypeDef     *)  DMA0_BASE)
		#define DMA1          ((DMA_TypeDef     *)  DMA1_BASE)
		#define DMA2          ((DMA_TypeDef     *)  DMA2_BASE)
		#define DMA3          ((DMA_TypeDef     *)  DMA3_BASE)
		#define RTC           ((RTC_TypeDef     *)  RTC_BASE)
		#define CMU           ((CMU_TypeDef     *)  CMU_BASE)
		#define ADC           ((ADC_TypeDef     *)  ADC_BASE)
		#define EIC           ((EIC_TypeDef     *)  EIC_BASE)
	#else   /* LIBDEBUG */

		/*------------------------ Debug Mode ----------------------------------------*/

		EXT FLASHR_TypeDef         *FLASHR;
		EXT FLASHPR_TypeDef        *FLASHPR;
		EXT PRCCU_TypeDef          *PRCCU;
		EXT ARB_TypeDef            *ARB;
		EXT CFG_TypeDef            *CFG;
		EXT I2C_TypeDef            *I2C0;
		EXT I2C_TypeDef            *I2C1;
		EXT TB_TypeDef             *TB0;
		EXT TB_TypeDef             *TB1;
		EXT TB_TypeDef             *TB2;
		EXT UART_TypeDef           *UART0;
		EXT UART_TypeDef           *UART1;
		EXT UART_TypeDef           *UART2;
		EXT UART_TypeDef           *UART3;
		EXT WDG_TypeDef            *WDG;
		EXT WUT_TypeDef            *WUT;
		EXT TIM_TypeDef            *TIM0;
		EXT TIM_TypeDef            *TIM1;
		EXT TIM_TypeDef            *TIM5;
		EXT TIM_TypeDef            *TIM6;
		EXT TIM_TypeDef            *TIM7;
		EXT TIM_TypeDef            *TIM8;
		EXT TIM_TypeDef            *TIM9;
		EXT WIU_TypeDef            *WIU;
		EXT CAN_TypeDef            *CAN0;
		EXT CAN_TypeDef            *CAN1;
		EXT CAN_TypeDef            *CAN2;
		EXT PWM_TypeDef            *PWM0;
		EXT PWM_TypeDef            *PWM1;
		EXT PWM_TypeDef            *PWM2;
		EXT PWM_TypeDef            *PWM3;
		EXT PWM_TypeDef            *PWM4;
		EXT PWM_TypeDef            *PWM5;
		EXT GPIO_TypeDef           *GPIO0;
		EXT GPIO_TypeDef           *GPIO1;
		EXT GPIO_TypeDef           *GPIO2;
		EXT GPIO_TypeDef           *GPIO3;
		EXT GPIO_TypeDef           *GPIO4;
		EXT GPIO_TypeDef           *GPIO5;
		EXT GPIO_TypeDef           *GPIO6;
		EXT BSPI_TypeDef           *BSPI0;
		EXT BSPI_TypeDef           *BSPI1;
		EXT BSPI_TypeDef           *BSPI2;
		EXT TIM_TypeDef            *TIM2;
		EXT TIM_TypeDef            *TIM3;
		EXT TIM_TypeDef            *TIM4;
		EXT DMA_TypeDef            *DMA0;
		EXT DMA_TypeDef            *DMA1;
		EXT DMA_TypeDef            *DMA2;
		EXT DMA_TypeDef            *DMA3;
		EXT RTC_TypeDef            *RTC;
		EXT CMU_TypeDef            *CMU;
		EXT ADC_TypeDef            *ADC;
		EXT EIC_TypeDef            *EIC;

	#endif  /* LIBDEBUG */

#endif
