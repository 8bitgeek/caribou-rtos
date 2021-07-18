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
#ifndef CARIBOU_CFILEINFO_H
#define CARIBOU_CFILEINFO_H

#include <caribou++/cobject.h>
#include <caribou++/clist.h>
#include <caribou++/cstring.h>
#include <diskio.h>
#include <ff.h>

namespace CARIBOU
{
	class CFileInfo 
	{
		public:

			CFileInfo(const FILINFO* fil)
                            { memcpy(&m_fil,fil,sizeof(m_fil)); }


			CFileInfo(const CFileInfo& other)
                            { memcpy(&m_fil,&other.m_fil,sizeof(m_fil)); }

			~CFileInfo() {}

			CFileInfo&	operator =  (const CFileInfo& other)
                            { memcpy(&m_fil,&other.m_fil,sizeof(m_fil)); return *this; }

            bool        is_null()   {return m_fil.fname[0]=='\0';}
            FSIZE_t     fsize()     {return m_fil.fsize;}
            WORD        fdata()     {return m_fil.fdate;}
            WORD        ftime()     {return m_fil.ftime;}
            BYTE        fattrib()   {return m_fil.fattrib;}
			CString		fname()     {return CString((char*)m_fil.fname);}

		private:
		
			FILINFO m_fil;
	};
}

#endif
