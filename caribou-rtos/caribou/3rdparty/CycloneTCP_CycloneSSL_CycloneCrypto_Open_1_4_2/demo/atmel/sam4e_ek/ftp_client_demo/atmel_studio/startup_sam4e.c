//Dependencies
#include "sam4e.h"

//Linker file constants
extern uint32_t _sfixed;
extern uint32_t _efixed;
extern uint32_t _etext;
extern uint32_t _srelocate;
extern uint32_t _erelocate;
extern uint32_t _szero;
extern uint32_t _ezero;
extern uint32_t _sstack;
extern uint32_t _estack;

//Function declaration
void SystemInit(void);
void __libc_init_array(void);
int main(void);

//Default empty handler
void Default_Handler(void);

//Cortex-M3 core handlers
void Reset_Handler      (void);
void NMI_Handler        (void) __attribute__((weak, alias("Default_Handler")));
void HardFault_Handler  (void) __attribute__((weak, alias("Default_Handler")));
void MemManage_Handler  (void) __attribute__((weak, alias("Default_Handler")));
void BusFault_Handler   (void) __attribute__((weak, alias("Default_Handler")));
void UsageFault_Handler (void) __attribute__((weak, alias("Default_Handler")));
void SVC_Handler        (void) __attribute__((weak, alias("Default_Handler")));
void DebugMon_Handler   (void) __attribute__((weak, alias("Default_Handler")));
void PendSV_Handler     (void) __attribute__((weak, alias("Default_Handler")));
void SysTick_Handler    (void) __attribute__((weak, alias("Default_Handler")));

//Peripheral handlers
void SUPC_Handler       (void) __attribute__((weak, alias("Default_Handler")));
void RSTC_Handler       (void) __attribute__((weak, alias("Default_Handler")));
void RTC_Handler        (void) __attribute__((weak, alias("Default_Handler")));
void RTT_Handler        (void) __attribute__((weak, alias("Default_Handler")));
void WDT_Handler        (void) __attribute__((weak, alias("Default_Handler")));
void PMC_Handler        (void) __attribute__((weak, alias("Default_Handler")));
void EFC_Handler        (void) __attribute__((weak, alias("Default_Handler")));
void UART0_Handler      (void) __attribute__((weak, alias("Default_Handler")));
void PIOA_Handler       (void) __attribute__((weak, alias("Default_Handler")));
void PIOB_Handler       (void) __attribute__((weak, alias("Default_Handler")));
void PIOC_Handler       (void) __attribute__((weak, alias("Default_Handler")));
void PIOD_Handler       (void) __attribute__((weak, alias("Default_Handler")));
void PIOE_Handler       (void) __attribute__((weak, alias("Default_Handler")));
void USART0_Handler     (void) __attribute__((weak, alias("Default_Handler")));
void USART1_Handler     (void) __attribute__((weak, alias("Default_Handler")));
void HSMCI_Handler      (void) __attribute__((weak, alias("Default_Handler")));
void TWI0_Handler       (void) __attribute__((weak, alias("Default_Handler")));
void TWI1_Handler       (void) __attribute__((weak, alias("Default_Handler")));
void SPI_Handler        (void) __attribute__((weak, alias("Default_Handler")));
void DMAC_Handler       (void) __attribute__((weak, alias("Default_Handler")));
void TC0_Handler        (void) __attribute__((weak, alias("Default_Handler")));
void TC1_Handler        (void) __attribute__((weak, alias("Default_Handler")));
void TC2_Handler        (void) __attribute__((weak, alias("Default_Handler")));
void TC3_Handler        (void) __attribute__((weak, alias("Default_Handler")));
void TC4_Handler        (void) __attribute__((weak, alias("Default_Handler")));
void TC5_Handler        (void) __attribute__((weak, alias("Default_Handler")));
void TC6_Handler        (void) __attribute__((weak, alias("Default_Handler")));
void TC7_Handler        (void) __attribute__((weak, alias("Default_Handler")));
void TC8_Handler        (void) __attribute__((weak, alias("Default_Handler")));
void AFEC0_Handler      (void) __attribute__((weak, alias("Default_Handler")));
void AFEC1_Handler      (void) __attribute__((weak, alias("Default_Handler")));
void DACC_Handler       (void) __attribute__((weak, alias("Default_Handler")));
void ACC_Handler        (void) __attribute__((weak, alias("Default_Handler")));
void ARM_Handler        (void) __attribute__((weak, alias("Default_Handler")));
void UDP_Handler        (void) __attribute__((weak, alias("Default_Handler")));
void PWM_Handler        (void) __attribute__((weak, alias("Default_Handler")));
void CAN0_Handler       (void) __attribute__((weak, alias("Default_Handler")));
void CAN1_Handler       (void) __attribute__((weak, alias("Default_Handler")));
void AES_Handler        (void) __attribute__((weak, alias("Default_Handler")));
void GMAC_Handler       (void) __attribute__((weak, alias("Default_Handler")));
void UART1_Handler      (void) __attribute__((weak, alias("Default_Handler")));

//Vector table
__attribute__((section(".vectors")))
const uint32_t vectorTable[62] =
{
	//Initial stack pointer
   (uint32_t) (&_estack),

   //Core handlers
   (uint32_t) Reset_Handler,
   (uint32_t) NMI_Handler,
   (uint32_t) HardFault_Handler,
   (uint32_t) MemManage_Handler,
   (uint32_t) BusFault_Handler,
   (uint32_t) UsageFault_Handler,
   (uint32_t) 0,
   (uint32_t) 0,
   (uint32_t) 0,
   (uint32_t) 0,
   (uint32_t) SVC_Handler,
   (uint32_t) DebugMon_Handler,
   (uint32_t) 0,
   (uint32_t) PendSV_Handler,
   (uint32_t) SysTick_Handler,

   //Peripheral handlers
   (uint32_t) SUPC_Handler,    //Supply Controller
   (uint32_t) RSTC_Handler,    //Reset Controller
   (uint32_t) RTC_Handler,     //Real Time Clock
   (uint32_t) RTT_Handler,     //Real Time Timer
   (uint32_t) WDT_Handler,     //Watchdog Timer
   (uint32_t) PMC_Handler,     //PMC
   (uint32_t) EFC_Handler,     //EFC
   (uint32_t) UART0_Handler,   //UART0
   (uint32_t) Default_Handler,
   (uint32_t) PIOA_Handler,    //Parallel IO Controller A
   (uint32_t) PIOB_Handler,    //Parallel IO Controller B
   (uint32_t) PIOC_Handler,    //Parallel IO Controller C
   (uint32_t) PIOD_Handler,    //Parallel IO Controller D
   (uint32_t) PIOE_Handler,    //Parallel IO Controller E
   (uint32_t) USART0_Handler,  //USART 0
   (uint32_t) USART1_Handler,  //USART 1
   (uint32_t) HSMCI_Handler,   //MCI
   (uint32_t) TWI0_Handler,    //TWI 0
   (uint32_t) TWI1_Handler,    //TWI 1
   (uint32_t) SPI_Handler,     //SPI
   (uint32_t) DMAC_Handler,    //DMAC
   (uint32_t) TC0_Handler,     //Timer Counter 0
   (uint32_t) TC1_Handler,     //Timer Counter 1
   (uint32_t) TC2_Handler,     //Timer Counter 2
   (uint32_t) TC3_Handler,     //Timer Counter 3
   (uint32_t) TC4_Handler,     //Timer Counter 4
   (uint32_t) TC5_Handler,     //Timer Counter 5
   (uint32_t) TC6_Handler,     //Timer Counter 6
   (uint32_t) TC7_Handler,     //Timer Counter 7
   (uint32_t) TC8_Handler,     //Timer Counter 8
   (uint32_t) AFEC0_Handler,   //Analog Front End 0
   (uint32_t) AFEC1_Handler,   //Analog Front End 1
   (uint32_t) DACC_Handler,    //DAC controller
   (uint32_t) ACC_Handler,     //Analog Comparator
   (uint32_t) ARM_Handler,     //FPU signals
   (uint32_t) UDP_Handler,     //USB Device
   (uint32_t) PWM_Handler,     //PWM
   (uint32_t) CAN0_Handler,    //CAN0
   (uint32_t) CAN1_Handler,    //CAN1
   (uint32_t) AES_Handler,     //AES
   (uint32_t) Default_Handler,
   (uint32_t) Default_Handler,
   (uint32_t) Default_Handler,
   (uint32_t) Default_Handler,
   (uint32_t) GMAC_Handler,    //GMAC
   (uint32_t) UART1_Handler    //UART
};


/**
 * @brief Reset handler
 **/

void Reset_Handler(void)
{
   uint32_t *src;
   uint32_t *dest;

   //System initialization
   SystemInit();

   //Initialize the relocate segment
   src = &_etext;
   dest = &_srelocate;

   if(src != dest)
   {
      while(dest < &_erelocate)
	  {
         *dest++ = *src++;
      }
   }

   //Clear the zero segment
   for(dest = &_szero; dest < &_ezero;)
   {
      *dest++ = 0;
   }

   //Set the vector table base address
   src = (uint32_t *) & _sfixed;
   SCB->VTOR = ((uint32_t) src & SCB_VTOR_TBLOFF_Msk);

   //C library initialization
   __libc_init_array();

   //Branch to main function
   main();

   //Endless loop
   while(1);
}


/**
 * @brief Default interrupt handler
 **/

void Default_Handler(void)
{
   while(1)
   {
   }
}
