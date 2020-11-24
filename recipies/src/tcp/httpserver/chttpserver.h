#ifndef _MINEAIRQUALITY_CHTTPSERVER_H_
#define _MINEAIRQUALITY_CHTTPSERVER_H_

#include <caribou++/ctcpserver.h>
#include <chttpsession.h>

namespace MineAirQuality
{

	class CHttpServer : public CARIBOU::CTcpServer
	{
		public:
			CHttpServer( 
						uint16_t port=PRODUCT_HTTP_PORT, 
						uint32_t interface=INADDR_ANY, 
						int backlog=PRODUCT_HTTP_BACKLOG, 
						char* name=(char*)PRODUCT_HTTP_SERVER_NAME,
						size_t stksize=PRODUCT_HTTP_SERVER_STK_SZ,
						uint16_t priority=PRODUCT_HTTP_THREAD_PRIO,
						uint16_t watchdog_count=PRODUCT_HTTPD_WD_COUNT
						);
			virtual ~CHttpServer();

			virtual	void			run();

		protected:

			virtual void			acceptError(int rc, int err, const char* msg=NULL);
			virtual void			listenError(int rc, int err, const char* msg=NULL);
			virtual void			bindError(int rc, int err, const char* msg=NULL);
			virtual void			socketError(int rc, int err, const char* msg=NULL);

			virtual bool			fork(int sockfd);
	};

}

#endif 
