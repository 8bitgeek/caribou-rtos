#include <hw_dma.h>

extern void hw_dma_setup( hw_dma_t* dma )
{
	dma->channel->CPAR	= dma->dr;
	dma->channel->CCR 	&= ~(DMA_CCR_DIR|DMA_CCR_MINC|DMA_CCR_PSIZE_1|DMA_CCR_PSIZE_0|DMA_CCR_MSIZE_1|DMA_CCR_MSIZE_0|DMA_CCR_PL_0|DMA_CCR_PL_1||DMA_CCR_CIRC);
	dma->channel->CCR 	|= dma->ccr;
	dma->cselr->CSELR 	|= dma->csel;
}

extern void hw_dma_channel_set_prio( hw_dma_t* dma, uint32_t prio )
{
	dma->channel->CCR &= ~DMA_CCR_PL_Msk;
	dma->channel->CCR |= ( (prio<<DMA_CCR_PL_Pos) & DMA_CCR_PL_Msk );
}

extern void hw_dma_channel_set_mem( hw_dma_t* dma, void* address, uint16_t count )
{
	hw_dma_channel_disable( dma );

	dma->channel->CNDTR = count;
	dma->channel->CMAR = (uint32_t)address;
}

extern void hw_dma_channel_enable ( hw_dma_t* dma )
{
	dma->channel->CCR |= DMA_CCR_EN;
}

extern void hw_dma_channel_disable( hw_dma_t* dma )
{
	dma->channel->CCR &= ~DMA_CCR_EN;
}

extern int hw_dma_write_data( hw_dma_t* dma, void* data, uint32_t size )
{	
	hw_dma_channel_set_mem( dma, data, size );				/* Memory buffer to transmit */
	DMA1->IFCR = dma->ic_flag;								/* Clear the interrupt flags */
	dma->channel->CCR |= DMA_CCR_MINC;						/* Memory to Peripheral - Increment memory */
	dma->channel->CCR |= DMA_CCR_TCIE;						/* Enable interrupt on complete */
	dma->channel->CCR &= ~DMA_CCR_CIRC;						/* Disable circular mode */
	hw_dma_channel_enable( dma );							
	while( !(DMA1->ISR & dma->tc_flag) )
		caribou_thread_yield();
	hw_dma_channel_disable( dma );
	return size;	
}

extern int hw_dma_read_data( hw_dma_t* dma, void* data, uint32_t size )
{
	/* Prepare Receiver DMA to receive SPI to Memory */
	hw_dma_channel_set_mem( dma, data, size );			/* Memory buffer to recieve */
	DMA1->IFCR = dma->ic_flag;							/* Clear the interrupt flags */
	dma->channel->CCR |= DMA_CCR_MINC;					/* Peripher to Memory - Increment memory */
	dma->channel->CCR |= DMA_CCR_TCIE;					/* Enable interrupt on complete */
	dma->channel->CCR &= ~DMA_CCR_CIRC;					/* Disable circular mode */
	
	/* Enable DMA */
	hw_dma_channel_enable( dma );					
	while( !(DMA1->ISR & dma->tc_flag) )
		caribou_thread_yield();
	hw_dma_channel_disable( dma );			
	return size;
}

extern int hw_dma_read_data_spi( hw_dma_t* dma_tx, hw_dma_t* dma_rx, void* data, uint32_t size )
{
	volatile uint8_t dummy=0xFF;

	/* Prepare Transmitter DMA to drive SPI... */
	hw_dma_channel_set_mem( dma_tx,(uint8_t*)&dummy,size );	/* Memory buffer to transmit */
	DMA1->IFCR = dma_tx->ic_flag;							/* Clear the interrupt flags */
	dma_tx->channel->CCR &= ~DMA_CCR_MINC;					/* Memory to Peripheral - No Increment memory */
	dma_tx->channel->CCR |= DMA_CCR_TCIE;					/* Enable interrupt on complete */
	dma_tx->channel->CCR &= ~DMA_CCR_CIRC;					/* Disable circular mode */

	/* Prepare Receiver DMA to receive SPI to Memory */
	hw_dma_channel_set_mem( dma_rx, data, size );			/* Memory buffer to recieve */
	DMA1->IFCR = dma_rx->ic_flag;							/* Clear the interrupt flags */
	dma_rx->channel->CCR |= DMA_CCR_MINC;					/* Peripher to Memory - Increment memory */
	dma_rx->channel->CCR |= DMA_CCR_TCIE;					/* Enable interrupt on complete */
	dma_rx->channel->CCR &= ~DMA_CCR_CIRC;					/* Disable circular mode */
	
	/* Enable DMA */
	hw_dma_channel_enable( dma_rx );					
	hw_dma_channel_enable( dma_tx );					
	while( !(DMA1->ISR & dma_rx->tc_flag) )
		caribou_thread_yield();
	hw_dma_channel_disable( dma_tx );			
	hw_dma_channel_disable( dma_rx );			
	return size;
}

extern int hw_dma_write_data_circular( hw_dma_t* dma, void* data, uint32_t size )
{
	hw_dma_channel_disable( dma );
	hw_dma_channel_set_mem( dma, data, size );				/* Memory buffer to transmit */
	DMA1->IFCR = dma->ic_flag;								/* Clear the interrupt flags */
	dma->channel->CCR |= DMA_CCR_MINC;						/* Memory to Peripheral - Increment memory */
	dma->channel->CCR |= DMA_CCR_TCIE;						/* Enable interrupt on complete */
	dma->channel->CCR |= DMA_CCR_CIRC;						/* Enable circular mode */			
	return size;	
}

