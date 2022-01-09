/** ***************************************************************************
* @file ctcpsocket.cpp
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
#include <caribou++/ctcpsocket.h>

namespace CARIBOU
{
	#define inherited CAbstractSocket

	CTcpSocket::CTcpSocket()
	: inherited()
	{
	}

	CTcpSocket::CTcpSocket(int socket)
	: inherited(socket)
	{
	}

	CTcpSocket::CTcpSocket(int domain, int type, int protocol)
	: inherited(domain,type,protocol)
	{
	}

	CTcpSocket::CTcpSocket(const CTcpSocket& other)
	: inherited(other)
	{
	}

	CTcpSocket::~CTcpSocket()
	{
	}

	CTcpSocket& CTcpSocket::operator=( const CTcpSocket& other )
	{
		mSocket = other.mSocket;
		return *this;
	}

	bool CTcpSocket::operator==( CTcpSocket& other )
	{
		return (other.mSocket = mSocket);
	}

  //   int CTcpSocket::bytesAvailable(uint32_t* /* ip */,uint16_t* /* port */)
  //   {
  //       char buf[32];
 	// 	int rc = lwip_recv(mSocket,buf,32,MSG_DONTWAIT|MSG_PEEK);
  //       if ( rc < 0  )
  //       {
  //           if ( errno == EAGAIN )
  //           {
  //               rc = 0;
  //           }
  //       }
  //       else if ( rc == 0 )
  //       {
  //           rc = (-1);
  //       } 
		// return rc;
  //   }

}

