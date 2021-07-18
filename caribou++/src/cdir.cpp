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
#include <caribou++/cdir.h>
#include <caribou/lib/string.h>

namespace CARIBOU
{
	#define inherited CObject

	CDir::CDir(CString path)
	: inherited()
	, m_path(path)
	{
	}

	CDir::~CDir()
	{
	}
	
	bool CDir::open()
	{
		m_res = f_opendir( &m_dir, m_path.data() );
		return m_res == FR_OK;
	}

	CFileInfo CDir::findfirst(CString pattern)
	{
		m_res = f_findfirst( &m_dir, &m_fno, m_path.data(), pattern.data() );
		return CFileInfo( &m_fno );
	}

	CFileInfo CDir::findnext()
	{
		m_res = f_findnext( &m_dir, &m_fno );
		return CFileInfo( &m_fno );
	}

	void CDir::close()
	{
		f_closedir( &m_dir );
	}

	bool CDir::ulink(CString pattern)
	{
		CARIBOU::CList<CARIBOU::CFileInfo> fl = list(pattern);
		for(size_t n=0; m_res == FR_OK && n < fl.count(); n++)
		{
			CARIBOU::CFileInfo fi = fl.at(n);
			if ( !fi.is_null() )
			{
				m_res = f_unlink(fi.fname().data());
			}
		}
		return m_res == FR_OK;
	}

	CList<CFileInfo> CDir::list(CString pattern)
	{
		CList<CFileInfo> fl;
		CFileInfo fi = findfirst(pattern);
		while ( !fi.is_null() )
		{
			fl += fi;
			fi = findnext();
		}
		close();
		return fl;
	}


}