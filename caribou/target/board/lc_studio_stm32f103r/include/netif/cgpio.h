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
#include <caribou++.h>
#include <caribou++/cobject.h>
#include <caribou++/clist.h>
#include <caribou++/cspinlock.h>

#include <stm32f10x_gpio.h>

#ifndef _CARIBOU_CGPIO_H_
#define _CARIBOU_CGPIO_H_

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
#define Port_A					GPIOA
#define Port_B					GPIOB
#define Port_C					GPIOC
#define Port_D					GPIOD
#define Port_E					GPIOE

namespace CARIBOU
{
	class CGPIO : public CObject
	{
		public:

			typedef enum
			{ 
				Mode_AIN = 0x0,
				Mode_IN_FLOATING = 0x04,
				Mode_IPD = 0x28,
				Mode_IPU = 0x48,
				Mode_Out_OD = 0x14,
				Mode_Out_PP = 0x10,
				Mode_AF_OD = 0x1C,
				Mode_AF_PP = 0x18
			} mode_t;

            typedef enum
			{ 
				Speed_10MHz = 1,
				Speed_2MHz, 
				Speed_50MHz
			} speed_t;

			typedef enum
			{
			  Trigger_Rising = 0x08,
			  Trigger_Falling = 0x0C,  
			  Trigger_Rising_Falling = 0x10
			} trigger_t;


			CGPIO(port_t port=Port_A, uint16_t pins=Pin_None, mode_t mode=Mode_AIN, speed_t speed=Speed_50MHz, bool intEn=false, trigger_t trigger=Trigger_Rising );
			virtual ~CGPIO();

			void						setPort(port_t port)	{mPort=port;}
			void						setPins(uint16_t pins)	{mPins=pins;}

			port_t						port()		{return mPort;}
			uint16_t					pins()		{return mPins;}
			mode_t						mode()		{return mMode;}
			speed_t						speed()		{return mSpeed;}
			bool						intEn()		{return mIntEn;}
			trigger_t					trigger()	{return mTrigger;}

			bool						intPending();
			void						intClear();
			void						intEnable();
			void						intDisable();
			bool						intEnabled();

		protected:
			void						init();
            void						setIntEn();
			port_t						mPort;
            uint16_t					mPins;
			mode_t						mMode;
			speed_t						mSpeed;
			bool						mIntEn;
			trigger_t					mTrigger;
	};
}

#endif
