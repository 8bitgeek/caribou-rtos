/**
 * @file ftp_server_commands.h
 * @brief FTP server (command processing)
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

#ifndef _FTP_SERVER_COMMANDS_H
#define _FTP_SERVER_COMMANDS_H

//Dependencies
#include "ftp_server.h"

//FTP related functions
void ftpServerProcessCmd(FtpServerContext *context,
   FtpClientConnection *connection);

void ftpServerProcessInvalidCmd(FtpServerContext *context,
   FtpClientConnection *connection, char_t *param);

void ftpServerProcessNoop(FtpServerContext *context,
   FtpClientConnection *connection, char_t *param);

void ftpServerProcessSyst(FtpServerContext *context,
   FtpClientConnection *connection, char_t *param);

void ftpServerProcessFeat(FtpServerContext *context,
   FtpClientConnection *connection, char_t *param);

void ftpServerProcessType(FtpServerContext *context,
   FtpClientConnection *connection, char_t *param);

void ftpServerProcessStru(FtpServerContext *context,
   FtpClientConnection *connection, char_t *param);

void ftpServerProcessMode(FtpServerContext *context,
   FtpClientConnection *connection, char_t *param);

void ftpServerProcessUser(FtpServerContext *context,
   FtpClientConnection *connection, char_t *param);

void ftpServerProcessPass(FtpServerContext *context,
   FtpClientConnection *connection, char_t *param);

void ftpServerProcessRein(FtpServerContext *context,
   FtpClientConnection *connection, char_t *param);

void ftpServerProcessQuit(FtpServerContext *context,
   FtpClientConnection *connection, char_t *param);

void ftpServerProcessPort(FtpServerContext *context,
   FtpClientConnection *connection, char_t *param);

void ftpServerProcessEprt(FtpServerContext *context,
   FtpClientConnection *connection, char_t *param);

void ftpServerProcessPasv(FtpServerContext *context,
   FtpClientConnection *connection, char_t *param);

void ftpServerProcessEpsv(FtpServerContext *context,
   FtpClientConnection *connection, char_t *param);

void ftpServerProcessAbor(FtpServerContext *context,
   FtpClientConnection *connection, char_t *param);

void ftpServerProcessPwd(FtpServerContext *context,
   FtpClientConnection *connection, char_t *param);

void ftpServerProcessCwd(FtpServerContext *context,
   FtpClientConnection *connection, char_t *param);

void ftpServerProcessCdup(FtpServerContext *context,
   FtpClientConnection *connection, char_t *param);

void ftpServerProcessList(FtpServerContext *context,
   FtpClientConnection *connection, char_t *param);

void ftpServerProcessMkd(FtpServerContext *context,
   FtpClientConnection *connection, char_t *param);

void ftpServerProcessRmd(FtpServerContext *context,
   FtpClientConnection *connection, char_t *param);

void ftpServerProcessSize(FtpServerContext *context,
   FtpClientConnection *connection, char_t *param);

void ftpServerProcessRetr(FtpServerContext *context,
   FtpClientConnection *connection, char_t *param);

void ftpServerProcessStor(FtpServerContext *context,
   FtpClientConnection *connection, char_t *param);

void ftpServerProcessAppe(FtpServerContext *context,
   FtpClientConnection *connection, char_t *param);

void ftpServerProcessRnfr(FtpServerContext *context,
   FtpClientConnection *connection, char_t *param);

void ftpServerProcessRnto(FtpServerContext *context,
   FtpClientConnection *connection, char_t *param);

void ftpServerProcessDele(FtpServerContext *context,
   FtpClientConnection *connection, char_t *param);

#endif
