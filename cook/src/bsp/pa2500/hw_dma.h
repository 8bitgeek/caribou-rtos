#ifndef _HW_DMA_H_
#define _HW_DMA_H_

#include <board.h>

#ifdef __cplusplus
extern "C"
{
#endif

typedef struct _hw_dma_t
{
	DMA_Channel_TypeDef* 	channel;
	DMA_Request_TypeDef* 	cselr;
	uint32_t 				csel;
	uint32_t				tc_flag;
	uint32_t				ic_flag;
	uint32_t				dr;
	uint32_t 				ccr;
} hw_dma_t;

#define HW_DMA_PRIO_LOW		0
#define HW_DMA_PRIO_MEDIUM	DMA_CCR_PL_0
#define HW_DMA_PRIO_HIGH	DMA_CCR_PL_1
#define HW_DMA_PRIO_HIGHEST	(DMA_CCR_PL_1|DMA_CCR_PL_0)

extern void hw_dma_setup( hw_dma_t* dma );

extern void hw_dma_channel_enable  ( hw_dma_t* dma );
extern void hw_dma_channel_disable ( hw_dma_t* dma );
extern void hw_dma_channel_set_mem ( hw_dma_t* dma, void* address, uint16_t count );

extern void hw_dma_channel_enable  ( hw_dma_t* dma );
extern void hw_dma_channel_disable ( hw_dma_t* dma );

extern void hw_dma_channel_set_prio( hw_dma_t* dma, uint32_t prio );

extern int  hw_dma_write_data      ( hw_dma_t* dma, void* data, uint32_t size );
extern int  hw_dma_read_data       ( hw_dma_t* dma, void* data, uint32_t size );
extern int  hw_dma_read_data_spi   ( hw_dma_t* dma_tx, hw_dma_t* dma_rx, void* data, uint32_t size );

extern int  hw_dma_write_data_circular( hw_dma_t* dma, void* data, uint32_t size );

#ifdef __cplusplus
}
#endif

#endif
