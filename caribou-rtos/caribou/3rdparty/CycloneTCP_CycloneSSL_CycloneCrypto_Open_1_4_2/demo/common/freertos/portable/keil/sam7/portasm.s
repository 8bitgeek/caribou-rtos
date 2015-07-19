;*******************************
;* Numeric constant definition *
;*******************************

AT91C_BASE_AIC    equ   0xFFFFF000
AIC_EOICR         equ   0x0130

AT91C_BASE_PITC   equ   0xFFFFFD30
PITC_PIVR         equ   0x0008

;*******************************
;* External symbol declaration *
;*******************************

         import   pxCurrentTCB
         import   ulCriticalNesting
         
         import   vTaskSwitchContext
         import   vTaskIncrementTick
   
         export   vPortYieldProcessor
         export   vPortPreemptiveTick
         export   vPortStartFirstTask
      
;************************
;* Context saving macro *
;************************

         macro
         SAVE_CONTEXT
         
         stmdb    sp!, {r0}            ; Store R0 first as we need to use it.
         
         stmdb    sp, {sp}^            ; Set R0 to point to the task stack pointer.
         nop                        ;
         sub      sp, sp, #4            ;
         ldmia    sp!, {r0}            ;
         
         stmdb    r0!, {lr}            ; Push the return address onto the stack.
         mov      lr, r0               ; Now we have saved LR we can use it instead of R0.
         ldmia    sp!, {r0}            ; Pop R0 so we can save it onto the system mode stack.
         
         stmdb    lr, {r0-lr}^            ; Push all the system mode registers onto the task stack.
         nop                        ;
         sub      lr, lr, #60            ;
         
         mrs      r0, spsr            ; Push the SPSR onto the task stack.
         stmdb    lr!, {r0}            ;
         
         ldr      r0, =ulCriticalNesting   ;
         ldr      r0, [r0]            ;
         stmdb    lr!, {r0}            ;
         
         ldr      r0, =pxCurrentTCB      ; Store the new top of stack for the task.
         ldr      r1, [r0]            ;        
         str      lr, [r1]            ;
         
         mend


;***************************
;* Context restoring macro *
;***************************

         macro
         RESTORE_CONTEXT
         
         ldr      r0, =pxCurrentTCB      ; Set the LR to the task stack.  The location was...
         ldr      r0, [r0]            ; ... stored in pxCurrentTCB
         ldr      lr, [r0]
         
         ldr      r0, =ulCriticalNesting   ; The critical nesting depth is the first item on... 
         ldmfd    lr!, {R1}            ; ...the stack.  Load it into the ulCriticalNesting var.
         str      r1, [r0]            ;
         
         ldmfd    lr!, {r0}            ; Get the SPSR from the stack.
         msr      spsr_cxsf, r0         ;
         
         ldmfd    lr, {r0-r14}^         ; Restore all system mode registers for the task.
         nop                        ;
         
         ldr      lr, [lr, #+60]         ; Restore the return address
         
                                 ; And return - correcting the offset in the LR to obtain ...
         subs   pc, lr, #4            ; ...the correct address.
         
         mend
         
         
         ;preserves eight-byte alignment of the stack
         preserve8
         
         area    FREERTOS_PORTASM, code
         code32

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Starting the first task is just a matter of restoring the context that
; was created by pxPortInitialiseStack().
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
vPortStartFirstTask
         RESTORE_CONTEXT

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Manual context switch function.  This is the SWI hander.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
vPortYieldProcessor
         ADD      LR, LR, #4         ; Add 4 to the LR to make the LR appear exactly 
                              ; as if the context was saved during and IRQ 
                              ; handler.
                              
         SAVE_CONTEXT         ; Save the context of the current task...
         LDR R0, =vTaskSwitchContext   ; before selecting the next task to execute.
         mov     lr, pc
         BX R0
         RESTORE_CONTEXT         ; Restore the context of the selected task.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Preemptive context switch function.  This will only ever get installed if
; portUSE_PREEMPTION is set to 1 in portmacro.h.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
vPortPreemptiveTick
         SAVE_CONTEXT         ; Save the context of the current task.
         
         LDR R0, =vTaskIncrementTick ; Increment the tick count - this may wake a task.
         mov lr, pc
         BX R0
         LDR R0, =vTaskSwitchContext ; Select the next task to execute.
         mov lr, pc
         BX R0
         
         ;Read PIVR register to clear interrupt
         LDR   R14, =AT91C_BASE_PITC
         LDR   R0, [R14, #PITC_PIVR ]
         
         LDR R14, =AT91C_BASE_AIC   ; Mark the End of Interrupt on the AIC
         STR   R14, [R14, #AIC_EOICR]
         
         RESTORE_CONTEXT         ; Restore the context of the selected task.


         end

