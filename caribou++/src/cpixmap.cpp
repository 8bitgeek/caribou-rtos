/******************************************************************************
* Copyright © 2015 by Pike Aerospace Research Corporation
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
#include <caribou++/cpixmap.h>
#include <caribou++/cstring.h>

namespace CARIBOU
{
	#define inherited CObject

	CPixmap::CPixmap()
	: inherited()
	, mValid(false)		/* the XPM image is valid */
	, mWidth(0)			/* the width of the XPM in pixels */
	, mHeight(0)		/* the height of the XPM in pixels */
	, mColorCount(0)	/* number of colors in the color table */
	, mKeyBytes(0)		/* number of bytes in the key word */
	, mPixels(NULL)		/* the pixel data */
	, mColorMap(NULL)	/* the color map */
	, mRaw(NULL)		/* the raw XBM text */
	, mPtr(NULL)
	, mRowBuffer(NULL)
	{
	}

	CPixmap::CPixmap(const char* data[])
	: inherited()
	, mValid(false)		/* the XPM image is valid */
	, mWidth(0)			/* the width of the XPM in pixels */
	, mHeight(0)		/* the height of the XPM in pixels */
	, mColorCount(0)	/* number of colors in the color table */
	, mKeyBytes(0)		/* number of bytes in the key word */
	, mPixels(NULL)		/* the pixel data */
	, mColorMap(NULL)	/* the color map */
	, mRaw(NULL)		/* the raw XBM text */
	, mPtr(NULL)
	, mRowBuffer(NULL)
	{
		load(data);
	}

	CPixmap::CPixmap(const CPixmap& other)
	: inherited( other )
	{
		if ( &other != this )
		{
			mValid		= other.mValid;			/* the XPM image is valid */
			mWidth		= other.mWidth;			/* the width of the XPM in pixels */
			mHeight		= other.mHeight;		/* the height of the XPM in pixels */
			mColorCount	= other.mColorCount;	/* number of colors in the color table */
			mKeyBytes	= other.mKeyBytes;		/* number of bytes in the key word */

			/* the pixel data */
			if( other.mPixels )
			{
				mPixels = malloc(pixelBufferSize());
				memcpy(mPixels,other.mPixels,pixelBufferSize());
			}
		
			/* the color map */
			if( other.mColorMap )
			{
				mColorMap = static_cast<uint32_t*>(malloc(mColorCount*sizeof(uint32_t)));
				memcpy(mColorMap,other.mColorMap,mColorCount*sizeof(uint32_t));
			}
			mRaw		= NULL;					/* Only used during load() */
			mPtr		= NULL;					/* Only used during load */
		}
	}

	CPixmap::~CPixmap()
	{
		clear();
	}

	void CPixmap::clear()
	{
		mValid		= false;	/* the XPM image is valid */
		mWidth		= 0;		/* the width of the XPM in pixels */
		mHeight		= 0;		/* the height of the XPM in pixels */
		mColorCount	= 0;		/* number of colors in the color table */
		mKeyBytes	= 0;		/* number of bytes in the key word */

		if ( mPixels ) 
			free(mPixels);
		mPixels		= NULL;		/* the pixel data */

		if( mColorMap ) 
			free(mColorMap);
		mColorMap	= NULL;		/* the color map */

		//if( mRaw )			/* NOTE: caller owns mRaw!! */
		//	free(mRaw);
		mRaw		= NULL;		/* the raw XBM text */
		mPtr		= NULL;

		if ( mRowBuffer )
			free(mRowBuffer);
		mRowBuffer	= NULL;		/* the row color buffer */
	}

	
	bool CPixmap::readInt(int* i)
	{
		bool rc=false;
		CARIBOU::CString number;
		*i=0;
		spanWhite();
		while( isNumber(*mPtr) )
		{
			number.append(*mPtr++);
		}
		if ( !number.isEmpty() )
		{
			*i = number.toInt();
			rc = true;
		}
		return rc;
	}

	bool CPixmap::parseHexNibble(uint8_t* byte)
	{
		bool rc;
		uint8_t c;
		if ( (rc=isHex((c=*mPtr))) )
		{
			++mPtr;
			if ( c>='0'&&c<'9') 
				*byte = c-'0';
			else
				*byte = 10+(toUpper(c)-'A');
		}
		return rc;
	}

	bool CPixmap::parseHexByte(uint8_t* byte)
	{
		bool rc;
		uint8_t t=0;
		*byte=0;
		rc = parseHexNibble(&t);
		*byte=(t<<=4);
		if( rc )
		{
			rc = parseHexNibble(&t);
			*byte|=(t);
		}
		return rc;
	}

	/**
	 * @brief Parse the ASCII RGB color from the current XPM color key entry.
	 * @param color The RGB color returned as 0x00RRGGBB
	 * @return true on success, false indicates a parsing error.
	 */
	bool CPixmap::parseColor(uint32_t* color)
	{
		bool rc=true;
		*color=0;
		for(int n=0; n < mKeyBytes; n++) // span past the XPM key symbol..
			++mPtr;
		spanWhite();
		if( *mPtr == 'c' )
		{
			++mPtr;
			spanWhite();
			if( *mPtr == '#' )
			{
				++mPtr;
				for(int nHex=0; rc && nHex<3; nHex++)
				{
					uint8_t byte;
					if( (rc = parseHexByte(&byte)) )
					{
						*color <<= 8;
						*color |= byte;
					}
				}
			}
			else if ( strcmp(mPtr,"None") != 0 )
				rc=false;
		}
		else
			rc=false;
		return rc;
	}

	/**
	 * @brief Fetch a row of colors into an allocated buffer
	 * @return a pointer to a buffer of RGB values width() words long.
	 */
	uint32_t* CPixmap::colorsAt(int y)
	{
		if ( !mRowBuffer )
			mRowBuffer = (uint32_t*)malloc(sizeof(uint32_t)*mWidth);
		if ( mRowBuffer )
		{
			register int keyBytes = mKeyBytes;
			register uint8_t* src = static_cast<uint8_t*>(mPixels);
			src += (y*(mWidth*keyBytes));
			register uint32_t key;
			for(register int x=0; x < mWidth; x++)
			{
				key=0;
				for(register int nByte=0; nByte < keyBytes; nByte++ )
				{
					key <<= 8;
					key |= *src++;
				}
				mRowBuffer[x] = mColorMap[key];
			}
		}
		return mRowBuffer;
	}

	/**
	 * @brief Fetch the color index at the pixel location X,y.
	 */
	uint32_t CPixmap::keyAt(int x, int y)
	{
		register uint32_t rc=0;
		register uint8_t* src = static_cast<uint8_t*>(mPixels);
		register int keyBytes = mKeyBytes;
		src += (y*(mWidth*keyBytes))+(x*keyBytes);
		for(register int nByte=0; nByte < keyBytes; nByte++ )
		{
			rc <<= 8;
			rc |= *src++;
		}
		return rc;
	}

	/**
	 * Get the color key index offset from an XPM source pixel color symbol
	 */
	int CPixmap::keyOffset(register uint8_t* sym)
	{
		register int keyBytes = mKeyBytes;
		register char** p = (char**)mRaw;
		register int cnt = mColorCount+1;
		++p;
		for(register int rc=1; rc < cnt; rc++)
		{
			if( memcmp(*p,(char*)sym,keyBytes) == 0 )
			{
				return rc-1;
			}
			++p;
		}
		return 0;
	}

	/* 
	* Locate all pixels that match the pattern contained in the key buffer, and transpose
	* the nColor index into the mPixels buffer.
	*/
	void CPixmap::transposePixels()		
	{
		int keyShift = ((8*sizeof(uint32_t))-(8*mKeyBytes));			// amount to shift color key toward MSB
		for( int y=0; y < mHeight; y++ )
		{
			register uint8_t* src = (uint8_t*)mRaw[y+mColorCount+1];	// Get a pointer to the source pixel row.
			register uint8_t* dst = static_cast<uint8_t*>(mPixels);		// Get the destination offset...
            dst += y*(mWidth*mKeyBytes);
			for( int x=0; x < mWidth; x++ )
			{
				int key = keyOffset(src);								// Get the key offset from the pixel symbol.
				key <<= keyShift;										// Shift the color key into the MSB */
				// Write the color key bytes into the destination pixel location, MSB first...
				for(register int nByte=0; nByte < mKeyBytes; nByte++)
				{
					*dst++ = (((key<<(8*nByte))&0xFF000000)>>24);
				}				
				src += mKeyBytes;
			}
		}
	}

	bool CPixmap::readColorMap()
	{
		bool rc=true;
		if ( (mColorMap = static_cast<uint32_t*>(malloc(mColorCount*sizeof(uint32_t)))) )
		{
			if( (mPixels = malloc(pixelBufferSize())) )		/* Allocate the pixel translation table */
			{
				memset(mPixels,pixelBufferSize(),0);
				for(int nColor=0; rc && nColor < mColorCount; nColor++)
				{
					uint32_t color;
					mPtr = mRaw[nColor+1];
					rc = parseColor(&color);
					mColorMap[nColor] = color;
				}
				transposePixels();
			}
			else
			{
				clear();
				rc = false;
			}
		}
		else
			rc = false;
		return rc;
	}

	/**
	 * @brief Load from an in-memory XPM image. Re-map the color table for faster
	 * lookup.
	 */
	bool CPixmap::load(const char* data[])
	{
		clear();
		mRaw=data;
		mPtr=mRaw[0];
		if ( readInt(&mWidth) )
		{
			if ( readInt(&mHeight) )
			{
				if ( readInt(&mColorCount) )
				{
					if( readInt(&mKeyBytes) )
					{
						mValid = readColorMap();
					}
				}
			}
		}
		if( !mValid )
			clear();
		return mValid;
	}

	/**
	 * @brief Set a pixel color key
	 */
	void CPixmap::setKeyAt(int x, int y, uint32_t key)
	{
		int keyShift = ((8*sizeof(uint32_t))-(8*mKeyBytes));		// amount to shift color key toward MSB
		register uint8_t* dst = static_cast<uint8_t*>(mPixels);		// Get the destination offset...
		dst += (y*(mWidth*mKeyBytes))+(x*mKeyBytes);
		key <<= keyShift;											// Shift the color key into the MSB */
		// Write the color key bytes into the destination pixel location, MSB first...
		for(register int nByte=0; nByte < mKeyBytes; nByte++)
		{
			*dst++ = (((key<<(8*nByte))&0xFF000000)>>24);
		}				
	}

	/**
	 * @brief Get a pixel key from the saved pixel buffer.
	 */
	uint32_t CPixmap::getSavedKeyAt(int x, int y)
	{
		register uint32_t rc=0;
		register uint8_t* src = static_cast<uint8_t*>(mSavedPixels);
		register int keyBytes = mKeyBytes;
		src += (y*(mSavedWidth*keyBytes))+(x*keyBytes);
		for(register int nByte=0; nByte < keyBytes; nByte++ )
		{
			rc <<= 8;
			rc |= *src++;
		}
		return rc;
	}

	/**
	 * @brief Stretch an image about it's vertical center-lines.
	 */
	bool CPixmap::stretchWidth(CARIBOU::CSize size)
	{
		bool rc=true;
		if ( size.width() > mWidth )
		{
			mSavedWidth = mWidth;
			mSavedHeight = mHeight;
			mSavedPixels = mPixels;
            // Calculate the column of pixels to be cloned...
			int cloneX = (mSavedWidth/2);				
			// Scale a buffer to the new width...
			mWidth=size.width();
			if( (mPixels = malloc(pixelBufferSize())) )
			{
				memset(mPixels,1,pixelBufferSize());
				// Transfer the pixels from the saved buffer to the new buffer,
				// cloning the empty pixels from the cloneX column.
				for(int y=0; y < mHeight; y++)
				{
					for(int x=0; x < mWidth; x++)
					{
						if(x <= cloneX )										// edge, copy
							setKeyAt(x,y,getSavedKeyAt(x,y));
						else if ( x < (mWidth-(mSavedWidth-cloneX)) )			// middle part, clone
							setKeyAt(x,y,getSavedKeyAt(cloneX,y));
						else
							setKeyAt(x,y,getSavedKeyAt(mSavedWidth-(mWidth-x),y));
					}
				}
				free(mSavedPixels);
				mSavedPixels=NULL;
			}
			else
			{
				mPixels = mSavedPixels;
				mWidth = mSavedWidth;
				mSavedPixels=NULL;
				rc = false;
			}
		}
		return rc;
	}
	/**
	 * @brief Stretch an image about it's horizontal center-lines.
	 */
	bool CPixmap::stretchHeight(CARIBOU::CSize size)
	{
		bool rc=true;
		if ( size.height() > mHeight )
		{
			mSavedWidth = mWidth;
			mSavedHeight = mHeight;
			mSavedPixels = mPixels;
            // Calculate the row of pixels to be cloned...
			int cloneY = (mSavedHeight/2);				
			// Scale a buffer to the new height...
			mHeight=size.height();
			if( (mPixels = malloc(pixelBufferSize())) )
			{
				memset(mPixels,1,pixelBufferSize());
				// Transfer the pixels from the saved buffer to the new buffer,
				// cloning the empty pixels from the cloneX column.
				for(int y=0; y < mHeight; y++)
				{
					for(int x=0; x < mWidth; x++)
					{
						if(y <= cloneY )	// edge, copy
							setKeyAt(x,y,getSavedKeyAt(x,y));
						else if ( y < (mHeight-(mSavedHeight-cloneY)) )			// middle part, clone
							setKeyAt(x,y,getSavedKeyAt(x,cloneY));
						else
							setKeyAt(x,y,getSavedKeyAt(x,mSavedHeight-(mHeight-y)));
					}
				}
				free(mSavedPixels);
				mSavedPixels=NULL;
			}
			else
			{
				mPixels = mSavedPixels;
				mHeight = mSavedHeight;
				mSavedPixels=NULL;
				rc = false;
			}
		}
		return rc;
	}

	/**
	 * @brief Stretch an image about it's horizontal and vertical center-lines.
	 */
	bool CPixmap::stretch(CARIBOU::CSize size)
	{
		bool rc;
		if ( mRowBuffer )
			free(mRowBuffer);
		mRowBuffer=NULL;
		mStretch = size;
		if ( (rc=stretchWidth(size)) )		// Stretch width first...
			rc = stretchHeight(size);		// ...then height.
		return rc;
	}

}
