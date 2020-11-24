#ifndef _MINEAIRQUALITY_CHTTPSTRING_H__
#define _MINEAIRQUALITY_CHTTPSTRING_H__

#include <caribou++/cstring.h>
#include <caribou++/clist.h>

namespace MineAirQuality
{
	class CHttpString : public CARIBOU::CString
	{
		public:
		
			CHttpString();
			CHttpString( const CARIBOU::CString& other );
			virtual ~CHttpString();

			CHttpString&			operator=( const CString& other );

			bool					isGet();
			CARIBOU::CString		valueOfTag(CARIBOU::CString tag, CARIBOU::CString defaultValue="");
			int						indexOfTag(CARIBOU::CString tag);


		private:

			uint8_t					nibble(char ch);
			CARIBOU::CString		extractHex(int idx);
			CARIBOU::CString		extractValueString(int valueIdx);
	};
} 

#endif // __CHTTP_STRING_H__
