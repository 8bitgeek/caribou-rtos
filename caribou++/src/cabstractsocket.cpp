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
#include <caribou++/cabstractsocket.h>
#include <caribou/kernel/timer.h>
#include <lwip/sockets.h>

namespace CARIBOU
{
	CAbstractSocket::CAbstractSocket()
	: mSocket(-1)
	{
	}

	CAbstractSocket::CAbstractSocket(int socket)
	: mSocket(socket)
	{
	}

	CAbstractSocket::CAbstractSocket(int domain, int type, int protocol)
	{
		mSocket = lwip_socket(domain,type,protocol);
	}

	CAbstractSocket::CAbstractSocket(const CAbstractSocket& other)
	: mSocket(other.mSocket)
	{
	}

	CAbstractSocket::~CAbstractSocket()
	{
		close();
	}

	CAbstractSocket& CAbstractSocket::operator=( const CAbstractSocket& other )
	{
		mSocket = other.mSocket;
		return *this;
	}

	bool CAbstractSocket::operator==( CAbstractSocket& other )
	{
		return (other.mSocket == mSocket);
	}

	void CAbstractSocket::setRxTimeout(uint32_t ms)
	{
        int timeout = ms; /* msecs */
		lwip_setsockopt(mSocket, SOL_SOCKET, SO_RCVTIMEO, &timeout, sizeof(timeout));
	}

	uint32_t CAbstractSocket::rxTimeout( void )
	{
		int timeout = 0; /* msecs */
		socklen_t optlen = sizeof(timeout);
		lwip_getsockopt(mSocket, SOL_SOCKET, SO_RCVTIMEO, &timeout, &optlen);
		return timeout;
	}

	/// - 0, the remote host closed the connection
	/// - >0, data was received,
	/// - <0, there has been an error. To find out which error, you have to look
	/// Return the number of bytes available in the receive queue.
	bool CAbstractSocket::isOpen()
	{
		bool rc=false;
		if ( isValid() )
		{
			char t;
			int br = lwip_recv(mSocket,&t,1,MSG_DONTWAIT|MSG_PEEK);
			if ( br > 0 )
			{
				rc = true;
			}
			else if ( br < 0 )
			{
				rc = (errno == EAGAIN);
			}
		}
		return rc;
	}

	bool CAbstractSocket::isValid()
	{
		return ( mSocket >= 0 );
	}

	void CAbstractSocket::abort()
	{
		if ( isValid() )
		{
			lwip_shutdown(mSocket,SHUT_RDWR);
			close();
		}
	}

	/// Close the socket
	void CAbstractSocket::close()
	{
		if ( isValid() )
		{
			this->close(mSocket);
			mSocket=-1;
		}
	}

	/// Protected close socket
    void CAbstractSocket::close(int s)
	{
		int cnt;
		CARIBOU::CByteArray bytes;
		//setBlocking(s,true);
		//lwip_shutdown(s,SHUT_WR);
		while( (cnt=bytesAvailable(s)) > 0 )
		{
			read(s,bytes,cnt);
		}
		lwip_close(s);
	}


	/// Sutdown the socket
	void CAbstractSocket::shutdown(int mode)
	{
		if ( isValid() )
		{
			lwip_shutdown(mSocket,mode);
		}
	}

	/// Return the number of bytes available in the receive queue.
	// @return <0 on error (errno), return 0 upon other end disconnect
	int CAbstractSocket::bytesAvailable(uint32_t* ip,uint16_t* port)
	{
		int rc = bytesAvailable(mSocket,ip,port);
		return rc;
	}


	/// Return the number of bytes available in the receive queue.
	// @return <0 on error (errno), return 0 upon other end disconnect, < 0 socket closed
	int CAbstractSocket::bytesAvailable(int s,uint32_t* ip,uint16_t* port)
	{
		int rc;
		char t[32];
		struct sockaddr_in fromaddr;
		socklen_t fromlen=sizeof(struct sockaddr_in);
		rc = lwip_recvfrom(s,t,32,MSG_DONTWAIT|MSG_PEEK,(struct sockaddr*)&fromaddr,&fromlen);
		if ( rc > 0 )
		{
			if ( ip != NULL )
			{
				*ip = fromaddr.sin_addr.s_addr;
			}
			if ( port != NULL )
			{
				*port = fromaddr.sin_port;
			}
		}
		else if ( rc < 0 )
		{
			if ( errno == EAGAIN )
			{
				rc = 0;
			}
		}
		else
		{
			rc = (-1); // socket closed.
		}
		return rc;
	}

	/// Received bytes.
	/// In the BSD socket API, the recv() calls are used on a connected socket to receive data.
	/// A number of flags can be passed by the call to recv(). If the received message is larger
	/// than the supplied memory area, the excess data is silently discarded.
	/// @param buf Memory buffer to store received data.
	/// @param len Length to data to receiving.
	/// @param flags User shall use one of followings:
	///					MSG_PEEK - Peeks at an incoming message
    ///					MSG_DONTWAIT - Nonblocking i/o for this operation only
	///					MSG_MORE - Wait for more than one message
	int CAbstractSocket::recv(char* buf, int len, int flags)
	{
		int rc = lwip_recv(mSocket,buf,len,flags);
		return rc;
	}

	/// Received bytes.
	/// In the BSD socket API, the recv() calls are used on a connected socket to receive data.
	/// A number of flags can be passed by the call to recv(). If the received message is larger
	/// than the supplied memory area, the excess data is silently discarded.
	/// @param buf Memory buffer to store received data.
	/// @param len Length to data to receiving.
	/// @param flags User shall use one of followings:
	///					MSG_PEEK - Peeks at an incoming message
    ///					MSG_DONTWAIT - Nonblocking i/o for this operation only
	///					MSG_MORE - Wait for more than one message
	int CAbstractSocket::recv(CARIBOU::CByteArray& buf, int len, int flags)
	{
		int rc;
		buf.resize(len);
		rc = recv(buf.data(),len,flags);
		if ( rc >= 0 )
			buf.resize(rc);
		else
			buf.clear();
		return rc;
	}

	/// Sends bytes.
	/// This function is used in TCP connection for sending data. Before a call to lwip_send() the
	/// receiver of the data must have been set up using lwip_connect().
	/// @param buf Data buffer to send.
	/// @param len Size of the data; (-1) means a zero-terminated string
    /// @param flag User can use this flags:
	///			0x00 - No Flags
	///			MSG_PEEK - Peeks at an incoming message
    ///			MSG_DONTWAIT - Nonblocking i/o for this operation only
    ///			MSG_MORE - Sender will send more
    /// @return Number of bytes sent, -1 = Failure
	int CAbstractSocket::send(char* buf, int len, int flags)
	{
		int rc;
		if ( len < 0 )
			len = strlen(buf);
		rc = lwip_send(mSocket,buf,len,flags);
		return rc;
	}

	/// Sends bytes.
	/// This function is used in TCP connection for sending data. Before a call to lwip_send() the
	/// receiver of the data must have been set up using lwip_connect().
	/// @param buf Data buffer to send.
	/// @param len Size of the data.
    /// @param flag User can use this flags:
	///			0x00 - No Flags
	///			MSG_PEEK - Peeks at an incoming message
    ///			MSG_DONTWAIT - Nonblocking i/o for this operation only
    ///			MSG_MORE - Sender will send more
    /// @return Number of bytes sent, -1 = Failure
	int CAbstractSocket::send(CARIBOU::CByteArray& buf, int flags)
	{
		int rc = lwip_send(mSocket,buf.data(),buf.length(),flags);
		return rc;
	}

	/// Peeks bytes received.
	/// In the BSD socket API, the read() function are used on a connected socket to receive data.
	/// If the received message is larger than the supplied memory area, the excess data is silently discarded.
	int CAbstractSocket::peek(char* buf, int len)
	{
		int rc = lwip_recv(mSocket,buf,len,MSG_DONTWAIT|MSG_PEEK);
		return rc <= 0 ? 0 :rc;
	}



	/// Reads bytes received.
	/// In the BSD socket API, the read() function are used on a connected socket to receive data.
	/// If the received message is larger than the supplied memory area, the excess data is silently discarded.
	int CAbstractSocket::read(char* buf, int len)
	{
		int rc = lwip_read(mSocket,buf,len);
		return rc;
	}

	/// Reads bytes received.
	/// In the BSD socket API, the read() function are used on a connected socket to receive data.
	/// If the received message is larger than the supplied memory area, the excess data is silently discarded.
	int CAbstractSocket::read(CARIBOU::CByteArray& buf, int len)
	{
		int rc;
		buf.resize(len);
		rc = read(buf.data(),len);
		if ( rc >= 0 )
			buf.resize(rc);
		else
			buf.clear();
		return rc;
	}

	/// static protected Reads bytes received.
	/// In the BSD socket API, the read() function are used on a connected socket to receive data.
	/// If the received message is larger than the supplied memory area, the excess data is silently discarded.
	int CAbstractSocket::read(int s,CARIBOU::CByteArray& buf, int len)
	{
		int rc;
		buf.resize(len);
		rc = lwip_read(s,buf.data(),len);
		if ( rc >= 0 )
			buf.resize(rc);
		else
			buf.clear();
		return rc;
	}

	/// Reads bytes received.
	/// In the BSD socket API, the read() function are used on a connected socket to receive data.
	/// If the received message is larger than the supplied memory area, the excess data is silently discarded.
	/// @param timeout The time to wait for recieved data in miliseconds.
	int CAbstractSocket::read(CARIBOU::CByteArray& buf, int len, int timeout)
	{
		char t[64];
		int rc=0;

		caribou_tick_t start = (uint32_t)from_ms(caribou_timer_ticks());
		buf.clear();
		while ( !caribou_timer_ticks_timeout(start,from_ms(timeout)) && (len == 0 || (int)buf.length() < len) )
		{
			int nBytes = lwip_recv(mSocket,t,64,MSG_DONTWAIT);
			if ( nBytes > 0 )
			{
				if ( len == 0 )
				{
					char* dst;
					int pos = buf.length();
					buf.resize(buf.length()+nBytes);
					dst = &(buf.data()[pos]);
					memcpy(dst,t,nBytes);
				}
				else
				{
					char* dst;
					int pos = buf.length();
					int nRemaining = len - buf.length();
					int nRead = nBytes > nRemaining ? nRemaining : nBytes;
					buf.resize(buf.length()+nRead);
					dst = &(buf.data()[pos]);
					memcpy(dst,t,nBytes);
				}
			}
			else if ( len == 0 && buf.length() )
			{
				// undetermined max length, we already read some data, and none is available, so we're done..
				break;
			}
			else
			{
				caribou_thread_yield();
			}
		}
		return rc < 0 ? rc : buf.length();
	}


	/// Sends data on a connection.
	/// This function is used in TCP connection for sending data. Before a call to write() the receiver of
	/// the data must have been set up using connect().
	/// This function is equvalent to the send() function.
	int CAbstractSocket::write(char* buf, int len)
	{
		int rc = lwip_write(mSocket,buf,len);
		#if CARIBOU_SEND_SOCKET_YIELD
			caribou_thread_yield(); /* allow the ethernetif thread to drain the output ASAP */
		#endif
		return rc;
	}

	/// Sends data on a connection.
	/// This function is used in TCP connection for sending data. Before a call to write() the receiver of
	/// the data must have been set up using connect().
	/// This function is equvalent to the send() function.
	int CAbstractSocket::write(CByteArray& buf)
	{
		int rc = write(buf.data(),buf.length());
		#if CARIBOU_SEND_SOCKET_YIELD
			caribou_thread_yield(); /* allow the ethernetif thread to drain the output ASAP */
		#endif
		return rc;
	}

	/// Return the host address of the local socket as a string
	CARIBOU::CString CAbstractSocket::addressString(uint32_t ip)
	{
		CARIBOU::CString rc;
		rc.sprintf("%d.%d.%d.%d",ip>>24,(ip>>16)&0xFF,(ip>>8)&0xFF,ip&0xFF);
		return rc;
	}
	/// Return the host address of the local socket as a string
	CARIBOU::CString CAbstractSocket::localAddressString()
	{
		return addressString(localAddress());
	}

	/// Return the host address of the local socket as a string
	CARIBOU::CString CAbstractSocket::peerAddressString()
	{
		return addressString(peerAddress());
	}

	/// Returns the host address of the local socket if available; otherwise returns NULL.
	/// This is normally the main IP address of the host, but can be (127.0.0.1) for connections to the local host.
	uint32_t CAbstractSocket::localAddress()
	{
		uint32_t rc=0;
		if ( isValid() )
		{
			struct sockaddr_in sa;
			socklen_t sa_len = (socklen_t)sizeof(sa);
			if ( lwip_getsockname(mSocket, (struct sockaddr*)&sa, &sa_len) == 0 )
			{
				rc = lwip_ntohl(sa.sin_addr.s_addr);
			}
		}
		return rc;
	}

	/// Returns the host port number (in native byte order) of the local socket if available; otherwise returns 0.
	uint16_t CAbstractSocket::localPort()
	{
		uint16_t rc=0;
		if ( isValid() )
		{
			struct sockaddr_in sa;
			socklen_t sa_len = (socklen_t)sizeof(sa);
			if ( lwip_getsockname(mSocket, (struct sockaddr*)&sa, &sa_len) == 0 )
			{
				rc = lwip_ntohs(sa.sin_port);
			}
		}
		return rc;
	}

	/// Returns the address of the connected peer if the socket is in ConnectedState; otherwise returns Null.
	uint32_t CAbstractSocket::peerAddress()
	{
		uint32_t peerIp=0;
		if ( isValid() )
		{
			struct sockaddr_in peer;
			socklen_t peer_len = (socklen_t)sizeof(peer);
			if ( lwip_getpeername(mSocket, (struct sockaddr*)&peer, &peer_len) == 0 )
			{
				peerIp = lwip_ntohl(peer.sin_addr.s_addr);
			}
		}
		return peerIp;
	}

	/// Returns the port of the connected peer if the socket is in ConnectedState; otherwise returns 0.
	uint16_t CAbstractSocket::peerPort()
	{
		uint16_t rc=0;
		if ( isValid() )
		{
			struct sockaddr_in peer;
			socklen_t peer_len = (socklen_t)sizeof(peer);
			if ( lwip_getpeername(mSocket, (struct sockaddr*)&peer, &peer_len) == 0 )
			{
				rc = lwip_ntohs(peer.sin_port);
			}
		}
		return rc;
	}

	/// Set or clear socket blocking mode
	/// Return true on success
	bool CAbstractSocket::setBlocking(bool blocking)
	{
		bool rc = false;
		if ( isValid() )
		{
			rc = setBlocking(mSocket,blocking);
		}
		return rc;
	}

	/// Static protected Set or clear socket blocking mode
	/// Return true on success
	bool CAbstractSocket::setBlocking(int s, bool blocking)
	{
		bool rc = false;
		int flags = lwip_fcntl(s, F_GETFL, 0);
		rc = (lwip_fcntl(s,F_SETFL,blocking ? (flags & ~O_NONBLOCK) : (flags | O_NONBLOCK) ) == 0 );
		return rc;
	}

	/// Return current blocking mode
	bool CAbstractSocket::blocking()
	{
		bool rc=false;
		if ( isValid() )
			rc = (lwip_fcntl(mSocket, F_GETFL, 0) & O_NONBLOCK) ? false : true;
		return rc;
	}

	bool CAbstractSocket::setNoDelay(bool noDelay)
	{
		int flag = noDelay?1:0;
		int result = lwip_setsockopt(mSocket,          /* socket affected */
									 IPPROTO_TCP,     /* set option at TCP level */
									 TCP_NODELAY,     /* name of option */
									 (char *) &flag,  /* the cast is historical cruft */
									 sizeof(int));    /* length of option value */
		return result >= 0;
	}

	bool CAbstractSocket::noDelay()
	{
		int flag;
		socklen_t len = sizeof(flag);
		lwip_getsockopt(mSocket,          /* socket affected */
						 IPPROTO_TCP,     /* set option at TCP level */
						 TCP_NODELAY,     /* name of option */
						 (char *) &flag,  /* the cast is historical cruft */
						 &len);    /* length of option value */
		return flag?true:false;
	}

	int CAbstractSocket::accept()
	{
		int rc = lwip_accept(mSocket, NULL, NULL);
		return rc;
	}

	int CAbstractSocket::listen(int backlog)
	{
		int rc = lwip_listen(mSocket,backlog);
		return rc;
	}

	int CAbstractSocket::bind(CARIBOU::CString host, uint16_t port)
	{
		int rc=(-1);
		mSocket = lwip_socket(AF_INET, SOCK_STREAM, 0);
		if( mSocket >= 0 )
		{
			struct sockaddr_in sLocalAddr;

			memset((char *)&sLocalAddr, 0, sizeof(sLocalAddr));

			/*Source*/
			sLocalAddr.sin_family = AF_INET;
			sLocalAddr.sin_len = sizeof(sLocalAddr);
			if ( host.length() )
				sLocalAddr.sin_addr.s_addr = inet_addr(host.data());  /* FIXME */
			else
				sLocalAddr.sin_addr.s_addr = inet_addr("10.84.4.201");  /* FIXME (any or default) */
			sLocalAddr.sin_port = PP_HTONS(port);

			/* bind to local port */
			rc=lwip_bind(mSocket, (struct sockaddr *)&sLocalAddr, sizeof(sLocalAddr));
		}
		return rc;
	}

	int CAbstractSocket::connectToHost(CString host, uint16_t port, uint16_t hostPort)
	{
		int rc(-1);
		struct sockaddr_in sDestAddr;

		/* bind to local port */
		if ( (rc=bind(localAddressString(),hostPort)) == 0 )
		{
			/* connect */
			memset((char *)&sDestAddr, 0, sizeof(sDestAddr));

			/*Destination*/
			sDestAddr.sin_family = AF_INET;
			sDestAddr.sin_len = sizeof(sDestAddr);
			sDestAddr.sin_addr.s_addr = inet_addr(host.data());
			sDestAddr.sin_port = PP_HTONS(port);

			rc = lwip_connect(mSocket, (struct sockaddr*)&sDestAddr, sizeof(sDestAddr));
		}
		return rc;
	}

	void CAbstractSocket::disconnectFromHost()
	{
		close();
	}

}

