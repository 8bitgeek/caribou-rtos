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
#ifndef _CARIBOUCPOINT_H_
#define _CARIBOUCPOINT_H_

#include "caribou++.h"

namespace CARIBOU
{

	class CPoint
	{
		public:
			CPoint();
			CPoint(int16_t x, int16_t y);
			CPoint(const CPoint& other);
			~CPoint();

			inline	void				copy(const CPoint& other)		{mX=other.mX;mY=other.mY;}
			inline	void				setXY(int16_t x, int16_t y)		{mX=x; mY=y;}
			inline	void				setX(int16_t x)					{mX=x;}
			inline	void				setY(int16_t y)					{mY=y;}

			inline	int16_t				x()								{return mX;}
			inline	int16_t				y()								{return mY;}

			CPoint&						add(const CPoint& other);
			CPoint&						subtract(const CPoint& other);

			CPoint&						operator=(const CPoint& other);

			inline CPoint&				operator+=(const CPoint& other)
										{
											mX += other.mX;
											mY += other.mY;
											return *this;
										}

			CPoint&						operator-=(const CPoint& other)
										{
											mX -= other.mX;
											mY -= other.mY;
											return *this;
										}

			bool						operator==(const CPoint& other);
			bool						operator!=(const CPoint& other);

		private:
			int16_t						mX;
			int16_t						mY;
	};
}

#endif

