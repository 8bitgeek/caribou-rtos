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
#ifndef _CARIBOU_CMD5_H_
#define _CARIBOU_CMD5_H_

#include <caribou++.h>
#include <caribou++/cstring.h>

#define CARIBOU_MD5_BLOCKSIZE	64

namespace CARIBOU
{

	class CMD5
	{
		public:

			CMD5();
			CMD5(const CARIBOU::CString cleartext);
			~CMD5();

			void					update(uint8_t* clearText, size_t size);
			CMD5&					finalize();
			CARIBOU::CString		hexdigest();

		private:
			void init();

			/** F, G, H and I are basic MD5 functions. */
			inline uint32_t			F(uint32_t x, uint32_t y, uint32_t z) {return (x&y) | (~x&z);}
			inline uint32_t			G(uint32_t x, uint32_t y, uint32_t z) {return (x&z) | (y&~z);}
			inline uint32_t			H(uint32_t x, uint32_t y, uint32_t z) {return x^y^z;}
			inline uint32_t			I(uint32_t x, uint32_t y, uint32_t z) {return y ^ (x | ~z);}

			/** rotate_left rotates x left n bits. */
			inline uint32_t			rotate_left(uint32_t x, int n)	{return (x << n) | (x >> (32-n));}
			/**
			 * FF, GG, HH, and II transformations for rounds 1, 2, 3, and 4.
			 * Rotation is separate from addition to prevent recomputation.
			 */
			inline void				FF(uint32_t &a, uint32_t b, uint32_t c, uint32_t d, uint32_t x, uint32_t s, uint32_t ac) 
									{
										a = rotate_left(a+ F(b,c,d) + x + ac, s) + b;
									}

			inline void				GG(uint32_t &a, uint32_t b, uint32_t c, uint32_t d, uint32_t x, uint32_t s, uint32_t ac) 
									{
										a = rotate_left(a + G(b,c,d) + x + ac, s) + b;
									}
 
			inline void				HH(uint32_t &a, uint32_t b, uint32_t c, uint32_t d, uint32_t x, uint32_t s, uint32_t ac) 
									{
										a = rotate_left(a + H(b,c,d) + x + ac, s) + b;
									}
 
			inline void				II(uint32_t &a, uint32_t b, uint32_t c, uint32_t d, uint32_t x, uint32_t s, uint32_t ac) 
									{
										a = rotate_left(a + I(b,c,d) + x + ac, s) + b;
									}

			void					transform(const uint8_t block[CARIBOU_MD5_BLOCKSIZE]);

			void					decode(uint32_t output[], const uint8_t input[], size_t size);
			void					encode(uint8_t output[], const uint32_t input[], size_t size);

			bool					finalized;
			uint8_t					buffer[CARIBOU_MD5_BLOCKSIZE+4];	/** bytes that didn't fit in last 64 byte chunk */
			uint32_t				count[2];						/** 64bit counter for number of bits (lo, hi) */
			uint32_t				state[4];						/** digest so far */
			uint8_t					digest[16];						/** the result */
	};

	extern 	CARIBOU::CString md5(CARIBOU::CString clearText);

}

#endif

