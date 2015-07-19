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
#include <caribou++/cregion.h>

namespace CARIBOU
{
	#define inherited CRect

	CRegion::CRegion()
	: inherited()
	{
	}

	CRegion::CRegion(int16_t x, int16_t y, int16_t width, int16_t height)
	: inherited(x,y,width,height)
	{
	}

	CRegion::CRegion(CRect rect)
	: inherited(rect.x(),rect.y(),rect.width(),rect.height())
	{
	}

	CRegion::CRegion(const CRegion& other)
	{
		CRegion* p_other = (CRegion*)&other;
		for(int n=0; n < mRectangles.count(); n++)
		{
			CRect* rect = p_other->mRectangles.at(n);
			append(*rect);
		}
	}

	CRegion::~CRegion()
	{
		clear();
	}

	CRegion& CRegion::operator=(const CRegion& other)
	{
		CRegion* p_other = (CRegion*)&other;
		for(int n=0; n < mRectangles.count(); n++)
		{
			CRect* rect = p_other->mRectangles.at(n);
			append(*rect);
		}
	}

	/// @brief append a rectangle to the region
	void CRegion::append(CRect rect)
	{
		CRect* regionRect = new CRect(rect);
		if ( regionRect )
		{
			mRectangles.append(regionRect);
		}
		update();
	}

	/// @return the rectangle at the position.
	CRect CRegion::at(int pos)
	{
		CRect rc;
		if ( pos < mRectangles.count() )
		{
			CRect* rect = mRectangles.at(pos);
			rc = *rect;
		}
		return rc;
	}

	/// @return the number of rectangles in the region
	int CRegion::count()
	{
		return mRectangles.count();
	}

	/// @brief clear the contained rectangles.
	void CRegion::clear()
	{
		while( mRectangles.count() )
			delete mRectangles.take(0);
		update();
	}

	/// @brief unite all of the contained rectangles to form region bounds.
	void CRegion::update()
	{
		CRect rects;
		for(int n=0; n < mRectangles.count(); n++)
		{
			CRect* rect = mRectangles.at(n);
			rects = rects.united(*rect);
		}
		move( rects.pos() );
		resize( rects.size() );
	}

}
