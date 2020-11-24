#include <board.h>

#include <hw_dma.h>
#include <hw_exti.h>
#include <hw_pin.h>
#include <hw_usart.h>
#include <hw_dac.h>
#include <hw_tim.h>
#include <hw_opamp.h>
#include <hw_adc.h>

#include <lwip/errno.h>

extern char* board_get_hostname( void )
{
	/* FIXME - retrieve from NV memory */
	return "pa2500";
}

extern void early_init( void )
{
	hw_clocks_setup();
	hw_pin_setup();
	hw_gpio_setup();
}

extern void late_init( void )
{
	hw_usart_setup();
    hw_exti_setup();
   	hw_adc_setup();
}

int lwip_errno(int err)
{
	int rc=err;
	// switch(err)
	// {
	// 	case ERR_MEM:			rc=ENOMEM;			break;	/* Out of memory error.     */
	// 	case ERR_BUF:			rc=ENOSR;			break;	/* Buffer error.            */
	// 	case ERR_TIMEOUT:		rc=ETIME;			break;	/* Timeout.                 */
	// 	case ERR_RTE:			rc=EHOSTUNREACH;	break;	/* Routing problem.         */
	// 	case ERR_INPROGRESS:	rc=EINPROGRESS;		break;	/* Operation in progress    */
	// 	case ERR_VAL:			rc=EINVAL;			break;	/* Illegal value.           */
	// 	case ERR_WOULDBLOCK:	rc=EAGAIN;			break;	/* Operation would block.   */
	// 	case ERR_USE:			rc=EADDRINUSE;		break;	/* Address in use.          */
	// 	case ERR_ISCONN:		rc=EISCONN;			break;	/* Already connected.       */
	// 	case ERR_ABRT:			rc=ECONNABORTED;	break;	/* Connection aborted.      */
	// 	case ERR_RST:			rc=ENETRESET;		break;	/* Connection reset.        */
	// 	case ERR_CLSD:			rc=ENOTCONN;		break;	/* Connection closed.       */
	// 	case ERR_CONN:			rc=ENOTCONN;		break;	/* Not connected.           */
	// 	case ERR_ARG:			rc=EINVAL;			break;	/* Illegal argument.        */
	// 	case ERR_IF:			rc=EIO;				break;	/* Low-level netif error    */
	// 	default:				rc=err;				break;
	// }
	return rc;
}


