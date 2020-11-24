/******************************************************************************
******************************************************************************/
#include <board.h>
#include <delay.h>
#include <hw_dma.h>
#include <hw_spi.h>

#define FEATURE_DMA_CHAN_TX         DMA1_Channel3
#define FEATURE_DMA_CSELR_TX        DMA1_CSELR
#define FEATURE_DMA_CSELR_POS_TX    (0x01 << DMA_CSELR_C3S_Pos)
#define FEATURE_DMA_TCIF_TX         DMA_ISR_TCIF3
#define FEATURE_DMS_CGIF_TX         DMA_IFCR_CGIF3

#define FEATURE_DMA_CHAN_RX         DMA1_Channel2
#define FEATURE_DMA_CSELR_RX        DMA1_CSELR
#define FEATURE_DMA_CSELR_POS_RX    (0x01 << DMA_CSELR_C2S_Pos)
#define FEATURE_DMA_TCIF_RX         DMA_ISR_TCIF2
#define FEATURE_DMA_CGIF_RX         DMA_IFCR_CGIF2

#define FEATURE_SPI                 SPI1
#define FEATURE_PRESCALER		    SPI_CR1_BR_0		// (80/4) = 20MHz

static caribou_gpio_t gpio_feature_nss = CARIBOU_GPIO_INIT( GPIOA, CARIBOU_GPIO_PIN_4  );

static hw_dma_t dma_feature_tx	= { 
                                        FEATURE_DMA_CHAN_TX,	
                                        FEATURE_DMA_CSELR_TX, 
                                        FEATURE_DMA_CSELR_POS_TX, 
                                        FEATURE_DMA_TCIF_TX, 
                                        FEATURE_DMS_CGIF_TX, 
                                        (uint32_t)&FEATURE_SPI->DR, 
                                        DMA_CCR_DIR | DMA_CCR_MINC	
                                        };

static hw_dma_t dma_feature_rx	= { 
                                        FEATURE_DMA_CHAN_RX,	
                                        FEATURE_DMA_CSELR_RX, 
                                        FEATURE_DMA_CSELR_POS_RX, 
                                        FEATURE_DMA_TCIF_RX, 
                                        FEATURE_DMA_CGIF_RX, 
                                        (uint32_t)&FEATURE_SPI->DR, 
                                        DMA_CCR_MINC
                                        };

static hw_spi_t feature_spi = { FEATURE_SPI, &gpio_feature_nss, &dma_feature_tx, &dma_feature_rx, FEATURE_PRESCALER };

void feature_main( void )
{

    hw_spi_setup( &feature_spi );

	for( uint8_t out=0 ; ; out++ )
	{
        hw_spi_select(&feature_spi);
        fprintf(stderr,"%02X %02X\n", out, hw_spi_write_byte(&feature_spi,out) );
        hw_spi_deselect(&feature_spi);
    }
}


