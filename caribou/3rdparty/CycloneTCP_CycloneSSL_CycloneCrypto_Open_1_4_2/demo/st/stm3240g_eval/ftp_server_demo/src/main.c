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
#include "stm32f4xx.h"
#include "stm324xg_eval.h"
#include "stm324xg_eval_ioe.h"
#include "stm324xg_eval_lcd.h"
#include "os_port.h"
#include "fs_port.h"
#include "tcp_ip_stack.h"
#include "stm32f4x7_eth.h"
#include "dp83848.h"
#include "dhcp_client.h"
#include "ftp_server.h"
#include "path.h"
#include "debug.h"

//Forward declaration of functions
uint_t ftpServerCheckUserCallback(FtpClientConnection *connection,
   const char_t *user);

uint_t ftpServerCheckPasswordCallback(FtpClientConnection *connection,
   const char_t *user, const char_t *password);

uint_t ftpServerGetFilePermCallback(FtpClientConnection *connection,
   const char_t *user, const char_t *path);

//Global variables
uint_t lcdLine = 0;
uint_t lcdColumn = 0;

DhcpClientSettings dhcpClientSettings;
DhcpClientCtx dhcpClientContext;
FtpServerSettings ftpServerSettings;
FtpServerContext ftpServerContext;


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
   printf("Press user button\r\nto run test");

   //Endless loop
   while(1)
   {
#if (IPV4_SUPPORT == ENABLED)
      //Refresh IPv4 address
      lcdSetCursor(3, 0);
      printf("%-16s", ipv4AddrToString(interface->ipv4Config.addr, buffer));
#endif

      //500ms delay
      osDelay(500);
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
   TRACE_INFO("**********************************\r\n");
   TRACE_INFO("*** CycloneTCP FTP Server Demo ***\r\n");
   TRACE_INFO("**********************************\r\n");
   TRACE_INFO("Copyright: 2010-2014 Oryx Embedded\r\n");
   TRACE_INFO("Compiled: %s %s\r\n", __DATE__, __TIME__);
   TRACE_INFO("Target: STM32F407\r\n");
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
   STM324xG_LCD_Init();
   LCD_SetBackColor(Blue);
   LCD_SetTextColor(White);
   LCD_SetFont(&Font16x24);
   LCD_Clear(Blue);

   //Welcome message
   lcdSetCursor(0, 0);
   printf("FTP Server Demo");

   //File system initialization
   error = fsInit();
   //Any error to report?
   if(error)
   {
      //Debug message
      TRACE_ERROR("Failed to initialize file system!\r\n");
   }

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
   tcpIpStackSetHostname(interface, "FTPServerDemo");
   //Select the relevant network adapter
   tcpIpStackSetDriver(interface, &stm32f4x7EthDriver);
   tcpIpStackSetPhyDriver(interface, &dp83848PhyDriver);
   //Set host MAC address
   macStringToAddr("00-AB-CD-EF-04-07", &macAddr);
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
   ipv6StringToAddr("fe80::00ab:cdef:0407", &ipv6Addr);
   ipv6SetLinkLocalAddr(interface, &ipv6Addr);
#endif

   //Get default settings
   ftpServerGetDefaultSettings(&ftpServerSettings);
   //Bind FTP server to the desired interface
   ftpServerSettings.interface = &netInterface[0];
   //Listen to port 21
   ftpServerSettings.port = FTP_PORT;
   //Root directory
   strcpy(ftpServerSettings.rootDir, "/");
   //User verification callback function
   ftpServerSettings.checkUserCallback = ftpServerCheckUserCallback;
   //Password verification callback function
   ftpServerSettings.checkPasswordCallback = ftpServerCheckPasswordCallback;
   //Callback used to retrieve file permissions
   ftpServerSettings.getFilePermCallback = ftpServerGetFilePermCallback;

   //FTP server initialization
   error = ftpServerInit(&ftpServerContext, &ftpServerSettings);
   //Failed to initialize FTP server?
   if(error)
   {
      //Debug message
      TRACE_ERROR("Failed to initialize FTP server!\r\n");
   }

   //Start FTP server
   error = ftpServerStart(&ftpServerContext);
   //Failed to start FTP server?
   if(error)
   {
      //Debug message
      TRACE_ERROR("Failed to start FTP server!\r\n");
   }

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


/**
 * @brief User verification callback function
 * @param[in] connection Handle referencing a client connection
 * @param[in] user NULL-terminated string that contains the user name
 * @return Access status (FTP_ACCESS_ALLOWED, FTP_ACCESS_DENIED or FTP_PASSWORD_REQUIRED)
 **/

uint_t ftpServerCheckUserCallback(FtpClientConnection *connection,
   const char_t *user)
{
   //Debug message
   TRACE_INFO("FTP server: User verification\r\n");

   //Manage authentication policy
   if(!strcmp(user, "anonymous"))
   {
      return FTP_ACCESS_ALLOWED;
   }
   else if(!strcmp(user, "admin"))
   {
      return FTP_PASSWORD_REQUIRED;
   }
   else
   {
      return FTP_ACCESS_DENIED;
   }
}


/**
 * @brief Password verification callback function
 * @param[in] connection Handle referencing a client connection
 * @param[in] user NULL-terminated string that contains the user name
 * @param[in] password NULL-terminated string that contains the corresponding password
 * @return Access status (FTP_ACCESS_ALLOWED or FTP_ACCESS_DENIED)
 **/

uint_t ftpServerCheckPasswordCallback(FtpClientConnection *connection,
   const char_t *user, const char_t *password)
{
   //Debug message
   TRACE_INFO("FTP server: Password verification\r\n");

   //Verify password
   if(!strcmp(user, "admin") && !strcmp(password, "admin"))
   {
      return FTP_ACCESS_ALLOWED;
   }
   else
   {
      return FTP_ACCESS_DENIED;
   }
}


/**
 * @brief Callback used to retrieve file permissions
 * @param[in] connection Handle referencing a client connection
 * @param[in] user NULL-terminated string that contains the user name
 * @param[in] path Canonical path of the file
 * @return Permissions for the specified file
 **/

uint_t ftpServerGetFilePermCallback(FtpClientConnection *connection,
   const char_t *user, const char_t *path)
{
   uint_t perm;

   //Debug message
   TRACE_INFO("FTP server: Checking access rights for %s\r\n", path);

   //Manage access rights
   if(!strcmp(user, "anonymous"))
   {
      //Allow read/write access to temp directory
      if(pathMatch(path, "/temp/*"))
         perm = FTP_FILE_PERM_LIST | FTP_FILE_PERM_READ | FTP_FILE_PERM_WRITE;
      //Allow read access only to other directories
      else
         perm = FTP_FILE_PERM_LIST | FTP_FILE_PERM_READ;
   }
   else if(!strcmp(user, "admin"))
   {
      //Allow read/write access
      perm = FTP_FILE_PERM_LIST | FTP_FILE_PERM_READ | FTP_FILE_PERM_WRITE;
   }
   else
   {
      //Deny access
      perm = 0;
   }

   //Return the relevant permissions
   return perm;
}
