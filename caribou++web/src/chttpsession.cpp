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
#include "chttpsession.h"
#include "cstring.h"
#include "cwebpage.h"
#include "errno.h"

/** The web page headers... */
#include "chomepage.h"
#include "cadminpage.h"
#include "cdisplaypage.h"
#include "cmonitorpage.h"
#include "cnetworksettingspage.h"
#include "cpollingpage.h"
#include "cserialpage.h"
#include "csystempage.h"
#include "cloginpage.h"
#include "c404page.h"
#include "cimagefile.h"
#include "ctextfile.h"
#include "cdataloggingpage.h"
#include "cmimetype.h"
#include "cdatetimepage.h"
/* #include "cfirmwareupdatepage.h" */
#include "cbinfile.h"
#include "csettings.h"
#include "cstatus.h"
#include "cwatchdog.h"

namespace Accutron
{
	#define inherited CARIBOU::CTcpSession

    //CARIBOU::CList<CHttpSessionRecord*>	CHttpSession::mAuthenticated;
	caribou_jiffies_t					CHttpSession::mValidated=0L;
	CARIBOU::CSpinLock					CHttpSession::mSpinLock;

	CHttpSession::CHttpSession( const char* name, uint16_t stksize, uint16_t priority )
	: inherited((char*)name,stksize,priority)
	, mTimer(NULL)
	, mWebPage(NULL)
	{
	}

	CHttpSession::~CHttpSession()
	{
	}

	void CHttpSession::run()
	{
        syslog(SYSTEM_LVL,true,"%s start", name());
		for(;;)
		{
			if ( socketCount() > 0 )
			{
				CARIBOU::CByteArray rawRequest;
				mRequest.clear();
				clear();
				CStatus::statusOn();
				takeSocket();	// dequeue a socket
				if ( socket().read(rawRequest,0,5000) > 0 )
				{
					if ( !rawRequest.isEmpty() )
					{	
						mRequest.copy(rawRequest.data(),rawRequest.length());
						pageContent();
						render();
					}
				}
				clear();
				closeSocket();	// close the socket
				CStatus::statusOff();
			}
			else
			{
				yield();
			}
		}
	}

	void CHttpSession::clear()
	{
		if ( mWebPage != NULL )
		{
			delete mWebPage;
			mWebPage = NULL;
		}
	}

	void CHttpSession::render()
	{
		if ( mWebPage )
		{
			mWebPage->sendHTTPResponse();
			mWebPage->renderHeader();
			mWebPage->renderBody();
			mWebPage->renderFooter();
		}
		else
		{
			CARIBOU::CString header;
			header = "500 Internal Server Error\r\n\r\n";
			socket().send(header,0);
		}
	}


	// retrieve the page content as a CWebPage derived object instance.
	void CHttpSession::pageContent()
	{
		//CARIBOU::CString username;
		//CARIBOU::CString password;
		CMimeType   targetMimeType;
		targetMimeType.copy(mRequest.path().data(),mRequest.path().length());
		switch( targetMimeType.type() )
		{
			case CMimeType::tHTML:
				if ( mRequest.path().isEmpty() || mRequest.path().casecompare( "monitor.html" ) == 0 )
					mWebPage = new CMonitorPage(this);
				else if ( mRequest.path().casecompare( "polling.html" ) == 0 )
					mWebPage = new CPollingPage(this);
				else if ( mRequest.path().casecompare( "display.html" ) == 0 )
					mWebPage = new CDisplayPage(this);
				else if ( mRequest.path().casecompare( "network.html" ) == 0 )
					mWebPage = new CNetworkSettingsPage(this);
				else if ( mRequest.path().casecompare( "serial.html" ) == 0 )
					mWebPage = new CSerialPage(this);
				else if ( mRequest.path().casecompare( "logging.html" ) == 0 )
					mWebPage = new CDataLoggingPage(this);
				else if ( mRequest.path().casecompare( "datetime.html" ) == 0 )
					mWebPage = new CDateTimePage(this);
				else if ( mRequest.path().casecompare( "admin.html" ) == 0 )
					mWebPage = new CAdminPage(this);
				else if ( mRequest.path().casecompare( "system.html" ) == 0 )
					mWebPage = new CSystemPage(this);
				/* else if ( mRequest.path().casecompare( "firmwareupdate.html" ) == 0 )
					mWebPage = new CFirmwareUpdatePage(this); */
				else if ( mRequest.path().casecompare( "help.html" ) == 0 )
					mWebPage = new CHomePage(this);
				else
					mWebPage = NULL;
				break;
			case CMimeType::tJPG:
				mWebPage = new CImageFile(mRequest,this);
				break;
			case CMimeType::tTXT:
				mWebPage = new CTextFile(mRequest,this);
				break;
			case CMimeType::tBIN:
				mWebPage = new CBinFile(mRequest,this);
				break;
		}
	}

	/// validate a session, add the peer address and time stamp to the list
	/// of validated sessions.
	void CHttpSession::validate()
	{
#if 0
		if ( !isValidated() )
		{
			mSpinLock.lock();
			CHttpSessionRecord* record = new CHttpSessionRecord();
			if ( record )
			{
				record->mPeerAddress = socket().peerAddress();
				record->mTimeStamp = caribou_timer_ticks();
				mAuthenticated.append(record);
			}
			mSpinLock.unlock();
		}
#else
		mSpinLock.lock();
		if ( mValidated == 0L )
			mValidated=to_ms(caribou_timer_ticks());
		mSpinLock.unlock();
#endif
	}

	/// expire sessions and remove expired sessions
	void CHttpSession::invalidate()
	{
#if 0
		mSpinLock.lock();
		for(int n=0; n < mAuthenticated.count(); n++)
		{
			CHttpSessionRecord* record = mAuthenticated.at(n);
			if ( record )
			{
				if ( (to_ms(caribou_timer_ticks()) - record->mTimeStamp) > CSettings::httpSessionTimeout() )
				{
					record->mExpired=true;
				}
				// The record could have been expired by logout...
				if ( record->mExpired )
				{
					mAuthenticated.take(n--);
					delete record;
				}
			}
		}
		mSpinLock.unlock();
#else
		mSpinLock.lock();
		if ( mValidated != 0L && (to_ms(caribou_timer_ticks()) - mValidated) > CSettings::httpSessionTimeout() )
			mValidated = 0L;
		mSpinLock.unlock();
#endif
	}

	/// time stamp a session of it is a validated session
	void CHttpSession::timeStamp()
	{
#if 0
		if ( socket().isValid() )
		{
			mSpinLock.lock();
			for(int n=0; n < mAuthenticated.count(); n++ )
			{
				CHttpSessionRecord* record = mAuthenticated.at(n);
				if ( record && record->mPeerAddress == socket().peerAddress() )
				{
					record->mTimeStamp = to_ms(caribou_timer_ticks());
				}
			}
			mSpinLock.unlock();
		}
#endif
		mSpinLock.lock();
		if ( mValidated != 0L )
			mValidated = to_ms(caribou_timer_ticks());
		mSpinLock.unlock();
	}

	/// test for a validated session. 
	/// return the session valid state if the peer is in the lookup table,
	/// otherwise return false.
	bool CHttpSession::isValidated()
	{
#if 0
		bool rc=false;
		debug_indicator1(1);
		if ( socket().isValid() )
		{
			mSpinLock.lock();
			for(int n=0; !rc && n < mAuthenticated.count(); n++)
			{
				CHttpSessionRecord* record = mAuthenticated.at(n);
				if ( record && record->mPeerAddress == socket().peerAddress() )
				{
					rc = !record->mExpired;
				}
			}
			mSpinLock.unlock();
		}
		debug_indicator1(0);
		return rc;
#else
		bool rc;
		mSpinLock.lock();
		rc = (mValidated != 0L);
		mSpinLock.unlock();
		return rc;
#endif
	}

}

