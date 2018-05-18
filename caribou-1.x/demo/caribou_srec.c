/***************************************************************************
 *	Copyright © 2005-2011 by Pike Aerospace Research Corporation		   *
 *	info@pikeaero.com													   *
 ***************************************************************************/

#include <caribou.h>
#include "srecreader.h"

#define SREC_IDENT	"PRIMARY/M"		/* Primary Loader / M Series */
#define	SREC_RX_TIMEOUT	1000

#define SREC_THREAD_STACK_SIZE	(1024*2)

char stack_srec_thread[SREC_THREAD_STACK_SIZE];

int main(int argc,char* argv[])
{
	srec_reader_t srec_reader_data;
	caribou_init(0);
	srec_reader_data.io = stderr;
	srec_reader_data.ident = SREC_IDENT;
	srec_reader_data.timeout = SREC_RX_TIMEOUT;
	caribou_thread_create("srec_reader",srec_reader,NULL,&srec_reader_data,stack_srec_thread,SREC_THREAD_STACK_SIZE,0);
	caribou_exec();
}
                                          