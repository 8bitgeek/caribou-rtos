/******************************************************************************
* Copyright © 2021 by Pike Aerospace Research Corporation
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
#ifndef CARIBOU_CDIR_H
#define CARIBOU_CDIR_H

#include <caribou++/cobject.h>
#include <caribou++/clist.h>
#include <caribou++/cstring.h>
#include <caribou++/cfileinfo.h>
#include <caribou++/clist.h>
#include <diskio.h>
#include <ff.h>

namespace CARIBOU
{
	class CDir : public CObject
	{
		public:

			CDir(CString path="");
			virtual ~CDir();

			CString		path() {return m_path;}
			bool 		open();
			CFileInfo 	findfirst(CString pattern);
			CFileInfo	findnext();
			void 		close();
			bool 		ulink(CString pattern);
			CList<CFileInfo>	list(CString pattern);

		private:
		
			CARIBOU::CString	m_path;
			FRESULT 			m_res;
			DIR 				m_dir;
			FILINFO 			m_fno;
	};
}

#endif
