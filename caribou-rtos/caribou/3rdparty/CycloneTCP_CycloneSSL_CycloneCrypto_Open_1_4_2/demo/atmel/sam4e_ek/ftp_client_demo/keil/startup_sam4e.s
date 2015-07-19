;/*****************************************************************************
; * @file     startup_SAM4E.s
; * @brief    CMSIS Cortex-M4 Core Device Startup File
; *           for the Atmel SAM4E Device Series
; * @version  V1.00
; * @date     18. February 2013
; *
; * @note
; * Copyright (C) 2013 ARM Limited. All rights reserved.
; *
; * @par
; * ARM Limited (ARM) is supplying this software for use with Cortex-M
; * processor based microcontrollers.  This file can be freely distributed
; * within development tools that are supporting such ARM based processors.
; *
; * @par
; * THIS SOFTWARE IS PROVIDED "AS IS".  NO WARRANTIES, WHETHER EXPRESS, IMPLIED
; * OR STATUTORY, INCLUDING, BUT NOT LIMITED TO, IMPLIED WARRANTIES OF
; * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE APPLY TO THIS SOFTWARE.
; * ARM SHALL NOT, IN ANY CIRCUMSTANCES, BE LIABLE FOR SPECIAL, INCIDENTAL, OR
; * CONSEQUENTIAL DAMAGES, FOR ANY REASON WHATSOEVER.
; *
; ******************************************************************************/
;/*
;//-------- <<< Use Configuration Wizard in Context Menu >>> ------------------
;*/


; <h> Stack Configuration
;   <o> Stack Size (in Bytes) <0x0-0xFFFFFFFF:8>
; </h>

Stack_Size      EQU     0x00000200

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
                EXPORT  __Vectors_End
                EXPORT  __Vectors_Size

__Vectors       DCD     __initial_sp              ; Top of Stack
                DCD     Reset_Handler             ; Reset Handler
                DCD     NMI_Handler               ; NMI Handler
                DCD     HardFault_Handler         ; Hard Fault Handler
                DCD     MemManage_Handler         ; MPU Fault Handler
                DCD     BusFault_Handler          ; Bus Fault Handler
                DCD     UsageFault_Handler        ; Usage Fault Handler
                DCD     0                         ; Reserved
                DCD     0                         ; Reserved
                DCD     0                         ; Reserved
                DCD     0                         ; Reserved
                DCD     SVC_Handler               ; SVCall Handler
                DCD     DebugMon_Handler          ; Debug Monitor Handler
                DCD     0                         ; Reserved
                DCD     PendSV_Handler            ; PendSV Handler
                DCD     SysTick_Handler           ; SysTick Handler

                ; External Interrupts
                DCD     SUPC_Handler              ;  0 Supply Controller
                DCD     RSTC_Handler              ;  1 Reset Controller
                DCD     RTC_Handler               ;  2 Real Time Clock
                DCD     RTT_Handler               ;  3 Real Time Timer
                DCD     WDT_Handler               ;  4 Watchdog/Dual Watchdog Timer
                DCD     PMC_Handler               ;  5 Power Management Controller
                DCD     EFC_Handler               ;  6 Enhanced Embedded Flash Controller
                DCD     UART0_Handler             ;  7 UART 0
                DCD     0                         ;  8 reserved
                DCD     PIOA_Handler              ;  9 Parallel I/O Controller A
                DCD     PIOB_Handler              ; 10 Parallel I/O Controller B
                DCD     PIOC_Handler              ; 11 Parallel I/O Controller C
                DCD     PIOD_Handler              ; 12 Parallel I/O Controller D
                DCD     PIOE_Handler              ; 13 Parallel I/O Controller E
                DCD     USART0_Handler            ; 14 USART 0
                DCD     USART1_Handler            ; 15 USART 1
                DCD     HSMCI_Handler             ; 16 Multimedia Card Interface
                DCD     TWI0_Handler              ; 17 Two Wire Interface 0
                DCD     TWI1_Handler              ; 18 Two Wire Interface 1
                DCD     SPI_Handler               ; 19 Serial Peripheral Interface
                DCD     DMAC_Handler              ; 20 DMAC */
                DCD     TC0_Handler               ; 21 Timer/Counter 0
                DCD     TC1_Handler               ; 22 Timer/Counter 1
                DCD     TC2_Handler               ; 23 Timer/Counter 2
                DCD     TC3_Handler               ; 24 Timer/Counter 3
                DCD     TC4_Handler               ; 25 Timer/Counter 4
                DCD     TC5_Handler               ; 26 Timer/Counter 5
                DCD     TC6_Handler               ; 27 Timer/Counter 6
                DCD     TC7_Handler               ; 28 Timer/Counter 7
                DCD     TC8_Handler               ; 29 Timer/Counter 8
                DCD     AFEC0_Handler             ; 30 Analog Front End 0
                DCD     AFEC1_Handler             ; 31 Analog Front End 1
                DCD     DACC_Handler              ; 32 Digital To Analog Converter
                DCD     ACC_Handler               ; 33 Analog Comparator
                DCD     ARM_Handler               ; 34 FPU signals
                DCD     UDP_Handler               ; 35 USB DEVICE
                DCD     PWM_Handler               ; 36 PWM
                DCD     CAN0_Handler              ; 37 CAN0
                DCD     CAN1_Handler              ; 38 CAN1
                DCD     AES_Handler               ; 39 AES
                DCD     0                         ; 40 reserved
                DCD     0                         ; 41 reserved
                DCD     0                         ; 42 reserved
                DCD     0                         ; 43 reserved
                DCD     GMAC_Handler              ; 44 EMAC
                DCD     UART1_Handler             ; 45 UART
                DCD     0                         ; 46 reserved
__Vectors_End

__Vectors_Size  EQU     __Vectors_End - __Vectors

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
                EXPORT  EFC_Handler               [WEAK]
                EXPORT  UART0_Handler             [WEAK]
                EXPORT  PIOA_Handler              [WEAK]
                EXPORT  PIOB_Handler              [WEAK]
                EXPORT  PIOC_Handler              [WEAK]
                EXPORT  PIOD_Handler              [WEAK]
                EXPORT  PIOE_Handler              [WEAK]
                EXPORT  USART0_Handler            [WEAK]
                EXPORT  USART1_Handler            [WEAK]
                EXPORT  HSMCI_Handler             [WEAK]
                EXPORT  TWI0_Handler              [WEAK]
                EXPORT  TWI1_Handler              [WEAK]
                EXPORT  SPI_Handler               [WEAK]
                EXPORT  DMAC_Handler              [WEAK]
                EXPORT  TC0_Handler               [WEAK]
                EXPORT  TC1_Handler               [WEAK]
                EXPORT  TC2_Handler               [WEAK]
                EXPORT  TC3_Handler               [WEAK]
                EXPORT  TC4_Handler               [WEAK]
                EXPORT  TC5_Handler               [WEAK]
                EXPORT  TC6_Handler               [WEAK]
                EXPORT  TC7_Handler               [WEAK]
                EXPORT  TC8_Handler               [WEAK]
                EXPORT  AFEC0_Handler             [WEAK]
                EXPORT  AFEC1_Handler             [WEAK]
                EXPORT  DACC_Handler              [WEAK]
                EXPORT  ACC_Handler               [WEAK]
                EXPORT  ARM_Handler               [WEAK]
                EXPORT  UDP_Handler               [WEAK]
                EXPORT  PWM_Handler               [WEAK]
                EXPORT  CAN0_Handler              [WEAK]
                EXPORT  CAN1_Handler              [WEAK]
                EXPORT  AES_Handler               [WEAK]
                EXPORT  GMAC_Handler              [WEAK]
                EXPORT  UART1_Handler             [WEAK]

SUPC_Handler
RSTC_Handler
RTC_Handler
RTT_Handler
WDT_Handler
PMC_Handler
EFC_Handler
UART0_Handler
PIOA_Handler
PIOB_Handler
PIOC_Handler
PIOD_Handler
PIOE_Handler
USART0_Handler
USART1_Handler
HSMCI_Handler
TWI0_Handler
TWI1_Handler
SPI_Handler
DMAC_Handler
TC0_Handler
TC1_Handler
TC2_Handler
TC3_Handler
TC4_Handler
TC5_Handler
TC6_Handler
TC7_Handler
TC8_Handler
AFEC0_Handler
AFEC1_Handler
DACC_Handler
ACC_Handler
ARM_Handler
UDP_Handler
PWM_Handler
CAN0_Handler
CAN1_Handler
AES_Handler
GMAC_Handler
UART1_Handler
                B       .
                ENDP


                ALIGN


; User Initial Stack & Heap

;                IF      :DEF:__MICROLIB

;                EXPORT  __initial_sp
;                EXPORT  __heap_base
;                EXPORT  __heap_limit

;                ELSE

;                IMPORT  __use_two_region_memory
;                EXPORT  __user_initial_stackheap
;__user_initial_stackheap

;                LDR     R0, =  Heap_Mem
;                LDR     R1, =(Stack_Mem + Stack_Size)
;                LDR     R2, = (Heap_Mem +  Heap_Size)
;                LDR     R3, = Stack_Mem
;                BX      LR

;                ALIGN

;                ENDIF


                END
