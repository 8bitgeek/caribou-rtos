/** ***************************************************************************
* @file cwebsocket.h
* @author Mike Sharkey <mike@pikeaero.com>.
* @copyright © 2016 by Mike Sharkey
* @details This file is part of CARIBOU RTOS
* CARIBOU RTOS is free software: you can redistribute it and/or modify
* it under the terms of the Beerware License Version 43.
* "THE BEER-WARE LICENSE" (Revision 43):
* Mike Sharkey <mike@pikeaero.com> wrote this file. 
* As long as you retain this notice you can do whatever you want with
* this stuff. If we meet some day, and you think this stuff is 
* worth it, you can buy me a beer in return ~ Mike Sharkey
******************************************************************************/
#include <caribou++/cwebsocket.h>
#include <caribou++/cbase64.h>
#include <caribou++/cmd5.h>
#include <caribou++/csha1.h>
#include <wslay/wslay.h>

namespace CARIBOU
{
	#define inherited CTcpSocket

	CWebSocket::CWebSocket()
	: inherited()
	{
	}

	CWebSocket::CWebSocket(int socket)
	: inherited(socket)
	{
	}

	CWebSocket::CWebSocket(int domain, int type, int protocol)
	: inherited(domain,type,protocol)
	{
	}

	CWebSocket::CWebSocket(const CTcpSocket& other)
	: inherited(other)
	{
	}

	CWebSocket::~CWebSocket()
	{
	}

	CWebSocket& CWebSocket::operator=( const CWebSocket& other )
	{
		mSocket = other.mSocket;
	}

	bool CWebSocket::operator==( CWebSocket& other )
	{
		return other.mSocket = mSocket;
	}


}

