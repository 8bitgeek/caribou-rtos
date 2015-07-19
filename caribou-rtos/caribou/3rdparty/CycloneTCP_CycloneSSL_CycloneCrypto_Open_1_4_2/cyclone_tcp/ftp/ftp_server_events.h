/**
 * @file ftp_server_events.h
 * @brief FTP server (event handlers)
 *
 * @section License
 *
 * Copyright (C) 2010-2014 Oryx Embedded. All rights reserved.
 *
 * This file is part of CycloneTCP Open.
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

#ifndef _FTP_SERVER_EVENTS_H
#define _FTP_SERVER_EVENTS_H

//Dependencies
#include "ftp_server.h"

//Time constant
#define FTP_SERVER_180_DAYS (180 * 86400)

//FTP related functions
void ftpServerControlEventHandler(FtpServerContext *context,
   FtpClientConnection * connection, uint_t eventFlags);

void ftpServerDataEventHandler(FtpServerContext *context,
   FtpClientConnection * connection, uint_t eventFlags);

void ftpServerSendData(FtpServerContext *context, FtpClientConnection *connection);
void ftpServerReceiveData(FtpServerContext *context, FtpClientConnection *connection);

#endif
