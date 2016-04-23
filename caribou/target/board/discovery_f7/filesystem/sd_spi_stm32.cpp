/******************************************************************************
* Copyright © 2015 Accutron Instruments Inc.
* All Rights Reserved
******************************************************************************/
#include <board.h>
#include <stm32f7xx.h>
#include <stm32f7xx_hal_dma.h>
#include <stm32f7xx_hal_spi.h>
#include <ffconf.h>
#include <diskio.h>
#include <cstatus.h>

#ifdef SHARC_LOADER
	#define THREAD_LOCK()
	#define THREAD_UNLOCK()
#else
	#define THREAD_LOCK()		caribou_thread_lock()
	#define THREAD_UNLOCK()		caribou_thread_unlock()
#endif

/* Definitions for MMC/SDC command */
#define CMD0	(0x40+0)	/* GO_IDLE_STATE */
#define CMD1	(0x40+1)	/* SEND_OP_COND (MMC) */
#define ACMD41	(0xC0+41)	/* SEND_OP_COND (SDC) */
#define CMD8	(0x40+8)	/* SEND_IF_COND */
#define CMD9	(0x40+9)	/* SEND_CSD */
#define CMD10	(0x40+10)	/* SEND_CID */
#define CMD12	(0x40+12)	/* STOP_TRANSMISSION */
#define ACMD13	(0xC0+13)	/* SD_STATUS (SDC) */
#define CMD16	(0x40+16)	/* SET_BLOCKLEN */
#define CMD17	(0x40+17)	/* READ_SINGLE_BLOCK */
#define CMD18	(0x40+18)	/* READ_MULTIPLE_BLOCK */
#define CMD23	(0x40+23)	/* SET_BLOCK_COUNT (MMC) */
#define ACMD23	(0xC0+23)	/* SET_WR_BLK_ERASE_COUNT (SDC) */
#define CMD24	(0x40+24)	/* WRITE_BLOCK */
#define CMD25	(0x40+25)	/* WRITE_MULTIPLE_BLOCK */
#define CMD41   (0x40+41)   /* SEND_OP_COND (ACMD) */
#define CMD55	(0x40+55)	/* APP_CMD */
#define CMD58	(0x40+58)	/* READ_OCR */

/* Card type flags (CardType) */
#define CT_MMC        0x01        /* MMC ver 3 */
#define CT_SD1        0x02        /* SD ver 1 */
#define CT_SD2        0x04        /* SD ver 2 */
#define CT_SDC        (CT_SD1|CT_SD2)    /* SD */
#define CT_BLOCK    0x08        /* Block addressing */

/* Card-Select Controls  (Platform dependent) */
static void SELECT()        
{
	while ( !(SPI_MMC->SR & SPI_FLAG_TXE) ) {;}		/* Wait for transmitter to drain... */
	while ( (SPI_MMC->SR & SPI_FLAG_BSY) ) {;}		/* ...wait for transmitter to drain. */
	caribou_gpio_reset(&gpio_mmc_cs);						/* MMC CS = L */
}

static void DESELECT(void)
{
	while ( !(SPI_MMC->SR & SPI_FLAG_TXE) ) {;}		/* Wait for transmitter to drain... */
	while ( (SPI_MMC->SR & SPI_FLAG_BSY) ) {;}		/* ...wait for transmitter to drain. */
	caribou_gpio_set(&gpio_mmc_cs);							/* MMC CS = H */
}

/*--------------------------------------------------------------------------

   Module Private Functions and Variables

---------------------------------------------------------------------------*/

static const	DWORD	socket_state_mask_cp = (1 << 0);
static const	DWORD	socket_state_mask_wp = (1 << 1);
static volatile	DSTATUS Stat = STA_NOINIT;			/* Disk status */
static volatile	DWORD	Timer1=0;					/* 100Hz decrement timer */
static volatile	DWORD	Timer2=0;					/* 100Hz decrement timer */
static BYTE				CardType=0;					/* Card type flags */
static uint8_t			PowerFlag=0;				/* indicates if "power" is on */

static void socket_wp_init(void)
{
	return;
}

static void card_power(bool on)		/* switch FET for card-socket VCC */
{
}

/**
 * @brief Transmit/Receive a byte to MMC via SPI  (Platform dependent)
 * @param out The output byte
 */
static BYTE stm32_spi_rw( BYTE out )
{
	volatile uint8_t *pDR = (uint8_t*)(&(SPI_MMC->DR));
	while ( !(SPI_MMC->SR & SPI_FLAG_TXE) ) {;}			/* Wait for transmitter to drain... */
	while ( (SPI_MMC->SR & SPI_FLAG_BSY) ) {;}			/* ...wait for transmitter to drain. */
    *pDR = (uint8_t)out;								/* Send byte through the SPI peripheral */
    while ( !(SPI_MMC->SR & SPI_FLAG_RXNE) ) {;}		/* Wait to receive a byte */
	return ((*pDR)&0xFF);								/* Return the byte read from the SPI bus */
}

/**
 * @brief Transmit a byte to MMC via SPI  (Platform dependent)
 */
void xmit_spi( BYTE out)
{
  stm32_spi_rw(out);
}

/**
 * @brief Receive a byte from MMC via SPI  (Platform dependent)
 */
uint8_t rcvr_spi(void)
{
	return stm32_spi_rw(0xff);
}

/* Alternative macro to receive data fast */
void rcvr_spi_m(uint8_t *dst)  
{
	*dst = stm32_spi_rw(0xff);
}

/*-----------------------------------------------------------------------*/
/* Wait for card ready                                                   */
/*-----------------------------------------------------------------------*/

static BYTE wait_ready (void)
{
	BYTE res;


	Timer2 = 50;	/* Wait for ready in timeout of 500ms */
	rcvr_spi();
	do
		res = rcvr_spi();
	while ((res != 0xFF) && Timer2);

	return res;
}

/// Send 80 or so clock transitions with CS and DI held high. This is
/// required after card power up to get it into SPI mode
void send_initial_clock_train(void)
{
    volatile unsigned int i;
    uint32_t dat;

    /* Ensure CS is held high. */
    DESELECT();
    /* Wiggle the clock the required number of times. */
    for(i = 0 ; i < 10 ; i++)
    {
        xmit_spi(0xFF);
    }
}


/// Power Control  (Platform dependent)
/// When the target system does not support socket power control, there
/// is nothing to do in these functions and chk_power always returns 1.
void power_on (void)
{
    /* Deassert the SSI0 chip select */
    DESELECT();
	caribou_thread_sleep_current(from_ms(2));

    /* Set DI and CS high and apply more than 74 pulses to SCLK for the card */
    /* to be able to accept a native command. */
    send_initial_clock_train();

    PowerFlag = 1;
}

void power_off (void)
{
    PowerFlag = 0;
}


int chk_power(void)        /* Socket power state: 0=off, 1=on */
{
    return PowerFlag;
}

#if STM32_SD_USE_DMA
/**
 * @brief Transmit/Receive Block using DMA (Platform dependent. STM32 here)
 * @param receive FALSE for buff->SPI, TRUE for SPI->buff
 * @param buff receive TRUE  : 512 byte data block to be transmitted, 
 *        receive FALSE : Data buffer to store received data
 * @param btr receive TRUE  : Byte count (must be multiple of 2),
 *        receive FALSE : Byte count (must be 512)
 */
static void stm32_dma_transfer( bool receive, register BYTE *buff, register uint32_t btr )
{
	uint8_t dummy=0xFF;
	register uint8_t *pDR = (uint8_t*)(&(SPI_MMC->DR));
	while ( !(SPI_MMC->SR & SPI_FLAG_TXE) ) {;}					/* Wait for transmitter to drain... */
	while ( (SPI_MMC->SR & SPI_FLAG_BSY) ) {;}					/* ...wait for transmitter to drain. */
	if ( receive )
	{
		while ( btr-- )
		{
			*pDR = (uint8_t)dummy;								/* Send dummy byte through the SPI peripheral */
			while ( !(SPI_MMC->SR & SPI_FLAG_RXNE) ) {;}		/* Wait to receive a byte */
			*buff++ = (uint8_t)(*pDR);							/* Return the byte read from the SPI bus */
		}
	}
	else
	{
		while ( btr-- )
		{
			*pDR = (uint8_t)*buff++;							/* Send dummy byte through the SPI peripheral */
			while ( !(SPI_MMC->SR & SPI_FLAG_RXNE) ) {;}		/* Wait to receive a byte */
			dummy = (uint8_t)(*pDR);							/* Return the byte read from the SPI bus */
		}
	}
}
#endif /* STM32_SD_USE_DMA */


/**
 * @brief Receive a data packet from MMC
 * @param buff Data buffer to store received data
 * @param btr Byte count (must be multiple of 4)
 */
static bool rcvr_datablock( uint8_t *buff, uint32_t btr )
{
    uint8_t token;
    Timer1 = 10;
    do {                            /* Wait for data packet in timeout of 100ms */
        token = rcvr_spi();
    } while ((token == 0xFF) && Timer1);
    if(token == 0xFE)
    {
		#if STM32_SD_USE_DMA
			stm32_dma_transfer( true, buff, btr );
		#else
			do {                            /* Receive the data block into buffer */
				rcvr_spi_m(buff++);
				rcvr_spi_m(buff++);
				rcvr_spi_m(buff++);
				rcvr_spi_m(buff++);
			} while (btr -= 4);
		#endif
		rcvr_spi();                        /* Discard CRC */
		rcvr_spi();
		return true;                    /* Return with success */
    }
    return false;
}

/**
 * @brief Send a data packet to MMC
 * @param buff 512 byte data block to be transmitted
 * @param token Data/Stop token
 */
bool xmit_datablock( const uint8_t *buff, uint8_t token )
{
	BYTE resp;
	#if !STM32_SD_USE_DMA
		BYTE wc;
	#endif

	if (wait_ready() == 0xFF)
	{
		xmit_spi(token);					/* transmit data token */
		if (token != 0xFD)					/* Is data token */
		{				
			#if STM32_SD_USE_DMA
				stm32_dma_transfer( false, (BYTE*)buff, 512 );
			#else
				wc = 0;
				do {						/* transmit the 512 byte data block to MMC */
					xmit_spi(*buff++);
					xmit_spi(*buff++);
				} while (--wc);
			#endif 
			xmit_spi(0xFF);					/* CRC (Dummy) */
			xmit_spi(0xFF);
			resp = rcvr_spi();				/* Receive data response */
			if ((resp & 0x1F) != 0x05)		/* If not accepted, return with error */
				return false;
		}
		return true;
	}
	return false;
}

/** 
 * @brief Send a command packet to MMC
 * @param cmd Command byte
 * @param arm Argument
 */
uint8_t send_cmd( uint8_t cmd, uint32_t arg )
{
    uint8_t n, res;

    if (wait_ready() == 0xFF)
    {
		/* Send command packet */
		xmit_spi(cmd);							/* Command */
		xmit_spi((uint8_t)(arg >> 24));			/* Argument[31..24] */
		xmit_spi((uint8_t)(arg >> 16));			/* Argument[23..16] */
		xmit_spi((uint8_t)(arg >> 8));			/* Argument[15..8] */
		xmit_spi((uint8_t)arg);					/* Argument[7..0] */
		n = 0;
		if (cmd == CMD0) n = 0x95;				/* CRC for CMD0(0) */
		if (cmd == CMD8) n = 0x87;				/* CRC for CMD8(0x1AA) */
		xmit_spi(n);

		/* Receive command response */
		if (cmd == CMD12) rcvr_spi();			/* Skip a stuff byte when stop reading */
		n = 10;									/* Wait for a valid response in timeout of 10 attempts */
		do {
			res = rcvr_spi();
		} while ((res & 0x80) && --n);

		return res;								/* Return with the response value */
    }
	return 0xFF;
}

/** 
 * @brief Initialize the interface - Pinched from the CommTrax 1.2.4 version 
 */
DSTATUS disk_initialize( uint8_t drv )
{
    uint8_t n, ty, ocr[4];

    if (drv) return STA_NOINIT;				/* Supports only single drive */
    if (Stat & STA_NODISK) return Stat;		/* No card in the socket */

    power_on();								/* Force socket power on */

    SELECT();								/* CS = L */
    ty = 0;
    if (send_cmd(CMD0, 0) == 1) {			/* Enter Idle state */
        Timer1 = 100;						/* Initialization timeout of 1000 msec */
		/* SDC Ver2+ ? */
        if (send_cmd(CMD8, 0x1AA) == 1) 
		{   
            for (n = 0; n < 4; n++) ocr[n] = rcvr_spi();
            /* The card can work at vdd range of 2.7-3.6V? */
            if (ocr[2] == 0x01 && ocr[3] == 0xAA) 
			{    
                do 
				{
                    if (send_cmd(CMD55, 0) <= 1 && send_cmd(CMD41, 1UL << 30) == 0)    
						break;				/* ACMD41 with HCS bit */
                } while (Timer1);
                /* Check CCS bit */
                if (Timer1 && send_cmd(CMD58, 0) == 0) 
				{   
                    for (n = 0; n < 4; n++) ocr[n] = rcvr_spi();
                    ty = (ocr[0] & 0x40) ? 6 : 2;
                }
            }
        } 
		else 
		{    
			/* SDC Ver1 or MMC */
            ty = (send_cmd(CMD55, 0) <= 1 && send_cmd(CMD41, 0) <= 1) ? 2 : 1;	/* SDC : MMC */
            do {
                if (ty == 2) 
				{
                    if (send_cmd(CMD55, 0) <= 1 && send_cmd(CMD41, 0) == 0)  /* ACMD41 */
						break;
                } 
				else 
				{
                    if (send_cmd(CMD1, 0) == 0)  /* CMD1 */
						break;                               
                }
            } while (Timer1);
            /* Select R/W block length */
            if (!Timer1 || send_cmd(CMD16, 512) != 0)  
			{
                ty = 0;
			}
        }
    }
    CardType = ty;
    DESELECT();            /* CS = H */
    rcvr_spi();            /* Idle (Release DO) */

    if (ty) 
	{   
		/* Initialization succeeded */
        Stat &= ~STA_NOINIT; /* Clear STA_NOINIT */
    } 
	else 
	{
		/* Initialization failed */
        power_off();
    }

    return Stat;
}

/**
 * @brief Get Disk Status
 * @param drv Physical drive nmuber (0)
 */
DSTATUS disk_status( uint8_t drv )
{
	if (drv) 
		return STA_NOINIT;		/* Supports only single drive */
	return Stat;
}

/**
 * @brief Read Sector(s)
 * @param drv Physical drive nmuber (0)
 * @param buff Pointer to the data buffer to store read data
 * @param sector Start sector number (LBA)
 * @param count Sector count (1..255) 
 */
DRESULT disk_read( BYTE drv, BYTE *buff, DWORD sector, UINT count )
{
    if (drv || !count) 
		return RES_PARERR;
    if (Stat & STA_NOINIT) 
		return RES_NOTRDY;

	Accutron::CStatus::discReadOn();

	/* Convert to byte address if needed */
    if (!(CardType & 4)) 
		sector *= 512;    

    SELECT();									/* CS = L */

    if (count == 1)								
	{
		/* Single block read */
        if ( (send_cmd(CMD17, sector) == 0) && rcvr_datablock(buff, 512) )
		{
            count = 0;
		}
    }
    else 
	{   
		/* Multiple block read */
        if (send_cmd(CMD18, sector) == 0) 
		{
            do 
			{
                if (!rcvr_datablock(buff, 512)) 
					break;
                buff += 512;
            } while (--count);
            send_cmd(CMD12, 0);	/* STOP_TRANSMISSION */
        }
    }

    DESELECT();									/* CS = H */
    rcvr_spi();									/* Idle (Release DO) */

	Accutron::CStatus::discReadOff();

    return count ? RES_ERROR : RES_OK;
}

/**
 * @brief Write Sector(s)
 * @param drv Physical drive nmuber (0)
 * @param Pointer to the data to be written
 * @param Start sector number (LBA)
 * @param Sector count (1..255)
 */
DRESULT disk_write (BYTE drv, const BYTE* buff, DWORD sector, UINT count)
{
	if (drv || !count) return RES_PARERR;
	if (Stat & STA_NOINIT) return RES_NOTRDY;
	if (Stat & STA_PROTECT) return RES_WRPRT;

	Accutron::CStatus::discWriteOn();

	/* Convert to byte address if needed */
	if (!(CardType & 4)) 
		sector *= 512;

	SELECT();								/* CS = L */

	if (count == 1) 
	{    
		/* Single block write */
		if ((send_cmd(CMD24, sector) == 0) && xmit_datablock(buff, 0xFE))
		{
			count = 0;
		}
	}
	else
	{                
		/* Multiple block write */
		if (CardType & 2)
		{
			send_cmd(CMD55, 0); 
			send_cmd(CMD23, count);
		}
		if (send_cmd(CMD25, sector) == 0)
		{    
			do
			{
				if (!xmit_datablock(buff, 0xFC)) 
					break;
				buff += 512;
			} while (--count);
			if (!xmit_datablock(0, 0xFD))	/* STOP_TRAN token */
				count = 1;
		}
	}

	DESELECT();            /* CS = H */
	rcvr_spi();            /* Idle (Release DO) */

	Accutron::CStatus::discWriteOff();

	return count ? RES_ERROR : RES_OK;
}

/**
 * @brief Miscellaneous Functions
 * @param drv Physical drive nmuber (0)
 * @param ctrl Control code
 * @param buff Buffer to send/receive control data
 */
DRESULT disk_ioctl( BYTE drv, BYTE ctrl, void *buff )
{
    uint8_t res;
    uint8_t n, csd[16], *ptr = (uint8_t*)buff;
    WORD csize;

    if (drv) return RES_PARERR;

    res = RES_ERROR;

    if (ctrl == CTRL_POWER) {
        switch (*ptr) {
        case 0:        /* Sub control code == 0 (POWER_OFF) */
            if (chk_power())
                power_off();        /* Power off */
            res = RES_OK;
            break;
        case 1:        /* Sub control code == 1 (POWER_ON) */
            power_on();                /* Power on */
            res = RES_OK;
            break;
        case 2:        /* Sub control code == 2 (POWER_GET) */
            *(ptr+1) = (uint8_t)chk_power();
            res = RES_OK;
            break;
        default :
            res = RES_PARERR;
        }
    }
    else {
        if (Stat & STA_NOINIT) return RES_NOTRDY;

        SELECT();        /* CS = L */

        switch (ctrl) {
        case GET_SECTOR_COUNT :    /* Get number of sectors on the disk (uint32_t) */
            if ((send_cmd(CMD9, 0) == 0) && rcvr_datablock(csd, 16)) {
                if ((csd[0] >> 6) == 1) {    /* SDC ver 2.00 */
                    csize = csd[9] + ((WORD)csd[8] << 8) + 1;
                    *(uint32_t*)buff = (uint32_t)csize << 10;
                } else {                    /* MMC or SDC ver 1.XX */
                    n = (csd[5] & 15) + ((csd[10] & 128) >> 7) + ((csd[9] & 3) << 1) + 2;
                    csize = (csd[8] >> 6) + ((WORD)csd[7] << 2) + ((WORD)(csd[6] & 3) << 10) + 1;
                    *(uint32_t*)buff = (uint32_t)csize << (n - 9);
                }
                res = RES_OK;
            }
            break;

        case GET_SECTOR_SIZE :    /* Get sectors on the disk (WORD) */
            *(WORD*)buff = 512;
            res = RES_OK;
            break;

        case CTRL_SYNC :    /* Make sure that data has been written */
            if (wait_ready() == 0xFF)
                res = RES_OK;
            break;

        case MMC_GET_CSD :    /* Receive CSD as a data block (16 bytes) */
            if (send_cmd(CMD9, 0) == 0        /* READ_CSD */
                && rcvr_datablock(ptr, 16))
                res = RES_OK;
            break;

        case MMC_GET_CID :    /* Receive CID as a data block (16 bytes) */
            if (send_cmd(CMD10, 0) == 0        /* READ_CID */
                && rcvr_datablock(ptr, 16))
                res = RES_OK;
            break;

        case MMC_GET_OCR :    /* Receive OCR as an R3 resp (4 bytes) */
            if (send_cmd(CMD58, 0) == 0) {    /* READ_OCR */
                for (n = 0; n < 4; n++)
                    *ptr++ = rcvr_spi();
                res = RES_OK;
            }

        case MMC_GET_TYPE :    /* Get card type flags (1 byte) */
            *ptr = CardType;
            res = RES_OK;
            break;

        default:
            res = RES_PARERR;
        }

        DESELECT();            /* CS = H */
        rcvr_spi();            /* Idle (Release DO) */
    }

    return (DRESULT)res;
}

/// Device Timer Interrupt Procedure  (Platform dependent)
/// This function must be called in period of 10ms
extern "C" void disk_timerproc(void)
{
//    uint8_t n, s;
    uint8_t n;

    n = Timer1;                        /* 100Hz decrement timer */
    if (n) Timer1 = --n;
    n = Timer2;
    if (n) Timer2 = --n;
}

/// User Provided Timer Function for FatFs module
///---------------------------------------------------------
/// This is a real time clock service to be called from
/// FatFs module. Any valid time must be returned even if
/// the system does not support a real time clock.
extern "C" uint32_t get_fattime (void)
{

    return    ((2013UL-1980) << 25)		// Year = 2013
            | (6UL << 21)				// Month = June
            | (5UL << 16)				// Day = 5
            | (11U << 11)				// Hour = 11
            | (38U << 5)				// Min = 38
            | (0U >> 1)					// Sec = 0
            ;
}

/** 
 * @brief Create a sync object 
 */
extern "C" int ff_cre_syncobj (BYTE vol, _SYNC_t* sobj)
{
	*sobj = caribou_mutex_new(CARIBOU_MUTEX_F_RECURSIVE);
	return (*sobj != NULL);
}

/**
 * @brief Lock sync object 
 */
extern "C" int ff_req_grant (_SYNC_t sobj)
{
	caribou_tick_t start = to_ms(caribou_timer_ticks());
	while(!caribou_timer_ticks_timeout(start,_FS_TIMEOUT))
	{
		if ( caribou_mutex_trylock(sobj) )
		{
			return 1;
		}
	}
	return 0;
}

/**
 * @brief Unlock sync object 
 */
extern "C" void ff_rel_grant (_SYNC_t sobj)
{
	caribou_mutex_unlock(sobj);
}

/**
 * @brief Delete a sync object 
 */
extern "C" int ff_del_syncobj (_SYNC_t sobj)
{
	caribou_mutex_free(sobj);
}

