/******************************************************************************
* Copyright © 2015 by Mike Sharkey <mike@8bitgeek.net>
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
#ifndef _ACCUTRON_CHTTPSERVER_H_
#define _ACCUTRON_CHTTPSERVER_H_

#include "ctcpserver.h"
#include "chttpsession.h"

namespace Accutron
{

	class CHttpServer : public CARIBOU::CTcpServer
	{
		public:
			CHttpServer( uint16_t port, uint32_t interface=INADDR_ANY, int backlog=8, char* name="httpd",
						uint16_t stksize=PRODUCT_HTTP_SERVER_STK_SZ,
						uint16_t priority=PRODUCT_THREAD_NORMAL_PRIO );
			virtual ~CHttpServer();

			virtual	void			run();

		protected:

			virtual bool			fork(int socket);

		private:
			CHttpSession			mSession;
	};

}

#endif // _ACCUTRON_CHTTPSERVER_H_
