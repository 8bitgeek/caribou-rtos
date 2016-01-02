/** ***************************************************************************
* (C) 2015 Accutron Instruments Inc.
******************************************************************************/
#include <caribou++.h>
#include <caribou++/cthread.h>

namespace Accutron
{
    class CWifi : public CARIBOU::CThread
    {
        public:
        CWifi(const char* name, uint16_t stksize=CARIBOU_THREAD_DEF_STKSZ, uint16_t priority=CARIBOU_THREAD_NORMALPRIO);
        virtual ~CWifi();

        virtual void run();
    };
}
