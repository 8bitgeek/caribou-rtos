#include <caribou++/cstring.h>
#include <chttpserver.h>

namespace PikeAero
{
	#define inherited CARIBOU::CTcpServer

	CHttpServer::CHttpServer(	uint16_t port, 
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

	CHttpServer::~CHttpServer()
	{
	}

	void CHttpServer::run()
	{
		inherited::run();
	}

	bool CHttpServer::fork(int sockfd)
	{
		bool rc = false;
		if ( sockfd >= 0 )
		{
			CHttpSession* session = new CHttpSession(sockfd);
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

	void CHttpServer::acceptError(int rc, int err, const char* msg)
	{
		#if PRODUCT_DEBUG_HTTP_SERVER
			debug_printf("accept error rc=%d, errno=%d - %s\n",rc,err,msg);
		#endif
	}

	void CHttpServer::listenError(int rc, int err, const char* msg)
	{
		#if PRODUCT_DEBUG_HTTP_SERVER 
			debug_printf("listen error rc=%d, errno=%d - %s\n",rc,err,msg);
		#endif
	}

	void CHttpServer::bindError(int rc, int err, const char* msg)
	{
		#if PRODUCT_DEBUG_HTTP_SERVER 
			debug_printf("bind error rc=%d, errno=%d - %s\n",rc,err,msg);
		#endif
	}

	void CHttpServer::socketError(int rc, int err, const char* msg)
	{
		#if PRODUCT_DEBUG_HTTP_SERVER 
			debug_printf("socket error rc=%d, errno=%d - %s\n",rc,err,msg);
		#endif
	}

} 

