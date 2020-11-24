#ifndef _MINEAIRQUALITY_CHTTPFORMSESSION_H_
#define _MINEAIRQUALITY_CHTTPFORMSESSION_H_

#include <chttpsession.h>

namespace MineAirQuality
{

	/***************************************************************************
	*                    HTTP FORM THREAD                                      *
	****************************************************************************/
	class CHttpFormSession : public MineAirQuality::CHttpSession
	{
		public:
	
			CHttpFormSession(	
							int 		sockfd, 
							const char* name			=	PRODUCT_HTTP_SESSION_NAME, 
							size_t 		stksize			=	PRODUCT_HTTP_THREAD_STK_SZ, 
							uint16_t 	priority		=	PRODUCT_HTTP_SESSION_PRIO,
							uint16_t 	watchdog_count	=	PRODUCT_HTTP_WD_COUNT
						);
			virtual ~CHttpFormSession();

		protected:

			virtual void		enter();
			virtual void		renderHeader() {}
			virtual void		renderBody();
			virtual void		renderFooter() {}
			virtual void		leave();
	};

}

#endif
