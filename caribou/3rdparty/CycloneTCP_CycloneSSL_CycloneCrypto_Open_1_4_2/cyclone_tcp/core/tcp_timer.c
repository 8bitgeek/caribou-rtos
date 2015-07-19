/**
 * @file tcp_timer.c
 * @brief TCP timer management
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
#include "tcp_ip_stack.h"
#include "socket.h"
#include "tcp.h"
#include "tcp_misc.h"
#include "tcp_timer.h"
#include "ipv4.h"
#include "date_time.h"
#include "debug.h"

//Check TCP/IP stack configuration
#if (TCP_SUPPORT == ENABLED)


/**
 * @brief TCP timer handler
 *
 * This routine must be periodically called by the TCP/IP stack to
 * handle retransmissions and TCP related timers (persist timer,
 * FIN-WAIT-2 timer and TIME-WAIT timer)
 *
 **/

void tcpTick(void)
{
   error_t error;
   uint_t i;
   uint_t n;
   uint_t u;

   //Enter critical section
   osMutexAcquire(socketMutex);

   //Loop through opened sockets
   for(i = 0; i < SOCKET_MAX_COUNT; i++)
   {
      //Shortcut to the current socket
      Socket *socket = socketTable + i;
      //Check socket type
      if(socket->type != SOCKET_TYPE_STREAM)
         continue;
      //Check the current state of the TCP state machine
      if(socket->state == TCP_STATE_CLOSED)
         continue;

      //Is there any packet in the retransmission queue?
      if(socket->retransmitQueue != NULL)
      {
         //Retransmission timeout?
         if(osTimerElapsed(&socket->retransmitTimer))
         {
            //When a TCP sender detects segment loss using the retransmission
            //timer and the given segment has not yet been resent by way of
            //the retransmission timer, the value of ssthresh must be updated
            if(!socket->retransmitCount)
            {
               //Amount of data that has been sent but not yet acknowledged
               uint_t flightSize = socket->sndNxt - socket->sndUna;
               //Adjust ssthresh value
               socket->ssthresh = max(flightSize / 2, 2 * socket->mss);
            }

            //Furthermore, upon a timeout cwnd must be set to no more than
            //the loss window, LW, which equals 1 full-sized segment
            socket->cwnd = min(TCP_LOSS_WINDOW * socket->mss, socket->txBufferSize);

            //Make sure the maximum number of retransmissions has not been reached
            if(socket->retransmitCount < TCP_MAX_RETRIES)
            {
               //Debug message
               TRACE_INFO("%s: TCP segment retransmission #%u (%u data bytes)...\r\n",
                  formatSystemTime(osGetTickCount(), NULL), socket->retransmitCount + 1,
                  socket->retransmitQueue->length);

               //Retransmit the earliest segment that has not been
               //acknowledged by the TCP receiver
               tcpRetransmitSegment(socket);

               //Use exponential back-off algorithm to calculate the new RTO
               socket->rto = min(socket->rto * 2, TCP_MAX_RTO);
               //Restart retransmission timer
               osTimerStart(&socket->retransmitTimer, socket->rto);
               //Increment retransmission counter
               socket->retransmitCount++;
            }
            else
            {
               //The maximum number of retransmissions has been exceeded
               tcpChangeState(socket, TCP_STATE_CLOSED);
               //Turn off the retransmission timer
               osTimerStop(&socket->retransmitTimer);
            }

            //TCP must use Karn's algorithm for taking RTT samples. That is, RTT
            //samples must not be made using segments that were retransmitted
            socket->rttBusy = FALSE;
         }
      }

      //Check the current state of the TCP state machine
      if(socket->state == TCP_STATE_CLOSED)
         continue;

      //The persist timer is used when the remote host advertises
      //a window size of zero
      if(!socket->sndWnd && socket->wndProbeInterval)
      {
         //Time to send a new probe?
         if(osTimerElapsed(&socket->persistTimer))
         {
            //Make sure the maximum number of retransmissions has not been reached
            if(socket->wndProbeCount < TCP_MAX_RETRIES)
            {
               //Debug message
               TRACE_INFO("%s: TCP zero window probe #%u...\r\n",
                  formatSystemTime(osGetTickCount(), NULL), socket->wndProbeCount + 1);

               //Zero window probes usually have the sequence number one less than expected
               tcpSendSegment(socket, TCP_FLAG_ACK, socket->sndNxt - 1, socket->rcvNxt, 0, FALSE);
               //The interval between successive probes should be increased exponentially
               socket->wndProbeInterval = min(socket->wndProbeInterval * 2, TCP_MAX_PROBE_INTERVAL);
               //Restart the persist timer
               osTimerStart(&socket->persistTimer, socket->wndProbeInterval);
               //Increment window probe counter
               socket->wndProbeCount++;
            }
            else
            {
               //Enter CLOSED state
               tcpChangeState(socket, TCP_STATE_CLOSED);
            }
         }
      }

      //To avoid a deadlock, it is necessary to have a timeout to force
      //transmission of data, overriding the SWS avoidance algorithm. In
      //practice, this timeout should seldom occur (see RFC 1122 4.2.3.4)
      if(socket->state == TCP_STATE_ESTABLISHED || socket->state == TCP_STATE_CLOSE_WAIT)
      {
         //The override timeout occurred?
         if(socket->sndUser && osTimerElapsed(&socket->overrideTimer))
         {
            //The amount of data that can be sent at any given time is
            //limited by the receiver window and the congestion window
            n = min(socket->sndWnd, socket->cwnd);
            n = min(n, socket->txBufferSize);

            //Retrieve the size of the usable window
            u = n - (socket->sndNxt - socket->sndUna);

            //Send as much data as possible
            while(socket->sndUser > 0)
            {
               //The usable window size may become zero or negative,
               //preventing packet transmission
               if((int_t) u <= 0) break;

               //Calculate the number of bytes to send at a time
               n = min(u, socket->sndUser);
               n = min(n, socket->mss);

               //Send TCP segment
               error = tcpSendSegment(socket, TCP_FLAG_PSH | TCP_FLAG_ACK,
                  socket->sndNxt, socket->rcvNxt, n, TRUE);
               //Failed to send TCP segment?
               if(error) break;

               //Advance SND.NXT pointer
               socket->sndNxt += n;
               //Adjust the number of bytes buffered but not yet sent
               socket->sndUser -= n;
            }

            //Check whether the transmitter can accept more data
            tcpUpdateEvents(socket);

            //Restart override timer if necessary
            if(socket->sndUser > 0)
               osTimerStart(&socket->overrideTimer, TCP_OVERRIDE_TIMEOUT);
         }
      }

      //The FIN-WAIT-2 timer prevents the connection
      //from staying in the FIN-WAIT-2 state forever
      if(socket->state == TCP_STATE_FIN_WAIT_2)
      {
         //Maximum FIN-WAIT-2 time has elapsed?
         if(osTimerElapsed(&socket->finWait2Timer))
         {
            //Debug message
            TRACE_WARNING("TCP FIN-WAIT-2 timer elapsed...\r\n");
            //Enter CLOSED state
            tcpChangeState(socket, TCP_STATE_CLOSED);
         }
      }

      //TIME-WAIT timer
      if(socket->state == TCP_STATE_TIME_WAIT)
      {
         //2MSL time has elapsed?
         if(osTimerElapsed(&socket->timeWaitTimer))
         {
            //Debug message
            TRACE_WARNING("TCP 2MSL timer elapsed (socket %u)...\r\n", i);
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
         }
      }
   }

   //Leave critical section
   osMutexRelease(socketMutex);
}

#endif
