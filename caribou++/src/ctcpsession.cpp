/******************************************************************************
* Copyright © 2005-2012 by Pike Aerospace Research Corporation
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
#include <caribou++/ctcpsession.h>
#include <caribou++/cstring.h>

namespace CARIBOU
{
	#define inherited CARIBOU::CThread

	CTcpSession::CTcpSession( const char* name, uint16_t stksize, uint16_t priority )
	: inherited((char*)name,stksize,priority)
	, mSocketIndex(0)
	{
	}

	CTcpSession::~CTcpSession()
	{
		CARIBOU::CTcpSocket* socket;
		while ( (socket=takeSocket()) )
		{
			socket->close();
			delete socket;
		}
	}
	
	CARIBOU::CList<CARIBOU::CTcpSocket*>& CTcpSession::socketQueue()	
	{
		return mSocketQueue;
	}

	int CTcpSession::socketCount()
	{
		int rc;
		lock();
		rc = socketQueue().count();
		unlock();
		return rc;
	}

	void CTcpSession::appendSocket(int socket)
	{
		if ( socket >= 0 )
		{
			CARIBOU::CTcpSocket* tcpSocket = new CARIBOU::CTcpSocket(socket);
			lock();
			tcpSocket->resetTimeout();
			socketQueue().append(tcpSocket);
			unlock();
		}
	}

	/// @brief Get the next socket in the queue ala round-robin
	CARIBOU::CTcpSocket* CTcpSession::nextSocket()
	{
		CARIBOU::CTcpSocket* rc=NULL;
		lock();
		if ( socketQueue().count() )
		{
			if ( ++mSocketIndex >= socketQueue().count() )
				mSocketIndex = 0;
			rc=socketQueue().at(mSocketIndex);
		}
		unlock();
		return rc;
	}

	// take the current socket
	CARIBOU::CTcpSocket* CTcpSession::takeSocket()
	{
		CARIBOU::CTcpSocket* rc=NULL;
		lock();
		if ( socketQueue().count() )
		{
			if ( mSocketIndex >= socketQueue().count() )
				mSocketIndex = 0;
			rc=socketQueue().take(mSocketIndex);
		}
		unlock();
		return rc;
	}

	CARIBOU::CTcpSocket* CTcpSession::closeSocket(CARIBOU::CTcpSocket* socket)
	{
		if ( socket->isValid() )
		{
			socket->close();
		}
		return socket;
	}

	CARIBOU::CTcpSocket* CTcpSession::socket()
	{
		CARIBOU::CTcpSocket* rc=NULL;
		lock();
		if ( socketQueue().count() )
		{
			if ( mSocketIndex >= socketQueue().count() )
				mSocketIndex = 0;
			rc=socketQueue().at(mSocketIndex);
		}
		unlock();
		return rc;
	}

	void CTcpSession::run()
	{
	}

}

