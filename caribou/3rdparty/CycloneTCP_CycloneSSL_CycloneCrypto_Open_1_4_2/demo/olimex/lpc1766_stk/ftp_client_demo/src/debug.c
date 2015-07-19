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
#include "lpc1766_stk.h"
#include "debug.h"

//Function declaration
void lcdPutChar(char_t c);


/**
 * @brief Debug UART initialization
 * @param[in] baudrate UART baudrate
 **/

void debugInit(uint32_t baudrate)
{
   uint32_t pclk;

   //Power up UART0
   LPC_SC->PCONP |= PCONP_PCUART0;

   //Configure P0.2 (TXD0) and P0.3 (RXD0)
   LPC_PINCON->PINSEL0 &= ~(PINSEL0_P0_2_MASK | PINSEL0_P0_3_MASK);
   LPC_PINCON->PINSEL0 |= PINSEL0_P0_2_TXD0 | PINSEL0_P0_3_RXD0;

   //Check the UART0 peripheral clock
   switch(LPC_SC->PCLKSEL0 & PCLKSEL0_PCLK_UART0)
   {
   case PCLKSEL0_PCLK_UART0_DIV1:
      pclk = SystemCoreClock;
      break;
   case PCLKSEL0_PCLK_UART0_DIV2:
      pclk = SystemCoreClock / 2;
      break;
   case PCLKSEL0_PCLK_UART0_DIV4:
      pclk = SystemCoreClock / 4;
      break;
   default:
      pclk = SystemCoreClock / 8;
      break;
   }

   //Configure UART0 (8 bits, no parity, 1 stop bit)
   LPC_UART0->LCR = LCR_DLAB | LCR_WORD_LENGTH_SELECT_8;
   //Set baudrate
   LPC_UART0->DLM = MSB(pclk / 16 / baudrate);
   LPC_UART0->DLL = LSB(pclk / 16 / baudrate);
   //Clear DLAB
   LPC_UART0->LCR &= ~LCR_DLAB;

   //Enable and reset FIFOs
   LPC_UART0->FCR = FCR_TX_FIFO_RESET | FCR_RX_FIFO_RESET | FCR_FIFO_ENABLE;
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
   //Standard output?
   if(stream == stdout)
   {
      //Display current character
      lcdPutChar(c);

      return c;
   }
   //Standard error output?
   else if(stream == stderr)
   {
      //Wait for the transmitter to be ready
      while(!(LPC_UART0->LSR & LSR_THRE));

      //Send character
      LPC_UART0->THR = c;

      //Wait for the transfer to complete
      while(!(LPC_UART0->LSR & LSR_TEMT));

      return c;
   }
   //Unknown output
   else
   {
      return EOF;
   }
}
