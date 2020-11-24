#include <hw_dma.h>

extern void hw_dma_setup( hw_dma_t* dma )
{
	dma->stream->PAR	= dma->dr;

	dma->stream->CR 	&= ~(
							DMA_SxCR_DIR|
							DMA_SxCR_MINC|
							DMA_SxCR_PSIZE|
							DMA_SxCR_MSIZE|
							DMA_SxCR_PL|
							DMA_SxCR_CIRC);

	dma->stream->CR 	|= dma->cr;
}

extern void hw_dma_stream_set_prio( hw_dma_t* dma, uint32_t prio )
{
	uint32_t reg = dma->stream->CR;
	reg &= ~DMA_SxCR_PL;
	reg |= prio;
	dma->stream->CR = reg;
}

extern void hw_dma_stream_set_mem( hw_dma_t* dma, void* address, uint16_t count )
{
	hw_dma_stream_disable( dma );

	dma->stream->NDTR = count;
	dma->stream->M0AR = (uint32_t)address;
}

extern void hw_dma_stream_set_par( hw_dma_t* dma, void* address )
{
	hw_dma_stream_disable( dma );

	dma->stream->PAR = (uint32_t)address;
}

extern void hw_dma_stream_enable ( hw_dma_t* dma )
{
	dma->stream->CR |= DMA_SxCR_EN;
}

extern void hw_dma_stream_disable( hw_dma_t* dma )
{
	dma->stream->CR &= ~DMA_SxCR_EN;
}

extern int hw_dma_write_data( hw_dma_t* dma, void* data, uint32_t size )
{	
	hw_dma_stream_set_mem( dma, data, size );				/* Memory buffer to transmit */
	dma->dev->LIFCR |= dma->ic_flag[0];						/* Clear the interrupt flags */
	dma->dev->HIFCR |= dma->ic_flag[1];
	dma->stream->CR |= DMA_SxCR_MINC;						/* Memory to Peripheral - Increment memory */
	dma->stream->CR |= DMA_SxCR_TCIE;						/* Enable interrupt on complete */
	dma->stream->CR &= ~DMA_SxCR_CIRC;						/* Disable circular mode */
	hw_dma_stream_enable( dma );	
	while ( !hw_dma_transfer_complete(dma) )						
		caribou_thread_yield();
	hw_dma_stream_disable( dma );
	return size;	
}

extern int hw_dma_read_data( hw_dma_t* dma, void* data, uint32_t size )
{
	hw_dma_stream_set_mem( dma, data, size );				/* Memory buffer to recieve */
	dma->dev->LIFCR |= dma->ic_flag[0];						/* Clear the interrupt flags */
	dma->dev->HIFCR |= dma->ic_flag[1];
	dma->stream->CR |= DMA_SxCR_MINC;						/* Memory to Peripheral - Increment memory */
	dma->stream->CR |= DMA_SxCR_TCIE;						/* Enable interrupt on complete */
	dma->stream->CR &= ~DMA_SxCR_CIRC;						/* Disable circular mode */
	hw_dma_channel_enable( dma );					
	while ( !hw_dma_transfer_complete(dma) )						
		caribou_thread_yield();
	hw_dma_channel_disable( dma );			
	return size;
}

extern int hw_dma_read_data_spi( hw_dma_t* dma_tx, hw_dma_t* dma_rx, void* data, uint32_t size )
{
	volatile uint8_t dummy=0xFF;

	/* Prepare Transmitter DMA to drive SPI... */
	hw_dma_stream_set_mem( dma_tx,(uint8_t*)&dummy,size );	/* Memory buffer to transmit */
	dma_tx->dev->LIFCR |= dma_tx->ic_flag[0];				/* Clear the interrupt flags */
	dma_tx->dev->HIFCR |= dma_tx->ic_flag[1];
	dma_tx->stream->CR &= ~DMA_SxCR_MINC;					/* Memory to Peripheral - No Increment memory */
	dma_tx->stream->CR |= DMA_SxCR_TCIE;					/* Enable interrupt on complete */
	dma_tx->stream->CR &= ~DMA_SxCR_CIRC;					/* Disable circular mode */

	/* Prepare Receiver DMA to receive SPI to Memory */
	hw_dma_stream_set_mem( dma_rx, data, size );			/* Memory buffer to recieve */
	dma_rx->dev->LIFCR |= dma_rx->ic_flag[0];				/* Clear the interrupt flags */
	dma_rx->dev->HIFCR |= dma_rx->ic_flag[1];
	dma_rx->stream->CR |= DMA_SxCR_MINC;					/* Peripheral to Memory - Increment memory */
	dma_rx->stream->CR |= DMA_SxCR_TCIE;					/* Enable interrupt on complete */
	dma_rx->stream->CR &= ~DMA_SxCR_CIRC;					/* Disable circular mode */

	/* Enable DMA */
	hw_dma_channel_enable( dma_rx );					
	hw_dma_channel_enable( dma_tx );			
	while ( !hw_dma_transfer_complete(dma_rx) )						
		caribou_thread_yield();
	hw_dma_channel_disable( dma_tx );			
	hw_dma_channel_disable( dma_rx );			
	return size;

}

extern int hw_dma_write_data_circular( hw_dma_t* dma, void* data, uint32_t size )
{
	hw_dma_stream_disable( dma );
	hw_dma_stream_set_mem( dma, data, size );				/* Memory buffer to transmit */
	dma->dev->LIFCR |= dma->ic_flag[0];						/* Clear the interrupt flags */
	dma->dev->HIFCR |= dma->ic_flag[1];
	dma->stream->CR |= DMA_SxCR_MINC;					/* Peripheral to Memory - Increment memory */
	dma->stream->CR |= DMA_SxCR_TCIE;					/* Enable interrupt on complete */
	dma->stream->CR |= DMA_SxCR_CIRC;					/* Enable circular mode */
	return size;	
}

extern bool hw_dma_transfer_complete( hw_dma_t* dma )
{
	return ( (dma->dev->LISR & dma->if_flag[0]) || (dma->dev->HISR & dma->if_flag[1]) );
}
