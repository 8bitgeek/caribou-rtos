/**
 * @file main.c
 * @brief Main routine
 *
 * @section License
 *
 * Copyright (C) 2010-2014 Oryx Embedded. All rights reserved.
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

//Application configuration
#define USE_DHCP

//Dependencies
#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>
#include <intrinsics.h>
#include <iorx63n.h>
#include "yrdkrx63n.h"
#include "mcu_info.h"
#include "r_rspi_rx600.h"
#include "glyph.h"
#include "os_port.h"
#include "tcp_ip_stack.h"
#include "rx63n_eth.h"
#include "dp83620.h"
#include "dhcp_client.h"
#include "ftp_client.h"
#include "error.h"
#include "debug.h"

//FreeRTOS specific headers
#include "freertos.h"
#include "task.h"

//Global variables
T_glyphHandle lcdHandle;
uint_t lcdLine = 0;
uint_t lcdColumn = 0;

DhcpClientSettings dhcpClientSettings;
DhcpClientCtx dhcpClientContext;


/**
 * @brief Set cursor location
 * @param[in] line Line number
 * @param[in] column Column number
 **/

void lcdSetCursor(uint_t line, uint_t column)
{
   lcdLine = min(line, 8);
   lcdColumn = min(column, 12);
}


/**
 * @brief Write a character to the LCD display
 * @param[in] c Character to be written
 **/

void lcdPutChar(char_t c)
{
   if(c == '\r')
   {
      lcdColumn = 0;
   }
   else if(c == '\n')
   {
      lcdColumn = 0;
      lcdLine++;
   }
   else if(lcdLine < 8 && lcdColumn < 12)
   {
      //Display current character
      GlyphSetXY(lcdHandle, lcdColumn * 8, lcdLine * 8);
      GlyphChar(lcdHandle, c);

      //Advance the cursor position
      if(++lcdColumn >= 12)
      {
         lcdColumn = 0;
         lcdLine++;
      }
   }
}


/**
 * @brief FTP client test routine
 * @return Error code
 **/

error_t ftpClientTest(void)
{
   error_t error;
   size_t length;
   IpAddr ipAddr;
   FtpClientContext ftpContext;
   static char_t buffer[256];

   //Debug message
   TRACE_INFO("\r\n\r\nResolving server name...\r\n");
   //Resolve FTP server name
   error = getHostByName(NULL, "ftp.gnu.org", &ipAddr, 0);

   //Any error to report?
   if(error)
   {
      //Debug message
      TRACE_INFO("Failed to resolve server name!\r\n");
      //Exit immediately
      return error;
   }

   //Debug message
   TRACE_INFO("Connecting to FTP server %s\r\n", ipAddrToString(&ipAddr, NULL));
   //Connect to the FTP server
   error = ftpConnect(&ftpContext, NULL, &ipAddr, 21, FTP_NO_SECURITY | FTP_PASSIVE_MODE);

   //Any error to report?
   if(error)
   {
      //Debug message
      TRACE_INFO("Failed to connect to FTP server!\r\n");
      //Exit immediately
      return error;
   }

   //Debug message
   TRACE_INFO("Successful connection\r\n");

   //Start of exception handling block
   do
   {
      //Login to the FTP server using the provided username and password
      error = ftpLogin(&ftpContext, "anonymous", "password", "");
      //Any error to report?
      if(error) break;

      //Open the specified file for reading
      error = ftpOpenFile(&ftpContext, "welcome.msg", FTP_FOR_READING | FTP_BINARY_TYPE);
      //Any error to report?
      if(error) break;

      //Dump the contents of the file
      while(1)
      {
         //Read data
         error = ftpReadFile(&ftpContext, buffer, sizeof(buffer) - 1, &length, 0);
         //End of file?
         if(error) break;

         //Properly terminate the string with a NULL character
         buffer[length] = '\0';
         //Dump current data
         TRACE_INFO("%s", buffer);
      }

      //End the string with a line feed
      TRACE_INFO("\r\n");
      //Close the file
      error = ftpCloseFile(&ftpContext);

      //End of exception handling block
   } while(0);

   //Close the connection
   ftpClose(&ftpContext);
   //Debug message
   TRACE_INFO("Connection closed...\r\n");

   //Return status code
   return error;
}


/**
 * @brief User task
 **/

void userTask(void *param)
{
   char_t buffer[40];

   //Point to the network interface
   NetInterface *interface = &netInterface[0];

   //Display IPv4 address
   lcdSetCursor(3, 0);
   printf("IPv4 Addr");
   lcdSetCursor(6, 0);
   printf("Press SW1 to");
   lcdSetCursor(7, 0);
   printf("run test");

   //Endless loop
   while(1)
   {
      //Refresh IPv4 address
      lcdSetCursor(4, 0);
      printf("%-16s", ipv4AddrToString(interface->ipv4Config.addr, buffer));

      //SW1 button pressed?
      if(!SW1)
      {
         //FTP client test routine
         ftpClientTest();

         //Wait for SW1 button to be released
         while(!SW1);
      }

      //100ms delay
      osDelay(100);
   }
}


/**
 * @brief LED blinking task
 **/

void blinkTask(void *parameters)
{
   while(1)
   {
      LED4 = LED_ON;
      LED5 = LED_ON;
      LED8 = LED_ON;
      LED9 = LED_ON;
      LED12 = LED_ON;
      LED13 = LED_ON;
      osDelay(100);

      LED4 = LED_OFF;
      LED5 = LED_OFF;
      LED8 = LED_OFF;
      LED9 = LED_OFF;
      LED12 = LED_OFF;
      LED13 = LED_OFF;
      osDelay(900);
   }
}


/**
 * @brief I/O initialization
 **/

void ioInit(void)
{
   //Configure LED4
   PORTD.PODR.BIT.B5 = 1;
   PORTD.PDR.BIT.B5 = 1;
   //Configure LED5
   PORTE.PODR.BIT.B3 = 1;
   PORTE.PDR.BIT.B3 = 1;
   //Configure LED6
   PORTD.PODR.BIT.B2 = 1;
   PORTD.PDR.BIT.B2 = 1;
   //Configure LED7
   PORTE.PODR.BIT.B0 = 1;
   PORTE.PDR.BIT.B0 = 1;
   //Configure LED8
   PORTD.PODR.BIT.B4 = 1;
   PORTD.PDR.BIT.B4 = 1;
   //Configure LED9
   PORTE.PODR.BIT.B2 = 1;
   PORTE.PDR.BIT.B2 = 1;
   //Configure LED10
   PORTD.PODR.BIT.B1 = 1;
   PORTD.PDR.BIT.B1 = 1;
   //Configure LED11
   PORTD.PODR.BIT.B7 = 1;
   PORTD.PDR.BIT.B7 = 1;
   //Configure LED12
   PORTD.PODR.BIT.B3 = 1;
   PORTD.PDR.BIT.B3 = 1;
   //Configure LED13
   PORTE.PODR.BIT.B1 = 1;
   PORTE.PDR.BIT.B1 = 1;
   //Configure LED14
   PORTD.PODR.BIT.B0 = 1;
   PORTD.PDR.BIT.B0 = 1;
   //Configure LED15
   PORTD.PODR.BIT.B6 = 1;
   PORTD.PDR.BIT.B6 = 1;

   //Configure SW1
   PORT4.PDR.BIT.B0 = 0;
   //Configure SW2
   PORT4.PDR.BIT.B1 = 0;
   //Configure SW3
   PORT4.PDR.BIT.B4 = 0;
}


/**
 * @brief Main entry point
 * @return Unused value
 **/

int_t main(void)
{
   error_t error;
   MacAddr macAddr;
   Ipv4Addr ipv4Addr;
   Ipv6Addr ipv6Addr;
   NetInterface *interface;
   OsTask *task;

   //Configure debug UART
   debugInit(115200);

   //Start-up message
   TRACE_INFO("\r\n");
   TRACE_INFO("**********************************\r\n");
   TRACE_INFO("*** CycloneTCP FTP Client Demo ***\r\n");
   TRACE_INFO("**********************************\r\n");
   TRACE_INFO("Copyright: 2010-2014 Oryx Embedded\r\n");
   TRACE_INFO("Compiled: %s %s\r\n", __DATE__, __TIME__);
   TRACE_INFO("Target: RX63N\r\n");
   TRACE_INFO("\r\n");

   //Configure I/Os
   ioInit();

   //Initialize RSPI channel
   R_RSPI_Init(RSPI_CHANNEL_0);
   //Initialize LCD display
   GlyphOpen(&lcdHandle, 0);
   GlyphNormalScreen(lcdHandle);
   GlyphSetFont(lcdHandle, GLYPH_FONT_6_BY_13);
   //Clear display
   GlyphClearScreen(lcdHandle);

   //Welcome message
   lcdSetCursor(0, 0);
   printf("FTP Client\r\nDemo");

   //TCP/IP stack initialization
   error = tcpIpStackInit();
   //Any error to report?
   if(error)
   {
      //Debug message
      TRACE_ERROR("Failed to initialize TCP/IP stack!\r\n");
   }

   //Configure the first Ethernet interface
   interface = &netInterface[0];

   //Set interface name
   tcpIpStackSetInterfaceName(interface, "eth0");
   //Set host name
   tcpIpStackSetHostname(interface, "FTPClientDemo");
   //Select the relevant network adapter
   tcpIpStackSetDriver(interface, &rx63nEthDriver);
   tcpIpStackSetPhyDriver(interface, &dp83620PhyDriver);
   //Set host MAC address
   macStringToAddr("00-AB-CD-EF-18-30", &macAddr);
   tcpIpStackSetMacAddr(interface, &macAddr);

   //Initialize network interface
   error = tcpIpStackConfigInterface(interface);
   //Any error to report?
   if(error)
   {
      //Debug message
      TRACE_ERROR("Failed to configure interface %s!\r\n", interface->name);
   }

#if (IPV4_SUPPORT == ENABLED)
#if defined(USE_DHCP)
   //Get default settings
   dhcpClientGetDefaultSettings(&dhcpClientSettings);
   //Set the network interface to be configured by DHCP
   dhcpClientSettings.interface = interface;
   //Disable rapid commit option
   dhcpClientSettings.rapidCommit = FALSE;

   //DHCP client initialization
   error = dhcpClientInit(&dhcpClientContext, &dhcpClientSettings);
   //Failed to initialize DHCP client?
   if(error)
   {
      //Debug message
      TRACE_ERROR("Failed to initialize DHCP client!\r\n");
   }

   //Start DHCP client
   error = dhcpClientStart(&dhcpClientContext);
   //Failed to start DHCP client?
   if(error)
   {
      //Debug message
      TRACE_ERROR("Failed to start DHCP client!\r\n");
   }
#else
   //Set IPv4 host address
   ipv4StringToAddr("192.168.0.20", &ipv4Addr);
   ipv4SetHostAddr(interface, ipv4Addr);

   //Set subnet mask
   ipv4StringToAddr("255.255.255.0", &ipv4Addr);
   ipv4SetSubnetMask(interface, ipv4Addr);

   //Set default gateway
   ipv4StringToAddr("192.168.0.254", &ipv4Addr);
   ipv4SetDefaultGateway(interface, ipv4Addr);

   //Set primary and secondary DNS servers
   ipv4StringToAddr("8.8.8.8", &ipv4Addr);
   ipv4SetDnsServer(interface, 0, ipv4Addr);
   ipv4StringToAddr("8.8.4.4", &ipv4Addr);
   ipv4SetDnsServer(interface, 1, ipv4Addr);
#endif
#endif

#if (IPV6_SUPPORT == ENABLED)
   //Set link-local address
   ipv6StringToAddr("fe80::00ab:cdef:1830", &ipv6Addr);
   ipv6SetLinkLocalAddr(interface, &ipv6Addr);
#endif

   //Create user task
   task = osTaskCreate("User Task", userTask, NULL, 500, 1);
   //Failed to create the task?
   if(task == OS_INVALID_HANDLE)
   {
      //Debug message
      TRACE_ERROR("Failed to create task!\r\n");
   }

   //Create a task to blink the LED
   task = osTaskCreate("Blink", blinkTask, NULL, 500, 1);
   //Failed to create the task?
   if(task == OS_INVALID_HANDLE)
   {
      //Debug message
      TRACE_ERROR("Failed to create task!\r\n");
   }

   //Enable interrupts
   __enable_interrupt();

   //Start the execution of tasks
   osStart();

   //This function should never return
   return 0;
}


/**
 * @brief Set up the timer that will generate the tick interrupt
 **/

void vApplicationSetupTimerInterrupt(void)
{
   //Disable protection
   SYSTEM.PRCR.WORD = 0xA50B;
   //Cancel CMT0 module stop state
   MSTP(CMT0) = 0;
   //Enable protection
   SYSTEM.PRCR.WORD = 0xA500;

   //Select PCLK/8 clock
   CMT0.CMCR.BIT.CKS = 0;
   //Set the compare match value
   CMT0.CMCOR = ((PCLK_HZ / configTICK_RATE_HZ) - 1) / 8;

   //Interrupt on compare match
   CMT0.CMCR.BIT.CMIE = 1;

   //Set interrupt priority
   _IPR(_CMT0_CMI0) = configKERNEL_INTERRUPT_PRIORITY;
   //Enable compare match interrupt
   _IEN(_CMT0_CMI0) = 1;

   //Start timer
   CMT.CMSTR0.BIT.STR0 = 1;
}


/**
 * @brief Stack overflow hook
 **/

void vApplicationStackOverflowHook(xTaskHandle xTask, signed char *pcTaskName)
{
   //Debug message
   TRACE_ERROR("Stack overflow (%s)!\r\n", pcTaskName);
   //Endless loop
   while(1);
}


/**
 * @brief Memory allocation failure hook
 **/

void vApplicationMallocFailedHook( void )
{
   //Debug message
   TRACE_ERROR("Malloc failed!\r\n");
   //Endless loop
   while(1);
}
