/** ***************************************************************************
* @file cwebsocketserver.cpp
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
#include <caribou++/cwebsocketserver.h>
#include <caribou++/cwebsocketsession.h>
#include <caribou++/cwebsocket.h>
#include <lwip/sockets.h>

namespace CARIBOU
{
	#define inherited CARIBOU::CTcpServer

	CWebSocketServer::CWebSocketServer(uint16_t port, uint32_t interface, int backlog, char* name, uint16_t stksize, uint16_t priority)
	: inherited(port,interface,backlog,name,stksize,priority)
	{
	}

	CWebSocketServer::~CWebSocketServer()
	{
	}

	/**
	 * @brief Fork a WebSockets session...
	 */
	bool CTcpServer::fork(int socket)
	{
		bool rc = false;
		if ( socket >= 0 )
		{
			CWebSocketSession* session = new CWebSocketSession(	socket );
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
			servaddr.sin_addr.s_addr = htonl(mInterface);
			servaddr.sin_port        = htons(mPort);
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
							//printf("accept: client=%d\n",client);
							if ( !fork(client) )
							{
								lwip_close(client);
							}
						}
						else
						{
							if ( errno == EAGAIN )
							{
								idle();
							}
							else
							{
								printf("accept rc=%d errno=%d\r\n",rc,errno);
							}
						}
					}
				}
				else
				{
					printf("listen rc=%d errno=%d\r\n",rc,errno);
				}
			}
			else
			{
				printf("bind errno=%d\r\n",errno);
			}
		}
		else
		{
			printf("socket errno=%d\r\n",errno);
		}
		lwip_close(mServerSocket);
		mServerSocket=-1;
	}


}
