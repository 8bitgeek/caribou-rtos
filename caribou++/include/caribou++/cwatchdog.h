/** ***************************************************************************
* @file
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
#ifndef _CARIBOU_CWATCHDOG_H_
#define _CARIBOU_CWATCHDOG_H_

#include <caribou++.h>
#include <caribou++/cobject.h>
#include <caribou++/cthread.h>
#include <caribou++/clist.h>
#include <caribou++/cmutex.h>

namespace CARIBOU
{
	class CWatchdog
	{
		public:

			static bool				registerThread(caribou_thread_t* thread);
			static void				unregisterThread(caribou_thread_t* thread);
			static void				checkin(caribou_thread_t* thread);

		private:

			typedef struct
			{
				caribou_thread_t*	thread;
				bool				checkin;
			} thread_watch_t;

			static thread_watch_t*	newThreadWatch(caribou_thread_t* thread);
			static void				deleteThreadWatch(caribou_thread_t* thread);
			static thread_watch_t*	lookup(caribou_thread_t* thread);
			static void				punchin();
			
			static CARIBOU::CList<thread_watch_t*>	mWatches;
			static CARIBOU::CMutex					mMutex;
	};
}


#endif /* _CARIBOU_CWATCHDOG_H_ */
