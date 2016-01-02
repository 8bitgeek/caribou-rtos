/** ***************************************************************************
* @file
* @author Mike Sharkey <mike@pikeaero.com>.
* @copyright © 2005-2013 by Pike Aerospace Research Corporation
* @copyright © 2014-2015 by Mike Sharkey
* @details This file is part of CARIBOU RTOS
* CARIBOU RTOS is free software: you can redistribute it and/or modify
* it under the terms of the Beerware License Version 43.
* "THE BEER-WARE LICENSE" (Revision 43):
* Mike Sharkey <mike@pikeaero.com> wrote this file. 
* As long as you retain this notice you can do whatever you want with
* this stuff. If we meet some day, and you think this stuff is 
* worth it, you can buy me a beer in return ~ Mike Sharkey
******************************************************************************/
#include <caribou/lib/errno.h>
#include <caribou/kernel/thread.h>
#include <caribou/lib/stdio.h>

errno_t errno=0;

#ifdef __ARM_EABI__
volatile int * __attribute__((weak)) __aeabi_errno_addr(void)
{
	return &errno;
}

const int __aeabi_EDOM=1;
#endif

char * strerror(int errnum)
{
    char* reason = "(null)";
    #if defined(CARIBOU_PERROR)
        switch( errno )
        {
            case EOKAY:			reason = "No error";					break;
            case EPERM:			reason = "Operation not permitted";		break;
            case ENOENT:		reason = "No such file or directory";	break;
            case ESRCH:			reason = "No such process";				break;
            case EINTR:			reason = "Interrupted system call";		break;
            case EIO:			reason = "I/O error";					break;
            case ENXIO:			reason = "No such device or address";	break;
            case E2BIG:			reason = "Argument list too long";		break;
            case ENOEXEC:		reason = "Exec format error";			break;
            case EBADF:			reason = "Bad file number";				break;
            case ECHILD:		reason = "No child processes";			break;
            case ENOMEM:		reason = "Out of memory";				break;
            case EACCES:		reason = "Permission denied";			break;
            case EFAULT:		reason = "Bad address";					break;
            case ENOTBLK:		reason = "Block device required";		break;
            case EBUSY:			reason = "Device or resource busy";		break;
            case EEXIST:		reason = "File exists";					break;
            case EXDEV:			reason = "Cross-device link";			break;
            case ENODEV:		reason = "No such device";				break;
            case ENOTDIR:		reason = "Not a directory";				break;
            case EISDIR:		reason = "Is a directory";				break;
            case EINVAL:		reason = "Invalid argument";			break;
            case ENFILE:		reason = "File table overflow";			break;
            case EMFILE:		reason = "Too many open files";			break;
            case ENOTTY:		reason = "Not a typewriter";			break;
            case ETXTBSY:		reason = "Text file busy";				break;
            case EFBIG:			reason = "File too large";				break;
            case ENOSPC:		reason = "No space left on device";		break;
            case ESPIPE:		reason = "Illegal seek";				break;
            case EROFS:			reason = "Read-only file system";		break;
            case EMLINK:		reason = "Too many links";				break;
            case EPIPE:			reason = "Broken pipe";					break;
            case EDOM:			reason = "Math argument out of domain of func"; break;
            case ERANGE:		reason = "Math result not representable"; break;
            case EDEADLK:		reason = "Resource deadlock would occur"; break;
            case ENAMETOOLONG:	reason = "File name too long";			break;
            case ENOLCK:		reason = "No record locks available";	break;
            case ENOSYS:		reason = "Function not implemented";	break;
            case ENOTEMPTY:		reason = "Directory not empty";			break;
            case ELOOP:			reason = "Too many symbolic links encountered"; break;
            case EWOULDBLOCK:	reason = "Operation would block";		break;
            case ENOMSG:		reason = "No message of desired type";	break;
            case EIDRM:			reason = "Identifier removed";			break;
            case ECHRNG:		reason = "Channel number out of range"; break;
            case EL2NSYNC:		reason = "Level 2 not synchronized";	break;
            case EL3HLT:		reason = "Level 3 halted";				break;
            case EL3RST:		reason = "Level 3 reset";				break;
            case ELNRNG:		reason = "Link number out of range";	break;
            case EUNATCH:		reason = "Protocol driver not attached"; break;
            case ENOCSI:		reason = "No CSI structure available";	break;
            case EL2HLT:		reason = "Level 2 halted";				break;
            case EBADE:			reason = "Invalid exchange";			break;
            case EBADR:			reason = "Invalid request descriptor";	break;
            case EXFULL:		reason = "Exchange full";				break;
            case ENOANO:		reason = "No anode";					break;
            case EBADRQC:		reason = "Invalid request code";		break;
            case EBADSLT:		reason = "Invalid slot";				break;
            case EBFONT:		reason = "Bad font file format";		break;
            case ENOSTR:		reason = "Device not a stream";			break;
            case ENODATA:		reason = "No data available";			break;
            case ETIME:			reason = "Timer expired";				break;
            case ENOSR:			reason = "Out of streams resources";	break;
            case ENONET:		reason = "Machine is not on the network"; break;
            case ENOPKG:		reason = "Package not installed";		break;
            case EREMOTE:		reason = "Object is remote";			break;
            case ENOLINK:		reason = "Link has been severed";		break;
            case EADV:			reason = "Advertise error";				break;
            case ESRMNT:		reason = "Srmount error";				break;
            case ECOMM:			reason = "Communication error on send"; break;
            case EPROTO:		reason = "Protocol error";				break;
            case EMULTIHOP:		reason = "Multihop attempted";			break;
            case EDOTDOT:		reason = "RFS specific error";			break;
            case EBADMSG:		reason = "Not a data message";			break;
            case EOVERFLOW:		reason = "Value too large for defined data type"; break;
            case ENOTUNIQ:		reason = "Name not unique on network";	break;
            case EBADFD:		reason = "File descriptor in bad state"; break;
            case EREMCHG:		reason = "Remote address changed";		break;
            case ELIBACC:		reason = "Can not access a needed shared library"; break;
            case ELIBBAD:		reason = "Accessing a corrupted shared library"; break;
            case ELIBSCN:		reason = ".lib section in a.out corrupted"; break;
            case ELIBMAX:		reason = "Attempting to link in too many shared libraries"; break;
            case ELIBEXEC:		reason = "Cannot exec a shared library directly"; break;
            case EILSEQ:		reason = "Illegal byte sequence";		break;
            case ERESTART:		reason = "Interrupted system call should be restarted"; break;
            case ESTRPIPE:		reason = "Streams pipe error";			break;
            case EUSERS:		reason = "Too many users";				break;
            case ENOTSOCK:		reason = "Socket operation on non-socket"; break;
            case EDESTADDRREQ:	reason = "Destination address required"; break;
            case EMSGSIZE:		reason = "Message too long"; break;
            case EPROTOTYPE:	reason = "Protocol wrong type for socket"; break;
            case ENOPROTOOPT:	reason = "Protocol not available"; break;
            case EPROTONOSUPPORT: reason = "Protocol not supported"; break;
            case ESOCKTNOSUPPORT: reason = "Socket type not supported"; break;
            case EOPNOTSUPP:	reason = "Operation not supported on transport endpoint"; break;
            case EPFNOSUPPORT:	reason = "Protocol family not supported"; break;
            case EAFNOSUPPORT:	reason = "Address family not supported by protocol"; break;
            case EADDRINUSE:	reason = "Address already in use"; break;
            case EADDRNOTAVAIL:	reason = "Cannot assign requested address"; break;
            case ENETDOWN:		reason = "Network is down"; break;
            case ENETUNREACH:	reason = "Network is unreachable"; break;
            case ENETRESET:		reason = "Network dropped connection because of reset"; break;
            case ECONNABORTED:	reason = "Software caused connection abort"; break;
            case ECONNRESET:	reason = "Connection reset by peer"; break;
            case ENOBUFS:		reason = "No buffer space available"; break;
            case EISCONN:		reason = "Transport endpoint is already connected"; break;
            case ENOTCONN:		reason = "Transport endpoint is not connected"; break;
            case ESHUTDOWN:		reason = "Cannot send after transport endpoint shutdown"; break;
            case ETOOMANYREFS:	reason = "Too many references: cannot splice"; break;
            case ETIMEDOUT:		reason = "Connection timed out"; break;
            case ECONNREFUSED:	reason = "Connection refused"; break;
            case EHOSTDOWN:		reason = "Host is down"; break;
            case EHOSTUNREACH:	reason = "No route to host"; break;
            case EALREADY:		reason = "Operation already in progress"; break;
            case EINPROGRESS:	reason = "Operation now in progress"; break;
            case ESTALE:		reason = "Stale NFS file handle"; break;
            case EUCLEAN:		reason = "Structure needs cleaning"; break;
            case ENOTNAM:		reason = "Not a XENIX named type file"; break;
            case ENAVAIL:		reason = "No XENIX semaphores available"; break;
            case EISNAM:		reason = "Is a named type file"; break;
            case EREMOTEIO:		reason = "Remote I/O error"; break;
            case EDQUOT:		reason = "Quota exceeded"; break;
            case ENOMEDIUM:		reason = "No medium found"; break;
            case EMEDIUMTYPE:	reason = "Wrong medium type"; break;
            case ECANCELED:		reason = "Operation Canceled"; break;
            case ENOKEY:		reason = "Required key not available"; break;
            case EKEYEXPIRED:	reason = "Key has expired"; break;
            case EKEYREVOKED:	reason = "Key has been revoked"; break;
            case EKEYREJECTED:	reason = "Key was rejected by service"; break;
            case EOWNERDEAD:	reason = "Owner died"; break;
            case ENOTRECOVERABLE: reason = "State not recoverable"; break;
            case ERFKILL:		reason = "Operation not possible due to RF-kill"; break;
            case EHWPOISON:		reason = "Memory page has hardware error"; break;
        }
    #endif
	return reason;
}

void perror(char* s)
{
    #if defined(CARIBOU_PERROR)
        char* reason = strerror(errno);
        fprintf( stderr, "%s [%s:%d] %s\n", s, caribou_thread_current()->name, errno, reason);
    #endif
}
