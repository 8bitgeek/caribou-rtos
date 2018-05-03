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
#ifndef _CARIBOU_CSPI_H_
#define _CARIBOU_CSPI_H_

#include <caribou++/cobject.h>
#include <caribou++/cmutex.h>
#include <caribou++/cgpio.h>

namespace CARIBOU
{
	class CSPI : public CARIBOU::CObject
	{
		public:

			CSPI(SPI_TypeDef* spi, CARIBOU::CGPIO chipSelect);
			virtual ~CSPI();

			inline uint8_t				tx(uint8_t data)
										{
											volatile uint8_t rc=0;
                                            volatile uint8_t* dr = (volatile uint8_t*)&(spi()->DR);
											while(!txReady());
											*dr = data;
											while(!txReady());
											while(txBusy());
											while(!rxReady());
											rc=*dr; // RX
											return rc;
										}

			uint8_t						tx(uint8_t* data,int len);

			inline bool					select()			
										{
											bool rc=true;
											mChipSelect.reset();
											return rc;
										}
			inline void					deselect()
										{
											mChipSelect.set();
										}
			inline bool					selected()			{return mChipSelect.state() ? false : true;}

		protected:

			inline SPI_TypeDef*			spi()				{return mSPI;}
			inline bool					rxReady()			{return (spi()->SR & SPI_FLAG_RXNE);}
			inline bool					txReady()			{return (spi()->SR & SPI_FLAG_TXE);}
			inline bool					txBusy()			{return (spi()->SR & SPI_FLAG_BSY);}

			virtual	void				irq(InterruptVector vector);

		private:

			void						init();
			void						deinit();

            SPI_TypeDef*				mSPI;
            InterruptVector				mVector;
			CARIBOU::CGPIO				mChipSelect;
	};
}

#endif
