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
#include <caribou++/cobjectlist.h>
#include <caribou/lib/string.h>

namespace CARIBOU {

	CObjectList::CObjectList()
	: CObject()
	, mObjectList(NULL)
	, mCount(0)
	, mAutoDelete(true)
	{
	}


	CObjectList::CObjectList(size_t size)
	: CObject()
	, mObjectList(NULL)
	, mCount(0)
	, mAutoDelete(true)
	{
		resize(size);
	}


	CObjectList::~CObjectList()
	{
		clear();
	}

	void CObjectList::clear()
	{
		if ( autoDelete() && count() > 0 )
		{
			for( uint32_t n=0; n < count(); n++ )
			{
				if ( mObjectList[n] != NULL )
					delete mObjectList[n];
				mObjectList[n]=NULL;
			}
			free(mObjectList);
			mObjectList=NULL;
		}

	}

	CObject* CObjectList::at(uint32_t n)
	{
		if ( n < count() )
		{
			CObject* object = mObjectList[n];
			return object;
		}
		return NULL;
	}

	void CObjectList::set(uint32_t n,CObject* obj)
	{
		if ( n < count() )
		{
			mObjectList[n]=obj;
		}
	}


	/** find an object by pointer value and return it's index */
	int32_t CObjectList::indexOf(const CObject* object)
	{
		if ( object != NULL )
		{
			for( uint32_t n=0; n < count(); n++ )
			{
				if ( mObjectList[n] == object )
				{
					return n;
				}
			}
		}
		return -1;
	}

	/** Append an object to the list */
	CObjectList& CObjectList::append(const CObject* object)
	{
		mObjectList = (CObject**)realloc( mObjectList, ( mCount + 1 ) * sizeof(CObject*) );
		if ( mObjectList != NULL )
		{
			mObjectList[mCount++] = (CObject*)object;
		}
		return *this;
	}

	/** Remove an object from the list */
	CObjectList& CObjectList::remove(int i)
	{
		if ( i >= 0 && i < mCount)
		{
			memmove( &mObjectList[i], &mObjectList[i+1], ( mCount - i ) * sizeof(CObject*) );
			mObjectList = (CObject**)realloc( mObjectList, (mCount--) * sizeof(CObject*) );
		}
		return *this;
	}


	/** Remove an object from the list */
	CObjectList& CObjectList::remove(const CObject* object)
	{
		int32_t i = indexOf( object );
		remvoe(i);
		return *this;
	}

	/** Insert an object into the list */
	CObjectList& CObjectList::insert(const CObject* object, int32_t pos)
	{
		if ( pos < 0 || pos >= mCount )
		{
			mObjectList = (CObject**)realloc( mObjectList, ( mCount + 1 ) * sizeof(CObject*) );
			memmove( &mObjectList[pos], &mObjectList[pos+1], ((mCount++) - pos) * sizeof(CObject*)  );
		}
		else
		{
			return append( object );
		}
		return *this;
	}

	/** Resize and fill void with null */
	CObjectList& CObjectList::resize(size_t size)
	{
		/** FIXME - need to handle the getting smaller case? */
		size_t diff = size-mCount;
		for(size_t n=0; n < diff; n++)
		{
			append(NULL);
		}
	}

} /* namespace PikeAero */
