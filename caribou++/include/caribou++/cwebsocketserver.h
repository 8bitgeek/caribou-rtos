/** ***************************************************************************
* @file cwebsocketserver.h
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
#ifndef _CARIBOU_CWEBSOCKETSERVER_H_
#define _CARIBOU_CWEBSOCKETSERVER_H_

#include <caribou++/cthread.h>
#include <caribou++/clist.h>
#include <caribou++/cmutex.h>
#include <caribou++/ctcpserver.h>
#include <caribou++/ctcpsocket.h>
#include <caribou++/ctcpsession.h>
#include <lwip/inet.h>

namespace CARIBOU
{

	/**
	 ** @brief The web/tcp server object
	 **/
	class CWebSocketServer : public CARIBOU::CTcpServer
	{
		public:
			CWebSocketServer(uint16_t port, uint32_t interface=INADDR_ANY, int backlog=TCP_DEFAULT_LISTEN_BACKLOG, char* name="tcpsrv", uint16_t stksize=512, uint16_t priority=0 );
			virtual ~CWebSocketServer();

			virtual void						run();

		protected:

			virtual bool						fork(int socket);

		private:

	};

}

#endif /* _CARIBOU_CWEBSOCKETSERVER_H_ */
