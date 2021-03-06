/** ***************************************************************************
* @file ctcpsession.cpp
* @author Mike Sharkey <mike@pikeaero.com>.
* @copyright © 2005-2013 by Pike Aerospace Research Corporation
* @copyright © 2014-2015 by Mike Sharkey
* @details This file is part of CARIBOU RTOS
* CARIBOU RTOS is free software: you can redistribute it and/or modify
* it under the terms of the Beerware License Version 43.
* "THE BEER-WARE LICENSE" (Revision 43):
* Mike Sharkey <mike@pikeaero.com> wrote this file. 
* As long as you retain this notice you can do whatever you want with
* this stuff. If we meet some day, and you think this stuff is 
* worth it, you can buy me a beer in return ~ Mike Sharkey
******************************************************************************/
#include <caribou++/ctcpsession.h>
#include <caribou++/cstring.h>

namespace CARIBOU
{
	#define inherited CARIBOU::CThread

	CTcpSession::CTcpSession( int sockfd, const char* name, size_t stksize, uint16_t priority, uint16_t watchdog_count )
	: inherited((char*)name,stksize,priority,watchdog_count)
	{
		mSocket = new CARIBOU::CTcpSocket(sockfd);
	}

	CTcpSession::~CTcpSession()
	{
		if ( mSocket )
		{
			mSocket->close();
			delete mSocket;
			mSocket = NULL;
		}
	}

	/**
	  * @return the socket object
	  */
	CARIBOU::CTcpSocket* CTcpSession::socket()
	{
		return mSocket;
	}

	/**
	  * @brief This method should be overridden by the TCP protocol server.
	  * @brief The default implementation is a simple echo server....
	  */
	void CTcpSession::run()
	{
		while( mSocket->isOpen())
		{
			int bytesAvailable = mSocket->bytesAvailable();
			if ( bytesAvailable > 0 )
			{
				CARIBOU::CByteArray bytes;
				mSocket->read(bytes,bytesAvailable);
				mSocket->write(bytes);
			}
		}
	}

}

