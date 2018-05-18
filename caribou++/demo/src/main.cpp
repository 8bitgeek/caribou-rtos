/***************************************************************************
 *   Copyright © 2005-2011 by Pike Aerospace Research Corporation          *
 *   info@pikeaero.com                                                     *
 ***************************************************************************/
#include "caribou++.h"
#include "caribou++demo.h"

#include "cuart.h"

/***************************************************************************
*                    MAIN ENTRY POINT                                      *
****************************************************************************/
int main(int argc,char* argv[])
{
	// have to initialize CARIBOU first, including main thread priority...
	caribou_plusplus_init(0);

	new CARIBOU::CDemoThread( "thread#0", new CARIBOU::CUart(0), 720 ); // thread[0] <-> uart[0]
	new CARIBOU::CDemoThread( "thread#1", new CARIBOU::CUart(1), 720, NORMALPRIO+2 ); // thread[1] <-> uart[1]

	/* Never to return... */
	caribou_plusplus_exec(); // main thread idle loop.
}
