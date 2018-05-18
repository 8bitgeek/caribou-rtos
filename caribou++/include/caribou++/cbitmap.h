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
#ifndef CARIBOUCBITMAP_H
#define CARIBOUCBITMAP_H

#include <caribou++/csize.h>
#include <caribou++/cbytearray.h>

namespace CARIBOU
{
	/** Defines a generic bitmap storage class. */

	class CBitmap : public CByteArray
	{
		public:
			CBitmap();
			CBitmap(CSize size);
			CBitmap(int width, int height);
			CBitmap(int width, int height, const uint8_t* data, bool bigEndian=false);
			CBitmap(const CBitmap& other);
			virtual ~CBitmap();

			void				setBits(int width, int height, const uint8_t* data, bool bigEndian=true);

			virtual void		clear();
			void				resize(CSize size) {resize(size.width(),size.height());}
			void				resize(int width, int height);
			CSize				dimensions();
			int					width()		{return mSize.width();}
			int					height()	{return mSize.height();}

			uint8_t				bit(int x, int y);
			void				setBit(int x, int y, uint8_t bit);

			int					leftMargin();
			int					rightMargin();
			int					topMargin();
			int					bottomMargin();

			CBitmap				trimmedLeft(int margin);
			CBitmap				trimmedRight(int margin);
			CBitmap				trimmedTop(int margin);
			CBitmap				trimmedBottom(int margin);

		private:
			void				flip(uint8_t* output, const uint8_t* input, int size);
			int					linearByteSize(int width,int height);
			int					linearByteOffset(int x,int y);
			CSize				mSize;
	};
}

#endif

