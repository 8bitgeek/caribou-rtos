#include <coctetarray.h>

namespace PikeAero
{
	#define inherited CARIBOU::CByteArray

	COctetArray::COctetArray(char sepchar)
	: inherited()
	, mSepChar(sepchar)
	{
	}

	COctetArray::COctetArray(uint8_t* octets, size_t size, char sepchar)
	: inherited((char*)octets,size)
	, mSepChar(sepchar)
	{
	}

	COctetArray::COctetArray(CARIBOU::CString ascii, char sepchar)
	: inherited()
	, mSepChar(sepchar)
	{
		fromString(ascii);
	}

	COctetArray::COctetArray( const COctetArray& other )
	: inherited(other)
	{
		mSepChar = other.mSepChar;
	}

	COctetArray::~COctetArray()
	{
	}

	/**
	 * @brief Copy from another string.
	 */
	COctetArray& COctetArray::operator=( const COctetArray& other )
	{
		inherited::copy(other);
		mSepChar = other.mSepChar;
		return *this;
	}

	/**
	 * @brief Convert an ASCII octet array to binary octet array.
	 * @param The ASCII string representing the octet array.
	 */
	void COctetArray::fromString(CARIBOU::CString ascii)
	{
		CARIBOU::CList<CARIBOU::CString*> octets = ascii.explode(sepchar());
		clear();
		for(size_t n=0; n < octets.count(); n++)
		{
			append(toOctet(*octets.at(n)));
		}
		octets.dispose();
		octets.clear();
	}

	/**
	 * @brief Convert the octet array to an ASCII string, decoding %xx hex chars.
	 * @return The ASCII string representing the octet array
	 */
	CARIBOU::CString COctetArray::toString()
	{
		CARIBOU::CString rc;
		CARIBOU::CString t;
		CARIBOU::CString format = octetFormat();
		for(size_t n=0; n < size(); n++)
		{
			t.sprintf(format.data(),(uint8_t)at(n));
			if ( n < size()-1 )
				t += sepchar();
			rc += t;
		}
		return rc;
	}

	/**
	 * @brief From a single octet ascii, to byte.
	 * @return The binary represenation of the octet.
	 */
	uint8_t COctetArray::toOctet(CARIBOU::CString ascii)
	{
		uint8_t rc=0;
		switch(sepchar())
		{
			case ':':
				rc = (uint8_t)(ascii.fromHex()&0xFF);
				break;
			default:
			case '.':
				rc = (uint8_t)(ascii.toUInt()&0xFF); 
				break;
		}
		return rc;
	}

	/**
	 * @brief Determine the correct "toString" format for sprintf an octet.
	 */
	CARIBOU::CString COctetArray::octetFormat()
	{
		CARIBOU::CString rc;
		switch(sepchar())
		{
			default:
			case '.':
				rc = "%d";
				break;
			case ':':
				rc = "%02X";
				break;
		}
		return rc;
	}

	/**
	 * @brief Determine of the actet array is zero.
	 */
	bool COctetArray::isZero()
	{
		bool rc = true;
		for(size_t n=0; rc && n < size(); n++)
		{
			rc = (at(n)=='\0');
		}
		return rc;
	}

	/**
	 * @brief Determine of the actet array is all ones (e.g. 0xFF)...
	 */
	bool COctetArray::isOnes()
	{
		bool rc = true;
		for(size_t n=0; rc && n < size(); n++)
		{
			rc = (at(n)==0xFF);
		}
		return rc;
	}
}
