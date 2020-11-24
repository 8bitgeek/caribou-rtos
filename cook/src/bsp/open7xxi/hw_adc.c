#include <hw_adc.h>

static hw_dma_t dma_adc = { 
							DMA2,
							DMA2_Stream4, 	
							{ 0, DMA_HISR_TCIF4 }, 
							{ 0, ( DMA_HIFCR_CTCIF4 | DMA_HIFCR_CHTIF4 | DMA_HIFCR_CTEIF4 | DMA_HIFCR_CDMEIF4 | DMA_HIFCR_CFEIF4 ) },
							(uint32_t)&ADC->CDR,
							DMA_SxCR_MINC | DMA_SxCR_PSIZE_0 | DMA_SxCR_MSIZE_0 | DMA_SxCR_PL_0 | DMA_SxCR_CIRC
						};

static void adc_isr(InterruptVector vector, void* arg);

extern void hw_adc_setup( hw_adc_t* adc, ADC_TypeDef* device, IRQn_Type irqn )
{
	memset(adc,0,sizeof(hw_adc_t));
	adc->state.dma = &dma_adc;
	adc->irqn = irqn;

	hw_dma_setup( adc->state.dma );
	adc->common->CCR |= ( ADC_CCR_TSVREFE | ADC_CCR_VBATE );

	caribou_vector_install( adc->irqn, adc_isr, adc );
	caribou_vector_enable( adc->irqn );
}

extern void hw_adc_start( hw_adc_t* adc )
{
	adc->state.overrun = false;

	adc->device->CR1 |= ADC_CR1_OVRIE | ADC_CR1_SCAN;
	adc->device->CR2 |= ADC_CR2_DMA;					// DMA mode enabled
	adc->device->CR2 |= ADC_CR2_CONT;					// Continuous conversion
	adc->device->CR2 |= ADC_CR2_DDS;					// enable ONLY if NOT timer triggered

	hw_dma_stream_set_mem( adc->state.dma, adc->state.channel_data, adc->state.channel_count );
	hw_dma_stream_enable( adc->state.dma );

	adc->device->CR2 |= ADC_CR2_ADON;					// Enable ADC
	adc->device->CR2 |= ADC_CR2_SWSTART;				// start regular conversions
}

extern void hw_adc_stop( hw_adc_t* adc )
{
	hw_dma_stream_disable( adc->state.dma );
	adc->device->CR2 &= ~ADC_CR2_ADON;					// Disable ADC
}



extern void hw_adc_set_extsel( hw_adc_t* adc, uint32_t extsel )
{
	uint32_t CR2 = adc->device->CR2;
	CR2 &= ~ADC_CR2_EXTSEL;
	CR2 |= (extsel & ADC_CR2_EXTSEL);
	adc->device->CR2 = CR2;
}

extern uint32_t hw_adc_get_extsel( hw_adc_t* adc )
{
	return adc->device->CR2 & ADC_CR2_EXTSEL;
}

extern void hw_adc_set_exten( hw_adc_t* adc, uint32_t exten )
{
	uint32_t CR2 = adc->device->CR2;
	CR2 &= ~ADC_CR2_EXTEN;
	CR2 |= (exten & ADC_CR2_EXTEN);
	adc->device->CR2 = CR2;
}

extern uint32_t hw_adc_get_exten( hw_adc_t* adc )
{
	return adc->device->CR2 & ADC_CR2_EXTEN;
}

extern void hw_adc_swstart( hw_adc_t* adc )
{
	adc->device->CR2 |= ADC_CR2_SWSTART;
}

extern bool hw_adc_started( hw_adc_t* adc )
{
	return (adc->device->CR2 & ADC_SR_STRT) ? true : false;
}



extern void hw_adc_set_jextsel( hw_adc_t* adc, uint32_t jextsel )
{
	uint32_t CR2 = adc->device->CR2;
	CR2 &= ~ADC_CR2_JEXTSEL;
	CR2 |= (jextsel & ADC_CR2_JEXTSEL);
	adc->device->CR2 = CR2;
}

extern uint32_t hw_adc_get_jextsel( hw_adc_t* adc )
{
	return adc->device->CR2 & ADC_CR2_JEXTSEL;
}

extern void hw_adc_set_jexten( hw_adc_t* adc, uint32_t jexten )
{
	uint32_t CR2 = adc->device->CR2;
	CR2 &= ~ADC_CR2_JEXTEN;
	CR2 |= (jexten & ADC_CR2_JEXTEN);
	adc->device->CR2 = CR2;
}

extern uint32_t hw_adc_get_jexten( hw_adc_t* adc )
{
	return adc->device->CR2 & ADC_CR2_JEXTEN;
}

extern void hw_adc_jswstart( hw_adc_t* adc )
{
	adc->device->CR2 |= ADC_CR2_JSWSTART;
}

extern bool hw_adc_jstarted( hw_adc_t* adc )
{
	return (adc->device->CR2 & ADC_SR_JSTRT) ? true : false;
}


extern void hw_adc_insert_channel( hw_adc_t* adc, uint32_t channel )
{
	channel &= 0x1F;

	switch ( adc->state.channel_count )
	{
		case 0:		adc->device->SQR3 &= ADC_SQR3_SQ1;	adc->device->SQR3 |= channel << 0;	break;
		case 1:		adc->device->SQR3 &= ADC_SQR3_SQ2;	adc->device->SQR3 |= channel << 5;	break;
		case 2:		adc->device->SQR3 &= ADC_SQR3_SQ3;	adc->device->SQR3 |= channel << 10;	break;
		case 3:		adc->device->SQR3 &= ADC_SQR3_SQ4;	adc->device->SQR3 |= channel << 15;	break;
		case 4:		adc->device->SQR3 &= ADC_SQR3_SQ5;	adc->device->SQR3 |= channel << 20;	break;
		case 5:		adc->device->SQR3 &= ADC_SQR3_SQ6;	adc->device->SQR3 |= channel << 25;	break;

		case 6:		adc->device->SQR2 &= ADC_SQR2_SQ7;	adc->device->SQR2 |= channel << 0;	break;
		case 7:		adc->device->SQR2 &= ADC_SQR2_SQ8;	adc->device->SQR2 |= channel << 5;	break;
		case 8:		adc->device->SQR2 &= ADC_SQR2_SQ9;	adc->device->SQR2 |= channel << 10;	break;
		case 9:		adc->device->SQR2 &= ADC_SQR2_SQ10;	adc->device->SQR2 |= channel << 15;	break;
		case 10:	adc->device->SQR2 &= ADC_SQR2_SQ11;	adc->device->SQR2 |= channel << 20;	break;
		case 11:	adc->device->SQR2 &= ADC_SQR2_SQ12;	adc->device->SQR2 |= channel << 25;	break;

		case 12:	adc->device->SQR1 &= ADC_SQR1_SQ13;	adc->device->SQR1 |= channel << 0;	break;
		case 13:	adc->device->SQR1 &= ADC_SQR1_SQ14;	adc->device->SQR1 |= channel << 5;	break;
		case 14:	adc->device->SQR1 &= ADC_SQR1_SQ15;	adc->device->SQR1 |= channel << 10;	break;
		case 15:	adc->device->SQR1 &= ADC_SQR1_SQ16;	adc->device->SQR1 |= channel << 15;	break;

		default:
			break;
	}

	adc->state.channel_data_ptr[channel] = &adc->state.channel_data[adc->state.channel_count];

	adc->device->SQR1 &= ~ADC_SQR1_L;
	adc->device->SQR1 |= (adc->state.channel_count++ & ADC_SQR1_L);
}

extern uint16_t* hw_adc_data_ptr( hw_adc_t* adc, uint32_t channel )
{
	return adc->state.channel_data_ptr[ channel ];
}

extern uint16_t	hw_adc_read_channel( hw_adc_t* adc, uint32_t channel )
{
	uint16_t  rc = 0;
	uint16_t* channel_data_ptr = hw_adc_data_ptr( adc, channel );

	if ( channel_data_ptr )
		rc = *channel_data_ptr;
	
	return rc;
}

extern bool hw_adc_overrun( hw_adc_t* adc )
{
	return adc->state.overrun;
}

static void adc_isr(InterruptVector vector, void* arg)
{
	hw_adc_t* adc = (hw_adc_t*)arg;
	if ( adc->device->SR & ADC_SR_OVR )
	{
		adc->device->SR &= ~ADC_SR_OVR;
		adc->state.overrun = true;
	}
}

