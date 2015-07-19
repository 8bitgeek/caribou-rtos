/**
 * @file debug.c
 * @brief Debug module
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
#include "lpc1830_xplorer.h"
#include "debug.h"


/**
 * @brief Debug UART initialization
 * @param[in] baudrate UART baudrate
 **/

void debugInit(uint32_t baudrate)
{
   uint32_t div;

   //Compute the UART baudrate prescaler
   div = ((SystemCoreClock / 16) + (baudrate / 2)) / baudrate;

   //Enable GPIO peripheral clock
   LPC_CCU1->CLK_M3_GPIO_CFG |= CCU1_CLK_M3_GPIO_CFG_RUN_Msk;
   while(!(LPC_CCU1->CLK_M3_GPIO_STAT & CCU1_CLK_M3_GPIO_STAT_RUN_Msk));

   //Configure P6.4 (U0_TXD) and P6.5 (U0_RXD)
   LPC_SCU->SFSP6_4 = (2 & SCU_SFSP6_4_MODE_Msk);
   LPC_SCU->SFSP6_5 = SCU_SFSP6_5_EZI_Msk | (2 & SCU_SFSP6_5_MODE_Msk);

   //USART0 source clock selection
   LPC_CGU->BASE_UART0_CLK = CGU_BASE_UART0_CLK_AUTOBLOCK_Msk |
      ((9 << CGU_BASE_UART0_CLK_CLK_SEL_Pos) & CGU_BASE_UART0_CLK_CLK_SEL_Msk);

   //Enable USART0 peripheral clock
   LPC_CCU1->CLK_M3_USART0_CFG |= CCU1_CLK_M3_USART0_CFG_RUN_Msk;
   while(!(LPC_CCU1->CLK_M3_USART0_STAT & CCU1_CLK_M3_USART0_STAT_RUN_Msk));

   //Reset USART0 peripheral
   LPC_RGU->RESET_EXT_STAT44 |= RGU_RESET_EXT_STAT44_PERIPHERAL_RESET_Msk;
   LPC_RGU->RESET_EXT_STAT44 &= ~RGU_RESET_EXT_STAT44_PERIPHERAL_RESET_Msk;

   //Configure UART0 (8 bits, no parity, 1 stop bit)
   LPC_USART0->LCR = USART0_LCR_DLAB_Msk | (3 & USART0_LCR_WLS_Msk);
   //Set baudrate
   LPC_USART0->DLM = MSB(div);
   LPC_USART0->DLL = LSB(div);
   //Clear DLAB
   LPC_USART0->LCR &= ~USART0_LCR_DLAB_Msk;

   //Enable and reset FIFOs
   LPC_USART0->FCR = USART0_FCR_TXFIFORES_Msk |
      USART0_FCR_RXFIFORES_Msk | USART0_FCR_FIFOEN_Msk;
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
 * @brief Redirect standard output to debug UART
 * @param[in] c Character to redirect
 * @param[in] stream Output stream (only stdout and stderr are supported)
 **/

int fputc(int c, FILE *stream)
{
   //Standard output or error output?
   if(stream == stdout || stream == stderr)
   {
      //Wait for the transmitter to be ready
      while(!(LPC_USART0->LSR & USART0_LSR_THRE_Msk));

      //Send character
      LPC_USART0->THR = c;

      //Wait for the transfer to complete
      while(!(LPC_USART0->LSR & USART0_LSR_TEMT_Msk));

      return c;
   }
   //Unknown output
   else
   {
      return EOF;
   }
}
