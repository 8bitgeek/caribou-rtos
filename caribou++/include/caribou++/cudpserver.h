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
#ifndef CARIBOUCUDPSERVER_H
#define CARIBOUCUDPSERVER_H

#include <caribou++/cthread.h>
#include <caribou++/clist.h>
#include <caribou++/cmutex.h>
#include <caribou++/cudpsocket.h>
#include <caribou++/cudpsession.h>
#include <lwip/inet.h>

namespace CARIBOU
{

	class CUdpServer : public CThread
	{
		public:
			CUdpServer(uint16_t port, uint32_t interface=INADDR_ANY, int backlog=8, const char* name="tcpsrv", size_t stksize=512, uint16_t priority=0 );
			virtual ~CUdpServer();

			static CList<CUdpServer*>&			servers();
            static CUdpServer*                  server(uint16_t port);
			uint32_t							interface();
			uint16_t							port();
			bool								isValid();
			void								close();
			virtual void						run();

		protected:
			virtual void						bindError(int rc, int err, const char* msg=NULL)	{}
			virtual void						socketError(int rc, int err, const char* msg=NULL)	{}

			virtual void						setSocketOptions(CUdpSocket& socket);
			virtual bool						fork(CUdpSocket& socket);

		private:
			static CList<CUdpServer*>			mServers;					/* list of TCP servers */
			uint32_t							mInterface;
			uint16_t							mPort;
			int									mBacklog;
			CUdpSocket							mServerSocket;

	};

} // CARIBOU

#endif
