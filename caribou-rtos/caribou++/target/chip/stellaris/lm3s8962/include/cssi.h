/***************************************************************************
 *   Copyright © 2005-2013 by Pike Aerospace Research Corporation          *
 *   info@pikeaero.com                                                     *
 *                                                                         *
 *   This program is free software: you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation, either version 3 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 *   This program is distributed in the hope that it will be useful,       *
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
 *   GNU General Public License for more details.                          *
 *                                                                         *
 *   You should have received a copy of the GNU General Public License     *
 *   along with this program.  If not, see <http://www.gnu.org/licenses/>. *
 **************************************************************************/
#ifndef CARIBOUCSSI_H
#define CARIBOUCSSI_H

#include "cobject.h"

/* Definitions for MMC/SDC command */
#define CMD0		(0x40+0)	/* GO_IDLE_STATE */
#define CMD1		(0x40+1)	/* SEND_OP_COND */
#define CMD8		(0x40+8)	/* SEND_IF_COND */
#define CMD9		(0x40+9)	/* SEND_CSD */
#define CMD10		(0x40+10)	/* SEND_CID */
#define CMD12		(0x40+12)	/* STOP_TRANSMISSION */
#define CMD16		(0x40+16)	/* SET_BLOCKLEN */
#define CMD17		(0x40+17)	/* READ_SINGLE_BLOCK */
#define CMD18		(0x40+18)	/* READ_MULTIPLE_BLOCK */
#define CMD23		(0x40+23)	/* SET_BLOCK_COUNT */
#define CMD24		(0x40+24)	/* WRITE_BLOCK */
#define CMD25		(0x40+25)	/* WRITE_MULTIPLE_BLOCK */
#define CMD41		(0x40+41)	/* SEND_OP_COND (ACMD) */
#define CMD55		(0x40+55)	/* APP_CMD */
#define CMD58		(0x40+58)	/* READ_OCR */

/* Peripheral definitions for EK-LM3S8962 board */
// SSI port
#define SDC_SSI_BASE            SSI0_BASE
#define SDC_SSI_SYSCTL_PERIPH   SYSCTL_PERIPH_SSI0

// GPIO for SSI pins
#define SDC_GPIO_PORT_BASE      GPIO_PORTA_BASE
#define SDC_GPIO_SYSCTL_PERIPH  SYSCTL_PERIPH_GPIOA
#define SDC_SSI_CLK             GPIO_PIN_2
#define SDC_SSI_TX              GPIO_PIN_5
#define SDC_SSI_RX              GPIO_PIN_4
#define SDC_SSI_FSS             GPIO_PIN_3
#define SDC_SSI_PINS            (SDC_SSI_TX | SDC_SSI_RX | SDC_SSI_CLK)


// GPIO for card chip select
#define SDC_CS_GPIO_PORT_BASE      GPIO_PORTG_BASE
#define SDC_CS_GPIO_SYSCTL_PERIPH  SYSCTL_PERIPH_GPIOG
#define SDC_CS                     GPIO_PIN_0


namespace CARIBOU {

	/**
	 ** @brief Implements the on-chip SSI port device.
	 ** @author Mike Sharkey <mike@pikeaero.com>
	 **/
	class CSsi : public  CObject
	{
		public:
			CSsi();
			virtual ~CSsi();

		protected:

			void							hwConfigSetExpClk(uint32_t ulSSIClk,uint32_t ulProtocol, uint32_t ulMode, uint32_t ulBitRate, uint32_t ulDataWidth);
			void							hwDataGet(uint32_t *pulData);
			int32_t							hwDataGetNonBlocking(uint32_t *pulData);
			void							hwDataPut(uint32_t ulData);
			int32_t							hwDataPutNonBlocking(uint32_t ulData);
			void							hwDisable();
			void							hwEnable();
			void							hwIntClear(uint32_t ulIntFlags);
			void							hwIntDisable(uint32_t ulIntFlags);
			void							hwIntEnable(uint32_t ulIntFlags);
			uint32_t						hwIntStatus(bool bMasked);
			void							hwDMAEnable(uint32_t ulDMAFlags);
			void							hwDMADisable(uint32_t ulDMAFlags);
			bool							hwBusy();

		private:
			uint32_t						mBase;

	};

}

#endif
