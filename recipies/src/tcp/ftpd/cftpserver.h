/*****************************************************************************
* Copyright (c) 2015 by Pike Aero Corp                                       *
* All Rights Reserved                                                        *
*****************************************************************************/
#ifndef _PIKEAERO_CFTPSERVER_H_
#define _PIKEAERO_CFTPSERVER_H_

#include <caribou++/ctcpserver.h>
#include <cftpsession.h>

namespace PikeAero
{

	class CFtpServer : public CARIBOU::CTcpServer
	{
		public:
			CFtpServer( uint16_t port=21, uint32_t interface=INADDR_ANY, int backlog=16, char* name=(char*)"ftpd",
						uint32_t stksize=PRODUCT_HTTP_SERVER_STK_SZ,
						uint16_t priority=PRODUCT_THREAD_NORMAL_PRIO,
                        uint16_t watchdog_count=0 );
			virtual ~CFtpServer();

			virtual	void			run();

		protected:

			virtual void			acceptError(int rc, int err, const char* msg=NULL);
			virtual void			listenError(int rc, int err, const char* msg=NULL);
			virtual void			bindError(int rc, int err, const char* msg=NULL);
			virtual void			socketError(int rc, int err, const char* msg=NULL);

			virtual bool			fork(int sockfd);
			
	};

}

#endif // _PIKEAERO_CFTPSERVER_H_
