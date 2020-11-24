/******************************************************************************
* Copyright © 2015 by Pike Aerospace Research Corporation
* All Rights Reserved
******************************************************************************/
#include "enc28j60.h"
#include <caribou/kernel/timer.h>
#include <delay.h>
#include <hw_dma.h>
#include <hw_spi.h>

// #pragma GCC push_options
// #pragma GCC optimize ("Os")

#define ENC28J60_PRESCALER		SPI_CR1_BR_0		// (80/4) = 20MHz

static hw_dma_t dma_enc28j60_tx	= { DMA1_Channel3,	DMA1_CSELR, (0x01 << DMA_CSELR_C3S_Pos), DMA_ISR_TCIF3, DMA_IFCR_CGIF3, (uint32_t)&ENC28J60_SPI->DR, DMA_CCR_DIR | DMA_CCR_MINC	};
static hw_dma_t dma_enc28j60_rx	= { DMA1_Channel2,	DMA1_CSELR, (0x01 << DMA_CSELR_C2S_Pos), DMA_ISR_TCIF2, DMA_IFCR_CGIF2, (uint32_t)&ENC28J60_SPI->DR, DMA_CCR_MINC 				};
static hw_spi_t enc28j60_spi = { ENC28J60_SPI, &gpio_enc28j60_nss, &dma_enc28j60_tx, &dma_enc28j60_rx, ENC28J60_PRESCALER };

static volatile uint8_t  enc28j60_current_bank = 0;
static volatile uint16_t enc28j60_rxrdpt       = 0;

#define enc28j60_rx()			enc28j60_txrx(0xff)
#define enc28j60_tx(data)		enc28j60_txrx(data)
static uint8_t 	enc28j60_txrx		(uint8_t data);
static void 	enc28j60_select		(void);
static void 	enc28j60_release	(void);


static void enc28j60_select(void)
{
	hw_spi_select(&enc28j60_spi);
}

static void enc28j60_release()
{			
	hw_spi_deselect(&enc28j60_spi);
}

static uint8_t enc28j60_txrx(uint8_t data)
{
	return hw_spi_write_byte(&enc28j60_spi,data);
}

void enc28j60_reset()
{
	/*
	* Assert the ENC28J60 reset pin for 2ms
	*/
	caribou_tick_t start = caribou_timer_ticks();
	
	caribou_gpio_reset(&gpio_enc28j60_reset);

	while(!caribou_timer_ticks_timeout(start,2))
		caribou_thread_yield();

	caribou_gpio_set(&gpio_enc28j60_reset);

	start = caribou_timer_ticks();

	while(!caribou_timer_ticks_timeout(start,2))
		caribou_thread_yield();
}

void enc28j60_setmac(uint8_t* mac)
{
	#if PA_DEBUG
		debug_printf("MAC: %02x:%02x:%02x:%02x:%02x:%02x\n",mac[0],mac[1],mac[2],mac[3],mac[4],mac[5],mac[6]);
	#endif
	enc28j60_wcr(MAADR5, mac[0]);
	enc28j60_wcr(MAADR4, mac[1]);
	enc28j60_wcr(MAADR3, mac[2]);
	enc28j60_wcr(MAADR2, mac[3]);
	enc28j60_wcr(MAADR1, mac[4]);
	enc28j60_wcr(MAADR0, mac[5]);	
}

void enc28j60_init(uint8_t *macadr)
{
	uint8_t b;

	hw_spi_setup(&enc28j60_spi);

	enc28j60_select();

    // RESET the entire ENC28J60, clearing all registers
    // Also wait for CLKRDY to become set.
    // Bit 3 in ESTAT is an unimplemented bit.  If it reads out as '1' that
    // means the part is in RESET or there is something wrong with the SPI
    // connection.  This loop makes sure that we can communicate with the
    // ENC28J60 before proceeding.
	do{
		enc28j60_soft_reset();
		sleep(2);
		b = enc28j60_rcr(ESTAT);
		caribou_thread_yield();
	} while( (b&0x08) || (~b & ESTAT_CLKRDY) );

	// Setup Rx/Tx buffer
	enc28j60_wcr16(ERXST, ENC28J60_RXSTART);
	enc28j60_rcr16(ERXST);
	enc28j60_wcr16(ERXRDPT, ENC28J60_RXSTART);
	enc28j60_wcr16(ERXND, ENC28J60_RXEND);
	enc28j60_rxrdpt = ENC28J60_RXSTART;

	// Setup MAC
	enc28j60_wcr(MACON2, 0);															// Clear reset
	enc28j60_wcr(MACON1, MACON1_TXPAUS|MACON1_RXPAUS|MACON1_MARXEN);					// Enable flow control Enable MAC Rx
	enc28j60_wcr(MACON3, MACON3_PADCFG0|MACON3_TXCRCEN|MACON3_FRMLNEN|MACON3_FULDPX);	// Enable padding, Enable crc & frame len chk
	enc28j60_wcr16(MAMXFL, ENC28J60_MAXFRAME);
	enc28j60_wcr(MABBIPG, 0x15);														// Set inter-frame gap
	enc28j60_wcr(MAIPGL, 0x12);
	enc28j60_wcr(MAIPGH, 0x0c);
    enc28j60_wcr(ERXFCON,	ERXFCON_UCEN|
							ERXFCON_CRCEN|
							ERXFCON_PMEN|
							ERXFCON_MCEN|												// Enable multicast/broadcast RX
							ERXFCON_BCEN);		
    enc28j60_setmac(macadr);															// Set MAC address

	// Setup PHY
	enc28j60_write_phy(PHCON1, PHCON1_PDPXMD); // Force full-duplex mode
	enc28j60_write_phy(PHCON2, PHCON2_HDLDIS); // Disable loopback
	enc28j60_write_phy(PHLCON, PHLCON_LACFG2| // Configure LED ctrl
								PHLCON_LBCFG2|PHLCON_LBCFG1|PHLCON_LBCFG0|
								PHLCON_LFRQ0|PHLCON_STRCH);

	// switch to bank 0
	enc28j60_set_bank(ECON1);
	// enable interrutps
	//enc28j60_write_op(ENC28J60_SPI_BFS, EIE, EIE_INTIE|EIE_PKTIE|EIR_TXIF);
	enc28j60_write_op(ENC28J60_SPI_BFS, EIE, EIE_INTIE|EIE_PKTIE|EIE_LINKIE);
	// Enable Rx packets
	enc28j60_bfs(ECON1, ECON1_RXEN);

	enc28j60_release();
}

// Generic SPI read command
uint8_t enc28j60_read_op(uint8_t cmd, uint8_t adr)
{
	uint8_t data;

	enc28j60_select();
	enc28j60_tx(cmd | (adr & ENC28J60_ADDR_MASK));
	if(adr & 0x80) // throw out dummy byte 
		enc28j60_rx(); // when reading MII/MAC register
	data = enc28j60_rx();
	enc28j60_release();
	return data;
}

// Generic SPI write command
void enc28j60_write_op(uint8_t cmd, uint8_t adr, uint8_t data)
{
	enc28j60_select();
	enc28j60_tx(cmd | (adr & ENC28J60_ADDR_MASK));
	enc28j60_tx(data);
	enc28j60_release();
}

// Initiate software reset
void enc28j60_soft_reset()
{
	enc28j60_select();
	enc28j60_tx(ENC28J60_SPI_SC);
	enc28j60_release();
	
	enc28j60_current_bank = 0;
}

/*
 * Memory access
 */

// Set register bank
void enc28j60_set_bank(uint8_t adr)
{
	uint8_t bank;

	if( (adr & ENC28J60_ADDR_MASK) < ENC28J60_COMMON_CR )
	{
		bank = (adr >> 5) & 0x03; //BSEL1|BSEL0=0x03
		if(bank != enc28j60_current_bank)
		{
			enc28j60_write_op(ENC28J60_SPI_BFC, ECON1, 0x03);	// clear bank bits
			enc28j60_write_op(ENC28J60_SPI_BFS, ECON1, bank);	// set bank bits
			enc28j60_current_bank = bank;
		}
	}
}

// Read register
uint8_t enc28j60_rcr(uint8_t adr)
{
	enc28j60_set_bank(adr);
	return enc28j60_read_op(ENC28J60_SPI_RCR, adr);
}

// Read register pair
uint16_t enc28j60_rcr16(uint8_t adr)
{
	enc28j60_set_bank(adr);
	return enc28j60_read_op(ENC28J60_SPI_RCR, adr) | (enc28j60_read_op(ENC28J60_SPI_RCR, adr+1) << 8);
}

// Write register
void enc28j60_wcr(uint8_t adr, uint8_t arg)
{
	enc28j60_set_bank(adr);
	enc28j60_write_op(ENC28J60_SPI_WCR, adr, arg);
}

// Write register pair
void enc28j60_wcr16(uint8_t adr, uint16_t arg)
{
	enc28j60_set_bank(adr);
	enc28j60_write_op(ENC28J60_SPI_WCR, adr, arg);
	enc28j60_write_op(ENC28J60_SPI_WCR, adr+1, arg>>8);
}

// Clear bits in register (reg &= ~mask)
void enc28j60_bfc(uint8_t adr, uint8_t mask)
{
	enc28j60_set_bank(adr);
	enc28j60_write_op(ENC28J60_SPI_BFC, adr, mask);
}

// Set bits in register (reg |= mask)
void enc28j60_bfs(uint8_t adr, uint8_t mask)
{
	enc28j60_set_bank(adr);
	enc28j60_write_op(ENC28J60_SPI_BFS, adr, mask);
}

#if ENC28J60_USE_DMA
	// Read Rx/Tx buffer (at ERDPT)
	void enc28j60_read_buffer(register uint8_t *buf, register uint16_t len)
	{
		enc28j60_select();
		enc28j60_tx(ENC28J60_SPI_RBM);

		hw_spi_read_data_dma(&enc28j60_spi,buf,len);

		enc28j60_release();
	}

    
	// Write Rx/Tx buffer (at EWRPT)
	void enc28j60_write_buffer(uint8_t *buf, uint16_t len)
	{
		enc28j60_select();
		enc28j60_tx(ENC28J60_SPI_WBM);
		
		hw_spi_write_data_dma(&enc28j60_spi,buf,len);		

		enc28j60_release();
	}

#else
	// Read Rx/Tx buffer (at ERDPT)
	void enc28j60_read_buffer(register uint8_t *buf, register uint16_t len)
	{
		register int n=0;
		register __IO uint8_t *spixdr = (__IO uint8_t *)&ENC28J60_SPI->DR;	// pointer to 8-bit SPI1 data register
		enc28j60_select();
		enc28j60_tx(ENC28J60_SPI_RBM);
		while(n<len)
		{
			while( !(ENC28J60_SPI->SR & SPI_SR_TXE) );
			*spixdr = (uint8_t)0xFF;
			while( !(ENC28J60_SPI->SR & SPI_SR_RXNE) );
			buf[n++] = *spixdr;
		}
		enc28j60_release();
	}

	// Write Rx/Tx buffer (at EWRPT)
	void enc28j60_write_buffer(uint8_t *buf, uint16_t len)
	{
		enc28j60_select();
		enc28j60_tx(ENC28J60_SPI_WBM);
		while(len--)
			enc28j60_tx(*(buf++));
		enc28j60_release();
	}

#endif

// Read PHY register
uint16_t enc28j60_read_phy(uint8_t adr)
{
	enc28j60_wcr(MIREGADR, adr);
	enc28j60_bfs(MICMD, MICMD_MIIRD);
	usleep(15);
	while(enc28j60_rcr(MISTAT) & MISTAT_BUSY)
		caribou_thread_yield();
	enc28j60_bfc(MICMD, MICMD_MIIRD);
	return enc28j60_rcr16(MIRD);
}

// Write PHY register
void enc28j60_write_phy(uint8_t adr, uint16_t data)
{
	enc28j60_wcr(MIREGADR, adr);
	enc28j60_wcr16(MIWR, data);
	while(enc28j60_rcr(MISTAT) & MISTAT_BUSY)
	{
		usleep(15);
		caribou_thread_yield();
	}
}

void enc28j60_send_packet(uint8_t *data, uint16_t len)
{
	while(enc28j60_rcr(ECON1) & ECON1_TXRTS)
	{
		// TXRTS may not clear - ENC28J60 bug. We must reset
		// transmit logic in case of Tx error
		if(enc28j60_rcr(EIR) & EIR_TXERIF)
		{
			enc28j60_bfs(ECON1, ECON1_TXRST);
			enc28j60_bfc(ECON1, ECON1_TXRST);
		}
		caribou_thread_yield();
	}

	enc28j60_wcr16(EWRPT, ENC28J60_TXSTART);
	enc28j60_wcr16(ETXST, ENC28J60_TXSTART);
	enc28j60_wcr16(ETXND, ENC28J60_TXSTART + len);

	// Write per-packet control byte
   	enc28j60_write_op(ENC28J60_SPI_WBM, 0, 0x00);

	// Write packet
	enc28j60_write_buffer(data, len);
	
	// Send the contents of the transmit buffer onto the network
	enc28j60_bfs(ECON1, ECON1_TXRTS); 
}

uint16_t enc28j60_recv_packet(uint8_t *buf, uint16_t buflen)
{
	uint16_t len = 0, rxlen, status, temp;

	if(enc28j60_rcr(EPKTCNT))
	{
		enc28j60_wcr16(ERDPT, enc28j60_rxrdpt);

		enc28j60_read_buffer((void*)&enc28j60_rxrdpt, sizeof(enc28j60_rxrdpt));
		enc28j60_read_buffer((void*)&rxlen, sizeof(rxlen));
		enc28j60_read_buffer((void*)&status, sizeof(status));

		if( status & RSV_RECEIVED_OK && rxlen <= ENC28J60_MAX_PACKET ) //success
		{
			len = rxlen - 4; //throw out crc
			if(len > buflen) len = buflen;
			enc28j60_read_buffer(buf, len);	
		}

		// Set Rx read pointer to next packet
		temp = (enc28j60_rxrdpt - 1) & ENC28J60_BUFEND;
		enc28j60_wcr16(ERXRDPT, temp);

		// Decrement packet counter
		enc28j60_bfs(ECON2, ECON2_PKTDEC);
	}

	return len;
}

uint32_t enc28j60_interrupt_disable(uint32_t level)
{
	uint32_t rc;
	int state = caribou_vector_disable(ETH_IRQn);		/* Disable INT input so no SPI transactions occur . */
    enc28j60_set_bank(EIE);								/* switch to bank 0 */
	rc = enc28j60_rcr(EIE);								/* get last interrupt level */
    enc28j60_write_op(ENC28J60_SPI_BFC, EIE, level);	/* disable interrupts */
	caribou_vector_set(ETH_IRQn,state);					/* Re-Enable INT */
    return rc;
}

void enc28j60_interrupt_enable(uint32_t level)
{
    enc28j60_set_bank(EIE);								/* switch to bank 0 */
    enc28j60_write_op(ENC28J60_SPI_BFS, EIE, level);	/* enable interrupts */
}

/*
 * Access the PHY to determine link status
 */
bool enc28j60_check_link_status(void)
{
	uint16_t reg;
	reg = enc28j60_read_phy(PHSTAT2);
	return (reg & PHSTAT2_LSTAT) ? true : false;
}

/*
 * @brief Enable the CLKOUT signal.
 */
void enc28j60_clkout(uint8_t clk)
{
	//setup clkout: 2 is 12.5MHz:
	enc28j60_wcr(ECOCON, clk & 0x7);
}

// #pragma GCC pop_options
