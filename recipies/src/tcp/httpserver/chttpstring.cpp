#include <chttpstring.h>

namespace PikeAero
{
	#define inherited CARIBOU::CString

	CHttpString::CHttpString()
	: inherited()
	{
	}

	CHttpString::CHttpString( const CARIBOU::CString& other )
	: inherited(other)
	{
	}

	CHttpString::~CHttpString()
	{
	}

	/**
	 * @brief Copy from another string.
	 */
	CHttpString& CHttpString::operator=( const CString& other )
	{
		copy(other);
		return *this;
	}

	/**
	 * Is a GET string? Starts with "/?" ??
	 */
	bool CHttpString::isGet()
	{
		bool rc=false;
		if ( length() && at(0) == '/' && at(1) == '?' )
		{
			rc=true;
		}
		return rc;
	}

	/**
	 * @brief Return the index of a tag (followed by '=' char)
	 * @return The index ov the first character of the tag name.
	 */
	int CHttpString::indexOfTag(CARIBOU::CString tag)
	{
		int rc=(-1);
		tag += "=";
		rc = inherited::find(tag);
		return rc;
	}

	/**
	 * @brief Retrieve the value of a tag from a GET string.
	 * @param tag The name of the tag to search for.
	 */
	CARIBOU::CString CHttpString::valueOfTag(CARIBOU::CString tag, CARIBOU::CString defaultValue)
	{
		CARIBOU::CString rc;
		int tagIdx = indexOfTag(tag);
		if ( tagIdx >= 0 )
		{
			int valueIdx = find('=',tagIdx);
			if ( valueIdx >= 0 )
			{
				rc = extractValueString(++valueIdx);
			}
		}
		else
		{
			rc = defaultValue;
		}
		return rc;
	}

	/**
	 * @brief Convert an ASCII char to a binary nibble.
	 */
	uint8_t CHttpString::nibble(char ch)
	{
		char uch = caribou_toupper(ch);
		if ( uch >= 'A' && uch <= 'F' )
		{
			uch = (uch - 'A') + 10;
		}
		else
		{
			uch -= '0';
		}
		return (uint8_t)(uch&0x0F);
	}

	/**
	 * @brief Extract a nex code beginning with '%'
	 * @param idx The character index of the first character.
	 */
	CARIBOU::CString CHttpString::extractHex(int idx)
	{
		CARIBOU::CString rc;
		if ( at(idx++) == '%' )
		{
			uint8_t byte = 0;
			byte |= nibble(at(idx++)) << 4;
			byte |= nibble(at(idx++));
			rc.sprintf("%02X",byte);
		}
		return rc;
	}

	/**
	 * @brief Extract a value string up to end-of-line or '&' character.
	 * @param valueUdx The index of the starting character of the value.
	 */
    CARIBOU::CString CHttpString::extractValueString(int valueIdx)
	{
		CARIBOU::CString rc;
		for(size_t n=valueIdx; at(n) != '&' && n < length(); n++)
		{
			if ( at(n) == '%' )
			{
				CARIBOU::CString hex = extractHex(n);
				hex.prepend("0x");
				rc.append((char)(hex.fromHex()&0xFF));
				n+=2; /* consume the digits */
			}
			else
			{
				rc += at(n);
			}
		}
		return rc;
	}

}
