#ifndef _PIKEAERO_CHTTPFORMSERVER_H_
#define _PIKEAERO_CHTTPFORMSERVER_H_

#include <chttpserver.h>

namespace PikeAero
{

	class CHttpFormServer : public PikeAero::CHttpServer
	{
		public:
			CHttpFormServer( 
						uint16_t 	port			=	PRODUCT_HTTP_PORT, 
						uint32_t 	interface		=	INADDR_ANY, 
						int 		backlog			=	PRODUCT_HTTP_BACKLOG, 
						char* 		name			=	(char*)PRODUCT_HTTP_SERVER_NAME,
						size_t 		stksize			=	PRODUCT_HTTP_SERVER_STK_SZ,
						uint16_t 	priority		=	PRODUCT_HTTP_THREAD_PRIO,
						uint16_t 	watchdog_count	=	PRODUCT_HTTPD_WD_COUNT
						);
			virtual ~CHttpFormServer();

		protected:

			virtual bool			fork(int sockfd);
	};

}

#endif 
