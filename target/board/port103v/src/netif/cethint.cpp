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
#include "netif/cethint.h"

extern "C" void ether_int();

namespace CARIBOU
{
	#define inherited CObject

	CEthInt::CEthInt()
	: inherited()
	, mEnabled(false)
	{
		mIntPin = new CGPIO(Port_A, 
							Pin_8,
							Pin_None,
							IGPIO::Mode_IPU, 
							IGPIO::Speed_50MHz, 
							IGPIO::Trigger_Falling,true );
		mWakePin = new CGPIO(Port_A, 
							Pin_0,
							Pin_None,
							IGPIO::Mode_IPU, 
							IGPIO::Speed_50MHz,
							IGPIO::Trigger_Falling, true );
		installVectorIRQ(Vector_EXTI0,this);
		installVectorIRQ(Vector_EXTI9_5,this);
	}

	CEthInt::~CEthInt()
	{
		removeVectorIRQ(Vector_EXTI0,this);
		removeVectorIRQ(Vector_EXTI9_5,this);
		delete mIntPin;
		delete mWakePin;
	}

	void CEthInt::enable()
	{
		mIntPin->interruptEnable();
		mWakePin->interruptEnable();
	}

	void CEthInt::disable()
	{
		mIntPin->interruptDisable();
		mWakePin->interruptDisable();
	}

	void CEthInt::irq(InterruptVector vector)
	{
		if ( mEnabled && vector == Vector_EXTI9_5 )
		{
			ether_int();
		}
	}

}