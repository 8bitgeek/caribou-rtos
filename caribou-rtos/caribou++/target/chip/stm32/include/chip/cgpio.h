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
#ifndef _CARIBOU_CHIP_CGPIO_H_
#define _CARIBOU_CHIP_CGPIO_H_

#include <caribou++.h>
#include <caribou++/interface/igpio.h>

#include <stm32f10x_gpio.h>

#define	Pin_None			  ((uint16_t)0x0000)
#define Pin_0                 ((uint16_t)0x0001)  /*!< Pin 0 selected */
#define Pin_1                 ((uint16_t)0x0002)  /*!< Pin 1 selected */
#define Pin_2                 ((uint16_t)0x0004)  /*!< Pin 2 selected */
#define Pin_3                 ((uint16_t)0x0008)  /*!< Pin 3 selected */
#define Pin_4                 ((uint16_t)0x0010)  /*!< Pin 4 selected */
#define Pin_5                 ((uint16_t)0x0020)  /*!< Pin 5 selected */
#define Pin_6                 ((uint16_t)0x0040)  /*!< Pin 6 selected */
#define Pin_7                 ((uint16_t)0x0080)  /*!< Pin 7 selected */
#define Pin_8                 ((uint16_t)0x0100)  /*!< Pin 8 selected */
#define Pin_9                 ((uint16_t)0x0200)  /*!< Pin 9 selected */
#define Pin_10                ((uint16_t)0x0400)  /*!< Pin 10 selected */
#define Pin_11                ((uint16_t)0x0800)  /*!< Pin 11 selected */
#define Pin_12                ((uint16_t)0x1000)  /*!< Pin 12 selected */
#define Pin_13                ((uint16_t)0x2000)  /*!< Pin 13 selected */
#define Pin_14                ((uint16_t)0x4000)  /*!< Pin 14 selected */
#define Pin_15                ((uint16_t)0x8000)  /*!< Pin 15 selected */
#define Pin_All               ((uint16_t)0xFFFF)  /*!< All pins selected */

#define port_t					GPIO_TypeDef*
#define Port_A					((uint32_t)GPIOA)
#define Port_B					((uint32_t)GPIOB)
#define Port_C					((uint32_t)GPIOC)
#define Port_D					((uint32_t)GPIOD)
#define Port_E					((uint32_t)GPIOE)
#define Port_F					((uint32_t)GPIOF)
#define Port_G					((uint32_t)GPIOG)

namespace CARIBOU
{
	class CGPIO : public IGPIO
	{
		public:

			CGPIO(uint32_t port=0, uint32_t pins=0, uint32_t initialPinState=0, IGPIO::mode_t mode=Mode_AIN, IGPIO::speed_t speed=Speed_50MHz, IGPIO::trigger_t trigger=Trigger_Rising, bool intEn=false );
			virtual ~CGPIO();

			virtual void				set();
			virtual void				clear();
			virtual void				toggle();

			virtual uint32_t			interruptPending(uint32_t ints=Pin_All);
			virtual void				interruptClear(uint32_t ints=Pin_All);
			virtual void				interruptEnable(uint32_t ints=Pin_All);
			virtual void				interruptDisable(uint32_t ints=Pin_All);
			virtual uint32_t			interruptEnabled(uint32_t ints=Pin_All);

		protected:
			virtual void				initialize(bool intEn);

		private:
			void						setIntEn(bool intEn);
			inline port_t				gpio() {return (port_t)port();};
	};
}

#endif
