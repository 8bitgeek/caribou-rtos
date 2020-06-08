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
#include <caribou++/cudpsession.h>
#include <caribou++/cstring.h>

namespace CARIBOU
{
	#define inherited CARIBOU::CThread

	CUdpSession::CUdpSession( const char* name, size_t stksize, uint16_t priority )
	: inherited((char*)name,stksize,priority)
	{
	}

	CUdpSession::~CUdpSession()
	{
		dequeueSocket();
		closeSocket();
	}
	
	CARIBOU::CList<int>& CUdpSession::socketQueue()	
	{
		return mSocketQueue;
	}

	int CUdpSession::socketCount()
	{
		int rc;
		lock();
		rc = socketQueue().count();
		unlock();
		return rc;
	}

	void CUdpSession::appendSocket(int socket)
	{
		lock();
		socketQueue().append(socket);
		unlock();
	}

	/// @brief Get the next socket in the queue ala round-robin
	CARIBOU::CUdpSocket& CUdpSession::nextSocket()
	{
		lock();
		if ( socketQueue().count() )
		{
			// if the current socket is valid, then find the next in the queue
			// or retain the existing socket if it's the only one in the queue.
			if ( socketQueue().count() > 1 )
			{
				int idx = socketQueue().indexOf(mSocket.socket())+1;
				if ( idx >= (int)socketQueue().count() )
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

	CARIBOU::CUdpSocket& CUdpSession::takeSocket()
	{
		lock();
		if ( socketQueue().count() )
		{
			setSocket(socketQueue().takeFirst());
		}
		unlock();
		return mSocket;
	}

	/// Dequeue the current socket
	void CUdpSession::dequeueSocket()
	{
		lock();
		if ( socketQueue().indexOf(mSocket.socket()) >= 0 )
		{
			socketQueue().take(socketQueue().indexOf(mSocket.socket()));
		}	
		unlock();
	}

	void CUdpSession::closeSocket()
	{
		if ( mSocket.isValid() )
		{
			mSocket.close();
		}
	}

	CARIBOU::CUdpSocket& CUdpSession::socket()
	{
		return mSocket;
	}

	CARIBOU::CUdpSocket& CUdpSession::setSocket(int socket)
	{
		mSocket.setSocket(socket);
		mSocket.setBlocking(false);
		return mSocket;
	}

	void CUdpSession::run()
	{
	}

}

