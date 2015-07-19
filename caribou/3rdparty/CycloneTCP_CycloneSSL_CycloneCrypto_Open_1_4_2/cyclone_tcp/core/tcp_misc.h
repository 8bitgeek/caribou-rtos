/**
 * @file tcp_misc.h
 * @brief TCP miscellaneous functions
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

#ifndef _TCP_MISC_H
#define _TCP_MISC_H

//Dependencies
#include "tcp.h"

//TCP related functions
error_t tcpSendSegment(Socket *socket, uint8_t flags, uint32_t seqNum,
   uint32_t ackNum, size_t length, bool_t addToQueue);

error_t tcpSendResetSegment(NetInterface *interface,
   IpPseudoHeader *pseudoHeader, TcpHeader *segment, size_t length);

error_t tcpAddOption(TcpHeader *segment, uint8_t kind, const void *value, uint8_t length);
TcpOption *tcpGetOption(TcpHeader *segment, uint8_t kind);

error_t tcpCheckSequenceNumber(Socket *socket, TcpHeader *segment, size_t length);
error_t tcpCheckSyn(Socket *socket, TcpHeader *segment, size_t length);
error_t tcpCheckAck(Socket *socket, TcpHeader *segment, size_t length);

void tcpProcessSegmentData(Socket *socket, TcpHeader *segment,
   const ChunkedBuffer *buffer, size_t offset, size_t length);

void tcpDeleteControlBlock(Socket *socket);

void tcpUpdateRetransmitQueue(Socket *socket);
void tcpFlushRetransmitQueue(Socket *socket);

void tcpFlushSynQueue(Socket *socket);

void tcpUpdateSackBlocks(Socket *socket, uint32_t *leftEdge, uint32_t *rightEdge);
void tcpUpdateReceiveWindow(Socket *socket);

void tcpComputeRto(Socket *socket);
error_t tcpRetransmitSegment(Socket *socket);
error_t tcpNagleAlgo(Socket *socket);

void tcpChangeState(Socket *socket, TcpState newState);

void tcpUpdateEvents(Socket *socket);
uint_t tcpWaitForEvents(Socket *socket, uint_t eventMask, systime_t timeout);

void tcpWriteTxBuffer(Socket *socket, uint32_t seqNum,
   const uint8_t *data, size_t length);

error_t tcpReadTxBuffer(Socket *socket, uint32_t seqNum,
   ChunkedBuffer *buffer, size_t length);

void tcpWriteRxBuffer(Socket *socket, uint32_t seqNum,
   const ChunkedBuffer *data, size_t dataOffset, size_t length);

void tcpReadRxBuffer(Socket *socket, uint32_t seqNum, uint8_t *data, size_t length);

void tcpDumpHeader(const TcpHeader *segment, size_t length, uint32_t iss, uint32_t irs);

#endif
