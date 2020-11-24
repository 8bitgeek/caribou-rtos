/*****************************************************************************
* Copyright (c) 2015 by Pike Aero Corp                                       *
* All Rights Reserved                                                        *
*****************************************************************************/
#include <cftpserver.h>
#include <syslog_printf.h>

namespace MineAirQuality
{
	#define inherited CARIBOU::CTcpServer

	CFtpServer::CFtpServer( uint16_t port, 
                            uint32_t interface, 
                            int backlog, 
                            char* name, 
                            uint32_t stksize, 
                            uint16_t priority,
                            uint16_t watchdog_count )
	: inherited(port,interface,backlog,name,stksize,priority,watchdog_count)
	{
	}

	CFtpServer::~CFtpServer()
	{
	}

	void CFtpServer::run()
	{
        SYSLOG_PRINTF( NULL, SYSLOG_DEBUG,"%s start", name());
		inherited::run();
	}

	bool CFtpServer::fork(int sockfd)
	{
		bool rc = false;
		if ( sockfd >= 0 )
		{
			CFtpSession* session = new CFtpSession(sockfd);
			if ( session )
			{
				session->start();
                rc=true;
			}
			else
			{
				lwip_close(sockfd);
			}
		}
		return rc;
	}


	void CFtpServer::acceptError(int rc, int err, const char* msg)
	{
		SYSLOG_PRINTF( NULL, SYSLOG_DEBUG, "accept error rc=%d, errno=%d - %s\n",rc,err,msg);
	}

	void CFtpServer::listenError(int rc, int err, const char* msg)
	{
		SYSLOG_PRINTF( NULL, SYSLOG_DEBUG, "listen error rc=%d, errno=%d - %s\n",rc,err,msg);
	}

	void CFtpServer::bindError(int rc, int err, const char* msg)
	{
		SYSLOG_PRINTF( NULL, SYSLOG_DEBUG, "bind error rc=%d, errno=%d - %s\n",rc,err,msg);
	}

	void CFtpServer::socketError(int rc, int err, const char* msg)
	{
		SYSLOG_PRINTF( NULL, SYSLOG_DEBUG, "socket error rc=%d, errno=%d - %s\n",rc,err,msg);
	}
} 

