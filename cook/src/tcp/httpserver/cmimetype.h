#ifndef _MINEAIRQUALITY_CMIMETYPE_H_
#define _MINEAIRQUALITY_CMIMETYPE_H_

#include <caribou++/cstring.h>

namespace MineAirQuality
{
	class CMimeType : public CARIBOU::CString
	{
		public:
			typedef enum
			{
				tHTML,
				tMultiPartMime,
				tJPG,
				tPNG,
				tSVG,
				tGIF,
				tTXT,
				tBIN,
				tJS,
				tXML,
				tCSV,
				tCSS,
			} mime_t;
			CMimeType();
			CMimeType( const char* str, int len=-1 );
			CMimeType( const CMimeType& other );
			virtual ~CMimeType();

			bool							copy( const char* data, int len=-1 );
			CMimeType&						copy(const CMimeType& other);

			virtual void					clear();

			mime_t							type();
			const char*						convert();

		protected:

		private:
	};
}

#endif
