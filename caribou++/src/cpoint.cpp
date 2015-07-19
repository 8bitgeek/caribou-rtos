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
#include <caribou++/cpoint.h>

namespace CARIBOU
{
	CPoint::CPoint()
	: mX(0)
	, mY(0)
	{
	}

	CPoint::CPoint(int16_t x, int16_t y)
	: mX(x)
	, mY(y)
	{
	}

	CPoint::CPoint(const CPoint& other)
	: mX(other.mX)
	, mY(other.mY)
	{
	}

	CPoint::~CPoint()
	{
	}

	/**
	* @brief Add an offset from another point.
	*/
	CPoint& CPoint::add(const CPoint& other)
	{
		mX += other.mX;
		mY += other.mY;
		return *this;
	}

	/**
	* @brief Subtract an offset from another point
	*/
	CPoint& CPoint::subtract(const CPoint& other)
	{
		mX -= other.mX;
		mY -= other.mY;
		return *this;
	}

	CPoint&	CPoint::operator=(const CPoint& other)
	{
		mX = other.mX;
		mY = other.mY;
		return *this;
	}

	bool CPoint::operator==(const CPoint& other)
	{
		return ( mX == other.mX && mY == other.mY );
	}

	bool CPoint::operator!=(const CPoint& other)
	{
		return !( mX == other.mX && mY == other.mY );
	}

}
