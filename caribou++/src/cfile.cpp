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
#include <caribou++/cfile.h>
#include <caribou++/cmd5.h>
#include <caribou/lib/string.h>
#include <caribou/lib/rand.h>

#define READ_BUF_SZ	128	// size of file read buffer

#define DIAG_OK				0
#define DIAG_DISK_INIT_FAIL	1

extern "C" __attribute__((weak)) void disk_init_fail(uint8_t err)
{
}

namespace CARIBOU
{
	#if CARIBOU_CFILE_OPEN_MUTEX
		CARIBOU::CMutex				CFile::mMutex;
	#endif

	#define inherited CObject

	CFile::CFile()
	: inherited()
	, mDiag(DIAG_OK)
	, mIsOpen(false)
	{
	}

	CFile::CFile(CString path)
	: inherited()
	, mPath(path)
	, mDiag(DIAG_OK)
	, mIsOpen(false)
	{
	}

	CFile::~CFile()
	{
		close();
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
		parts.dispose();
		parts.clear();
		return rc;
	}


	/**
	 * @brief If the file path is a directory, load a string with the filenames in the directory,
	 * each suffixed with a newline '\n' character.
	 * @param mask - file matching wildcard mask
	 * @return A directory listing as a string, or an empty string.
	*/
	CARIBOU::CString CFile::dir(CARIBOU::CString mask)
	{
		CARIBOU::CString ls;
		if ( isDir() )
		{
			FRESULT fr;     /* Return value */
			DIR dj;         /* Directory object */
			FILINFO fno;    /* File information */

			fr = f_findfirst(&dj, &fno, mPath.data(), mask.data());	/* Start to search for matching files */

			while (fr == FR_OK && fno.fname[0]) {         			/* Repeat while an item is found */
				ls += (char*)fno.fname;
				ls += '\n';
				fr = f_findnext(&dj, &fno);               			/* Search for next item */
			}
			f_closedir(&dj);		
		}
		return ls;
	}

	/**
	 * @brief  function changes the current directory of the logical drive.
	 * Note that the current directory is retained in the each file system object 
	 * @param dirpath string that specifies the directory to be set as current directory.
	 * @return boolean, true upon success
	 * 
	*/
	bool CFile::chdir(CARIBOU::CString dirpath)
	{
		return (f_chdir(dirpath.data()) == FR_OK);
	}

	/**
	 * @brief The f_stat() function checks the existence of a file or sub-directory. If not exist, 
	 *        the function returns with FR_NO_FILE. If exist, the function returns with FR_OK and the 
	 *        informations of the object, file size, timestamp, attribute and SFN, are stored to the 
	 *        file information structure. For details of the file information, refer to the FILINFO 
	 *        structure and f_readdir() function.
	 * @param info Pointer to the blank FILINFO structure to store the information of the object. Set null pointer if it is not needed.
	 * @return  FR_OK, FR_DISK_ERR, FR_INT_ERR, FR_NOT_READY, FR_NO_FILE, FR_NO_PATH, FR_INVALID_NAME, FR_INVALID_DRIVE, FR_NOT_ENABLED, FR_NO_FILESYSTEM, FR_TIMEOUT, FR_NOT_ENOUGH_CORE 
	 */
	FRESULT CFile::stat(FILINFO* info)
	{
		FRESULT rc = f_stat(mPath.data(),info);
		return rc;
	}

	bool CFile::unlink()
	{
		FRESULT rc = f_unlink(mPath.data());
		return (rc == FR_OK);
	}

	/**
	 * @return true if it's a regular file
	 */
	bool CFile::isFile()
	{
		bool rc=false;
        FILINFO info;
		if ( stat(&info) == FR_OK )
		{
			if ( (info.fattrib & AM_DIR) == 0 )
				rc = true;
		}
		return rc;
	}

	/**
	 * @return true if it's a regular file
	 */
	bool CFile::isDir()
	{
		bool rc=false;
        FILINFO info;
		if ( stat(&info) == FR_OK )
		{
			if ( (info.fattrib & AM_DIR) != 0 )
				rc = true;
		}
		return rc;
	}

	/**
	 * @brief Make a directory.
	 */
	bool CFile::mkDir()
	{
		bool rc = false;
		if ( f_mkdir(mPath.data()) == FR_OK )
			rc = true;
		return rc;
	}

	/**
	 * @brief Remove a directory
	 */
	 bool CFile::rmDir()
	 {
		bool rc = false;
		if ( f_unlink(mPath.data()) == FR_OK )
			rc = true;
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
		if ( !mPath.isEmpty() )
		{
			memset(&mFileDescriptor,0,sizeof(FIL));
			#if CARIBOU_CFILE_OPEN_MUTEX
				mMutex.lock();
			#endif
			if ( (mReturnCode=f_open(&mFileDescriptor,mPath.data(),mode)) == FR_OK )
			{
				/** if CARIBOU_CFILE_OPEN_MUTEX then leave the mutex locked until we call close() */
				mIsOpen = true;
			}
			else
			{
				#if CARIBOU_CFILE_OPEN_MUTEX
					mMutex.unlock();
				#endif
				mIsOpen = false;
			}
		}
		return mIsOpen;
	}

	bool CFile::open(CString path,uint8_t mode)
	{
		setPath(path);
		return open(mode);
	}

	bool CFile::isOpen()
	{
		return mIsOpen;
	}

	void CFile::close()
	{
		if ( isOpen() )
		{
			f_close(&mFileDescriptor);
			#if CARIBOU_CFILE_OPEN_MUTEX
				mMutex.unlock();
			#endif
		}
	}

	int CFile::read(void* buf,int sz)
	{
		UINT br;
		if ( f_read(&mFileDescriptor,buf,sz,&br) == FR_OK )
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

	#if 1

		/** 
		  * @brief Read a line of text from the file.
		  * @brief buf Output buffer.
		  */
		int CFile::readline(CARIBOU::CByteArray& buf,int max)
		{
			int rc=-1;
			buf.resize(max+1);
			if ( f_gets(buf.data(),max,&mFileDescriptor) != NULL )
			{
				rc = strlen(buf.data());
				buf.resize(rc);
			}
			return rc;
		}
	
	#else

		/** FIXME - Read and cache a full 512 byte buffer at a time, this is very slow and inefficient... */
		int CFile::readline(CARIBOU::CByteArray& buf,int max)
		{
			int rc=0;
			uint8_t ch=0;
			buf.clear();
			while (rc >= 0 && ch != '\n' && buf.size() < max )
			{
				int br = read(&ch,1); /* br=1 okay, br=0 eof, br<0 error */
				if ( br==1 )
				{
					++rc;
					buf.append(ch);
				}
				else if ( br == 0 )
				{
					ch='\n';
				}
				else
					rc=-1;
			}
			return rc;
		}

	#endif

	int CFile::write(void* buf,int sz)
	{
		UINT br;
		if ( f_write(&mFileDescriptor,buf,sz,&br) == FR_OK )
		{
			return (int)br;
		}
		return -1;
	}

	int CFile::write(CARIBOU::CByteArray& buf)
	{
		return write(buf.data(),buf.length());
	}
	
	int CFile::size()
	{	int rc;
		rc = f_size(&mFileDescriptor);
		return rc;
	}

	bool CFile::eof()
	{
		bool rc;
		rc = f_eof(&mFileDescriptor) != 0;
		return rc;
	}

	void CFile::sync()
	{
		f_sync(&mFileDescriptor);
	}

	int CFile::seek(int pos)
	{
		f_lseek(&mFileDescriptor,pos);
		return tell();
	}

	int CFile::tell()
	{
		int rc;
		rc = f_tell(&mFileDescriptor);
		return rc;
	}

	void CFile::truncate()
	{
		f_truncate(&mFileDescriptor);
	}

	/**
	 * @return the MD5 hash of a file by pathname
	 */
	CARIBOU::CString CFile::md5(CARIBOU::CString filePath)
	{
		CARIBOU::CString md5Hash;
		CARIBOU::CFile file(filePath);
		if ( file.isFile() )
		{
			CARIBOU::CByteArray buf;
			CARIBOU::CMD5 md5;
			if ( file.open(FA_READ) )
			{
				do
				{
					if ( file.read(buf,512) > 0 )
					{
						md5.update((uint8_t*)buf.data(),buf.length());
					}
				} while(!file.eof());
				md5Hash = md5.hexdigest();
			}
		}
		return md5Hash;
	}

	CARIBOU::CString CFile::tempName(CARIBOU::CString dir)
	{
		CARIBOU::CString rc;
		rc.sprintf("/%s/%d.tmp",dir.data(),rand());
		return rc;
	}

	int CFile::error()
	{
		return f_error(&mFileDescriptor);
	}

	const char* CFile::error_str()
	{
		const char* rc;
		switch(error())
		{
			case FR_OK:						rc="(0) Succeeded"; break;
			case FR_DISK_ERR:				rc="(1) A hard error occurred in the low level disk I/O layer"; break;
			case FR_INT_ERR:				rc="(2) Assertion failed"; break;
			case FR_NOT_READY:				rc="(3) The physical drive cannot work"; break;
			case FR_NO_FILE:				rc="(4) Could not find the file"; break;
			case FR_NO_PATH:				rc="(5) Could not find the path"; break;
			case FR_INVALID_NAME:			rc="(6) The path name format is invalid"; break;
			case FR_DENIED:					rc="(7) Access denied due to prohibited access or directory full"; break;
			case FR_EXIST:					rc="(8) Access denied due to prohibited access"; break;
			case FR_INVALID_OBJECT:			rc="(9) The file/directory object is invalid"; break;
			case FR_WRITE_PROTECTED:		rc="(10) The physical drive is write protected"; break;
			case FR_INVALID_DRIVE:			rc="(11) The logical drive number is invalid"; break;
			case FR_NOT_ENABLED:			rc="(12) The volume has no work area"; break;
			case FR_NO_FILESYSTEM:			rc="(13) There is no valid FAT volume"; break;
			case FR_MKFS_ABORTED:			rc="(14) The f_mkfs() aborted due to any parameter error"; break;
			case FR_TIMEOUT:				rc="(15) Could not get a grant to access the volume within defined period"; break;
			case FR_LOCKED:					rc="(16) The operation is rejected according to the file sharing policy"; break;
			case FR_NOT_ENOUGH_CORE:		rc="(17) LFN working buffer could not be allocated"; break;
			case FR_TOO_MANY_OPEN_FILES:	rc="(18) Number of open files > _FS_LOCK"; break;
			case FR_INVALID_PARAMETER:		rc="(19) Given parameter is invalid"; break;
			default:
				rc="unknown";
				break;
		}
		return rc;
	}

} // namespace CARIBOU