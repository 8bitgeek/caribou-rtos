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
#include "resource_manager.h"
#include "tcp_ip_stack.h"
#include "stm32f2x7_eth.h"
#include "dp83848.h"
#include "dhcp_client.h"
#include "tls.h"
#include "tls_cipher_suites.h"
#include "yarrow.h"
#include "error.h"
#include "debug.h"

//Server hostname and port
#define SERVER_NAME "www.wikipedia.org"
#define SERVER_PORT 443
#define REQUEST_URI "/"

//Compilation options
#define SET_CIPHER_SUITES FALSE
#define SET_SERVER_NAME FALSE
#define SET_TRUSTED_CA_LIST FALSE
#define SET_CLIENT_CERT FALSE

//Trusted CA bundle
#define CA_CERT_BUNDLE "certs/ca_cert_bundle.pem"

//Client's certificate and private key
#define CLIENT_CERT "certs/client_rsa_cert.pem"
#define CLIENT_PRIVATE_KEY "certs/client_rsa_key.pem"

#if SET_CIPHER_SUITES

//List of preferred ciphersuites
static const unsigned short cipherSuites[] =
{
   TLS_RSA_WITH_CAMELLIA_256_GCM_SHA384,
   TLS_DHE_RSA_WITH_CAMELLIA_256_GCM_SHA384,
   TLS_RSA_WITH_AES_256_GCM_SHA384,
   TLS_DHE_RSA_WITH_AES_256_GCM_SHA384,
   TLS_RSA_WITH_CAMELLIA_128_GCM_SHA256,
   TLS_DHE_RSA_WITH_CAMELLIA_128_GCM_SHA256,
   TLS_RSA_WITH_AES_128_GCM_SHA256,
   TLS_DHE_RSA_WITH_AES_128_GCM_SHA256,
   TLS_RSA_WITH_CAMELLIA_256_CBC_SHA256,
   TLS_DHE_RSA_WITH_CAMELLIA_256_CBC_SHA256,
   TLS_RSA_WITH_AES_256_CBC_SHA256,
   TLS_DHE_RSA_WITH_AES_256_CBC_SHA256,
   TLS_RSA_WITH_CAMELLIA_128_CBC_SHA256,
   TLS_DHE_RSA_WITH_CAMELLIA_128_CBC_SHA256,
   TLS_RSA_WITH_AES_128_CBC_SHA256,
   TLS_DHE_RSA_WITH_AES_128_CBC_SHA256,
   TLS_RSA_WITH_CAMELLIA_256_CBC_SHA,
   TLS_DHE_RSA_WITH_CAMELLIA_256_CBC_SHA,
   TLS_RSA_WITH_AES_256_CBC_SHA,
   TLS_DHE_RSA_WITH_AES_256_CBC_SHA,
   TLS_RSA_WITH_CAMELLIA_128_CBC_SHA,
   TLS_DHE_RSA_WITH_CAMELLIA_128_CBC_SHA,
   TLS_RSA_WITH_AES_128_CBC_SHA,
   TLS_DHE_RSA_WITH_AES_128_CBC_SHA,
   TLS_RSA_WITH_SEED_CBC_SHA,
   TLS_DHE_RSA_WITH_SEED_CBC_SHA,
   TLS_RSA_WITH_3DES_EDE_CBC_SHA,
   TLS_DHE_RSA_WITH_3DES_EDE_CBC_SHA,
   TLS_RSA_WITH_RC4_128_SHA
};

#endif

//Credentials
char_t *clientCert = NULL;
size_t clientCertLength = 0;
char_t *clientPrivateKey = NULL;
size_t clientPrivateKeyLength = 0;
char_t *trustedCaList = NULL;
size_t trustedCaListLength = 0;

//Global variables
uint_t lcdLine = 0;
uint_t lcdColumn = 0;

YarrowContext yarrowContext;
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
 * @brief SSL client test routine
 * @return Error code
 **/

error_t sslClientTest(void)
{
   error_t error;
   size_t i;
   size_t length;
   uint32_t value;
   IpAddr ipAddr;
   static char_t buffer[256];

   //Underlying socket
   Socket *socket = NULL;
   //SSL/TLS context
   TlsContext *tlsContext = NULL;

   //Debug message
   TRACE_INFO("Generating random seed...\r\n");

   //Generate a random seed
   for(i = 0; i < 32; i += 4)
   {
      //Wait for the RNG to contain a valid data
      while(RNG_GetFlagStatus(RNG_FLAG_DRDY) == RESET);

      //Get 32-bit random value
      value = RNG_GetRandomNumber();

      //copy random value
      buffer[i] = value & 0xFF;
      buffer[i + 1] = (value >> 8) & 0xFF;
      buffer[i + 2] = (value >> 16) & 0xFF;
      buffer[i + 3] = (value >> 24) & 0xFF;
   }

   //Debug message
   TRACE_INFO_ARRAY("  ", buffer, 32);

   //Debug message
   TRACE_INFO("\r\n\r\nSeeding PRNG...\r\n");

   //Properly seed the PRNG
   error = yarrowSeed(&yarrowContext, (uint8_t *) buffer, 32);
   //Any error to report?
   if(error)
   {
      //Debug message
      TRACE_ERROR("Failed to seed PRNG!\r\n");
      //Exit immediately
      return error;
   }

   //Debug message
   TRACE_INFO("Resolving server name...\r\n");

   //Resolve SSL server name
   error = getHostByName(NULL, SERVER_NAME, &ipAddr, 0);
   //Any error to report?
   if(error)
   {
      //Debug message
      TRACE_INFO("Failed to resolve server name!\r\n");
      //Exit immediately
      return error;
   }

   //Create a new socket to handle the request
   socket = socketOpen(SOCKET_TYPE_STREAM, SOCKET_PROTOCOL_TCP);
   //Any error to report?
   if(!socket)
   {
      //Debug message
      TRACE_INFO("Failed to open socket!\r\n");
      //Exit immediately
      return ERROR_OPEN_FAILED;
   }

   //Start of exception handling block
   do
   {
      //Debug message
      TRACE_INFO("Connecting to SSL server %s\r\n", ipAddrToString(&ipAddr, NULL));

      //Connect to the SSL server
      error = socketConnect(socket, &ipAddr, SERVER_PORT);
      //Any error to report?
      if(error) break;

      //Initialize SSL/TLS context
      tlsContext = tlsInit();
      //Initialization failed?
      if(!tlsContext)
      {
         //Report an error
         error = ERROR_OUT_OF_MEMORY;
         //Exit immediately
         break;
      }

      //Bind TLS to the relevant socket
      error = tlsSetSocket(tlsContext, socket);
      //Any error to report?
      if(error) break;

      //Select client operation mode
      error = tlsSetConnectionEnd(tlsContext, TLS_CONNECTION_END_CLIENT);
      //Any error to report?
      if(error) break;

      //Set the PRNG algorithm to be used
      error = tlsSetPrng(tlsContext, YARROW_PRNG_ALGO, &yarrowContext);
      //Any error to report?
      if(error) break;

#if SET_CIPHER_SUITES
      //Preferred cipher suite list
      error = tlsSetCipherSuites(tlsContext, cipherSuites, arraysize(cipherSuites));
      //Any error to report?
      if(error) break;
#endif

#if SET_SERVER_NAME
      //Set the fully qualified domain name of the server
      error = tlsSetServerName(tlsContext, SERVER_NAME);
      //Any error to report?
      if(error) break;
#endif

#if SET_TRUSTED_CA_LIST
      //Import the list of trusted CA certificates
      error = tlsSetTrustedCaList(tlsContext, trustedCaList, trustedCaListLength);
      //Any error to report?
      if(error) break;
#endif

#if SET_CLIENT_CERT
      //Import the client's certificate
      error = tlsAddCertificate(tlsContext, clientCert,
         clientCertLength, clientPrivateKey, clientPrivateKeyLength);
      //Any error to report?
      if(error) break;
#endif

      //Establish a secure session
      error = tlsConnect(tlsContext);
      //TLS handshake failure?
      if(error) break;

      //Format HTTP request
      sprintf(buffer, "GET %s HTTP/1.0\r\nHost: %s:%u\r\n\r\n",
         REQUEST_URI, SERVER_NAME, SERVER_PORT);

      //Debug message
      TRACE_INFO("\r\n");
      TRACE_INFO("HTTP request:\r\n%s", buffer);

      //Send the request
      error = tlsWrite(tlsContext, buffer, strlen(buffer), 0);
      //Any error to report?
      if(error) break;

      //Debug message
      TRACE_INFO("HTTP response:\r\n");

      //Read the whole response
      while(1)
      {
         //Read data
         error = tlsRead(tlsContext, buffer, sizeof(buffer) - 1, &length, 0);
         //End of stream?
         if(error) break;

         //Properly terminate the string with a NULL character
         buffer[length] = '\0';
         //Debug message
         TRACE_INFO("%s", buffer);
      }

      //Successfull processing
      error = NO_ERROR;

      //End of exception handling block
   } while(0);

   //Any error to report?
   if(error)
   {
      //Debug message
      TRACE_INFO("Failed to communicate with SSL server!\r\n");
   }

   //Terminate TLS session
   tlsFree(tlsContext);
   //Close socket
   socketClose(socket);

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
   lcdSetCursor(2, 0);
   printf("IPv4 Addr");
   lcdSetCursor(5, 0);
   printf("Press user button\r\nto run test");

   //Endless loop
   while(1)
   {
      //Refresh IPv4 address
      lcdSetCursor(3, 0);
      printf("%-16s", ipv4AddrToString(interface->ipv4Config.addr, buffer));

      //User button pressed?
      if(!STM_EVAL_PBGetState(BUTTON_KEY))
      {
         //SSL client test routine
         sslClientTest();

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
   TRACE_INFO("******************************\r\n");
   TRACE_INFO("*** CycloneSSL Client Demo ***\r\n");
   TRACE_INFO("******************************\r\n");
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
   printf("SSL Client Demo");

   //Enable RNG peripheral clock
   RCC_AHB2PeriphClockCmd(RCC_AHB2Periph_RNG, ENABLE);
   //Enable RNG
   RNG_Cmd(ENABLE);

   //PRNG initialization
   error = yarrowInit(&yarrowContext);
   //Any error to report?
   if(error)
   {
      //Debug message
      TRACE_ERROR("Error: PRNG initialization failed (%d)\r\n", error);
      //Exit immediately
      return ERROR_FAILURE;
   }

   //Debug message
   TRACE_INFO("Loading credentials...\r\n");

   //Start of exception handling block
   do
   {
      //Load trusted CA certificates
      error = resGetData(CA_CERT_BUNDLE, (uint8_t **) &trustedCaList, &trustedCaListLength);
      //Any error to report?
      if(error) break;

      //Load client's certificate
      error = resGetData(CLIENT_CERT, (uint8_t **) &clientCert, &clientCertLength);
      //Any error to report?
      if(error) break;

      //Load client's private key
      error = resGetData(CLIENT_PRIVATE_KEY, (uint8_t **) &clientPrivateKey, &clientPrivateKeyLength);
      //Any error to report?
      if(error) break;

      //End of exception handling block
   } while(0);

   //Check error code
   if(error)
   {
      //Debug message
      TRACE_ERROR("Error: Failed to load credentials\r\n");
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
   tcpIpStackSetHostname(interface, "SSLClientDemo");
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
   task = osTaskCreate("User Task", userTask, NULL, 600, 1);
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
