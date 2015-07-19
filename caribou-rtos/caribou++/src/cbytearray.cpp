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
#include <caribou/lib/heap.h>
#include <caribou++/cbytearray.h>

#define	P_16							0xA001			/** 16 bit polynomial for CRC gen */

namespace CARIBOU
{
	CByteArray::CByteArray()
	: m_data(NULL)
	, m_size(0)
	{
	}

	CByteArray::CByteArray(size_t size)
	: m_data(NULL)
	, m_size(0)
	{
		resize(size);
		if ( m_data )
		{
			memset(m_data,0,m_size);
		}
	}

	CByteArray::CByteArray(const char* src, size_t size)
	: m_data(NULL)
	, m_size(0)
	{
		if ( src != NULL )
		{
			copy(src,size);
		}
	}

	CByteArray::CByteArray(const CByteArray& other)
	: m_data(NULL)
	, m_size(0)
	{
		copy(other.m_data,other.m_size);
	}

	CByteArray::~CByteArray()
	{
		clear();
	}

	void CByteArray::clear()
	{
		if ( m_data )
		{
			free(m_data);
			m_data=NULL;
		}
		m_size=0;
	}

	bool CByteArray::operator==( const char* other )
	{	
		CByteArray p(other,length());
		return *this == p;
	}

	bool CByteArray::operator==( const CByteArray& other )
	{	
		CByteArray* p = (CByteArray*)&other;
		bool rc=true;
		if ( &other != this )
		{
			if ( p->length() == length() )
			{
				for(int n=0; rc && n < length(); n++)
				{
					if ( at(n) != p->at(n) )
					{
						rc=false;
					}
				}
			}
			else
			{
				rc=false;
			}
		}
		return rc;
	}

	bool CByteArray::append(char src)
	{
		return append(&src, 1);
	}

	bool CByteArray::append(CByteArray& other)
	{
		return append(other.data(),other.size());
	}

	bool CByteArray::append(const char* src, size_t size)
	{
		bool rc=false;
		m_data = (char*)realloc(m_data,m_size+size);
		if ( m_data )
		{
			memcpy(&(m_data[m_size]),src,size);
			m_size+=size;
			rc=true;
		}
		else
		{
			m_size=0;
		}
		return rc;
	}

	bool CByteArray::copy(const char* src, size_t size)
	{
		if ( resize(size) == size )
		{
			set(0,src,size);
			return true;
		}
		return false;
	}

	bool CByteArray::copy(const CByteArray& other)
	{
		CByteArray* p = (CByteArray*)&other;
		return copy(p->data(),p->size());
	}

	size_t CByteArray::resize(size_t size)
	{
		if ( size > 0 )
		{
			if ( size != m_size)
			{
				m_data=(char*)realloc(m_data,size);
				if ( m_data )
				{
					m_size = size;
				}
				else
				{
					m_size=0;
				}
			}
		}
		else
		{
			clear();
		}
		return m_size;
	}

	CByteArray& CByteArray::set(size_t index, const char* src, size_t size)
	{
		if ( m_data && index < m_size )
		{
			memcpy(&(m_data[index]),src,size);
		}
		return *this;
	}

	/**
	** @brief Set a byte in memory checking for valid bounds.
	*/
	char CByteArray::set(size_t index, uint8_t data)
	{
		char rc=data;
		if ( index >= 0 && index < size() )
		{
			m_data[index]=data;
		}
		else
		{
			rc = 0;
		}
		return rc;
	}


	/**
	* @brief fill with byte.
	*/
	CByteArray& CByteArray::fill(char ch)
	{
		if ( m_size )
		{
			memset(&m_data[0],ch,m_size);
		}
		return *this;
	}

	/**
	* @brief Prepend a number of bytes to the beginning of the array.
	* @param data The bytes to prepend.
	* @param size The number of bytes to prepend
	*/
	bool CByteArray::prepend(const char* data, size_t size)
	{
		size_t t = m_size;
		if ( resize( t + size ) && m_data )
		{
			memmove( &m_data[size], &m_data[0], t );
			memcpy(&m_data[0],data,size);
			return true;
		}
		return false;
	}

	bool CByteArray::prepend(char src)
	{
		return prepend(&src, 1);
	}

	/**
	* @brief Remove a byte from the array. The following bytes are shifted left.
	* @param index The index of the byte to remove.
	* @param len the number of bytes to remove
	*/
	CByteArray& CByteArray::remove(size_t index,size_t len)
	{
		if ( index+len <= size() )
		{
			for(int n=0; n < len; n++)
			{
				memmove( &data()[index], &data()[index+1], size()-(index+1) );
			}
			resize(size()-len);
		}
		return *this;
	}

	/**
	* @brief Insert a byte at the specified pos.
	*/
	bool CByteArray::insert(char ch, size_t pos)
	{
		return insert(&ch,pos,1);
	}

	/**
	* @brief Insert a copy of piece of memory
	*/
	bool CByteArray::insert(char* ch, size_t pos, size_t len)
	{
		if ( len > 0 )
		{
			int prev = m_size;
			if ( resize(m_size+len) )
			{
				if ( prev )
					memmove( &m_data[pos+len], &m_data[pos], prev-pos );
				memmove( &m_data[pos], ch, len);
				return true;
			}
		}
		return false;
	}

	/**
	* @brief Return the charactwer at the index position and then remove the character from the array.
	* @return the character at the index position of -1 if out of range.
	*/
	int CByteArray::take(size_t index)
	{
		int ch=(-1);
		if ( index < length() )
		{
			ch=at(index);
			remove(index);
		}
		return ch;
	}

	size_t CByteArray::length()
	{
		return m_size;
	}

} /* namespace PikeAero */
