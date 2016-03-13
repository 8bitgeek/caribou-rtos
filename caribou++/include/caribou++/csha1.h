/******************************************************************************
* Copyright © 2016 by Pike Aerospace Research Corporation
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
#ifndef _CARIBOU_CSHA1_H_
#define _CARIBOU_CSHA1_H_

#include <caribou++.h>
#include <caribou++/cbytearray.h>
#include <caribou++/cstring.h>

namespace CARIBOU
{

	class CSHA1
	{
		public:

			CSHA1();
			CSHA1(const CARIBOU::CByteArray cleartext);
			~CSHA1();

			void					reset();
			void					input( const uint8_t* message, size_t size);
			void					input( CARIBOU::CByteArray message );
			CARIBOU::CByteArray		result();
			CARIBOU::CString		hexResult();

		private:

			void					padMessage();
			void					processMessageBlock();
			inline uint32_t			circularShift( uint32_t bits, uint32_t word)
									{
										return ((((word) << (bits)) & 0xFFFFFFFF) | ((word) >> (32-(bits))));
									}

			uint32_t				mMessageDigest[5];		/* Message Digest (output) */
			uint32_t				mLengthLo;				/* Message length in bits */
			uint32_t				mLengthHi;				/* Message length in bits */
			uint8_t					mMessageBlock[64];		/* 512-bit message blocks */
			int						mMessageBlockIndex;		/* Index into message block */
			int						mComputed;				/* Is the digest computed? */
			int						mCorrupted;             /* Is the message digest corruped? */
	};

	extern 	CARIBOU::CString sha1(CARIBOU::CString clearText);

}

#endif /* _CARIBOU_CSHA1_H_ */

