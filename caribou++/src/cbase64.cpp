/** ***************************************************************************
* @file cbase64.h
* @author Mike Sharkey <mike@pikeaero.com>.
* @copyright © 2005-2013 by Pike Aerospace Research Corporation
* @copyright © 2014-2015 by Mike Sharkey
* @details This file is part of CARIBOU RTOS
* CARIBOU RTOS is free software: you can redistribute it and/or modify
* it under the terms of the Beerware License Version 43.
* "THE BEER-WARE LICENSE" (Revision 43):
* Mike Sharkey <mike@pikeaero.com> wrote this file. 
* As long as you retain this notice you can do whatever you want with
* this stuff. If we meet some day, and you think this stuff is 
* worth it, you can buy me a beer in return ~ Mike Sharkey
******************************************************************************/
#include <caribou++/cbase64.h>

#define BASE64_PAD		'='
#define BASE64DE_FIRST	'+'
#define BASE64DE_LAST	'z'

namespace CARIBOU
{

	/* BASE 64 encode table */
	const char CBase64::base64en[] = {
		'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H',
		'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P',
		'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X',
		'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f',
		'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n',
		'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
		'w', 'x', 'y', 'z', '0', '1', '2', '3',
		'4', '5', '6', '7', '8', '9', '+', '/',
	};

	/* ASCII order for BASE 64 decode, -1 in unused character */
	const char CBase64::base64de[] = {
		/* '+', ',', '-', '.', '/', '0', '1', '2', */ 
			62,  -1,  -1,  -1,  63,  52,  53,  54,

		/* '3', '4', '5', '6', '7', '8', '9', ':', */
			55,  56,  57,  58,  59,  60,  61,  -1,

		/* ';', '<', '=', '>', '?', '@', 'A', 'B', */
			-1,  -1,  -1,  -1,  -1,  -1,   0,   1, 

		/* 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', */
			 2,   3,   4,   5,   6,   7,   8,   9,

		/* 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', */ 
			10,  11,  12,  13,  14,  15,  16,  17,

		/* 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', */
			18,  19,  20,  21,  22,  23,  24,  25,

		/* '[', '\', ']', '^', '_', '`', 'a', 'b', */ 
			-1,  -1,  -1,  -1,  -1,  -1,  26,  27,

		/* 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', */ 
			28,  29,  30,  31,  32,  33,  34,  35,

		/* 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', */
			36,  37,  38,  39,  40,  41,  42,  43,

		/* 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', */
			44,  45,  46,  47,  48,  49,  50,  51,
	};

	CBase64::CBase64()
	{
	}

	CBase64::CBase64(CARIBOU::CString in)
	{
	}

	CBase64::~CBase64()
	{
	}

	CARIBOU::CByteArray CBase64::encode(CARIBOU::CByteArray in)
	{
		CARIBOU::CByteArray out;
		size_t i; 
		size_t j;
		for (i = j = 0; i < in.length(); i++) 
		{
			int s = i % 3; 			/* from 6/gcd(6, 8) */
			switch (s) 
			{
				case 0:
					out.append(base64en[(in.at(i) >> 2) & 0x3F]);
					break;
				case 1:
					out.append(base64en[((in.at(i-1) & 0x3) << 4) + ((in.at(i) >> 4) & 0xF)]);
					break;
				case 2:
					out.append(base64en[((in.at(i-1) & 0xF) << 2) + ((in.at(i) >> 6) & 0x3)]);
					out.append(base64en[in.at(i) & 0x3F]);
					break;
			}
		}
		/* move back */
		i -= 1;
		/* check the last and add padding */
		if ((i % 3) == 0)
		{
			out.append(base64en[(in.at(i) & 0x3) << 4]);
			out.append(BASE64_PAD);
			out.append(BASE64_PAD);
		} 
		else if ((i % 3) == 1) 
		{
			out.append(base64en[(in.at(i) & 0xF) << 2]);
			out.append(BASE64_PAD);
		}
		return out;
	}

	CARIBOU::CByteArray CBase64::decode(CARIBOU::CByteArray in)
	{
		CARIBOU::CByteArray out;
		int i;
		int j;
		for (i = j = 0; i < (int)in.length(); i++) 
		{
			int c;
			int s = i % 4; 			/* from 8/gcd(6, 8) */

			if (in.at(i) == '=')
				return out;

			if (in.at(i) < BASE64DE_FIRST || in.at(i) > BASE64DE_LAST || (c = base64de[in.at(i) - BASE64DE_FIRST]) == -1)
			{
				out.clear();
				return out; /* invalid */
			}

			switch (s) 
			{
				case 0:
					out.set(j, c << 2);
					break;
				case 1:
					out.set( j, (out.at(j) + (c >> 4)) & 0x3 ); j++;
					/* if not last char with padding */
					if (i < ((int)in.length() - 3) || in.at(in.length() - 2) != '=')
						out.set(j, (c & 0xF) << 4);
					break;
				case 2:
					out.set( j, (out.at(j) + (c >> 2)) & 0xF ); j++;
					/* if not last char with padding */
					if (i < ((int)in.length() - 2) || in.at(in.length() - 1) != '=')
						out.set(j, (c & 0x3) << 6);
					break;
				case 3:
					out.set(j++,c);
					break;
			}
		}
		return out;	
	}

}

