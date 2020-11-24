#ifndef _HW_DMA_H_
#define _HW_DMA_H_

#include <board.h>

typedef struct _hw_dma_t
{
	DMA_TypeDef*			dev;
	DMA_Stream_TypeDef*		stream;
	uint32_t				ic_flag[2];
	uint32_t				if_flag[2];
	uint32_t				dr;
	uint32_t 				cr;
} hw_dma_t;

#define HW_DMA_PRIO_LOW		0
#define HW_DMA_PRIO_MEDIUM	DMA_SxCR_PL_0
#define HW_DMA_PRIO_HIGH	DMA_SxCR_PL_1
#define HW_DMA_PRIO_HIGHEST	(DMA_SxCR_PL_1|DMA_SxCR_PL_0)

extern void hw_dma_setup( hw_dma_t* dma );

extern void hw_dma_stream_enable  ( hw_dma_t* dma );
extern void hw_dma_stream_disable ( hw_dma_t* dma );
extern void hw_dma_stream_set_mem ( hw_dma_t* dma, void* address, uint16_t count );
extern void hw_dma_stream_set_par ( hw_dma_t* dma, void* address );

extern void hw_dma_stream_enable  ( hw_dma_t* dma );
extern void hw_dma_stream_disable ( hw_dma_t* dma );

extern void hw_dma_stream_set_prio( hw_dma_t* dma, uint32_t prio );

extern int  hw_dma_write_data( hw_dma_t* dma, void* data, uint32_t size );
extern int  hw_dma_read_data( hw_dma_t* dma, void* data, uint32_t size );
extern int  hw_dma_read_data_spi( hw_dma_t* dma_tx, hw_dma_t* dma_rx, void* data, uint32_t size );

extern int  hw_dma_write_data_circular( hw_dma_t* dma, void* data, uint32_t size );

extern bool hw_dma_transfer_complete( hw_dma_t* dma );

#endif
