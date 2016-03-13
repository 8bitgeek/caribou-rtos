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
#ifndef _CARIBOU_CSTRING_H_
#define _CARIBOU_CSTRING_H_

#include <caribou++/cbytearray.h>
#include <caribou++/clist.h>

namespace CARIBOU
{

	class CString : public CByteArray
	{
		public:
			CString();
			CString( const char* str, int len=-1 );
			CString( double f,int dplaces = 4,char conv = 'f' );
			CString( const CString& other );
			virtual ~CString();

			virtual size_t				resize( size_t size );
			bool						append( CString& other );
			bool						append( const char* data );
			bool						append( char ch );

			bool						prepend( uint8_t data );
			bool						prepend( const char* data );
			bool						prepend( const CString& data );

			bool						strcpy( const char* s,size_t len=0 );
			bool						strcat( const char* s,size_t len=0 );

			bool						copy( const char* data, int len=-1 );
			bool						copy( const CString& other );

			int							compare( const char* s );
			int							compare( CString& other );
			int							compare( const char* s, size_t sz );
			int							compare( CString& other,size_t sz );

			int							casecompare( register const char* s2 );
			int							casecompare( CString& other );

			virtual int					find( char ch, int index=0);
			int							find( const char* needle, size_t offset=0);
			int							find( const CString& needle, size_t offset=0);
			CString&					replace( const char* needle, CString replacement, size_t offset=0);
			CString&					trim();
			size_t						skip( const char* match, size_t offset=0);

			CString&					operator=( const CString& other )	{copy(other);return *this;}
			CString&					operator=( const char* data )		{copy(data);return *this;}
			CString&					operator=( const int data )			{fromInt(data); return *this;}
			CString&					operator=( const double data)		{fromDouble(data); return *this;}

			CString&					operator+=( CString& other )		{append(other);return *this;}
			CString&					operator+=( const char* data )		{append(data);return *this;}
			CString&					operator+=( char ch )				{append(ch);return *this;}

			bool						operator==( CString& other )		{return compare(other)==0;}
			bool						operator==( const char* other )		{return compare(other)==0;}

			bool						operator!=( CString& other )		{return compare(other)!=0;}
			bool						operator!=( const char* other )		{return compare(other)!=0;}

			bool						operator>( CString& other )			{return compare(other)>0;}
			bool						operator>( const char* other )		{return compare(other)>0;}

			bool						operator<( CString& other )			{return compare(other)<0;}
			bool						operator<( const char* other )		{return compare(other)<0;}

			bool						operator>=( CString& other )		{return compare(other)>=0;}
			bool						operator>=( const char* other )		{return compare(other)>=0;}

			bool						operator<=( CString& other )		{return compare(other)<=0;}
			bool						operator<=( const char* other )		{return compare(other)<=0;}

			size_t						length()							{return data()!=NULL?strlen(data()):0;}
			bool						isEmpty()							{return isNull() || strlen(data())==0;}
			bool						isNumber();

			CString&					toLower();
			CString&					toUpper();
			CString						left( int n );
			CString						right( int n );
			CString						mid( int index, int n );
			CList<CString*>				explode( char separator, int index=0 );
			CString&					sprintf( const char* fmt, ... );
			void						print( const char *fmt, va_list args );

			CString&					fromUInt(unsigned int i) {return fromUBit32((uint32_t)i);}
			CString&					fromInt(int i) {return fromBit32((int32_t)i);}

			CString&					toHex(CByteArray bytes);
			CString&					toHex(char* p, int len);
			CString&					toHex(uint8_t n);
			CString&					toHex(uint16_t n);
			CString&					toHex(uint32_t n);
			CString&					toHex(uint64_t n);

			virtual int					toInt();
			virtual unsigned int		toUInt();
			virtual int64_t				toInt64();
			virtual uint64_t			toUInt64();
			virtual bool				toBool();
			virtual double				toDouble();

			static	CString				number(int n);
			static	CString				number(uint32_t n);
			static	CString				number(uint64_t n);
			static	CString				number(double f,int dplaces = 4,char conv = 'f');

			//CString&					fromMsec(uint32_t msec);
			CString&					fromBit16(int16_t i,int leading=0);
			CString&					fromBit32(int32_t i,int leading=0);
			CString&					fromBit64(int64_t i,int leading=0);
			CString&					fromUBit32(uint32_t i);
			CString&					fromUBit64(uint64_t i);
			CString&					fromBool(bool b);
			CString&					fromDouble(double d,int dplaces=4,char conv='f');
			uint32_t					fromHex();

			static	bool				isalpha(uint8_t c);

		protected:

	};

} /* namespace CARIBOU */

#endif
