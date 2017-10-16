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
#include <caribou++/cspi.h>

namespace CARIBOU
{
	#define inherited CARIBOU::CObject

	CSPI::CSPI(SPI_TypeDef* spi,CARIBOU::CGPIO chipSelect)
	: inherited()
	, mSPI(spi)
	, mChipSelect(chipSelect)
	{
		deselect();
	}

	CSPI::~CSPI()
	{
		deselect();
	}

	/**
	 * @brief Determine of the interrupt occured on this pin, and if so
	 * trigger the interrupt() call.
	 */
	void CSPI::irq(InterruptVector vector)
	{
		inherited::irq(vector);
	}


	/** @brief Non-DMA method */
	uint8_t CSPI::tx(uint8_t* data,int len)
	{
		uint8_t rc=0;
		volatile uint8_t* dr = (volatile uint8_t*)&(spi()->DR);
		if ( select() )
		{
			for(int n=0; n < len; n++)
			{
				while(!txReady());
				*dr = data[n];
				while(!txReady());
				while(txBusy());
			}
			rc=1;
			deselect();
		}
		return rc;
	}

}