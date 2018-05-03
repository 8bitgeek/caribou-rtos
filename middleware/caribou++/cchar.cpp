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
#include <caribou++/cchar.h>

namespace CARIBOU
{
	CChar::CChar()
	: mChar(0)
	{
	}

	CChar::CChar(const uint16_t ch)
	: mChar(ch)
	{
	}

	CChar::CChar(const CChar& other)
	{
		mChar = other.mChar;
	}

	CChar::~CChar()
	{
	}

	char CChar::toAscii()
	{
		if (mChar > 0xFF)
			return 0x7F;
		return static_cast<char>(mChar&0xFF);
	}

	uint16_t CChar::toUnicode()
	{
		return mChar;
	}

	uint16_t CChar::raw()
	{
		return mChar;
	}

	CChar& CChar::operator=(const CChar& other)
	{
		mChar = other.mChar;
	}

	bool CChar::operator==(const CChar& other)
	{
		return mChar == other.mChar;
	}

	bool CChar::operator!=(const CChar& other)
	{
		return mChar != other.mChar;
	}

	bool CChar::operator<(const CChar& other)
	{
		return mChar < other.mChar;
	}

	bool CChar::operator>(const CChar& other)
	{
		return mChar > other.mChar;
	}

	bool CChar::operator<=(const CChar& other)
	{
		return mChar <= other.mChar;
	}

	bool CChar::operator>=(const CChar& other)
	{
		return mChar >= other.mChar;
	}

	CChar& CChar::operator=(const uint16_t& other)
	{
		mChar = other;
	}

	bool CChar::operator==(const uint16_t& other)
	{
		return (mChar == other);
	}

	bool CChar::operator!=(const uint16_t& other)
	{
		return (mChar != other);
	}

	bool CChar::operator<(const uint16_t& other)
	{
		return (mChar < other);
	}

	bool CChar::operator>(const uint16_t& other)
	{
		return (mChar > other);
	}

	bool CChar::operator<=(const uint16_t& other)
	{
		return (mChar <= other);
	}

	bool CChar::operator>=(const uint16_t& other)
	{
		return (mChar >= other);
	}

}
