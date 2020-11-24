/***************************************************************************
 *   Copyright © 2005-2011 by Pike Aerospace Research Corporation          *
 *   info@pikeaero.com                                                     *
 ***************************************************************************/
#ifndef _CARIBOU_SPI_STM32L152_H_
#define _CARIBOU_SPI_STM32L152_H_

#include <caribou/types.h>
#include <chip/vectors.h>

#include <stm32l1xx.h>
#include <stm32l1xx_gpio.h>
#include <stm32l1xx_spi.h>
#include <stm32l1xx_rcc.h>

#ifdef __cplusplus
extern "C"
{
#endif

typedef struct
{
	SPI_TypeDef*	spi_port;
    GPIO_TypeDef*	select_port;
	uint32_t		select_pin;
} caribou_spi_t;

extern int		caribou_spi_init(caribou_spi_t* spi, uint32_t spi_port, uint16_t word_size, uint8_t master_mode, uint8_t cpol);
extern uint16_t	caribou_spi_receiver_ready(caribou_spi_t* spi);
extern uint16_t	caribou_spi_exchange(caribou_spi_t* spi,uint16_t src);
extern uint16_t	caribou_spi_transmit(caribou_spi_t* spi,uint16_t src);
extern uint16_t	caribou_spi_receive(caribou_spi_t* spi);
extern int		caribou_spi_selected(caribou_spi_t* spi);
extern void		caribou_spi_select(caribou_spi_t* spi);
extern void		caribou_spi_deselect(caribou_spi_t* spi);
extern void		caribou_spi_interrupts_enable(caribou_spi_t* spi);
extern void		caribou_spi_interrupts_disable(caribou_spi_t* spi);

#ifdef __cplusplus
}
#endif

#endif
