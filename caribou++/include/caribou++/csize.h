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
#ifndef _CARIBOUCSIZE_H_
#define _CARIBOUCSIZE_H_

#include "caribou++.h"

namespace CARIBOU
{
	class CSize
	{
		public:
			CSize();
			CSize(const CSize& other);
			CSize(int16_t width, int16_t height);
			~CSize();

			inline	void				clear()							{mWidth=0; mHeight=0;}
			inline	void				copy(const CSize& other)		{mWidth=other.mWidth;mHeight=other.mHeight;}
			inline	void				resize(CSize size)				{mWidth=size.width(); mHeight=size.width();}
			inline	void				resize(int16_t w, int16_t h)	{mWidth=w; mHeight=h;}
			inline	void				setWidth(int16_t w)				{mWidth=w;}
			inline	void				setHeight(int16_t h)			{mHeight=h;}

			inline	int16_t				width()							{return mWidth;}
			inline	int16_t				height()						{return mHeight;}

			CSize&						add(const CSize& other);
			CSize&						subtract(const CSize& other);

			inline	bool				isEmpty()						{return mWidth==0 && mHeight==0;}

			CSize&						operator=(const CSize& other);
			CSize&						operator+=(const CSize& other);
			CSize&						operator-=(const CSize& other);
			bool						operator==(const CSize& other);
			bool						operator!=(const CSize& other);

		private:
			uint32_t					mWidth;
			uint32_t					mHeight;
	};
}

#endif

