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
#include <caribou++/cgpio.h>

#ifndef _CARIBOU_CETHINT_H_
#define _CARIBOU_CETHINT_H_

namespace CARIBOU
{
	class CEthInt : public CObject
	{
		public:

			CEthInt();
			virtual ~CEthInt();

			void						enable();
			void						disable();

		protected:
			virtual	void				irq(InterruptVector vector);
		private:
			bool						mEnabled;
            CGPIO*						mIntPin;
			CGPIO*						mWakePin;
	};
}

#endif
