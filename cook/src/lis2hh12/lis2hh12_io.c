#include <lis2hh12_io.h>
#include <hw_spi.h>
#include <caribou/lib/string.h>

#define IMU_SPI         SPI2
#define IMU_PRESCALER   SPI_CR1_BR_1    // (80/8) = 10MHz

static hw_dma_t dma_imu_tx = { DMA1_Channel5,  DMA1_CSELR, (0x01 << DMA_CSELR_C5S_Pos), DMA_ISR_TCIF5, DMA_IFCR_CGIF5, (uint32_t)&IMU_SPI->DR, DMA_CCR_DIR | DMA_CCR_MINC };
static hw_dma_t dma_imu_rx = { DMA1_Channel4,  DMA1_CSELR, (0x01 << DMA_CSELR_C4S_Pos), DMA_ISR_TCIF4, DMA_IFCR_CGIF4, (uint32_t)&IMU_SPI->DR, DMA_CCR_MINC               };

static hw_spi_t imu = { IMU_SPI, &gpio_imu_nss, &dma_imu_tx, &dma_imu_rx, IMU_PRESCALER };

static int32_t platform_read_reg(void* handle, uint8_t reg, uint8_t* data, uint16_t len);
static int32_t platform_write_reg(void* handle, uint8_t reg, uint8_t* data, uint16_t len);

extern void lis2hh12_setup( lis2hh12_ctx_t* ctx )
{
  hw_spi_setup( &imu );
	ctx->handle = &imu;
	ctx->write_reg = platform_write_reg;
	ctx->read_reg  = platform_read_reg;
}

/**
  * @brief  Read generic device register
  *
  * @param  ctx   read / write interface definitions(ptr)
  * @param  reg   register to read
  * @param  data  pointer to buffer that store the data read(ptr)
  * @param  len   number of consecutive register to read
  * @retval       interface status (MANDATORY: return 0 -> no Error)
  *
  */
static int32_t platform_read_reg(void* handle, uint8_t reg, uint8_t* data, uint16_t len)
{
  hw_spi_t* spi = (hw_spi_t*)handle;
  hw_spi_select( spi );
  hw_spi_write_byte( spi, reg & ~0x80 );  // address + read 
  hw_spi_read_data( spi, data, len );
  hw_spi_deselect( spi );
	return 0;
}

/**
  * @brief  Write generic device register
  *
  * @param  ctx   read / write interface definitions(ptr)
  * @param  reg   register to write
  * @param  data  pointer to data to write in register reg(ptr)
  * @param  len   number of consecutive register to write
  * @retval       interface status (MANDATORY: return 0 -> no Error)
  *
  */
static int32_t platform_write_reg(void* handle, uint8_t reg, uint8_t* data, uint16_t len)
{
  hw_spi_t* spi = (hw_spi_t*)handle;
  hw_spi_select( spi );
  hw_spi_write_byte( spi, reg | 0x80 );   // address + write 
  hw_spi_write_data( spi, data, len );
  hw_spi_deselect( spi );
	return 0;
}
