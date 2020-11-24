/*****************************************************************************
 * Copyright (c) 2001, 2002 Rowley Associates Limited.                       *
 *                                                                           *
 * This file may be distributed under the terms of the License Agreement     *
 * provided with this software.                                              *
 *                                                                           *
 * THIS FILE IS PROVIDED AS IS WITH NO WARRANTY OF ANY KIND, INCLUDING THE   *
 * WARRANTY OF DESIGN, MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. *
 *****************************************************************************/

/*****************************************************************************
 *                           Preprocessor Definitions
 *                           ------------------------
 *
 * VECTORED_IRQ_INTERRUPTS
 *
 *   Enable vectored IRQ interrupts. If defined, the PC register will be loaded
 *   with the contents of the VICVectAddr register on an IRQ exception.
 *
 * STARTUP_FROM_RESET
 *
 *   If defined, the program will startup from power-on/reset. If not defined
 *   the program will just loop endlessly from power-on/reset.
 *
 *   This definition is not defined by default on this target because the
 *   debugger is unable to reset this target and maintain control of it over the
 *   JTAG interface. The advantage of doing this is that it allows the debugger
 *   to reset the CPU and run programs from a known reset CPU state on each run.
 *   It also acts as a safety net if you accidently download a program in FLASH
 *   that crashes and prevents the debugger from taking control over JTAG
 *   rendering the target unusable over JTAG. The obvious disadvantage of doing
 *   this is that your application will not startup without the debugger.
 *
 *   We advise that on this target you keep STARTUP_FROM_RESET undefined whilst
 *   you are developing and only define STARTUP_FROM_RESET when development is
 *   complete.
 *
 * PLLCFG_VAL
 *
 *   Override the default PLL configuration by defining PLLCFG_VAL.
 *
 * NO_PLL_ENABLE
 *
 *   If defined, the PLL will not be enabled.
 *
 * MAMCR_VAL & MAMTIM_VAL
 * 
 *   Override the default MAM configuration (fully enabled, 3 fetch cycles)
 *   by defining MAMCR_VAL and MAMTIM_VAL.
 *
 * VPBDIV_VAL
 *
 *   Override the default VPB divider value (VPB bus clock is one half of the
 *   processor clock) by defining VPBDIV_VAL.
 *
 * PINSELn_VAL
 * 
 *   If defined, set the PINSEL pin configuration register value.
 *
 * BCFGn_VAL
 *
 *   If defined, set the BCFG external memory bank control register value.
 *
 * SRAM_EXCEPTIONS
 *
 *   If defined, enable copying and re-mapping of interrupt vectors from User 
 *   FLASH to SRAM. If undefined, interrupt vectors will be mapped in User 
 *   FLASH.
 *
 *****************************************************************************/
#include <chip/target.h>

#ifndef PLLCFG_VAL

#if OSCILLATOR_CLOCK_FREQUENCY==10000000

/* Fosc = 10Mhz, P = 2, M = 6 : Fcco = 240Mhz, cclk = 60Mhz */
#define PLLCFG_VAL 0x25

#elif OSCILLATOR_CLOCK_FREQUENCY==12000000

/* Fosc = 12Mhz, P = 2, M = 5 : Fcco = 240Mhz, cclk = 60Mhz */
#define PLLCFG_VAL 0x24

#elif OSCILLATOR_CLOCK_FREQUENCY==14745600

/* Fosc = 14.7456Mhz, P = 2, M = 4 : Fcco = 235.9296Mhz, cclk = 58.9824Mhz */
#define PLLCFG_VAL 0x23 

#endif
#endif

#ifndef MAMCR_VAL
#define MAMCR_VAL 0
#endif

#ifndef MAMTIM_VAL
#define MAMTIM_VAL 7
#endif

#ifndef VPBDIV_VAL
#define VPBDIV_VAL 0
#endif

#define PCB_BASE 0xE002C000
#define PCB_PINSEL0_OFFS 0x00
#define PCB_PINSEL1_OFFS 0x04
#define PCB_PINSEL2_OFFS 0x14                   
  
#define SCB_BASE         0xE01FC000
#define SCB_MAMCR_OFFS   0x000
#define SCB_MAMTIM_OFFS  0x004
#define SCB_MEMMAP_OFFS  0x040
#define SCB_PLLCON_OFFS  0x080
#define SCB_PLLCFG_OFFS  0x084
#define SCB_PLLSTAT_OFFS 0x088
#define SCB_PLLFEED_OFFS 0x08C
#define SCB_VPBDIV_OFFS  0x100

#define EMC_BASE 0xFFE00000
#define EMC_BCFG0_OFFS 0x00
#define EMC_BCFG1_OFFS 0x04
#define EMC_BCFG2_OFFS 0x08
#define EMC_BCFG3_OFFS 0x0C

	.global		_configure
	.section	.init, "ax"
	.code		32
	.align		0

/*****************************************************************************
 * Exception Vectors                                                         *
 *****************************************************************************/


/******************************************************************************
 *                                                                            *
 * Default exception handlers                                                 *
 *                                                                            *
 ******************************************************************************/
_configure:
	ldr		r0, =SCB_BASE

#if defined(PLLCFG_VAL) && !defined(NO_PLL_ENABLE)
	/* Configure PLL Multiplier/Divider */
	ldr		r1, =PLLCFG_VAL
	str		r1, [r0, #SCB_PLLCFG_OFFS]
	/* Enable PLL */
	mov		r1, #0x1
	str		r1, [r0, #SCB_PLLCON_OFFS]
	mov		r1, #0xAA
	str		r1, [r0, #SCB_PLLFEED_OFFS]
	mov		r1, #0x55
	str		r1, [r0, #SCB_PLLFEED_OFFS]
	/* Wait for PLL to lock */
pll_lock_loop:
	ldr		r1, [r0, #SCB_PLLSTAT_OFFS]
	tst		r1, #0x400
	beq		pll_lock_loop
	/* PLL Locked, connect PLL as clock source */
	mov		r1, #0x3
	str		r1, [r0, #SCB_PLLCON_OFFS]
	mov		r1, #0xAA
	str		r1, [r0, #SCB_PLLFEED_OFFS]
	mov		r1, #0x55
	str		r1, [r0, #SCB_PLLFEED_OFFS]
#endif

	/* Initialise memory accelerator module */
	mov		r1, #0
	str		r1, [r0, #SCB_MAMCR_OFFS]
	ldr		r1, =MAMTIM_VAL
	str		r1, [r0, #SCB_MAMTIM_OFFS]
	ldr		r1, =MAMCR_VAL
	str		r1, [r0, #SCB_MAMCR_OFFS]

	/* Configure the VPB clock */
	ldr		r1, =VPBDIV_VAL
	str		r1, [r0, #SCB_VPBDIV_OFFS]

#if defined(PINSEL0_VAL) || defined(PINSEL1_VAL) || defined(PINSEL2_VAL)
	/* Configure Pins */
	ldr		r0, =PCB_BASE
#endif
#if defined(PINSEL0_VAL)
	ldr		r1, =PINSEL0_VAL
	str		r1, [r0, #PCB_PINSEL0_OFFS]
#endif
#if defined(PINSEL1_VAL)
	ldr		r1, =PINSEL1_VAL
	str		r1, [r0, #PCB_PINSEL1_OFFS]
#endif
#if defined(PINSEL2_VAL)
	ldr		r1, =PINSEL2_VAL
	str		r1, [r0, #PCB_PINSEL2_OFFS]
#endif

#if defined(BCFG0_VAL) || defined(BCFG1_VAL) || defined(BCFG2_VAL) || defined(BCFG3_VAL)
	/* Configure EMI */
	ldr		r0, =EMC_BASE
#endif
#if defined(BCFG0_VAL)
	ldr		r1, =BCFG0_VAL
	str		r1, [r0, #EMC_BCFG0_OFFS]
#endif
#if defined(BCFG1_VAL)
	ldr		r1, =BCFG1_VAL
	str		r1, [r0, #EMC_BCFG1_OFFS]
#endif
#if defined(BCFG2_VAL)
	ldr		r1, =BCFG2_VAL
	str		r1, [r0, #EMC_BCFG2_OFFS]
#endif
#if defined(BCFG3_VAL)
	ldr		r1, =BCFG3_VAL
	str		r1, [r0, #EMC_BCFG3_OFFS]
#endif
  
	bx		lr

