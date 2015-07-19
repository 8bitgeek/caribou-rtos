//Dependencies
#include "isr_support.h"

   .global ext3InterruptWrapper
   .extern dp83848Interrupt
   .extern xISRStackTop

   .set nomips16
   .set noreorder
   .set noat

   .ent ext3InterruptWrapper

//External 3 interrupt
ext3InterruptWrapper:
   //Save the current task context
   portSAVE_CONTEXT
   //Call interrupt handler
   jal dp83848Interrupt
   nop
   //Restore the context of the next task to execute
   portRESTORE_CONTEXT

   .end ext3InterruptWrapper
