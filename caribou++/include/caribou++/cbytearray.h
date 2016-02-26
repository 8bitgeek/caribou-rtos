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
#ifndef _CARIBOU_CBYTEARRAY_H_
#define _CARIBOU_CBYTEARRAY_H_

#include <caribou/lib/string.h>

namespace CARIBOU
{

	class CByteArray
	{
		public:
			CByteArray();
			CByteArray(size_t size);
			CByteArray(const char* data, size_t size);
			CByteArray(const CByteArray& other);
			virtual ~CByteArray();

			virtual void			clear();
			virtual size_t			resize(size_t size);
			virtual int				take(size_t index);
			virtual size_t			length();

			bool					copy(const CByteArray& other);
			bool					copy(const char* src, size_t size);
			bool					append(CByteArray& other);
			bool					append(const char* src, size_t size);
			bool					append(char src);
			bool					prepend(const char* src, size_t size);
			bool					prepend(char src);
			CByteArray&				remove(size_t index,size_t len=1);
			bool					insert(char* ch, size_t pos, size_t len);
			bool					insert(char ch, size_t pos);
			CByteArray&				set(size_t index, const char* src, size_t size);
			char					set(size_t index, uint8_t data);
			CByteArray&				fill(char ch);
			virtual int				find( char ch, int index=0);

			size_t					size()										{return m_size;}
			char					at(size_t index)							{return m_data[index];}
			char*					data()										{return m_data;}
			char*					data(size_t idx)							{return idx<m_size ? &m_data[idx] : NULL;}

			virtual bool			isNull()									{return m_data==NULL;}
			virtual bool			isEmpty()									{return isNull() || length()==0;}

			uint8_t					nibble(uint8_t asciiChar);
			CByteArray&				fromAsciiHex(const char* asciiHex,size_t size);

			bool					operator!=( const CByteArray& other )		{return !(*this == other);}
			bool					operator==( const CByteArray& other );
			bool					operator==( const char* other );
			CByteArray&				operator=( const CByteArray& other )		{copy(other); return *this;}
			CByteArray&				operator+=( CByteArray &other )				{append(other); return *this;}
			char					operator[]( int n )							{return at(n);}


		protected:
			size_t					m_size;
			char*					m_data;

	};

} /* namespace CARIBOU */

#endif
