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
#include <caribou++/interface/ispi.h>

#include <stm32f10x_spi.h>
#include <stm32f10x_gpio.h>

#ifndef _CARIBOU_CHIP_CSPI_H_
#define _CARIBOU_CHIP_CSPI_H_

#define	Spi_0	SPI1
#define	Spi_1	SPI2

namespace CARIBOU
{
	class CSpi : public ISpi
	{
		public:
			CSpi(uint32_t unit=reinterpret_cast<uint32_t>(Spi_0));
			virtual ~CSpi();
			
			uint8_t						readWrite(uint8_t wb);
			inline SPI_TypeDef*			device() {return reinterpret_cast<SPI_TypeDef*>(unit());}

		protected:
			virtual	void				init();
			SPI_TypeDef*				mSpi;
	};
}

#endif
