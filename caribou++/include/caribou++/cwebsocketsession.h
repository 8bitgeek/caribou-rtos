/** ***************************************************************************
* @file cwebsocketsession.h
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
#ifndef _CARIBOU_CWEBSOCKETSESSION_H_
#define _CARIBOU_CWEBSOCKETSESSION_H_

#include <caribou++/ctcpsession.h>
#include <caribou++/cwebsocket.h>

namespace CARIBOU
{

	class CWebSocketSession : public CARIBOU::CThread
	{
		public:
			CWebSocketSession( int socket, const char* name="websock", uint16_t stksize=1024, uint16_t priority=1 );
			virtual ~CWebSocketSession();

		protected:

			virtual void			run();

		private:
			CARIBOU::CWebSocket*	mSocket;
	};

}

#endif /* _CARIBOU_CWEBSOCKETSESSION_H_ */
