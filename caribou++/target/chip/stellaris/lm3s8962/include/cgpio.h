/***************************************************************************
 *   Copyright © 2005-2013 by Pike Aerospace Research Corporation          *
 *   info@pikeaero.com                                                     *
 *                                                                         *
 *   This program is free software: you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation, either version 3 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 *   This program is distributed in the hope that it will be useful,       *
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
 *   GNU General Public License for more details.                          *
 *                                                                         *
 *   You should have received a copy of the GNU General Public License     *
 *   along with this program.  If not, see <http://www.gnu.org/licenses/>. *
 **************************************************************************/
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
