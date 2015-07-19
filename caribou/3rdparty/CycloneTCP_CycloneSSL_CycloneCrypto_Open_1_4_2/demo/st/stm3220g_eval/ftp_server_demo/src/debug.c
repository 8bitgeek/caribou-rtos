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
#include "stm32f2xx.h"
#include "stm322xg_eval.h"
#include "debug.h"

//Function declaration
void lcdPutChar(char_t c);


/**
 * @brief Debug UART initialization
 * @param[in] baudrate UART baudrate
 **/

void debugInit(uint32_t baudrate)
{
#if 0
   USART_InitTypeDef USART_InitStructure;

   USART_InitStructure.USART_BaudRate = baudrate;
   USART_InitStructure.USART_WordLength = USART_WordLength_8b;
   USART_InitStructure.USART_StopBits = USART_StopBits_1;
   USART_InitStructure.USART_Parity = USART_Parity_No;
   USART_InitStructure.USART_HardwareFlowControl = USART_HardwareFlowControl_None;
   USART_InitStructure.USART_Mode = USART_Mode_Rx | USART_Mode_Tx;

   STM_EVAL_COMInit(COM1, &USART_InitStructure);
#elif 0
   GPIO_InitTypeDef GPIO_InitStructure;
   USART_InitTypeDef USART_InitStructure;

   //Enable GPIOC clock
   RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOC, ENABLE);
   //Enable USART3 clock
   RCC_APB1PeriphClockCmd(RCC_APB1Periph_USART3, ENABLE);

   //Configure USART3_TX (PC10) and USART3_RX (PC11)
   GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
   GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_UP;
   GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
   GPIO_InitStructure.GPIO_Pin = GPIO_Pin_10 | GPIO_Pin_11;
   GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
   GPIO_Init(GPIOC, &GPIO_InitStructure);

   //Remap USART3_TX and USART3_RX pins to PC10 and PC11
   GPIO_PinAFConfig(GPIOC, GPIO_PinSource10, GPIO_AF_USART3);
   GPIO_PinAFConfig(GPIOC, GPIO_PinSource11, GPIO_AF_USART3);

   //Configure USART3
   USART_InitStructure.USART_BaudRate = baudrate;
   USART_InitStructure.USART_WordLength = USART_WordLength_8b;
   USART_InitStructure.USART_StopBits = USART_StopBits_1;
   USART_InitStructure.USART_Parity = USART_Parity_No;
   USART_InitStructure.USART_HardwareFlowControl = USART_HardwareFlowControl_None;
   USART_InitStructure.USART_Mode = USART_Mode_Rx | USART_Mode_Tx;
   USART_Init(USART3, &USART_InitStructure);

   //Enable USART3
   USART_Cmd(USART3, ENABLE);
#else
   GPIO_InitTypeDef GPIO_InitStructure;
   USART_InitTypeDef USART_InitStructure;

   //Enable GPIOC clock
   RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOC, ENABLE);
   //Enable USART6 clock
   RCC_APB2PeriphClockCmd(RCC_APB2Periph_USART6, ENABLE);

   //Configure USART6_TX (PC6)
   GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
   GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_UP;
   GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
   GPIO_InitStructure.GPIO_Pin = GPIO_Pin_6;
   GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
   GPIO_Init(GPIOC, &GPIO_InitStructure);

   //Remap USART6_TX pins to PC6
   GPIO_PinAFConfig(GPIOC, GPIO_PinSource6, GPIO_AF_USART6);

   //Configure USART6
   USART_InitStructure.USART_BaudRate = baudrate;
   USART_InitStructure.USART_WordLength = USART_WordLength_8b;
   USART_InitStructure.USART_StopBits = USART_StopBits_1;
   USART_InitStructure.USART_Parity = USART_Parity_No;
   USART_InitStructure.USART_HardwareFlowControl = USART_HardwareFlowControl_None;
   USART_InitStructure.USART_Mode = USART_Mode_Tx;
   USART_Init(USART6, &USART_InitStructure);

   //Enable USART6
   USART_Cmd(USART6, ENABLE);
#endif
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
      while(!(USART6->SR & USART_SR_TXE));

      //Send character
      USART6->DR = c;

      //Wait for the transfer to complete
      while(!(USART6->SR & USART_SR_TC));

      return c;
   }
   //Unknown output?
   else
   {
      return EOF;
   }
}
