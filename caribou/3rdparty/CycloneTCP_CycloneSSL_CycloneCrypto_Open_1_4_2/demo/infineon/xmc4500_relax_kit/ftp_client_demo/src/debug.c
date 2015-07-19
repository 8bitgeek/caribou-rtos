/**
 * @file debug.c
 * @brief Debugging facilities
 *
 * @section License
 *
 * Copyright (C) 2010-2014 Oryx Embedded. All rights reserved.
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 *
 * @author Oryx Embedded (www.oryx-embedded.com)
 * @version 1.4.2
 **/

//Dependencies
#include "xmc4500.h"
#include "xmc4500_relax_kit.h"
#include "debug.h"


/**
 * @brief Debug UART initialization
 * @param[in] baudrate UART baudrate
 **/

void debugInit(uint32_t baudrate)
{
   uint32_t temp;

   //The baudrate is hardcoded to 115200...
   if(baudrate != 115200)
      return;

   //Reset USIC0 peripheral
   SCU_RESET->PRSET0 = SCU_RESET_PRSET0_USIC0RS_Msk;
   SCU_RESET->PRCLR0 = SCU_RESET_PRCLR0_USIC0RS_Msk;

   //Configure U0C0.DX0D (P5.0) and U0C0.DOUT0 (P5.1)
   temp = PORT5->IOCR0;
   temp &= ~(PORT5_IOCR0_PC0_Msk | PORT5_IOCR0_PC1_Msk);
   temp |= (2UL << PORT5_IOCR0_PC0_Pos) | (17UL << PORT5_IOCR0_PC1_Pos);
   PORT5->IOCR0 = temp;

   //Select the output driver strength for U0C0.DOUT0 (P5.1)
   temp = PORT5->PDR0;
   temp &= ~PORT5_PDR0_PD1_Msk;
   temp |= (0UL << PORT5_PDR0_PD1_Pos);
   PORT5->PDR0 = temp;

   //Enable USIC module
   USIC0_CH0->KSCFG = USIC_CH_KSCFG_BPMODEN_Msk | USIC_CH_KSCFG_MODEN_Msk;

   //Select input signal (DX0D)
   USIC0_CH0->DX0CR = (3 << USIC_CH_DX0CR_DSEL_Pos) & USIC_CH_DX0CR_DSEL_Msk;

   //Select fractional divider mode
   USIC0_CH0->FDR = (2UL << USIC_CH_FDR_DM_Pos) & USIC_CH_FDR_DM_Msk;
   //Set STEP value
   USIC0_CH0->FDR |= (986UL << USIC_CH_FDR_STEP_Pos) & USIC_CH_FDR_STEP_Msk;

   //Set PDIV value
   USIC0_CH0->BRG = (58UL << USIC_CH_BRG_PDIV_Pos) & USIC_CH_BRG_PDIV_Msk;
   //Set DCTQ value
   USIC0_CH0->BRG |= (16UL << USIC_CH_BRG_DCTQ_Pos) & USIC_CH_BRG_DCTQ_Msk;
   //Set PCTQ value
   USIC0_CH0->BRG |= (0UL << USIC_CH_BRG_PCTQ_Pos) & USIC_CH_BRG_PCTQ_Msk;

   //Set default level
   USIC0_CH0->SCTR = USIC_CH_SCTR_PDL_Msk;
   //Configure transmission mode
   USIC0_CH0->SCTR |= (1UL << USIC_CH_SCTR_TRM_Pos) & USIC_CH_SCTR_TRM_Msk;
   //Set word length (8 bits)
   USIC0_CH0->SCTR |= (7UL << USIC_CH_SCTR_WLE_Pos) & USIC_CH_SCTR_WLE_Msk;
   //Set frame length (8 bits)
   USIC0_CH0->SCTR |= (7UL << USIC_CH_SCTR_FLE_Pos) & USIC_CH_SCTR_FLE_Msk;

   //Set single shot mode
   USIC0_CH0->TCSR = USIC_CH_TCSR_TDSSM_Msk;
   //Configure the gating of the transmission start
   USIC0_CH0->TCSR |= (1UL << USIC_CH_TCSR_TDEN_Pos) & USIC_CH_TCSR_TDEN_Msk;

   //Configure sample mode
   USIC0_CH0->PCR_ASCMode = (1UL << USIC_CH_PCR_ASCMode_SMD_Pos) & USIC_CH_PCR_ASCMode_SMD_Msk;
   //Set 1 stop bit
   USIC0_CH0->PCR_ASCMode |= (0UL << USIC_CH_PCR_ASCMode_STPB_Pos) & USIC_CH_PCR_ASCMode_STPB_Msk;
   //Define the sample point of the bit value
   USIC0_CH0->PCR_ASCMode |= (9UL << USIC_CH_PCR_ASCMode_SP_Pos) & USIC_CH_PCR_ASCMode_SP_Msk;

   //Set TBIF flag
   USIC0_CH0->PSR_ASCMode |= USIC_CH_PSR_TBIF_Msk;

   //Configure transmit FIFO buffer
   USIC0_CH0->TBCTR = (4UL << USIC_CH_TBCTR_SIZE_Pos) & USIC_CH_TBCTR_SIZE_Msk;
   USIC0_CH0->TBCTR |= (1UL << USIC_CH_TBCTR_LIMIT_Pos) & USIC_CH_TBCTR_LIMIT_Msk;
   USIC0_CH0->TBCTR |= (0UL << USIC_CH_TBCTR_DPTR_Pos) & USIC_CH_TBCTR_DPTR_Msk;

   //Configure receive FIFO buffer
   USIC0_CH0->RBCTR = USIC_CH_RBCTR_LOF_Msk;
   USIC0_CH0->RBCTR |= (1UL << USIC_CH_RBCTR_SIZE_Pos) & USIC_CH_RBCTR_SIZE_Msk;
   USIC0_CH0->RBCTR |= (1UL << USIC_CH_RBCTR_LIMIT_Pos) & USIC_CH_RBCTR_LIMIT_Msk;
   USIC0_CH0->RBCTR |= (16UL << USIC_CH_RBCTR_DPTR_Pos) & USIC_CH_RBCTR_DPTR_Msk;

   //Select UART mode
   USIC0_CH0->CCR = (2UL << USIC_CH_CCR_MODE_Pos) & USIC_CH_CCR_MODE_Msk;
   //Disable parity generation
   USIC0_CH0->CCR |= (0UL << USIC_CH_CCR_PM_Pos) & USIC_CH_CCR_PM_Msk;
}


/**
 * @brief Display the contents of an array
 * @param[in] stream Pointer to a FILE object that identifies an output stream
 * @param[in] prepend String to prepend to the left of each line
 * @param[in] data Pointer to the data array
 * @param[in] length Number of bytes to display
 **/

void debugDisplayArray(FILE *stream,
   const char_t *prepend, const void *data, size_t length)
{
   uint_t i;

   for(i = 0; i < length; i++)
   {
      //Beginning of a new line?
      if((i % 16) == 0)
         fprintf(stream, "%s", prepend);
      //Display current data byte
      fprintf(stream, "%02" PRIX8 " ", *((uint8_t *) data + i));
      //End of current line?
      if((i % 16) == 15 || i == (length - 1))
         fprintf(stream, "\r\n");
   }
}


/**
 * @brief Write a character to an output stream
 * @param[in] c Character to be written
 * @param[in] stream Output stream (only stdout and stderr are supported)
 **/

int_t fputc(int_t c, FILE *stream)
{
   //Standard output or error output?
   if(stream == stdout || stream == stderr)
   {
      //Wait for the transmitter to be ready
      while(USIC0_CH0->TRBSR & USIC_CH_TRBSR_TFULL_Msk);

      //Send character
      USIC0_CH0->IN[0] = c;

      //Wait for the transfer to complete
      while(USIC0_CH0->TRBSR & USIC_CH_TRBSR_TFULL_Msk);

      return c;
   }
   //Unknown output?
   else
   {
      return EOF;
   }
}
