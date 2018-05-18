/******************************************************************************
* Copyright © 2005-2013 by Pike Aerospace Research Corporation
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
#ifndef CARIBOU_ARCH_CC_H
#define CARIBOU_ARCH_CC_H

#include <caribou.h>
#include <board.h>

#ifdef __cplusplus
extern "C"
{
#endif

#define BYTE_ORDER LITTLE_ENDIAN

#define	LWIP_ERR_T		char

typedef	char			s8_t;
typedef	unsigned char	u8_t; 

typedef	short			s16_t;
typedef	unsigned short	u16_t;

typedef	int				s32_t;
typedef	unsigned int	u32_t;

typedef unsigned int	mem_ptr_t;

#define U16_F "u"
#define S16_F "d"
#define X16_F "04X"
#define U32_F "u"
#define S32_F "d"
#define X32_F "08X"

#define PACK_STRUCT_FIELD(x) x __attribute__((packed))
#define PACK_STRUCT_STRUCT __attribute__((packed))
#define PACK_STRUCT_BEGIN
#define PACK_STRUCT_END

/**
	IP protocols use checksums (see RFC 1071). LwIP gives you a choice of 3 algorithms:
		1) load byte by byte, construct 16 bits word and add: not efficient for most platforms
		2) load first byte if odd address, loop processing 16 bits words, add last byte.
		3) load first byte and word if not 4 byte aligned, loop processing 32 bits words, add last word/byte.
*/
#define LWIP_CHKSUM_ALGORITHM 3


/** Begin a block of protection. Should generally return the previous state. */
#define SYS_ARCH_PROTECT(x) x=sys_arch_protect()
/** End a block of protection, restoring the protection state back to "x". */
#define SYS_ARCH_UNPROTECT(x) sys_arch_unprotect(x)
/** Declare the variable "x" to hold the protection. Used so you can specify what data type the protection will require. */
#define SYS_ARCH_DECL_PROTECT(x) int x

void abort(void);

#ifndef LWIP_PLATFORM_DIAG
#define LWIP_PLATFORM_DIAG(x)	do {DEBUG_PRINTF x;} while(0)
#endif

#if 0
	#ifndef LWIP_PLATFORM_ASSERT
	#define LWIP_PLATFORM_ASSERT(x) do {DEBUG_PRINTF("Assertion \"%s\" failed at line %d in %s\n", \
										 x, __LINE__, __FILE__); abort();} while(0)
	#endif
#else
	#ifndef LWIP_PLATFORM_ASSERT
	#define LWIP_PLATFORM_ASSERT(x) {debug_printf("Assertion \"%s\" failed at line %d in %s\n", \
										 x, __LINE__, __FILE__);} while(0)
	#endif
#endif

#ifdef __cplusplus
}
#endif

#endif /* INCLUDED_ARCH_CC_H */

