#ifndef _PIKEAERO_CTCPECHOSESSION_H_
#define _PIKEAERO_CTCPECHOSESSION_H_

#include <caribou++/ctcpsession.h>
#include <caribou++/ctcpsocket.h>

namespace PikeAero
{
	class CTcpEchoSession : public CARIBOU::CTcpSession
	{
		public:
	
			CTcpEchoSession(	
                            int sockfd, 
                            const char* name="tcp", 
                            size_t stksize=1024, 
                            uint16_t priority=1, 
                            uint16_t watchdog_count=0
						);
			virtual ~CTcpEchoSession();

			virtual void	run();

		private:

            void            enter();
            void            leave();

	};

}

#endif
