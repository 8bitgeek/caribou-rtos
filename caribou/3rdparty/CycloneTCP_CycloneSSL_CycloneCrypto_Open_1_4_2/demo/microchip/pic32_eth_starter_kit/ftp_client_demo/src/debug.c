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
#include <p32xxxx.h>
#include <plib.h>
#include "debug.h"


/**
 * @brief Debug UART initialization
 * @param[in] baudrate UART baudrate
 **/

void debugInit(uint32_t baudrate)
{
   //Configure UART1 (8 bits, no parity, 1 stop bit)
   UARTConfigure(UART1, UART_ENABLE_PINS_TX_RX_ONLY);
   UARTSetFifoMode(UART1, UART_INTERRUPT_ON_RX_NOT_EMPTY);
   UARTSetLineControl(UART1, UART_DATA_SIZE_8_BITS | UART_PARITY_NONE | UART_STOP_BITS_1);

   //Set baudrate
   UARTSetDataRate(UART1, 40000000, baudrate);

   //Enable UART1
   UARTEnable(UART1, UART_ENABLE_FLAGS(UART_PERIPHERAL | UART_TX | UART_RX));
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
      while(!UARTTransmitterIsReady(UART1));

      //Send character
      UARTSendDataByte(UART1, c);

      //Wait for the transfer to complete
      while(!UARTTransmitterIsReady(UART1));

      return c;
   }
   //Unknown output
   else
   {
      return EOF;
   }
}
