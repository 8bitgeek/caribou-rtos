/***************************************************************************
 *   Copyright © 2005-2011 by Pike Aerospace Research Corporation          *
 *   info@pikeaero.com                                                     *
 ***************************************************************************/
#include "caribou++demo.h"

#define ESC	0x1B

namespace CARIBOU
{
	CMutex	CDemoThread::mMutex;

	#define inherited CThread

	/***************************************************************************
	*                    DEMO THREAD CONSTRUCTOR                               *
	****************************************************************************/
	CDemoThread::CDemoThread( const char* name, CIODevice* device, uint16_t stksize, uint16_t priority )
	: inherited(name,stksize,priority)
	, mTimer(NULL)
	, mDevice(device)
	{
		start();
	}

	/***************************************************************************
	*                    DEMO THREAD DESTRUCTOR                                *
	****************************************************************************/
	CDemoThread::~CDemoThread()
	{
	}

	/***************************************************************************
	*                    DEMO THREAD RUN METHOD                                *
	****************************************************************************/
	void CDemoThread::run()
	{
		int nAlloc=0;
		void* data;
		mTimer = this->startTimer(3000);
		mDevice->printf("%c[2J",ESC);
		while(true)
		{
			data = malloc((++nAlloc)*1024); if ( nAlloc > 15) nAlloc=0;

			mDevice->printf("%c[H",ESC);
			mDevice->printf("Heap: Size: %5d ", heap_bytes_free() + heap_bytes_used() );
			mDevice->printf("Free: %5d ", heap_bytes_free() );
			mDevice->printf("Used: %5d / %4d Blocks%c[K\r\n", heap_bytes_used(), heap_blocks_allocated(), ESC );
			mDevice->printf("------------------------------------------------------------\r\n");
			mDevice->printf("        TASK FLG PR  HEAP STKSZ STKUS RUNTIME\r\n");

			for( int n=0; n < count(); n++ )
			{
				CThread* thread = at(n);
				if ( thread != NULL )
				{
					long milliseconds = thread->runtime() * thread_timer_period();
					int hh = milliseconds / (1000*60*60);
					int mm = (milliseconds % (1000*60*60)) / (1000*60);
					int ss = ((milliseconds % (1000*60*60)) % (1000*60)) / 1000;
					CString status = thread->status();
					mDevice->printf("%12s %3s ", thread->name(), status.data() );
					mDevice->printf("%2d %5d %5d ", thread->priority(), thread->stacksize(), thread->stackusage() );
					mDevice->printf("%02d:%02d:%02d.%03d", hh,mm,ss, milliseconds % 1000 );
					mDevice->printf("%c[K\r\n",ESC);
				}
			}

			msdelay();				/* go to sleep */

			free(data);
		}
	}

	/***************************************************************************
	*                    DEMO THREAD EVENT HANDLER                             *
	****************************************************************************/
	void CDemoThread::event(CEvent* event)
	{
		if (event->type() == CEvent::TimerEvent && static_cast<CTimerEvent*>(event)->timerId() == mTimer )
		{
			wakeup(); /* come out of sleep */
		}
	}

} // namespace CARIBOU

