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
#include <p32xxxx.h>
#include <plib.h>
#include "pic32_eth_starter_kit.h"
#include "os_port.h"
#include "tcp_ip_stack.h"
#include "pic32_eth.h"
#include "dp83848.h"
#include "dhcp_client.h"
#include "ftp_client.h"
#include "error.h"
#include "debug.h"

//Global variables
DhcpClientSettings dhcpClientSettings;
DhcpClientCtx dhcpClientContext;

//PIC32 onfiguration settings
#pragma config FSRSSEL = PRIORITY_7
#pragma config FMIIEN = OFF
#pragma config FETHIO = OFF
#pragma config FCANIO = ON
#pragma config FUSBIDIO = OFF
#pragma config FVBUSONIO = OFF
#pragma config FPLLIDIV = DIV_2
#pragma config FPLLMUL = MUL_20
#pragma config UPLLIDIV = DIV_1
#pragma config UPLLEN = OFF
#pragma config FPLLODIV = DIV_1
#pragma config FNOSC = PRIPLL
#pragma config FSOSCEN = ON
#pragma config IESO = ON
#pragma config POSCMOD = XT
#pragma config OSCIOFNC = OFF
#pragma config FPBDIV = DIV_2
#pragma config FCKSM = CSDCMD
#pragma config WDTPS = PS1048576
#pragma config FWDTEN = OFF
//#pragma config DEBUG = ON
#pragma config ICESEL = ICS_PGx2
#pragma config PWP = OFF
#pragma config BWP = OFF
#pragma config CP = OFF

//External 3 interrupt service routine
void __attribute__((interrupt(ipl1), vector(_EXTERNAL_3_VECTOR))) ext3InterruptWrapper(void);
//Ethernet interrupt service routine
void __attribute__((interrupt(ipl1), vector(_ETH_VECTOR))) ethInterruptWrapper(void);


/**
 * @brief I/O initialization
 **/

void ioInit(void)
{
   //Disable analog inputs
   AD1PCFG = 0xFFFF;

   //Configure RD0, RD1 and RD2 as outputs
   TRISDCLR = LED1_MASK | LED2_MASK | LED3_MASK;
   LATDCLR = LED1_MASK | LED2_MASK | LED3_MASK;

   //Configure RD6, RD7 and RD13 as inputs
   TRISDSET = SW1_MASK | SW2_MASK | SW3_MASK;
   //Enable pull-ups on CN15 (RD6), CN16 (RD7) and CN19 (RD13)
   CNPUESET = _CNPUE_CNPUE15_MASK | _CNPUE_CNPUE16_MASK | _CNPUE_CNPUE19_MASK;
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
   //Endless loop
   while(1)
   {
      //SW1 button pressed?
      if(!(PORTD & SW1_MASK))
      {
         //FTP client test routine
         ftpClientTest();

         //Wait for the SW1 button to be released
         while(!(PORTD & SW1_MASK));
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
      LATDSET = LED1_MASK;
      osDelay(100);
      LATDCLR = LED1_MASK;
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

   //Enable optimal performance
   SYSTEMConfigPerformance(80000000);
   //Configures peripheral bus divisor
   OSCSetPBDIV(OSC_PB_DIV_2);
   //Enable multi-vectored interrupts
   INTEnableSystemMultiVectoredInt();

   //Configure debug UART
   debugInit(115200);

   //Start-up message
   TRACE_INFO("\r\n");
   TRACE_INFO("**********************************\r\n");
   TRACE_INFO("*** CycloneTCP FTP Client Demo ***\r\n");
   TRACE_INFO("**********************************\r\n");
   TRACE_INFO("Copyright: 2010-2014 Oryx Embedded\r\n");
   TRACE_INFO("Compiled: %s %s\r\n", __DATE__, __TIME__);
   TRACE_INFO("Target: PIC32MX795F512L\r\n");
   TRACE_INFO("\r\n");

   //IO configuration
   ioInit();

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
   tcpIpStackSetDriver(interface, &pic32EthDriver);
   tcpIpStackSetPhyDriver(interface, &dp83848PhyDriver);
   //Set host MAC address
   macStringToAddr("00-AB-CD-EF-07-95", &macAddr);
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
   ipv6StringToAddr("fe80::00ab:cdef:0795", &ipv6Addr);
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
