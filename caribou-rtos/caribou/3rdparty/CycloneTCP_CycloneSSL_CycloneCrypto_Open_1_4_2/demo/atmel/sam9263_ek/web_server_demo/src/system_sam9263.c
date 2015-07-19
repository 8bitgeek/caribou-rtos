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
//         Headers
//------------------------------------------------------------------------------

#include <stdio.h>
#include "at91sam9263.h"
#include "sam9263_ek.h"

//#define sdram
//#include "board.h"
//#include "board_memories.h"
//#include <pmc/pmc.h>

//------------------------------------------------------------------------------
//         Internal definitions
//------------------------------------------------------------------------------
/*
    Constants: Clock and PLL settings

        BOARD_OSCOUNT - Startup time of main oscillator (in number of slow clock
                        ticks).
        BOARD_USBDIV - USB PLL divisor value to obtain a 48MHz clock.
        BOARD_CKGR_PLL - PLL frequency range.
        BOARD_PLLCOUNT - PLL startup time (in number of slow clock ticks).
        BOARD_MUL - PLL MUL value.
        BOARD_DIV - PLL DIV value.
        BOARD_PRESCALER - Master clock prescaler value.
*/
#define BOARD_OSCOUNT           (AT91C_CKGR_OSCOUNT & (64 << 8))

#define BOARD_CKGR_PLLA         (AT91C_CKGR_SRCA | AT91C_CKGR_OUTA_2)
#define BOARD_PLLACOUNT         (63 << 8)
#define BOARD_MULA              (AT91C_CKGR_MULA & (109 << 16))
#define BOARD_DIVA              (AT91C_CKGR_DIVA & 9)

#define BOARD_USBDIV            AT91C_CKGR_USBDIV_2
#define BOARD_CKGR_PLLB         AT91C_CKGR_OUTB_0
#define BOARD_PLLBCOUNT         BOARD_PLLACOUNT
#define BOARD_MULB              (175 << 16)
#define BOARD_DIVB              15

#define BOARD_PRESCALER         AT91C_PMC_MDIV_2

//------------------------------------------------------------------------------
//         Internal functions
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
/// Default spurious interrupt handler. Infinite loop.
//------------------------------------------------------------------------------
void __irq defaultSpuriousHandler( void )
{
   //Just write to AIC_EOICR and return from the interrupt
   AT91C_BASE_AIC->AIC_EOICR = 0;
}

//------------------------------------------------------------------------------
/// Default handler for fast interrupt requests. Infinite loop.
//------------------------------------------------------------------------------
void defaultFiqHandler( void )
{
    while (1);
}

//------------------------------------------------------------------------------
/// Default handler for standard interrupt requests. Infinite loop.
//------------------------------------------------------------------------------
void defaultIrqHandler( void )
{
    while (1);
}


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


void BOARD_RemapRam(void);

//------------------------------------------------------------------------------
//         Exported functions
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
///    Performs the low-level initialization of the chip.
//------------------------------------------------------------------------------
void systemInit( void )
{
    unsigned char i;

#if !defined(sdram)
    /* Initialize main oscillator
     ****************************/
    AT91C_BASE_PMC->PMC_MOR = BOARD_OSCOUNT | AT91C_CKGR_MOSCEN;
    while (!(AT91C_BASE_PMC->PMC_SR & AT91C_PMC_MOSCS));

    /* Initialize PLLA at 200MHz (198.656) */
    AT91C_BASE_PMC->PMC_PLLAR = BOARD_CKGR_PLLA
                                | BOARD_PLLACOUNT
                                | BOARD_MULA
                                | BOARD_DIVA;
    while (!(AT91C_BASE_PMC->PMC_SR & AT91C_PMC_LOCKA));

    // Initialize PLLB for USB usage (if not already locked)
    if (!(AT91C_BASE_PMC->PMC_SR & AT91C_PMC_LOCKB)) {
        AT91C_BASE_PMC->PMC_PLLBR = BOARD_USBDIV
                                    | BOARD_CKGR_PLLB
                                    | BOARD_PLLBCOUNT
                                    | BOARD_MULB
                                    | BOARD_DIVB;
        while (!(AT91C_BASE_PMC->PMC_SR & AT91C_PMC_LOCKB));
    }

    /* Wait for the master clock if it was already initialized */
    while (!(AT91C_BASE_PMC->PMC_SR & AT91C_PMC_MCKRDY));

    /* Switch to fast clock
     **********************/
    /* Switch to main oscillator + prescaler */
    AT91C_BASE_PMC->PMC_MCKR = BOARD_PRESCALER;
    while (!(AT91C_BASE_PMC->PMC_SR & AT91C_PMC_MCKRDY));

    /* Switch to PLL + prescaler */
    AT91C_BASE_PMC->PMC_MCKR |= AT91C_PMC_CSS_PLLA_CLK;
    while (!(AT91C_BASE_PMC->PMC_SR & AT91C_PMC_MCKRDY));
#endif //#if !defined(sdram)

    /* Initialize AIC
     ****************/

   //Disable interrupts
   AT91C_BASE_AIC->AIC_IDCR = 0xFFFFFFFF;
   //Set default spurious interrupt handler
   AT91C_BASE_AIC->AIC_SPU = (unsigned int) defaultSpuriousHandler;
   //Set default FIQ handler
   AT91C_BASE_AIC->AIC_SVR[0] = (unsigned int) defaultFiqHandler;

   //Set default IRQ handler
   for(i = 1; i < 31; i++)
      AT91C_BASE_AIC->AIC_SVR[i] = (unsigned int) defaultIrqHandler;

   //Unstack nested interrupts
   for(i = 0; i < 8; i++)
      AT91C_BASE_AIC->AIC_EOICR = 0;

   //Disable watchdog timer
   AT91C_BASE_WDTC->WDTC_WDMR = AT91C_WDTC_WDDIS;

    /* Remap
     *******/
    BOARD_RemapRam();

    // Disable RTT and PIT interrupts (potential problem when program A
    // configures RTT, then program B wants to use PIT only, interrupts
    // from the RTT will still occur since they both use AT91C_ID_SYS)
    AT91C_BASE_RTTC0->RTTC_RTMR &= ~(AT91C_RTTC_ALMIEN | AT91C_RTTC_RTTINCIEN);
    AT91C_BASE_RTTC1->RTTC_RTMR &= ~(AT91C_RTTC_ALMIEN | AT91C_RTTC_RTTINCIEN);
    AT91C_BASE_PITC->PITC_PIMR &= ~AT91C_PITC_PITIEN;
#if defined(norflash)
    BOARD_ConfigureNorFlash(BOARD_NORFLASH_DFT_BUS_SIZE);
#endif
}



#define READ(peripheral, register)          (peripheral->register)
#define WRITE(peripheral, register, value)  (peripheral->register = value)

//------------------------------------------------------------------------------
//         Exported functions
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
/// Changes the mapping of the chip so that the remap area mirrors the
///  internal ROM or the EBI CS0.
//------------------------------------------------------------------------------
void BOARD_RemapRom()
{
    AT91C_BASE_MATRIX->MATRIX_MRCR &= ~(AT91C_MATRIX_RCA926I | AT91C_MATRIX_RCA926D);
}

//------------------------------------------------------------------------------
/// Changes the mapping of the chip so that the remap area mirrors the
/// internal RAM.
//------------------------------------------------------------------------------
void BOARD_RemapRam()
{
    AT91C_BASE_MATRIX->MATRIX_MRCR |= (AT91C_MATRIX_RCA926I | AT91C_MATRIX_RCA926D);
}

#if 0
//------------------------------------------------------------------------------
/// Initialize and configure the SDRAM
//------------------------------------------------------------------------------
void BOARD_ConfigureSdram(unsigned char busWidth)
{
    volatile unsigned int i;
    static const Pin pinsSdram[] = {PINS_SDRAM};
    volatile unsigned int *pSdram = (unsigned int *) AT91C_EBI0_SDRAM;
    unsigned short sdrc_dbw = 0;

    switch (busWidth) {
        case 16:
            sdrc_dbw = AT91C_SDRAMC_DBW_16_BITS;
            break;

        case 32:
        default:
            sdrc_dbw = AT91C_SDRAMC_DBW_32_BITS;
            break;

    }

    // Enable corresponding PIOs
    PIO_Configure(pinsSdram, 1);

    // Enable EBI chip select for the SDRAM
    WRITE(AT91C_BASE_CCFG, CCFG_EBI0CSA, AT91C_EBI_CS1A_SDRAMC);

    // Set Configuration Register
    WRITE(AT91C_BASE_SDRAMC0, SDRAMC_CR, AT91C_SDRAMC_NC_9
                                    | AT91C_SDRAMC_NR_13
                                    | AT91C_SDRAMC_CAS_2
                                    | AT91C_SDRAMC_NB_4_BANKS
                                    | sdrc_dbw
                                    | AT91C_SDRAMC_TWR_2
                                    | AT91C_SDRAMC_TRC_7
                                    | AT91C_SDRAMC_TRP_2
                                    | AT91C_SDRAMC_TRCD_2
                                    | AT91C_SDRAMC_TRAS_5
                                    | AT91C_SDRAMC_TXSR_8);

    for (i = 0; i < 1000; i++);

    WRITE(AT91C_BASE_SDRAMC0, SDRAMC_MR, AT91C_SDRAMC_MODE_NOP_CMD); // Perform NOP
    pSdram[0] = 0x00000000;

    WRITE(AT91C_BASE_SDRAMC0, SDRAMC_MR, AT91C_SDRAMC_MODE_PRCGALL_CMD); // Set PRCHG AL
    pSdram[0] = 0x00000000;                     // Perform PRCHG

    for (i = 0; i < 10000; i++);

    WRITE(AT91C_BASE_SDRAMC0, SDRAMC_MR, AT91C_SDRAMC_MODE_RFSH_CMD);    // Set 1st CBR
    pSdram[1] = 0x00000001;                     // Perform CBR

    WRITE(AT91C_BASE_SDRAMC0, SDRAMC_MR, AT91C_SDRAMC_MODE_RFSH_CMD);    // Set 2 CBR
    pSdram[2] = 0x00000002;                     // Perform CBR

    WRITE(AT91C_BASE_SDRAMC0, SDRAMC_MR, AT91C_SDRAMC_MODE_RFSH_CMD);    // Set 3 CBR
    pSdram[3] = 0x00000003;                    // Perform CBR

    WRITE(AT91C_BASE_SDRAMC0, SDRAMC_MR, AT91C_SDRAMC_MODE_RFSH_CMD);    // Set 4 CBR
    pSdram[4] = 0x00000004;                   // Perform CBR

    WRITE(AT91C_BASE_SDRAMC0, SDRAMC_MR, AT91C_SDRAMC_MODE_RFSH_CMD);    // Set 5 CBR
    pSdram[5] = 0x00000005;                   // Perform CBR

    WRITE(AT91C_BASE_SDRAMC0, SDRAMC_MR, AT91C_SDRAMC_MODE_RFSH_CMD);    // Set 6 CBR
    pSdram[6] = 0x00000006;                 // Perform CBR

    WRITE(AT91C_BASE_SDRAMC0, SDRAMC_MR, AT91C_SDRAMC_MODE_RFSH_CMD);    // Set 7 CBR
    pSdram[7] = 0x00000007;                 // Perform CBR

    WRITE(AT91C_BASE_SDRAMC0, SDRAMC_MR, AT91C_SDRAMC_MODE_RFSH_CMD);    // Set 8 CBR
    pSdram[8] = 0x00000008;                 // Perform CBR

    WRITE(AT91C_BASE_SDRAMC0, SDRAMC_MR, AT91C_SDRAMC_MODE_LMR_CMD);     // Set LMR operation
    pSdram[9] = 0xcafedede;                 // Perform LMR burst=1, lat=2

    WRITE(AT91C_BASE_SDRAMC0, SDRAMC_TR, (BOARD_MCK * 7) / 1000000);     // Set Refresh Timer

    WRITE(AT91C_BASE_SDRAMC0, SDRAMC_MR, AT91C_SDRAMC_MODE_NORMAL_CMD);  // Set Normal mode
    pSdram[0] = 0x00000000;                     // Perform Normal mode
}

//------------------------------------------------------------------------------
/// Initialize and configure the SDRAM for a 48 MHz MCK (ROM code clock settings)
//------------------------------------------------------------------------------
void BOARD_ConfigureSdram48MHz(unsigned char busWidth)
{
    volatile unsigned int i;
    static const Pin pinsSdram[] = {PINS_SDRAM};
    volatile unsigned int *pSdram = (unsigned int *) AT91C_EBI0_SDRAM;
    unsigned short sdrc_dbw = 0;

    switch (busWidth) {
        case 16:
            sdrc_dbw = AT91C_SDRAMC_DBW_16_BITS;
            break;

        case 32:
        default:
            sdrc_dbw = AT91C_SDRAMC_DBW_32_BITS;
            break;

    }

    // Enable corresponding PIOs
    PIO_Configure(pinsSdram, 1);

    // Enable EBI chip select for the SDRAM
    WRITE(AT91C_BASE_CCFG, CCFG_EBI0CSA, AT91C_EBI_CS1A_SDRAMC);

    // Set Configuration Register
    WRITE(AT91C_BASE_SDRAMC0, SDRAMC_CR, AT91C_SDRAMC_NC_9
                                         | AT91C_SDRAMC_NR_13
                                         | AT91C_SDRAMC_CAS_2
                                         | AT91C_SDRAMC_NB_4_BANKS
                                         | sdrc_dbw
                                         | AT91C_SDRAMC_TWR_1
                                         | AT91C_SDRAMC_TRC_4
                                         | AT91C_SDRAMC_TRP_1
                                         | AT91C_SDRAMC_TRCD_1
                                         | AT91C_SDRAMC_TRAS_2
                                         | AT91C_SDRAMC_TXSR_3);

    for (i = 0; i < 1000; i++);

    WRITE(AT91C_BASE_SDRAMC0, SDRAMC_MR, AT91C_SDRAMC_MODE_NOP_CMD); // Perform NOP
    pSdram[0] = 0x00000000;

    WRITE(AT91C_BASE_SDRAMC0, SDRAMC_MR, AT91C_SDRAMC_MODE_PRCGALL_CMD); // Set PRCHG AL
    pSdram[0] = 0x00000000;                     // Perform PRCHG

    for (i = 0; i < 10000; i++);

    WRITE(AT91C_BASE_SDRAMC0, SDRAMC_MR, AT91C_SDRAMC_MODE_RFSH_CMD);    // Set 1st CBR
    pSdram[1] = 0x00000001;                     // Perform CBR

    WRITE(AT91C_BASE_SDRAMC0, SDRAMC_MR, AT91C_SDRAMC_MODE_RFSH_CMD);    // Set 2 CBR
    pSdram[2] = 0x00000002;                     // Perform CBR

    WRITE(AT91C_BASE_SDRAMC0, SDRAMC_MR, AT91C_SDRAMC_MODE_RFSH_CMD);    // Set 3 CBR
    pSdram[3] = 0x00000003;                    // Perform CBR

    WRITE(AT91C_BASE_SDRAMC0, SDRAMC_MR, AT91C_SDRAMC_MODE_RFSH_CMD);    // Set 4 CBR
    pSdram[4] = 0x00000004;                   // Perform CBR

    WRITE(AT91C_BASE_SDRAMC0, SDRAMC_MR, AT91C_SDRAMC_MODE_RFSH_CMD);    // Set 5 CBR
    pSdram[5] = 0x00000005;                   // Perform CBR

    WRITE(AT91C_BASE_SDRAMC0, SDRAMC_MR, AT91C_SDRAMC_MODE_RFSH_CMD);    // Set 6 CBR
    pSdram[6] = 0x00000006;                 // Perform CBR

    WRITE(AT91C_BASE_SDRAMC0, SDRAMC_MR, AT91C_SDRAMC_MODE_RFSH_CMD);    // Set 7 CBR
    pSdram[7] = 0x00000007;                 // Perform CBR

    WRITE(AT91C_BASE_SDRAMC0, SDRAMC_MR, AT91C_SDRAMC_MODE_RFSH_CMD);    // Set 8 CBR
    pSdram[8] = 0x00000008;                 // Perform CBR

    WRITE(AT91C_BASE_SDRAMC0, SDRAMC_MR, AT91C_SDRAMC_MODE_LMR_CMD);     // Set LMR operation
    pSdram[9] = 0xcafedede;                 // Perform LMR burst=1, lat=2

    WRITE(AT91C_BASE_SDRAMC0, SDRAMC_TR, (48000000 * 7) / 1000000);      // Set Refresh Timer

    WRITE(AT91C_BASE_SDRAMC0, SDRAMC_MR, AT91C_SDRAMC_MODE_NORMAL_CMD);  // Set Normal mode
    pSdram[0] = 0x00000000;                     // Perform Normal mode
}

//------------------------------------------------------------------------------
/// Configures the EBI for NandFlash access. Pins must be configured after or
/// before calling this function.
//------------------------------------------------------------------------------
void BOARD_ConfigureNandFlash(unsigned char busWidth)
{
    // Configure EBI
    AT91C_BASE_CCFG->CCFG_EBI0CSA |= AT91C_EBI_CS3A_SM;

    // Configure SMC
    AT91C_BASE_SMC0->SMC_SETUP3 = 0x00010001;
    AT91C_BASE_SMC0->SMC_PULSE3 = 0x03030303;
    AT91C_BASE_SMC0->SMC_CYCLE3 = 0x00050005;
    AT91C_BASE_SMC0->SMC_CTRL3  = 0x00020003;

    if (busWidth == 8) {

        AT91C_BASE_SMC0->SMC_CTRL3 |= AT91C_SMC_DBW_WIDTH_EIGTH_BITS;
    }
    else if (busWidth == 16) {

        AT91C_BASE_SMC0->SMC_CTRL3 |= AT91C_SMC_DBW_WIDTH_SIXTEEN_BITS;
    }
}

//------------------------------------------------------------------------------
/// Configures the EBI for NandFlash access at 48MHz. Pins must be configured
/// after or before calling this function.
//------------------------------------------------------------------------------
void BOARD_ConfigureNandFlash48MHz(unsigned char busWidth)
{
    // Configure EBI
    AT91C_BASE_CCFG->CCFG_EBI0CSA |= AT91C_EBI_CS3A_SM;

    // Configure SMC
    AT91C_BASE_SMC0->SMC_SETUP3 = 0x00010001;
    AT91C_BASE_SMC0->SMC_PULSE3 = 0x04030302;
    AT91C_BASE_SMC0->SMC_CYCLE3 = 0x00070004;
    AT91C_BASE_SMC0->SMC_CTRL3  = (AT91C_SMC_READMODE
                                 | AT91C_SMC_WRITEMODE
                                 | AT91C_SMC_NWAITM_NWAIT_DISABLE
                                 | ((0x1 << 16) & AT91C_SMC_TDF));

    if (busWidth == 8) {

        AT91C_BASE_SMC0->SMC_CTRL3 |= AT91C_SMC_DBW_WIDTH_EIGTH_BITS;
    }
    else if (busWidth == 16) {

        AT91C_BASE_SMC0->SMC_CTRL3 |= AT91C_SMC_DBW_WIDTH_SIXTEEN_BITS;
    }
}

//------------------------------------------------------------------------------
/// Configures the EBI for NorFlash access
/// \Param busWidth Bus width
//------------------------------------------------------------------------------
void BOARD_ConfigureNorFlash(unsigned char busWidth)
{
    // Configure SMC

    AT91C_BASE_SMC0->SMC_SETUP0 = 0x00000002;
    AT91C_BASE_SMC0->SMC_PULSE0 = 0x0A0A0A06;
    AT91C_BASE_SMC0->SMC_CYCLE0 = 0x000A000A;
    AT91C_BASE_SMC0->SMC_CTRL0  = (AT91C_SMC_READMODE
                                  | AT91C_SMC_WRITEMODE
                                  | AT91C_SMC_NWAITM_NWAIT_DISABLE
                                  | ((0x1 << 16) & AT91C_SMC_TDF));

    if (busWidth == 8) {
        AT91C_BASE_SMC0->SMC_CTRL0 |= AT91C_SMC_DBW_WIDTH_EIGTH_BITS;
    }
    else if (busWidth == 16) {
        AT91C_BASE_SMC0->SMC_CTRL0 |= AT91C_SMC_DBW_WIDTH_SIXTEEN_BITS;
    }
    else if (busWidth == 32) {
        AT91C_BASE_SMC0->SMC_CTRL0 |= AT91C_SMC_DBW_WIDTH_THIRTY_TWO_BITS;
    }
}


//------------------------------------------------------------------------------
/// Configures the EBI for NorFlash access at 48MHz.
/// \Param busWidth Bus width
//------------------------------------------------------------------------------
void BOARD_ConfigureNorFlash48MHz(unsigned char busWidth)
{
    // Configure SMC
    AT91C_BASE_SMC0->SMC_SETUP0 = 0x00000001;
    AT91C_BASE_SMC0->SMC_PULSE0 = 0x07070703;
    AT91C_BASE_SMC0->SMC_CYCLE0 = 0x00070007;
    AT91C_BASE_SMC0->SMC_CTRL0  = (AT91C_SMC_READMODE
                                  | AT91C_SMC_WRITEMODE
                                  | AT91C_SMC_NWAITM_NWAIT_DISABLE
                                  | ((0x1 << 16) & AT91C_SMC_TDF));

    if (busWidth == 8) {

        AT91C_BASE_SMC0->SMC_CTRL0 |= AT91C_SMC_DBW_WIDTH_EIGTH_BITS;
    }
    else if (busWidth == 16) {

        AT91C_BASE_SMC0->SMC_CTRL0 |= AT91C_SMC_DBW_WIDTH_SIXTEEN_BITS;
    }
    else if (busWidth == 32) {

        AT91C_BASE_SMC0->SMC_CTRL0 |= AT91C_SMC_DBW_WIDTH_THIRTY_TWO_BITS;
    }
}

#endif

