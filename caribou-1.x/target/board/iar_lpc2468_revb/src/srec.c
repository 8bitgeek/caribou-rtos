/******************************************************************************
* Copyright © 2005-2013 by Pike Aerospace Research Corporation
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
#include "srec.h"

#define nibble(h) (((h)>='A'&&(h)<='F') ? (((h)-'A')+10) : ((h)-'0'))

/**
 * Calculate the checksum.
 * @param length The length byte extracted from the S record.
 * @param input The ASCII input record starting after the length byte.
 * @return the 2's compliment checksum.
 */
static uint8_t make_checksum(uint8_t length, char* input)
{
	uint8_t rc=length;
	for(int n=0; n < length; n++)
		rc += input[n];
	return ~rc;
}

static uint8_t ascii_hex_8(char* input)
{
	uint8_t rc;
	rc=(nibble(*input++)<<4);
	rc|=nibble(*input);
	return rc;
}

static uint16_t ascii_hex_16(char* input)
{
	uint16_t rc;
	rc=(ascii_hex_8(input)<<8);
	input+=2;
	rc|=ascii_hex_8(input);
	return rc;
}

static uint32_t ascii_hex_24(char* input)
{
	uint32_t rc;
	rc=(ascii_hex_8(input)<<16);
	input+=2;
	rc|=(ascii_hex_8(input)<<8);
	input+=2;
	rc|=ascii_hex_8(input);
	return rc;
}

static uint32_t ascii_hex_32(char* input)
{
	uint32_t rc;
	rc=(ascii_hex_16(input)<<16);
	input+=4;
	rc|=ascii_hex_16(input);
	return rc;
}

/**
 * @brief Translate ASCII hex input buffer to binary output buffer.
 * @return length
 */
static uint8_t ascii_hex_translate(uint8_t length, char* input, srec_result_t* output)
{
	for(int n=0; n < length; n++)
	{
		uint8_t ch = ascii_hex_8(input);
		input++;
		input++;
		output->data[n]=ch;
	}
	return length;
}

/**
 * @brief get the binary checksum given the ASCII input buffer and length
 * @param length The length byte from the S record.
 * @param input The input ASCII hex text imediately following the length byte.
 * @return The checkcum contained in the S record ASCII text, converted to binary.
 */
static uint8_t fetch_checksum(uint8_t length, char* input)
{
	char* pchecksum = &input[length*2];
	uint8_t rc=ascii_hex_8(pchecksum);
	return ~rc;
}

/**
 * @brief Parse the srecord formet input ASCII text string
 * @param input ASCII text buffer containing one line of S record data
 * @param output A pointer to an srec output structure.
 * @return Output Status.
 */
srecord_t srec_parse(char* input, srec_result_t* output)
{
	memset(output,0,sizeof(srec_result_t));
	output->record = Invalid;
	if ( input )
	{
		if ( strlen(input) >= 10 && *input++ == 'S' ) // could be an S record?
		{
			uint8_t srec_type = *input++;
			uint8_t length = ascii_hex_8(input); input += 2;
			
			if ( make_checksum(length,input) == fetch_checksum(length,input) )
			{
				switch(srec_type)
				{
					case '0':	
						output->record = S0;
						break;
					case '1':	
						output->address = ascii_hex_16(input);
						ascii_hex_translate(length-3,&input[4],output);
						output->record = S1;
						break;
					case '2':	
						output->address = ascii_hex_24(input);
						ascii_hex_translate(length-5,&input[6],output);
						output->record = S2;
						break;
					case '3':
						output->address = ascii_hex_32(input);
						output->length=ascii_hex_translate(length-7,&input[8],output);
						output->record = S3;
						break;
					case '5':
						output->record = S5;
						break;
					case '7':	
						output->address = ascii_hex_16(input);
						output->record = S7;
						break;
					case '8':	
						output->address = ascii_hex_24(input);
						output->record = S8;
						break;
					case '9':	
						output->address = ascii_hex_32(input);
						output->record = S9;
						break;
				}
			}
		}
	}
	return output->record;
}
