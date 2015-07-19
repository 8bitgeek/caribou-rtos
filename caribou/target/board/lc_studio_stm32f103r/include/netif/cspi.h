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

#ifndef _CARIBOU_CSPI_H_
#define _CARIBOU_CSPI_H_

namespace CARIBOU
{
	class CSPI : public CObject
	{
		public:
			CSPI(int unit);
			virtual ~CSPI();
			
			uint8_t						readWrite(uint8_t wb);
			SPI_TypeDef*				device() {return mSPI;}

		protected:
			SPI_TypeDef*				mSPI;
	};
}

#endif
