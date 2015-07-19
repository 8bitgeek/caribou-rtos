/**
 * @file dm9000.c
 * @brief DM9000A/B Ethernet controller
 *
 * @section License
 *
 * Copyright (C) 2010-2014 Oryx Embedded. All rights reserved.
 *
 * This file is part of CycloneTCP Open.
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 *
 * @author Oryx Embedded (www.oryx-embedded.com)
 * @version 1.4.2
 **/

//Switch to the appropriate trace level
#define TRACE_LEVEL NIC_TRACE_LEVEL

//Dependencies
#include "sam7se_ek.h"
#include "tcp_ip_stack.h"
#include "ethernet.h"
#include "dm9000.h"
#include "debug.h"

//Transmit buffer
static uint8_t txBuffer[1536] __attribute__((aligned(2)));


/**
 * @brief DM9000 driver
 **/

const NicDriver dm9000Driver =
{
   dm9000Init,
   dm9000Tick,
   dm9000EnableIrq,
   dm9000DisableIrq,
   dm9000RxEventHandler,
   dm9000SetMacFilter,
   dm9000SendPacket,
   NULL,
   NULL,
   TRUE,
   TRUE,
   TRUE
};


/**
 * @brief DM9000 controller initialization
 * @param[in] interface Underlying network interface
 * @return Error code
 **/

error_t dm9000Init(NetInterface *interface)
{
   uint_t i;
   uint16_t vendorId;
   uint16_t productId;
   uint8_t chipRevision;
   Dm9000Context *context;

   //Debug message
   TRACE_INFO("Initializing DM9000 Ethernet controller...\r\n");

   //Point to the driver context
   context = (Dm9000Context *) interface->nicContext;
   //Initialize driver specific variables
   context->queuedPackets = 0;

   //Enable the peripheral clock of the PIO controllers
   AT91C_BASE_PMC->PMC_PCER = 1 << AT91C_ID_PIOA;
   AT91C_BASE_PMC->PMC_PCER = 1 << AT91C_ID_PIOB;
   AT91C_BASE_PMC->PMC_PCER = 1 << AT91C_ID_PIOC;

   //Assign IRQ1 (PA30) to Peripheral A function
   AT91C_BASE_PIOA->PIO_ASR = AT91C_PA30_IRQ1;
   //Assign NCS2 (PA20) to Peripheral B function
   AT91C_BASE_PIOA->PIO_BSR = AT91C_PA20_NCS2_CFCS1;
   //Disable the PIO from controlling the corresponding pins
   AT91C_BASE_PIOA->PIO_PDR = AT91C_PA30_IRQ1 | AT91C_PA20_NCS2_CFCS1;
   //Disable internal pull-up resistor on IRQ1 pin
   AT91C_BASE_PIOA->PIO_PPUDR = AT91C_PA30_IRQ1;

   //Assign A12 (PB12) to Peripheral B function
   AT91C_BASE_PIOB->PIO_BSR = AT91C_PB12_A12;
   //Disable the PIO from controlling the corresponding pins
   AT91C_BASE_PIOB->PIO_PDR = AT91C_PB12_A12;

   //Assign NRD (PC22) and NWR0 (PC21) to Peripheral B function
   AT91C_BASE_PIOC->PIO_BSR = AT91C_PC22_NRD_CFOE | AT91C_PC21_NWR0_NWE_CFWE;
   //Disable the PIO from controlling the corresponding pins
   AT91C_BASE_PIOC->PIO_PDR = AT91C_PC22_NRD_CFOE | AT91C_PC21_NWR0_NWE_CFWE;

   //Chip select 2 is assigned to the Static Memory Controller
   AT91C_BASE_EBI->EBI_CSA &= ~AT91C_EBI_CS2A;

   //Configure SMC Register
   AT91C_BASE_SMC->SMC2_CSR[2] = AT91C_SMC2_NWS_2 |         //Number of wait states (2 cycles)
                                 AT91C_SMC2_WSEN |          //Wait state enable
                                 AT91C_SMC2_TDF_2 |         //Data float time (2 cycles)
                                 AT91C_SMC2_BAT_16 |        //Byte access type (16-bit)
                                 AT91C_SMC2_DBW_16 |        //Data bus width (8-bit)
                                 AT91C_SMC2_DRP_STANDARD |  //Data read protocol (standard)
                                 AT91C_SMC2_ACSS_STANDARD | //Address to chip select setup (standard)
                                 AT91C_SMC2_RWSETUP_1 |     //Read and write signal setup time (1 + 1/2 cycle)
                                 AT91C_SMC2_RWHOLD_1;       //Read and write signal hold time (1 cycle)

   //Reset DM9000 by asserting NRST pin
   AT91C_BASE_RSTC->RSTC_RMR = AT91C_RSTC_KEY_A5 | AT91C_RSTC_ERSTL_1MS;
   AT91C_BASE_RSTC->RSTC_RCR = AT91C_RSTC_KEY_A5 | AT91C_RSTC_EXTRST;
   //Wait for the reset to complete
   while(!(AT91C_BASE_RSTC->RSTC_RSR & AT91C_RSTC_NRSTL));

   //Delay before accessing DM9000
   sleep(10);

   //Retrieve vendorID, product ID and chip revision
   vendorId = (dm9000ReadReg(DM9000_REG_VIDH) << 8) | dm9000ReadReg(DM9000_REG_VIDL);
   productId = (dm9000ReadReg(DM9000_REG_PIDH) << 8) | dm9000ReadReg(DM9000_REG_PIDL);
   chipRevision = dm9000ReadReg(DM9000_REG_CHIPR);

   //Check vendor ID and product ID
   if(vendorId != DM9000_VID || productId != DM9000_PID)
      return ERROR_WRONG_IDENTIFIER;
   //Check chip revision
   if(chipRevision != DM9000A_CHIP_REV && chipRevision != DM9000B_CHIP_REV)
      return ERROR_WRONG_IDENTIFIER;

   //Power up the internal PHY by clearing PHYPD
   dm9000WriteReg(DM9000_REG_GPR, 0x00);
   //Wait for the PHY to be ready
   sleep(10);

   //Software reset
   dm9000WriteReg(DM9000_REG_NCR, NCR_RST);
   //Wait for the reset to complete
   while(dm9000ReadReg(DM9000_REG_NCR) & NCR_RST);

   //PHY software reset
   dm9000WritePhyReg(DM9000_PHY_REG_BMCR, BMCR_RST);
   //Wait for the PHY reset to complete
   while(dm9000ReadPhyReg(DM9000_PHY_REG_BMCR) & BMCR_RST);

   //Debug message
   TRACE_INFO("  VID = 0x%04" PRIX16 "\r\n", vendorId);
   TRACE_INFO("  PID = 0x%04" PRIX16 "\r\n", productId);
   TRACE_INFO("  CHIPR = 0x%02" PRIX8 "\r\n", chipRevision);
   TRACE_INFO("  PHYIDR1 = 0x%04" PRIX16 "\r\n", dm9000ReadPhyReg(DM9000_PHY_REG_PHYIDR1));
   TRACE_INFO("  PHYIDR2 = 0x%04" PRIX16 "\r\n", dm9000ReadPhyReg(DM9000_PHY_REG_PHYIDR2));

   //Enable loopback mode?
#if (DM9000_LOOPBACK_MODE == TRUE)
   dm9000WriteReg(DM9000_REG_NCR, DM9000_LBK_PHY);
   dm9000WritePhyReg(DM9000_PHY_REG_BMCR, BMCR_LOOPBACK | BMCR_SPEED_SEL | BMCR_AN_EN | BMCR_DUPLEX_MODE);
#endif

   //Set host MAC address
   for(i = 0; i < 6; i++)
      dm9000WriteReg(DM9000_REG_PAR0 + i, interface->macAddr.b[i]);

   //Initialize hash table
   for(i = 0; i < 8; i++)
      dm9000WriteReg(DM9000_REG_MAR0 + i, 0x00);

   //Always accept broadcast packets
   dm9000WriteReg(DM9000_REG_MAR7, 0x80);

   //Enable the Pointer Auto Return function
   dm9000WriteReg(DM9000_REG_IMR, IMR_PAR);
   //Clear NSR status bits
   dm9000WriteReg(DM9000_REG_NSR, NSR_WAKEST | NSR_TX2END | NSR_TX1END);
   //Clear interrupt flags
   dm9000WriteReg(DM9000_REG_ISR, ISR_LNKCHG | ISR_UDRUN | ISR_ROO | ISR_ROS | ISR_PT | ISR_PR);
   //Enable interrupts
   dm9000WriteReg(DM9000_REG_IMR, IMR_PAR | IMR_LNKCHGI | IMR_PTI | IMR_PRI);
   //Enable the receiver by setting RXEN
   dm9000WriteReg(DM9000_REG_RCR, RCR_DIS_LONG | RCR_DIS_CRC | RCR_RXEN);

   //Configure interrupt controller
   AT91C_BASE_AIC->AIC_SMR[AT91C_ID_IRQ1] = AT91C_AIC_SRCTYPE_HIGH_LEVEL | AT91C_AIC_PRIOR_LOWEST;
   AT91C_BASE_AIC->AIC_SVR[AT91C_ID_IRQ1] = (uint_t) dm9000Interrupt;

   //Clear interrupt flag
   AT91C_BASE_AIC->AIC_ICCR = (1 << AT91C_ID_IRQ1);

   //DM9000 transmitter is now ready to send
   osEventSet(interface->nicTxEvent);

   //Successful initialization
   return NO_ERROR;
}


/**
 * @brief DM9000 timer handler
 * @param[in] interface Underlying network interface
 **/

void dm9000Tick(NetInterface *interface)
{
}


/**
 * @brief Enable interrupts
 * @param[in] interface Underlying network interface
 **/

void dm9000EnableIrq(NetInterface *interface)
{
   //Enable IRQ1 interrupts
   AT91C_BASE_AIC->AIC_IECR = (1 << AT91C_ID_IRQ1);
}


/**
 * @brief Disable interrupts
 * @param[in] interface Underlying network interface
 **/

void dm9000DisableIrq(NetInterface *interface)
{
   //Disable IRQ1 interrupts
   AT91C_BASE_AIC->AIC_IDCR = (1 << AT91C_ID_IRQ1);
}


/**
 * @brief DM9000 interrupt service routine
 **/

void __irq dm9000Interrupt(void)
{
   uint8_t status;
   uint8_t mask;

   //Point to the structure describing the network interface
   NetInterface *interface = &netInterface[0];
   //Point to the driver context
   Dm9000Context *context = (Dm9000Context *) interface->nicContext;

   //Read interrupt status register
   status = dm9000ReadReg(DM9000_REG_ISR);

   //Link status change?
   if(status & ISR_LNKCHG)
   {
      //Read interrupt mask register
      mask = dm9000ReadReg(DM9000_REG_IMR);
      //Disable LNKCHGI interrupt
      dm9000WriteReg(DM9000_REG_IMR, mask & ~IMR_LNKCHGI);
      //Notify the user that the link state has changed
      osEventSetFromIrq(interface->nicRxEvent);
   }
   //Packet transmission complete?
   if(status & ISR_PT)
   {
      //Check TX complete status bits
      if(dm9000ReadReg(DM9000_REG_NSR) & (NSR_TX2END | NSR_TX1END))
      {
         //The transmission of the current packet is complete
         if(context->queuedPackets > 0)
            context->queuedPackets--;
         //Notify the user that the transmitter is ready to send
         osEventSetFromIrq(interface->nicTxEvent);
      }
      //Clear interrupt flag
      dm9000WriteReg(DM9000_REG_ISR, ISR_PT);
   }
   //Packet received?
   if(status & ISR_PR)
   {
      //Read interrupt mask register
      mask = dm9000ReadReg(DM9000_REG_IMR);
      //Disable PRI interrupt
      dm9000WriteReg(DM9000_REG_IMR, mask & ~IMR_PRI);
      //Notify the user that a packet has been received
      osEventSetFromIrq(interface->nicRxEvent);
   }

   //Clear IRQ1 interrupt flag
   AT91C_BASE_AIC->AIC_ICCR = (1 << AT91C_ID_IRQ1);
   //The interrupt treatment is complete
   AT91C_BASE_AIC->AIC_EOICR = 0;
}


/**
 * @brief DM9000 event handler
 * @param[in] interface Underlying network interface
 **/

void dm9000RxEventHandler(NetInterface *interface)
{
   uint8_t status;
   uint_t length;

   //Read interrupt status register
   status = dm9000ReadReg(DM9000_REG_ISR);

   //Check whether the link status has changed?
   if(status & ISR_LNKCHG)
   {
      //Clear interrupt flag
      dm9000WriteReg(DM9000_REG_ISR, ISR_LNKCHG);
      //Read network status register
      status = dm9000ReadReg(DM9000_REG_NSR);

      //Check link state
      if(status & NSR_LINKST)
      {
         //Link is up
         interface->linkState = TRUE;
         //Get current speed
         interface->speed100 = (status & NSR_SPEED) ? FALSE : TRUE;

         //Read network control register
         status = dm9000ReadReg(DM9000_REG_NCR);
         //Determine the new duplex mode
         interface->fullDuplex = (status & NCR_FDX) ? TRUE : FALSE;

         //Display link state
         TRACE_INFO("Link is up (%s)...\r\n", interface->name);

         //Display actual speed and duplex mode
         TRACE_INFO("%s %s\r\n",
            interface->speed100 ? "100BASE-TX" : "10BASE-T",
            interface->fullDuplex ? "Full-Duplex" : "Half-Duplex");
      }
      else
      {
         //Link is down
         interface->linkState = FALSE;
         //Display link state
         TRACE_INFO("Link is down (%s)...\r\n", interface->name);
      }

      //Process link state change event
      nicNotifyLinkChange(interface);
   }
   //Check whether a packet has been received?
   if(status & ISR_PR)
   {
      //Clear interrupt flag
      dm9000WriteReg(DM9000_REG_ISR, ISR_PR);

      //Process all the pending packets
      while(1)
      {
         //Check whether a packet has been received
         length = dm9000ReceivePacket(interface, interface->ethFrame, ETH_MAX_FRAME_SIZE);
         //No more packet to process?
         if(!length) break;

         //Only pass valid packets to the upper layer
         if(length != (uint_t) -1)
            nicProcessPacket(interface, interface->ethFrame, length);
      }
   }

   //Re-enable LNKCHGI and PRI interrupts
   dm9000WriteReg(DM9000_REG_IMR, IMR_PAR | IMR_LNKCHGI | IMR_PTI | IMR_PRI);
}


/**
 * @brief Configure multicast MAC address filtering
 * @param[in] interface Underlying network interface
 * @return Error code
 **/

error_t dm9000SetMacFilter(NetInterface *interface)
{
   uint_t i;
   uint_t k;
   uint32_t crc;
   uint8_t hashTable[8];

   //Debug message
   TRACE_INFO("Updating DM9000 hash table...\r\n");

   //Clear hash table
   memset(hashTable, 0, sizeof(hashTable));
   //Always accept broadcast packets regardless of the MAC filter table
   hashTable[7] = 0x80;

   //The MAC filter table contains the multicast MAC addresses
   //to accept when receiving an Ethernet frame
   for(i = 0; i < interface->macFilterSize; i++)
   {
      //Compute CRC over the current MAC address
      crc = dm9000CalcCrc(&interface->macFilter[i].addr, sizeof(MacAddr));
      //Calculate the corresponding index in the table
      k = crc & 0x3F;
      //Update hash table contents
      hashTable[k / 8] |= (1 << (k % 8));
   }

   //Write the hash table to the DM9000 controller
   for(i = 0; i < 8; i++)
      dm9000WriteReg(DM9000_REG_MAR0 + i, hashTable[i]);

   //Debug message
   TRACE_INFO("  MAR = %02" PRIX8 " %02" PRIX8 " %02" PRIX8 " %02" PRIX8 " "
      "%02" PRIX8 " %02" PRIX8 " %02" PRIX8 " %02" PRIX8 "\r\n",
      dm9000ReadReg(DM9000_REG_MAR0), dm9000ReadReg(DM9000_REG_MAR1),
      dm9000ReadReg(DM9000_REG_MAR2), dm9000ReadReg(DM9000_REG_MAR3),
      dm9000ReadReg(DM9000_REG_MAR4), dm9000ReadReg(DM9000_REG_MAR5),
      dm9000ReadReg(DM9000_REG_MAR6), dm9000ReadReg(DM9000_REG_MAR7));

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Send a packet to DM9000
 * @param[in] interface Underlying network interface
 * @param[in] buffer Multi-part buffer containing the data to send
 * @param[in] offset Offset to the first data byte
 * @return Error code
 **/

error_t dm9000SendPacket(NetInterface *interface,
   const ChunkedBuffer *buffer, size_t offset)
{
   size_t i;
   uint16_t *p;

   //Point to the driver context
   Dm9000Context *context = (Dm9000Context *) interface->nicContext;

   //Retrieve the length of the packet
   size_t length = chunkedBufferGetLength(buffer) - offset;

   //Check the frame length
   if(length > 1536)
   {
      //The transmitter can accept another packet
      osEventSet(interface->nicTxEvent);
      //Report an error
      return ERROR_INVALID_LENGTH;
   }

   //Copy user data
   chunkedBufferRead(txBuffer, buffer, offset, length);

   //A dummy write is required before accessing FIFO
   dm9000WriteReg(DM9000_REG_MWCMDX, 0);
   //Select MWCMD register
   *DM9000_INDEX_REG = DM9000_REG_MWCMD;

   //Point to the beginning of the buffer
   p = (uint16_t *) txBuffer;

   //Write data to the FIFO using 16-bit mode
   for(i = length; i > 1; i -= 2)
      *DM9000_DATA_REG = *(p++);

   //Odd number of bytes?
   if(i > 0)
      *DM9000_DATA_REG = *((uint8_t *) p);

   //Write the number of bytes to send
   dm9000WriteReg(DM9000_REG_TXPLL, LSB(length));
   dm9000WriteReg(DM9000_REG_TXPLH, MSB(length));

   //Clear interrupt flag
   dm9000WriteReg(DM9000_REG_ISR, ISR_PT);
   //Start data transfer
   dm9000WriteReg(DM9000_REG_TCR, TCR_TXREQ);

   //The packet was successfully written to FIFO
   context->queuedPackets++;

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Receive a packet from DM9000
 * @param[in] interface Underlying network interface
 * @param[out] buffer Buffer where to store the incoming data
 * @param[in] size Maximum number of bytes that can be received
 * @return Number of bytes that have been received
 **/

uint_t dm9000ReceivePacket(NetInterface *interface,
   uint8_t *buffer, uint_t size)
{
   uint_t i;
   uint16_t length;
   uint16_t *p;
   volatile uint8_t status;
   volatile uint16_t dummy;

   //A dummy read is required before accessing the 4-byte header
   dummy = dm9000ReadReg(DM9000_REG_MRCMDX);

   //Select MRCMDX1 register
   *DM9000_INDEX_REG = DM9000_REG_MRCMDX1;
   //Read the first byte of the header
   status = LSB(*DM9000_DATA_REG);

   //The first byte indicates if a packet has been received
   if(status != 0x01)
   {
      //RX buffer is empty...
      return 0;
   }

   //Select MRCMD register
   *DM9000_INDEX_REG = DM9000_REG_MRCMD;
   //The second byte is the RX status byte
   status = MSB(*DM9000_DATA_REG);

   //Retrieve packet length
   length = *DM9000_DATA_REG;
   //Limit the number of data to read
   size = min(size, length);

   //Check status byte
   if(status & (RSR_LCS | RSR_RWTO | RSR_PLE | RSR_AE | RSR_CE | RSR_FOE))
   {
      //Flush receive FIFO
      for(i = 0; i < length; i += 2)
         dummy = *DM9000_DATA_REG;

      //Report an error
      return (uint_t) -1;
   }

   //Point to the beginning of the buffer
   p = (uint16_t *) buffer;
   //Initialize byte counter
   i = 0;

   //Read data from FIFO using 16-bit mode
   while((i + 1) < size)
   {
      *(p++) = *DM9000_DATA_REG;
      i += 2;
   }

   //Odd number of bytes to read?
   if((i + 1) == size)
   {
      *((uint8_t *) p) = LSB(*DM9000_DATA_REG);
      i += 2;
   }

   //Discard extra bytes
   while(i < length)
   {
      dummy = *DM9000_DATA_REG;
      i += 2;
   }

   //Return the number of bytes that have been received
   return size;
}


/**
 * @brief Write DM9000 register
 * @param[in] address Register address
 * @param[in] data Register value
 **/

void dm9000WriteReg(uint8_t address, uint8_t data)
{
   //Write register address to INDEX register
   *DM9000_INDEX_REG = address;
   //Write register value to DATA register
   *DM9000_DATA_REG = data;
}


/**
 * @brief Read DM9000 register
 * @param[in] address Register address
 * @return Register value
 **/

uint8_t dm9000ReadReg(uint8_t address)
{
   //Write register address to INDEX register
   *DM9000_INDEX_REG = address;
   //Read register value from DATA register
   return *DM9000_DATA_REG;
}


/**
 * @brief Write DM9000 PHY register
 * @param[in] address PHY register address
 * @param[in] data Register value
 **/

void dm9000WritePhyReg(uint8_t address, uint16_t data)
{
   //Write PHY register address
   dm9000WriteReg(DM9000_REG_EPAR, 0x40 | address);
   //Write register value
   dm9000WriteReg(DM9000_REG_EPDRL, LSB(data));
   dm9000WriteReg(DM9000_REG_EPDRH, MSB(data));

   //Start the write operation
   dm9000WriteReg(DM9000_REG_EPCR, EPCR_EPOS | EPCR_ERPRW);
   //PHY access is still in progress?
   while(dm9000ReadReg(DM9000_REG_EPCR) & EPCR_ERRE);

   //Wait 5us minimum
   usleep(5);
   //Clear command register
   dm9000WriteReg(DM9000_REG_EPCR, EPCR_EPOS);
}


/**
 * @brief Read DM9000 PHY register
 * @param[in] address PHY register address
 * @return Register value
 **/

uint16_t dm9000ReadPhyReg(uint8_t address)
{
   //Write PHY register address
   dm9000WriteReg(DM9000_REG_EPAR, 0x40 | address);

   //Start the read operation
   dm9000WriteReg(DM9000_REG_EPCR, EPCR_EPOS | EPCR_ERPRR);
   //PHY access is still in progress?
   while(dm9000ReadReg(DM9000_REG_EPCR) & EPCR_ERRE);

   //Clear command register
   dm9000WriteReg(DM9000_REG_EPCR, EPCR_EPOS);
   //Wait 5us minimum
   usleep(5);

   //Return register value
   return (dm9000ReadReg(DM9000_REG_EPDRH) << 8) | dm9000ReadReg(DM9000_REG_EPDRL);
}


/**
 * @brief CRC calculation
 * @param[in] data Pointer to the data over which to calculate the CRC
 * @param[in] length Number of bytes to process
 * @return Resulting CRC value
 **/

uint32_t dm9000CalcCrc(const void *data, size_t length)
{
   uint_t i;
   uint_t j;

   //Point to the data over which to calculate the CRC
   const uint8_t *p = (uint8_t *) data;
   //CRC preset value
   uint32_t crc = 0xFFFFFFFF;

   //Loop through data
   for(i = 0; i < length; i++)
   {
      //Update CRC value
      crc ^= p[i];
      //The message is processed bit by bit
      for(j = 0; j < 8; j++)
      {
         if(crc & 0x00000001)
            crc = (crc >> 1) ^ 0xEDB88320;
         else
            crc = crc >> 1;
      }
   }

   //Return CRC value
   return crc;
}
