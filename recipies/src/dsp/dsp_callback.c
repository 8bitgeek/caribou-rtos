#include <dsp_callback.h>

typedef struct
{
	dsp_callback_fn_t 	diag_callback_fn;
} dsp_callback_t;

dsp_callback_t dsp_callback;

void dsp_callback_setup( void )
{
	memset(&dsp_callback,0,sizeof(dsp_callback_t));
}

void dsp_callback_set_diag( dsp_callback_fn_t callback_fn )
{
	dsp_callback.diag_callback_fn = callback_fn;
}
