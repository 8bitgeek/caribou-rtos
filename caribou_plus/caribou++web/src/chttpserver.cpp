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
#include "chttpserver.h"
#include "csettings.h"
#include "cwatchdog.h"

namespace Accutron
{
	#define inherited CARIBOU::CTcpServer

	CHttpServer::CHttpServer( uint16_t port, uint32_t interface, int backlog, char* name, uint16_t stksize, uint16_t priority )
	: inherited(port,interface,backlog,name,stksize,priority)
	{
	}

	CHttpServer::~CHttpServer()
	{
	}

	void CHttpServer::run()
	{
        syslog(SYSTEM_LVL,true,"%s start", name());
		mSession.start();
		inherited::run();
	}


	bool CHttpServer::fork(int socket)
	{
		bool rc = false;
		if ( socket >= 0 )
		{
			mSession.invalidate();
			mSession.timeStamp();
			if ( mSession.socketCount() < CSettings::numTCPConnections() || CSettings::numTCPConnections() == 0)
			{
				mSession.appendSocket(socket);
				rc=true;
			}
			else
			{
				syslog(SYSTEM_LVL,true,"HTTP max sockets %d", CSettings::numTCPConnections() );
			}
		}
		return rc;
	}

} 

