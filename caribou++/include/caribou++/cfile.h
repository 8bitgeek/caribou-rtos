/******************************************************************************
* Copyright © 2005-2013 by Pike Aerospace Research Corporation
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
#ifndef CARIBOU_CFILE_H
#define CARIBOU_CFILE_H

#include <caribou++/cobject.h>
#include <caribou++/clist.h>
#include <caribou++/cbytearray.h>
#include <caribou++/cstring.h>
#include <caribou++/cmutex.h>
#include <diskio.h>
#include <ff.h>

namespace CARIBOU
{
	class CFile : public CObject
	{
		public:

			CFile();
			CFile(CString path);
			virtual ~CFile();

			FRESULT							stat(FILINFO* info);
			bool							isFile();
			bool							isDir();
			bool							mkDir();
			bool							rmDir();

			void							setPath(CString path);
			CARIBOU::CString				path();
			CARIBOU::CString				fileName();
			CARIBOU::CString				filePath() {return path();}

			bool							open(uint8_t mode);
			bool							open(CString path,uint8_t mode);
			bool							isOpen();
			void							close();

			int								read(void* buf,int sz);
			int								read(CARIBOU::CByteArray& buf,int sz);

			int								readline(CARIBOU::CByteArray& buf,int max);

			int								write(void* buf,int sz);
			int								write(CARIBOU::CByteArray& buf);

			int								seek(int pos);
			int								tell();

			int								size();
			bool							eof();
			void							sync();
			void							truncate();
			bool							unlink();

			static CARIBOU::CString			md5(CARIBOU::CString filePath);
			static CARIBOU::CString			tempName(CARIBOU::CString dir);

			int 							error();
			const char* 					error_str();

		protected:
        	void							failureNotify(uint8_t err);

		private:
		
			CARIBOU::CString				mPath;
			FIL								mFileDescriptor;
			uint8_t							mDiag;
			bool							mIsOpen=false;
			#if CARIBOU_CFILE_OPEN_MUTEX
				static CARIBOU::CMutex		mMutex;
			#endif


	};


}

#endif
