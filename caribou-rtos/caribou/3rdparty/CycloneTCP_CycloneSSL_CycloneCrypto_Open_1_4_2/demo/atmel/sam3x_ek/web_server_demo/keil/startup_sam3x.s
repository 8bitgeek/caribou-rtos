;/*****************************************************************************
; * @file:    startup_SAM3N.s
; * @purpose: CMSIS Cortex-M3 Core Device Startup File 
; *           for the Atmel SAM3X Device Series 
; * @version: V1.00
; * @date:    19. October 2010
; *------- <<< Use Configuration Wizard in Context Menu >>> ------------------
; *
; * Copyright (C) 2010 ARM Limited. All rights reserved.
; * ARM Limited (ARM) is supplying this software for use with Cortex-M3 
; * processor based microcontrollers.  This file can be freely distributed 
; * within development tools that are supporting such ARM based processors. 
; *
; * THIS SOFTWARE IS PROVIDED "AS IS".  NO WARRANTIES, WHETHER EXPRESS, IMPLIED
; * OR STATUTORY, INCLUDING, BUT NOT LIMITED TO, IMPLIED WARRANTIES OF
; * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE APPLY TO THIS SOFTWARE.
; * ARM SHALL NOT, IN ANY CIRCUMSTANCES, BE LIABLE FOR SPECIAL, INCIDENTAL, OR
; * CONSEQUENTIAL DAMAGES, FOR ANY REASON WHATSOEVER.
; *
; *****************************************************************************/


; <h> Stack Configuration
;   <o> Stack Size (in Bytes) <0x0-0xFFFFFFFF:8>
; </h>

Stack_Size      EQU     0x00000400

                AREA    STACK, NOINIT, READWRITE, ALIGN=3
Stack_Mem       SPACE   Stack_Size
__initial_sp


; <h> Heap Configuration
;   <o>  Heap Size (in Bytes) <0x0-0xFFFFFFFF:8>
; </h>

;Heap_Size       EQU     0x00000200

;                AREA    HEAP, NOINIT, READWRITE, ALIGN=3
;__heap_base
;Heap_Mem        SPACE   Heap_Size
;__heap_limit


                PRESERVE8
                THUMB


; Vector Table Mapped to Address 0 at Reset

                AREA    RESET, DATA, READONLY
                EXPORT  __Vectors

__Vectors       DCD     __initial_sp              ;  0: Top of Stack
                DCD     Reset_Handler             ;  1: Reset Handler
                DCD     NMI_Handler               ;  2: NMI Handler
                DCD     HardFault_Handler         ;  3: Hard Fault Handler
                DCD     MemManage_Handler         ;  4: MPU Fault Handler
                DCD     BusFault_Handler          ;  5: Bus Fault Handler
                DCD     UsageFault_Handler        ;  6: Usage Fault Handler
                DCD     0                         ;  7: Reserved
                DCD     0                         ;  8: Reserved
                DCD     0                         ;  9: Reserved
                DCD     0                         ; 10: Reserved
                DCD     SVC_Handler               ; 11: SVCall Handler
                DCD     DebugMon_Handler          ; 12: Debug Monitor Handler
                DCD     0                         ; 13: Reserved
                DCD     PendSV_Handler            ; 14: PendSV Handler
                DCD     SysTick_Handler           ; 15: SysTick Handler

                ; External Interrupts
                DCD     SUPC_Handler              ; 16: SAM3X Supply Controller (SUPC)
                DCD     RSTC_Handler              ; 17: SAM3X Reset Controller (RSTC)
                DCD     RTC_Handler               ; 18: SAM3X Real Time Clock (RTC)
                DCD     RTT_Handler               ; 19: SAM3X Real Time Timer (RTT)
                DCD     WDT_Handler               ; 20: SAM3X Watchdog Timer (WDT)
                DCD     PMC_Handler               ; 21: SAM3X Power Management Controller (PMC)
                DCD     EFC0_Handler              ; 22: SAM3X Enhanced Flash Controller 0 (EFC0)
                DCD     EFC1_Handler              ; 23: SAM3X Enhanced Flash Controller 1 (EFC1)
                DCD     UART_Handler              ; 24: SAM3X Universal Asynchronous Receiver Transceiver (UART)
                DCD     SMC_Handler               ; 25: SAM3X Static Memory Controller (SMC)
                DCD     SDRAMC_Handler            ; 26: SAM3X Synchronous Dynamic RAM Controller (SDRAMC)
                DCD     PIOA_Handler              ; 27: SAM3X Parallel I/O Controller A + 16: (PIOA)
                DCD     PIOB_Handler              ; 28: SAM3X Parallel I/O Controller B (PIOB)
                DCD     PIOC_Handler              ; 29: SAM3X Parallel I/O Controller C (PIOC)
                DCD     PIOD_Handler              ; 30: SAM3X Parallel I/O Controller D (PIOD)
                DCD     PIOE_Handler              ; 31: SAM3X Parallel I/O Controller E (PIOE)
                DCD     PIOF_Handler              ; 32: SAM3X Parallel I/O Controller F (PIOF)
                DCD     USART0_Handler            ; 33: SAM3X USART 0 (USART0)
                DCD     USART1_Handler            ; 34: SAM3X USART 1 (USART1)
                DCD     USART2_Handler            ; 35: SAM3X USART 2 (USART2)
                DCD     USART3_Handler            ; 36: SAM3X USART 3 (USART3)
                DCD     HSMCI_Handler             ; 37: SAM3X Multimedia Card Interface (HSMCI)
                DCD     TWI0_Handler              ; 37: SAM3X Two-Wire Interface 0 (TWI0)
                DCD     TWI1_Handler              ; 39: SAM3X Two-Wire Interface 1 (TWI1)
                DCD     SPI0_Handler              ; 40: SAM3X Serial Peripheral Interface (SPI0)
                DCD     SPI1_Handler              ; 41: SAM3X Serial Peripheral Interface (SPI1)
                DCD     SSC_Handler               ; 42: SAM3X Synchronous Serial Controller (SSC)
                DCD     TC0_Handler               ; 43: SAM3X Timer Counter 0 (TC0)
                DCD     TC1_Handler               ; 44: SAM3X Timer Counter 1 (TC1)
                DCD     TC2_Handler               ; 45: SAM3X Timer Counter 2 (TC2)
                DCD     TC3_Handler               ; 46: SAM3X Timer Counter 3 (TC3)
                DCD     TC4_Handler               ; 47: SAM3X Timer Counter 4 (TC4)
                DCD     TC5_Handler               ; 48: SAM3X Timer Counter 5 (TC5)
                DCD     TC6_Handler               ; 49: SAM3X Timer Counter 6 (TC6)
                DCD     TC7_Handler               ; 50: SAM3X Timer Counter 7 (TC7)
                DCD     TC8_Handler               ; 51: SAM3X Timer Counter 8 (TC8)
                DCD     PWM_Handler               ; 52: SAM3X Pulse Width Modulation Controller (PWM)
                DCD     ADC_Handler               ; 53: SAM3X ADC Controller (ADC)
                DCD     DACC_Handler              ; 54: SAM3X DAC Controller (DACC)
                DCD     DMAC_Handler              ; 55: SAM3X DMA Controller (DMAC)
                DCD     UOTGHS_Handler            ; 56: SAM3X USB OTG High Speed (UOTGHS)
                DCD     TRNG_Handler              ; 57: SAM3X True Random Number Generator (TRNG)
                DCD     EMAC_Handler              ; 58: SAM3X Ethernet MAC (EMAC)
                DCD     CAN0_Handler              ; 59: SAM3X CAN Controller 0 (CAN0)
                DCD     CAN1_Handler              ; 60:  SAM3X CAN Controller 1 (CAN1)


                AREA    |.text|, CODE, READONLY


; Reset Handler

Reset_Handler   PROC
                EXPORT  Reset_Handler             [WEAK]
                IMPORT  SystemInit
                IMPORT  __main
                LDR     R0, =SystemInit
                BLX     R0
                LDR     R0, =__main
                BX      R0
                ENDP


; Dummy Exception Handlers (infinite loops which can be modified)                

NMI_Handler     PROC
                EXPORT  NMI_Handler               [WEAK]
                B       .
                ENDP
HardFault_Handler\
                PROC
                EXPORT  HardFault_Handler         [WEAK]
                B       .
                ENDP
MemManage_Handler\
                PROC
                EXPORT  MemManage_Handler         [WEAK]
                B       .
                ENDP
BusFault_Handler\
                PROC
                EXPORT  BusFault_Handler          [WEAK]
                B       .
                ENDP
UsageFault_Handler\
                PROC
                EXPORT  UsageFault_Handler        [WEAK]
                B       .
                ENDP
SVC_Handler     PROC
                EXPORT  SVC_Handler               [WEAK]
                B       .
                ENDP
DebugMon_Handler\
                PROC
                EXPORT  DebugMon_Handler          [WEAK]
                B       .
                ENDP
PendSV_Handler  PROC
                EXPORT  PendSV_Handler            [WEAK]
                B       .
                ENDP
SysTick_Handler PROC
                EXPORT  SysTick_Handler           [WEAK]
                B       .
                ENDP

Default_Handler PROC

                EXPORT  SUPC_Handler              [WEAK]
                EXPORT  RSTC_Handler              [WEAK]
                EXPORT  RTC_Handler               [WEAK]
                EXPORT  RTT_Handler               [WEAK]
                EXPORT  WDT_Handler               [WEAK]
                EXPORT  PMC_Handler               [WEAK]
                EXPORT  EFC0_Handler              [WEAK]
                EXPORT  EFC1_Handler              [WEAK]
                EXPORT  UART_Handler              [WEAK]
                EXPORT  SMC_Handler               [WEAK]
                EXPORT  SDRAMC_Handler            [WEAK]
                EXPORT  PIOA_Handler              [WEAK]
                EXPORT  PIOB_Handler              [WEAK]
                EXPORT  PIOC_Handler              [WEAK]
                EXPORT  PIOD_Handler              [WEAK]
                EXPORT  PIOE_Handler              [WEAK]
                EXPORT  PIOF_Handler              [WEAK]
                EXPORT  USART0_Handler            [WEAK]
                EXPORT  USART1_Handler            [WEAK]
                EXPORT  USART2_Handler            [WEAK]
                EXPORT  USART3_Handler            [WEAK]
                EXPORT  HSMCI_Handler             [WEAK]
                EXPORT  TWI0_Handler              [WEAK]
                EXPORT  TWI1_Handler              [WEAK]
                EXPORT  SPI0_Handler              [WEAK]
                EXPORT  SPI1_Handler              [WEAK]
                EXPORT  SSC_Handler               [WEAK]
                EXPORT  TC0_Handler               [WEAK]
                EXPORT  TC1_Handler               [WEAK]
                EXPORT  TC2_Handler               [WEAK]
                EXPORT  TC3_Handler               [WEAK]
                EXPORT  TC4_Handler               [WEAK]
                EXPORT  TC5_Handler               [WEAK]
                EXPORT  TC6_Handler               [WEAK]
                EXPORT  TC7_Handler               [WEAK]
                EXPORT  TC8_Handler               [WEAK]
                EXPORT  PWM_Handler               [WEAK]
                EXPORT  ADC_Handler               [WEAK]
                EXPORT  DACC_Handler              [WEAK]
                EXPORT  DMAC_Handler              [WEAK]
                EXPORT  UOTGHS_Handler            [WEAK]
                EXPORT  TRNG_Handler              [WEAK]
                EXPORT  EMAC_Handler              [WEAK]
                EXPORT  CAN0_Handler              [WEAK]
                EXPORT  CAN1_Handler              [WEAK]

SUPC_Handler
RSTC_Handler
RTC_Handler
RTT_Handler
WDT_Handler
PMC_Handler
EFC0_Handler
EFC1_Handler
UART_Handler
SMC_Handler
SDRAMC_Handler
PIOA_Handler
PIOB_Handler
PIOC_Handler
PIOD_Handler
PIOE_Handler
PIOF_Handler
USART0_Handler
USART1_Handler
USART2_Handler
USART3_Handler
HSMCI_Handler
TWI0_Handler
TWI1_Handler
SPI0_Handler
SPI1_Handler
SSC_Handler
TC0_Handler
TC1_Handler
TC2_Handler
TC3_Handler
TC4_Handler
TC5_Handler
TC6_Handler
TC7_Handler
TC8_Handler
PWM_Handler
ADC_Handler
DACC_Handler
DMAC_Handler
UOTGHS_Handler
TRNG_Handler
EMAC_Handler
CAN0_Handler
CAN1_Handler
                B       .

                ENDP


                ALIGN


; User Initial Stack & Heap

;                IF      :DEF:__MICROLIB
;                
;                EXPORT  __initial_sp
;                EXPORT  __heap_base
;                EXPORT  __heap_limit
;                
;                ELSE
;                
;                IMPORT  __use_two_region_memory
;                EXPORT  __user_initial_stackheap
;__user_initial_stackheap
;
;                LDR     R0, =  Heap_Mem
;                LDR     R1, =(Stack_Mem + Stack_Size)
;                LDR     R2, = (Heap_Mem +  Heap_Size)
;                LDR     R3, = Stack_Mem
;                BX      LR
;
;                ALIGN
;
;                ENDIF


                END
