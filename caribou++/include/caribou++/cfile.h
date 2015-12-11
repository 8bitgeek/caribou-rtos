/*****************************************************************************
* Copyright (c) 2013 by Accutron Instruments                                 *
* All Rights Reserved                                                        *
*****************************************************************************/
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

			static bool						initialize(int volume);
			static bool						initialized();
			static void						deinitialize(int volume);

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
			static FATFS*					fs()	{return mFileSystem;}

			static CARIBOU::CString			md5(CARIBOU::CString filePath);

		protected:
        	void							failureNotify(uint8_t err);

		private:
			static FATFS*					mFileSystem;
			static bool						mInitialized;
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
