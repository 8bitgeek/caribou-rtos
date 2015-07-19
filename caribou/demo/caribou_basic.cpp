/***************************************************************************
 *	Copyright © 2005-2011 by Pike Aerospace Research Corporation		   *
 *	info@pikeaero.com													  *
 ***************************************************************************/
#include <caribou++.h>
#include <cedit.h>
#include <cvue.h>

unsigned char dhcpStack[512];

int main(int argc,char* argv[])
{
	CARIBOU::CCaribouMainThread::init();
    #if defined (CARIBOU_LWIP) /* FIXME */
		LwIP_Init();
		caribou_thread_create("dhcp",LwIP_DHCP_task,NULL,NULL,dhcpStack,512,CARIBOU_THREAD_NORMALPRIO);
	#endif
	CARIBOU_BASIC::CEdit edit("edit",stdin,1024*8,0);
	//CARIBOU_BASIC::CVue edit("edit",stdin,1024*8,0);
	edit.start();
	CARIBOU::CCaribouMainThread::run();
}
