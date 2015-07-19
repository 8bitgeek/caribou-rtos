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
	{
	}

	CTcpSession::~CTcpSession()
	{
		dequeueSocket();
		closeSocket();
	}
	
	CARIBOU::CList<int>& CTcpSession::socketQueue()	
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
		lock();
		socketQueue().append(socket);
		unlock();
	}

	/// @brief Get the next socket in the queue ala round-robin
	CARIBOU::CTcpSocket& CTcpSession::nextSocket()
	{
		lock();
		if ( socketQueue().count() )
		{
			// if the current socket is valid, then find the next in the queue
			// or retain the existing socket if it's the only one in the queue.
			if ( socketQueue().count() > 1 )
			{
				int cur = socketQueue().indexOf(mSocket.socket());
				int idx = cur+1;
				if ( idx >= socketQueue().count() )
					idx=0;
				setSocket(socketQueue().at(idx));
			}
			else
			{
				setSocket(socketQueue().at(0));
			}
		}
		unlock();
		return mSocket;
	}

	CARIBOU::CTcpSocket& CTcpSession::takeSocket()
	{
		lock();
		if ( socketQueue().count() )
		{
			setSocket(socketQueue().takeFirst());
		}
		unlock();
		return mSocket;
	}

	/**
	 * Dequeue the current socket
	 */
	void CTcpSession::dequeueSocket()
	{
		int idx;
		lock();
		idx = socketQueue().indexOf(mSocket.socket());
		if ( idx >= 0 )
		{
			socketQueue().take(idx);
		}	
		unlock();
	}

	void CTcpSession::closeSocket()
	{
		if ( mSocket.isValid() )
		{
			mSocket.close();
		}
	}

	CARIBOU::CTcpSocket& CTcpSession::socket()
	{
		return mSocket;
	}

	CARIBOU::CTcpSocket& CTcpSession::setSocket(int socket)
	{
		mSocket.setSocket(socket);
		mSocket.setBlocking(false);
		return mSocket;
	}

	void CTcpSession::run()
	{
	}

}

