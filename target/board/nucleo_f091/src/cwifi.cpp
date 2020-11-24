/** ***************************************************************************
* (C) 2015 Accutron Instruments Inc.
******************************************************************************/
#include <cwifi.h>

namespace Accutron
{
    #define inherited CARIBOU::CThread

    CWifi::CWifi(const char* name, uint16_t stksize, uint16_t priority)
    : inherited(name,stksize,priority)
    {
    }

    CWifi::~CWifi()
    {
    }


    void CWifi::run()
    {
        for(;;)
        {
            yield();
        }
    }
}
