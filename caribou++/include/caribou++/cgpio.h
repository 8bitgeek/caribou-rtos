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
#ifndef _CARIBOU_CGPIO_H_
#define _CARIBOU_CGPIO_H_

#include <caribou++/cobject.h>
#include <caribou/dev/gpio.h>

namespace CARIBOU
{
	class CGPIO : public CObject
	{
		public:

			CGPIO(caribou_gpio_t* gpio);
			CGPIO(const CGPIO& other);
			virtual ~CGPIO();

			virtual void				set();
			virtual void				reset();
			virtual void				toggle();
			virtual	void				toggle(uint32_t msec);
			virtual	void				oneshot(uint32_t msec);
			virtual chip_gpio_pinmask_t	state();
			virtual	chip_gpio_pinmask_t	pinmask();

		protected:
			inline caribou_gpio_t*		gpio() {return &mGPIO;}		
			virtual void				event(CEvent* e);
		
			caribou_gpio_t				mGPIO;		

		private:
			caribou_timer_t*			mToggleTimerId;
			caribou_timer_t*			mOneShotTimerId;
	};
}

#endif
