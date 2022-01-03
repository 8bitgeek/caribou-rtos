/******************************************************************************
* Copyright © 2014 by Pike Aero Corp
* All Rights Reserved
******************************************************************************/
#include <ccolor.h>

namespace PikeAero
{
	CColor		CColor::mBlack(CColor::Black);
	CColor		CColor::mBlue(CColor::Blue);
	CColor		CColor::mGreen(CColor::Green);
	CColor		CColor::mRed(CColor::Red);
	CColor		CColor::mWhite(CColor::White);
	CColor		CColor::mGrey(CColor::Grey);
	CColor		CColor::mYellow(CColor::Yellow);
	CColor		CColor::mGayPink(CColor::GayPink);

	CColor::CColor()
	{
		mColor.color=0;
	}

	CColor::~CColor()
	{
	}

}
