#include <caribou++/cstring.h>
#include <ctcpechoserver.h>
#include <ctcpechosession.h>
#include <syslog_printf.h>

namespace MineAirQuality
{
	#define inherited CARIBOU::CTcpServer

	CTcpEchoServer::CTcpEchoServer(	uint16_t port, 
                                    uint32_t interface, 
                                    int backlog, 
                                    char* name, 
                                    size_t stksize, 
                                    uint16_t priority,
                                    uint16_t watchdog_count
							    )
	: inherited(port,interface,backlog,name,stksize,priority,watchdog_count)
	{
	}

	CTcpEchoServer::~CTcpEchoServer()
	{
	}

	void CTcpEchoServer::run()
	{
		inherited::run();
	}

	bool CTcpEchoServer::fork(int sockfd)
	{
		bool rc = false;
		if ( sockfd >= 0 )
		{
			CTcpEchoSession* session = new CTcpEchoSession(sockfd);
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

	void CTcpEchoServer::acceptError(int rc, int err, const char* msg)
	{
		SYSLOG_PRINTF( NULL, SYSLOG_DEBUG, "accept error rc=%d, errno=%d - %s",rc,err,msg);
	}

	void CTcpEchoServer::listenError(int rc, int err, const char* msg)
	{
		SYSLOG_PRINTF( NULL, SYSLOG_DEBUG, "listen error rc=%d, errno=%d - %s",rc,err,msg);
	}

	void CTcpEchoServer::bindError(int rc, int err, const char* msg)
	{
		SYSLOG_PRINTF( NULL, SYSLOG_DEBUG, "bind error rc=%d, errno=%d - %s",rc,err,msg);
	}

	void CTcpEchoServer::socketError(int rc, int err, const char* msg)
	{
		SYSLOG_PRINTF( NULL, SYSLOG_DEBUG, "socket error rc=%d, errno=%d - %s",rc,err,msg);
	}

} 

