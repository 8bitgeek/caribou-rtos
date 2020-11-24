#include <caribou++/cstring.h>
#include <chttpformserver.h>
#include <chttpformsession.h>

namespace MineAirQuality
{
	#define inherited MineAirQuality::CHttpServer

	CHttpFormServer::CHttpFormServer(	uint16_t port, 
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

	CHttpFormServer::~CHttpFormServer()
	{
	}

	bool CHttpFormServer::fork(int sockfd)
	{
		bool rc = false;
		if ( sockfd >= 0 )
		{
			CHttpFormSession* session = new CHttpFormSession(sockfd);
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

} 

