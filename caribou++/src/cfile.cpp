/*****************************************************************************
* Copyright (c) 2013 by Accutron Instruments                                 *
* All Rights Reserved                                                        *
*****************************************************************************/
#include <cfile.h>
#include <caribou/lib/string.h>

#define READ_BUF_SZ	128	// size of file read buffer

#define DIAG_OK				0
#define DIAG_DISK_INIT_FAIL	1


extern "C" __attribute__((weak)) void disk_init_fail(uint8_t err)
{
}

namespace CARIBOU
{
	FATFS*					CFile::mFileSystem=NULL;
	//caribou_spinlock_t		CFile::mSpinLock;

	#define inherited CObject

	CFile::CFile()
	: inherited()
	, mFileDescriptor(NULL)
	, mDiag(DIAG_OK)
	{
	}

	CFile::CFile(CString path)
	: inherited()
	, mPath(path)
	, mFileDescriptor(NULL)
	, mDiag(DIAG_OK)
	{
	}

	CFile::~CFile()
	{
		close();
	}

	/**
	 ** FIXME - actual support for multiple volumes 
	 **/
	bool CFile::initialize(int volume)
	{
		bool rc=false;
        volatile uint8_t err=0;
		do {
			deinitialize(volume);
			if ( (mFileSystem = (FATFS*)malloc(sizeof(FATFS))) )
			{
				memset(mFileSystem,0,sizeof(FATFS));
				if ( ( err = disk_initialize(volume) ) == FR_OK )
				{
					if ( ( err = disk_status(volume) ) == FR_OK )
					{
						if ( ( err = f_mount(mFileSystem,"",0) ) == FR_OK )
						{
							rc=true;
						}
					}
				}
				if ( err != FR_OK )
				{
					rc=false;
					free(mFileSystem);
					mFileSystem=NULL;
					disk_init_fail(err);
				}
			}
		} while ( err );
		disk_init_fail(0); // clear the status/diag LEDs
		return rc;
	}

	void CFile::deinitialize(int volume)
	{
		if ( mFileSystem )
		{
			free(mFileSystem);
			mFileSystem=NULL;
		}
	}

	void CFile::setPath(CString path)
	{
		mPath = path;
	}

	CString CFile::path()
	{
		return mPath;
	}

	CARIBOU::CString CFile::fileName()
	{
		CARIBOU::CString rc;
		CARIBOU::CList<CARIBOU::CString*> parts = mPath.explode('/');
		if ( parts.count() )
		{
			CARIBOU::CString* fn = parts.at(parts.count()-1);
			rc.copy(fn->data());
		}
		return rc;
	}

	// @param mode:
	// FA_READ	Specifies read access to the object. Data can be read from the file. Combine with FA_WRITE for read-write access.
	// FA_WRITE	Specifies write access to the object. Data can be written to the file. Combine with FA_READ for read-write access.
	// FA_OPEN_EXISTING	Opens the file. The function fails if the file is not existing. (Default)
	// FA_OPEN_ALWAYS	Opens the file if it is existing. If not, a new file is created.
	// To append data to the file, use f_lseek() function after file open in this method.
	// FA_CREATE_NEW	Creates a new file. The function fails with FR_EXIST if the file is existing.
	// FA_CREATE_ALWAYS	Creates a new file. If the file is existing, it is truncated and overwritten.
	bool CFile::open(uint8_t mode)
	{
		bool rc = false;
		if ( !mPath.isEmpty() )
		{
			if ( mFileSystem )
			{
				mFileDescriptor = (FIL*)malloc(sizeof(FIL));
				if ( mFileDescriptor )
				{
					memset(mFileDescriptor,0,sizeof(FIL));
					if ( f_open(mFileDescriptor,mPath.data(),mode) == FR_OK )
					{
						rc = true;
					}
					else
					{
						free(mFileDescriptor);
						mFileDescriptor=NULL;
					}
				}
			}
		}
		return rc;
	}

	bool CFile::open(CString path,uint8_t mode)
	{
		setPath(path);
		for(int x=0; x < 6; x++)
		{
			if ( open(mode) )
			{
				return true;
			}
			caribou_thread_yield();
		}
		return false;
	}

	bool CFile::isOpen()
	{
		return mFileDescriptor != NULL;
	}

	void CFile::close()
	{
		if ( isOpen() )
		{
			f_sync(mFileDescriptor);
			f_close(mFileDescriptor);
			free(mFileDescriptor);
			mFileDescriptor=NULL;
		}
	}

	int CFile::read(void* buf,int sz)
	{
		UINT br;
		if ( f_read(mFileDescriptor,buf,sz,&br) == FR_OK )
		{
			return (int)br;
		}
		return -1;
	}

    int CFile::read(CARIBOU::CByteArray& buf,int sz)
	{
		buf.resize(sz);
		if ( buf.size() )
		{
			int rd = read(buf.data(),sz);
			if ( rd >= 0 )
			{
				buf.resize(rd);
			}
			return rd;
		}
		return -1;
	}

	int CFile::write(void* buf,int sz)
	{
		UINT br;
		if ( f_write(mFileDescriptor,buf,sz,&br) == FR_OK )
		{
			return (int)br;
		}
		return -1;
	}

	int CFile::write(CARIBOU::CByteArray& buf)
	{
		return write(buf.data(),buf.size());
	}
	
	int CFile::size()
	{	int rc;
		rc = f_size(mFileDescriptor);
		return rc;
	}

	bool CFile::eof()
	{
		bool rc;
		rc = f_eof(mFileDescriptor) != 0;
		return rc;
	}

	void CFile::sync()
	{
		f_sync(mFileDescriptor);
	}

	int CFile::seek(int pos)
	{
		f_lseek(mFileDescriptor,pos);
		return tell();
	}

	int CFile::tell()
	{
		int rc;
		rc = f_tell(mFileDescriptor);
		return rc;
	}

	void CFile::truncate()
	{
		f_truncate(mFileDescriptor);
	}


} // namespace CARIBOU