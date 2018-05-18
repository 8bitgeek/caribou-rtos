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
#ifndef _ACCUTRON_CHTTPSESSION_H_
#define _ACCUTRON_CHTTPSESSION_H_

#include "ctcpsession.h"
#include "chttprequest.h"
#include "cwebpage.h"
#include "cspinlock.h"
#include "cmutex.h"

namespace Accutron
{

	class CHttpSessionRecord
	{
		friend class CHttpSession;
		CHttpSessionRecord()
		: mPeerAddress(0)
		, mTimeStamp(0)
		, mExpired(false)		
		{}
		uint32_t			mPeerAddress;
		caribou_jiffies_t			mTimeStamp;
		bool				mExpired;
	};

	/***************************************************************************
	*                    HTTP PROTOCOL SESSION THREAD                          *
	****************************************************************************/
	class CHttpSession : public CARIBOU::CTcpSession
	{
		friend class CHttpServer;
		friend class CLoginPage;
		friend class CWebPage;
		public:
	
			CHttpSession( const char* name="http", uint16_t stksize=PRODUCT_HTTP_THREAD_STK_SZ, uint16_t priority=PRODUCT_HTTP_THREAD_PRIO );
			virtual ~CHttpSession();

			CHTTPRequest&			httpRequest()	{return mRequest;}

		protected:

			virtual void			run();
			virtual	void			validate();
			virtual void			invalidate();
			virtual	bool			isValidated();
			virtual	void			timeStamp();
			virtual	void			clear();

		private:
        	void					pageContent();
			void					render();
			void*					mTimer;
			CHTTPRequest			mRequest;
            CWebPage*				mWebPage;
            /// We're running all the http sessions through a single
			/// thread, so we need a means of maintaining authentication
			/// on a per-session basis outide of the scope of the session
			/// we'll do this by maintaining a list of IPs who have been
			/// authenticated along with a time stamp recording the last
			/// time seen such that the session can be expired
			//static	CARIBOU::CList<CHttpSessionRecord*>	mAuthenticated; // list of authenticated IPs
			static	caribou_jiffies_t	mValidated;
			static	CARIBOU::CSpinLock	mSpinLock;

	};

}

#endif
