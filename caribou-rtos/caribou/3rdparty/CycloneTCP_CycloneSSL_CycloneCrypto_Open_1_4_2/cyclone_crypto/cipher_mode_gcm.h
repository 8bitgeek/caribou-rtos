/**
 * @file cipher_mode_gcm.h
 * @brief Galois/Counter Mode (GCM)
 *
 * @section License
 *
 * Copyright (C) 2010-2014 Oryx Embedded. All rights reserved.
 *
 * This file is part of CycloneCrypto Open.
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

#ifndef _BLOCK_CIPHER_MODE_GCM_H
#define _BLOCK_CIPHER_MODE_GCM_H

//Dependencies
#include "crypto.h"

//GCM related functions
error_t gcmEncrypt(const CipherAlgo *cipher, void *context, const uint8_t *iv, size_t ivLen,
   const uint8_t *a, size_t aLen, const uint8_t *p, uint8_t *c, size_t length, uint8_t *t, size_t tLen);

error_t gcmDecrypt(const CipherAlgo *cipher, void *context, const uint8_t *iv, size_t ivLen,
   const uint8_t *a, size_t aLen, const uint8_t *c, uint8_t *p, size_t length, const uint8_t *t, size_t tLen);

void gcmMul(uint8_t *x, const uint8_t *y);
void gcmXorBlock(uint8_t *a, const uint8_t *b, const uint8_t *c, size_t n);
void gcmShiftBlock(uint8_t *a);
void gcmIncCounter(uint8_t *a);

#endif
