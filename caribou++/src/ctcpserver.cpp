/** ***************************************************************************
* @file ctcpserver.cpp
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
#include <caribou++/ctcpserver.h>
#include <caribou++/ctcpsocket.h>
#include <caribou++/ctcpsession.h>
#include <lwip/sockets.h>

namespace CARIBOU
{
	CList<CTcpServer*>  CTcpServer::mServers;

	#define inherited CThread

	/// A TCP server instance will set up a listener on the TCP port.
	CTcpServer::CTcpServer(uint16_t port, uint32_t interface, int backlog, char* name, uint32_t stksize, uint16_t priority)
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

	CTcpServer::~CTcpServer()
	{
		objectLock();
		mServers.take(mServers.indexOf(this));
		objectUnlock();
	}

	/// Return the list of servers.
	CList<CTcpServer*>& CTcpServer::servers()
	{
		return mServers;
	}

	/// Determine if the server is valid
	bool CTcpServer::isValid()
	{
		return (mServerSocket >= 0);
	}

	void CTcpServer::close()
	{
		if ( isValid() )
		{
			lwip_close(mServerSocket);
			mServerSocket=-1;
		}
	}

	/// Locate the TCP server instance servicing the port. 
	/// @param port The port to search for.
	/// @return Return the server instance or NULL.
    CTcpServer* CTcpServer::server(uint16_t port)
    {
        int nServer;
        uint16_t serverPort;
        CTcpServer* tcpServer=NULL;
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
	uint32_t CTcpServer::interface()
	{
		uint32_t rc=0;
		if ( isValid() )
		{
			struct sockaddr_in sa;
			socklen_t sa_len = (socklen_t)sizeof(sa);
			if ( lwip_getsockname(mServerSocket, (struct sockaddr*)&sa, &sa_len) == 0 )
			{
				rc = lwip_ntohl(sa.sin_addr.s_addr);
			}
		}
		return rc;
	}

	/**
	 * @return The port of the interface
	 */
	uint16_t CTcpServer::port()
	{
		return mPort;
	}

	/**
	 * @brief This method should be overridden by the protocol server.
	 * @brief The default implementation instantiates A CTCPSession  base class (echo session)
	 */
	bool CTcpServer::fork(CARIBOU::CTcpSocket* socket)
	{
		bool rc = false;
		if ( socket >= 0 )
		{
			CTcpSession* session = new CTcpSession(	socket );
			if ( session )
			{
				session->start();
                rc=true;
			}
		}
		return rc;
	}

	void CTcpServer::run()
	{
		struct sockaddr_in servaddr;
		int client;
		int rc;

		if ( (mServerSocket = lwip_socket(AF_INET, SOCK_STREAM, 0)) >= 0 )
		{
			// populate the socket address
			memset(&servaddr, 0, sizeof(servaddr));
			servaddr.sin_family      = AF_INET;
			servaddr.sin_addr.s_addr = lwip_htonl(mInterface);
			servaddr.sin_port        = lwip_htons(mPort);
			// Assign socket address to socket
			if ( (rc=lwip_bind(mServerSocket,(struct sockaddr *)&servaddr,sizeof(servaddr))) == 0 )
			{
				// make it a listening socket
				if ( (rc=lwip_listen(mServerSocket,mBacklog)) == 0 )
				{
					for(;;)
					{
						// wait for a connection
						if ( (client=lwip_accept(mServerSocket,NULL,NULL)) >= 0 )
						{
							CARIBOU::CTcpSocket* socket = new CARIBOU::CTcpSocket(client);
							debug_printf("accept: client=%d\n",client);
							if ( !fork(socket) )
							{
								delete socket;
								lwip_close(client);
							}
						}
						else
						{
							idle();
							acceptError(rc,errno);
						}
					}
				}
				else
				{
					listenError(rc,errno);
				}
			}
			else
			{
				bindError(rc,errno);
			}
		}
		else
		{
			socketError(rc,errno);
		}
		lwip_close(mServerSocket);
		mServerSocket=-1;
	}

}
