/**
 * @file tcp_misc.c
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

//Switch to the appropriate trace level
#define TRACE_LEVEL TCP_TRACE_LEVEL

//Dependencies
#include <stdlib.h>
#include <string.h>
#include "tcp_ip_stack.h"
#include "socket.h"
#include "tcp.h"
#include "tcp_misc.h"
#include "ip.h"
#include "ipv4.h"
#include "date_time.h"
#include "debug.h"

//Check TCP/IP stack configuration
#if (TCP_SUPPORT == ENABLED)


/**
 * @brief Send a TCP segment
 * @param[in] socket Handle referencing a socket
 * @param[in] flags Value that contains bitwise OR of flags (see #TcpFlags enumeration)
 * @param[in] seqNum Sequence number
 * @param[in] ackNum Acknowledgment number
 * @param[in] length Length of the segment data
 * @param[in] addToQueue Add the segment to retransmission queue
 * @return Error code
 **/

error_t tcpSendSegment(Socket *socket, uint8_t flags, uint32_t seqNum,
   uint32_t ackNum, size_t length, bool_t addToQueue)
{
   error_t error;
   size_t offset;
   size_t totalLength;
   uint_t timeToLive;
   ChunkedBuffer *buffer;
   TcpHeader *segment;
   TcpQueueItem *queueItem;
   IpPseudoHeader pseudoHeader;

   //Maximum segment size
   const uint16_t mss = HTONS(TCP_MAX_MSS);

   //Allocate a memory buffer to hold the TCP segment
   buffer = ipAllocBuffer(TCP_MAX_HEADER_LENGTH, &offset);
   //Failed to allocate memory?
   if(!buffer) return ERROR_OUT_OF_MEMORY;

   //Point to the beginning of the TCP segment
   segment = chunkedBufferAt(buffer, offset);

   //Format TCP header
   segment->srcPort = htons(socket->localPort);
   segment->destPort = htons(socket->remotePort);
   segment->seqNum = htonl(seqNum);
   segment->ackNum = (flags & TCP_FLAG_ACK) ? htonl(ackNum) : 0;
   segment->reserved1 = 0;
   segment->dataOffset = 5;
   segment->flags = flags;
   segment->reserved2 = 0;
   segment->window = htons(socket->rcvWnd);
   segment->checksum = 0;
   segment->urgentPointer = 0;

   //SYN flag set?
   if(flags & TCP_FLAG_SYN)
   {
      //Append MSS option
      tcpAddOption(segment, TCP_OPTION_MAX_SEGMENT_SIZE, &mss, sizeof(mss));

#if (TCP_SACK_SUPPORT == ENABLED)
      //Append SACK Permitted option
      tcpAddOption(segment, TCP_OPTION_SACK_PERMITTED, NULL, 0);
#endif
   }

   //Adjust the length of the multi-part buffer
   chunkedBufferSetLength(buffer, offset + segment->dataOffset * 4);

   //Any data to send?
   if(length > 0)
   {
      //Copy data
      error = tcpReadTxBuffer(socket, seqNum, buffer, length);
      //Any error to report?
      if(error)
      {
         //Clean up side effects
         chunkedBufferFree(buffer);
         //Exit immediately
         return error;
      }
   }

   //Calculate the length of the complete TCP segment
   totalLength = segment->dataOffset * 4 + length;

#if (IPV4_SUPPORT == ENABLED)
   //Destination address is an IPv4 address?
   if(socket->remoteIpAddr.length == sizeof(Ipv4Addr))
   {
      //Format IPv4 pseudo header
      pseudoHeader.length = sizeof(Ipv4PseudoHeader);
      pseudoHeader.ipv4Data.srcAddr = socket->localIpAddr.ipv4Addr;
      pseudoHeader.ipv4Data.destAddr = socket->remoteIpAddr.ipv4Addr;
      pseudoHeader.ipv4Data.reserved = 0;
      pseudoHeader.ipv4Data.protocol = IPV4_PROTOCOL_TCP;
      pseudoHeader.ipv4Data.length = htons(totalLength);

      //Calculate TCP header checksum
      segment->checksum = ipCalcUpperLayerChecksumEx(&pseudoHeader.ipv4Data,
         sizeof(Ipv4PseudoHeader), buffer, offset, totalLength);

      //Set TTL value
      timeToLive = IPV4_DEFAULT_TTL;
   }
   else
#endif
#if (IPV6_SUPPORT == ENABLED)
   //Destination address is an IPv6 address?
   if(socket->remoteIpAddr.length == sizeof(Ipv6Addr))
   {
      //Format IPv6 pseudo header
      pseudoHeader.length = sizeof(Ipv6PseudoHeader);
      pseudoHeader.ipv6Data.srcAddr = socket->localIpAddr.ipv6Addr;
      pseudoHeader.ipv6Data.destAddr = socket->remoteIpAddr.ipv6Addr;
      pseudoHeader.ipv6Data.length = htonl(totalLength);
      pseudoHeader.ipv6Data.reserved = 0;
      pseudoHeader.ipv6Data.nextHeader = IPV6_TCP_HEADER;

      //Calculate TCP header checksum
      segment->checksum = ipCalcUpperLayerChecksumEx(&pseudoHeader.ipv6Data,
         sizeof(Ipv6PseudoHeader), buffer, offset, totalLength);

      //Set Hop Limit value
      timeToLive = IPV6_DEFAULT_HOP_LIMIT;
   }
   else
#endif
   //Destination address is not valid?
   {
      //Free previously allocated memory
      chunkedBufferFree(buffer);
      //This should never occur...
      return ERROR_INVALID_ADDRESS;
   }

   //Add current segment to retransmission queue?
   if(addToQueue)
   {
      //Empty retransmission queue?
      if(!socket->retransmitQueue)
      {
         //Create a new item
         queueItem = memPoolAlloc(sizeof(TcpQueueItem));
         //Add the newly created item to the queue
         socket->retransmitQueue = queueItem;
      }
      else
      {
         //Point to the very first item
         queueItem = socket->retransmitQueue;
         //Reach the last item of the retransmission queue
         while(queueItem->next) queueItem = queueItem->next;
         //Create a new item
         queueItem->next = memPoolAlloc(sizeof(TcpQueueItem));
         //Point to the newly created item
         queueItem = queueItem->next;
      }

      //Failed to allocate memory?
      if(!queueItem)
      {
         //Free previously allocated memory
         chunkedBufferFree(buffer);
         //Return status
         return ERROR_OUT_OF_MEMORY;
      }

      //Retransmission mechanism requires additional information
      queueItem->next = NULL;
      queueItem->length = length;
      queueItem->sacked = FALSE;
      //Save TCP header
      memcpy(queueItem->header, segment, segment->dataOffset * 4);
      //Save pseudo header
      queueItem->pseudoHeader = pseudoHeader;
      //Save TTL value
      queueItem->timeToLive = timeToLive;

      //Take one RTT measurement at a time
      if(!socket->rttBusy)
      {
         //Save round-trip start time
         socket->rttStartTime = osGetTickCount();
         //Record current sequence number
         socket->rttSeqNum = ntohl(segment->seqNum);
         //Wait for an acknowledgment that covers that sequence number...
         socket->rttBusy = TRUE;
         //Reset the byte counter
         socket->n = 0;
      }

      //Check whether the RTO timer is already running
      if(!osTimerRunning(&socket->retransmitTimer))
      {
         //If the timer is not running, start it running so that
         //it will expire after RTO seconds
         osTimerStart(&socket->retransmitTimer, socket->rto);
         //Reset retransmission counter
         socket->retransmitCount = 0;
      }
   }

   //Debug message
   TRACE_DEBUG("%s: Sending TCP segment (%" PRIuSIZE " data bytes)...\r\n",
      formatSystemTime(osGetTickCount(), NULL), length);

   //Dump TCP header contents for debugging purpose
   tcpDumpHeader(segment, length, socket->iss, socket->irs);

   //Send TCP segment
   error = ipSendDatagram(socket->interface, &pseudoHeader, buffer, offset, timeToLive);

   //Free previously allocated memory
   chunkedBufferFree(buffer);
   //Return error code
   return error;
}


/**
 * @brief Send a TCP reset in response to an invalid segment
 * @param[in] interface Underlying network interface
 * @param[in] pseudoHeader TCP pseudo header describing the incoming segment
 * @param[in] segment Incoming TCP segment
 * @param[in] length Length of the incoming segment data
 * @return Error code
 **/

error_t tcpSendResetSegment(NetInterface *interface,
   IpPseudoHeader *pseudoHeader, TcpHeader *segment, size_t length)
{
   error_t error;
   size_t offset;
   uint_t timeToLive;
   uint8_t flags;
   uint32_t seqNum;
   uint32_t ackNum;
   ChunkedBuffer *buffer;
   TcpHeader *segment2;
   IpPseudoHeader pseudoHeader2;

   //Check whether the ACK bit is set
   if(segment->flags & TCP_FLAG_ACK)
   {
      //If the incoming segment has an ACK field, the reset takes
      //its sequence number from the ACK field of the segment
      flags = TCP_FLAG_RST;
      seqNum = segment->ackNum;
      ackNum = 0;
   }
   else
   {
      //Otherwise the reset has sequence number zero and the ACK field is set to
      //the sum of the sequence number and segment length of the incoming segment
      flags = TCP_FLAG_RST | TCP_FLAG_ACK;
      seqNum = 0;
      ackNum = segment->seqNum + length;

      //Advance the acknowledgment number over the SYN or the FIN
      if(segment->flags & TCP_FLAG_SYN)
         ackNum++;
      if(segment->flags & TCP_FLAG_FIN)
         ackNum++;
   }

   //Allocate a memory buffer to hold the reset segment
   buffer = ipAllocBuffer(sizeof(TcpHeader), &offset);
   //Failed to allocate memory?
   if(!buffer) return ERROR_OUT_OF_MEMORY;

   //Point to the beginning of the TCP segment
   segment2 = chunkedBufferAt(buffer, offset);

   //Format TCP header
   segment2->srcPort = htons(segment->destPort);
   segment2->destPort = htons(segment->srcPort);
   segment2->seqNum = htonl(seqNum);
   segment2->ackNum = htonl(ackNum);
   segment2->reserved1 = 0;
   segment2->dataOffset = 5;
   segment2->flags = flags;
   segment2->reserved2 = 0;
   segment2->window = 0;
   segment2->checksum = 0;
   segment2->urgentPointer = 0;

#if (IPV4_SUPPORT == ENABLED)
   //Destination address is an IPv4 address?
   if(pseudoHeader->length == sizeof(Ipv4PseudoHeader))
   {
      //Format IPv4 pseudo header
      pseudoHeader2.length = sizeof(Ipv4PseudoHeader);
      pseudoHeader2.ipv4Data.srcAddr = pseudoHeader->ipv4Data.destAddr;
      pseudoHeader2.ipv4Data.destAddr = pseudoHeader->ipv4Data.srcAddr;
      pseudoHeader2.ipv4Data.reserved = 0;
      pseudoHeader2.ipv4Data.protocol = IPV4_PROTOCOL_TCP;
      pseudoHeader2.ipv4Data.length = HTONS(sizeof(TcpHeader));

      //Calculate TCP header checksum
      segment2->checksum = ipCalcUpperLayerChecksumEx(&pseudoHeader2.ipv4Data,
         sizeof(Ipv4PseudoHeader), buffer, offset, sizeof(TcpHeader));

      //Set TTL value
      timeToLive = IPV4_DEFAULT_TTL;
   }
   else
#endif
#if (IPV6_SUPPORT == ENABLED)
   //Destination address is an IPv6 address?
   if(pseudoHeader->length == sizeof(Ipv6PseudoHeader))
   {
      //Format IPv6 pseudo header
      pseudoHeader2.length = sizeof(Ipv6PseudoHeader);
      pseudoHeader2.ipv6Data.srcAddr = pseudoHeader->ipv6Data.destAddr;
      pseudoHeader2.ipv6Data.destAddr = pseudoHeader->ipv6Data.srcAddr;
      pseudoHeader2.ipv6Data.length = HTONL(sizeof(TcpHeader));
      pseudoHeader2.ipv6Data.reserved = 0;
      pseudoHeader2.ipv6Data.nextHeader = IPV6_TCP_HEADER;

      //Calculate TCP header checksum
      segment2->checksum = ipCalcUpperLayerChecksumEx(&pseudoHeader2.ipv6Data,
         sizeof(Ipv6PseudoHeader), buffer, offset, sizeof(TcpHeader));

      //Set Hop Limit value
      timeToLive = IPV6_DEFAULT_HOP_LIMIT;
   }
   else
#endif
   //Destination address is not valid?
   {
      //Free previously allocated memory
      chunkedBufferFree(buffer);
      //This should never occur...
      return ERROR_INVALID_ADDRESS;
   }

   //Debug message
   TRACE_DEBUG("%s: Sending TCP reset segment...\r\n",
      formatSystemTime(osGetTickCount(), NULL));
   //Dump TCP header contents for debugging purpose
   tcpDumpHeader(segment2, length, 0, 0);

   //Send TCP segment
   error = ipSendDatagram(interface, &pseudoHeader2, buffer, offset, timeToLive);

   //Free previously allocated memory
   chunkedBufferFree(buffer);
   //Return error code
   return error;
}


/**
 * @brief Append an option to a TCP segment
 * @param[in] segment Pointer to the TCP header
 * @param[in] kind Option code
 * @param[in] value Option value
 * @param[in] length Length of the option value
 * @return Error code
 **/

error_t tcpAddOption(TcpHeader *segment, uint8_t kind, const void *value, uint8_t length)
{
   uint_t i;
   size_t paddingSize;
   TcpOption *option;

   //Length of the complete option field
   length += sizeof(TcpOption);

   //Make sure there is enough space to add the specified option
   if((segment->dataOffset * 4 + length) > TCP_MAX_HEADER_LENGTH)
      return ERROR_FAILURE;

   //Index of the first available byte
   i = segment->dataOffset * 4 - sizeof(TcpHeader);

   //Calculate the number of padding bytes
   paddingSize = (length % 4) ? 4 - (length % 4) : 0;
   //Write padding bytes
   while(paddingSize--)
      segment->options[i++] = TCP_OPTION_NOP;

   //Point to the current location
   option = (TcpOption *) (segment->options + i);
   //Write specified option
   option->kind = kind;
   option->length = length;
   memcpy(option->value, value, length - sizeof(TcpOption));
   //Adjust index value
   i += length;

   //Update TCP header length
   segment->dataOffset = (sizeof(TcpHeader) + i) / 4;

   //Option successfully added
   return NO_ERROR;
}


/**
 * @brief Find a specified option in a TCP segment
 * @param[in] segment Pointer to the TCP header
 * @param[in] kind Code of the option to find
 * @return If the specified option is found, a pointer to the corresponding
 *   option is returned. Otherwise NULL pointer is returned
 **/

TcpOption *tcpGetOption(TcpHeader *segment, uint8_t kind)
{
   size_t length;
   uint_t i;
   TcpOption *option;

   //Make sure the DHCP header is valid
   if(segment->dataOffset < 5)
      return NULL;

   //Compute the length of the options field
   length = segment->dataOffset * 4 - sizeof(TcpHeader);

   //Point to the very first option
   i = 0;

   //Parse TCP options
   while(i < length)
   {
      //Point to the current option
      option = (TcpOption *) (segment->options + i);

      //NOP option detected?
      if(option->kind == TCP_OPTION_NOP)
      {
         i++;
         continue;
      }
      //END option detected?
      if(option->kind == TCP_OPTION_END)
         break;
      //Check option length
      if((i + 1) >= length || (i + option->length) > length)
         break;

      //Current option kind match the specified one?
      if(option->kind == kind)
         return option;

      //Jump to next the next option
      i += option->length;
   }

   //Specified option code not found
   return NULL;
}


/**
 * @brief Test the sequence number of an incoming segment
 * @param[in] socket Handle referencing the current socket
 * @param[in] segment Pointer to the TCP segment to check
 * @param[in] length Length of the segment data
 * @return NO_ERROR if the incoming segment is acceptable, ERROR_FAILURE otherwise
 **/

error_t tcpCheckSequenceNumber(Socket *socket, TcpHeader *segment, size_t length)
{
   //Acceptability test for an incoming segment
   bool_t acceptable = FALSE;

   //Case where both segment length and receive window are zero
   if(!length && !socket->rcvWnd)
   {
      //Make sure that SEG.SEQ = RCV.NXT
      if(segment->seqNum == socket->rcvNxt)
         acceptable = TRUE;
   }
   //Case where segment length is zero and receive window is non zero
   else if(!length && socket->rcvWnd)
   {
      //Make sure that RCV.NXT <= SEG.SEQ < RCV.NXT+RCV.WND
      if(TCP_CMP_SEQ(segment->seqNum, socket->rcvNxt) >= 0 &&
         TCP_CMP_SEQ(segment->seqNum, socket->rcvNxt + socket->rcvWnd) < 0)
         acceptable = TRUE;
   }
   //Case where both segment length and receive window are non zero
   else if(length && socket->rcvWnd)
   {
      //Check whether RCV.NXT <= SEG.SEQ < RCV.NXT+RCV.WND
      if(TCP_CMP_SEQ(segment->seqNum, socket->rcvNxt) >= 0 &&
         TCP_CMP_SEQ(segment->seqNum, socket->rcvNxt + socket->rcvWnd) < 0)
         acceptable = TRUE;
      //or RCV.NXT <= SEG.SEQ+SEG.LEN-1 < RCV.NXT+RCV.WND
      else if(TCP_CMP_SEQ(segment->seqNum + length - 1, socket->rcvNxt) >= 0 &&
         TCP_CMP_SEQ(segment->seqNum + length - 1, socket->rcvNxt + socket->rcvWnd) < 0)
         acceptable = TRUE;
   }

   //Non acceptable sequence number?
   if(!acceptable)
   {
      //Debug message
      TRACE_WARNING("Sequence number is not acceptable!\r\n");
      //If an incoming segment is not acceptable, an acknowledgment
      //should be sent in reply (unless the RST bit is set)
      if(!(segment->flags & TCP_FLAG_RST))
         tcpSendSegment(socket, TCP_FLAG_ACK, socket->sndNxt, socket->rcvNxt, 0, FALSE);
      //Return status code
      return ERROR_FAILURE;
   }

   //Sequence number is acceptable
   return NO_ERROR;
}


/**
 * @brief Check the SYN bit of an incoming segment
 * @param[in] socket Handle referencing the current socket
 * @param[in] segment Pointer to the TCP segment to check
 * @param[in] length Length of the segment data
 * @return ERROR_FAILURE if the SYN is in the window, NO_ERROR otherwise
 **/

error_t tcpCheckSyn(Socket *socket, TcpHeader *segment, size_t length)
{
   //Check the SYN bit
   if(segment->flags & TCP_FLAG_SYN)
   {
      //If this step is reached, the SYN is in the window.
      //It is an error and a reset shall be sent in response
      if(segment->flags & TCP_FLAG_ACK)
         tcpSendSegment(socket, TCP_FLAG_RST, segment->ackNum, 0, 0, FALSE);
      else
         tcpSendSegment(socket, TCP_FLAG_RST | TCP_FLAG_ACK, 0, segment->seqNum + length + 1, 0, FALSE);

      //Return immediately
      return ERROR_FAILURE;
   }

   //No error to report
   return NO_ERROR;
}


/**
 * @brief Test the ACK field of an incoming segment
 * @param[in] socket Handle referencing the current socket
 * @param[in] segment Pointer to the TCP segment to check
 * @param[in] length Length of the segment data
 * @return NO_ERROR if the acknowledgment is acceptable, ERROR_FAILURE otherwise
 **/

error_t tcpCheckAck(Socket *socket, TcpHeader *segment, size_t length)
{
   //If the ACK bit is off drop the segment and return
   if(!(segment->flags & TCP_FLAG_ACK))
      return ERROR_FAILURE;

   //Old duplicate ACK received (SEG.ACK < SND.UNA)
   if(TCP_CMP_SEQ(segment->ackNum, socket->sndUna) < 0)
   {
      //Reset duplicate ACK counter
      socket->dupAckCount = 0;
   }
   //The ACK segment acknowledges something not yet sent (SEG.ACK > SND.NXT)
   else if(TCP_CMP_SEQ(segment->ackNum, socket->sndNxt) > 0)
   {
      //Send an ACK segment indicating the current send sequence number
      //and the acknowledgment number expected to be received
      tcpSendSegment(socket, TCP_FLAG_ACK, socket->sndNxt, socket->rcvNxt, 0, FALSE);

      //Drop the segment and return
      return ERROR_FAILURE;
   }
   //If SND.UNA <= SEG.ACK <= SND.NXT, the send window should
   //be updated (see RFC 1122 4.2.2.20)
   else
   {
      //Check whether the SYN bit or the FIN bit is set
      if(segment->flags & (TCP_FLAG_SYN | TCP_FLAG_FIN))
         length++;

      //An acknowledgment is considered a duplicate when the receiver of the
      //ACK has outstanding data, the incoming acknowledgment carries no data,
      //the SYN and FIN bits are both off, the acknowledgment number is equal
      //to the greatest acknowledgment received on the given connection and the
      //advertised window in the incoming acknowledgment equals the advertised
      //window in the last incoming acknowledgment (refer to RFC 5681 section 2)
      if(socket->retransmitQueue && !length && segment->ackNum == socket->sndUna)
         socket->dupAckCount++;
      else
         socket->dupAckCount = 0;

      //Case where neither the sequence nor the acknowledgment number is increased
      if(segment->seqNum == socket->sndWl1 && segment->ackNum == socket->sndWl2)
      {
         //TCP may ignore a window update with a smaller window than
         //previously offered if neither the sequence number nor the
         //acknowledgment number is increased (see RFC 1122 4.2.2.16)
         if(segment->window > socket->sndWnd)
         {
            //Update the send window and record the sequence number and
            //the acknowledgment number used to update SND.WND
            socket->sndWnd = segment->window;
            socket->sndWl1 = segment->seqNum;
            socket->sndWl2 = segment->ackNum;
            //Maximum send window it has seen so far on the connection
            socket->maxSndWnd = max(socket->maxSndWnd, segment->window);

            //Reset duplicate ACK counter since the advertised window
            //has changed (refer to RFC 5681 section 2)
            socket->dupAckCount = 0;
         }
      }
      //Case where the sequence or the acknowledgment number is increased
      else if(TCP_CMP_SEQ(segment->seqNum, socket->sndWl1) >= 0 &&
         TCP_CMP_SEQ(segment->ackNum, socket->sndWl2) >= 0)
      {
         //The remote host advertises a zero window?
         if(!segment->window && socket->sndWnd)
         {
            //Start the persist timer
            socket->wndProbeCount = 0;
            socket->wndProbeInterval = TCP_DEFAULT_PROBE_INTERVAL;
            osTimerStart(&socket->persistTimer, socket->wndProbeInterval);
         }

         //Update the send window and record the sequence number and
         //the acknowledgment number used to update SND.WND
         socket->sndWnd = segment->window;
         socket->sndWl1 = segment->seqNum;
         socket->sndWl2 = segment->ackNum;
         //Maximum send window it has seen so far on the connection
         socket->maxSndWnd = max(socket->maxSndWnd, segment->window);

         //Reset duplicate ACK counter since the advertised window
         //has changed (refer to RFC 5681 section 2)
         socket->dupAckCount = 0;
      }

      //The incoming ACK segment acknowledges new data?
      if(TCP_CMP_SEQ(segment->ackNum, socket->sndUna) > 0)
      {
         //Compute the number of bytes acknowledged by the incoming ACK
         uint_t n = segment->ackNum - socket->sndUna;
         //Total number of bytes acknowledged during the whole round-trip
         socket->n += n;

         //Slow start algorithm is used when cwnd is lower than ssthresh
         if(socket->cwnd < socket->ssthresh)
         {
            //During slow start, TCP increments cwnd by at most SMSS bytes
            //for each ACK received that cumulatively acknowledges new data
            socket->cwnd += min(n, socket->mss);
         }
         //Congestion avoidance algorithm is used when cwnd exceeds ssthres
         else
         {
            //Congestion window is updated once per RTT
            if(socket->rttBusy && TCP_CMP_SEQ(segment->ackNum, socket->rttSeqNum) > 0)
            {
               //TCP must not increment cwnd by more than SMSS bytes
               socket->cwnd += min(socket->n, socket->mss);
            }
         }

         //Limit the size of the congestion window
         socket->cwnd = min(socket->cwnd, socket->txBufferSize);
         //Update SND.UNA pointer
         socket->sndUna = segment->ackNum;

         //Compute retransmission timeout
         tcpComputeRto(socket);

         //Any segments on the retransmission queue which are thereby
         //entirely acknowledged are removed
         tcpUpdateRetransmitQueue(socket);
      }
      //The incoming ACK segment does not acknowledge new data?
      else
      {
         //Debug message
         if(socket->dupAckCount > 0)
         {
            TRACE_INFO("TCP duplicate ACK #%u\r\n", socket->dupAckCount);
         }

         //Check the number of duplicate ACKs that have been received
         if(socket->dupAckCount == TCP_FAST_RETRANSMIT_THRES)
         {
            //Amount of data that has been sent but not yet acknowledged
            uint_t flightSize = socket->sndNxt - socket->sndUna;
            //After receiving 3 duplicate ACKs, ssthresh must be adjusted
            socket->ssthresh = max(flightSize / 2, 2 * socket->mss);

            //Debug message
            TRACE_INFO("%s: TCP fast retransmit...\r\n",
               formatSystemTime(osGetTickCount(), NULL));

            //TCP performs a retransmission of what appears to be the missing
            //segment, without waiting for the retransmission timer to expire
            tcpRetransmitSegment(socket);

            //cwnd must set to ssthresh plus 3*SMSS. This artificially inflates
            //the congestion window by the number of segments (three) that have
            //left the network and which the receiver has buffered
            socket->cwnd = socket->ssthresh + TCP_FAST_RETRANSMIT_THRES * socket->mss;
         }
         else if(socket->dupAckCount > TCP_FAST_RETRANSMIT_THRES)
         {
            //For each additional duplicate ACK received (after the third),
            //cwnd must be incremented by SMSS. This artificially inflates
            //the congestion window in order to reflect the additional
            //segment that has left the network
            socket->cwnd += socket->mss;
         }

         //Limit the size of the congestion window
         socket->cwnd = min(socket->cwnd, socket->txBufferSize);
      }

      //Update TX events
      tcpUpdateEvents(socket);
   }

   //No error to report
   return NO_ERROR;
}


/**
 * @brief Process the segment text
 * @param[in] socket Handle referencing the current socket
 * @param[in] segment Pointer to the TCP header
 * @param[in] buffer Multi-part buffer containing the incoming TCP segment
 * @param[in] offset Offset to the first data byte
 * @param[in] length Length of the segment data
 **/

void tcpProcessSegmentData(Socket *socket, TcpHeader *segment,
   const ChunkedBuffer *buffer, size_t offset, size_t length)
{
   //First sequence number occupied by the incoming segment
   uint32_t leftEdge = segment->seqNum;
   //Sequence number immediately following the incoming segment
   uint32_t rightEdge = segment->seqNum + length;

   //Check whether some data falls outside the receive window
   if(TCP_CMP_SEQ(leftEdge, socket->rcvNxt) < 0)
   {
      //Position of the first byte to be read
      offset += socket->rcvNxt - leftEdge;
      //Ignore the data that falls outside the receive window
      leftEdge = socket->rcvNxt;
   }
   if(TCP_CMP_SEQ(rightEdge, socket->rcvNxt + socket->rcvWnd) > 0)
   {
      //Ignore the data that falls outside the receive window
      rightEdge = socket->rcvNxt + socket->rcvWnd;
   }

   //Copy the incoming data to the receive buffer
   tcpWriteRxBuffer(socket, leftEdge, buffer, offset, rightEdge - leftEdge);

   //Update the list of non-contiguous blocks of data that
   //have been received and queued
   tcpUpdateSackBlocks(socket, &leftEdge, &rightEdge);

   //Check whether the segment was received out of order
   if(TCP_CMP_SEQ(leftEdge, socket->rcvNxt) > 0)
   {
      //Out of order data segments should be acknowledged
      //immediately, in order to accelerate loss recovery
      tcpSendSegment(socket, TCP_FLAG_ACK, socket->sndNxt, socket->rcvNxt, 0, FALSE);
   }
   else
   {
      //Number of contiguous bytes that have been received
      length = rightEdge - leftEdge;

      //Next sequence number expected on incoming segments
      socket->rcvNxt += length;
      //Number of data available in the receive buffer
      socket->rcvUser += length;
      //Update the receive window
      socket->rcvWnd -= length;

      //Acknowledge the received data (delayed ACK not supported)
      tcpSendSegment(socket, TCP_FLAG_ACK, socket->sndNxt, socket->rcvNxt, 0, FALSE);
      //Notify user task that data is available
      tcpUpdateEvents(socket);
   }
}


/**
 * @brief Delete TCB structure
 * @param[in] socket Handle referencing the socket
 **/

void tcpDeleteControlBlock(Socket *socket)
{
   //Delete retransmission queue
   tcpFlushRetransmitQueue(socket);

   //Delete SYN queue
   tcpFlushSynQueue(socket);

   //Release transmit buffer
   chunkedBufferSetLength((ChunkedBuffer *) &socket->txBuffer, 0);

   //Release receive buffer
   chunkedBufferSetLength((ChunkedBuffer *) &socket->rxBuffer, 0);
}


/**
 * @brief Remove acknowledged segments from retransmission queue
 * @param[in] socket Handle referencing the socket
 **/

void tcpUpdateRetransmitQueue(Socket *socket)
{
   size_t length;
   TcpQueueItem *prevQueueItem;
   TcpQueueItem *queueItem;
   TcpHeader *header;

   //Point to the first item of the retransmission queue
   prevQueueItem = NULL;
   queueItem = socket->retransmitQueue;

   //Loop through retransmission queue
   while(queueItem != NULL)
   {
      //Point to the TCP header
      header = (TcpHeader *) queueItem->header;

      //SYN segment?
      if(header->flags & TCP_FLAG_SYN)
         length = 1;
      //FIN segment?
      else if(header->flags & TCP_FLAG_FIN)
         length = queueItem->length + 1;
      //Segment containing data?
      else
         length = queueItem->length;

      //If an acknowledgment is received for a segment before its timer
      //expires, the segment is removed from the retransmission queue
      if(TCP_CMP_SEQ(socket->sndUna, ntohl(header->seqNum) + length) >= 0)
      {
         //First item of the queue?
         if(prevQueueItem == NULL)
         {
            //Remove the current item from the queue
            socket->retransmitQueue = queueItem->next;
            //The item can now be safely deleted
            memPoolFree(queueItem);
            //Point to the next item
            queueItem = socket->retransmitQueue;
         }
         else
         {
            //Remove the current item from the queue
            prevQueueItem->next = queueItem->next;
            //The item can now be safely deleted
            memPoolFree(queueItem);
            //Point to the next item
            queueItem = prevQueueItem->next;
         }

         //When an ACK is received that acknowledges new data, restart the
         //retransmission timer so that it will expire after RTO seconds
         osTimerStart(&socket->retransmitTimer, socket->rto);
         //Reset retransmission counter
         socket->retransmitCount = 0;
      }
      //No acknowledgment received for the current segment...
      else
      {
         //Point to the next item
         prevQueueItem = queueItem;
         queueItem = queueItem->next;
      }
   }

   //When all outstanding data has been acknowledged,
   //turn off the retransmission timer
   if(socket->retransmitQueue == NULL)
      osTimerStop(&socket->retransmitTimer);
}


/**
 * @brief Flush retransmission queue
 * @param[in] socket Handle referencing the socket
 **/

void tcpFlushRetransmitQueue(Socket *socket)
{
   //Point to the first item in the retransmission queue
   TcpQueueItem *queueItem = socket->retransmitQueue;

   //Loop through retransmission queue
   while(queueItem != NULL)
   {
      //Keep track of the next item in the queue
      TcpQueueItem *nextQueueItem = queueItem->next;
      //Free previously allocated memory
      memPoolFree(queueItem);
      //Point to the next item
      queueItem = nextQueueItem;
   }

   //The retransmission queue is now flushed
   socket->retransmitQueue = NULL;

   //Turn off the retransmission timer
   osTimerStop(&socket->retransmitTimer);
}


/**
 * @brief Flush SYN queue
 * @param[in] socket Handle referencing the socket
 **/

void tcpFlushSynQueue(Socket *socket)
{
   //Point to the first item in the SYN queue
   TcpSynQueueItem *queueItem = socket->synQueue;

   //Loop through SYN queue
   while(queueItem != NULL)
   {
      //Keep track of the next item in the queue
      TcpSynQueueItem *nextQueueItem = queueItem->next;
      //Free previously allocated memory
      memPoolFree(queueItem);
      //Point to the next item
      queueItem = nextQueueItem;
   }

   //SYN queue was successfully flushed
   socket->synQueue = NULL;
}


/**
 * @brief Update the list of non-contiguous blocks that have been received
 * @param[in] socket Handle referencing the socket
 * @param[in,out] leftEdge First sequence number occupied by the incoming data
 * @param[in,out] rightEdge Sequence number immediately following the incoming data
 **/

void tcpUpdateSackBlocks(Socket *socket, uint32_t *leftEdge, uint32_t *rightEdge)
{
   uint_t i = 0;

   //Loop through the blocks
   while(i < socket->sackBlockCount)
   {
      //Find each block that overlaps the specified one
      if(TCP_CMP_SEQ(*rightEdge, socket->sackBlock[i].leftEdge) >= 0 &&
         TCP_CMP_SEQ(*leftEdge, socket->sackBlock[i].rightEdge) <= 0)
      {
         //Merge blocks to form a contiguous one
         *leftEdge = min(*leftEdge, socket->sackBlock[i].leftEdge);
         *rightEdge = max(*rightEdge, socket->sackBlock[i].rightEdge);
         //Delete current block
         memcpy(socket->sackBlock + i, socket->sackBlock + i + 1,
            (TCP_MAX_SACK_BLOCKS - i - 1) * sizeof(TcpSackBlock));
         //Decrement the number of non-contiguous blocks
         socket->sackBlockCount--;
         continue;
      }
      //Point to the next block
      i++;
   }

   //Check whether the incoming segment was received out of order
   if(TCP_CMP_SEQ(*leftEdge, socket->rcvNxt) > 0)
   {
      //Make room for the new non-contiguous block
      memcpy(socket->sackBlock + 1, socket->sackBlock,
         (TCP_MAX_SACK_BLOCKS - 1) * sizeof(TcpSackBlock));
      //Insert the element in the list
      socket->sackBlock[0].leftEdge = *leftEdge;
      socket->sackBlock[0].rightEdge = *rightEdge;
      //Increment the number of non-contiguous blocks
      if(socket->sackBlockCount < TCP_MAX_SACK_BLOCKS)
         socket->sackBlockCount++;
   }
}


/**
 * @brief Update receive window so as to avoid Silly Window Syndrome
 * @param[in] socket Handle referencing the socket
 **/

void tcpUpdateReceiveWindow(Socket *socket)
{
   //Space available but not yet advertised
   uint16_t reduction = socket->rxBufferSize - socket->rcvUser - socket->rcvWnd;

   //To avoid SWS, the receiver should not advertise small windows
   if((socket->rcvWnd + reduction) >= min(socket->mss, socket->rxBufferSize / 2))
   {
      //Check whether a window update should be sent
      if(socket->rcvWnd < min(socket->mss, socket->rxBufferSize / 2))
      {
         //Debug message
         TRACE_INFO("%s: TCP sending window update...\r\n",
            formatSystemTime(osGetTickCount(), NULL));

         //Update the receive window
         socket->rcvWnd += reduction;
         //Send an ACK segment to advertise the new window size
         tcpSendSegment(socket, TCP_FLAG_ACK, socket->sndNxt, socket->rcvNxt, 0, FALSE);
      }
      else
      {
         //The receive window can be updated
         socket->rcvWnd += reduction;
      }
   }
}


/**
 * @brief Compute retransmission timeout
 * @param[in] socket Handle referencing the socket
 **/

void tcpComputeRto(Socket *socket)
{
   //Ensure the incoming ACK number covers the expected sequence number
   if(socket->rttBusy && TCP_CMP_SEQ(socket->sndUna, socket->rttSeqNum) > 0)
   {
      //Calculate round-time trip
      systime_t r = osGetTickCount() - socket->rttStartTime;

      //First RTT measurement?
      if(!socket->srtt && !socket->rttvar)
      {
         //Initialize RTO calculation algorithm
         socket->srtt = r;
         socket->rttvar = r / 2;
      }
      else
      {
         //Calculate the difference between the measured value and the current RTT estimator
         systime_t delta = (r > socket->srtt) ? (r - socket->srtt) : (socket->srtt - r);
         //Implement Van Jacobson's algorithm (as specified in RFC 6298 2.3)
         socket->rttvar = (3 * socket->rttvar + delta) / 4;
         socket->srtt = (7 * socket->srtt + r) / 8;
      }

      //Calculate the next retransmission timeout
      socket->rto = socket->srtt + 4 * socket->rttvar;
      //Whenever RTO is computed, if it is less than 1 second, then
      //the RTO should be rounded up to 1 second
      socket->rto = max(socket->rto, TCP_MIN_RTO);
      //A maximum value may be placed on RTO provided it is at least 60 seconds
      socket->rto = min(socket->rto, TCP_MAX_RTO);

      //Debug message
      TRACE_DEBUG("R=%" PRIu32 ", SRTT=%" PRIu32 ", RTTVAR=%" PRIu32 ", RTO=%" PRIu32 "\r\n",
         r, socket->srtt, socket->rttvar, socket->rto);

      //RTT measurement is complete
      socket->rttBusy = FALSE;
   }
}


/**
 * @brief TCP segment retransmission
 * @param[in] socket Handle referencing the socket
 * @return Error code
 **/

error_t tcpRetransmitSegment(Socket *socket)
{
   error_t error;
   size_t offset;
   ChunkedBuffer *buffer;
   TcpQueueItem *queueItem;
   TcpHeader *header;

   //Make sure the retransmission queue is not empty
   if(!socket->retransmitQueue)
      return NO_ERROR;

   //Point to the segment to be retransmitted
   queueItem = socket->retransmitQueue;
   //Point to the TCP header
   header = (TcpHeader *) queueItem->header;

   //Allocate a memory buffer to hold the TCP segment
   buffer = ipAllocBuffer(0, &offset);
   //Failed to allocate memory?
   if(!buffer) return ERROR_OUT_OF_MEMORY;

   //Start of exception handling block
   do
   {
      //Copy TCP header
      error = chunkedBufferAppend(buffer, header, header->dataOffset * 4);
      //Any error to report?
      if(error) break;

      //Copy data from send buffer
      error = tcpReadTxBuffer(socket, ntohl(header->seqNum), buffer, queueItem->length);
      //Any error to report?
      if(error) break;

      //Dump TCP header contents for debugging purpose
      tcpDumpHeader(header, queueItem->length, socket->iss, socket->irs);

      //Retransmit the lost segment without waiting for the retransmission timer to expire
      error = ipSendDatagram(socket->interface, &queueItem->pseudoHeader,
         buffer, offset, queueItem->timeToLive);

      //End of exception handling block
   } while(0);

   //Free previously allocated memory
   chunkedBufferFree(buffer);
   //Return status code
   return error;
}


/**
 * @brief Nagle algorithm implementation
 * @param[in] socket Handle referencing the socket
 * @return Error code
 **/

error_t tcpNagleAlgo(Socket *socket)
{
   error_t error;
   uint_t n;
   uint_t u;

   //The amount of data that can be sent at any given time is
   //limited by the receiver window and the congestion window
   n = min(socket->sndWnd, socket->cwnd);
   n = min(n, socket->txBufferSize);

   //Retrieve the size of the usable window
   u = n - (socket->sndNxt - socket->sndUna);

   //The remote host should not shrink its window. However, we
   //must be robust against window shrinking, which may cause
   //the usable window to become negative
   if((int_t) u < 0) return NO_ERROR;

   //The Nagle algorithm discourages sending tiny segments when
   //the data to be sent increases in small increments
   while(socket->sndUser > 0)
   {
      //Calculate the number of bytes to send at a time
      n = min(u, socket->sndUser);
      n = min(n, socket->mss);

      //Transmit data if a maximum-sized segment can be sent
      if(min(socket->sndUser, u) >= socket->mss)
      {
         //Send TCP segment
         error = tcpSendSegment(socket, TCP_FLAG_PSH | TCP_FLAG_ACK,
            socket->sndNxt, socket->rcvNxt, n, TRUE);
         //Failed to send TCP segment?
         if(error) return error;
      }
      //Or if all queued data can be sent now
      else if(socket->sndNxt == socket->sndUna && socket->sndUser <= u)
      {
         //Send TCP segment
         error = tcpSendSegment(socket, TCP_FLAG_PSH | TCP_FLAG_ACK,
            socket->sndNxt, socket->rcvNxt, n, TRUE);
         //Failed to send TCP segment?
         if(error) return error;
      }
      //Or if at least a fraction of the maximum window can be sent
      else if(min(socket->sndUser, u) >= (socket->maxSndWnd / 2))
      {
         //Send TCP segment
         error = tcpSendSegment(socket, TCP_FLAG_PSH | TCP_FLAG_ACK,
            socket->sndNxt, socket->rcvNxt, n, TRUE);
         //Failed to send TCP segment?
         if(error) return error;
      }
      else
      {
         //Prevent the sender from sending tiny segments...
         break;
      }

      //Advance SND.NXT pointer
      socket->sndNxt += n;
      //Update the number of data buffered but not yet sent
      socket->sndUser -= n;
      //Update the size of the usable window
      u -= n;
   }

   //Check whether the transmitter can accept more data
   tcpUpdateEvents(socket);

   //No error to report
   return NO_ERROR;
}


/**
 * @brief Update TCP FSM current state
 * @param[in] socket Handle referencing the socket
 * @param[in] newState New TCP state to switch to
 **/

void tcpChangeState(Socket *socket, TcpState newState)
{
   //Enter CLOSED state?
   if(newState == TCP_STATE_CLOSED)
   {
      //Check previous state
      if(socket->state == TCP_STATE_LAST_ACK ||
         socket->state == TCP_STATE_TIME_WAIT)
      {
         //The connection has been closed properly
         socket->closedFlag = TRUE;
      }
      else
      {
         //The connection has been reset by the peer
         socket->resetFlag = TRUE;
      }
   }

   //Enter the desired state
   socket->state = newState;
   //Update TCP related events
   tcpUpdateEvents(socket);
}


/**
 * @brief Update TCP related events
 * @param[in] socket Handle referencing the socket
 **/

void tcpUpdateEvents(Socket *socket)
{
   //Clear event flags
   socket->eventFlags = 0;

   //Check current TCP state
   switch(socket->state)
   {
   //ESTABLISHED or FIN-WAIT-1 state?
   case TCP_STATE_ESTABLISHED:
   case TCP_STATE_FIN_WAIT_1:
      socket->eventFlags |= SOCKET_EVENT_CONNECTED;
      break;
   //FIN-WAIT-2 state?
   case TCP_STATE_FIN_WAIT_2:
      socket->eventFlags |= SOCKET_EVENT_CONNECTED;
      socket->eventFlags |= SOCKET_EVENT_TX_SHUTDOWN;
      break;
   //CLOSE-WAIT, LAST-ACK or CLOSING state?
   case TCP_STATE_CLOSE_WAIT:
   case TCP_STATE_LAST_ACK:
   case TCP_STATE_CLOSING:
      socket->eventFlags |= SOCKET_EVENT_CONNECTED;
      socket->eventFlags |= SOCKET_EVENT_RX_SHUTDOWN;
      break;
   //TIME-WAIT or CLOSED state?
   case TCP_STATE_TIME_WAIT:
   case TCP_STATE_CLOSED:
      socket->eventFlags |= SOCKET_EVENT_CLOSED;
      socket->eventFlags |= SOCKET_EVENT_TX_SHUTDOWN;
      socket->eventFlags |= SOCKET_EVENT_RX_SHUTDOWN;
      break;
   //Any other state
   default:
      break;
   }

   //Handle TX specific events
   if(socket->state == TCP_STATE_SYN_SENT ||
      socket->state == TCP_STATE_SYN_RECEIVED)
   {
      //Disallow write operations until the connection is established
      socket->eventFlags |= SOCKET_EVENT_TX_COMPLETE;
   }
   else if(socket->state == TCP_STATE_ESTABLISHED ||
      socket->state == TCP_STATE_CLOSE_WAIT)
   {
      //Check whether the send buffer is full or not
      if((socket->sndUser + socket->sndNxt - socket->sndUna) < socket->txBufferSize)
         socket->eventFlags |= SOCKET_EVENT_TX_READY;

      //Notify user task that all the data in the send buffer
      //has been successfully transmitted and acknowledged
      if(!socket->sndUser && TCP_CMP_SEQ(socket->sndUna, socket->sndNxt) >= 0)
         socket->eventFlags |= SOCKET_EVENT_TX_COMPLETE;
   }
   else if(socket->state != TCP_STATE_LISTEN)
   {
      //Unblock user task if the connection is being closed
      socket->eventFlags |= SOCKET_EVENT_TX_READY;
      socket->eventFlags |= SOCKET_EVENT_TX_COMPLETE;
   }

   //Handle RX specific events
   if(socket->state == TCP_STATE_ESTABLISHED ||
      socket->state == TCP_STATE_FIN_WAIT_1 ||
      socket->state == TCP_STATE_FIN_WAIT_2)
   {
      //Data is available for reading?
      if(socket->rcvUser > 0)
         socket->eventFlags |= SOCKET_EVENT_RX_READY;
   }
   else if(socket->state == TCP_STATE_LISTEN)
   {
      //If the socket is currently in the listen state, it will be marked
      //as readable if an incoming connection request has been received
      if(socket->synQueue)
         socket->eventFlags |= SOCKET_EVENT_RX_READY;
   }
   else if(socket->state != TCP_STATE_SYN_SENT &&
      socket->state != TCP_STATE_SYN_RECEIVED)
   {
      //Readability can also indicate that a request to close
      //the socket has been received from the peer
      socket->eventFlags |= SOCKET_EVENT_RX_READY;
   }

   //Handle link up and link down events
   if(socket->interface->linkState)
      socket->eventFlags |= SOCKET_EVENT_LINK_UP;
   else
      socket->eventFlags |= SOCKET_EVENT_LINK_DOWN;

   //Mask unused events
   socket->eventFlags &= socket->eventMask;

   //Any event to signal?
   if(socket->eventFlags)
   {
      //Unblock I/O operations currently in waiting state
      osEventSet(socket->event);

      //Set user event to signaled state if necessary
      if(socket->userEvent != NULL)
         osEventSet(socket->userEvent);
   }
}


/**
 * @brief Wait for a particular TCP event
 * @param[in] socket Handle referencing the socket
 * @param[in] eventMask Logic OR of all the TCP events that will complete the wait
 * @param[in] timeout Maximum time to wait
 * @return Logic OR of all the TCP events that satisfied the wait
 **/

uint_t tcpWaitForEvents(Socket *socket, uint_t eventMask, systime_t timeout)
{
   //Only one of the events listed here may complete the wait
   socket->eventMask = eventMask;
   //Update TCP related events
   tcpUpdateEvents(socket);

   //No event is signaled?
   if(!socket->eventFlags)
   {
      //Reset the event object
      osEventReset(socket->event);
      //Leave critical section
      osMutexRelease(socketMutex);
      //Wait until an event is triggered
      osEventWait(socket->event, timeout);
      //Enter critical section
      osMutexAcquire(socketMutex);
   }

   //Return the list of TCP events that satisfied the wait
   return socket->eventFlags;
}


/**
 * @brief Copy incoming data to the send buffer
 * @param[in] socket Handle referencing the socket
 * @param[in] seqNum First sequence number occupied by the incoming data
 * @param[in] data Data to write
 * @param[in] length Number of data to write
 **/

void tcpWriteTxBuffer(Socket *socket, uint32_t seqNum,
   const uint8_t *data, size_t length)
{
   //Offset of the first byte to write in the circular buffer
   size_t offset = (seqNum - socket->iss - 1) % socket->txBufferSize;

   //Check whether the specified data crosses buffer boundaries
   if((offset + length) <= socket->txBufferSize)
   {
      //Copy the payload
      chunkedBufferWrite((ChunkedBuffer *) &socket->txBuffer,
         offset, data, length);
   }
   else
   {
      //Copy the first part of the payload
      chunkedBufferWrite((ChunkedBuffer *) &socket->txBuffer,
         offset, data, socket->txBufferSize - offset);
      //Wrap around to the beginning of the circular buffer
      chunkedBufferWrite((ChunkedBuffer *) &socket->txBuffer,
         0, data + socket->txBufferSize - offset, length - socket->txBufferSize + offset);
   }
}


/**
 * @brief Copy data from the send buffer
 * @param[in] socket Handle referencing the socket
 * @param[in] seqNum Sequence number of the first data to read
 * @param[out] buffer Pointer to the output buffer
 * @param[in] length Number of data to read
 * @return Error code
 **/

error_t tcpReadTxBuffer(Socket *socket, uint32_t seqNum,
   ChunkedBuffer *buffer, size_t length)
{
   error_t error;

   //Offset of the first byte to read in the circular buffer
   size_t offset = (seqNum - socket->iss - 1) % socket->txBufferSize;

   //Check whether the specified data crosses buffer boundaries
   if((offset + length) <= socket->txBufferSize)
   {
      //Copy the payload
      error = chunkedBufferConcat(buffer, (ChunkedBuffer *) &socket->txBuffer,
         offset, length);
   }
   else
   {
      //Copy the first part of the payload
      error = chunkedBufferConcat(buffer, (ChunkedBuffer *) &socket->txBuffer,
         offset, socket->txBufferSize - offset);

      //Check status code
      if(!error)
      {
         //Wrap around to the beginning of the circular buffer
         error = chunkedBufferConcat(buffer, (ChunkedBuffer *) &socket->txBuffer,
            0, length - socket->txBufferSize + offset);
      }
   }

   //Return status code
   return error;
}


/**
 * @brief Copy incoming data to the receive buffer
 * @param[in] socket Handle referencing the socket
 * @param[in] seqNum First sequence number occupied by the incoming data
 * @param[in] data Multi-part buffer containing the incoming data
 * @param[in] dataOffset Offset to the first data byte
 * @param[in] length Number of data to write
 **/

void tcpWriteRxBuffer(Socket *socket, uint32_t seqNum,
   const ChunkedBuffer *data, size_t dataOffset, size_t length)
{
   //Offset of the first byte to write in the circular buffer
   size_t offset = (seqNum - socket->irs - 1) % socket->rxBufferSize;

   //Check whether the specified data crosses buffer boundaries
   if((offset + length) <= socket->rxBufferSize)
   {
      //Copy the payload
      chunkedBufferCopy((ChunkedBuffer *) &socket->rxBuffer,
         offset, data, dataOffset, length);
   }
   else
   {
      //Copy the first part of the payload
      chunkedBufferCopy((ChunkedBuffer *) &socket->rxBuffer,
         offset, data, dataOffset, socket->rxBufferSize - offset);
      //Wrap around to the beginning of the circular buffer
      chunkedBufferCopy((ChunkedBuffer *) &socket->rxBuffer, 0, data,
         dataOffset + socket->rxBufferSize - offset, length - socket->rxBufferSize + offset);
   }
}


/**
 * @brief Copy data from the receive buffer
 * @param[in] socket Handle referencing the socket
 * @param[in] seqNum Sequence number of the first data to read
 * @param[out] data Pointer to the output buffer
 * @param[in] length Number of data to read
 **/

void tcpReadRxBuffer(Socket *socket, uint32_t seqNum, uint8_t *data, size_t length)
{
   //Offset of the first byte to read in the circular buffer
   size_t offset = (seqNum - socket->irs - 1) % socket->rxBufferSize;

   //Check whether the specified data crosses buffer boundaries
   if((offset + length) <= socket->rxBufferSize)
   {
      //Copy the payload
      chunkedBufferRead(data, (ChunkedBuffer *) &socket->rxBuffer,
         offset, length);
   }
   else
   {
      //Copy the first part of the payload
      chunkedBufferRead(data, (ChunkedBuffer *) &socket->rxBuffer,
         offset, socket->rxBufferSize - offset);
      //Wrap around to the beginning of the circular buffer
      chunkedBufferRead(data + socket->rxBufferSize - offset, (ChunkedBuffer *) &socket->rxBuffer,
         0, length - socket->rxBufferSize + offset);
   }
}


/**
 * @brief Dump TCP header for debugging purpose
 * @param[in] segment Pointer to the TCP header
 * @param[in] length Length of the segment data
 * @param[in] iss Initial send sequence number (needed to compute relative SEQ number)
 * @param[in] irs Initial receive sequence number (needed to compute relative ACK number)
 **/

void tcpDumpHeader(const TcpHeader *segment, size_t length, uint32_t iss, uint32_t irs)
{
   //Dump TCP header contents
   TRACE_DEBUG("%" PRIu16 " > %" PRIu16 ": %c%c%c%c%c%c seq=%" PRIu32 "(%" PRIu32 ")"
      "ack=%" PRIu32 "(%" PRIu32 ") win=%" PRIu16 " len=%" PRIuSIZE "\r\n",
      ntohs(segment->srcPort), ntohs(segment->destPort),
      (segment->flags & TCP_FLAG_FIN) ? 'F' : '-',
      (segment->flags & TCP_FLAG_SYN) ? 'S' : '-',
      (segment->flags & TCP_FLAG_RST) ? 'R' : '-',
      (segment->flags & TCP_FLAG_PSH) ? 'P' : '-',
      (segment->flags & TCP_FLAG_ACK) ? 'A' : '-',
      (segment->flags & TCP_FLAG_URG) ? 'U' : '-',
      ntohl(segment->seqNum), ntohl(segment->seqNum) - iss,
      ntohl(segment->ackNum), ntohl(segment->ackNum) - irs,
      ntohs(segment->window), length);
}

#endif
