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
#include <caribou++/ctimerevent.h>
#include <caribou++/interface/igpio.h>
#include <chip/cgpio.h>
#include <chip/chip.h>

#include <stm32f10x_gpio.h>
#include <stm32f10x_exti.h>
#include <stm32f10x_rcc.h>

namespace CARIBOU
{
	#define inherited IGPIO

	CGPIO::CGPIO(uint32_t port,uint32_t pins,uint32_t initialPinState,mode_t mode,speed_t speed,trigger_t trigger,bool intEn)
	: inherited(port,pins,initialPinState,mode,speed,trigger)
	{
		initialize(intEn);
	}

	CGPIO::~CGPIO()
	{
	}

	void CGPIO::initialize(bool intEn)
	{
		uint32_t rccPeriph=0;
		GPIO_InitTypeDef GPIO_InitStructure;
		GPIO_InitStructure.GPIO_Pin = pins();
		GPIO_InitStructure.GPIO_Speed = (GPIOSpeed_TypeDef)speed();
		GPIO_InitStructure.GPIO_Mode = (GPIOMode_TypeDef)mode();
		if ( port() == Port_A )
			rccPeriph = RCC_APB2Periph_GPIOA;
		else if ( port() == Port_B )
			rccPeriph = RCC_APB2Periph_GPIOB;
		else if ( port() == Port_C )
			rccPeriph = RCC_APB2Periph_GPIOC;
		else if ( port() == Port_D )
			rccPeriph = RCC_APB2Periph_GPIOD;
		else if ( port() == Port_E )
			rccPeriph = RCC_APB2Periph_GPIOE;
		RCC_APB2PeriphClockCmd(rccPeriph, ENABLE);
		GPIO_Init(gpio(), &GPIO_InitStructure);
		setIntEn(intEn);
	}

	void CGPIO::setIntEn(bool intEn)
	{
		if ( intEn )
		{
			uint8_t portSource=0x00;
			if ( port() == Port_A )
			{
				portSource = GPIO_PortSourceGPIOA;
				RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA, ENABLE);	
			}
			else if ( port() == Port_B )
			{
				portSource = GPIO_PortSourceGPIOB;
				RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOB, ENABLE);	
			}
			else if ( port() == Port_C )
			{
				portSource = GPIO_PortSourceGPIOC;
				RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOC, ENABLE);	
			}
			else if ( port() == Port_D )
			{
				portSource = GPIO_PortSourceGPIOD;
				RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOD, ENABLE);	
			}
			else if ( port() == Port_E )
			{
				portSource = GPIO_PortSourceGPIOE;
				RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOE, ENABLE);	
			}
			/* Enable AFIO clock */
			RCC_APB2PeriphClockCmd(RCC_APB2Periph_AFIO, ENABLE);

			/* Connect EXTIxx Line to Port pin */
			for(uint8_t pinSource=0; pinSource < 16; pinSource++)
			{
				if ( (pins() >> pinSource) & 1 )
				{
					GPIO_InitTypeDef GPIO_InitStructure;
					EXTI_InitTypeDef EXTI_InitStructure;
					uint32_t vector=0;
					uint32_t line = (1 << pinSource);

					/* Configure pin as input floating */
					GPIO_InitStructure.GPIO_Pin = line;
					GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN_FLOATING;
					GPIO_Init(gpio(), &GPIO_InitStructure);

					GPIO_EXTILineConfig(portSource, pinSource);
					
					/* Configure EXTI0 line */
					EXTI_InitStructure.EXTI_Line = line;
					EXTI_InitStructure.EXTI_Mode = EXTI_Mode_Interrupt;
					EXTI_InitStructure.EXTI_Trigger = (EXTITrigger_TypeDef)trigger();  
					EXTI_InitStructure.EXTI_LineCmd = ENABLE;
					EXTI_Init(&EXTI_InitStructure);
					switch (pinSource)
					{
						case 0:	vector	= Vector_EXTI0;		break;
						case 1:	vector	= Vector_EXTI1;		break;
						case 2:	vector	= Vector_EXTI2;		break;
						case 3:	vector	= Vector_EXTI3;		break;
						case 4:	vector	= Vector_EXTI4;		break;
						default:
							if ( pinSource >= 5 && pinSource <= 9 )
								vector = Vector_EXTI9_5;
							else
								vector = Vector_EXTI15_10;
							break;
					}
					chip_vector_enable(vector);
				}
			}
		}
	}

	uint32_t CGPIO::interruptPending(uint32_t ints)
	{
		return ( EXTI->PR & ((uint32_t)pins() & ints) );
	}

	void CGPIO::interruptClear(uint32_t ints)
	{
		EXTI->PR = ( (uint32_t)pins() & ints );
	}

	void CGPIO::interruptEnable(uint32_t ints)
	{
		EXTI->IMR |= ( (uint32_t)pins() & ints );
	}

	void CGPIO::interruptDisable(uint32_t ints)
	{
		EXTI->IMR &= ~((uint32_t)pins());
	}

	uint32_t CGPIO::interruptEnabled(uint32_t ints)
	{
		return (EXTI->IMR | ( (uint32_t)pins() & ints ) );
	}

	void CGPIO::set()
	{
		gpio()->BSRR = pins();		// set the output bits
	}

	void CGPIO::clear()
	{
		gpio()->BRR = pins();			// clear the output pins
	}

	void CGPIO::toggle()
	{
		uint32_t state = gpio()->ODR & pins();
		gpio()->BRR = state;			// clear the set pins.
		state = (~state) & pins();
		gpio()->BSRR = state;			// set the clear pins.
	}


}