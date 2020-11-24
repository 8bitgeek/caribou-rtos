#include <chttpformsession.h>
#include <csettings.h>
#include <chttpstring.h>
#include <coctetarray.h>
#include <caribou++/cfile.h>
#include <syslog_printf.h>

namespace MineAirQuality
{
	#define inherited MineAirQuality::CHttpSession

	CHttpFormSession::CHttpFormSession( 
								int sockfd, 
								const char* name, 
								size_t stksize, 
								uint16_t priority,
                                uint16_t watchdog_count
							  )
	: inherited(sockfd,(char*)name,stksize,priority,watchdog_count)
	{
	}

	CHttpFormSession::~CHttpFormSession()
	{
	}

	void CHttpFormSession::enter()
	{
		inherited::enter();
	}

	void CHttpFormSession::leave()
	{
		inherited::leave();
	}


	void CHttpFormSession::renderBody()
	{
        CARIBOU::CFile file( "index.htm" );
        if ( file.open(FA_READ) )
        {
            while ( !file.eof() )
            {
                CARIBOU::CString line;
                file.readline(line,255);
                send(line);
            }
            file.close();
        }
        else
        {
            render404();
        }
	}

}

