;***********************
;* Constant definition *
;***********************

ARM_MODE_USR      equ   0x10
ARM_MODE_FIQ      equ   0x11
ARM_MODE_IRQ      equ   0x12
ARM_MODE_SVC      equ   0x13
ARM_MODE_ABT      equ   0x17
ARM_MODE_UND      equ   0x1B
ARM_MODE_SYS      equ   0x1F

I_BIT             equ   0x80
F_BIT             equ   0x40

AT91C_BASE_AIC    equ   0xFFFFF000
AIC_IVR           equ   0x0100
AIC_EOICR         equ   0x0130

;*******************************
;* External symbol declaration *
;*******************************

         import   |Image$$Fixed_region$$Limit|
         import   |Image$$Relocate_region$$Base|
         import   |Image$$Relocate_region$$ZI$$Base|
         import   |Image$$Relocate_region$$ZI$$Limit|
         import   |Image$$ARM_LIB_HEAP$$Base|
         import   |Image$$ARM_LIB_HEAP$$ZI$$Limit|
         import   |Image$$ARM_LIB_STACK$$Base|
         import   |Image$$ARM_LIB_STACK$$ZI$$Limit|
         import   |Image$$ISR_STACK$$Base|
         import   |Image$$ISR_STACK$$ZI$$Limit|
         
         import   vPortYieldProcessor
         import   undefinedInstrException
         import   prefetchAbortException
         import   dataAbortException
         import   lowLevelInit
         import   __main
         
         export   resetHandler
         
         ;preserves eight-byte alignment of the stack
         preserve8
         
;****************
;* Vector table *
;****************
         
         area     VECTOR_TABLE, code
         code32
             
         ;Reset
         ldr      pc, =resetHandler
         ;Undefined instruction exception vector
         ldr      pc, =undefinedInstrHandler
         ;Software interrupt
         ldr      pc, =vPortYieldProcessor               
         ;Prefetch abort exception
         ldr      pc, =prefetchAbortHandler 
         ;Data abort exception
         ldr      pc, =dataAbortHandler
         ;Reserved vector
         ldr      pc, =defaultHandler
         ;IRQ interrupt (auto-vectoring)
         ldr      pc, [pc, #-0xF20]
         ;FIQ interrupt
         ldr      pc, =defaultHandler

;****************************
; Default exception handler *
;****************************

defaultHandler
         b        defaultHandler            

;*******************************************
;* Undefined instruction exception handler *
;*******************************************

undefinedInstrHandler
         ldr      r1, =undefinedInstrException
         sub      r0, lr, #4
         bx       r1

;************************************
;* Prefetch abort exception handler *
;************************************

prefetchAbortHandler
         ldr      r1, =prefetchAbortException
         sub      r0, lr, #4
         bx       r1

;********************************
;* Data abort exception handler *
;********************************
    
dataAbortHandler
         ldr      r1, =dataAbortException
         sub      r0, lr, #8
         bx       r1

;*************************
;* IRQ interrupt handler *
;*************************

irqHandler
         ;Adjust LR to point to the return address
         sub      lr, lr, #4
         ;Save adjusted LR to the IRQ stack
         stmfd    sp!, {lr}
         ;SPSR register needs to be saved for nested interrupts
         mrs      r14, spsr
         stmfd    sp!, {r0, r14}
         
         ;Read the vector corresponding to the current interrupt
         ldr      r14, =AT91C_BASE_AIC
         ldr      r0, [r14, #AIC_IVR]
         ;A write to the IVR register is recomended
         str      r14, [r14, #AIC_IVR]
         
         ;Enter Supervisor mode
         msr      cpsr_c, #ARM_MODE_SVC
         ;Push scratch registers and LR to the stack
         stmfd    sp!, {r1-r3, r12, r14}
         ;Branch to interrupt handler
         mov      lr, pc
         bx       r0
         ;Pull registers from the stack
         ldmfd    sp!, {r1-r3, r12, r14}
         ;Switch back to IRQ mode and disable interrupts
         msr      cpsr_c, #(ARM_MODE_IRQ :OR: I_BIT)
         
         ;Acknowledge interrrupt
         ldr      r14, =AT91C_BASE_AIC
         str      r14, [r14, #AIC_EOICR]
         
         ;Restore interrupt context from IRQ stack
         ldmfd    sp!, {r0, r14}
         msr      spsr_cxsf, r14
         ;Branch back to calling code
         ldmfd    sp!, {pc}^

;*****************
;* Reset handler *
;*****************
                
         area  CSTARTUP, code
         entry
                
resetHandler
         ;Set PC to actual code location (not in remap zone)
         ldr      pc, =%0
0        ;Initialize temporarily stack pointer
         ldr      r0, =|Image$$ARM_LIB_STACK$$ZI$$Limit|
         mov      sp, r0
         ;Call low-level initialization routine
         ldr      r0, =lowLevelInit
         mov      lr, pc
         bx       r0
         
         ;Initialize the Relocate_region segment 
         ldr      r0, =|Image$$Fixed_region$$Limit|
         ldr      r1, =|Image$$Relocate_region$$Base|
         ldr      r2, =|Image$$Relocate_region$$ZI$$Base|
         
         cmp      r0, r1                 
         beq      %2
         
1        cmp      r1, r2         
         ldrcc    r3, [r0], #4   
         strcc    r3, [r1], #4
         bcc      %1

2        ldr      r1, =|Image$$Relocate_region$$ZI$$Base|
         ldr      r2, =|Image$$Relocate_region$$ZI$$Limit|
         mov      r3, #0
                
3        cmp      r1, r2
         strcc    r3, [r1], #4
         bcc      %3

         ;SVC stack watermark
         ldr      r0, =|Image$$ARM_LIB_HEAP$$Base|
         ldr      r1, =|Image$$ARM_LIB_HEAP$$ZI$$Limit|
         mov      r3, #0x000000AA
         orr      r3, #0x0000AA00
         orr      r3, #0x00AA0000
         orr      r3, #0xAA000000
         
4        cmp      r0, r1
         strcc    r3, [r0], #4
         bcc      %4         

         
         ;SVC stack watermark
         ldr      r0, =|Image$$ARM_LIB_STACK$$Base|
         ldr      r1, =|Image$$ARM_LIB_STACK$$ZI$$Limit|
         mov      r3, #0x000000BB
         orr      r3, #0x0000BB00
         orr      r3, #0x00BB0000
         orr      r3, #0xBB000000
         
5        cmp      r0, r1
         strcc    r3, [r0], #4
         bcc      %5

         ;IRQ stack watermark
         ldr      r0, =|Image$$ISR_STACK$$Base|
         ldr      r1, =|Image$$ISR_STACK$$ZI$$Limit|
         mov      r3, #0x000000CC
         orr      r3, #0x0000CC00
         orr      r3, #0x00CC0000
         orr      r3, #0xCC000000
         
6        cmp      r0, r1
         strcc    r3, [r0], #4
         bcc      %6         

         ;Setup stack pointer for Undefined Instruction mode
         msr      cpsr_c, #(ARM_MODE_UND :OR: I_BIT :OR: F_BIT)
         ldr      r0, =|Image$$ISR_STACK$$ZI$$Limit|
         mov      sp, r0
         
         ;Setup stack pointer for Abort mode
         msr      cpsr_c, #(ARM_MODE_ABT :OR: I_BIT :OR: F_BIT)
         ldr      r0, =|Image$$ISR_STACK$$ZI$$Limit|
         mov      sp, r0
         
         ;Setup stack pointer for FIQ mode
         msr      cpsr_c, #(ARM_MODE_FIQ :OR: I_BIT :OR: F_BIT)
         ldr      r0, =|Image$$ISR_STACK$$ZI$$Limit|
         mov      sp, r0
         
         ;Setup stack pointer for IRQ mode
         msr      cpsr_c, #(ARM_MODE_IRQ :OR: I_BIT :OR: F_BIT)
         ldr      r0, =|Image$$ISR_STACK$$ZI$$Limit|
         mov      sp, r0
         
         ;Setup stack pointer for Supervisor mode
         msr      cpsr_c, #(ARM_MODE_SVC :OR: F_BIT)
         ldr      r0, =|Image$$ARM_LIB_STACK$$ZI$$Limit|
         mov      sp, r0 
         
         ;Branch to main routine
         ldr      r0, =__main
         bx       r0              
         
         end
