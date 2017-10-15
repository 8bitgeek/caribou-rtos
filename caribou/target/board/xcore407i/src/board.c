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
#include <board.h>
#include <stm32f4x7_eth.h>
#include <stm32f4xx_exti.h>
#include <stm32f4xx_syscfg.h>

caribou_gpio_t led1	= CARIBOU_GPIO_INIT(GPIOH,CARIBOU_GPIO_PIN_2);
caribou_gpio_t led2	= CARIBOU_GPIO_INIT(GPIOH,CARIBOU_GPIO_PIN_3);
caribou_gpio_t led3	= CARIBOU_GPIO_INIT(GPIOI,CARIBOU_GPIO_PIN_8);
caribou_gpio_t led4	= CARIBOU_GPIO_INIT(GPIOI,CARIBOU_GPIO_PIN_10);

volatile network_interface_t network_interface;

extern void isr_phy_eth0(InterruptVector vector, void* arg);
extern void isr_eth0(InterruptVector vector, void* arg);

/**
  * @brief  EXTI configuration for Ethernet link status.
  * @param PHYAddress: external PHY address  
  * @retval None
  */
static void Eth_Link_EXTIConfig(void)
{
	EXTI_InitTypeDef EXTI_InitStructure;
	/* Connect EXTI Line to INT Pin */
	SYSCFG_EXTILineConfig(ETH_LINK_EXTI_PORT_SOURCE, ETH_LINK_EXTI_PIN_SOURCE);
	/* Configure EXTI line */
	EXTI_InitStructure.EXTI_Line = ETH_LINK_EXTI_LINE;
	EXTI_InitStructure.EXTI_Mode = EXTI_Mode_Interrupt;
	EXTI_InitStructure.EXTI_Trigger = EXTI_Trigger_Falling;  
	EXTI_InitStructure.EXTI_LineCmd = ENABLE;
	EXTI_Init(&EXTI_InitStructure);
}

/**
  * @brief  Configure the PHY to generate an interrupt on change of link status.
  * @param PHYAddress: external PHY address  
  * @retval None
  */
uint32_t Eth_Link_PHYITConfig(uint16_t PHYAddress)
{
	uint32_t tmpreg = 0;
	/* Read MICR register */
	tmpreg = ETH_ReadPHYRegister(PHYAddress, PHY_MICR);
	/* Enable output interrupt events to signal via the INT pin */
	tmpreg |= (uint32_t)PHY_MICR_INT_EN | PHY_MICR_INT_OE;
	if(!(ETH_WritePHYRegister(PHYAddress, PHY_MICR, tmpreg)))
	{
		/* Return ERROR in case of write timeout */
		return ETH_ERROR;
	}
	/* Read MISR register */
	tmpreg = ETH_ReadPHYRegister(PHYAddress, PHY_MISR);
	/* Enable Interrupt on change of link status */
	tmpreg |= (uint32_t)PHY_MISR_LINK_INT_EN;
	if(!(ETH_WritePHYRegister(PHYAddress, PHY_MISR, tmpreg)))
	{
		/* Return ERROR in case of write timeout */
		return ETH_ERROR;
	}
	/* Return SUCCESS */
	return ETH_SUCCESS;   
}

/**
  * @brief  Configures the Ethernet Interface
  * @param  None
  * @retval None
  */
static void ETH_MACDMA_Config(void)
{
	ETH_InitTypeDef ETH_InitStructure;
	/* Reset ETHERNET on AHB Bus */
	ETH_DeInit();
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_ETH_MAC | 
						RCC_AHB1Periph_ETH_MAC_Tx |
						RCC_AHB1Periph_ETH_MAC_Rx, DISABLE);                                             

	/* Software reset */
	ETH_SoftwareReset();
	/* Wait for software reset */
	while (ETH_GetSoftwareResetStatus() == SET);
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_ETH_MAC | 
						RCC_AHB1Periph_ETH_MAC_Tx |
						RCC_AHB1Periph_ETH_MAC_Rx, ENABLE);                                             

	/* ETHERNET Configuration --------------------------------------------------*/
	/* Call ETH_StructInit if you don't like to configure all ETH_InitStructure parameter */
	ETH_StructInit(&ETH_InitStructure);
	/* Fill ETH_InitStructure parametrs */
	/*------------------------   MAC   -----------------------------------*/
	ETH_InitStructure.ETH_AutoNegotiation = ETH_AutoNegotiation_Enable;
	//ETH_InitStructure.ETH_AutoNegotiation = ETH_AutoNegotiation_Disable; 
	//  ETH_InitStructure.ETH_Speed = ETH_Speed_10M;
	//  ETH_InitStructure.ETH_Mode = ETH_Mode_FullDuplex;   
	ETH_InitStructure.ETH_LoopbackMode = ETH_LoopbackMode_Disable;
	ETH_InitStructure.ETH_RetryTransmission = ETH_RetryTransmission_Disable;
	ETH_InitStructure.ETH_AutomaticPadCRCStrip = ETH_AutomaticPadCRCStrip_Disable;
	ETH_InitStructure.ETH_ReceiveAll = ETH_ReceiveAll_Disable;
	ETH_InitStructure.ETH_BroadcastFramesReception = ETH_BroadcastFramesReception_Enable;
	ETH_InitStructure.ETH_PromiscuousMode = ETH_PromiscuousMode_Disable;
	ETH_InitStructure.ETH_MulticastFramesFilter = ETH_MulticastFramesFilter_Perfect;
	ETH_InitStructure.ETH_UnicastFramesFilter = ETH_UnicastFramesFilter_Perfect;
	#ifdef CHECKSUM_BY_HARDWARE
		ETH_InitStructure.ETH_ChecksumOffload = ETH_ChecksumOffload_Enable;
	#endif
	/*------------------------   DMA   -----------------------------------*/  
	/* When we use the Checksum offload feature, we need to enable the Store and Forward mode: 
	the store and forward guarantee that a whole frame is stored in the FIFO, so the MAC can insert/verify the checksum, 
	if the checksum is OK the DMA can handle the frame otherwise the frame is dropped */
	ETH_InitStructure.ETH_DropTCPIPChecksumErrorFrame = ETH_DropTCPIPChecksumErrorFrame_Enable; 
	ETH_InitStructure.ETH_ReceiveStoreForward = ETH_ReceiveStoreForward_Enable;         
	ETH_InitStructure.ETH_TransmitStoreForward = ETH_TransmitStoreForward_Enable;     
	ETH_InitStructure.ETH_ForwardErrorFrames = ETH_ForwardErrorFrames_Disable;       
	ETH_InitStructure.ETH_ForwardUndersizedGoodFrames = ETH_ForwardUndersizedGoodFrames_Disable;   
	ETH_InitStructure.ETH_SecondFrameOperate = ETH_SecondFrameOperate_Enable;
	ETH_InitStructure.ETH_AddressAlignedBeats = ETH_AddressAlignedBeats_Enable;      
	ETH_InitStructure.ETH_FixedBurst = ETH_FixedBurst_Enable;                
	ETH_InitStructure.ETH_RxDMABurstLength = ETH_RxDMABurstLength_32Beat;          
	ETH_InitStructure.ETH_TxDMABurstLength = ETH_TxDMABurstLength_32Beat;
	ETH_InitStructure.ETH_DMAArbitration = ETH_DMAArbitration_RoundRobin_RxTx_2_1;
	/* Configure Ethernet */
	network_interface.ethInitStatus = ETH_Init(&ETH_InitStructure, DP83848_PHY_ADDRESS);
	/* Enable the Ethernet Rx Interrupt */
	ETH_DMAITConfig(ETH_DMA_IT_NIS | ETH_DMA_IT_R, ENABLE);
}

/**
 * @brief Initialize the SPI to be used for MMC I/O.
 */
void InitializeSPI_MMC()
{
	GPIO_InitTypeDef	GPIO_InitStructure;
	DMA_InitTypeDef		DMA_InitStructure;
	SPI_InitTypeDef		SPI_InitStructure;

	/* SPI configuration -------------------------------------------------------*/
	SPI_I2S_DeInit(SPI_MMC);
	SPI_InitStructure.SPI_Direction = SPI_Direction_2Lines_FullDuplex;
	SPI_InitStructure.SPI_DataSize = SPI_DataSize_8b;
	SPI_InitStructure.SPI_CPOL = SPI_CPOL_Low;
	SPI_InitStructure.SPI_CPHA = SPI_CPHA_1Edge;
	SPI_InitStructure.SPI_NSS = SPI_NSS_Soft;
	SPI_InitStructure.SPI_BaudRatePrescaler = SPI_BaudRatePrescaler_16;
	SPI_InitStructure.SPI_FirstBit = SPI_FirstBit_MSB;
	SPI_InitStructure.SPI_CRCPolynomial = 7;

	/* DMA configuration -------------------------------------------------------*/
	/* Deinitialize DMA Streams */
	DMA_DeInit(SPI_MMC_TX_DMA_STREAM);
	DMA_DeInit(SPI_MMC_RX_DMA_STREAM);

	/* Configure DMA Initialization Structure */
	DMA_InitStructure.DMA_BufferSize = SPI_MMC_BUFFERSIZE;
	DMA_InitStructure.DMA_FIFOMode = DMA_FIFOMode_Disable;
	DMA_InitStructure.DMA_FIFOThreshold = DMA_FIFOThreshold_1QuarterFull;
	DMA_InitStructure.DMA_MemoryBurst = DMA_MemoryBurst_Single;
	DMA_InitStructure.DMA_MemoryDataSize = DMA_MemoryDataSize_Byte;
	DMA_InitStructure.DMA_MemoryInc = DMA_MemoryInc_Enable;
	DMA_InitStructure.DMA_Mode = DMA_Mode_Normal;
	DMA_InitStructure.DMA_PeripheralBaseAddr =(uint32_t) (&(SPI_MMC->DR));
	DMA_InitStructure.DMA_PeripheralBurst = DMA_PeripheralBurst_Single;
	DMA_InitStructure.DMA_PeripheralDataSize = DMA_PeripheralDataSize_Byte;
	DMA_InitStructure.DMA_PeripheralInc = DMA_PeripheralInc_Disable;
	DMA_InitStructure.DMA_Priority = DMA_Priority_High;
	#if 0
		/* Configure TX DMA */
		DMA_InitStructure.DMA_Channel = SPI_MMC_TX_DMA_CHANNEL;
		DMA_InitStructure.DMA_DIR = DMA_DIR_MemoryToPeripheral;
		DMA_InitStructure.DMA_Memory0BaseAddr =(uint32_t)aTxBuffer;
		DMA_Init(SPI_MMC_TX_DMA_STREAM, &DMA_InitStructure);
		/* Configure RX DMA */
		DMA_InitStructure.DMA_Channel = SPI_MMC_RX_DMA_CHANNEL;
		DMA_InitStructure.DMA_DIR = DMA_DIR_PeripheralToMemory;
		DMA_InitStructure.DMA_Memory0BaseAddr =(uint32_t)aRxBuffer; 
		DMA_Init(SPI_MMC_RX_DMA_STREAM, &DMA_InitStructure);
	#endif
}

void early_init()
{
	RCC_ClocksTypeDef SYS_Clocks;
	/* Enable HSE */   
	RCC_HSEConfig(RCC_HSE_ON);
	/* Wait till HSE is ready and if Time out is reached exit */
	while(RCC_WaitForHSEStartUp()!=SUCCESS);
	RCC_SYSCLKConfig(RCC_SYSCLKSource_HSE);
	RCC_GetClocksFreq(&SYS_Clocks);

	SystemInit();
	SystemCoreClockUpdate();
	RCC_GetClocksFreq(&SYS_Clocks);

	/* Enable Peripheral Clocks... */
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_SYSCFG, ENABLE);

	/* Enable ETHERNET clock  */
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_ETH_MAC | 
							RCC_AHB1Periph_ETH_MAC_Tx |
							RCC_AHB1Periph_ETH_MAC_Rx, ENABLE);                                             
    RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_ETH_MAC_PTP,ENABLE);

	#ifdef MII_MODE /* Mode MII with STM322xG-EVAL  */
		#ifdef PHY_CLOCK_MCO
			/* Output HSE clock (25MHz) on MCO pin (PA8) to clock the PHY */
			RCC_MCO1Config(RCC_MCO1Source_HSE, RCC_MCO1Div_1);
		#endif /* PHY_CLOCK_MCO */
		SYSCFG_ETH_MediaInterfaceConfig(SYSCFG_ETH_MediaInterface_MII);
	#elif defined RMII_MODE  /* Mode RMII with STM322xG-EVAL */
		/* Output PLL clock divided by 2 (50MHz) on MCO pin (PA8) to clock the PHY */
		RCC_MCO1Config(RCC_MCO1Source_PLLCLK, RCC_MCO1Div_2);
		SYSCFG_ETH_MediaInterfaceConfig(SYSCFG_ETH_MediaInterface_RMII);
	#endif

	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOA,ENABLE);
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOB,ENABLE);
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOC,ENABLE);
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOD,ENABLE);
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOE,ENABLE);
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOF,ENABLE);
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOG,ENABLE);
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOH,ENABLE);
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOI,ENABLE);
	
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_USART1,ENABLE);
	RCC_APB1PeriphClockCmd(RCC_APB1Periph_USART2,ENABLE);
	RCC_APB1PeriphClockCmd(RCC_APB1Periph_USART3,ENABLE);
	RCC_APB1PeriphClockCmd(RCC_APB1Periph_SPI2,ENABLE);

	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_DMA1,ENABLE);
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_DMA2,ENABLE);
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_CRC,ENABLE);

	/* PORT A */
	GPIOA->MODER = CARIBOU_PORTA_MODE;
	GPIOA->OTYPER = CARIBOU_PORTA_OTYPER;
	GPIOA->OSPEEDR = CARIBOU_PORTA_OSPEEDR;
	GPIOA->PUPDR = CARIBOU_PORTA_PUPDR;
	GPIOA->AFR[0] = CARIBOU_PORTA_AFRL;
	GPIOA->AFR[1] = CARIBOU_PORTA_AFRH;
	/* POST B */
	GPIOB->MODER = CARIBOU_PORTB_MODE;
	GPIOB->OTYPER = CARIBOU_PORTB_OTYPER;
	GPIOB->OSPEEDR = CARIBOU_PORTB_OSPEEDR;
	GPIOB->PUPDR = CARIBOU_PORTB_PUPDR;
	GPIOB->AFR[0] = CARIBOU_PORTB_AFRL;
	GPIOB->AFR[1] = CARIBOU_PORTB_AFRH;
	/* POST C */
	GPIOC->MODER = CARIBOU_PORTC_MODE;
	GPIOC->OTYPER = CARIBOU_PORTC_OTYPER;
	GPIOC->OSPEEDR = CARIBOU_PORTC_OSPEEDR;
	GPIOC->PUPDR = CARIBOU_PORTC_PUPDR;
	GPIOC->AFR[0] = CARIBOU_PORTC_AFRL;
	GPIOC->AFR[1] = CARIBOU_PORTC_AFRH;
	/* POST D */
	GPIOD->MODER = CARIBOU_PORTD_MODE;
	GPIOD->OTYPER = CARIBOU_PORTD_OTYPER;
	GPIOD->OSPEEDR = CARIBOU_PORTD_OSPEEDR;
	GPIOD->PUPDR = CARIBOU_PORTD_PUPDR;
	GPIOD->AFR[0] = CARIBOU_PORTD_AFRL;
	GPIOD->AFR[1] = CARIBOU_PORTD_AFRH;
	/* POST E */
	GPIOE->MODER = CARIBOU_PORTE_MODE;
	GPIOE->OTYPER = CARIBOU_PORTE_OTYPER;
	GPIOE->OSPEEDR = CARIBOU_PORTE_OSPEEDR;
	GPIOE->PUPDR = CARIBOU_PORTE_PUPDR;
	GPIOE->AFR[0] = CARIBOU_PORTE_AFRL;
	GPIOE->AFR[1] = CARIBOU_PORTE_AFRH;
	/* POST F */
	GPIOF->MODER = CARIBOU_PORTF_MODE;
	GPIOF->OTYPER = CARIBOU_PORTF_OTYPER;
	GPIOF->OSPEEDR = CARIBOU_PORTF_OSPEEDR;
	GPIOF->PUPDR = CARIBOU_PORTF_PUPDR;
	GPIOF->AFR[0] = CARIBOU_PORTF_AFRL;
	GPIOF->AFR[1] = CARIBOU_PORTF_AFRH;
	/* POST G */
	GPIOG->MODER = CARIBOU_PORTG_MODE;
	GPIOG->OTYPER = CARIBOU_PORTG_OTYPER;
	GPIOG->OSPEEDR = CARIBOU_PORTG_OSPEEDR;
	GPIOG->PUPDR = CARIBOU_PORTG_PUPDR;
	GPIOG->AFR[0] = CARIBOU_PORTG_AFRL;
	GPIOG->AFR[1] = CARIBOU_PORTG_AFRH;
	/* POST H */
	GPIOH->MODER = CARIBOU_PORTH_MODE;
	GPIOH->OTYPER = CARIBOU_PORTH_OTYPER;
	GPIOH->OSPEEDR = CARIBOU_PORTH_OSPEEDR;
	GPIOH->PUPDR = CARIBOU_PORTH_PUPDR;
	GPIOH->AFR[0] = CARIBOU_PORTH_AFRL;
	GPIOH->AFR[1] = CARIBOU_PORTH_AFRH;
	/* POST I */
	GPIOI->MODER = CARIBOU_PORTI_MODE;
	GPIOI->OTYPER = CARIBOU_PORTI_OTYPER;
	GPIOI->OSPEEDR = CARIBOU_PORTI_OSPEEDR;
	GPIOI->PUPDR = CARIBOU_PORTI_PUPDR;
	GPIOI->AFR[0] = CARIBOU_PORTI_AFRL;
	GPIOI->AFR[1] = CARIBOU_PORTI_AFRH;
}

void late_init()
{
	caribou_uart_config_t	uart_config;
	_stdout = _stdin = _stderr = fopen(CONSOLE_USART,"rw"); // USART3 is stdio
	caribou_uart_init_config(&uart_config);
	uart_config.baud_rate = CARIBOU_UART_BAUD_RATE_57600;
	caribou_uart_set_config(CONSOLE_USART,&uart_config);

    caribou_gpio_reset(&led1);
	caribou_vector_install(ETH_LINK_EXTI_IRQn,isr_phy_eth0,&network_interface.phyAddress);
	caribou_vector_install(ETH_IRQn,isr_eth0,NULL);
	/* Configure the Ethernet MAC/DMA */
	ETH_MACDMA_Config();
	/* Configure the PHY to generate an interrupt on change of link status */
	Eth_Link_PHYITConfig(DP83848_PHY_ADDRESS);
	/* Configure the EXTI for Ethernet link status. */
	Eth_Link_EXTIConfig();

	/* Enable the interrupt vectors... */
	caribou_vector_enable(ETH_LINK_EXTI_IRQn);
	caribou_vector_enable(ETH_IRQn);
}

void board_idle()
{
	static uint64_t last0 =0L;
	static uint64_t last1 =0L;
	static uint64_t last2 =0L;
	static uint64_t last3 =0L;
	if ( (caribou_timer_ticks() - last0) > 64 )
	{
		caribou_gpio_toggle(&led1);
		last0 = caribou_timer_ticks();
	}
	if ( (caribou_timer_ticks() - last1) > 128 )
	{
		caribou_gpio_toggle(&led2);
		last1 = caribou_timer_ticks();
	}
	if ( (caribou_timer_ticks() - last2) > 256 )
	{
		caribou_gpio_toggle(&led3);
		last2 = caribou_timer_ticks();
	}
	if ( (caribou_timer_ticks() - last3) > 512 )
	{
		caribou_gpio_toggle(&led4);
		last3 = caribou_timer_ticks();
	}

	printf( "12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890");
	caribou_wfi();
}
