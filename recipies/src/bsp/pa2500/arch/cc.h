/*****************************************************************************
* Copyright (c) 2017 by Pike Aerospace Research Corp.                        *
* All Rights Reserved                                                        *
*****************************************************************************/
#ifndef CARIBOU_ARCH_CC_H
#define CARIBOU_ARCH_CC_H

#include <caribou/kernel/types.h>

#ifdef __cplusplus
extern "C"
{
#endif

#define BYTE_ORDER LITTLE_ENDIAN

/* Tell LwIP 2.x not to compile in it's byte-order functions */
#define LWIP_DONT_PROVIDE_BYTEORDER_FUNCTIONS

/* Override the LwIP 2.x byte-order functions */
#define lwip_htons(x) LWIP_PLATFORM_HTONS(x)
#define lwip_htonl(x) LWIP_PLATFORM_HTONL(x)

/* The "naked" attribute eliminates function preamble */
extern uint16_t __attribute__((naked)) LWIP_PLATFORM_HTONS(uint16_t x);
extern uint32_t __attribute__((naked)) LWIP_PLATFORM_HTONL(uint32_t x);

#define	LWIP_ERR_T		char

typedef	int8_t			s8_t;
typedef	unsigned char	u8_t; 

typedef	short			s16_t;
typedef	unsigned short	u16_t;

typedef	int32_t			s32_t;
typedef	uint32_t		u32_t;

typedef unsigned int	mem_ptr_t;

#define U16_F "u"
#define S16_F "d"
#define X16_F "X"
#define U32_F "u"
#define S32_F "d"
#define X32_F "X"

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

#if 1 //SYS_LIGHTWEIGHT_PROT
		/** Begin a block of protection. Should generally return the previous state. */
		#define SYS_ARCH_PROTECT(x) caribou_mutex_lock(&x,0)
		/** End a block of protection, restoring the protection state back to "x". */
		#define SYS_ARCH_UNPROTECT(x) caribou_mutex_unlock(&x)
		/** Declare the variable "x" to hold the protection. Used so you can specify what data type the protection will require. */
		#define SYS_ARCH_DECL_PROTECT(x) static CARIBOU_MUTEX_DECL_F(x,CARIBOU_MUTEX_F_RECURSIVE);
#else
	#define SYS_ARCH_PROTECT(x)			caribou_thread_lock();
	#define SYS_ARCH_UNPROTECT(x)		caribou_thread_unlock();
	#define SYS_ARCH_DECL_PROTECT(x)	
#endif

void abort(void);

#ifndef LWIP_PLATFORM_DIAG
#define LWIP_PLATFORM_DIAG(x)	do {debug_printf x;} while(0)
#endif

#if defined(LWIP_PLATFORM_ASSERT_DEBUG_PRINTF)
	#ifndef LWIP_PLATFORM_ASSERT
	#define LWIP_PLATFORM_ASSERT(x) {debug_printf("Assertion \"%s\" failed at line %d in %s\n", \
										 x, __LINE__, __FILE__);} while(0)
	#endif
#else
	#ifndef LWIP_PLATFORM_ASSERT
	#define LWIP_PLATFORM_ASSERT(x)
	#endif
#endif

#ifdef __cplusplus
}
#endif

#endif /* INCLUDED_ARCH_CC_H */

