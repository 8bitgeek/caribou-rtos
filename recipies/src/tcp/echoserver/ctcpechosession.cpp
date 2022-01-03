#include <ctcpechosession.h>
#include <caribou/lib/stdio.h>
#include <caribou++/cbytearray.h>
#include <syslog_printf.h>

namespace PikeAero
{
	#define inherited CARIBOU::CTcpSession

	CTcpEchoSession::CTcpEchoSession( 
								int sockfd, 
								const char* name, 
								size_t stksize, 
								uint16_t priority,
                                uint16_t watchdog_count
							  )
	: inherited(sockfd,(char*)name,stksize,priority)
	{
	}

	CTcpEchoSession::~CTcpEchoSession()
	{
	}

	void CTcpEchoSession::run()
	{
		enter();
		while ( socket()->isOpen() )
		{
			int bytes_available = socket()->bytesAvailable();
			if ( bytes_available > 0 )
			{
				CARIBOU::CByteArray buf;
				socket()->recv(buf,bytes_available);
				socket()->write(buf);
			}
		}
		leave();
	}

    void CTcpEchoSession::enter()
    {
        SYSLOG_PRINTF( NULL, SYSLOG_DEBUG, "enter");
    }

    void CTcpEchoSession::leave()
    {
        SYSLOG_PRINTF( NULL, SYSLOG_DEBUG, "leave");
    }

}

