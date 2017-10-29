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
#include <caribou++/csize.h>

namespace CARIBOU
{
	CSize::CSize()
	: mWidth(0)
	, mHeight(0)
	{
	}

	CSize::CSize(const CSize& other)
	{
		mWidth = other.mWidth;
		mHeight = other.mHeight;
	}

	CSize::CSize(int32_t width, int32_t height)
	{
		mWidth = width;
		mHeight = height;
	}

	CSize::~CSize()
	{
	}

	/**
	* @brief Add an offset from another point.
	*/
	CSize& CSize::add(const CSize& other)
	{
		mWidth += other.mWidth;
		mHeight += other.mHeight;
		return *this;
	}

	/**
	* @brief Subtract an offset from another point
	*/
	CSize& CSize::subtract(const CSize& other)
	{
		mWidth -= other.mWidth;
		mHeight -= other.mHeight;
		return *this;
	}

	CSize&	CSize::operator=(const CSize& other)
	{
		mWidth = other.mWidth;
		mHeight = other.mHeight;
		return *this;
	}

	CSize&	CSize::operator+=(const CSize& other)
	{
		return add(other);
	}

	CSize&	CSize::operator-=(const CSize& other)
	{
		return subtract(other);
	}

	bool CSize::operator==(const CSize& other)
	{
		bool rc = ( mWidth == other.mWidth && mHeight == other.mHeight );
		return rc;
	}

	bool CSize::operator!=(const CSize& other)
	{
		bool rc = !( mWidth == other.mWidth && mHeight == other.mHeight );
		return rc;
	}

}
