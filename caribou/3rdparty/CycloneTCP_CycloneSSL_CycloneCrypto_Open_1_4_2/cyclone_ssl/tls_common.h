/**
 * @file tls_common.h
 * @brief Handshake message processing (TLS client and server)
 *
 * @section License
 *
 * Copyright (C) 2010-2014 Oryx Embedded. All rights reserved.
 *
 * This file is part of CycloneSSL Open.
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

#ifndef _TLS_COMMON_H
#define _TLS_COMMON_H

//Dependencies
#include "tls.h"

//TLS related functions
error_t tlsSendCertificate(TlsContext *context);
error_t tlsSendChangeCipherSpec(TlsContext *context);
error_t tlsSendFinished(TlsContext *context);
error_t tlsSendAlert(TlsContext *context, uint8_t level, uint8_t description);

error_t tlsParseCertificate(TlsContext *context, const TlsCertificate *message, size_t length);
error_t tlsParseChangeCipherSpec(TlsContext *context, const TlsChangeCipherSpec *message, size_t length);
error_t tlsParseFinished(TlsContext *context, const TlsFinished *message, size_t length);
error_t tlsParseAlert(TlsContext *context, const TlsAlert *message, size_t length);

#endif
