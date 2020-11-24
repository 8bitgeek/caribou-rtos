#include <hw_adc.h>
#include <hw_dma.h>

typedef struct 
{
	uint16_t	channel_data[HW_ADC_CHANNELS];
	uint16_t*	channel_data_ptr[HW_ADC_CHANNELS];
	bool 		overrun;
	uint8_t		channel_count;
	hw_dma_t*	dma;
} adc_t;

static hw_dma_t dma_adc = { 
							DMA1_Channel1, 	
							DMA1_CSELR,	
							(0x00 << DMA_CSELR_C1S_Pos), 
							DMA_ISR_TCIF1, 
							DMA_IFCR_CGIF1, 
							(uint32_t)&ADC1->DR, 	 
							DMA_CCR_MINC|DMA_CCR_PSIZE_0|DMA_CCR_MSIZE_0|DMA_CCR_PL_0|DMA_CCR_CIRC };

static adc_t adc;

static void adc_isr(InterruptVector vector, void* arg);

extern void hw_adc_setup( void )
{
	memset(&adc,0,sizeof(adc_t));

	hw_dma_setup( &dma_adc );
	adc.dma = &dma_adc;

	ADC1->CR = ADC_CR_ADVREGEN;
	for(volatile uint32_t delay=0; delay < 10000; delay++); // Must be >= 20 uS

	caribou_vector_install( ADC1_IRQn, adc_isr, NULL );
	caribou_vector_enable( ADC1_IRQn );
}

extern void hw_adc_start( void )
{
	ADC_TypeDef* adc1 = ADC1;

	adc.overrun=false;

	adc1->CR   |= ADC_CR_ADCAL;							// calibrate
	while( adc1->CR & ADC_CR_ADCAL );
	
	adc1->CFGR |= ADC_CFGR_CONT;						// continuous scanning mode
	adc1->IER  |= ADC_IER_OVRIE;						// interrupt on overrun
	//adc1->IER  |= ADC_IER_EOSIE;						// interrupt at end of regular samples

	adc1->CFGR |= ADC_CFGR_DMAEN | ADC_CFGR_DMACFG;		// enable DMA

	hw_dma_channel_set_mem( adc.dma, adc.channel_data, adc.channel_count );
	hw_dma_channel_enable( adc.dma );

	adc1->CR   |= ADC_CR_ADEN;							// enable
	while( !( adc1->ISR & ADC_ISR_ADRDY ) );

	adc1->CR |= ADC_CR_ADSTART;							// start regular conversions
}

extern void hw_adc_stop( void )
{
	hw_dma_channel_disable( adc.dma );
	ADC1->CR &= ~ADC_CR_ADEN;
	while( ( ADC1->ISR & ADC_ISR_ADRDY ) );
}

extern void hw_adc_insert_channel (uint32_t channel)
{
	channel &= 0x1F;

	switch ( adc.channel_count )
	{
		case 0:		ADC1->SQR1 &= ~ADC_SQR1_SQ1_Msk;  ADC1->SQR1 |= channel << ADC_SQR1_SQ1_Pos; break;
		case 1:		ADC1->SQR1 &= ~ADC_SQR1_SQ2_Msk;  ADC1->SQR1 |= channel << ADC_SQR1_SQ2_Pos; break;
		case 2:		ADC1->SQR1 &= ~ADC_SQR1_SQ3_Msk;  ADC1->SQR1 |= channel << ADC_SQR1_SQ3_Pos; break;
		case 3:		ADC1->SQR1 &= ~ADC_SQR1_SQ4_Msk;  ADC1->SQR1 |= channel << ADC_SQR1_SQ4_Pos; break;
		case 4:		ADC1->SQR2 &= ~ADC_SQR2_SQ5_Msk;  ADC1->SQR2 |= channel << ADC_SQR2_SQ5_Pos; break;
		case 5:		ADC1->SQR2 &= ~ADC_SQR2_SQ6_Msk;  ADC1->SQR2 |= channel << ADC_SQR2_SQ6_Pos; break;
		case 6:		ADC1->SQR2 &= ~ADC_SQR2_SQ7_Msk;  ADC1->SQR2 |= channel << ADC_SQR2_SQ7_Pos; break;
		case 7:		ADC1->SQR2 &= ~ADC_SQR2_SQ8_Msk;  ADC1->SQR2 |= channel << ADC_SQR2_SQ8_Pos; break;
		case 8:		ADC1->SQR2 &= ~ADC_SQR2_SQ9_Msk;  ADC1->SQR2 |= channel << ADC_SQR2_SQ9_Pos; break;
		case 9:		ADC1->SQR3 &= ~ADC_SQR3_SQ10_Msk; ADC1->SQR3 |= channel << ADC_SQR3_SQ10_Pos; break;
		case 10:	ADC1->SQR3 &= ~ADC_SQR3_SQ11_Msk; ADC1->SQR3 |= channel << ADC_SQR3_SQ11_Pos; break;
		case 11:	ADC1->SQR3 &= ~ADC_SQR3_SQ12_Msk; ADC1->SQR3 |= channel << ADC_SQR3_SQ12_Pos; break;
		case 12:	ADC1->SQR3 &= ~ADC_SQR3_SQ13_Msk; ADC1->SQR3 |= channel << ADC_SQR3_SQ13_Pos; break;
		case 13:	ADC1->SQR3 &= ~ADC_SQR3_SQ14_Msk; ADC1->SQR3 |= channel << ADC_SQR3_SQ14_Pos; break;
		case 14:	ADC1->SQR4 &= ~ADC_SQR4_SQ15_Msk; ADC1->SQR4 |= channel << ADC_SQR4_SQ15_Pos; break;
		case 15:	ADC1->SQR4 &= ~ADC_SQR4_SQ16_Msk; ADC1->SQR4 |= channel << ADC_SQR4_SQ16_Pos; break;
	}

	adc.channel_data_ptr[channel] = &adc.channel_data[adc.channel_count];

	ADC1->SQR1 &= ~ADC_SQR1_L_Msk;
	ADC1->SQR1 |= (adc.channel_count++ & ADC_SQR1_L_Msk);
}

extern uint16_t* hw_adc_data_ptr( uint32_t channel )
{
	return adc.channel_data_ptr[ channel ];
}

extern uint16_t	hw_adc_read_channel( uint32_t channel )
{
	uint16_t  rc = 0;

	uint16_t* channel_data_ptr = hw_adc_data_ptr( channel );
	
	if ( channel_data_ptr )
		rc = *channel_data_ptr;
	
	return rc;
}

extern bool hw_adc_overrun( void )
{
	return adc.overrun;
}

static void adc_isr(InterruptVector vector, void* arg)
{
	if ( ADC1->ISR & ADC_ISR_OVR )
	{
		ADC1->ISR = ADC_ISR_OVR;
		adc.overrun = true;
	}
}

