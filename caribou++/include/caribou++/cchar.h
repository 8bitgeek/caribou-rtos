/******************************************************************************
* Copyright © 2005-2012 by Pike Aerospace Research Corporation
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
#ifndef _CARIBOUCCHAR_H_
#define _CARIBOUCCHAR_H_

#include "caribou++.h"

namespace CARIBOU
{

	class CChar
	{
		public:

			CChar();
			CChar(const uint16_t ch);
			CChar(const CChar& other);
			~CChar();

			char					toAscii();
			uint16_t				toUnicode();
			uint16_t				raw();

			CChar&					operator =  (const CChar& other);
			bool					operator == (const CChar& other);
			bool					operator != (const CChar& other);
			bool					operator <  (const CChar& other);
			bool					operator >  (const CChar& other);
			bool					operator <= (const CChar& other);
			bool					operator >= (const CChar& other);

			CChar&					operator =  (const uint16_t& other);
			bool					operator == (const uint16_t& other);
			bool					operator != (const uint16_t& other);
			bool					operator <  (const uint16_t& other);
			bool					operator >  (const uint16_t& other);
			bool					operator <= (const uint16_t& other);
			bool					operator >= (const uint16_t& other);


		private:
			uint16_t				mChar;
	};
}

#endif

