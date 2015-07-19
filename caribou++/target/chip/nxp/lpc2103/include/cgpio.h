/******************************************************************************
* Copyright © 2005-2012 by Pike Aerospace Research Corporation
* All Rights Reserved
*
*   This file is part of DaddyBASIC.
*
*   DaddyBASIC is free software: you can redistribute it and/or modify
*   it under the terms of the Beerware License Version 43.
*
* ----------------------------------------------------------------------------
* "THE BEER-WARE LICENSE" (Revision 43):
* <mike@pikeaero.com> wrote this file. As long as you retain this notice you
* can do whatever you want with this stuff. If we meet some day, and you think
* this stuff is worth it, you can buy me a beer in return ~ Mike Sharkey
* ----------------------------------------------------------------------------
******************************************************************************/
#ifndef CARIBOUGPIO_H
#define CARIBOUGPIO_H

#include "types.h"

namespace CARIBOU {

	class CGPIO
	{
		public:

			typedef enum
			{
				ResetMode=0,		/* 0 After reset state. */
				UnconnectedMode,	/* 1 Safe state for unconnected pads. */
				InputMode,			/* 2 Regular input high-Z pad */
				InputPullUp,		/* 3 Input pad with weak pull up resistor */
				InputPullDown,		/* 4 Input pad with weak pull down resistor */
				InputAnalog,		/* 5 Analog input mode */
				OutputPushPull,  	/* 6 Push-pull output pad. */
				OutputOpenDrain,	/* 7 Open-drain output pad. */
			} tPinMode;

			CGPIO( uint32_t port, uint16_t pad, tPinMode mode=UnconnectedMode );
			~CGPIO();

			virtual bool					state();
			virtual void					setState(bool state);
			virtual bool					inverted() {return false;}
			void							toggleState();

			uint32_t						port()	{return mPort;}
			uint8_t							pad()	{return mPad;}

			void							setMode(tPinMode pinMode);

		protected:
			uint32_t						bit(uint8_t n)	{return (1<<n);}

		private:
			uint32_t						mPort;
			uint8_t							mPad;

	};

}

#endif
