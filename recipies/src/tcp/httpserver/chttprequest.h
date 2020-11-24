#ifndef _MINEAIRQUALITY_CHTTPREQUEST_H_
#define _MINEAIRQUALITY_CHTTPREQUEST_H_

#include <caribou++/cstring.h>

namespace MineAirQuality
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
			void							setPostQuery(CARIBOU::CString post);
			CARIBOU::CString&				postQuery();						/* the request POST query */
			CARIBOU::CString&				path();								/* the request path */
			CARIBOU::CString&				host();								/* the hostname or ip address */
			CARIBOU::CString&				language();							/* the language */
			CARIBOU::CString&				contentType();						/* the content type */
			CARIBOU::CString&				contentLength();					/* the content length */

			bool							post(const char* key,CARIBOU::CString& result);
			bool							get(const char* key,CARIBOU::CString& result);

			bool							isGet()		{return !getQuery().isEmpty();}
			bool							isPost()	{return !postQuery().isEmpty();}

			bool							parse(const char* key, CString& result);

		protected:
			int								eoh();
			bool							prepare();

		private:
			bool							mPrepared;
			CARIBOU::CString				mRequestMethod;
			CARIBOU::CString				mRequestPath;
			CARIBOU::CString				mRequestGetQuery;
			CARIBOU::CString				mRequestPostQuery;
			CARIBOU::CString				mHost;
			CARIBOU::CString				mLanguage;
			CARIBOU::CString				mContentType;
			CARIBOU::CString				mContentLength;
	};
}

#endif
