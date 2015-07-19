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
#ifndef PIKEAEROCOBJECTLIST_H
#define PIKEAEROCOBJECTLIST_H

#include "cobject.h"

namespace CARIBOU
{
	/**
	** Implements a list of object pointers.
	** @author Michael Sharkey <mike@pikeaero.com>
	*/
	class CObjectList : public CObject
	{
		/** TODO - make these list classes templace classes */
		/** TODO - use const where applicable */
		/** TODO - test insert at end of list */
		public:
			CObjectList();
			CObjectList(size_t size);
			~CObjectList();

			virtual CObjectList&				append(const CObject* object);
			virtual CObjectList&				remove(const CObject* object);
			virtual CObjectList&				insert(const CObject* object, int32_t pos);
			virtual	CObjectList&				resize(size_t size);

			CObjectList&						operator+=(const CObject* object)	{return append(object);}
			CObjectList&						operator-=(const CObject* object)	{return remove(object);}
			CObject*							operator[](int n)					{return at(n);}

			int32_t								indexOf(const CObject* object);
			inline	uint32_t					count()								{return mCount;}
			CObject*							at(uint32_t n);
			void								set(uint32_t n,CObject* obj);

			void								setAutoDelete(bool autodelete)		{mAutoDelete=autodelete;}
			bool								autoDelete()						{return mAutoDelete;}
			void								clear();

		private:
			CObject**							mObjectList;
			uint32_t							mCount;
			bool								mAutoDelete;
	};

}

#endif
