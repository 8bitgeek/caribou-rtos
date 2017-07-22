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
#include <caribou++/cudpserver.h>
#include <caribou++/cudpsocket.h>
#include <lwip/sockets.h>

namespace CARIBOU
{
	CList<CUdpServer*>  CUdpServer::mServers;

	#define inherited CThread

	/// A TCP server instance will set up a listener on each UDP port.
	CUdpServer::CUdpServer(uint16_t port, uint32_t interface, int backlog, char* name, uint32_t stksize, uint16_t priority)
	: inherited(name,stksize,priority)
	, mInterface(interface)
	, mPort(port)
	, mBacklog(backlog)
	, mServerSocket(-1)
	{
		objectLock();
		mServers.append(this);
		objectUnlock();
	}

	CUdpServer::~CUdpServer()
	{
		objectLock();
		mServers.take(mServers.indexOf(this));
		objectUnlock();
	}

	/// Return the list of servers.
	CList<CUdpServer*>& CUdpServer::servers()
	{
		return mServers;
	}

	/// Determin if the server is valid
	bool CUdpServer::isValid()
	{
		return (mServerSocket.isValid());
	}

	void CUdpServer::close()
	{
		if ( isValid() )
		{
			mServerSocket.close();
		}
	}

	/// Locate the TCP server instance servicing the port.
	/// @param port The port to search for.
	/// @return Return the server instance or NULL.
    CUdpServer* CUdpServer::server(uint16_t port)
    {
        int nServer;
        uint16_t serverPort;
        CUdpServer* tcpServer=NULL;
        objectLock();
        for(nServer=0; nServer<mServers.count(); nServer++)
        {
            tcpServer = mServers.at(nServer);
			serverPort = tcpServer->port();
			if ( serverPort == port )
			{
			   break;
			}
		}
		objectUnlock();
		return tcpServer;
    }

	/// @return The address of the interface
	uint32_t CUdpServer::interface()
	{
		uint32_t rc=0;
		if ( isValid() )
		{
			struct sockaddr_in sa;
			socklen_t sa_len = (socklen_t)sizeof(sa);
			if ( lwip_getsockname(mServerSocket.socket(), (struct sockaddr*)&sa, &sa_len) == 0 )
			{
				rc = lwip_ntohl(sa.sin_addr.s_addr);
			}
		}
		return rc;
	}

	/// @return The port of the interface
	uint16_t CUdpServer::port()
	{
		uint32_t rc=0;
		if ( isValid() )
		{
			struct sockaddr_in sa;
			socklen_t sa_len = (socklen_t)sizeof(sa);
			if ( lwip_getsockname(mServerSocket.socket(), (struct sockaddr*)&sa, &sa_len) == 0 )
			{
				rc = lwip_ntohl(sa.sin_port);
			}
		}
		return rc;
	}

	/**
	 * @brief Override to set server socket options such as multi-cast.
	 */
	void CUdpServer::setSocketOptions(CUdpSocket& socket)
	{
	}

	/// fork a session thread...this base class simply closes the socket
	bool CUdpServer::fork(CUdpSocket& socket)
	{
		return false;
	}

	void CUdpServer::run()
	{
		struct sockaddr_in servaddr;
		int client;
		int rc;

		for(;;)
		{
			if ( (rc=mServerSocket.setSocket(lwip_socket(AF_INET, SOCK_DGRAM, 0))) >= 0 )
			{
				// populate the socket address
				memset(&servaddr, 0, sizeof(servaddr));
				servaddr.sin_family      = AF_INET;
				servaddr.sin_addr.s_addr = lwip_htonl(mInterface);
				servaddr.sin_port        = lwip_htons(mPort);
				// Assign socket address to socket
				if ( (rc=lwip_bind(mServerSocket.socket(),(struct sockaddr *)&servaddr,sizeof(servaddr))) == 0 )
				{
					setSocketOptions(mServerSocket);
					for(;;)
					{
						if ( mServerSocket.bytesAvailable() > 0 )
						{
							fork(mServerSocket);
						}
						else
						{
							yield();
						}
					}
				}
				else
				{
					bindError(rc,errno,strerror(errno));
				}
				mServerSocket.close();
			}
			else
			{
				socketError(rc,errno,strerror(errno));
			}
		}
	}

}
