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
//#define USE_DHCPV6

//Dependencies
#include <stdlib.h>
#include "stm32f4xx.h"
#include "stm324xg_eval.h"
#include "stm324xg_eval_ioe.h"
#include "stm324xg_eval_lcd.h"
#include "os_port.h"
#include "resource_manager.h"
#include "tcp_ip_stack.h"
#include "stm32f4x7_eth.h"
#include "dp83848.h"
#include "dhcp_client.h"
#include "dhcpv6_client.h"
#include "tls.h"
#include "tls_cipher_suites.h"
#include "tls_misc.h"
#include "yarrow.h"
#include "error.h"
#include "debug.h"

//Server port
#define SERVER_PORT 443

//Diffie-Hellman parameters
#define SERVER_DH_PARAMS "certs/dh_params.pem"

//Server's RSA certificate and private key
#define SERVER_RSA_CERT "certs/server_rsa_cert.pem"
#define SERVER_RSA_PRIVATE_KEY "certs/server_rsa_key.pem"

//Server's DSA certificate and private key
#define SERVER_DSA_CERT "certs/server_dsa_cert.pem"
#define SERVER_DSA_PRIVATE_KEY "certs/server_dsa_key.pem"

//Server's ECDSA certificate and private key
#define SERVER_ECDSA_CERT "certs/server_ecdsa_cert.pem"
#define SERVER_ECDSA_PRIVATE_KEY "certs/server_ecdsa_key.pem"

//Trusted CA bundle
#define CA_CERT_BUNDLE "certs/ca_cert_bundle.pem"

//Forward declaration of functions
void sslServerTask(void *param);
void sslClientTask(void *param);
const char_t *dumpArray(char_t *buffer, const uint8_t *data, size_t length);

//Credentials
char_t *dhParams = NULL;
size_t dhParamsLength = 0;
char_t *serverRsaCert = NULL;
size_t serverRsaCertLength = 0;
char_t *serverRsaPrivateKey = NULL;
size_t serverRsaPrivateKeyLength = 0;
char_t *serverDsaCert = NULL;
size_t serverDsaCertLength = 0;
char_t *serverDsaPrivateKey = NULL;
size_t serverDsaPrivateKeyLength = 0;
char_t *serverEcdsaCert = NULL;
size_t serverEcdsaCertLength = 0;
char_t *serverEcdsaPrivateKey = NULL;
size_t serverEcdsaPrivateKeyLength = 0;
char_t *trustedCaList = NULL;
size_t trustedCaListLength = 0;

//Pseudo-random number generator
YarrowContext yarrowContext;

//Session cache
TlsCache *tlsCache = NULL;

//Global variables
uint_t lcdLine = 0;
uint_t lcdColumn = 0;
uint_t hitCounter = 0;

OsSemaphore *connectionSemaphore;
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
 * @brief User task
 **/

void userTask(void *param)
{
   char_t buffer[40];

   //Point to the network interface
   NetInterface *interface = &netInterface[0];

   lcdSetCursor(1, 0);
   printf("IPv4 Addr");
   lcdSetCursor(4, 0);
   printf("IPv6 Link-Local Addr");
   lcdSetCursor(7, 0);
   printf("IPv6 Global Addr");

   //Endless loop
   while(1)
   {
#if (IPV4_SUPPORT == ENABLED)
      lcdSetCursor(2, 0);
      printf("%-16s", ipv4AddrToString(interface->ipv4Config.addr, buffer));
#endif

#if (IPV6_SUPPORT == ENABLED)
      lcdSetCursor(5, 0);
      printf("%-40s", ipv6AddrToString(&interface->ipv6Config.linkLocalAddr, buffer));

      lcdSetCursor(8, 0);
      printf("%-40s", ipv6AddrToString(&interface->ipv6Config.globalAddr, buffer));
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
   TRACE_INFO("******************************\r\n");
   TRACE_INFO("*** CycloneSSL Server Demo ***\r\n");
   TRACE_INFO("******************************\r\n");
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
   printf("SSL Server Demo");

   //Enable RNG peripheral clock
   RCC_AHB2PeriphClockCmd(RCC_AHB2Periph_RNG, ENABLE);
   //Enable RNG
   RNG_Cmd(ENABLE);

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
   tcpIpStackSetHostname(interface, "SSLServerDemo");
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

#if defined(USE_DHCPV6)
   //Get default settings
   dhcpv6ClientGetDefaultSettings(&dhcpv6ClientSettings);
   //Set the network interface to be configured by DHCPv6
   dhcpv6ClientSettings.interface = interface;
   //Disable rapid commit option
   dhcpv6ClientSettings.rapidCommit = FALSE;

   //DHCPv6 client initialization
   error = dhcpv6ClientInit(&dhcpv6ClientContext, &dhcpv6ClientSettings);
   //Failed to initialize DHCPv6 client?
   if(error)
   {
      //Debug message
      TRACE_ERROR("Failed to initialize DHCPv6 client!\r\n");
   }

   //Start DHCPv6 client
   error = dhcpv6ClientStart(&dhcpv6ClientContext);
   //Failed to start DHCPv6 client?
   if(error)
   {
      //Debug message
      TRACE_ERROR("Failed to start DHCPv6 client!\r\n");
   }
#else
   //Set IPv6 prefix
   ipv6StringToAddr("2a01:e35:8a47:b350::", &ipv6Addr);
   ipv6SetPrefix(interface, &ipv6Addr, 64);

   //Set global address
   ipv6StringToAddr("2a01:e35:8a47:b350::0407", &ipv6Addr);
   ipv6SetGlobalAddr(interface, &ipv6Addr);

   //Set router
   ipv6StringToAddr("fe80::207:cbff:fe91:ebfd", &ipv6Addr);
   ipv6SetRouter(interface, &ipv6Addr);

   //Set primary and secondary DNS servers
   ipv6StringToAddr("2001:4860:4860::8888", &ipv6Addr);
   ipv6SetDnsServer(interface, 0, &ipv6Addr);
   ipv6StringToAddr("2001:4860:4860::8844", &ipv6Addr);
   ipv6SetDnsServer(interface, 1, &ipv6Addr);
#endif
#endif

   //Create a task to handle incoming requests
   task = osTaskCreate("SSL Server", sslServerTask, NULL, 600, 1);
   //Failed to create the task?
   if(task == OS_INVALID_HANDLE)
   {
      //Debug message
      TRACE_ERROR("Failed to create task!\r\n");
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
 * @brief SSL server task
 * @param param[in] Not used
 **/

void sslServerTask(void *param)
{
   error_t error;
   uint_t i;
   uint_t counter;
   uint32_t value;
   uint16_t clientPort;
   IpAddr clientIpAddr;
   Socket *serverSocket;
   Socket *clientSocket;
   OsTask *task;
   uint8_t seed[32];

   //Create a semaphore to limit the number of simultaneous connections
   connectionSemaphore = osSemaphoreCreate(4, 4);
   //Out of resources?
   if(connectionSemaphore == OS_INVALID_HANDLE)
   {
      //Debug message
      TRACE_ERROR("Error: Failed to create semaphore\r\n");
   }

   //PRNG initialization
   error = yarrowInit(&yarrowContext);
   //Any error to report?
   if(error)
   {
      //Debug message
      TRACE_ERROR("Error: PRNG initialization failed (%d)\r\n", error);
   }

   //Generate a random seed
   for(i = 0; i < 32; i += 4)
   {
      //Wait for the RNG to contain a valid data
      while(RNG_GetFlagStatus(RNG_FLAG_DRDY) == RESET);

      //Get 32-bit random value
      value = RNG_GetRandomNumber();

      //copy random value
      seed[i] = value & 0xFF;
      seed[i + 1] = (value >> 8) & 0xFF;
      seed[i + 2] = (value >> 16) & 0xFF;
      seed[i + 3] = (value >> 24) & 0xFF;
   }

   //Properly seed the PRNG
   error = yarrowSeed(&yarrowContext, seed, sizeof(seed));
   //Any error to report?
   if(error)
   {
      //Debug message
      TRACE_ERROR("Error: Failed to seed PRNG (%d)\r\n", error);
   }

   //Start of exception handling block
   do
   {
      //Load Diffie-Hellman parameters
      error = resGetData(SERVER_DH_PARAMS,  (uint8_t **) &dhParams, &dhParamsLength);
      //Any error to report?
      if(error) break;

      //Load server's RSA certificate
      error = resGetData(SERVER_RSA_CERT, (uint8_t **) &serverRsaCert, &serverRsaCertLength);
      //Any error to report?
      if(error) break;

      //Load server's RSA private key
      error = resGetData(SERVER_RSA_PRIVATE_KEY, (uint8_t **) &serverRsaPrivateKey, &serverRsaPrivateKeyLength);
      //Any error to report?
      if(error) break;

      //Load server's DSA certificate
      error = resGetData(SERVER_DSA_CERT, (uint8_t **) &serverDsaCert, &serverDsaCertLength);
      //Any error to report?
      if(error) break;

      //Load server's DSA private key
      error = resGetData(SERVER_DSA_PRIVATE_KEY, (uint8_t **) &serverDsaPrivateKey, &serverDsaPrivateKeyLength);
      //Any error to report?
      if(error) break;

      //Load server's ECDSA certificate
      error = resGetData(SERVER_ECDSA_CERT, (uint8_t **) &serverEcdsaCert, &serverEcdsaCertLength);
      //Any error to report?
      if(error) break;

      //Load server's ECDSA private key
      error = resGetData(SERVER_ECDSA_PRIVATE_KEY, (uint8_t **) &serverEcdsaPrivateKey, &serverEcdsaPrivateKeyLength);
      //Any error to report?
      if(error) break;

      //Load trusted CA certificates
      error = resGetData(CA_CERT_BUNDLE, (uint8_t **) &trustedCaList, &trustedCaListLength);
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

   //TLS session cache initialization
   tlsCache = tlsInitCache(16);
   //Any error to report?
   if(!tlsCache)
   {
      //Debug message
      TRACE_ERROR("Error: TLS cache initialization failed\r\n");
   }

   //Open a socket
   serverSocket = socketOpen(SOCKET_TYPE_STREAM, SOCKET_PROTOCOL_TCP);
   //Failed to open socket?
   if(!serverSocket)
   {
      //Debug message
      TRACE_ERROR("Error: Cannot open socket\r\n");
   }

   //Bind newly created socket to port 443
   error = socketBind(serverSocket, &IP_ADDR_ANY, SERVER_PORT);
   //Failed to bind socket to port 443?
   if(error)
   {
      //Debug message
      TRACE_ERROR("Error: Failed to bind socket\r\n");
   }

   //Place socket in listening state
   error = socketListen(serverSocket);
   //Any failure to report?
   if(error)
   {
      //Debug message
      TRACE_ERROR("Error: Failed to enter listening state\r\n");
   }

   //Process incoming connections to the server
   for(counter = 1; ; counter++)
   {
      //Debug message
      TRACE_INFO("\r\n\r\n");
      TRACE_INFO("Waiting for an incoming connection...\r\n\r\n");

      //Accept an incoming connection
      clientSocket = socketAccept(serverSocket, &clientIpAddr, &clientPort);

      //Failure detected?
      if(!clientSocket)
      {
         //Debug message
         TRACE_ERROR("Error: Cannot accept new connection request\r\n");
         continue;
      }

      //Limit the number of simultaneous connections to the server
      if(!osSemaphoreWait(connectionSemaphore, 0))
      {
         //Debug message
         TRACE_INFO("Connection #%u refused with client %s port %" PRIu16 "...\r\n",
            counter, ipAddrToString(&clientIpAddr, NULL), clientPort);
         //Close socket
         socketClose(clientSocket);
         //Connection request is refused
         continue;
      }

      //Increment hit counter
      hitCounter++;

      //Debug message
      TRACE_INFO("Connection #%u established with client %s port %" PRIu16 "...\r\n",
         counter, ipAddrToString(&clientIpAddr, NULL), clientPort);

      //Create a task to service the client connection
      task = osTaskCreate("SSL Client", sslClientTask, clientSocket, 600, 1);

      //Did we encounter an error?
      if(task == OS_INVALID_HANDLE)
      {
         //Debug message
         TRACE_ERROR("Failed to create task!\r\n");
         //Close socket
         socketClose(clientSocket);
         //Release semaphore
         osSemaphoreRelease(connectionSemaphore);
      }
   }
}


/**
 * @brief SSL client task
 * @param param[in] Client socket
 **/

void sslClientTask(void *param)
{
   error_t error;
   size_t n;
   char_t *p;
   char_t *buffer;
   char_t *response;
   Socket *clientSocket;
   TlsContext *tlsContext;

   //Initialize pointers
   tlsContext = NULL;
   buffer = NULL;
   response = NULL;

   //Retrieve socket handle
   clientSocket = (Socket *) param;

   //Start of exception handling block
   do
   {
      //Allocate a memory buffer
      buffer = osMemAlloc(512);
      //Failed to allocate memory?
      if(buffer == NULL)
         break;

      //Allocate a memory buffer to hold the response
      response = osMemAlloc(2048);
      //Failed to allocate memory?
      if(response == NULL)
         break;

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

      //Select server operation mode
      error = tlsSetConnectionEnd(tlsContext, TLS_CONNECTION_END_SERVER);
      //Any error to report?
      if(error) break;

      //Bind TLS to the relevant socket
      error = tlsSetSocket(tlsContext, clientSocket);
      //Any error to report?
      if(error) break;

      //Set the PRNG algorithm to be used
      error = tlsSetPrng(tlsContext, YARROW_PRNG_ALGO, &yarrowContext);
      //Any error to report?
      if(error) break;

      //Session cache that will be used to save/resume TLS sessions
      error = tlsSetCache(tlsContext, tlsCache);
      //Any error to report?
      if(error) break;

      //Client authentication is optional
      error = tlsSetClientAuthMode(tlsContext, TLS_CLIENT_AUTH_NONE);
      //Any error to report?
      if(error) break;

      //Import Diffie-Hellman parameters
      error = tlsSetDhParameters(tlsContext, dhParams, dhParamsLength);
      //Any error to report?
      if(error) break;

      //Import the server's RSA certificate
      error = tlsAddCertificate(tlsContext, serverRsaCert,
         serverRsaCertLength, serverRsaPrivateKey, serverRsaPrivateKeyLength);
      //Any error to report?
      if(error) break;

      //Import the server's DSA certificate
      error = tlsAddCertificate(tlsContext, serverDsaCert,
         serverDsaCertLength, serverDsaPrivateKey, serverDsaPrivateKeyLength);
      //Any error to report?
      if(error) break;

      //Import the server's ECDSA certificate
      error = tlsAddCertificate(tlsContext, serverEcdsaCert,
         serverEcdsaCertLength, serverEcdsaPrivateKey, serverEcdsaPrivateKeyLength);
      //Any error to report?
      if(error) break;

      //Import the list of trusted CA certificates
      error = tlsSetTrustedCaList(tlsContext, trustedCaList, trustedCaListLength);
      //Any error to report?
      if(error) break;

      //Establish a secure session
      error = tlsConnect(tlsContext);
      //TLS handshake failure?
      if(error) break;

      //Debug message
      TRACE_INFO("\r\n");
      TRACE_INFO("HTTP request:\r\n");

      //Read HTTP request
      while(1)
      {
         //Read a complete line
         error = tlsRead(tlsContext, buffer, 512, &n, TLS_FLAG_BREAK_CRLF);
         //Any error to report?
         if(error) break;

         //Properly terminate the string with a NULL character
         buffer[n] = '\0';
         //Dump HTTP request
         TRACE_INFO("%s", buffer);

         //The end of the header has been reached?
         if(!strcmp(buffer, "\r\n")) break;
      }

      //Propagate exception if necessary...
      if(error) break;

      //Point to the beginning of the response
      p = response;

      //Format response
      p += sprintf(p, "HTTP/1.0 200 OK\r\n");
      p += sprintf(p, "Content-Type: text/html\r\n");
      p += sprintf(p, "\r\n");

      p += sprintf(p, "<!DOCTYPE html>\r\n");
      p += sprintf(p, "<html>\r\n");
      p += sprintf(p, "<head>\r\n");
      p += sprintf(p, "  <title>Oryx Embedded - CycloneSSL Server Demo</title>\r\n");
      p += sprintf(p, "  <style>\r\n");
      p += sprintf(p, "    body {font-family: monospace; font-size: 13px;}\r\n");
      p += sprintf(p, "    table {border-width: 1px; border-style: ouset; border-collapse: collapse;}\r\n");
      p += sprintf(p, "    td {border-width: 1px; border-style: inset; padding: 3px;}\r\n");
      p += sprintf(p, "  </style>\r\n");
      p += sprintf(p, "</head>\r\n");
      p += sprintf(p, "<body>\r\n");
      p += sprintf(p, "  <p>Welcome to the CycloneSSL demo server!</p>\r\n");
      p += sprintf(p, "  <table>\r\n");

      p += sprintf(p, "  <tr>\r\n");
      p += sprintf(p, "    <td>Hit counter</td>\r\n");
      p += sprintf(p, "    <td>%d</td>\r\n", hitCounter);
      p += sprintf(p, "  </tr>\r\n");

      p += sprintf(p, "  <tr>\r\n");
      p += sprintf(p, "    <td>Server version</td>\r\n");
      p += sprintf(p, "    <td>%s</td>\r\n", tlsGetVersionName(TLS_MAX_VERSION));
      p += sprintf(p, "  </tr>\r\n");

      p += sprintf(p, "  <tr>\r\n");
      p += sprintf(p, "    <td>Client version</td>\r\n");
      p += sprintf(p, "    <td>%s</td>\r\n", tlsGetVersionName(tlsContext->clientVersion));
      p += sprintf(p, "  </tr>\r\n");

      p += sprintf(p, "  <tr>\r\n");
      p += sprintf(p, "    <td>Negotiated version</td>\r\n");
      p += sprintf(p, "    <td>%s</td>\r\n", tlsGetVersionName(tlsContext->version));
      p += sprintf(p, "  </tr>\r\n");

      p += sprintf(p, "  <tr>\r\n");
      p += sprintf(p, "    <td>Cipher suite</td>\r\n");
      p += sprintf(p, "    <td>%s</td>\r\n", tlsGetCipherSuiteName(tlsContext->cipherSuite));
      p += sprintf(p, "  </tr>\r\n");

      p += sprintf(p, "  <tr>\r\n");
      p += sprintf(p, "    <td>Client random</td>\r\n");
      p += sprintf(p, "      <td>\r\n");
      p += sprintf(p, "        %s\r\n", dumpArray(buffer, (uint8_t *) &tlsContext->clientRandom, 32));
      p += sprintf(p, "      </td>\r\n");
      p += sprintf(p, "  </tr>\r\n");

      p += sprintf(p, "  <tr>\r\n");
      p += sprintf(p, "    <td>Server random</td>\r\n");
      p += sprintf(p, "      <td>\r\n");
      p += sprintf(p, "        %s\r\n", dumpArray(buffer, (uint8_t *) &tlsContext->serverRandom, 32));
      p += sprintf(p, "      </td>\r\n");
      p += sprintf(p, "  </tr>\r\n");

      p += sprintf(p, "  <tr>\r\n");
      p += sprintf(p, "    <td>Session ID</td>\r\n");
      p += sprintf(p, "      <td>\r\n");
      p += sprintf(p, "        %s\r\n", dumpArray(buffer, tlsContext->sessionId, tlsContext->sessionIdLength));
      p += sprintf(p, "      </td>\r\n");
      p += sprintf(p, "  </tr>\r\n");

      p += sprintf(p, "  </table>\r\n");
      p += sprintf(p, "</body>\r\n");
      p += sprintf(p, "</html>\r\n");

      //Dump HTTP response
      TRACE_INFO("HTTP response:\r\n");
      TRACE_INFO("%s\r\n", response);

      //Send response to the client
      error = tlsWrite(tlsContext, response, strlen(response), 0);
      //Any error to report?
      if(error) break;

      //End of exception handling block
   } while(0);

   //Terminate SSL session
   tlsFree(tlsContext);

   //Release previously allocated memory
   osMemFree(buffer);
   osMemFree(response);

   //Debug message
   TRACE_INFO("Graceful shutdown...\r\n");
   //Graceful shutdown
   socketShutdown(clientSocket, SOCKET_SD_BOTH);

   //Debug message
   TRACE_INFO("Closing connection...\r\n");
   //Close socket
   socketClose(clientSocket);

   //Debug message
   TRACE_INFO("Connection closed...\r\n");
   //Release semaphore
   osSemaphoreRelease(connectionSemaphore);

   //Kill ourselves
   osTaskDelete(NULL);
}


/**
 * @brief Display the contents of an array
 * @param[out] buffer Output buffer where to format the resulting string
 * @param[in] data Pointer to the data array
 * @param[in] length Number of bytes in the array
 * @return Pointer to the output buffer
 **/

const char_t *dumpArray(char_t *buffer, const uint8_t *data, size_t length)
{
   size_t i;
   char_t *p;

   //Point to the output buffer
   p = buffer;
   //Properly terminate the string
   p[0] = '\0';

   //Process input data
   for(i = 0; i < length; i++)
   {
      //Beginning of a new line?
      if(i != 0 && (i % 16) == 0)
         p += sprintf(p, "\r\n        ");
      //Display current data byte
      p += sprintf(p, "%02X ", data[i]);
   }

   //Return a pointer the output string
   return buffer;
}
