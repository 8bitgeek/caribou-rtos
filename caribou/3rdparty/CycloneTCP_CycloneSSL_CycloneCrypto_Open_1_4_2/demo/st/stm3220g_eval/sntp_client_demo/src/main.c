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
#include <stdlib.h>
#include "stm32f2xx.h"
#include "stm322xg_eval.h"
#include "stm322xg_eval_ioe.h"
#include "stm322xg_eval_lcd.h"
#include "os_port.h"
#include "tcp_ip_stack.h"
#include "stm32f2x7_eth.h"
#include "dp83848.h"
#include "dhcp_client.h"
#include "sntp_client.h"
#include "date_time.h"
#include "debug.h"

//Global variables
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
   lcdLine = min(line, 10);
   lcdColumn = min(column, 20);
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
   else if(lcdLine < 10 && lcdColumn < 20)
   {
      //Display current character
      LCD_DisplayChar(lcdLine * 24, 319 - (lcdColumn * 16), c);

      //Advance the cursor position
      if(++lcdColumn >= 20)
      {
         lcdColumn = 0;
         lcdLine++;
      }
   }
}


/**
 * @brief SNTP client test routine
 * @return Error code
 **/

error_t sntpClientTest(void)
{
   error_t error;
   time_t unixTime;
   IpAddr ipAddr;
   NtpTimestamp timestamp;
   DateTime date;

   //Debug message
   TRACE_INFO("\r\n\r\nResolving server name...\r\n");
   //Resolve SNTP server name
   error = getHostByName(NULL, "0.fr.pool.ntp.org", &ipAddr, 0);

   //Any error to report?
   if(error)
   {
      //Debug message
      TRACE_INFO("Failed to resolve server name!\r\n");
      //Exit immediately
      return error;
   }

   //Debug message
   TRACE_INFO("Requesting time from SNTP server %s\r\n", ipAddrToString(&ipAddr, NULL));
   //Retrieve current time from NTP server using SNTP protocol
   error = sntpClientGetTimestamp(NULL, &ipAddr, &timestamp);

   //Any error to report?
   if(error)
   {
      //Debug message
      TRACE_INFO("Failed to retrieve NTP timestamp!\r\n");
   }
   else
   {
      //Unix time starts on January 1st, 1970
      unixTime = timestamp.seconds - 2208988800;
      //Convert Unix timestamp to date
      convertUnixTimeToDate(unixTime, &date);

      //Debug message
      TRACE_INFO("Current date/time: %s\r\n", formatDate(&date, NULL));

      //Move cursor
      lcdSetCursor(8, 0);

      //Refresh LCD display
      printf("%04u/%02u/%02u %02u:%02u:%02u", date.year, date.month,
         date.day, date.hours, date.minutes, date.seconds);
   }

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
   lcdSetCursor(2, 0);
   printf("IPv4 Addr");
   lcdSetCursor(5, 0);
   printf("Press user button\r\nto get current time");

   //Endless loop
   while(1)
   {
      //Refresh IPv4 address
      lcdSetCursor(3, 0);
      printf("%-16s", ipv4AddrToString(interface->ipv4Config.addr, buffer));

      //User button pressed?
      if(!STM_EVAL_PBGetState(BUTTON_KEY))
      {
         //SNTP client test routine
         sntpClientTest();

         //Wait for the user button to be released
         while(!STM_EVAL_PBGetState(BUTTON_KEY));
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
      STM_EVAL_LEDOn(LED1);
      osDelay(100);
      STM_EVAL_LEDOff(LED1);
      osDelay(900);
   }
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
   TRACE_INFO("***********************************\r\n");
   TRACE_INFO("*** CycloneTCP SNTP Client Demo ***\r\n");
   TRACE_INFO("***********************************\r\n");
   TRACE_INFO("Copyright: 2010-2014 Oryx Embedded\r\n");
   TRACE_INFO("Compiled: %s %s\r\n", __DATE__, __TIME__);
   TRACE_INFO("Target: STM32F207\r\n");
   TRACE_INFO("\r\n");

   //LED configuration
   STM_EVAL_LEDInit(LED1);
   STM_EVAL_LEDInit(LED2);
   STM_EVAL_LEDInit(LED3);
   STM_EVAL_LEDInit(LED4);

   //Clear LEDs
   STM_EVAL_LEDOff(LED1);
   STM_EVAL_LEDOff(LED2);
   STM_EVAL_LEDOff(LED3);
   STM_EVAL_LEDOff(LED4);

   //Initialize I/O expander
   IOE_Config();
   //Initialize user button
   STM_EVAL_PBInit(BUTTON_KEY, BUTTON_MODE_GPIO);

   //Initialize LCD display
   STM322xG_LCD_Init();
   LCD_SetBackColor(Blue);
   LCD_SetTextColor(White);
   LCD_SetFont(&Font16x24);
   LCD_Clear(Blue);

   //Welcome message
   lcdSetCursor(0, 0);
   printf("SNTP Client Demo");

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
   tcpIpStackSetHostname(interface, "SNTPClientDemo");
   //Select the relevant network adapter
   tcpIpStackSetDriver(interface, &stm32f2x7EthDriver);
   tcpIpStackSetPhyDriver(interface, &dp83848PhyDriver);
   //Set host MAC address
   macStringToAddr("00-AB-CD-EF-02-07", &macAddr);
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
   ipv6StringToAddr("fe80::00ab:cdef:0207", &ipv6Addr);
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

   //Start the execution of tasks
   osStart();

   //This function should never return
   return 0;
}
