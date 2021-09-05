/******************************************************************************
* Copyright © 2005-2014 by Pike Aerospace Research Corporation
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
#ifndef _CARIBOU_CONFIG_H_
#define _CARIBOU_CONFIG_H_

#if !defined(HEAP_BLOCK_SIZE)
	#define HEAP_BLOCK_SIZE				32
#endif

//#define CARIBOU_PROCESSOR_CACHE_ENABLE		1

#if !defined(USE_NATIVE_STDARG)
	#define USE_NATIVE_STDARG				1
#endif

//#define	CARIBOU_NEW_TRAP				1

#define USE_FAST_HTML_FILE				1

//#define CARIBOU_SEND_SOCKET_YIELD		1

#define USE_SHARESPI_DMA				1

#define USE_DHCP						1

#define FLOWTRAX_SDRAM					1
//#define FLOWTRAX_SDRAM_TEST				1	

/* Defines related to Clock configuration */
/* Uncomment to enable the adaquate Clock Source */
/* #define RTC_CLOCK_SOURCE_LSI */
#define RTC_CLOCK_SOURCE_LSE

#define STM32_SD_USE_DMA				1

/**
 * @brief Allow only one web-page to be served at a time
 * FIXME: Something in the web page service, appears to be non-reentrant, which
 * has the effect of corrupting the HTML text. Synchronizing the page file access
 * seems to be the work around for the time being. However this does need to be
 * addressed
 */
#define USE_WEBPAGE_FILE_MUTEX			1

/**
 * @brief The number of non-contiguous heaps.
 */
#define CARIBOU_NUMHEAPS				2

/**
 * @brief Uncomment if used LwIP TCP/IP stack.
 */
#define	CARIBOU_LWIP					1

/**
 * @brief if using IRQ-safe CARIBOU lib functions. The trade off is with respect
 * to interrupt latency performance, as interrupts must be disabled during critical regions when
 * CARIBOU_LIBIRQ_SAFE is enabled. When CARIBOU_LIB_IRQ_SAFE is disabled, then CARIBOU library 
 * functions may not be accessed from interrupt context.
 */
#define	CARIBOU_LIB_IRQ_SAFE			0

/**
 * @brief Uncomment of there is a hardware FPU present.
 */
#if !defined(CARIBOU_FPU_PRESENT)
	#define CARIBOU_FPU_PRESENT
#endif

/**
 * @brief Uncomment in order to use the *EXPERIMENTAL* hand-assembled library functions.
 * May provide some performance gains particularly when doing debug build.
 */
/* #define	CARIBOU_ARM_ASM */

/**
 * Stack high-water mark checking...
 */
#define CARIBOU_LOW_STACK_TRAP			0

/**
 * @brief Make the filesystem thread-safe by protecting CFile with a mutex lock.
 * This enforces one-file open at a time.
 */
//#define CARIBOU_CFILE_OPEN_MUTEX		1

/**
 * @brief Define the type accepted by the compiler as the argument to the new() operator.
 */
#define NEW_TAKES_SIZE_T				1
/* #define NEW_TAKES_ULONG */

/** ----- No Modification below this line -------------- **/

#if defined(CARIBOU_FPU_PRESENT)
	#if defined(__FPU_PRESENT)
		#undef __FPU_PRESENT
	#endif
	#if defined(__FPU_USED)
		#undef __FPU_USED
	#endif
	#define __FPU_PRESENT				1	/* Some platform headers depend on this symbol being defined */
	#define _FPU_USED					1
#endif

#endif /* _CARIBOU_CONFIG_H_ */