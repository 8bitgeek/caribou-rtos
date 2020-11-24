#ifndef _HW_SPI_H_
#define _HW_SPI_H_

#include <board.h>
#include <hw_dma.h>

#ifdef __cplusplus
extern "C"
{
#endif

typedef struct
{
	SPI_TypeDef* 			spi;
	caribou_gpio_t*			gpio;
	hw_dma_t*				dma_tx;
	hw_dma_t*				dma_rx;
	uint32_t 				prescaler;
} hw_spi_t;

extern void    hw_spi_setup( hw_spi_t* spi );

extern uint8_t hw_spi_write_byte 		( hw_spi_t* spi, uint8_t data );
extern void    hw_spi_write_data 		( hw_spi_t* spi, void* data, uint32_t size );
extern void    hw_spi_write_data_dma 	( hw_spi_t* spi, void* data, uint32_t size );

extern uint8_t hw_spi_read_byte  		( hw_spi_t* spi );
extern void    hw_spi_read_data  		( hw_spi_t* spi, void* data, uint32_t size );
extern void    hw_spi_read_data_dma		( hw_spi_t* spi, void* data, uint32_t size );

extern void	   hw_spi_select 			( hw_spi_t* spi );
extern void	   hw_spi_deselect          ( hw_spi_t* spi );

#define ll_spi_write_data(spi,data,size)							\
{																	\
	for( register uint32_t _N_ = 0; _N_ < size; _N_++ )				\
	{																\
		while ( !(spi->SR & SPI_SR_TXE) );							\
		*(volatile uint8_t*)(spi->DR) = ((uint8_t*)(data))[_N_];	\
	}																\
}

#ifdef __cplusplus
}
#endif

#endif
