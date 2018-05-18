/******************************************************************************
* Copyright © 2005-2013 by Pike Aerospace Research Corporation
* All Rights Reserved
*
*   This file is part of CARIBOU RTOS
*
*   CARIBOU RTOS is free software: you can redistribute it and/or modify
*   it under the terms of the Beerware License Version 43.
*
* ----------------------------------------------------------------------------
* "THE BEER-WARE LICENSE" (Revision 43):
* <mike@pikeaero.com> wrote this file. As long as you retain this notice you
* can do whatever you want with this stuff. If we meet some day, and you think
* this stuff is worth it, you can buy me a beer in return ~ Mike Sharkey
* ----------------------------------------------------------------------------
******************************************************************************/
#include <board.h>
#include <netif/ethernetif.h>
#include <caribou/kernel/types.h>
#include <caribou/lib/errno.h>
#include <caribou/lib/string.h>
#include <caribou/lib/semaphore.h>
#include <caribou/lib/queue.h>
#include <lwip/opt.h>
#include <lwip/def.h>
#include <lwip/mem.h>
#include <lwip/pbuf.h>
#include <lwip/sys.h>
#include <netif/etharp.h>
#include <csettings.h>
#include <inc/hw_memmap.h>
#include <inc/hw_ethernet.h>
#include <driverlib/ethernet.h>
#include <lwip/timers.h>

/// translate a lwip err to an errno
int lwip_errno(int err)
{
	int rc=0;
	switch(err)
	{
		case ERR_MEM:			rc=ENOMEM;			break;	/* Out of memory error.     */
		case ERR_BUF:			rc=ENOSR;			break;	/* Buffer error.            */
		case ERR_TIMEOUT:		rc=ETIME;			break;	/* Timeout.                 */
		case ERR_RTE:			rc=EHOSTUNREACH;	break;	/* Routing problem.         */
		case ERR_INPROGRESS:	rc=EINPROGRESS;		break;	/* Operation in progress    */
		case ERR_VAL:			rc=EINVAL;			break;	/* Illegal value.           */
		case ERR_WOULDBLOCK:	rc=EAGAIN;			break;	/* Operation would block.   */
		case ERR_USE:			rc=EADDRINUSE;		break;	/* Address in use.          */
		case ERR_ISCONN:		rc=EISCONN;			break;	/* Already connected.       */
		case ERR_ABRT:			rc=ECONNABORTED;	break;	/* Connection aborted.      */
		case ERR_RST:			rc=ENETRESET;		break;	/* Connection reset.        */
		case ERR_CLSD:			rc=ENOTCONN;		break;	/* Connection closed.       */
		case ERR_CONN:			rc=ENOTCONN;		break;	/* Not connected.           */
		case ERR_ARG:			rc=EINVAL;			break;	/* Illegal argument.        */
		case ERR_IF:			rc=EIO;				break;	/* Low-level netif error    */
		default:				rc=err;				break;
	}
	errno = rc;
	return rc;
}

