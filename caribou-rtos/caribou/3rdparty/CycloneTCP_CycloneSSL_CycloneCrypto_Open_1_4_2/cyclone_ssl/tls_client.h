/**
 * @file tls_client.h
 * @brief Handshake message processing (TLS client)
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

#ifndef _TLS_CLIENT_H
#define _TLS_CLIENT_H

//Dependencies
#include "tls.h"

//Client specific functions
error_t tlsClientHandshake(TlsContext *context);
error_t tlsParseServerMessage(TlsContext *context);

error_t tlsSendClientHello(TlsContext *context);
error_t tlsSendClientKeyExchange(TlsContext *context);
error_t tlsSendCertificateVerify(TlsContext *context);

error_t tlsParseServerHello(TlsContext *context, const TlsServerHello *message, size_t length);
error_t tlsParseServerKeyExchange(TlsContext *context, const TlsServerKeyExchange *message, size_t length);
error_t tlsParseCertificateRequest(TlsContext *context, const TlsCertificateRequest *message, size_t length);
error_t tlsParseServerHelloDone(TlsContext *context, const TlsServerHelloDone *message, size_t length);

#endif
