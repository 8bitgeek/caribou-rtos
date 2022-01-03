/*****************************************************************************
* Copyright (c) 2013 by Pike Aero Corp                                       *
* All Rights Reserved                                                        *
*****************************************************************************/
#include <cdirpath.h>
#include <caribou++/cfile.h>

namespace PikeAero
{
	#define inherited CARIBOU::CString

	CDirPath::CDirPath(bool upperCase)
	: inherited()
	, mUpperCase(upperCase)
	{
	}

	CDirPath::CDirPath(CARIBOU::CString rootPath, bool upperCase)
	: inherited()
	, mRootPath(rootPath)
	, mUpperCase(upperCase)
	{
	}

	CDirPath::CDirPath(const CDirPath& other)
	: inherited()
	{
		copy(other);
	}

	CDirPath::~CDirPath()
	{
	}

	bool CDirPath::copy( const CDirPath& other )
	{
		bool rc = inherited::copy(other);
		mRootPath = other.mRootPath;
		mUpperCase = other.mUpperCase;
		return rc;
	}

	CDirPath& CDirPath::operator=( const char* data )
	{
		inherited::copy(data);
		return *this;
	}

	CDirPath& CDirPath::operator=(const CDirPath& other)
	{
		copy(other);
		return *this;
	}

	bool CDirPath::operator==(CDirPath& other)
	{
		bool rc = (inherited::compare(other)==0);
		return rc;
	}

	void CDirPath::setUpperCase(bool upperCase)
	{
		mUpperCase=upperCase;
	}

	bool CDirPath::upperCase()
	{
		return mUpperCase;
	}

	void CDirPath::setRootPath(CARIBOU::CString rootPath)
	{
		mRootPath = rootPath;
	}

	CARIBOU::CString CDirPath::rootPath()
	{
		return mRootPath;
	}

	void CDirPath::setPath(CARIBOU::CString path)
	{
		inherited::copy(path);
	}

	CARIBOU::CString CDirPath::path()
	{
		return *this;
	}

	bool CDirPath::cd(CARIBOU::CString cwd)
	{
		bool rc=false;
		if ( cwd == ".." )
		{
			return cdup(cwd);
		}
		else
		{
			CARIBOU::CString current = inherited::data();
			CARIBOU::CString newpath = "/";
			if ( cwd.length() && cwd.at(0) == '/' ) // absolute path?
			{
				newpath = cwd;
			}
			else									// relative path..
			{
				newpath = current;
				newpath += "/";
				newpath += cwd;
			}
			inherited::copy(newpath);
			if ( !(rc=valid()) )
			{
				inherited::copy(current);
			}
		}
		return rc;
	}

	bool CDirPath::cdup(CARIBOU::CString cwd)
	{
		bool rc=false;
		CARIBOU::CString current = inherited::data();
		if ( current != "/" )
		{
			CARIBOU::CString parent;
			CARIBOU::CList<CARIBOU::CString*> current_parts = current.explode('/');
			if ( current_parts.count() > 1 )
			{
				for(size_t n=0; n < current_parts.count()-1; n++)
				{
					parent += "/";
					parent += current_parts.at(n)->data();
				}
			}
			else
			{
				parent = "/";
			}
			inherited::copy(parent);
			current_parts.dispose();
			current_parts.clear();
			rc = true;
		}
		return rc;
	}

    bool CDirPath::valid()
	{
		CARIBOU::CString root = "/";
		if( root == data() )
			return true;
		else
		{
			CARIBOU::CFile file(*this);
			return file.isDir();
		}
	}

	/**
	 * @notice Caller OWNS this heap allocated pointer!!
	 */
	CARIBOU::CList<CARIBOU::CString*>* CDirPath::dirList(bool shortlist)
	{
		FRESULT res;
		FILINFO fno;
		DIR dir;
		int i;
		char *fn;
		#if _USE_LFN
			//static char lfn[_MAX_LFN * (_DF1S ? 2 : 1) + 1];
			static char lfn[_MAX_LFN * (0 ? 2 : 1) + 1];
			fno.lfname = lfn;
			fno.lfsize = sizeof(lfn);
		#endif

		CARIBOU::CList<CARIBOU::CString*>* rc = new CARIBOU::CList<CARIBOU::CString*>();
		if ( rc )
		{
			res = f_opendir(&dir, inherited::data());
			if (res == FR_OK) {
				i = inherited::length();
				for (;;) {

					res = f_readdir(&dir, &fno);
					if (res != FR_OK || fno.fname[0] == 0) break;
					#if _USE_LFN
						fn = *fno.lfname ? fno.lfname : fno.fname;
					#else
						fn = fno.fname;
					#endif
					CARIBOU::CString* file = new CARIBOU::CString;
					if ( file )
					{
						rc->append(file);
						if ( shortlist )
						{
							file->sprintf("%8d %s", fno.fsize, fn);
						}
						else
						{
							int year = ((fno.fdate & 0xFE00)>>9) + 1980;
							int month = ((fno.fdate & 0x01E0)>>5);
							int week_day =  fno.fdate & 0x001F;
							int hours = ((fno.ftime & 0xF800)>>11);
							int minutes = ((fno.ftime & 0x07E0)>>5);
							if ( week_day == 0 ) week_day=1;
							if ( month == 0 ) month=1;
							if ( year == 0 ) year=1;
							file->sprintf("%crw-rw-rw- 1 user ftp %8d %2d %2d %02d:%02d %s", 
													fno.fattrib & AM_DIR?'d':'-',
													fno.fsize, 
													month, /* month_table[month], */
													week_day, 
													hours, 
													minutes, 
													fn);			
						}
						/** fold case... */
						if ( upperCase() )
							file->toUpper();
						else
							file->toLower();

					}
				}
			}
		}
		return rc;
		
	}

	void CDirPath::disposeDirList(CARIBOU::CList<CARIBOU::CString*>* dirList)
	{
		dirList->dispose();
		dirList->clear();
		delete dirList;
	}

}