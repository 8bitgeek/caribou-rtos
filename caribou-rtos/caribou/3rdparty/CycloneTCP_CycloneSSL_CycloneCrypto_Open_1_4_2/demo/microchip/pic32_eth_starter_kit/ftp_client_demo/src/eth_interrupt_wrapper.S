//Dependencies
#include "isr_support.h"

   .global ethInterruptWrapper
   .extern pic32EthInterrupt
   .extern xISRStackTop

   .set nomips16
   .set noreorder
   .set noat

   .ent ethInterruptWrapper

//Ethernet interrupt
ethInterruptWrapper:
   //Save the current task context
   portSAVE_CONTEXT
   //Call interrupt handler
   jal pic32EthInterrupt
   nop
   //Restore the context of the next task to execute
   portRESTORE_CONTEXT

   .end ethInterruptWrapper
