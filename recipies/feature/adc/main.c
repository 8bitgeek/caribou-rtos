/******************************************************************************
******************************************************************************/
#include <board.h>
#include <hw_adc.h>
#include <syslog.h>
#include <syslog_printf.h>

static hw_adc_t	adc1;
static syslog_t syslog;

extern void feature_main(void* arg)
{
	syslog_init( &syslog, stderr, syslog_fputc );
	
	hw_adc_setup( &adc1, ADC1, ADC_IRQn );

	hw_adc_insert_channel( &adc1, HW_ADC_CHANNEL_7 );
	hw_adc_insert_channel( &adc1, HW_ADC_CHANNEL_8 );
	hw_adc_insert_channel( &adc1, HW_ADC_CHANNEL_15 );
	hw_adc_insert_channel( &adc1, HW_ADC_CHANNEL_16 );

	hw_adc_start( &adc1 );

	for( ;; )
	{
		SYSLOG_PRINTF( &syslog, SYSLOG_DEBUG, " %d, %d, %d, %d", 
		       		hw_adc_read_channel( &adc1, HW_ADC_CHANNEL_7 ), 
		       		hw_adc_read_channel( &adc1, HW_ADC_CHANNEL_8 ),
		       		hw_adc_read_channel( &adc1, HW_ADC_CHANNEL_15 ), 
		       		hw_adc_read_channel( &adc1, HW_ADC_CHANNEL_16 )
		       );
		//msdelay(10);
	}
}
