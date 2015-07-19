/**
 * @file endian.c
 * @brief Byte order conversion
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
#include "endian.h"


/**
 * @brief Reverse the byte order of a 16-bit value
 * @return 16-bit value with byte order swapped
 **/

uint16_t _swap16(uint16_t value)
{
   return _SWAP16(value);
}


/**
 * @brief Reverse the byte order of a 32-bit value
 * @return 32-bit value with byte order swapped
 **/

uint32_t _swap32(uint32_t value)
{
   return _SWAP32(value);
}


/**
 * @brief Reverse the byte order of a 64-bit value
 * @return 64-bit value with byte order swapped
 **/

uint64_t _swap64(uint64_t value)
{
   return _SWAP64(value);
}
