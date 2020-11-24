#include <sram.h>
#include <hw_spi.h>
#include <caribou/lib/string.h>

#define SRAM_PRESCALER		SPI_CR1_BR_0		// (80/4) = 20MHz

#define SRAM_READ 			0x03	// Read dtaa from memory array beginning at selected address
#define SRAM_WRITE 			0x02	// Write data to memory array beginning at selected address
#define SRAM_EDIO 			0x3B	
#define SRAM_EQIO			0x38
#define SRAM_RSTIO			0xFF	// Reset Dual and Quad I/O access (revert to SPI bus mode)
#define SRAM_RDMR 			0x05	// Read mode register
#define SRAM_WRMR			0x01	// Write mode register

#define SRAM_MODE_0			0x40
#define SRAM_MODE_1			0x80

#define SRAM_MODE_BYTE		0x00
#define SRAM_MODE_PAGE		SRAM_MODE_1
#define SRAM_MODE_SEQENTIAL	SRAM_MODE_0
#define SRAM_MODE_RESERVED	(SRAM_MODE_1|SRAM_MODE_0)

static hw_dma_t dma_sram_tx	= { DMA1_Channel3,	DMA1_CSELR, (0x01 << DMA_CSELR_C3S_Pos), DMA_ISR_TCIF3, DMA_IFCR_CGIF3, (uint32_t)&SRAM_SPI->DR, DMA_CCR_DIR | DMA_CCR_MINC	};
static hw_dma_t dma_sram_rx	= { DMA1_Channel2,	DMA1_CSELR, (0x01 << DMA_CSELR_C2S_Pos), DMA_ISR_TCIF2, DMA_IFCR_CGIF2, (uint32_t)&SRAM_SPI->DR, DMA_CCR_MINC 				};

static hw_spi_t sram0 = { SRAM_SPI, &gpio_ram0_nss, &dma_sram_tx, &dma_sram_rx, SRAM_PRESCALER };
static hw_spi_t sram1 = { SRAM_SPI, &gpio_ram1_nss, &dma_sram_tx, &dma_sram_rx, SRAM_PRESCALER };

typedef struct _sram_state_t
{
	hw_spi_t* sram0;
	hw_spi_t* sram1;
	hw_spi_t* selected;
} sram_state_t;

static sram_state_t sram_state;

static void sram_write_address  ( hw_spi_t* sram, uint32_t address, uint8_t mode );
static void sram_set_sequential	( hw_spi_t* sram );

static void sram_select 		( uint32_t address );
static void sram_deselect 		( void );

#define sram_selected() 		( sram_state.selected )


// #pragma GCC push_options
// #pragma GCC optimize ("Os")


extern void sram_setup( void )
{
	memset(&sram_state,0,sizeof(sram_state_t));

	hw_spi_setup( &sram0 );
	hw_spi_setup( &sram1 );

	sram_state.sram0 = &sram0;
	sram_state.sram1 = &sram1;
	
	sram_set_sequential( sram_state.sram0 );
	sram_set_sequential( sram_state.sram1 );
}

static void sram_set_sequential( hw_spi_t* sram )
{
	hw_spi_select( sram );

	hw_spi_write_byte( sram, SRAM_WRMR );
	hw_spi_write_byte( sram, SRAM_MODE_SEQENTIAL );

	hw_spi_deselect( sram );
}


extern void sram_write_byte( uint32_t address, uint8_t data )
{
	sram_select( address );
	sram_write_address( sram_selected(), address, SRAM_WRITE );
	hw_spi_write_byte( sram_selected(), data );
	sram_deselect();
}

extern void sram_write_data( uint32_t address, void* data, uint32_t size )
{
	sram_select( address );
	sram_write_address( sram_selected(), address, SRAM_WRITE );

	ll_spi_write_data( sram_selected()->spi, data, size );

	sram_deselect();
}

extern void sram_write_data_dma( uint32_t address, void* data, uint32_t size )
{
	sram_select( address );
	sram_write_address( sram_selected(), address, SRAM_WRITE );

	hw_spi_write_data_dma( sram_selected(), data, size );

	sram_deselect();
}

extern uint8_t sram_read_byte( uint32_t address )
{
	uint8_t data;

	sram_select( address );
	sram_write_address( sram_selected(), address, SRAM_READ );
	
	data = hw_spi_write_byte( sram_selected(), 0xFF );
	
	sram_deselect();
	return data;
}

extern void sram_read_data( uint32_t address, void* data, uint32_t size )
{
	sram_select( address );
	sram_write_address( sram_selected(), address, SRAM_READ );

	hw_spi_read_data( sram_selected(), data, size );

	sram_deselect();
}

extern void sram_read_data_dma( uint32_t address, void* data, uint32_t size )
{
	sram_select( address );
	sram_write_address( sram_selected(), address, SRAM_READ );

	hw_spi_read_data_dma( sram_selected(), data, size );

	sram_deselect();
}

static void sram_write_address( hw_spi_t* sram, register uint32_t address, uint8_t mode )
{
	address &= (RAM_SIZE_BYTES-1);

	hw_spi_write_byte( sram, mode );
	hw_spi_write_byte( sram, (uint8_t)(address>>16)&0xFF );
	hw_spi_write_byte( sram, (uint8_t)(address>>8)&0xFF );
	hw_spi_write_byte( sram, (uint8_t)(address)&0xFF );
}


static void sram_select( uint32_t address )
{
	if ( address > RAM_CHIP_SIZE_BYTES )
	{
		hw_spi_deselect( sram_state.sram0 );
		hw_spi_select( sram_state.sram1 );
		sram_state.selected = sram_state.sram1;
	}
	else
	{
		hw_spi_deselect( sram_state.sram1 );
		hw_spi_select( sram_state.sram0 );
		sram_state.selected = sram_state.sram0;
	}
}

static void sram_deselect( void )
{
	if ( sram_state.selected )
	{
		hw_spi_deselect( sram_state.selected );
		sram_state.selected=NULL;
	}

}

extern void	sram_debug_dump_csv( uint32_t count )
{
	for(uint32_t address=0; address < RAM_SIZE_BYTES && address < (count*2); address+=2 )
	{
		uint16_t word;
		sram_read_data_dma(address,&word,2);
		printf("0x%06X,%d\n",address,word);
	}
	fflush(stdout);
}


// #pragma GCC pop_options
