/**
 * @file tcp_fsm.c
 * @brief TCP finite state machine
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
 * @section Description
 *
 * The TCP state machine progresses from one state to another in response to
 * events (user calls, incoming segments and timeouts). This file describes
 * the state transitions caused by incoming segments. Refer to the
 * following RFCs for complete details:
 * - RFC 793: Transmission Control Protocol
 * - RFC 1122: Requirements for Internet Hosts - Communication Layers
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
#include "ip.h"
#include "ipv4.h"
#include "ipv6.h"
#include "socket.h"
#include "tcp.h"
#include "tcp_fsm.h"
#include "tcp_misc.h"
#include "date_time.h"
#include "debug.h"

//Check TCP/IP stack configuration
#if (TCP_SUPPORT == ENABLED)


/**
 * @brief Incoming TCP segment processing
 * @param[in] interface Underlying network interface
 * @param[in] pseudoHeader TCP pseudo header
 * @param[in] buffer Multi-part buffer that holds the incoming TCP segment
 * @param[in] offset Offset to the first byte of the TCP header
 **/

void tcpProcessSegment(NetInterface *interface,
   IpPseudoHeader *pseudoHeader, const ChunkedBuffer *buffer, size_t offset)
{
   uint_t i;
   size_t length;
   Socket *socket;
   Socket *passiveSocket;
   TcpHeader *segment;

   //A TCP implementation must silently discard an incoming
   //segment that is addressed to a broadcast or multicast
   //address (see RFC 1122 4.2.3.10)
#if (IPV4_SUPPORT == ENABLED)
   if(pseudoHeader->length == sizeof(Ipv4PseudoHeader))
   {
      //Ensure the destination address is not a broadcast address
      if(ipv4IsBroadcastAddr(interface, pseudoHeader->ipv4Data.destAddr))
         return;
      //Ensure the destination address is not a multicast address
      if(ipv4IsMulticastAddr(pseudoHeader->ipv4Data.destAddr))
         return;
   }
   else
#endif
#if (IPV6_SUPPORT == ENABLED)
   if(pseudoHeader->length == sizeof(Ipv6PseudoHeader))
   {
      //Ensure the destination address is not a multicast address
      if(ipv6IsMulticastAddr(&pseudoHeader->ipv6Data.destAddr))
         return;
   }
   else
#endif
   {
      //This should never occur...
      return;
   }

   //Retrieve the length of the TCP segment
   length = chunkedBufferGetLength(buffer) - offset;

   //Point to the TCP header
   segment = chunkedBufferAt(buffer, offset);
   //Sanity check
   if(!segment) return;

   //Ensure the TCP header is valid
   if(length < sizeof(TcpHeader))
   {
      //Debug message
      TRACE_WARNING("TCP segment length is invalid!\r\n");
      //Exit immediately
      return;
   }
   //Check header length
   if(segment->dataOffset < 5 || (segment->dataOffset * 4) > length)
   {
      //Debug message
      TRACE_WARNING("TCP header length is invalid!\r\n");
      //Exit immediately
      return;
   }
   //Verify TCP checksum
   if(ipCalcUpperLayerChecksumEx(pseudoHeader->data,
      pseudoHeader->length, buffer, offset, length) != 0xFFFF)
   {
      //Debug message
      TRACE_WARNING("Wrong TCP header checksum!\r\n");
      //Exit immediately
      return;
   }

   //Enter critical section
   osMutexAcquire(socketMutex);

   //No matching socket in the LISTEN state for the moment
   passiveSocket = NULL;

   //Look through opened sockets
   for(i = 0; i < SOCKET_MAX_COUNT; i++)
   {
      //Point to the current socket
      socket = socketTable + i;

      //TCP socket found?
      if(socket->type != SOCKET_TYPE_STREAM)
         continue;
      //Check whether the socket is bound to a particular interface
      if(socket->interface && socket->interface != interface)
         continue;
      //Check destination port number
      if(socket->localPort != ntohs(segment->destPort))
         continue;

#if (IPV4_SUPPORT == ENABLED)
      //An IPv4 packet was received?
      if(pseudoHeader->length == sizeof(Ipv4PseudoHeader))
      {
         //Destination IP address filtering
         if(socket->localIpAddr.length)
         {
            //An IPv4 address is expected
            if(socket->localIpAddr.length != sizeof(Ipv4Addr))
               continue;
            //Filter out non-matching addresses
            if(socket->localIpAddr.ipv4Addr != pseudoHeader->ipv4Data.destAddr)
               continue;
         }
         //Source IP address filtering
         if(socket->remoteIpAddr.length)
         {
            //An IPv4 address is expected
            if(socket->remoteIpAddr.length != sizeof(Ipv4Addr))
               continue;
            //Filter out non-matching addresses
            if(socket->remoteIpAddr.ipv4Addr != pseudoHeader->ipv4Data.srcAddr)
               continue;
         }
      }
      else
#endif
#if (IPV6_SUPPORT == ENABLED)
      //An IPv6 packet was received?
      if(pseudoHeader->length == sizeof(Ipv6PseudoHeader))
      {
         //Destination IP address filtering
         if(socket->localIpAddr.length)
         {
            //An IPv6 address is expected
            if(socket->localIpAddr.length != sizeof(Ipv6Addr))
               continue;
            //Filter out non-matching addresses
            if(!ipv6CompAddr(&socket->localIpAddr.ipv6Addr, &pseudoHeader->ipv6Data.destAddr))
               continue;
         }
         //Source IP address filtering
         if(socket->remoteIpAddr.length)
         {
            //An IPv6 address is expected
            if(socket->remoteIpAddr.length != sizeof(Ipv6Addr))
               continue;
            //Filter out non-matching addresses
            if(!ipv6CompAddr(&socket->remoteIpAddr.ipv6Addr, &pseudoHeader->ipv6Data.srcAddr))
               continue;
         }
      }
      else
#endif
      //An invalid packet was received?
      {
         //This should never occur...
         continue;
      }

      //Keep track of the first matching socket in the LISTEN state
      if(socket->state == TCP_STATE_LISTEN && !passiveSocket)
         passiveSocket = socket;
      //Source port filtering
      if(socket->remotePort != ntohs(segment->srcPort))
         continue;

      //A matching socket has been found
      break;
   }

   //If no matching socket has been found then try to
   //use the first matching socket in the LISTEN state
   if(i >= SOCKET_MAX_COUNT) socket = passiveSocket;

   //Offset to the first data byte
   offset += segment->dataOffset * 4;
   //Calculate the length of the data
   length -= segment->dataOffset * 4;

   //Debug message
   TRACE_DEBUG("%s: TCP segment received (%" PRIuSIZE " data bytes)...\r\n",
      formatSystemTime(osGetTickCount(), NULL), length);

   //Dump TCP header contents for debugging purpose
   if(!socket)
      tcpDumpHeader(segment, length, 0, 0);
   else
      tcpDumpHeader(segment, length, socket->irs, socket->iss);

   //Convert from network byte order to host byte order
   segment->srcPort = ntohs(segment->srcPort);
   segment->destPort = ntohs(segment->destPort);
   segment->seqNum = ntohl(segment->seqNum);
   segment->ackNum = ntohl(segment->ackNum);
   segment->window = ntohs(segment->window);
   segment->urgentPointer = ntohs(segment->urgentPointer);

   //Specified port is unreachable?
   if(!socket)
   {
      //An incoming segment not containing a RST causes
      //a reset to be sent in response
      if(!(segment->flags & TCP_FLAG_RST))
         tcpSendResetSegment(interface, pseudoHeader, segment, length);
      //Leave critical section
      osMutexRelease(socketMutex);
      //Return immediately
      return;
   }

   //Check current state
   switch(socket->state)
   {
   //Process CLOSED state
   case TCP_STATE_CLOSED:
      //This is the default state that each connection starts in before
      //the process of establishing it begins
      tcpStateClosed(interface, pseudoHeader, segment, length);
      break;
   //Process LISTEN state
   case TCP_STATE_LISTEN:
      //A device (normally a server) is waiting to receive a synchronize (SYN)
      //message from a client. It has not yet sent its own SYN message
      tcpStateListen(socket, interface, pseudoHeader, segment, length);
      break;
   //Process SYN_SENT state
   case TCP_STATE_SYN_SENT:
      //The device (normally a client) has sent a synchronize (SYN) message and
      //is waiting for a matching SYN from the other device (usually a server)
      tcpStateSynSent(socket, segment, length);
      break;
   //Process SYN_RECEIVED state
   case TCP_STATE_SYN_RECEIVED:
      //The device has both received a SYN from its partner and sent its own SYN.
      //It is now waiting for an ACK to its SYN to finish connection setup
      tcpStateSynReceived(socket, segment, buffer, offset, length);
      break;
   //Process ESTABLISHED state
   case TCP_STATE_ESTABLISHED:
      //Data can be exchanged freely once both devices in the connection enter
      //this state. This will continue until the connection is closed
      tcpStateEstablished(socket, segment, buffer, offset, length);
      break;
   //Process CLOSE_WAIT state
   case TCP_STATE_CLOSE_WAIT:
      //The device has received a close request (FIN) from the other device. It
      //must now wait for the application to acknowledge this request and
      //generate a matching request
      tcpStateCloseWait(socket, segment, length);
      break;
   //Process LAST_ACK state
   case TCP_STATE_LAST_ACK:
      //A device that has already received a close request and acknowledged it,
      //has sent its own FIN and is waiting for an ACK to this request
      tcpStateLastAck(socket, segment, length);
      break;
   //Process FIN_WAIT_1 state
   case TCP_STATE_FIN_WAIT_1:
      //A device in this state is waiting for an ACK for a FIN it has sent, or
      //is waiting for a connection termination request from the other device
      tcpStateFinWait1(socket, segment, buffer, offset, length);
      break;
   //Process FIN_WAIT_2 state
   case TCP_STATE_FIN_WAIT_2:
      //A device in this state has received an ACK for its request to terminate the
      //connection and is now waiting for a matching FIN from the other device
      tcpStateFinWait2(socket, segment, buffer, offset, length);
      break;
   //Process CLOSING state
   case TCP_STATE_CLOSING:
      //The device has received a FIN from the other device and sent an ACK for
      //it, but not yet received an ACK for its own FIN message
      tcpStateClosing(socket, segment, length);
      break;
   //Process TIME_WAIT state
   case TCP_STATE_TIME_WAIT:
      //The device has now received a FIN from the other device and acknowledged
      //it, and sent its own FIN and received an ACK for it. We are done, except
      //for waiting to ensure the ACK is received and prevent potential overlap
      //with new connections
      tcpStateTimeWait(socket, segment, length);
      break;
   //Invalid state...
   default:
      //Back to the CLOSED state
      tcpChangeState(socket, TCP_STATE_CLOSED);
      //Silently discard incoming packet
      break;
   }

   //Leave critical section
   osMutexRelease(socketMutex);
}


/**
 * @brief CLOSED state
 *
 * This is the default state that each connection starts in before
 * the process of establishing it begins
 *
 * @param[in] interface Underlying network interface
 * @param[in] pseudoHeader TCP pseudo header
 * @param[in] segment Incoming TCP segment
 * @param[in] length Length of the segment data
 **/

void tcpStateClosed(NetInterface *interface,
   IpPseudoHeader *pseudoHeader, TcpHeader *segment, size_t length)
{
   //Debug message
   TRACE_DEBUG("TCP FSM: CLOSED state\r\n");

   //An incoming segment not containing a RST causes
   //a reset to be sent in response
   if(!(segment->flags & TCP_FLAG_RST))
      tcpSendResetSegment(interface, pseudoHeader, segment, length);
}


/**
 * @brief LISTEN state
 *
 * A device (normally a server) is waiting to receive a synchronize (SYN)
 * message from a client. It has not yet sent its own SYN message
 *
 * @param[in] socket Handle referencing the current socket
 * @param[in] interface Underlying network interface
 * @param[in] pseudoHeader TCP pseudo header
 * @param[in] segment Incoming TCP segment
 * @param[in] length Length of the segment data
 **/

void tcpStateListen(Socket *socket, NetInterface *interface,
   IpPseudoHeader *pseudoHeader, TcpHeader *segment, size_t length)
{
   uint_t i;
   TcpOption *option;
   TcpSynQueueItem *queueItem;

   //Debug message
   TRACE_DEBUG("TCP FSM: LISTEN state\r\n");

   //An incoming RST should be ignored
   if(segment->flags & TCP_FLAG_RST)
      return;

   //Any acknowledgment is bad if it arrives on a connection
   //still in the LISTEN state
   if(segment->flags & TCP_FLAG_ACK)
   {
      //A reset segment should be formed for any arriving ACK-bearing segment
      tcpSendResetSegment(interface, pseudoHeader, segment, length);
      //Return immediately
      return;
   }

   //Check the SYN bit
   if(segment->flags & TCP_FLAG_SYN)
   {
      //The SYN queue is empty?
      if(!socket->synQueue)
      {
         //Allocate memory to save incoming data
         queueItem = memPoolAlloc(sizeof(TcpSynQueueItem));
         //Add the newly created item to the queue
         socket->synQueue = queueItem;
      }
      else
      {
         //Point to the very first item
         queueItem = socket->synQueue;

         //Reach the last item in the receive queue
         for(i = 1; queueItem->next; i++)
            queueItem = queueItem->next;

         //Make sure the receive queue is not full
         if(i >= TCP_SYN_QUEUE_SIZE)
            return;

         //Allocate memory to save incoming data
         queueItem->next = memPoolAlloc(sizeof(TcpSynQueueItem));
         //Point to the newly created item
         queueItem = queueItem->next;
      }

      //Failed to allocate memory?
      if(!queueItem)
         return;

#if (IPV4_SUPPORT == ENABLED)
      //IPv4 is currently used?
      if(pseudoHeader->length == sizeof(Ipv4PseudoHeader))
      {
         //Save the source IPv4 address
         queueItem->srcAddr.length = sizeof(Ipv4Addr);
         queueItem->srcAddr.ipv4Addr = pseudoHeader->ipv4Data.srcAddr;
         //Save the destination IPv4 address
         queueItem->destAddr.length = sizeof(Ipv4Addr);
         queueItem->destAddr.ipv4Addr = pseudoHeader->ipv4Data.destAddr;
      }
      else
#endif
#if (IPV6_SUPPORT == ENABLED)
      //IPv6 is currently used?
      if(pseudoHeader->length == sizeof(Ipv6PseudoHeader))
      {
         //Save the source IPv6 address
         queueItem->srcAddr.length = sizeof(Ipv6Addr);
         queueItem->srcAddr.ipv6Addr = pseudoHeader->ipv6Data.srcAddr;
         //Save the destination IPv6 address
         queueItem->destAddr.length = sizeof(Ipv6Addr);
         queueItem->destAddr.ipv6Addr = pseudoHeader->ipv6Data.destAddr;
      }
      else
#endif
      //Invalid pseudo header?
      {
         //This should never occur...
         return;
      }

      //Initialize next field
      queueItem->next = NULL;
      //Underlying network interface
      queueItem->interface = interface;
      //Save the port number of the client
      queueItem->srcPort = segment->srcPort;
      //Save the initial sequence number
      queueItem->isn = segment->seqNum;
      //Default MSS value
      queueItem->mss = min(TCP_DEFAULT_MSS, TCP_MAX_MSS);

      //Get the maximum segment size
      option = tcpGetOption(segment, TCP_OPTION_MAX_SEGMENT_SIZE);
      //Specified option found?
      if(option && option->length == 4)
      {
         //Retrieve MSS value
         memcpy(&queueItem->mss, option->value, 2);
         //Convert from network byte order to host byte order
         queueItem->mss = ntohs(queueItem->mss);
         //Debug message
         TRACE_DEBUG("Remote host MSS = %" PRIu16 "\r\n", queueItem->mss);
         //Make sure that the MSS advertised by the peer is acceptable
         queueItem->mss = min(queueItem->mss, TCP_MAX_MSS);
         queueItem->mss = max(queueItem->mss, TCP_MIN_MSS);
      }

      //Notify user that a connection request is pending
      tcpUpdateEvents(socket);

      //The rest of the processing described in RFC 793 will be done
      //asynchronously when socketAccept() function is called
   }
}


/**
 * @brief SYN-SENT state
 *
 * The device (normally a client) has sent a synchronize (SYN) message and
 * is waiting for a matching SYN from the other device (usually a server)
 *
 * @param[in] socket Handle referencing the current socket
 * @param[in] segment Incoming TCP segment
 * @param[in] length Length of the segment data
 **/

void tcpStateSynSent(Socket *socket, TcpHeader *segment, size_t length)
{
   TcpOption *option;

   //Debug message
   TRACE_DEBUG("TCP FSM: SYN-SENT state\r\n");

   //Check the ACK bit
   if(segment->flags & TCP_FLAG_ACK)
   {
      //Make sure the acknowledgment number is valid
      if(segment->ackNum != socket->sndNxt)
      {
         //Send a reset segment unless the RST bit is set
         if(!(segment->flags & TCP_FLAG_RST))
            tcpSendSegment(socket, TCP_FLAG_RST, segment->ackNum, 0, 0, FALSE);
         //Drop the segment and return
         return;
      }
   }

   //Check the RST bit
   if(segment->flags & TCP_FLAG_RST)
   {
      //Make sure the ACK is acceptable
      if(segment->flags & TCP_FLAG_ACK)
      {
         //Enter CLOSED state
         tcpChangeState(socket, TCP_STATE_CLOSED);
      }
      //Drop the segment and return
      return;
   }

   //Check the SYN bit
   if(segment->flags & TCP_FLAG_SYN)
   {
      //Save initial receive sequence number
      socket->irs = segment->seqNum;
      //Initialize RCV.NXT pointer
      socket->rcvNxt = segment->seqNum + 1;

      //If there is an ACK, SND.UNA should be advanced to equal SEG.ACK
      if(segment->flags & TCP_FLAG_ACK)
         socket->sndUna = segment->ackNum;

      //Compute retransmission timeout
      tcpComputeRto(socket);

      //Any segments on the retransmission queue which are
      //thereby acknowledged should be removed
      tcpUpdateRetransmitQueue(socket);

      //Get the maximum segment size
      option = tcpGetOption(segment, TCP_OPTION_MAX_SEGMENT_SIZE);
      //Specified option found?
      if(option && option->length == 4)
      {
         //Retrieve MSS value
         memcpy(&socket->mss, option->value, 2);
         //Convert from network byte order to host byte order
         socket->mss = ntohs(socket->mss);
         //Debug message
         TRACE_DEBUG("Remote host MSS = %" PRIu16 "\r\n", socket->mss);
         //Make sure that the MSS advertised by the peer is acceptable
         socket->mss = min(socket->mss, TCP_MAX_MSS);
         socket->mss = max(socket->mss, TCP_MIN_MSS);
      }

      //Initial congestion window
      socket->cwnd = min(TCP_INITIAL_WINDOW * socket->mss, socket->txBufferSize);
      //Slow start threshold should be set arbitrarily high
      socket->ssthresh = UINT16_MAX;

      //Check whether our SYN has been acknowledged (SND.UNA > ISS)
      if(TCP_CMP_SEQ(socket->sndUna, socket->iss) > 0)
      {
         //Update the send window before entering ESTABLISHED state (see RFC 1122 4.2.2.20)
         socket->sndWnd = segment->window;
         socket->sndWl1 = segment->seqNum;
         socket->sndWl2 = segment->ackNum;
         //Maximum send window it has seen so far on the connection
         socket->maxSndWnd = segment->window;
         //Form an ACK segment and send it
         tcpSendSegment(socket, TCP_FLAG_ACK, socket->sndNxt, socket->rcvNxt, 0, FALSE);
         //Switch to the ESTABLISHED state
         tcpChangeState(socket, TCP_STATE_ESTABLISHED);
      }
      else
      {
         //Form an SYN ACK segment and send it
         tcpSendSegment(socket, TCP_FLAG_SYN | TCP_FLAG_ACK, socket->iss, socket->rcvNxt, 0, TRUE);
         //Enter SYN-RECEIVED state
         tcpChangeState(socket, TCP_STATE_SYN_RECEIVED);
      }
   }
}


/**
 * @brief SYN-RECEIVED state
 *
 * The device has both received a SYN from its partner and sent its own SYN.
 * It is now waiting for an ACK to its SYN to finish connection setup
 *
 * @param[in] socket Handle referencing the current socket
 * @param[in] segment Incoming TCP segment
 * @param[in] buffer Multi-part buffer containing the incoming TCP segment
 * @param[in] offset Offset to the first data byte
 * @param[in] length Length of the segment data
 **/

void tcpStateSynReceived(Socket *socket, TcpHeader *segment,
   const ChunkedBuffer *buffer, size_t offset, size_t length)
{
   //Debug message
   TRACE_DEBUG("TCP FSM: SYN-RECEIVED state\r\n");

   //First check sequence number
   if(tcpCheckSequenceNumber(socket, segment, length))
      return;

   //Check the RST bit
   if(segment->flags & TCP_FLAG_RST)
   {
      //Return to CLOSED state
      tcpChangeState(socket, TCP_STATE_CLOSED);
      //Return immediately
      return;
   }

   //Check the SYN bit
   if(tcpCheckSyn(socket, segment, length))
      return;

   //If the ACK bit is off drop the segment and return
   if(!(segment->flags & TCP_FLAG_ACK))
      return;

   //Make sure the acknowledgment number is valid
   if(segment->ackNum != socket->sndNxt)
   {
      //If the segment acknowledgment is not acceptable,
      //form a reset segment and send it
      tcpSendSegment(socket, TCP_FLAG_RST, segment->ackNum, 0, 0, FALSE);
      //Drop the segment and return
      return;
   }

   //Update the send window before entering ESTABLISHED state (see RFC 1122 4.2.2.20)
   socket->sndWnd = segment->window;
   socket->sndWl1 = segment->seqNum;
   socket->sndWl2 = segment->ackNum;
   //Maximum send window it has seen so far on the connection
   socket->maxSndWnd = segment->window;

   //Enter ESTABLISHED state
   tcpChangeState(socket, TCP_STATE_ESTABLISHED);
   //And continue processing...
   tcpStateEstablished(socket, segment, buffer, offset, length);
}


/**
 * @brief ESTABLISHED state
 *
 * Data can be exchanged freely once both devices in the connection enter
 * this state. This will continue until the connection is closed
 *
 * @param[in] socket Handle referencing the current socket
 * @param[in] segment Incoming TCP segment
 * @param[in] buffer Multi-part buffer containing the incoming TCP segment
 * @param[in] offset Offset to the first data byte
 * @param[in] length Length of the segment data
 **/

void tcpStateEstablished(Socket *socket, TcpHeader *segment,
   const ChunkedBuffer *buffer, size_t offset, size_t length)
{
   //Debug message
   TRACE_DEBUG("TCP FSM: ESTABLISHED state\r\n");

   //First check sequence number
   if(tcpCheckSequenceNumber(socket, segment, length))
      return;

   //Check the RST bit
   if(segment->flags & TCP_FLAG_RST)
   {
      //Switch to the CLOSED state
      tcpChangeState(socket, TCP_STATE_CLOSED);
      //Return immediately
      return;
   }

   //Check the SYN bit
   if(tcpCheckSyn(socket, segment, length))
      return;
   //Check the ACK field
   if(tcpCheckAck(socket, segment, length))
      return;
   //Process the segment text
   if(length > 0)
      tcpProcessSegmentData(socket, segment, buffer, offset, length);

   //Check the FIN bit
   if(segment->flags & TCP_FLAG_FIN)
   {
      //The FIN can only be acknowledged if all the segment data
      //has been successfully transferred to the receive buffer
      if(socket->rcvNxt == (segment->seqNum + length))
      {
         //Advance RCV.NXT over the FIN
         socket->rcvNxt++;
         //Send an acknowledgement for the FIN
         tcpSendSegment(socket, TCP_FLAG_ACK, socket->sndNxt, socket->rcvNxt, 0, FALSE);
         //Switch to the CLOSE-WAIT state
         tcpChangeState(socket, TCP_STATE_CLOSE_WAIT);
      }
   }

   //The Nagle algorithm should be implemented to coalesce
   //short segments (refer to RFC 1122 4.2.3.4)
   tcpNagleAlgo(socket);
}


/**
 * @brief CLOSE-WAIT state
 *
 * The device has received a close request (FIN) from the other device. It
 * must now wait for the application to acknowledge this request and
 * generate a matching request
 *
 * @param[in] socket Handle referencing the current socket
 * @param[in] segment Incoming TCP segment
 * @param[in] length Length of the segment data
 **/

void tcpStateCloseWait(Socket *socket, TcpHeader *segment, size_t length)
{
   //Debug message
   TRACE_DEBUG("TCP FSM: CLOSE-WAIT state\r\n");

   //First check sequence number
   if(tcpCheckSequenceNumber(socket, segment, length))
      return;

   //Check the RST bit
   if(segment->flags & TCP_FLAG_RST)
   {
      //Switch to the CLOSED state
      tcpChangeState(socket, TCP_STATE_CLOSED);
      //Return immediately
      return;
   }

   //Check the SYN bit
   if(tcpCheckSyn(socket, segment, length))
      return;
   //Check the ACK field
   if(tcpCheckAck(socket, segment, length))
      return;

   //The Nagle algorithm should be implemented to coalesce
   //short segments (refer to RFC 1122 4.2.3.4)
   tcpNagleAlgo(socket);
}


/**
 * @brief LAST-ACK state
 *
 * A device that has already received a close request and acknowledged it,
 * has sent its own FIN and is waiting for an ACK to this request
 *
 * @param[in] socket Handle referencing the current socket
 * @param[in] segment Incoming TCP segment
 * @param[in] length Length of the segment data
 **/

void tcpStateLastAck(Socket *socket, TcpHeader *segment, size_t length)
{
   //Debug message
   TRACE_DEBUG("TCP FSM: LAST-ACK state\r\n");

   //First check sequence number
   if(tcpCheckSequenceNumber(socket, segment, length))
      return;

   //Check the RST bit
   if(segment->flags & TCP_FLAG_RST)
   {
      //Enter CLOSED state
      tcpChangeState(socket, TCP_STATE_CLOSED);
      //Return immediately
      return;
   }

   //Check the SYN bit
   if(tcpCheckSyn(socket, segment, length))
      return;
   //If the ACK bit is off drop the segment and return
   if(!(segment->flags & TCP_FLAG_ACK))
      return;

   //The only thing that can arrive in this state is an
   //acknowledgment of our FIN
   if(segment->ackNum == socket->sndNxt)
   {
      //Enter CLOSED state
      tcpChangeState(socket, TCP_STATE_CLOSED);
   }
}


/**
 * @brief FIN-WAIT-1 state
 *
 * A device in this state is waiting for an ACK for a FIN it has sent, or
 * is waiting for a connection termination request from the other device
 *
 * @param[in] socket Handle referencing the current socket
 * @param[in] segment Incoming TCP segment
 * @param[in] buffer Multi-part buffer containing the incoming TCP segment
 * @param[in] offset Offset to the first data byte
 * @param[in] length Length of the segment data
 **/

void tcpStateFinWait1(Socket *socket, TcpHeader *segment,
   const ChunkedBuffer *buffer, size_t offset, size_t length)
{
   //Debug message
   TRACE_DEBUG("TCP FSM: FIN-WAIT-1 state\r\n");

   //First check sequence number
   if(tcpCheckSequenceNumber(socket, segment, length))
      return;

   //Check the RST bit
   if(segment->flags & TCP_FLAG_RST)
   {
      //Switch to the CLOSED state
      tcpChangeState(socket, TCP_STATE_CLOSED);
      //Return immediately
      return;
   }

   //Check the SYN bit
   if(tcpCheckSyn(socket, segment, length))
      return;
   //Check the ACK field
   if(tcpCheckAck(socket, segment, length))
      return;

   //Check whether our FIN is now acknowledged
   if(segment->ackNum == socket->sndNxt)
   {
      //Start the FIN-WAIT-2 timer to prevent the connection
      //from staying in the FIN-WAIT-2 state forever
      osTimerStart(&socket->finWait2Timer, TCP_FIN_WAIT_2_TIMER);
      //enter FIN-WAIT-2 and continue processing in that state
      tcpChangeState(socket, TCP_STATE_FIN_WAIT_2);
   }

   //Process the segment text
   if(length > 0)
      tcpProcessSegmentData(socket, segment, buffer, offset, length);

   //Check the FIN bit
   if(segment->flags & TCP_FLAG_FIN)
   {
      //The FIN can only be acknowledged if all the segment data
      //has been successfully transferred to the receive buffer
      if(socket->rcvNxt == (segment->seqNum + length))
      {
         //Advance RCV.NXT over the FIN
         socket->rcvNxt++;
         //Send an acknowledgement for the FIN
         tcpSendSegment(socket, TCP_FLAG_ACK, socket->sndNxt, socket->rcvNxt, 0, FALSE);
         //Check if our FIN has been acknowledged
         if(segment->ackNum == socket->sndNxt)
         {
            //Start the 2MSL timer
            osTimerStart(&socket->timeWaitTimer , TCP_2MSL_TIMER);
            //Switch to the TIME-WAIT state
            tcpChangeState(socket, TCP_STATE_TIME_WAIT);
         }
         else
         {
            //If our FIN has not been acknowledged, then enter CLOSING state
            tcpChangeState(socket, TCP_STATE_CLOSING);
         }
      }
   }
}


/**
 * @brief FIN-WAIT-2 state
 *
 * A device in this state has received an ACK for its request to terminate the
 * connection and is now waiting for a matching FIN from the other device
 *
 * @param[in] socket Handle referencing the current socket
 * @param[in] segment Incoming TCP segment
 * @param[in] buffer Multi-part buffer containing the incoming TCP segment
 * @param[in] offset Offset to the first data byte
 * @param[in] length Length of the segment data
 **/

void tcpStateFinWait2(Socket *socket, TcpHeader *segment,
   const ChunkedBuffer *buffer, size_t offset, size_t length)
{
   //Debug message
   TRACE_DEBUG("TCP FSM: FIN-WAIT-2 state\r\n");

   //First check sequence number
   if(tcpCheckSequenceNumber(socket, segment, length))
      return;

   //Check the RST bit
   if(segment->flags & TCP_FLAG_RST)
   {
      //Switch to the CLOSED state
      tcpChangeState(socket, TCP_STATE_CLOSED);
      //Return immediately
      return;
   }

   //Check the SYN bit
   if(tcpCheckSyn(socket, segment, length))
      return;
   //Check the ACK field
   if(tcpCheckAck(socket, segment, length))
      return;
   //Process the segment text
   if(length > 0)
      tcpProcessSegmentData(socket, segment, buffer, offset, length);

   //Check the FIN bit
   if(segment->flags & TCP_FLAG_FIN)
   {
      //The FIN can only be acknowledged if all the segment data
      //has been successfully transferred to the receive buffer
      if(socket->rcvNxt == (segment->seqNum + length))
      {
         //Advance RCV.NXT over the FIN
         socket->rcvNxt++;
         //Send an acknowledgement for the FIN
         tcpSendSegment(socket, TCP_FLAG_ACK, socket->sndNxt, socket->rcvNxt, 0, FALSE);
         //Start the 2MSL timer
         osTimerStart(&socket->timeWaitTimer , TCP_2MSL_TIMER);
         //Switch to the TIME_WAIT state
         tcpChangeState(socket, TCP_STATE_TIME_WAIT);
      }
   }
}


/**
 * @brief CLOSING state
 *
 * The device has received a FIN from the other device and sent an ACK for
 * it, but not yet received an ACK for its own FIN message
 *
 * @param[in] socket Handle referencing the current socket
 * @param[in] segment Incoming TCP segment
 * @param[in] length Length of the segment data
 **/

void tcpStateClosing(Socket *socket, TcpHeader *segment, size_t length)
{
   //Debug message
   TRACE_DEBUG("TCP FSM: CLOSING state\r\n");

   //First check sequence number
   if(tcpCheckSequenceNumber(socket, segment, length))
      return;

   //Check the RST bit
   if(segment->flags & TCP_FLAG_RST)
   {
      //Enter CLOSED state
      tcpChangeState(socket, TCP_STATE_CLOSED);
      //Return immediately
      return;
   }

   //Check the SYN bit
   if(tcpCheckSyn(socket, segment, length))
      return;
   //Check the ACK field
   if(tcpCheckAck(socket, segment, length))
      return;

   //If the ACK acknowledges our FIN then enter the TIME-WAIT
   //state, otherwise ignore the segment
   if(segment->ackNum == socket->sndNxt)
   {
      //Start the 2MSL timer
      osTimerStart(&socket->timeWaitTimer , TCP_2MSL_TIMER);
      //Switch to the TIME-WAIT state
      tcpChangeState(socket, TCP_STATE_TIME_WAIT);
   }
}


/**
 * @brief TIME-WAIT state
 *
 * The device has now received a FIN from the other device and acknowledged
 * it, and sent its own FIN and received an ACK for it. We are done, except
 * for waiting to ensure the ACK is received and prevent potential overlap
 * with new connections
 *
 * @param[in] socket Handle referencing the current socket
 * @param[in] segment Incoming TCP segment
 * @param[in] length Length of the segment data
 **/

void tcpStateTimeWait(Socket *socket, TcpHeader *segment, size_t length)
{
   //Debug message
   TRACE_DEBUG("TCP FSM: TIME-WAIT state\r\n");

   //First check sequence number
   if(tcpCheckSequenceNumber(socket, segment, length))
      return;

   //Check the RST bit
   if(segment->flags & TCP_FLAG_RST)
   {
      //Enter CLOSED state
      tcpChangeState(socket, TCP_STATE_CLOSED);

      //Dispose the socket if the user does not have the ownership anymore
      if(!socket->ownedFlag)
      {
         //Delete the TCB
         tcpDeleteControlBlock(socket);
         //Mark the socket as closed
         socket->type = SOCKET_TYPE_UNUSED;
      }

      //Return immediately
      return;
   }

   //Check the SYN bit
   if(tcpCheckSyn(socket, segment, length))
      return;
   //If the ACK bit is off drop the segment and return
   if(!(segment->flags & TCP_FLAG_ACK))
      return;

   //The only thing that can arrive in this state is a retransmission
   //of the remote FIN. Acknowledge it and restart the 2 MSL timeout
   if(segment->flags & TCP_FLAG_FIN)
   {
      //Send an acknowledgement for the FIN
      tcpSendSegment(socket, TCP_FLAG_ACK, socket->sndNxt, socket->rcvNxt, 0, FALSE);
      //Restart the 2MSL timer
      osTimerStart(&socket->timeWaitTimer , TCP_2MSL_TIMER);
   }
}

#endif
