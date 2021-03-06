/** ***************************************************************************
* @file ctcpsession.h
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
#ifndef _CARIBOU_CTCPSESSION_H_
#define _CARIBOU_CTCPSESSION_H_

#include <caribou++/cthread.h>
#include <caribou++/ctcpsocket.h>

namespace CARIBOU
{

	class CTcpSession : public CARIBOU::CThread
	{
		public:
			CTcpSession( int sockfd, const char* name="tcp", size_t stksize=1024, uint16_t priority=1, uint16_t watchdog_count=0 );
			virtual ~CTcpSession();

			virtual void					run();

		protected:

			virtual CARIBOU::CTcpSocket*	socket();

		private:
			CARIBOU::CTcpSocket*			mSocket;
	};

}

#endif
