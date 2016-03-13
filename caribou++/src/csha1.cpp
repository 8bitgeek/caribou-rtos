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
#include <caribou++/csha1.h>

namespace CARIBOU
{
	CSHA1::CSHA1()
	{
		reset();
	}

	CSHA1::CSHA1(const CARIBOU::CByteArray cleartext)
	{
		reset();
		input(cleartext);
	}

	CSHA1::~CSHA1()
	{
	}

	/**
	  * @brief initialize in preparation for computing a new message digest
	  */
	void CSHA1::reset()
	{
		mLengthLo				= 0;
		mLengthHi				= 0;
		mMessageBlockIndex		= 0;
		mMessageDigest[0]		= 0x67452301;
		mMessageDigest[1]		= 0xEFCDAB89;
		mMessageDigest[2]		= 0x98BADCFE;
		mMessageDigest[3]		= 0x10325476;
		mMessageDigest[4]		= 0xC3D2E1F0;
		mComputed				= 0;
		mCorrupted				= 0;
	}

	/*
	 * @return the 160-bit message digest
	 */
	CARIBOU::CByteArray CSHA1::result()
	{
		CARIBOU::CByteArray rc;
		if ( !mCorrupted )
		{
			if ( !mComputed )
			{
				padMessage();
				for(int i=0; i < 5; i++)
				{
					uint32_t word = mMessageDigest[i];
					for(int j=0; j < 4; j++)
					{
						uint8_t byte = (word&0xFF000000)>>24;
						word <<= 8;
						rc.append(byte);
					}
				}
			}
		}
		return rc;
	}

	CARIBOU::CString CSHA1::hexResult()
	{
		CARIBOU::CString rc;
		rc.toHex(result());
		return rc;
	}

	/**
	 * @brief This function accepts octets as the next portion of the message.
	 */
	void CSHA1::input(const uint8_t *message, size_t size)
	{
		if ( size > 0 )
		{
			if ( !mComputed && !mCorrupted )
			{
				while(size-- && !mCorrupted)
				{
					mMessageBlock[mMessageBlockIndex++] = (*message & 0xFF);
					mLengthLo += 8;
					mLengthLo &= 0xFFFFFFFF;				/* Force it to 32 bits */
					if (mLengthLo == 0)
					{
						mLengthHi++;
						mLengthHi &= 0xFFFFFFFF;			/* Force it to 32 bits */
						if (mLengthHi == 0)
						{
							mCorrupted = true;				/* Message is too long */
						}
					}

					if (mMessageBlockIndex == 64)
					{
						processMessageBlock();
					}

					message++;
				}
			}
			else
			{
				mCorrupted = true;
			}
		}
	}

	/**
	 * @brief This function accepts octets as the next portion of the message.
	 */
	void CSHA1::input(CARIBOU::CByteArray message)
	{
		input((const uint8_t*)message.data(),message.length());
	}

	/**
	 * @brief
	 *      According to the standard, the message must be padded to an even
	 *      512 bits.  The first padding bit must be a '1'.  The last 64
	 *      bits represent the length of the original message.  All bits in
	 *      between should be 0.  This function will pad the message
	 *      according to those rules by filling the Message_Block array
	 *      accordingly.  It will also call processMessageBlock()
	 *      appropriately.  When it returns, it can be assumed that the
	 *      message digest has been computed.
	 */
	void CSHA1::padMessage()
	{
		/*
		 *  Check to see if the current message block is too small to hold
		 *  the initial padding bits and length.  If so, we will pad the
		 *  block, process it, and then continue padding into a second
		 *  block.
		 */
		if (mMessageBlockIndex > 55)
		{
			mMessageBlock[mMessageBlockIndex++] = 0x80;
			while(mMessageBlockIndex < 64)
			{
				mMessageBlock[mMessageBlockIndex++] = 0;
			}

			processMessageBlock();

			while(mMessageBlockIndex < 56)
			{
				mMessageBlock[mMessageBlockIndex++] = 0;
			}
		}
		else
		{
			mMessageBlock[mMessageBlockIndex++] = 0x80;
			while(mMessageBlockIndex < 56)
			{
				mMessageBlock[mMessageBlockIndex++] = 0;
			}
		}

		/*
		 *  Store the message length as the last 8 octets
		 */
		mMessageBlock[56] = (mLengthHi >> 24) & 0xFF;
		mMessageBlock[57] = (mLengthHi >> 16) & 0xFF;
		mMessageBlock[58] = (mLengthHi >> 8) & 0xFF;
		mMessageBlock[59] = (mLengthHi) & 0xFF;
		mMessageBlock[60] = (mLengthLo >> 24) & 0xFF;
		mMessageBlock[61] = (mLengthLo >> 16) & 0xFF;
		mMessageBlock[62] = (mLengthLo >> 8) & 0xFF;
		mMessageBlock[63] = (mLengthLo) & 0xFF;

		processMessageBlock();
		
	}
	
	/**
	 * @brief This function will process the next 512 bits of the message
	 *      stored in the Message_Block array.
	 */
	void CSHA1::processMessageBlock()
	{
		const uint32_t constK[] =            /* Constants defined in SHA-1   */      
		{
			0x5A827999,
			0x6ED9EBA1,
			0x8F1BBCDC,
			0xCA62C1D6
		};
		int32_t     t;                  /* Loop counter                 */
		uint32_t    temp;               /* Temporary word value         */
		uint32_t    seqW[80];           /* Word sequence                */
		uint32_t    tmpA;				/* Word buffers                 */
		uint32_t	tmpB;
		uint32_t	tmpC;
		uint32_t	tmpD;
		uint32_t	tmpE;      

		/*
		 *  Initialize the first 16 words in the array W
		 */
		for(t = 0; t < 16; t++)
		{
			seqW[t] = ((uint32_t) mMessageBlock[t * 4]) << 24;
			seqW[t] |= ((uint32_t) mMessageBlock[t * 4 + 1]) << 16;
			seqW[t] |= ((uint32_t) mMessageBlock[t * 4 + 2]) << 8;
			seqW[t] |= ((uint32_t) mMessageBlock[t * 4 + 3]);
		}

		for(t = 16; t < 80; t++)
		{
		   seqW[t] = circularShift(1,seqW[t-3] ^ seqW[t-8] ^ seqW[t-14] ^ seqW[t-16]);
		}

		tmpA = mMessageDigest[0];
		tmpB = mMessageDigest[1];
		tmpC = mMessageDigest[2];
		tmpD = mMessageDigest[3];
		tmpE = mMessageDigest[4];

		for(t = 0; t < 20; t++)
		{
			temp =  circularShift(5,tmpA) + ((tmpB & tmpC) | ((~tmpB) & tmpD)) + tmpE + seqW[t] + constK[0];
			temp &= 0xFFFFFFFF;
			tmpE = tmpD;
			tmpD = tmpC;
			tmpC = circularShift(30,tmpB);
			tmpB = tmpA;
			tmpA = temp;
		}

		for(t = 20; t < 40; t++)
		{
			temp = circularShift(5,tmpA) + (tmpB ^ tmpC ^ tmpD) + tmpE + seqW[t] + constK[1];
			temp &= 0xFFFFFFFF;
			tmpE = tmpD;
			tmpD = tmpC;
			tmpC = circularShift(30,tmpB);
			tmpB = tmpA;
			tmpA = temp;
		}

		for(t = 40; t < 60; t++)
		{
			temp = circularShift(5,tmpA) + ((tmpB & tmpC) | (tmpB & tmpD) | (tmpC & tmpD)) + tmpE + seqW[t] + constK[2];
			temp &= 0xFFFFFFFF;
			tmpE = tmpD;
			tmpD = tmpC;
			tmpC = circularShift(30,tmpB);
			tmpB = tmpA;
			tmpA = temp;
		}

		for(t = 60; t < 80; t++)
		{
			temp = circularShift(5,tmpA) + (tmpB ^ tmpC ^ tmpD) + tmpE + seqW[t] + constK[3];
			temp &= 0xFFFFFFFF;
			tmpE = tmpD;
			tmpD = tmpC;
			tmpC = circularShift(30,tmpB);
			tmpB = tmpA;
			tmpA = temp;
		}

		mMessageDigest[0] =	(mMessageDigest[0] + tmpA) & 0xFFFFFFFF;
		mMessageDigest[1] =	(mMessageDigest[1] + tmpB) & 0xFFFFFFFF;
		mMessageDigest[2] =	(mMessageDigest[2] + tmpC) & 0xFFFFFFFF;
		mMessageDigest[3] =	(mMessageDigest[3] + tmpD) & 0xFFFFFFFF;
		mMessageDigest[4] =	(mMessageDigest[4] + tmpE) & 0xFFFFFFFF;

		mMessageBlockIndex = 0;
	}

	CARIBOU::CString sha1(CARIBOU::CString clearText)
	{
		CARIBOU::CString rc;
		CARIBOU::CSHA1 sha1;
		sha1.input((const uint8_t*)clearText.data(),clearText.length());
		rc = sha1.hexResult();
		return rc;
	}

}

