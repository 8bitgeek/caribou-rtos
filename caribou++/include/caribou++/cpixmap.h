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
#ifndef CARIBOUCPIXMAP_H
#define CARIBOUCPIXMAP_H

#include <caribou++/cobject.h>
#include <caribou++/csize.h>
#include <caribou++/crect.h>

namespace CARIBOU
{
	/** Defines XPixmap storage class. */

	class CPixmap : public CObject
	{
		public:
			CPixmap();
			CPixmap(const char* data[]);
			CPixmap(const CPixmap& other);
			virtual ~CPixmap();

			bool				load(const char* data[]);
			bool				valid()					{return mValid;}
			void				clear();

			inline int			width()					{return mWidth;}
			inline int			height()				{return mHeight;}
			CARIBOU::CSize		size()					{return CARIBOU::CSize(mWidth,mHeight);}
			CARIBOU::CRect		bounds()				{return CARIBOU::CRect(0,0,mWidth,mHeight);}
			inline int			colorCount()			{return mColorCount;}
			inline int			keyBytes()				{return mKeyBytes;}
			inline void*		pixels()				{return mPixels;}
			inline uint32_t*	colorMap()				{return mColorMap;}
			inline uint32_t		colorAt(int x,int y)	{return mColorMap[keyAt(x,y)];}
			uint32_t			keyAt(int x, int y);
			uint32_t*			colorsAt(int y);
			void				setKeyAt(int x, int y, uint32_t key);
			bool				stretch(CARIBOU::CSize size);
			CARIBOU::CSize		getStretch()			{return mStretch;}

		private:

			bool				stretchWidth(CARIBOU::CSize size);
			bool				stretchHeight(CARIBOU::CSize size);
			uint32_t			getSavedKeyAt(int x, int y);
			inline int			pixelBufferSize()		{return (mWidth*mHeight)*mKeyBytes;}
			inline uint8_t		toUpper(uint8_t c)		{return (c>='a'&&c<='z')?c-' ':c;}
			inline uint8_t		isHex(uint8_t c)		{return (c>='0'&&c<='9')||(toUpper(c)>='A'&&toUpper(c)<='F');}
			inline bool			isNumber(char c)		{return (c>='0') && (c<='9');} 
			inline bool			isWhite(char c)			{return (c<=' ') || (c>'~');}
			inline bool			eof()					{return *mPtr=='\0';}
			inline void			spanWhite()				{while( !eof() && isWhite(*mPtr) ) ++mPtr;}
			bool				readInt(int* i);					/* read an integer from raw data */
			bool				parseHexNibble(uint8_t* nibble);	/* parse ascii hex to a byte */
			bool				parseHexByte(uint8_t* byte);		/* parse ascii hex to a byte */
			void				transposePixels();					/* transpose the pixels in the raw buffer to the pixel buffer */
			bool				parseColor(uint32_t* color);		/* parse a single color table entry */
			bool				readColorMap();						/* Read in the color table */
			int					keyOffset(register uint8_t* sym);

			bool				mValid;								/* the XPM image is valid */
			int					mWidth;								/* the width of the XPM in pixels */
			int					mHeight;							/* the height of the XPM in pixels */
			int					mColorCount;						/* number of colors in the color table */
			int					mKeyBytes;							/* number of bytes in the index key */
			void*				mPixels;							/* the internally translated pixel data */
			uint32_t*			mColorMap;							/* the color map */
			const char**		mRaw;								/* the raw XBM text base pointer */
			const char*			mPtr;								/* the raw XPM text parser pointer */
			void*				mSavedPixels;						/* store pixels when transforming */
			int					mSavedWidth;
			int					mSavedHeight;
			uint32_t*			mRowBuffer;							/* a row of colors */
			CARIBOU::CSize		mStretch;							/* the stretch factor */
	};
}

#endif

