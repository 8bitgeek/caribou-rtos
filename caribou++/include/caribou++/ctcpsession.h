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
#ifndef _PIKEAERO_CTCPSESSION_H_
#define _PIKEAERO_CTCPSESSION_H_

#include <caribou++/cthread.h>
#include <caribou++/ctcpsocket.h>
#include <caribou++/cmutex.h>
#include <caribou++/clist.h>

namespace CARIBOU
{

	class CTcpSession : public CARIBOU::CThread
	{
		public:
			CTcpSession( const char* name="tcp", uint16_t stksize=1024, uint16_t priority=1 );
			virtual ~CTcpSession();

			virtual void							appendSocket(int socket);
			int										socketCount();
			CARIBOU::CTcpSocket*					socket();

		protected:

			virtual void							run();
			CARIBOU::CTcpSocket*					nextSocket();
			CARIBOU::CTcpSocket*					takeSocket();
			CARIBOU::CTcpSocket*					closeSocket(CARIBOU::CTcpSocket*);
			CARIBOU::CList<CARIBOU::CTcpSocket*>&	socketQueue();

		private:
			int										mSocketIndex;
			CARIBOU::CList<CARIBOU::CTcpSocket*>	mSocketQueue;
			uint32_t								mTimeoutValue;
			CARIBOU::CMutex							mMutex;
	};

}

#endif
