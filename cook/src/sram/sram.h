#ifndef __SRAM_H__
#define __SRAM_H__

#include <board.h>

extern void    	sram_setup     	( void );

extern void    	sram_write_byte ( uint32_t address, uint8_t data );
extern void		sram_write_data ( uint32_t address, void* data, uint32_t size );

extern uint8_t 	sram_read_byte	( uint32_t address );
extern void		sram_write_data ( uint32_t address, void* data, uint32_t size );

extern void		sram_write_data_dma ( uint32_t address, void* data, uint32_t size );
extern void		sram_read_data_dma 	( uint32_t address, void* data, uint32_t size );

extern void		sram_debug_dump_csv ( uint32_t count );

#endif
