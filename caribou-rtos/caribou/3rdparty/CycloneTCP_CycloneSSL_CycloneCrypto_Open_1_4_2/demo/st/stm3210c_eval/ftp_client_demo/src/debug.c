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
#include <stm32f10x.h>
#include "stm3210c_eval.h"
#include "debug.h"

#define FPCLK1 36000000

//Function declaration
void lcdPutChar(char_t c);


/**
 * @brief Debug UART initialization
 * @param[in] baudrate UART baudrate
 **/

void debugInit(uint32_t baudrate)
{
   GPIO_InitTypeDef GPIO_InitStructure;

   //Enable GPIOD clock
   RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOD | RCC_APB2Periph_AFIO, ENABLE);
   //Enable USART2 clock
   RCC_APB1PeriphClockCmd(RCC_APB1Periph_USART2, ENABLE);

   //Remap USART2_TX and USART2_RX pins
   GPIO_PinRemapConfig(GPIO_Remap_USART2, ENABLE);

   //Configure TX as alternate function push-pull
   GPIO_InitStructure.GPIO_Pin = EVAL_COM1_TX_PIN;
   GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP;
   GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
   GPIO_Init(EVAL_COM1_TX_GPIO_PORT, &GPIO_InitStructure);

   //Configure RX as input floating
   GPIO_InitStructure.GPIO_Pin = EVAL_COM1_RX_PIN;
   GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN_FLOATING;
   GPIO_Init(EVAL_COM1_RX_GPIO_PORT, &GPIO_InitStructure);

   //Configure USART2 (8 data bits, 1 stop bit, no parity)
   USART2->CR1 = USART_CR1_TE | USART_CR1_RE;
   USART2->CR2 = 0;
   USART2->CR3 = 0;

   //Set baud rate
   USART2->BRR = FPCLK1 / baudrate;

   //Enable USART2
   USART2->CR1 |= USART_CR1_UE;
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
 * @brief Redirect standard output to DBGU module
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
      while(!(USART2->SR & USART_SR_TXE));

      //Send character
      USART2->DR = c;

      //Wait for the transfer to complete
      while(!(USART2->SR & USART_SR_TC));

      return c;
   }
   //Unknown output?
   else
   {
      return EOF;
   }
}
