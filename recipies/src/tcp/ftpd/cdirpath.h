/*****************************************************************************
* Copyright (c) 2013 by Pike Aero Corp                                       *
* All Rights Reserved                                                        *
*****************************************************************************/
#ifndef CARIBOU_CDIRPATH_H
#define CARIBOU_CDIRPATH_H

#include <caribou++/cobject.h>
#include <caribou++/cstring.h>
#include <diskio.h>
#include <ff.h>

namespace PikeAero
{
	class CDirPath : public CARIBOU::CString
	{
		public:

			CDirPath(bool upperCase=false);
			CDirPath(CARIBOU::CString rootPath, bool upperCase=false);
			CDirPath(const CDirPath& path);
			virtual ~CDirPath();

			bool								copy( const CDirPath& other );

			CDirPath&							operator=(const CDirPath& other);
            CDirPath&							operator=( const char* data );
			bool								operator==(CDirPath& other);

			void								setRootPath(CARIBOU::CString rootPath);
			CARIBOU::CString					rootPath();

			void								setPath(CARIBOU::CString path);
			CARIBOU::CString					path();

			void								setUpperCase(bool upperCase);
			bool								upperCase();

			bool								cd(CARIBOU::CString cwd);
			bool								cdup(CARIBOU::CString cwd);

			CARIBOU::CList<CARIBOU::CString*>*	dirList(bool shortlist=true);
			void								disposeDirList(CARIBOU::CList<CARIBOU::CString*>* dirList);

			bool								isDir() {return valid();}

		protected:

			bool								valid();

		private:

			CARIBOU::CString					mRootPath;
			bool								mUpperCase;

	};


}

#endif /* CARIBOU_CDIRPATH_H */

