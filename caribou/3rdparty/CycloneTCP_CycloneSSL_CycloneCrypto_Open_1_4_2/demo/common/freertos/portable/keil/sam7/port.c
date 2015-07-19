/*
    FreeRTOS V6.0.5 - Copyright (C) 2010 Real Time Engineers Ltd.

    ***************************************************************************
    *                                                                         *
    * If you are:                                                             *
    *                                                                         *
    *    + New to FreeRTOS,                                                   *
    *    + Wanting to learn FreeRTOS or multitasking in general quickly       *
    *    + Looking for basic training,                                        *
    *    + Wanting to improve your FreeRTOS skills and productivity           *
    *                                                                         *
    * then take a look at the FreeRTOS eBook                                  *
    *                                                                         *
    *        "Using the FreeRTOS Real Time Kernel - a Practical Guide"        *
    *                  http://www.FreeRTOS.org/Documentation                  *
    *                                                                         *
    * A pdf reference manual is also available.  Both are usually delivered   *
    * to your inbox within 20 minutes to two hours when purchased between 8am *
    * and 8pm GMT (although please allow up to 24 hours in case of            *
    * exceptional circumstances).  Thank you for your support!                *
    *                                                                         *
    ***************************************************************************

    This file is part of the FreeRTOS distribution.

    FreeRTOS is free software; you can redistribute it and/or modify it under
    the terms of the GNU General Public License (version 2) as published by the
    Free Software Foundation AND MODIFIED BY the FreeRTOS exception.
    ***NOTE*** The exception to the GPL is included to allow you to distribute
    a combined work that includes FreeRTOS without being obliged to provide the
    source code for proprietary components outside of the FreeRTOS kernel.
    FreeRTOS is distributed in the hope that it will be useful, but WITHOUT
    ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
    FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
    more details. You should have received a copy of the GNU General Public 
    License and the FreeRTOS license exception along with FreeRTOS; if not it 
    can be viewed here: http://www.freertos.org/a00114.html and also obtained 
    by writing to Richard Barry, contact details for whom are available on the
    FreeRTOS WEB site.

    1 tab == 4 spaces!

    http://www.FreeRTOS.org - Documentation, latest information, license and
    contact details.

    http://www.SafeRTOS.com - A version that is certified for use in safety
    critical systems.

    http://www.OpenRTOS.com - Commercial support, development, porting,
    licensing and training services.
*/

/*-----------------------------------------------------------
 * Implementation of functions defined in portable.h for the Atmel ARM7 port.
 *----------------------------------------------------------*/


/* Standard includes. */
#include <stdlib.h>
#include <string.h>

#if defined(AT91SAM7SE512)
   #include "at91sam7se512.h"
#elif defined(AT91SAM7X256)
   #include "at91sam7x256.h"
#endif

/* Scheduler includes. */
#define MPU_WRAPPERS_INCLUDED_FROM_API_FILE
#include "FreeRTOS.h"
#include "task.h"
#undef MPU_WRAPPERS_INCLUDED_FROM_API_FILE

/* Constants required to setup the initial stack. */
#define portINITIAL_SPSR   	   	( ( portSTACK_TYPE ) 0x1f ) /* System mode, ARM mode, interrupts enabled. */
#define portTHUMB_MODE_BIT   	   	( ( portSTACK_TYPE ) 0x20 )
#define portINSTRUCTION_SIZE   	   ( ( portSTACK_TYPE ) 4 )

/* Constants required to setup the PIT. */
#define portPIT_CLOCK_DIVISOR   	   ( ( unsigned long ) 16 )
#define portPIT_COUNTER_VALUE   	   ( ( ( configCPU_CLOCK_HZ / portPIT_CLOCK_DIVISOR ) / 1000UL ) * portTICK_RATE_MS )

/* Constants required to handle critical sections. */
#define portNO_CRITICAL_NESTING    	( ( unsigned long ) 0 )



/* Setup the PIT to generate the tick interrupts. */
static void prvSetupTimerInterrupt( void );

/* ulCriticalNesting will get set to zero when the first task starts.  It
cannot be initialised to 0 as this will cause interrupts to be enabled
during the kernel initialisation process. */
unsigned long ulCriticalNesting = ( unsigned long ) 9999;

/*-----------------------------------------------------------*/

/*
 * Initialise the stack of a task to look exactly as if a call to
 * portSAVE_CONTEXT had been called.
 *
 * See header file for description.
 */
portSTACK_TYPE *pxPortInitialiseStack( portSTACK_TYPE *pxTopOfStack, pdTASK_CODE pxCode, void *pvParameters )
{
portSTACK_TYPE *pxOriginalTOS;

   pxOriginalTOS = pxTopOfStack;

   /* Setup the initial stack of the task.  The stack is set exactly as
   expected by the portRESTORE_CONTEXT() macro. */

   /* First on the stack is the return address - which in this case is the
   start of the task.  The offset is added to make the return address appear
   as it would within an IRQ ISR. */
   *pxTopOfStack = ( portSTACK_TYPE ) pxCode + portINSTRUCTION_SIZE;   	
   pxTopOfStack--;

   *pxTopOfStack = ( portSTACK_TYPE ) 0xaaaaaaaa;   /* R14 */
   pxTopOfStack--;   
   *pxTopOfStack = ( portSTACK_TYPE ) pxOriginalTOS; /* Stack used when task starts goes in R13. */
   pxTopOfStack--;
   *pxTopOfStack = ( portSTACK_TYPE ) 0x12121212;   /* R12 */
   pxTopOfStack--;   
   *pxTopOfStack = ( portSTACK_TYPE ) 0x11111111;   /* R11 */
   pxTopOfStack--;   
   *pxTopOfStack = ( portSTACK_TYPE ) 0x10101010;   /* R10 */
   pxTopOfStack--;   
   *pxTopOfStack = ( portSTACK_TYPE ) 0x09090909;   /* R9 */
   pxTopOfStack--;   
   *pxTopOfStack = ( portSTACK_TYPE ) 0x08080808;   /* R8 */
   pxTopOfStack--;   
   *pxTopOfStack = ( portSTACK_TYPE ) 0x07070707;   /* R7 */
   pxTopOfStack--;   
   *pxTopOfStack = ( portSTACK_TYPE ) 0x06060606;   /* R6 */
   pxTopOfStack--;   
   *pxTopOfStack = ( portSTACK_TYPE ) 0x05050505;   /* R5 */
   pxTopOfStack--;   
   *pxTopOfStack = ( portSTACK_TYPE ) 0x04040404;   /* R4 */
   pxTopOfStack--;   
   *pxTopOfStack = ( portSTACK_TYPE ) 0x03030303;   /* R3 */
   pxTopOfStack--;   
   *pxTopOfStack = ( portSTACK_TYPE ) 0x02020202;   /* R2 */
   pxTopOfStack--;   
   *pxTopOfStack = ( portSTACK_TYPE ) 0x01010101;   /* R1 */
   pxTopOfStack--;   

   /* When the task starts is will expect to find the function parameter in
   R0. */
   *pxTopOfStack = ( portSTACK_TYPE ) pvParameters; /* R0 */
   pxTopOfStack--;

   /* The status register is set for system mode, with interrupts enabled. */
   *pxTopOfStack = ( portSTACK_TYPE ) portINITIAL_SPSR;
   
   if( ( ( unsigned long ) pxCode & 0x01UL ) != 0x00UL )
   {
   	/* We want the task to start in thumb mode. */
   	*pxTopOfStack |= portTHUMB_MODE_BIT;
   }   
   
   pxTopOfStack--;

   /* Interrupt flags cannot always be stored on the stack and will
   instead be stored in a variable, which is then saved as part of the
   tasks context. */
   *pxTopOfStack = portNO_CRITICAL_NESTING;

   return pxTopOfStack;   
}
/*-----------------------------------------------------------*/

portBASE_TYPE xPortStartScheduler( void )
{
extern void vPortStartFirstTask( void );

   /* Start the timer that generates the tick ISR.  Interrupts are disabled
   here already. */
   prvSetupTimerInterrupt();

   /* Start the first task. */
   vPortStartFirstTask();   

   /* Should not get here! */
   return 0;
}
/*-----------------------------------------------------------*/

void vPortEndScheduler( void )
{
   /* It is unlikely that the ARM port will require this function as there
   is nothing to return to.  */
}
/*-----------------------------------------------------------*/

#if configUSE_PREEMPTION == 0

   /* The cooperative scheduler requires a normal IRQ service routine to
   simply increment the system tick. */
   void __irq vPortNonPreemptiveTick(void)
   //static __arm __irq void vPortNonPreemptiveTick( void );
   //static __arm __irq void vPortNonPreemptiveTick( void )
   {
   	volatile unsigned long dummy;
   	
   	/* Increment the tick count - which may wake some tasks but as the
   	preemptive scheduler is not being used any woken task is not given
   	processor time no matter what its priority. */
   	vTaskIncrementTick();
   	
   	/* Clear the PIT interrupt. */
   	dummy = AT91C_BASE_PITC->PITC_PIVR;
   	
   	/* End the interrupt in the AIC. */
   	AT91C_BASE_AIC->AIC_EOICR = dummy;
   }

#else

   /* Currently the IAR port requires the preemptive tick function to be
   defined in an asm file. */

#endif

/*-----------------------------------------------------------*/

static void prvSetupTimerInterrupt( void )
{  
   //Ensure PIT interrupts are disabled
   AT91C_BASE_AIC->AIC_IDCR = (1 << AT91C_ID_SYS);
   //Configure interrupt controller
   AT91C_BASE_AIC->AIC_SMR[AT91C_ID_SYS] = AT91C_AIC_SRCTYPE_INT_HIGH_LEVEL | AT91C_AIC_PRIOR_HIGHEST;
   
   //Set corresponding interrupt handler
#if configUSE_PREEMPTION == 0
   AT91C_BASE_AIC->AIC_SVR[AT91C_ID_SYS] = (unsigned int) vPortNonPreemptiveTick;
#else
   extern void vPortPreemptiveTick(void);
   AT91C_BASE_AIC->AIC_SVR[AT91C_ID_SYS] = (unsigned int) vPortPreemptiveTick;
#endif

   //Configure the PIT period
   AT91C_BASE_PITC->PITC_PIMR = AT91C_PITC_PITIEN | AT91C_PITC_PITEN | (portPIT_COUNTER_VALUE & AT91C_PITC_PIV);
   
   //Clear PIT interrupt flag
   AT91C_BASE_AIC->AIC_ICCR = (1 << AT91C_ID_SYS);
   //Enable PIT interrupts. Global interrupts are still disabled a this point
   AT91C_BASE_AIC->AIC_IECR = (1 << AT91C_ID_SYS);
}


void vPortEnterCritical( void )
{
   /* Disable interrupts first! */
   __disable_irq();

   /* Now interrupts are disabled ulCriticalNesting can be accessed
   directly.  Increment ulCriticalNesting to keep a count of how many times
   portENTER_CRITICAL() has been called. */
   ulCriticalNesting++;
}


void vPortExitCritical( void )
{
   if( ulCriticalNesting > portNO_CRITICAL_NESTING )
   {
   	/* Decrement the nesting count as we are leaving a critical section. */
   	ulCriticalNesting--;

   	/* If the nesting level has reached zero then interrupts should be
   	re-enabled. */
   	if( ulCriticalNesting == portNO_CRITICAL_NESTING )
   	{
   	   __enable_irq();
   	}
   }
}


/**
 *@brief Allocates a block of memory
 *@param xSize Size of the memory block
 *@return Pointer to the freshly allocated memory block
 **/

void *osAllocMem2(unsigned int size)
{
   void *pvReturn;
   //Suspends all the tasks while keeping interrupts enabled
   vTaskSuspendAll();
   //Allocate memory block
   pvReturn = malloc(size);
   //Resume all the tasks
   xTaskResumeAll();
   //Debug message
   //TRACE_DEBUG("Allocate %d bytes at 0x%08X\r\n", xSize, pvReturn);

   if(pvReturn == NULL)
   {
      pvReturn = NULL;
////      TRACE_ERROR("#######################Out of mem!######################\r\n");
   }

#if configUSE_MALLOC_FAILED_HOOK == 1
   //Memory allocation failed?
	if(pvReturn == NULL)
	{
	   extern void vApplicationMallocFailedHook(void);
	   vApplicationMallocFailedHook();
	}
#endif
   
   //Return a pointer to the memory block
   return pvReturn;
}


/**
 *@brief Deallocate space in memory
 *@param pv Pointer to a memory block previously allocated
 **/

void osFreeMem2(void *p)
{
   if(p)
   {
      //Debug message
      //TRACE_DEBUG("Free memory at 0x%08X\r\n", pv);
      //Suspends all the tasks while keeping interrupts enabled
   	vTaskSuspendAll();
      //Deallocate space in memory
   	free(p);
      //Resume all the tasks
   	xTaskResumeAll();
   }
}

//static int delta = 0;

typedef struct
{
   void *address;
   unsigned int size;
   unsigned int line;
   char filename[16];
} HeapStatEntry;

#if 0
static HeapStatEntry heapStat[100];


void initHeapStat(void)
{
   memset(heapStat, 0, sizeof(heapStat));
}

void displayHeapStat(void)
{
   unsigned int i;
   
   vTaskSuspendAll();
   TRACE_DEBUG("Heap Statistics...\r\n");
   
   for(i = 0; i < arraysize(heapStat); i++)
   {
      if(heapStat[i].address)
      {
         TRACE_DEBUG("  %d bytes at 0x08%X (%s line %d)\r\n",
            heapStat[i].size, heapStat[i].address, heapStat[i].filename, heapStat[i].line);
      }
   }
   xTaskResumeAll();
}


void *osAllocMemDebug(unsigned int size, const char *filename, unsigned int line)
{
   unsigned int i;
   tskTCB *task;
   
   void *p = osAllocMem2(size);
   const char *q = strrchr(filename, '\\');
   if(q) filename = q + 1;

   delta++;
   task = xTaskGetCurrentTaskHandle();
   i = uxTaskGetStackHighWaterMark(NULL);
   TRACE_DEBUG("%d #### Allocate %d bytes at 0x%08X (%s line %d) (stack=%d task=%s)\r\n", delta, size, p, filename, line, i, task ? task->pcTaskName: ""); 
   
   if(!p)
   {
      TRACE_ERROR("####### Failed to allocate memory! #######\r\n");
   }
   else
   {
      /*vTaskSuspendAll();
      for(i = 0; i < arraysize(heapStat); i++)
      {
         if(!heapStat[i].address)
         {
            heapStat[i].address = p;
            heapStat[i].size = size;
            heapStat[i].line = line;
            strncpy(heapStat[i].filename, filename, 15);
            heapStat[i].filename[15] = '\0';
            break;
         }
      }
      xTaskResumeAll();*/
   }
   
   //displayHeapStat();
   
   return p;
}


void osFreeMemDebug(void *p, const char *filename, unsigned int line)
{
   unsigned int i;
   tskTCB *task;
   
   const char *q = strrchr(filename, '\\');
   if(q) filename = q + 1;
   delta--;
   task = xTaskGetCurrentTaskHandle();
   i = uxTaskGetStackHighWaterMark(NULL);
   TRACE_DEBUG("%d #### Free memory at 0x08%X (%s line %d) (stack=%d task=%s)\r\n", delta, p, filename, line, i, task ? task->pcTaskName: ""); 
   if(p >= 0x21FE0000 && p < (0x21FE0000 + 0x1F000))
   {
      osFreeMem2(p);
   }
   else
   {
      TRACE_ERROR("### Invalid pointer to free !!!!\r\n ###");
   }
   
   /*vTaskSuspendAll();
   for(i = 0; i < arraysize(heapStat); i++)
   {
      if(heapStat[i].address == p)
      {
         memset(heapStat + i, 0, sizeof(HeapStatEntry));
         break;
      }
   }
   xTaskResumeAll();
   
   displayHeapStat();*/
}
#endif

