/******************************************************************************
* Copyright © 2005-2012 by Pike Aerospace Research Corporation
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
#include <caribou++/cstring.h>
#include <caribou.h>

namespace CARIBOU
{

	#define inherited CByteArray

	CString::CString()
	: inherited()
	{
	}

	CString::CString(const char* str, int len)
	: inherited()
	{
		copy(str,len);
	}

	CString::CString(double f,int dplaces,char conv)
	: inherited()
	{
		fromDouble(f, dplaces, conv);
	}

	CString::CString(const CString& other)
	: inherited(static_cast<const CByteArray&>(other))
	{
	}

	CString::~CString()
	{
	}

	bool CString::copy( const char* data, int len )
	{
		return this->strcpy(data,len<0?strlen(data):len);
	}


	bool CString::copy( const CString& other )
	{
		CString* p_other = (CString*)&other;
		return this->strcpy(p_other->data());
	}

	bool CString::isalpha(uint8_t c)
	{
		return (c>='a' && c<='z') || (c>='A' && c<='Z');
	}

	int CString::casecompare( register const char* s )
	{

		if ( data() &&  s )
		{
			return ::strcasecmp( static_cast<const char*>(data()), s );
		}
		if ( data() && strlen(data()) && !s )
		{
			return 1;
		}
		if ( !data() && s && strlen(s) )
		{
			return -1;
		}
		return 0;
	}

	int CString::casecompare( CString& other )
	{
		return casecompare(other.data());
	}

	/**
	* @brief Compare, taking NULL pointers into account.
	*/
	int CString::compare( const char* s )
	{
		if ( data() &&  s )
		{
			return ::strcmp(data(),s);
		}
		if ( data() && strlen(data()) && !s )
		{
			return 1;
		}
		if ( !data() && s && strlen(s) )
		{
			return -1;
		}
		return 0;
	}

	int CString::compare( CString& other )
	{
		return compare(static_cast<const char*>(other.data()));
	}

	int CString::compare( const char* s, size_t sz )
	{
		if ( data() &&  s )
		{
			return ::strncmp((const char*)data(), s, sz);
		}
		if ( data() && strlen(data()) && !s )
		{
			return 1;
		}
		if ( !data() && s && strlen(s) )
		{
			return -1;
		}
		return 0;
   }

	int CString::compare( CString& other,size_t sz )
	{
		return compare(static_cast<const char*>(other.data()), sz);
	}

	/**
	** @brief separate a string into substrings based on a separator character.
	** @param separator The separator character.
	** @param index Indicates starting caracter position.
	** @return Returns a CList<CString*> of substrings. The caller assumes
	** ownership of the allocated substring pointers.
	*/
	CList<CString*> CString::explode( char separator, int index )
	{
		CList<CString*> list;
		register int begin = index;
		register int end;
		size_t len = length();
		if ( begin < len )
		{
			do {
				end = find( separator, begin );
				if ( begin < end )
				{
					list.append( new CString( mid( begin, end-begin ) ) );
				}
				else if ( end < 0 )
				{
					list.append( new CString( mid( begin, size()-begin ) ) );
				}
				begin = end+1;
			} while ( end >= 0 );
		}
		return list;
	}

	/**
	* @brief Resize in terms of usable string characters, transparently maintain terminating null.
	*/
	size_t CString::resize(size_t size)
	{
		if ( size+1 != inherited::size() )
		{
			size_t rc = inherited::resize( size + 1 );
			if (rc)
			{
				data()[size] = '\0';
			}
			return rc;
		}
		return inherited::size();
	}

	CString CString::left( int n )
	{
		CString str;
		for ( int i = 0; i < n; i++ )
		{
			str.append( at(i) );
		}
		return str;
	}

	CString CString::right( int n )
	{
		CString str;
		for ( int i = length()-1; i >= 0 && n > 0; i--, n-- )
		{
			str.prepend( at(i) );
		}
		return str;
	}

	CString CString::mid( int index, int n )
	{
		CString str;
		for ( int i = index; n > 0; n--,i++ )
		{
			str.append( at(i) );
		}
		return str;
	}

	CString& CString::toLower()
	{
		int len = length();
		for ( uint32_t i = 0; i < len; i++ )
		{
			set( i, tolower( at(i) ) );
		}
		return *this;
	}

	CString& CString::toUpper()
	{
		int len = length();
		for ( uint32_t i = 0; i < len; i++ )
		{
			set( i, toupper( at(i) ) );
		}
		return *this;
	}

	size_t CString::skip( const char* match, size_t offset )
	{
		int len = length();
		while( offset < len && strchr(match,at(offset)) != NULL )
		{
			++offset;
		}
		return offset;
	}

	int CString::find( char ch, int index )
	{
		int len = length();
		for ( uint32_t i = index; i < len; i++ )
		{
			if ( at(i) == ch )
			{
				return i;
			}
		}
		return -1;
	}

	bool CString::append( CString& other )
	{
		return append(other.data());
	}

	bool CString::append( const char* data )
	{
		return strcat(data);
	}

	bool CString::append( char ch )
	{
		return strcat(&ch,1);
	}

	/**
	 ** @brief Copies the string pointed to by d, The strings may not overlap.
	 ** @return self reference.
	 */
	bool CString::strcpy(const char* d,size_t len)
	{
		bool rc=false;
		//printf("CString::strcpy(%08X,%08X)\n",d,len);
		if ( data() != d )
		{
			if ( len )
			{
				//if ( CString::resize(len) )
				if ( resize(len) )
				{
					::strncpy(data(),d,len);
					rc = true;
				}
			} 
			else 
			{
				//if ( CString::resize(strlen(d)) )
				if ( d )
				{
					if ( resize(strlen(d)) )
					{
						::strcpy(data(),d);
						rc = true;
					}
				}
				else
				{
					clear();
				}
			}
		}
		else
		{
			rc = true;
		}
		return rc;
	}

	/**
	 ** @brief The strcat() function appends the d string,The strings may not overlap.
	 ** @return self reference.
	 */
	bool CString::strcat(const char* d, size_t len)
	{
		int t=length();
		len = ( len==0 ? strlen(d) : len);
		if ( CString::resize((t+len)) )
		{
			set((t+len),'\0');
			set(t,d,len);
			return true;
		}
		return false;
	}

	/**
	 ** Prepend a character to the string.
	 */
	bool CString::prepend(uint8_t data)
	{
		if ( isNull() )
		{
			if (!append( '\0' ))
			{
				return false;
			}
		}
		return inherited::prepend(data);
	}

	/**
	 ** Prepend a chunk of data to the string.
	 */
	bool CString::prepend(const char* p)
	{
		for(int n=((int)strlen(p)-1); n >= 0; n--)
		{
			if ( !prepend((uint8_t)p[n]) )
				return false;
		}
		return true;
	}

	/**
	 ** Prepend a chunk of data to the string.
	 */
	bool CString::prepend(const CString& p)
	{
		CString* other = (CString*)&p;
		return prepend(other->data());
	}

	/**
	 ** Find the first occurance of a substring
	 ** @param needle The substring to find.
	 ** @param offset The offset from which to begin searching.
	 */
	int CString::find(const char* needle, size_t offset)
	{
		register const char* p = data();
		if ( p )
		{
			register int plen = strlen(p);
			register int nlen = strlen(needle);
			if ( needle != NULL && p != NULL )
			{
				for (int n=offset; plen >= nlen; n++, p++, plen--)
				{
					if( strncmp(p,needle,nlen) == 0 )
					{
						return n;
					}
				}
			}
		}
		return -1;
	}

	/**
	 ** Find the first occurance of a substring
	 ** @param needle The substring to find.
	 ** @param offset The offset from which to begin searching.
	 */
	int CString::find( const CString& needle, size_t offset)
	{
		CString* other = (CString*)&needle;
		return find(other->data(),offset);
	}

	/**
	 ** Find and replace a substring.
	 ** @param needle The substring to find.
	 ** @param replacement The replacement substring.
	 ** @param offset The offset from which to begine searching for the needle.
	 */
	CString& CString::replace( const char* needle, CString replacement, size_t offset)
	{
		int idx = find(needle,offset);
		int len = strlen(needle);
		int rlen = replacement.length();
		if ( idx >= 0 )
		{
			for(int n=0; n < (int)len; n++)
				remove(idx+n);
			for(int n=0; n < (int)rlen; n++)
				insert(replacement.at(n),idx+n);
		}
		return *this;
	}

	CString& CString::trim()
	{
		while(!isEmpty() && at(0) <= ' ')
			remove(0);
		while(!isEmpty() && at(length()-1) <= ' ')
			remove(length()-1);
		return *this;
	}

	CString& CString::toHex( uint8_t n )
	{
		bool started=false;
		clear();
		for( int32_t i=1; i >=0; i-- )
		{
			uint8_t ch = (uint8_t)((n >> (4*i))&0xf);
			append( (uint8_t)hex(ch) );
		}
		return *this;
	}

	CString& CString::toHex( uint16_t n )
	{
		bool started=false;
		clear();
		for( int32_t i=3; i >=0; i-- )
		{
			uint8_t ch = (uint8_t)((n >> (4*i))&0xf);
			append( (uint8_t)hex(ch) );
		}
		return *this;
	}

	CString& CString::toHex( uint32_t n )
	{
		bool started=false;
		clear();
		for( int32_t i=7; i >=0; i-- )
		{
			uint8_t ch = (uint8_t)((n >> (4*i))&0xf);
			append( (uint8_t)hex(ch) );
		}
		return *this;
	}

	CString& CString::toHex( uint64_t n )
	{
		bool started=false;
		clear();
		for( int32_t i=15; i >=0; i-- )
		{
			uint8_t ch = (uint8_t)((n >> (4*i))&0xf);
			append( (uint8_t)hex(ch) );
		}
		return *this;
	}

	CString& CString::toHex(char* p, int len)
	{
		CString hex;
		clear();
		for(int n=0; n <len; n++)
		{
			hex.toHex((uint8_t)p[n]);
			append(hex);
		}
		return *this;
	}

	CString& CString::toHex(CByteArray bytes)
	{
		toHex(bytes.data(),bytes.length());
		return *this;
	}

	uint32_t CString::fromHex()
	{
		uint32_t rc=0;
		int len = length();
		int offset=0;
		if ( find("0x") == 0 || find("0X") == 0 )
		{
			offset+=2;
		}
		for(register int n=0; n < 8 && n < (int)len; n++)
		{
			register uint8_t ch = toupper(at(n+offset));
			if ( ch >= 'A' && ch <= 'F' )
			{
				ch = 10+(ch-'A');
			}
			else if ( ch >= '0' && ch <= '9' )
			{
				ch = (ch-'0');
			}
			rc <<= 4;
			rc |= (ch&0x0F);
		}
		return rc;
	}

	/**
	** @brief Convert an unsigned integer to ASCII in base 10.
	** @return self reference.
	*/
	CString& CString::fromBit16(int16_t value,int leading)
	{
		register char tmp[16];
		register char *tp = tmp;
		register unsigned int v;

		clear();

		if ( value < 0 )									/** If value is negative... */
		{
			v = -value;
			append('-');								   /** Output the '-' character. */
		}
		else
		{
			v = (unsigned)value;
		}

		while (v || tp == tmp)
		{
			*tp++ = (v % 10)+'0';
			v /= 10;
		}

		for( v=leading; v > (tp - tmp); v-- )
		{
			append('0');
		}

		while (tp > tmp)
		{
			append(*--tp);
		}
		return *this;
	}

	/**
	** @brief Convert an signed 32-bit integer to ASCII in base 10.
	** @return self reference.
	*/
	CString& CString::fromBit32(int32_t value,int leading)
	{
		register char tmp[16];
		register char *tp = tmp;
		register uint32_t v;

		clear();

		if ( value < 0 )									/** If value is negative... */
		{
			v = -value;
			append('-');								   /** Output the '-' character. */
		}
		else
		{
			v = (unsigned)value;
		}

		while (v || tp == tmp)
		{
			*tp++ = (v % 10)+'0';
			v /= 10;
		}

		for( v=leading; v > (tp - tmp); v-- )
		{
			append('0');
		}

		while (tp > tmp)
		{
			append(*--tp);
		}
		return *this;
	}

	/**
	** @brief Convert an signed 64-bit integer to ASCII in base 10.
	** @return self reference.
	*/
	CString& CString::fromBit64(int64_t value,int leading)
	{
		register char tmp[16];
		register char *tp = tmp;
		register uint64_t v;

		clear();

		if ( value < 0 )									/** If value is negative... */
		{
			v = -value;
			append('-');								   /** Output the '-' character. */
		}
		else
		{
			v = (uint64_t)value;
		}

		while (v || tp == tmp)
		{
			*tp++ = (v % 10)+'0';
			v /= 10;
		}

		for( v=leading; v > (tp - tmp); v-- )
		{
			append('0');
		}

		while (tp > tmp)
		{
			append(*--tp);
		}
		return *this;
	}

	/**
	** @brief Convert an unsigned integer to ASCII in base 10.
	** @return self reference.
	*/
	CString& CString::fromUBit32(uint32_t i)
	{
		register char buf[16];
		register uint32_t index=0;
		register uint32_t power=1000000000;
		bool got_digit=false;

		buf[0]='\0';
		while ( power )
		{
			int digit=0;
			while ( i >= power )
			{
				i -= power;
				++digit;
			}
			if ( digit != 0 || power==1 )
			{
				got_digit=true;
			}
			if ( got_digit )
			{
				buf[index++] = digit + '0';
				buf[index]='\0';
			}
			power /= 10;
		}
		copy(buf);
		return *this;
	}

	/**
	** @brief Convert an unsigned long long (aka 64 bit) integer to ASCII in base 10.
	** @return self reference.
	*/
	CString& CString::fromUBit64(uint64_t i)
	{
		register char buf[16];
		register uint64_t index=0;
		register uint64_t power=1000000000000000000;
		bool got_digit=false;

		buf[0]='\0';
		while ( power )
		{
			int digit=0;
			while ( i >= power )
			{
				i -= power;
				++digit;
			}
			if ( digit != 0 || power==1 )
			{
				got_digit=true;
			}
			if ( got_digit )
			{
				buf[index++] = digit + '0';
				buf[index]='\0';
			}
			power /= 10;
		}
		copy(buf);
		return *this;
	}

	/**
	** @brief Does the string contain a number?
	*/
	bool CString::isNumber()
	{
		if ( data() )
		{
			for (register int n=0; data() && data()[n]; n++)
			{
				register char c = data()[n];
				if (!isnum(c) && c!='.' && c!='-')
				{
					return false;
				}
			}
			return true;
		}
		return false;
	}

	/**
	** @brief Convert to an unsigned integer.
	*/
	unsigned int CString::toUInt()
	{
		if ( data() )
		{
			return (unsigned int)atoi(data());
		}
		return 0;
	}

	/**
	** @brief Convert to a signed integer.
	*/
	int CString::toInt()
	{
		if ( data() )
		{
			return atoi(data());
		}
		return 0;
	}

	/**
	** @brief Convert to an unsigned integer.
	*/
	uint64_t CString::toUInt64()
	{
		if ( data() )
		{
			return (unsigned int)atoll(data());
		}
		return 0;
	}

	/**
	** @brief Convert to a signed integer.
	*/
	int64_t CString::toInt64()
	{
		if ( data() )
		{
			return atoll(data());
		}
		return 0;
	}

	/**
	** @brief Convert string to bool
	*/
	bool CString::toBool()
	{
		bool rc ( casecompare( "true" ) == 0 || casecompare( "yes" ) == 0 || casecompare( "t" ) == 0 );
		return rc;
	}

	/**
	** @brief Convert from bool
	*/
	CString& CString::fromBool(bool b)
	{
		if ( b )
			copy("TRUE");
		else
			copy("FALSE");
		return *this;
	}

	/**
	* @brief Converts an IEEE 754 double precision (32 bit) floating point number to ascii text.
	* @param dplaces number of decimal places
	* @param conv the conversion character
	*/
	CString& CString::fromDouble(double f,int dplaces,char conv)
	{
		char temp[49];
		memset(temp,0,49);
		dtoa(temp,conv,48,dplaces,f);
		copy((char*)temp);
		return *this;
	}

	double CString::toDouble()
	{
		if ( data() )
		{
			return atof((const char*)data());
		}
		return 0.0;
	}

	CString CString::number(double f,int dplaces,char conv)
	{
		CString rc;
		rc.fromDouble(f, dplaces, conv);
		return rc;
	}

	CString CString::number(int n)
	{
		CString rc;
		rc.fromBit32(n);
		return rc;
	}

	CString CString::number(uint32_t n)
	{
		CString rc;
		rc.fromUBit32(n);
		return rc;
	}

	CString CString::number(uint64_t n)
	{
		CString rc;
		rc.fromUBit64(n);
		return rc;
	}

	/**
	** \brief sprintf( fmt, ... ) Appends formted text and returns a reference.
	** %b - uint8_t - hex 2 digits
	** %c - character
	** %s - string
	** %x - ubit16 - hex 4 digits
	** %X - uint32_t - hex 8 digits
	** %f - float - 32 bit signed ieee754
	** \return returns reference
	*/
	void CString::print( const char* fmt, va_list ap )
	{
		const char *p=fmt;
		bool zeros=false;
		bool long_long=false;
		uint32_t fill=0;
		CString tBuf;

		clear();

		while( *p != '\0' ) 
		{
			long_long = false;
			if ( *p == '%' ) 
			{
				++p;

				if ( *p == '0' )
				{
					zeros = true;
					++p;
				}
				else
				{
					zeros = false;
				}

				tBuf.clear();
				while ( isnum( *p ) )
				{
					tBuf.append( *p );
					++p;
				}
				fill = tBuf.toUInt();

				if ( *p == 'l' && *(p+1) != '\0' ) // long long?
				{
					long_long=true;
					++p;
				}

				switch (*p ) 
				{
					case 'X':
					case 'x':
					case 'd':
					case 'u':
						{
							CString dec;
							if ( *p == 'x' || *p == 'X' )
							{
								if ( long_long )
								{
									switch(fill)
									{
										default:
										case 0: 
											dec.toHex( (uint64_t)va_arg(ap,uint64_t) );
											break;
										case 2:
											dec.toHex( (uint8_t)va_arg(ap,uint64_t) );
											break;
										case 4:
											dec.toHex( (uint16_t)va_arg(ap,uint64_t) );
											break;
										case 8:
											dec.toHex( (uint32_t)va_arg(ap,uint64_t) );
											break;
									}
								}
								else
								{
									switch(fill)
									{
										default:
										case 0: 
											dec.toHex( (uint32_t)va_arg(ap,uint32_t) );
											break;
										case 2:
											dec.toHex( (uint8_t)va_arg(ap,uint32_t) );
											break;
										case 4:
											dec.toHex( (uint16_t)va_arg(ap,uint32_t) );
											break;
										case 8:
											dec.toHex( (uint32_t)va_arg(ap,uint32_t) );
											break;
									}
								}
							}
							else if (*p == 'd' )
							{
								if ( long_long )
									dec.fromBit64( (int64_t)va_arg(ap,int64_t) );
								else
									dec.fromBit32( (int32_t)va_arg(ap,int32_t) );
							}
							else if (*p == 'u' )
							{
								if ( long_long )
									dec.fromUBit64( (int64_t)va_arg(ap,int64_t) );
								else
									dec.fromUBit32( (int32_t)va_arg(ap,int32_t) );
							}
							while ( dec.length() < fill )
							{
								dec.prepend( zeros ? '0' : ' ' );
							}
							append( dec );
						}
						break;
					case 'c':
						append( (char)va_arg(ap,int) );
						break;
					case 's':
						{
							char* s = (char*)va_arg(ap,char*);
							if ( !s )
								s="(null)";
							append( (char*)s );
						}
						break;
					case 'g':
					case 'f':
						{
							CString t;
							t.fromDouble((double)va_arg(ap,double),fill);
							append(t);
						}
						break;
					case '%':
						append(*p);
						break;
				}
				++p;
			}
			else
			{
				append( *p++ );
			}
		}
	}

	/**
	** \brief sprintf( fmt, ... ) Appends formted text and returns a reference.
	** %b - uint8_t - hex 2 digits
	** %c - character
	** %s - string
	** %x - ubit16 - hex 4 digits
	** %X - uint32_t - hex 8 digits
	** %f - float - 32 bit signed ieee754
	** \return returns reference
	*/
	CString& CString::sprintf( const char* fmt, ... )
	{
		va_list args;
		va_start( args, fmt );
		const char *p=fmt;
		bool zeros=false;
		bool decimal_places_specified=false;
		bool long_long=false;
		uint32_t fill=0;
		uint32_t decimal_places=0;
		CString tBuf;

		clear();

		while( *p != '\0' ) 
		{
			long_long = false;
			if ( *p == '%' ) 
			{
				++p;

				if ( *p == '0' )
				{
					zeros = true;
					++p;
				}
				else
				{
					zeros = false;
				}

				tBuf.clear();
				while ( isnum( *p ) )
				{
					tBuf.append( *p );
					++p;
				}
				fill = tBuf.toUInt();

				if ( *p == '.' )
				{
					decimal_places_specified = true;
					++p;
					tBuf.clear();
					while ( isnum( *p ) )
					{
						tBuf.append( *p );
						++p;
					}
					decimal_places = tBuf.toUInt();
				}
				else
				{
					decimal_places_specified = false;
				}

				if ( *p == 'l' && *(p+1) != '\0' ) // long long?
				{
					long_long=true;
					++p;
				}

				switch (*p ) 
				{
					case 'X':
					case 'x':
					case 'd':
					case 'u':
						{
							CString dec;
							if ( *p == 'x' || *p == 'X' )
							{
								if ( long_long )
								{
									switch(fill)
									{
										default:
										case 0: 
											dec.toHex( (uint64_t)va_arg(args,uint64_t) );
											break;
										case 2:
											dec.toHex( (uint8_t)va_arg(args,uint64_t) );
											break;
										case 4:
											dec.toHex( (uint16_t)va_arg(args,uint64_t) );
											break;
										case 8:
											dec.toHex( (uint32_t)va_arg(args,uint64_t) );
											break;
									}
								}
								else
								{
									switch(fill)
									{
										default:
										case 0: 
											dec.toHex( (uint32_t)va_arg(args,uint32_t) );
											break;
										case 2:
											dec.toHex( (uint8_t)va_arg(args,uint32_t) );
											break;
										case 4:
											dec.toHex( (uint16_t)va_arg(args,uint32_t) );
											break;
										case 8:
											dec.toHex( (uint32_t)va_arg(args,uint32_t) );
											break;
									}
								}
							}
							else if (*p == 'd' )
							{
								if ( long_long )
									dec.fromBit64( (int64_t)va_arg(args,int64_t) );
								else
									dec.fromBit32( (int32_t)va_arg(args,int32_t) );
							}
							else if (*p == 'u' )
							{
								if ( long_long )
									dec.fromUBit64( (int64_t)va_arg(args,int64_t) );
								else
									dec.fromUBit32( (int32_t)va_arg(args,int32_t) );
							}
							while ( dec.length() < fill )
							{
								dec.prepend( zeros ? '0' : ' ' );
							}
							append( dec );
						}
						break;
					case 'c':
						append( (char)va_arg(args,int) );
						break;
					case 's':
						{
							char* s = (char*)va_arg(args,char*);
							if ( !s )
								s="(null)";
							append( (char*)s );
						}
						break;
					case 'g':
					case 'f':
						{
							CString t;
							if ( decimal_places_specified )
							{
								t.fromDouble((double)va_arg(args,double),decimal_places);
							}
							else
							{
								t.fromDouble((double)va_arg(args,double),2);
							}
							append(t);
						}
						break;
					case '%':
						append(*p);
						break;
				}
				++p;
			}
			else
			{
				append( *p++ );
			}
		}
		va_end( args );
		return *this;
	}

	/**
	** Convert from msec integer to time HHHH:MM:SS:zzz format
	*/
	#if 0
	CString& CString::fromMsec(uint32_t msec)
	{
		int32_t DD = (msec / (24 * 60 * 60 * 1000));
		int32_t HH = (msec / (60 * 60 * 1000)) % 24;
		int32_t MM = (msec / (60 * 1000)) % 60;
		int32_t SS = (msec / 1000) % 60;
		int32_t ZZ = msec % 1000;
		clear();
		sprintf("%03d:%02d:%02d:%02d.%03d",DD,HH,MM,SS,ZZ);
		return *this;
	}
	#endif

} /* namespace PikeAero */

