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
#ifndef CARIBOU_CMAP_H
#define CARIBOU_CMAP_H

#include "cobject.h"

namespace CARIBOU {

	/**
	 ** Keys must implement the =, ==, >, < operators.
	 */
	template <class K,class T> class CMap
	{
		public:
			CMap();
			CMap(const CMap<K,T>& other);
			~CMap();

			void							clear();
			void							clear(K key);
			void							dispose();
			void							dispose(K key);
			bool							append(K key, T data);
			int32_t							indexOf(K key);
			const K							at(uint32_t index);
			const T							dataAt(uint32_t index);
			const T							data(K key);
			bool							insert(K key, T data,int index);
			CMap<K,T>&						set(K key, T data);
			const T							take(uint32_t index);
			inline uint32_t					count()	{return mSize;}
			inline uint32_t					size()	{return mSize;}
			bool							isNull();
			bool							isEmpty();

			CMap<K,T>&						operator=( const CMap<K,T>& other );

		protected:
			uint32_t						resize(uint32_t size);
			typedef struct {
				K			key;			// the key
				T			data;			// list of data items
			} map_t;
			uint32_t						mSize;
			map_t**							mMap;
		private:

			/// @brief COmpare two keys.
			int compare(K a, K b)
			{
				if ( a == b ) return 0;
				if ( a > b ) return 1;
				if ( a < b ) return -1;
			}

			/// @brief Swap two key/data pair positions.
			/// @param a The index of key/data pair A.
			/// @param b The index of key/data pair B.
			void swap(int a, int b)
			{
				map_t* t = mMap[a];
				mMap[a] = mMap[b];
				mMap[b] = t;
			}

			/// @brief Sort the array if key/data pairs by the keys.
			void sort()
			{
				if (mSize > 1 )
				{
					int a,b;
					int deltaA;
					for(a=0; a < mSize-1; a++)
					{
						deltaA=a;
						for(b=a+1; b < mSize; b++)
						{
							if ( compare(mMap[deltaA]->key,mMap[b]->key) > 0 )
							{
								deltaA=b;
							}
						}
						swap(a,deltaA);
					}
				}
			}

			/// @brief Extract the approximate midpoint between min and max.
			/// @param imin The minimum index point.
			/// @param imax The maximum index point.
			int midpoint(int imin, int imax)
			{
				int delta = (imax-imin)/2;
				int mid = imin + delta;
				return mid;
			}

			/// @brief Perform a a binary key search in the sorted array of key/value pairs.
			/// @param key The key to search for.
			/// @param imin The minimum index.
			/// @param imax The maximum index.
			/// @return The index of the key found.
			int bsearch(K& key, int imin, int imax)
			{
				while (imax >= imin)					// Empty search set?
				{
					int imid = midpoint(imin, imax);	// Extract the midpoint..
					map_t* map = mMap[imid];
					if (map->key < key)					// Which way?
						imin = imid + 1;				// Upper subarray
					else if (map->key > key)
						imax = imid - 1;				// Lower subarray
					else
						return imid;					// Found.
				}
				return -1;
			}
	};

} /* namespace CARIBOU */

/*****************************************************************
** The .cpp portion
*****************************************************************/

namespace CARIBOU
{

	template <class K, class T> CMap<K,T>::CMap()
	 : mSize(0)
	 , mMap(NULL)
	{
	}

	template <class K, class T> CMap<K,T>::CMap(const CMap<K,T>& other)
	 : mSize(0)
	 , mMap(NULL)
	{
		CMap<K,T>* p = (CMap<K,T>*)&other;
		for(int n=0; n < p->size(); n++)
		{
			K otherK = p->at(n);
			T otherT = p->data( otherK );
			append(otherK,otherT);
		}
	}

	template <class K, class T> CMap<K,T>::~CMap()
	{
		clear();
	}

	template <class K, class T> CMap<K,T>& CMap<K,T>::operator=( const CMap<K,T>& other )
	{
		CMap<K,T>* pother = (CMap<K,T>*)&other;
		clear();
		for(int n=0; n < pother->size(); n++)
		{
			K otherK = pother->at(n);
			T otherT = pother->data( otherK );
			append(otherK,otherT);
		}
		return *this;
	}

	/**
	* @brief free storage
	*/
	template <class K, class T> void CMap<K,T>::clear()
	{
		if ( mMap != NULL )
		{
			for(int n=0; n < mSize; n++)
			{
				free(mMap[n]);
			}
			free(mMap);

		}
		mSize=0;
	}

	/**
	* @brief free storage
	*/
	template <class K, class T> void CMap<K,T>::clear(K key)
	{
		int k = indexOf(key);
		if ( k >= 0 )
		{
			take(k);
		}
	}

	/**
	* @brief Call the destructors on the elements - does not free the storage.
	*/
	template <class K, class T> void CMap<K,T>::dispose()
	{
		for(int k=0;k<mSize;k++)
		{
			map_t* map = mMap[k];
			delete map->data;
		}
	}

	/**
	* @brief Call the destructors on the elements - does not free the storage.
	*/
	template <class K, class T> void CMap<K,T>::dispose(K key)
	{
		int k = indexOf(key);
		if ( k>=0 )
		{
			map_t* map = mMap[k];
			delete map->data;
		}
	}

	template <class K, class T>  bool CMap<K,T>::append(K key, T data)
	{
		int32_t k = indexOf(key);
		if ( 1 /* k < 0 */ )
		{
			uint32_t t;
			if ( ( t = resize(size()+1) ) )
			{
				map_t* map;
				if ( ( map = (map_t*)malloc(sizeof(map_t)) ) )
				{
					mMap[t-1] = map;
					map->key = key;
					map->data = data;
					sort();
					return true;
				}
			}
		}
		return false;
	}

	template <class K, class T>  uint32_t CMap<K,T>::resize(uint32_t size)
	{
	    if ( size > 0 )
	    {
	        if ( size != count() )
	        {
                mMap = static_cast<map_t**>(realloc(mMap,(mSize=size)*sizeof(map_t*)));
                if ( mMap )
                {
                    return count();
                }
                mSize=0; // alloc failed, don't try to dealloc what's no longer allocated.
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

	/// @brief Performa key search and retrieve the index of a map record based on the given key.
	/// @param key The key to search for.
	/// @return The index of the key.
	template <class K, class T>  int32_t CMap<K,T>::indexOf(K key)
	{
		return bsearch(key,0,mSize-1);
	}

	/// @brief Perform a data lookup with a given key.
	/// @param key The key to search for.
	/// @return A copy of the data.
	template <class K, class T>  const T CMap<K,T>::data(K key)
	{
		T t_empty;
		int k = indexOf(key);
		if ( k >= 0 )
		{
			map_t* map = mMap[k];
			return map->data;
		}
		return t_empty;
	}

	/// @brief Perform a data lookup with a given key.
	/// @param key The key to search for.
	/// @return A copy of the data.
	template <class K, class T>  const T CMap<K,T>::dataAt(uint32_t index)
	{
		T t_empty;
		if ( index < size() )
		{
			map_t* map = mMap[index];
			return map->data;
		}
		return t_empty;
	}

	/// @brief Retrieve the key at the given index.
	template <class K, class T>  const K CMap<K,T>::at(uint32_t index)
	{
		if (index < size())
		{
			return mMap[index]->key;
		}
		return (const K)NULL; 
	}

	template <class K, class T> bool CMap<K,T>::insert(K key, T data,int index)
	{
		if(index>=0&&index<=count())
		{
			if ( resize(size()+1) )
			{
                for(int n=index; n < size()-1; n++)
                {
                    mMap[n+1] = mMap[n];
                }
                if ( ( mMap[index] = (map_t*)malloc(sizeof(map_t)) ) )
				{
					mMap[index]->key=key;
					mMap[index]->data=data;
					sort();
					return true;
				}
			}
		}
		else if ( index == count() )
		{
		    return append(key,data);
		}
		return false;
	}

	template <class K, class T> CMap<K,T>& CMap<K,T>::set(K key, T data)
	{
		int k = indexOf(key);
		if ( k >= 0 )
		{
			map_t* map = mMap[k];
			map->data = data;
		}
		else
		{
			append(key,data);
		}
		return *this;
	}

	template <class K, class T> const T CMap<K,T>::take(uint32_t index)
	{
		if (index < size() )
		{
			map_t* map = mMap[index];
			T data = map->data;
			free(map);
			for(uint32_t i=index; i < (size()-1); i++)
			{
				mMap[i] = mMap[i+1];
			}
			resize(size()-1);
			return data;
		}
		return NULL;
	}


	template <class K, class T> bool CMap<K,T>::isNull()
	{
		return mMap==NULL;
	}

	template <class K, class T> bool CMap<K,T>::isEmpty()
	{
		return isNull() || count()==0;
	}


} /* namespace CARIBOU */

#endif
