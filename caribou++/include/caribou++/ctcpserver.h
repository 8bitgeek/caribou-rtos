/** ***************************************************************************
* @file ctcpserver.h
* @author Mike Sharkey <mike@pikeaero.com>.
* @copyright © 2005-2013 by Pike Aerospace Research Corporation
* @copyright © 2014-2015 by Mike Sharkey
* @details This file is part of CARIBOU RTOS
* CARIBOU RTOS is free software: you can redistribute it and/or modify
* it under the terms of the Beerware License Version 43.
* "THE BEER-WARE LICENSE" (Revision 43):
* Mike Sharkey <mike@pikeaero.com> wrote this file. 
* As long as you retain this notice you can do whatever you want with
* this stuff. If we meet some day, and you think this stuff is 
* worth it, you can buy me a beer in return ~ Mike Sharkey
******************************************************************************/
#ifndef CARIBOUCTCPSERVER_H
#define CARIBOUCTCPSERVER_H

#include <caribou++/cthread.h>
#include <caribou++/clist.h>
#include <caribou++/cmutex.h>
#include <caribou++/ctcpsocket.h>
#include <caribou++/ctcpsession.h>
#include <lwip/inet.h>

namespace CARIBOU
{

	/**
	 ** @brief The tcp server object
	 ** @author Mike Sharkey <mike@pikeaero.com>
	 **/
	class CTcpServer : public CThread
	{
		public:
			CTcpServer(uint16_t port, uint32_t interface=INADDR_ANY, int backlog=TCP_DEFAULT_LISTEN_BACKLOG, char* name="tcpsrv", uint32_t stksize=512, uint16_t priority=0 );
			virtual ~CTcpServer();

			static CList<CTcpServer*>&			servers();
            static CTcpServer*                  server(uint16_t port);
			uint32_t							interface();
			uint16_t							port();
			bool								isValid();
			void								close();
			virtual void						run();

		protected:

			virtual void						acceptError(int rc, int err, const char* msg="")	{}
			virtual void						listenError(int rc, int err, const char* msg="")	{}
			virtual void						bindError(int rc, int err, const char* msg="")	{}
			virtual void						socketError(int rc, int err, const char* msg="")	{}

			bool								incrementConnections();
			bool								decrementConnections();
			virtual bool						fork(int sockfd);
			virtual	void						idle() {yield();};

			uint32_t							mInterface;
			uint16_t							mPort;
			int									mBacklog;
			int									mServerSocket;

		private:
			static CList<CTcpServer*>			mServers;					/* list of TCP servers */

	};

} // CARIBOU

#endif
