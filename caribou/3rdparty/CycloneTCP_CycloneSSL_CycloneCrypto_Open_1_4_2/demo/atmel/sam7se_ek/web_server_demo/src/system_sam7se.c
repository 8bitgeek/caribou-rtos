/* ----------------------------------------------------------------------------
 *         ATMEL Microcontroller Software Support
 * ----------------------------------------------------------------------------
 * Copyright (c) 2008, Atmel Corporation
 *
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * - Redistributions of source code must retain the above copyright notice,
 * this list of conditions and the disclaimer below.
 *
 * Atmel's name may not be used to endorse or promote products derived from
 * this software without specific prior written permission.
 *
 * DISCLAIMER: THIS SOFTWARE IS PROVIDED BY ATMEL "AS IS" AND ANY EXPRESS OR
 * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT ARE
 * DISCLAIMED. IN NO EVENT SHALL ATMEL BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA,
 * OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 * ----------------------------------------------------------------------------
 */

//------------------------------------------------------------------------------
/// \unit
///
/// !Purpose
///
/// Provides the low-level initialization function that gets called on chip
/// startup.
///
/// !Usage
///
/// LowLevelInit() is called in #board_cstartup.S#.
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
//         Headers
//------------------------------------------------------------------------------

#include "at91sam7se512.h"
#include "sam7se_ek.h"
#include "sdram.h"
#include "debug.h"

//RSTC_RMR register protection key
#define AT91C_RSTC_KEY_A5 ((unsigned int) 0xA5 << 24)


void BOARD_RemapRam( void );

//------------------------------------------------------------------------------
//         Internal definitions
//------------------------------------------------------------------------------
// Startup time of main oscillator (in number of slow clock ticks).
#define BOARD_OSCOUNT           (AT91C_CKGR_OSCOUNT & (0x40 << 8))

// USB PLL divisor value to obtain a 48MHz clock.
#define BOARD_USBDIV            AT91C_CKGR_USBDIV_1

// PLL frequency range.
#define BOARD_CKGR_PLL          AT91C_CKGR_OUT_0

// PLL startup time (in number of slow clock ticks).
#define BOARD_PLLCOUNT          (16 << 8)

// PLL MUL value.
#define BOARD_MUL               (AT91C_CKGR_MUL & (72 << 16))

// PLL DIV value.
#define BOARD_DIV               (AT91C_CKGR_DIV & 14)

// Master clock prescaler value.
#define BOARD_PRESCALER         AT91C_PMC_PRES_CLK_2


#define BOARD_FLASH             0
#define BOARD_RAM               1

//------------------------------------------------------------------------------
//         Internal functions
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
/// Default spurious interrupt handler. Infinite loop.
//------------------------------------------------------------------------------

void undefinedInstrException(unsigned int *address)
{
   printf("***************************************\r\n");
   printf("*** UNDEFINED INSTRUCTION EXCEPTION ***\r\n");
   printf("*** Instruction: 0x%08X         ***\r\n", *address);
   printf("*** Address:     0x%08X         ***\r\n", address);
   printf("***************************************\r\n");
   while(1);
}


void prefetchAbortException(unsigned int *address)
{
   printf("********************************\r\n");
   printf("*** PREFETCH ABORT EXCEPTION ***\r\n");
   printf("*** Instruction: 0x%08X  ***\r\n", *address);
   printf("*** Address:     0x%08X  ***\r\n", address);
   printf("********************************\r\n");
   while(1);
}


void dataAbortException(unsigned int *address)
{
   printf("*******************************\r\n");
   printf("*** DATA ABORT EXCEPTION    ***\r\n");
   printf("*** Instruction: 0x%08X ***\r\n", *address);
   printf("*** Address:     0x%08X ***\r\n", address);
   printf("*******************************\r\n");
   while(1);
}


void __irq defaultSpuriousHandler( void )
{
   /*printf("********************************\r\n");
   printf("*** Default Spurious Handler ***\r\n");
   printf("********************************\r\n");*/
   //The interrupt treatment is complete
   AT91C_BASE_AIC->AIC_EOICR = 0;
}

//------------------------------------------------------------------------------
/// Default handler for fast interrupt requests. Infinite loop.
//------------------------------------------------------------------------------
void defaultFiqHandler( void )
{
   /*printf("***************************\r\n");
   printf("*** Default FIQ Handler ***\r\n");
   printf("***************************\r\n");*/
   while(1);
}

//------------------------------------------------------------------------------
/// Default handler for standard interrupt requests. Infinite loop.
//------------------------------------------------------------------------------
void defaultIrqHandler( void )
{
   /*printf("***************************\r\n");
   printf("*** Default IRQ Handler ***\r\n");
   printf("***************************\r\n");*/
   while(1);
}


//------------------------------------------------------------------------------
//         Exported functions
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
/// Performs the low-level initialization of the chip. This includes EFC, master
/// clock, AIC & watchdog configuration, as well as memory remapping.
//------------------------------------------------------------------------------
void lowLevelInit( void )
{
   unsigned char i;
   volatile unsigned int j;

   //Set number of wait states for the embedded FLASH memory
   AT91C_BASE_EFC0->EFC_FMR = AT91C_MC_FWS_1FWS;
   AT91C_BASE_EFC1->EFC_FMR = AT91C_MC_FWS_1FWS;

   //#if !defined(sdram)
   /* Initialize main oscillator
   ****************************/
   AT91C_BASE_PMC->PMC_MOR = BOARD_OSCOUNT | AT91C_CKGR_MOSCEN;
   while (!(AT91C_BASE_PMC->PMC_SR & AT91C_PMC_MOSCS));

   /* Initialize PLL at 96MHz (96.109) and USB clock to 48MHz */
   AT91C_BASE_PMC->PMC_PLLR = BOARD_USBDIV | BOARD_CKGR_PLL | BOARD_PLLCOUNT
                      | BOARD_MUL | BOARD_DIV;
   while (!(AT91C_BASE_PMC->PMC_SR & AT91C_PMC_LOCK));

   /* Wait for the master clock if it was already initialized */
   while (!(AT91C_BASE_PMC->PMC_SR & AT91C_PMC_MCKRDY));

   /* Switch to fast clock
   **********************/
   /* Switch to slow clock + prescaler */
   AT91C_BASE_PMC->PMC_MCKR = BOARD_PRESCALER;
   while (!(AT91C_BASE_PMC->PMC_SR & AT91C_PMC_MCKRDY));

   /* Switch to fast clock + prescaler */
   AT91C_BASE_PMC->PMC_MCKR |= AT91C_PMC_CSS_PLL_CLK;
   while (!(AT91C_BASE_PMC->PMC_SR & AT91C_PMC_MCKRDY));
   //#endif //#if !defined(sdram)

   /* Initialize AIC
   ****************/
   AT91C_BASE_AIC->AIC_IDCR = 0xFFFFFFFF;
   AT91C_BASE_AIC->AIC_SVR[0] = (unsigned int) defaultFiqHandler;
   for (i = 1; i < 31; i++) {

   AT91C_BASE_AIC->AIC_SVR[i] = (unsigned int) defaultIrqHandler;
   }
   AT91C_BASE_AIC->AIC_SPU = (unsigned int) defaultSpuriousHandler;

   // Unstack nested interrupts
   for (i = 0; i < 8 ; i++) {

   AT91C_BASE_AIC->AIC_EOICR = 0;
   }

   // Enable Debug mode
   AT91C_BASE_AIC->AIC_DCR = AT91C_AIC_DCR_PROT;

   /* Watchdog initialization
   *************************/
   AT91C_BASE_WDTC->WDTC_WDMR = AT91C_WDTC_WDDIS;

   //BOARD_ConfigureSdram(16);

   //Enable external RST pin
   AT91C_BASE_RSTC->RSTC_RMR = AT91C_RSTC_KEY_A5 | AT91C_RSTC_URSTEN;

   //SDRAM initialization
   sdramInit();

   /* Remap
   *******/
   BOARD_RemapRam();

   //Disable RTT and PIT interrupts (potential problem when program A
   //configures RTT, then program B wants to use PIT only, interrupts
   //from the RTT will still occur since they both use AT91C_ID_SYS)
   AT91C_BASE_RTTC->RTTC_RTMR &= ~(AT91C_RTTC_ALMIEN | AT91C_RTTC_RTTINCIEN);
   AT91C_BASE_PITC->PITC_PIMR &= ~AT91C_PITC_PITIEN;
}


/*
    Function: BOARD_GetRemap
        Returns the current remap (see <Remap types>).
*/
static unsigned char BOARD_GetRemap( void )
{
    volatile unsigned int *remap = (volatile unsigned int *) 0;
    volatile unsigned int *ram = (volatile unsigned int *) AT91C_ISRAM;

    // Try to write in 0 and see if this affects the RAM
    unsigned int temp = *ram;
    *ram = temp + 1;
    if (*remap == *ram) {

        *ram = temp;
        return BOARD_RAM;
    }
    else {

        *ram = temp;
        return BOARD_FLASH;
    }
}


void BOARD_RemapRam( void )
{
    if (BOARD_GetRemap() != BOARD_RAM) {

        AT91C_BASE_MC->MC_RCR = AT91C_MC_RCB;
    }
}
