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
#include <caribou++/cbitmap.h>

namespace CARIBOU
{
	#define inherited CByteArray

	CBitmap::CBitmap()
	: inherited()
	{
	}

	CBitmap::CBitmap(int width, int height, const uint8_t* data, bool bigEndian)
	: inherited()
	{
		setBits(width,height,data,bigEndian);
	}

	CBitmap::CBitmap(int width,int height)
	: inherited()
	{
		resize(width,height);
	}

	CBitmap::CBitmap(CSize size)
	: inherited()
	{
		resize(size.width(),size.height());
	}

	CBitmap::CBitmap(const CBitmap& other)
	: inherited( other )
	{
		mSize = other.mSize;
	}

	CBitmap::~CBitmap()
	{
	}

	void CBitmap::setBits(int width, int height, const uint8_t* data, bool bigEndian)
	{
		resize(width,height);
		if ( bigEndian )
		{
			int size = linearByteSize(width,height);
			uint8_t* bigEndianData = (uint8_t*)malloc(size);
			if ( bigEndianData )
			{
				flip(bigEndianData,data,size);
				inherited::copy((const char*)bigEndianData,size);
				free(bigEndianData);
			}
		}
		else
		{
			inherited::copy((const char*)data,linearByteSize(width,height));
		}
	}

	void CBitmap::flip(register uint8_t* output, register const uint8_t* input, int size)
	{
		register uint32_t inch;
		register uint32_t outch;
		for(int byte=0; byte < size; byte++)
		{
			inch = *input++;
			outch = 0;
			for(int bit=0; bit < 8; bit++)
			{
				outch >>= 1;
				outch |= (inch&0x80);
				inch <<= 1;
			}
			*output++ = (uint8_t)outch;
		}
	}

	/**
	** @brief Resize the bitmap buffer.
	*/
	void CBitmap::resize(int width,int height)
	{
		mSize.resize(width,height);
		if (mSize.isEmpty() )
		{
			clear();
		}
		else
		{
			inherited::resize(linearByteSize(width,height));
		}
	}

	CSize CBitmap::dimensions()
	{
		return mSize;
	}

	/**
	* @return The bit at the x,y position.
	*/
	uint8_t CBitmap::bit(int x, int y)
	{
		uint8_t bits = at(linearByteOffset(x,y));
		uint8_t bit = (bits >> (7-(x%8)))&1;
		return bit;
	}

	void CBitmap::clear()
	{
		inherited::clear();
		mSize.clear();
	}

	/**
	* @return The bit at the x,y position.
	*/
	void CBitmap::setBit(int x, int y, uint8_t bit)
	{
		int offset = linearByteOffset(x,y);
		uint8_t bits = at(offset);
		uint8_t mask = 0x80 >> (7-(x%8));
		if ( bit )
			inherited::set(offset,bits|mask);
		else
			inherited::set(offset,bits&~mask);
	}

	/**
	** @brief Calculate the number of bytes required for height * width bits.
	*/
	int CBitmap::linearByteSize(int width, int height)
	{
		return (height*(width/8));
	}

	/**
	** @brief Get the linear offset of the byte containing the bit at X,Y
	*/
	int CBitmap::linearByteOffset(int x, int y)
	{
		int offset = ( (dimensions().width()*y) + x ) / 8;
		return offset;
	}

	/**
	** @brief Calculate the number of inactive columns of bits between the left edge and the first
	** column containing an active bit.
	*/
	int CBitmap::leftMargin()
	{
		int x=0;
		for(; x < dimensions().width(); x++)
		{
			for(int y=0; y < dimensions().height(); y++)
			{
				if ( bit(x,y) )
				{
					return x;
				}
			}
		}
		return 0;
	}

	/**
	** @brief Calculate the number of inactive columns of bits between the left edge and the first
	** column containing an active bit.
	*/
	int CBitmap::rightMargin()
	{
		int x=dimensions().width()-1;
		for(; x >= 0; x--)
		{
			for(int y=0; y < dimensions().height(); y++)
			{
				if ( bit(x,y) )
				{
					return (dimensions().width()-1) - x;
				}
			}
		}
		return 0;
	}

	/**
	** @brief Calculate the number of inactive columns of bits between the left edge and the first
	** column containing an active bit.
	*/
	int CBitmap::topMargin()
	{
		int y=0;
		for(; y < dimensions().height(); y++)
		{
			for(int x=0; x < dimensions().width(); x++)
			{
				if ( bit(x,y) )
				{
					return y;
				}
			}
		}
		return 0;
	}

	/**
	** @brief Calculate the number of inactive columns of bits between the left edge and the first
	** column containing an active bit.
	*/
	int CBitmap::bottomMargin()
	{
		int y=dimensions().height()-1;
		for(; y >= 0; y--)
		{
			for(int x=0; x < dimensions().width(); x++)
			{
				if ( bit(x,y) )
				{
					return (dimensions().height()-1) - y;
				}
			}
		}
		return 0;
	}

	/**
	** @brief Make a copy of the bitmap with the left edge trimmed
	*/
	CBitmap CBitmap::trimmedLeft(int margin)
	{
		CBitmap rc;
		if ( margin >= 0 && margin < width() )
		{
			rc.resize(width()-margin,height());
			for(int y=0; y < height(); y++)
			{
				for(int x=margin; x < width(); x++)
				{
					rc.setBit(x-margin,y,bit(x,y));	// transfer a bit
				}
			}
		}
		return rc;
	}

	/**
	** @brief Make a copy of the bitmap with the right edge trimmed
	*/
	CBitmap CBitmap::trimmedRight(int margin)
	{
		CBitmap rc;
		if ( margin >= 0 && margin < width() )
		{
			rc.resize(width()-margin,height());
			for(int y=0; y < height(); y++)
			{
				for(int x=0; x < width()-margin; x++)
				{
					rc.setBit(x,y,bit(x,y));	// transfer a bit
				}
			}
		}
		return rc;
	}

	/**
	** @brief Make a copy of the bitmap with the top edge trimmed
	*/
	CBitmap CBitmap::trimmedTop(int margin)
	{
		CBitmap rc;
		if ( margin >= 0 && margin < height() )
		{
			rc.resize(width(),height()-margin);
			for(int x=0; x < width(); x++)
			{
				for(int y=margin; y < height(); y++)
				{
					rc.setBit(x,y-margin,bit(x,y));
				}
			}
		}
		return rc;
	}

	/**
	** @brief Make a copy of the bitmap with the bottom edge trimmed
	*/
	CBitmap CBitmap::trimmedBottom(int margin)
	{
		CBitmap rc;
		if ( margin >= 0 && margin < height() )
		{
			rc.resize(width(),height()-margin);
			for(int x=0; x < width(); x++ )
			{
				for(int y=0; y < height()-margin; y++)
				{
					rc.setBit(x,y,bit(x,y));	// transfer a bit
				}
			}
		}
		return rc;
	}

}
