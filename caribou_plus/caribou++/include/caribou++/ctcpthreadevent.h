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
#ifndef CARIBOUCTCPEVENT_H
#define CARIBOUCTCPEVENT_H

#include "cevent.h"

namespace CARIBOU {

	class CTcpThreadEvent : public CEvent
	{
		public:
			typedef enum
			{
				msgNone,		/** Do Nothing */
				msgNew,			/** A new socket has been created */
				msgClose,		/** Close a socket */
				msgRead,		/** Read from a socket */
				msgWrite,		/** Write to a socket */
				msgPollRead,	/** Determine how many bytes are waiting to receive */
				msgPollWrite,	/** Determine how many bytes can be written */
			} tcp_msg_t;
			CTcpThreadEvent(CObject* sender);
			CTcpThreadEvent(CTcpThreadEvent* other)	{copy(*other);}
			CTcpThreadEvent(CTcpThreadEvent& other)	{copy(other);}
			virtual ~CTcpThreadEvent();
			virtual	void		copy(CTcpThreadEvent& other);

			void				setSocket(int socket)	{mSocket=socket;}
			int					socket()				{return mSocket;}

			void				setMessage(tcp_msg_t m)	{mMessage=m;}
			tcp_msg_t			message()				{return mMessage;}

			/// Tcp Server thread should acknowledge on startup (msgNew) otherwise, socket will be closed.
			void				acknowledge()			{mAcknowledged=true;}

		private:
			int					mSocket;
			tcp_msg_t			mMessage;
			bool				mAcknowledged;

	};

} /* namespace CARIBOU */

#endif
