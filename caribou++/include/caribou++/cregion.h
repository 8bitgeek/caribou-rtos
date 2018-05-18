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
#ifndef _CARIBOUCREGION_H_
#define _CARIBOUCREGION_H_

#include "cpoint.h"
#include "csize.h"
#include "crect.h"
#include "clist.h"

namespace CARIBOU
{

	/// @brief a region is sequence of rectangles

	class CRegion : public CRect
	{
		public:
			CRegion();
			CRegion(int16_t x, int16_t y, int16_t width, int16_t height);
			CRegion(CRect rect);
			CRegion(CPoint pos, CSize size);
			CRegion(const CRegion& other);
			~CRegion();

			void			append(CRect rect);
			CRect			at(int pos);
			int				count();
			void			clear();

			CRegion&		operator=(const CRegion& other);

		protected:

			void			update();

		private:
			CList<CRect*>	mRectangles;
	};
}

#endif

