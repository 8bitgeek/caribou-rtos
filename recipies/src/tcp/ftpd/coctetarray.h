#ifndef _PIKEAERO_COCTETARRAY_H__
#define _PIKEAERO_COCTETARRAY_H__

#include <caribou++/cstring.h>
#include <caribou++/clist.h>
#include <caribou++/cbytearray.h>

namespace PikeAero
{
	class COctetArray : public CARIBOU::CByteArray
	{
		public:
		
			COctetArray(char sepchar='.');
			COctetArray(uint8_t* octets, size_t size, char sepchar='.');
			COctetArray(CARIBOU::CString ascii, char sepchar='.');
			COctetArray( const COctetArray& other );
			virtual ~COctetArray();

			COctetArray&			operator=( const COctetArray& other );

			void					setSepChar(char ch)	{mSepChar=ch;}
			char					sepchar()			{return mSepChar;}

			CARIBOU::CString		toString();
			void					fromString(CARIBOU::CString ascii);

			uint8_t*				octets() {return (uint8_t*)data();}

			bool					isZero();
			bool					isOnes();

		private:

			uint8_t					toOctet(CARIBOU::CString ascii);
			CARIBOU::CString		octetFormat();

			char					mSepChar;
	};
} 

#endif /* _PIKEAERO_COCTETARRAY_H__ */

