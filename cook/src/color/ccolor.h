/******************************************************************************
* Copyright © 2014 by Pike Aero Corp
* All Rights Reserved
******************************************************************************/
#ifndef _CARIBOU_COLOR_H_
#define _CARIBOU_COLOR_H_

#include <caribou++.h>

namespace MineAirQuality
{
	class CColor
	{
		public:

			typedef struct
			{
				uint8_t	blue;
				uint8_t	green;
				uint8_t	red;
				uint8_t alpha;
			} pixel_t;

			typedef union
			{
					pixel_t	pixel;
					uint32_t color;
			} color_t;

			enum
			{
				Black=	0x00000000,
				Blue=	0x000000FF,
				Green=	0x0000FF00,
				Red=	0x00FF0000,
				White=	0x00FFFFFF,
                Grey=	0x00EAEAEA,
				Yellow=	0x00E8E294,
				GayPink=0x00F5C3F7,
			};

			CColor();
			
			CColor(const CColor& other)
			{
				copy(other);
			}

			CColor(uint32_t color)
			{
				mColor.color = color;			
			}

			CColor(uint8_t red, uint8_t green, uint8_t blue)
			{
				mColor.pixel.red	= red;
				mColor.pixel.green	= green;
				mColor.pixel.blue	= blue;
			};
			
			virtual ~CColor();

			inline uint32_t				color() 
										{
											return mColor.color;
										}

			inline void					copy(const CColor& other)
										{
											mColor.color = other.mColor.color;
										}

			CColor&						operator=( const CColor& other ) 
										{
											mColor.color = other.mColor.color;
											return *this;
										}

			CColor&						operator=( const uint32_t& color ) 
										{
											mColor.color = color;
											return *this;
										}

			bool						operator==( const CColor& other )
										{
											return (mColor.color == other.mColor.color);
										}

			bool						operator==( const uint32_t& color )
										{
											return (mColor.color == color);
										}

			inline void					setRGB(uint8_t red, uint8_t green, uint8_t blue)
										{
											mColor.pixel.red = red;
											mColor.pixel.green = green;
											mColor.pixel.blue = blue;
										}

			inline uint8_t				red()	{return mColor.pixel.red;}
			inline uint8_t				green()	{return mColor.pixel.green;}
			inline uint8_t				blue()	{return mColor.pixel.blue;}

			inline uint8_t				r()	{return red();}
			inline uint8_t				g()	{return green();}
			inline uint8_t				b()	{return blue();}

			static CColor&				stockBlack()	{return mBlack;}
			static CColor&				stockBlue()		{return mBlue;}
			static CColor&				stockGreen()	{return mGreen;}
			static CColor&				stockRed()		{return mRed;}
			static CColor&				stockWhite()	{return mWhite;}
			static CColor&				stockGrey()		{return mGrey;}
			static CColor&				stockYellow()	{return mYellow;}
			static CColor&				stockGayPink()	{return mGayPink;}

		protected:

		private:
			static CColor				mBlack;
			static CColor				mBlue;
			static CColor				mGreen;
			static CColor				mRed;
			static CColor				mWhite;
			static CColor				mGrey;
			static CColor				mYellow;
			static CColor				mGayPink;

			color_t						mColor;

	};
}

#endif /* _CARIBOU_WIDGET_H_ */
