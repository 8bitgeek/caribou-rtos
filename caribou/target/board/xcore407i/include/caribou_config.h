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

/**
 * @brief Uncomment if used LwIP TCP/IP stack.
 */
#define	CARIBOU_LWIP	1

#define CARIBOU_NUMHEAPS	1
/**
 * @brief Uncomment if using IRQ-safe CARIBOU lib functions. The trade off is with respect
 * to interrupt latency performance, as interrupts must be disabled during critical regions when
 * CARIBOU_LIBIRQ_SAFE is enabled. When CARIBOU_LIB_IRQ_SAFE is disabled, then CARIBOU library 
 * functions may not be accessed from interrupt context.
 */
#define	CARIBOU_LIB_IRQ_SAFE	0

/**
 * @brief Caribou thread IPC queue enabled.
 */
#define CARIBOU_IPC_ENABLED		1

/**
 * @brief Uncomment of there is a hardware FPU present.
 */
/* #define CARIBOU_FPU_PRESENT */

/**
 * @brief Uncomment in order to use the *EXPERIMENTAL* hand-assembled library functions.
 * May provide some performance gains particularly when doing debug build.
 */
/* #define	CARIBOU_ARM_ASM */

/**
 * @brief Define the type accepted by the compiler as the argument to the new() operator.
 */
#define NEW_TAKES_SIZE_T	1
/* #define NEW_TAKES_ULONG */

/** ----- No Modification below this line -------------- **/

#if defined(CARIBOU_FPU_PRESENT)
	#if defined(__FPU_PRESENT)
		#undef __FPU_PRESENT
	#endif
	#if defined(__FPU_USED)
		#undef __FPU_USED
	#endif
	#define __FPU_PRESENT	1	/* Some platform headers depend on this symbol being defined */
	#define _FPU_USED		1
#endif

#endif /* _CARIBOU_CONFIG_H_ */