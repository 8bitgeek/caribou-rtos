#include <hw_spi.h>

#pragma GCC push_options
#pragma GCC optimize ("Os")

static uint8_t hw_spi_flush_rx( hw_spi_t* spi );

extern void hw_spi_setup( hw_spi_t* spi )
{
	spi->spi->CR1 &= ~SPI_CR1_SPE;
	spi->spi->CR1 = SPI_CR1_MSTR | SPI_CR1_SSI | SPI_CR1_SSM | spi->prescaler;	
	spi->spi->CR2 = SPI_CR2_RXDMAEN |SPI_CR2_TXDMAEN | SPI_CR2_FRXTH | SPI_DATASIZE_8BIT;		// 8 Bit DMA Enabled
	
	hw_dma_setup( spi->dma_tx );
	hw_dma_setup( spi->dma_rx );

	spi->spi->CR1 |= SPI_CR1_SPE;
}

extern uint8_t hw_spi_write_byte( hw_spi_t* spi, uint8_t data )
{
	while ( (spi->spi->SR & SPI_SR_TXE) == 0 );
	*(volatile uint8_t*)(&spi->spi->DR) = data;
	while ( (spi->spi->SR & SPI_SR_BSY) != 0 );
	while ( (spi->spi->SR & SPI_SR_RXNE) == 0 );
	return *(volatile uint8_t*)(&spi->spi->DR);
}

extern void hw_spi_write_data( hw_spi_t* spi, void* data, register uint32_t size )
{
	ll_spi_write_data(spi->spi,data,size);
}

extern uint8_t hw_spi_read_byte( hw_spi_t* spi )
{
	return hw_spi_write_byte( spi, 0xFF );
}

extern void hw_spi_read_data( hw_spi_t* spi, void* data, uint32_t size )
{
	int count;
	uint8_t* p = (uint8_t*)data;
	for ( count=0; count < size; count++ )
		p[count] = hw_spi_read_byte( spi );
}


extern void hw_spi_write_data_dma( hw_spi_t* spi, void* data, uint32_t size )
{
	hw_dma_write_data( spi->dma_tx, data, size );
	while ( (spi->spi->SR & SPI_SR_BSY) );
}

extern void hw_spi_read_data_dma( hw_spi_t* spi, void* data, uint32_t size )
{
	hw_spi_flush_rx( spi );

	hw_dma_read_data_spi( spi->dma_tx, spi->dma_rx, data, size );
	while ( (spi->spi->SR & SPI_SR_BSY) );
}

static uint8_t hw_spi_flush_rx( hw_spi_t* spi )
{
	volatile uint8_t data;
	while ( spi->spi->SR & SPI_SR_RXNE )
	{
		data = *(volatile uint8_t*)(&spi->spi->DR);
	}
	return data;
}

void hw_spi_select(hw_spi_t* spi)
{
	caribou_gpio_reset( spi->gpio );
}

void hw_spi_deselect(hw_spi_t* spi)
{
	caribou_gpio_set( spi->gpio );
	hw_spi_flush_rx( spi );
}

#pragma GCC pop_options

