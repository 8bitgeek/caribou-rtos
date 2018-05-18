/******************************************************************************
* Copyright © 2015 by Mike Sharkey <mike@8bitgeek.net>
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
#include "chttprequest.h"

//#define HTTP_REQUEST_DEBUG 1

namespace Accutron
{
	#define inherited CARIBOU::CString

	CHTTPRequest::CHTTPRequest()
	 : inherited()
	 , mPrepared(false)
	{
	}

	CHTTPRequest::CHTTPRequest( const char* str, int len )
	: inherited()
	 , mPrepared(false)
	{
		copy(str,len);
	}

	CHTTPRequest::CHTTPRequest(const CHTTPRequest& other)
	: inherited()
	 , mPrepared(false)
	{
		copy(other);
	}

	CHTTPRequest::~CHTTPRequest()
	{
	}

	bool CHTTPRequest::copy( const char* data, int len )
	{
		bool rc;
		clear();
		rc = inherited::copy(data,len);
		mPrepared=false;
		prepare();
		return rc;
	}

	CHTTPRequest& CHTTPRequest::copy(const CHTTPRequest& other)
	{
		clear();
		inherited::copy(other);
		mPrepared=false;
		prepare();
		return *this;
	}

	void CHTTPRequest::clear()
	{
		inherited::clear();
		mRequestPath.clear();
		mRequestMethod.clear();
		mRequestGetQuery.clear();
		mRequestPostQuery.clear();
		mHost.clear();
		mLanguage.clear();
	}

	/**
	* @return a reference to the HTTP request method.
	*/
	CARIBOU::CString& CHTTPRequest::method()
	{
		prepare();
		mRequestMethod.trim();
		return mRequestMethod;
	}

	/**
	* @return a reference to the HTTP request data.
	*/
	CARIBOU::CString& CHTTPRequest::path()
	{
		prepare();
		mRequestPath.trim();
		if( !mRequestPath.isEmpty() && mRequestPath.at(0) == '/' )
		{
			mRequestPath.replace("/","");
		}
		return mRequestPath;
	}

	/**
	* @return a reference to the HTTP request data.
	*/
	CARIBOU::CString& CHTTPRequest::getQuery()
	{
		prepare();
		mRequestGetQuery.trim();
		return mRequestGetQuery;
	}

	/**
	* @return a reference to the HTTP request data.
	*/
	CARIBOU::CString& CHTTPRequest::postQuery()
	{
		prepare();
		mRequestPostQuery.trim();
		return mRequestPostQuery;
	}

	/**
	* @return a reference to the HTTP host request.
	*/
	CARIBOU::CString& CHTTPRequest::host()
	{
		prepare();
		return mHost;
	}

	/**
	* @return the browser language string.
	* TODO We could simplify this by returning and enum such that the users of this method does not have to further parse it.
	*/
	CARIBOU::CString& CHTTPRequest::language()
	{
		prepare();
		return mLanguage;
	}

	/**
	* Prepare request data.
	* @return true if all is well, false if there was some kind of parsing error
	*/
	bool CHTTPRequest::prepare()
	{
		int len;
		/* test if there is some new data and parse it out */

		if ( (len=length()) > 0 && !mPrepared )
		{
			mPrepared = true;

			/* parse out the request */
			int rm=find(' ');
			if (rm>=0)
			{
				mRequestMethod.strcpy(data(),rm++);
			}

			/* parse out the path */
            int rp;
			for(rp=rm; rp < len && at(rp) != '?' && at(rp) != ' '; rp++)
			{
				mRequestPath.append(at(rp));
			}
			if (at(rp++)=='?')
			{
				/* parse out the request query */
				int rd=find(' ',rm);
				if (rd>=0)
				{
					mRequestGetQuery.strcpy(&(data()[rm]),(rd-rm));
				}
			}

			/* parse the remainder of the variables */
			parse("Host:",mHost);
			parse("Language:",mLanguage);

			/* parse out the POST query */
			int p = eoh();
			if ( p >= 0 )
			{
				while(at(p)<' '&&p<len) {++p;} /* skip white space */
				while(at(p)>=' '&&p<len)
					mRequestPostQuery.append(at(p++));
			}


			#if HTTP_REQUEST_DEBUG
			DEBUG_PRINTF( "----------------------------------------\n");
			DEBUG_PRINTF( "mRequest='%s'\n",		data() );
			DEBUG_PRINTF( "mRequestMethod='%s'\n",		mRequestMethod.data() );
			DEBUG_PRINTF( "mRequestPath='%s'\n",		mRequestPath.data() );
			DEBUG_PRINTF( "mRequestGetQuery='%s'\n",	mRequestGetQuery.data() );
			DEBUG_PRINTF( "mRequestPostQuery='%s'\n",	mRequestPostQuery.data() );
			DEBUG_PRINTF( "mHost='%s'\n",				mHost.data() );
			DEBUG_PRINTF( "mLanguage='%s'\n",			mLanguage.data() );
			#endif

			inherited::clear();
		}
		return true;
	}

	/**
	* Return a pointer to the end of the header (the new-line separator)
	*/
	int CHTTPRequest::eoh()
	{
		int len = length();
		for(int pos=0; pos < len;)
		{
			int x;
			for(x=0; pos<len && at(pos) != '\n'; x++) {++pos;}
			if (x<=1)
			{
				return pos;
			}
			++pos;
		}
		return -1;
	}

	/**
	* Parse a POST variable
	*/
	bool CHTTPRequest::post(const char* key, CString& result)
	{
		prepare();
		char* a;
		char* b;
		char* c;
		int len = mRequestPostQuery.length();
		int keyLen = strlen(key);
		result.clear();
        a=b=c=mRequestPostQuery.data();
		while(len && *a && *b && *c)
		{
			// find the end of the expression with c
			for(;*c && *c != '&';c++);
			// find the assignment operator with b
			for(;*b && *b != '=';b++);
			// a points to the variable name
			if ( (b-a) == keyLen && strncmp(a,key,keyLen) == 0 )
			{
				// found the key...
				++b;
				result.copy(b,(uint32_t)(c-b));
				return true;
			}
			if (*c)
			{
				++c;
				a=b=c;
			}
		}
		return false;
	}

	/**
	* Parse a GET variable
	*/
	bool CHTTPRequest::get(const char* key, CString& result)
	{
		prepare();
		int a = mRequestGetQuery.find('?');
		int b = mRequestGetQuery.find('=');
		int len = mRequestGetQuery.length();
		result.clear();
		do
		{
			if ( a>=0 && b > a)
			{
				CString w;
				for( ++a; a<b; a++)
				{
					w.append(mRequestGetQuery.at(a)); /* get the potential key */
				}
				if ( w.casecompare(key) == 0 )
				{
					for(++b; b < len && mRequestGetQuery.at(b) != '&'; b++)
					{
						result.append(mRequestGetQuery.at(b));
					}
					return true;
				}
			}
			a = mRequestGetQuery.find('&',a);
			if ( a >= 0 )
			{
				b = mRequestGetQuery.find('=',a);
			}
		} while (a>0 && a < len);
		return false;
	}

	/**
	* Parse data from the header
	* @return true if there is data
	*/
	bool CHTTPRequest::parse(const char* key, CString& result)
	{
		int n;
		int len = length();
		result.clear();
		for(n=0;n<len && at(n)!='\n';n++) {}						/* find eol */
		for(++n; n < len; n++)
		{
			int colon=find(':',n);
			if ( colon > 0 )
			{
				CARIBOU::CString w;
				w.strcpy(ptr(n),((colon++)-n)+1);
				if ( w.casecompare(key) == 0 )
				{
					int e;
					while(colon<len && at(colon)==' ') ++colon;	/* span blanks */
					for(e=colon;e<len && at(e)!='\n';e++) {}	/* find eol */
					result.strcpy(ptr(colon),(e-colon));
					n=++e;
					return true;
				}
			}
			else
			{
				for(;n<len && at(n)!='\n';n++) {}				/* find eol */
				if (at(n)=='\n') ++n;
			}
		}
		return false;
	}

}

