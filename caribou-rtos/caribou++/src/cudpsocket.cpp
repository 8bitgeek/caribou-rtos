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
#include <caribou++/cudpsocket.h>
#include <lwip/netif.h>
#include <lwip/sockets.h>

#if !defined(PRODUCT_IF_NAME)
	#define PRODUCT_IF_NAME "if0"
#endif

namespace CARIBOU
{
	#define inherited CAbstractSocket

	CUdpSocket::CUdpSocket()
	: inherited()
	{
	}

	CUdpSocket::CUdpSocket(int socket)
	: inherited(socket)
	{
	}

	CUdpSocket::CUdpSocket(int domain, int type, int protocol)
	: inherited(domain,type,protocol)
	{
	}

	CUdpSocket::CUdpSocket(const CUdpSocket& other)
	: inherited(other)
	{
	}

	CUdpSocket::~CUdpSocket()
	{
	}

	CUdpSocket& CUdpSocket::operator=( const CUdpSocket& other )
	{
		mSocket = other.mSocket;
	}

	bool CUdpSocket::operator==( CUdpSocket& other )
	{
		return other.mSocket = mSocket;
	}

	int CUdpSocket::send(char* buf, int len, int flags)
	{
		int rc=0;
		struct netif* interface = netif_find(PRODUCT_IF_NAME);
		if ( mPeerAddress && mPeerPort && interface )
		{
			struct sockaddr_in si_local;
			struct sockaddr_in si_other;
			int s;
			int slen=sizeof(si_other);
			if ((s=lwip_socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP))>=0)
			{
				memset((char *)&si_local, 0, sizeof(struct sockaddr_in));
				memset((char *)&si_other, 0, sizeof(struct sockaddr_in));

				si_local.sin_family = AF_INET;
				si_local.sin_len = sizeof(si_local);
				si_local.sin_addr.s_addr = interface->ip_addr.addr;
				si_local.sin_port = 0;

				si_other.sin_family = AF_INET;
				si_other.sin_len = sizeof(si_other);
				si_other.sin_addr.s_addr = mPeerAddress;
				si_other.sin_port = mPeerPort;
				
				rc = lwip_bind(s, (struct sockaddr *)&si_local, sizeof(si_local));

				rc = lwip_sendto(s, buf, len, flags, (struct sockaddr*)&si_other, sizeof(struct sockaddr_in) );
				for(int n=0; n < 1000; n++)
					caribou_thread_yield();
				lwip_close(s);
			}
		}
		else
		{
			rc = inherited::send(buf,len,flags);
		}
		return rc;		
	}

	int CUdpSocket::send(CARIBOU::CByteArray& buf, int flags)
	{
		return send(buf.data(),buf.length());
	}

}

