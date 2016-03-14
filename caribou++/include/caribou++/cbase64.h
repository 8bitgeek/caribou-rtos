/** ***************************************************************************
* @file cbase64.h
* @author Mike Sharkey <mike@pikeaero.com>.
* @copyright © 2005-2013 by Pike Aerospace Research Corporation
* @copyright © 2014-2015 by Mike Sharkey
* @details This file is part of CARIBOU RTOS
* CARIBOU RTOS is free software: you can redistribute it and/or modify
* it under the terms of the Beerware License Version 43.
* "THE BEER-WARE LICENSE" (Revision 43):
* Mike Sharkey <mike@pikeaero.com> wrote this file. 
* As long as you retain this notice you can do whatever you want with
* this stuff. If we meet some day, and you think this stuff is 
* worth it, you can buy me a beer in return ~ Mike Sharkey
******************************************************************************/
#ifndef _CARIBOU_CBASE64_H_
#define _CARIBOU_CBASE64_H_

#include <caribou++.h>
#include <caribou++/cbytearray.h>
#include <caribou++/cstring.h>

namespace CARIBOU
{

	class CBase64
	{
		public:

			CBase64();
			CBase64(const CARIBOU::CString in);
			~CBase64();

			CARIBOU::CByteArray		encode(CARIBOU::CByteArray in);
			CARIBOU::CByteArray		decode(CARIBOU::CByteArray in);

		private:

			static const char		base64en[];
			static const char		base64de[];
	};

	extern 	CARIBOU::CString base64_encode(CARIBOU::CString in);
	extern 	CARIBOU::CString base64_decode(CARIBOU::CString in);

}

#endif

