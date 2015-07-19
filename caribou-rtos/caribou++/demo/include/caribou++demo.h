/***************************************************************************
 *   Copyright © 2005-2011 by Pike Aerospace Research Corporation          *
 *   info@pikeaero.com                                                     *
 ***************************************************************************/
#include "caribou++.h"
#include "cbytearray.h"
#include "cthread.h"
#include "ctimerevent.h"
#include "ciodevice.h"
#include "cmutex.h"

namespace CARIBOU
{

	/***************************************************************************
	*                    DEMO THREAD CLASS                                     *
	****************************************************************************/
	class CDemoThread : public CARIBOU::CThread
	{
		public:
			CDemoThread( const char* name, CIODevice* device, uint16_t stksize=512, uint16_t priority=NORMALPRIO );
			virtual ~CDemoThread();

			virtual void		run();

		protected:
			virtual void		event(CARIBOU::CEvent* event);

		private:
			void*				mTimer;
			CIODevice*			mDevice;
			static CMutex		mMutex;
	};

} // namespace CARIBOU

