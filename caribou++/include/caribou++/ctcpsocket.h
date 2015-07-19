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
#ifndef CARIBOUCTCPSOCKET_H
#define CARIBOUCTCPSOCKET_H

#include <caribou++/cabstractsocket.h>

namespace CARIBOU
{

	/**
	** The CTcpSocket class provides a TCP socket.
	** TCP (Transmission Control Protocol) is a reliable, stream-oriented,
	** connection-oriented transport protocol. It is especially well
	** suited for continuous transmission of data.
	*/
	class CTcpSocket : public CAbstractSocket
	{
		public:

			CTcpSocket();
			CTcpSocket(int socket);
			CTcpSocket(int domain, int type, int protocol);
			CTcpSocket(const CTcpSocket& other);
			virtual	~CTcpSocket();

			CTcpSocket&				operator=( const CTcpSocket& other );
			bool					operator==( CTcpSocket& other );

	};

}

#endif
