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
#ifndef CARIBOUCRINGBUFFER_H
#define CARIBOUCRINGBUFFER_H

#include "cbytearray.h"

namespace CARIBOU {

	/**
	* Implements a ring buffer of bytes.
	* @author Michael Sharkey <mike@pikeaero.com>
	*/
	class CRingBuffer : public CByteArray
	{
		public:
			CRingBuffer();
			~CRingBuffer();

			virtual size_t			resize(size_t size);
			virtual void			clear()	{mHead=mTail=mOverflow=0;}
			size_t					insert(uint8_t ch);
			size_t					insert(CByteArray& bytes);
			uint8_t					peek();
			uint8_t					remove();
			uint8_t					remove(uint8_t ch);
			size_t					length();
			inline	bool			full() 		{return (length() >= size()-1);}
			inline	uint16_t		free()		{return (size()-length())-1;}
			inline	bool			empty()		{return length() == 0;}
			inline	uint16_t		overflow()	{return mOverflow;}
			CByteArray				toByteArray();

		private:
			size_t		mHead;
			size_t		mTail;
			uint16_t	mOverflow;
	};

}

#endif
