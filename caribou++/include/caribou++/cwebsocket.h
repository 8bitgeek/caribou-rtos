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
#ifndef _CARIBOU_CWEBSOCKET_H_
#define _CARIBOU_CWEBSOCKET_H_

#include <caribou++/ctcpsocket.h>

namespace CARIBOU
{

	/**
	** The CWebSocket class provides a Web/TCP socket.
	*/
	class CWebSocket : public CTcpSocket
	{
		public:

			CWebSocket();
			CWebSocket(int socket);
			CWebSocket(int domain, int type, int protocol);
			CWebSocket(const CTcpSocket& other);
			virtual	~CWebSocket();

			CWebSocket&				operator=( const CWebSocket& other );
			bool					operator==( CWebSocket& other );

	};

}

#endif /* _CARIBOU_CWEBSOCKET_H_ */
