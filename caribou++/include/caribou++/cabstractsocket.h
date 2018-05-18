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
#ifndef CARIBOUCABSTRACTSOCKET_H
#define CARIBOUCABSTRACTSOCKET_H

#include <caribou++/cobject.h>
#include <caribou++/cbytearray.h>
#include <caribou++/cstring.h>
#include <caribou++/cmutex.h>
#include <lwip/sockets.h>

namespace CARIBOU
{

	/**
	** The CAbstractSocket class provides the base functionality common to all socket types.
	** CAbstractSocket is the base class for CTcpSocket and CUdpSocket and contains all
	** common functionality of these two classes.
	*/
	class CAbstractSocket : public CObject
	{
		public:
			CAbstractSocket();
			CAbstractSocket(int socket);
			CAbstractSocket(int domain, int type, int protocol);
			CAbstractSocket(const CAbstractSocket& other);
			virtual	~CAbstractSocket();

			bool					isOpen();
			bool					isValid();
			void					abort();
			void					close();
			void					shutdown(int mode=SHUT_RD);

			bool					setBlocking(bool blocking);
			bool					blocking();

			bool					setNoDelay(bool noDelay);
			bool					noDelay();

			int						bytesAvailable(uint32_t* ip=NULL,uint16_t* port=NULL);

			int						recv(char* buf, int len, int flags=0);
			int						recv(CARIBOU::CByteArray& buf, int len, int flags=0);

			virtual int				send(char* buf, int len=-1, int flags=0);
			virtual int				send(CARIBOU::CByteArray& buf, int flags=0);

			int						read(char* buf, int len);
			int						read(CARIBOU::CByteArray& buf, int len);
			int						read(CARIBOU::CByteArray& buf, int len, int timeout);

			int						peek(char* buf, int len);

			int						write(char* buf, int len);
			int						write(CByteArray& buf);

			uint32_t				localAddress();
			CString					localAddressString();
			uint16_t				localPort();

			uint32_t				peerAddress();
			CString					peerAddressString();
			uint16_t				peerPort();

			int						accept();
			int						listen(int backlog);
			int						bind(CARIBOU::CString host="", uint16_t port=0);
			int						connectToHost(CARIBOU::CString host, uint16_t port, uint16_t hostPort=0);
			void					disconnectFromHost();

			int						setSocket(int socket) {return (mSocket=socket);}
			int						socket()	{return mSocket;}

			bool					timeout();
			void					resetTimeout();
			void					setTimeoutValue(uint32_t timeoutValue);
			uint32_t				timeoutValue();

			CAbstractSocket&		operator=( const CAbstractSocket& other );
			bool					operator==( CAbstractSocket& other );


		protected:

			static void				close(int s);
			static int				bytesAvailable(int s,uint32_t* ip=NULL,uint16_t* port=NULL);
			static bool				setBlocking(int s,bool blocking);
			static int				read(int s,CARIBOU::CByteArray& buf, int len);

			CString					addressString(uint32_t ip);
			int						mSocket;
			uint32_t				mTimeoutMark;
			uint32_t				mTimeoutValue;
	};

}

#endif
