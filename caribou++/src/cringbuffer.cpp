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
#include <caribou++/cringbuffer.h>

namespace CARIBOU {

	#define inherited CByteArray

	CRingBuffer::CRingBuffer()
	: inherited()
	, mHead(0)
	, mTail(0)
	, mOverflow(0)
	{
	}

	CRingBuffer::~CRingBuffer()
	{
	}

	/**
	* @brief resize taking into account existing data. If resizing smaller, data may be lost.
	* @return a self reference
	*/
	size_t CRingBuffer::resize(size_t size)
	{
		if ( !empty() )
		{
			CByteArray t;						/* temporary storage for the current queue data */
			while (!empty())
			{
				t.append(remove());				/* empty out the queue into temp buffer */
			}
			inherited::resize(size);			/* perform the resize operation */
			for(size_t n=0; n < t.size(); n++)
			{
				set(n,t.at(n));					/* put the ring buffer data back */
			}
			mTail=0;							/* reset the head and tail pointers */
			mHead=t.size();
		}
		else
		{

			mHead=mTail=mOverflow=0;
			inherited::resize(size);
		}
		return inherited::size();
	}

	/**
	* @brief insert a character into the ring buffer, advancing the head.
	* @return 1 if there was room, else 0
	*/
	size_t CRingBuffer::insert(uint8_t ch)
	{
		if ( !full() )
		{
			data()[mHead] = ch;
			if ( ++mHead >= size() )
			{
				mHead = 0;
			}
			return 1;
		}
		++mOverflow;
		return 0;
	}

	/**
	* @brief insert a character into the ring buffer, advancing the head.
	* @return 1 if there was room, else 0
	*/
	size_t CRingBuffer::insert(CByteArray& bytes)
	{
		register size_t size=0;
		register size_t len = bytes.length();
		for(register size_t n=0; n < len; n++)
		{
			size += insert(bytes.at(n));
		}
		return size;
	}

	/**
	* @brief Peek at the next character in the ring buffer but do not remove it.
	* @return the character.
	*/
	uint8_t CRingBuffer::peek()
	{
		uint8_t ch;
		ch = data()[mTail];
		return ch;
	}

	/**
	* @brief Remove the next character from the ring buffer.
	* @return the character
	*/
	uint8_t CRingBuffer::remove()
	{
		if ( length() > 0 )
		{
			uint8_t ch;
			ch = data()[mTail];
			if ( ++mTail >= size() )
			{
				mTail = 0;
			}
			return ch;
		}
		return '\0';
	}

	/**
	* @brief Remove the next character from the ring buffer and insert a new one.
	* @return the removed character
	*/
	uint8_t CRingBuffer::remove(uint8_t ch)
	{
		uint8_t out = remove();
		insert(ch);
		return out;
	}

	/**
	* @brief Determin the length of the data contained in the ring buffer taking wrap around into account.
	* @return The length of the contents of the ring buffer.
	*/
	size_t CRingBuffer::length()
	{
		if ( mHead > mTail )
		{
			return mHead-mTail;
		}
		else if ( mHead < mTail )
		{
			return (size()-mTail)+mHead;
		}
		return 0;
	}

	/**
	* @brief Convert the contents of the ring buffer into a byte array in the order
	* the bytes where recieved.
	*/
	CByteArray CRingBuffer::toByteArray()
	{
		CByteArray rc;
		int nLength = length();
		int nByte=0;
		size_t idx = mTail;
		while(nByte < nLength)
		{
			if ( idx >= size() )
				idx = 0;
			rc.append( data()[idx++] );
			++nByte;
		}
		return rc;
	}

}
