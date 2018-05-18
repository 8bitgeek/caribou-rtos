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
#ifndef _CHTTP_REQUEST_H_
#define _CHTTP_REQUEST_H_

#include "cstring.h"

namespace Accutron
{
	class CHTTPRequest : public CARIBOU::CString
	{
		public:
			CHTTPRequest();
			CHTTPRequest( const char* str, int len=-1 );
			CHTTPRequest( const CHTTPRequest& other );
			virtual ~CHTTPRequest();

			bool							copy( const char* data, int len=-1 );
			CHTTPRequest&					copy(const CHTTPRequest& other);

			virtual void					clear();

			CARIBOU::CString&				method();							/* the request method */
			CARIBOU::CString&				getQuery();							/* the request GET query */
			CARIBOU::CString&				postQuery();						/* the request POST query */
			CARIBOU::CString&				path();								/* the request path */
			CARIBOU::CString&				host();								/* the hostname or ip address */
			CARIBOU::CString&				language();							/* the language */

			bool							post(const char* key,CARIBOU::CString& result);
			bool							get(const char* key,CARIBOU::CString& result);

			bool							isGet()		{return !getQuery().isEmpty();}
			bool							isPost()	{return !postQuery().isEmpty();}

		protected:
			int								eoh();
			bool							prepare();
			bool							parse(const char* key, CString& result);

		private:
			bool							mPrepared;
			CARIBOU::CString				mRequestMethod;
			CARIBOU::CString				mRequestPath;
			CARIBOU::CString				mRequestGetQuery;
			CARIBOU::CString				mRequestPostQuery;
			CARIBOU::CString				mHost;
			CARIBOU::CString				mLanguage;
	};
}

#endif
