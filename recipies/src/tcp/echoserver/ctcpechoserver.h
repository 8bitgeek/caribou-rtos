#ifndef _PIKEAERO_CTCPECHOSERVER_H_
#define _PIKEAERO_CTCPECHOSERVER_H_

#include <caribou++/ctcpserver.h>

namespace PikeAero
{
	class CTcpEchoServer : public CARIBOU::CTcpServer
	{
		public:
			CTcpEchoServer( 
						uint16_t port, 
						uint32_t interface=INADDR_ANY, 
						int backlog=16, 
						char* name=(char*)"tcpechosrv",
						size_t stksize=1024,
						uint16_t priority=0,
						uint16_t watchdog_count=0
						);
			virtual ~CTcpEchoServer();

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
