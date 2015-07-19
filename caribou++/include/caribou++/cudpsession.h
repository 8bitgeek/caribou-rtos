/******************************************************************************
* Copyright © 2005-2012 by Pike Aerospace Research Corporation
* All Rights Reserved
*
*   This file is part of CARIBOU RTOS
*
*   CARIBOU RTOS is free software: you can redistribute it and/or modify
*   it under the terms of the Beerware License Version 43.
*
* ----------------------------------------------------------------------------
* "THE BEER-WARE LICENSE" (Revision 43):
* <mike@pikeaero.com> wrote this file. As long as you retain this notice you
* can do whatever you want with this stuff. If we meet some day, and you think
* this stuff is worth it, you can buy me a beer in return ~ Mike Sharkey
* ----------------------------------------------------------------------------
******************************************************************************/
#ifndef _PIKEAERO_CUDPSESSION_H_
#define _PIKEAERO_CUDPSESSION_H_

#include <caribou++/cthread.h>
#include <caribou++/cudpsocket.h>
#include <caribou++/cmutex.h>
#include <caribou++/clist.h>

namespace CARIBOU
{

	class CUdpSession : public CARIBOU::CThread
	{
		public:
			CUdpSession( const char* name="tcp", uint16_t stksize=512, uint16_t priority=0 );
			virtual ~CUdpSession();

			virtual void							appendSocket(int socket);
			int										socketCount();

		protected:

			virtual void							run();
			CARIBOU::CUdpSocket&					nextSocket();
			CARIBOU::CUdpSocket&					takeSocket();
			void									dequeueSocket();
			void									closeSocket();
			CARIBOU::CUdpSocket&					socket();
			CARIBOU::CList<int>&					socketQueue();
			CARIBOU::CUdpSocket&					setSocket(int socket);

		private:
			CARIBOU::CList<int>						mSocketQueue;
			CARIBOU::CUdpSocket						mSocket;
			uint32_t								mTimeoutValue;
	};

}

#endif
