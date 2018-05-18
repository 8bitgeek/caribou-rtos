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
#ifndef _CARIBOUCRECT_H_
#define _CARIBOUCRECT_H_

#include "cpoint.h"
#include "csize.h"

namespace CARIBOU
{

	class CRect
	{
		public:
			CRect();
			CRect(int16_t x, int16_t y, int16_t width, int16_t height);
			CRect(CPoint pos, CSize size);
			CRect(const CRect& other);
			~CRect();

			inline CPoint&	topLeft()						{return mPos;}
			inline CPoint	topRight()						{return CPoint(right(),top());}
			inline CPoint	bottomRight()					{return CPoint(right(),bottom());}
			inline CPoint	bottomLeft()					{return CPoint(left(),bottom());}

			inline void		move(int16_t x, int16_t y)		{setPos(x,y);}
			inline void		move(CPoint pt)					{setPos(pt);}
			inline void		setPos(int16_t x, int16_t y)	{mPos.setXY(x,y);}
			inline void		setPos(CPoint pos)				{mPos.copy(pos);}

			inline void		resize(int16_t w,int16_t h)		{mSize.resize(w,h);}
			inline void		resize(CSize size)				{mSize=size;}

			inline void		setY(int16_t y)					{mPos.setY(y);}
			inline void		setX(int16_t x)					{mPos.setX(x);}
			inline void		setTop(int16_t top)				{mPos.setY(top);}
			inline void		setLeft(int16_t left)			{mPos.setX(left);}
			inline void		setBottom(int16_t bottom)		{mSize.setHeight((bottom-top())+1);}
			inline void		setRight(int16_t right)			{mSize.setWidth((right-left())+1);}

			inline void		setHeight(int16_t height)		{mSize.setHeight(height);}
			inline void		setWidth(int16_t width)			{mSize.setWidth(width);}
			inline void		setSize(CSize size)				{mSize = size;}

			inline CPoint&	pos()							{return mPos;}
			inline CSize&	size()							{return mSize;}
			inline int16_t	x()								{return mPos.x();}
			inline int16_t	y()								{return mPos.y();}
			inline int16_t	width()							{return mSize.width();}
			inline int16_t	height()						{return mSize.height();}
			inline int16_t	top()							{return y();}
			inline int16_t	left()							{return x();}
			inline int16_t	right()							{return x()+width()-1;}
			inline int16_t	bottom()						{return y()+height()-1;}

			inline bool		isEmpty()						{return mSize.isEmpty();}

			CRect			inset(int x,int y, int w, int h);

			CRect&			operator=(const CRect& other);
			bool			operator==(const CRect& other);
			bool			operator!=(const CRect& other);

			bool			contains(CPoint& pt);
			bool			contains(CRect& rect, bool proper=false);
			bool			intersects(CRect& rect)			{return contains(rect);}
			CRect			intersected(CRect& rect);
			CRect			united(CRect& rect);
			CPoint			center();
			static CRect	triangleRect(CARIBOU::CPoint p0, CARIBOU::CPoint p1, CARIBOU::CPoint p2);

		private:
			CPoint		mPos;
			CSize		mSize;
	};
}

#endif

