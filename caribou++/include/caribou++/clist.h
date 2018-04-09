/******************************************************************************
* Copyright © 2005-2012 by Pike Aerospace Research Corporation
* All Rights Reserved
*
*   This file is part of CARIBOU RTOS
*
*   DaddyBASIC is free software: you can redistribute it and/or modify
*   it under the terms of the Beerware License Version 43.
*
* ----------------------------------------------------------------------------
* "THE BEER-WARE LICENSE" (Revision 43):
* <mike@pikeaero.com> wrote this file. As long as you retain this notice you
* can do whatever you want with this stuff. If we meet some day, and you think
* this stuff is worth it, you can buy me a beer in return ~ Mike Sharkey
* ----------------------------------------------------------------------------
******************************************************************************/
#ifndef _CARIBOU_CLIST_H_
#define _CARIBOU_CLIST_H_

#include <caribou++/cobject.h>

namespace CARIBOU {

	/**
	** List template class
	** @author Mike Sharkey <mike@pikeaero.com>
	*/
	template <class T> class CList
	{
		public:
			CList();
			CList(const CList<T>& other);
			virtual ~CList();

			CList<T>&						operator=( const CList<T>& other )		
											{
												copy(other); 
												return *this;
											}

			CList<T>&						operator+=( const CList<T>& other )
											{
												for(int n=0; n < other.count; n++)
												{
													append(other.at(n));
												}
												return *this;
											}

			CList<T>&						operator+=( const T data )
											{
												append(data);
												return *this;
											}

			void							copy(const CList<T>& other);

			virtual void					clear();
			void							dispose();

			uint32_t						resize(uint32_t size);
			bool							append(const T data);
			bool							append( const CList<T>& other )
											{
												bool rc = true;
												for( int n=0; rc && n < other.count(); n++ )
												{
													rc = append(other.at(n));
												}
												return rc;
											}
			bool							insert(T data,int index=-1);
			CList<T>&						set(uint32_t index, T data);

			const T							at(uint32_t index) const;
			const T							take(uint32_t index) const;
			const T							takeFirst();
			const T							takeLast();
			const int32_t					indexOf(const T data) const;

			inline uint32_t					count() const	{return mSize;}
			inline uint32_t					size()	const	{return mSize;}
			T*								data();

			bool							isNull();
			bool							isEmpty();

		protected:
			uint32_t						mSize; /* FIXME temprarily public for debugging */
			T*								mData;
	};

} /* namespace CARIBOU */

/*****************************************************************
** The .cpp portion
*****************************************************************/

namespace CARIBOU
{

	template <class T> CList<T>::CList()
	: mSize(0)
	, mData(NULL)
	{
	}

	template <class T> CList<T>::CList(const CList<T>& other)
	: mSize(0)
	, mData(NULL)
	{
		if ( other.mSize )
		{
			CList<T>* p = (CList<T>*)&other;
			mData = static_cast<T*>(malloc(other.mSize*sizeof(T)));
			if (mData)
			{
				mSize=other.mSize;
				#if 1
					for(int n=0; n < mSize; n++)
					{
						set(n,p->at(n));
					}
				#else
					memcpy(mData,other.mData,(mSize*sizeof(T)));
				#endif
			}
		}
	}

	template <class T> CList<T>::~CList()
	{
		clear();
	}

	template <class T> void CList<T>::copy(const CList<T>& other)
	{
		for(int n=0; n < other.mSize; n++)
		{
			append(other.mData[n]);
		}
	}

	template <class T> void CList<T>::clear()
	{
		if ( mData != NULL )
		{
			free(mData);
			mData=NULL;
		}
		mSize=0;
	}

	/**
	 ** @brief dispose of objects which where allocated with new operator.
	 */
	template <class T> void CList<T>::dispose()
	{
		for ( uint32_t i = 0; i < count(); i++ )
		{
			T t = at(i);
			if(t)
				delete t;
		}
	}

	template <class T> uint32_t CList<T>::resize(uint32_t size)
	{
		if ( size > 0 )
		{
			if ( size != count() )
			{
				T* pData = mData;
				mData = static_cast<T*>(realloc(mData,(mSize=size)*sizeof(T)));
				if ( mData )
				{
					return count();
				}
				mData = pData;
				clear(); // alloc failed, don't try to dealloc what's no longer allocated.
			}
			else
			{
				return count();
			}
		}
		else
		{
			clear();
		}
		return 0;
	}

	template <class T> bool CList<T>::append(const T data)
	{
		uint32_t t = resize(size()+1);
		if ( t )
		{
			set(t-1,data);
			return true;
		}
		return false;
	}

	template <class T> bool CList<T>::insert(T data,int index)
	{
		if(index>=0&&index<=count())
		{
			if ( resize(size()+1) )
			{
				for(int n=index; n < size()-1; n++)
				{
					mData[n+1] = mData[n];
				}
				mData[index]=data;
				return true;
			}
		}
		else if ( index == count() || index < 0 )
		{
			return append(data);
		}
		return false;
	}

	template <class T> CList<T>& CList<T>::set(uint32_t index, T data)
	{
		if ( index < count())
		{
			mData[index] = data;
		}
		return *this;
	}

	template <class T> const T CList<T>::at(uint32_t index) const
	{
		//if (index < mSize)
		//{
			return mData[index];
		//}
		//return NULL;
	}

	template <class T> const T CList<T>::take(uint32_t index) const
	{
		if (index < mSize )
		{
			const T val = mData[index];
			for(uint32_t i=index; i < (size()-1); i++)
			{
				mData[i] = mData[i+1];
			}
			CList<T>* p = (CList<T>*)this;
			p->resize(p->size()-1);
			return val;
		}
		else
		{
			return NULL;
		}
	}

	template <class T> const T CList<T>::takeLast()
	{
		if ( mSize )
		{
			return take(size()-1);
		}
		else
		{
			return NULL;
		}
	}

	template <class T> const T CList<T>::takeFirst()
	{
		if ( mSize )
		{
			return take(0);
		}
	}

	template <class T> const int32_t CList<T>::indexOf(const T data) const
	{
		for(uint32_t i=0; i < size(); i++)
		{
			if ( mData[i] == data )
			{
				return i;
			}
		}
		return -1;
	}

	template <class T> T* CList<T>::data()
	{
		return mData;
	}

	template <class T> bool CList<T>::isNull()
	{
		return mData==NULL;
	}

	template <class T> bool CList<T>::isEmpty()
	{
		return isNull() || count()==0;
	}


} /* namespace CARIBOU */

#endif
