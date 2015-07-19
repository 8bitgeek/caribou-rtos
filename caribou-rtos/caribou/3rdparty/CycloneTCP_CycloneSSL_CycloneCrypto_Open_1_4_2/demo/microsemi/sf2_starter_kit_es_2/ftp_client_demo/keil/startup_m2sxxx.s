;/*******************************************************************************
; (c) Copyright 2009-2013 Microsemi SoC Products Group. All rights reserved.
; * SmartFusion2  startup code for Keil-MDK.
; *
; * SmartFusion2 vector table and startup code fir RealView tool chain.
; *
; * SVN $Revision: 5280 $
; * SVN $Date: 2013-03-22 20:51:50 +0000 (Fri, 22 Mar 2013) $
; */

; *------- <<< Use Configuration Wizard in Context Menu >>> ------------------


; <h> Stack Configuration
;   <o> Stack Size (in Bytes) <0x0-0xFFFFFFFF:8>
; </h>

Stack_Size      EQU     0x00001000

                AREA    STACK, NOINIT, READWRITE, ALIGN=3
Stack_Mem       SPACE   Stack_Size
__initial_sp


; <h> Heap Configuration
;   <o>  Heap Size (in Bytes) <0x0-0xFFFFFFFF:8>
; </h>

;Heap_Size       EQU     0x00000000

;                AREA    HEAP, NOINIT, READWRITE, ALIGN=3
;__heap_base
;Heap_Mem        SPACE   Heap_Size
;__heap_limit


                PRESERVE8
                THUMB


;-------------------------------------------------------------------------------
; Vector Table Mapped to Address 0 at Reset
                AREA    RESET, DATA, READONLY
                EXPORT  __Vectors
                EXPORT  __Vectors_End
                EXPORT  __Vectors_Size

__Vectors       DCD     __initial_sp               ; Top of Stack
                DCD     Reset_Handler              ; Reset Handler
                DCD     NMI_Handler                ; NMI Handler
                DCD     HardFault_Handler          ; Hard Fault Handler
                DCD     MemManage_Handler          ; MPU Fault Handler
                DCD     BusFault_Handler           ; Bus Fault Handler
                DCD     UsageFault_Handler         ; Usage Fault Handler
                DCD     0                          ; Reserved
                DCD     0                          ; Reserved
                DCD     0                          ; Reserved
                DCD     0                          ; Reserved
                DCD     SVC_Handler                ; SVCall Handler
                DCD     DebugMon_Handler           ; Debug Monitor Handler
                DCD     0                          ; Reserved
                DCD     PendSV_Handler             ; PendSV Handler
                DCD     SysTick_Handler            ; SysTick Handler

                ; External Interrupts
                DCD     WdogWakeup_IRQHandler
                DCD     RTC_Wakeup_IRQHandler
                DCD     SPI0_IRQHandler
                DCD     SPI1_IRQHandler
                DCD     I2C0_IRQHandler
                DCD     I2C0_SMBAlert_IRQHandler
                DCD     I2C0_SMBus_IRQHandler
                DCD     I2C1_IRQHandler
                DCD     I2C1_SMBAlert_IRQHandler
                DCD     I2C1_SMBus_IRQHandler
                DCD     UART0_IRQHandler
                DCD     UART1_IRQHandler
                DCD     EthernetMAC_IRQHandler
                DCD     DMA_IRQHandler
                DCD     Timer1_IRQHandler
                DCD     Timer2_IRQHandler
                DCD     CAN_IRQHandler
                DCD     ENVM0_IRQHandler
                DCD     ENVM1_IRQHandler
                DCD     ComBlk_IRQHandler
                DCD     USB_IRQHandler
                DCD     USB_DMA_IRQHandler
                DCD     PLL_Lock_IRQHandler
                DCD     PLL_LockLost_IRQHandler
                DCD     CommSwitchError_IRQHandler
                DCD     CacheError_IRQHandler
                DCD     DDR_IRQHandler
                DCD     HPDMA_Complete_IRQHandler
                DCD     HPDMA_Error_IRQHandler
                DCD     ECC_Error_IRQHandler
                DCD     MDDR_IOCalib_IRQHandler
                DCD     FAB_PLL_Lock_IRQHandler
                DCD     FAB_PLL_LockLost_IRQHandler
                DCD     FIC64_IRQHandler
                DCD     FabricIrq0_IRQHandler
                DCD     FabricIrq1_IRQHandler
                DCD     FabricIrq2_IRQHandler
                DCD     FabricIrq3_IRQHandler
                DCD     FabricIrq4_IRQHandler
                DCD     FabricIrq5_IRQHandler
                DCD     FabricIrq6_IRQHandler
                DCD     FabricIrq7_IRQHandler
                DCD     FabricIrq8_IRQHandler
                DCD     FabricIrq9_IRQHandler
                DCD     FabricIrq10_IRQHandler
                DCD     FabricIrq11_IRQHandler
                DCD     FabricIrq12_IRQHandler
                DCD     FabricIrq13_IRQHandler
                DCD     FabricIrq14_IRQHandler
                DCD     FabricIrq15_IRQHandler                
                DCD     GPIO0_IRQHandler
                DCD     GPIO1_IRQHandler
                DCD     GPIO2_IRQHandler
                DCD     GPIO3_IRQHandler
                DCD     GPIO4_IRQHandler
                DCD     GPIO5_IRQHandler
                DCD     GPIO6_IRQHandler
                DCD     GPIO7_IRQHandler
                DCD     GPIO8_IRQHandler
                DCD     GPIO9_IRQHandler
                DCD     GPIO10_IRQHandler
                DCD     GPIO11_IRQHandler
                DCD     GPIO12_IRQHandler
                DCD     GPIO13_IRQHandler
                DCD     GPIO14_IRQHandler
                DCD     GPIO15_IRQHandler
                DCD     GPIO16_IRQHandler
                DCD     GPIO17_IRQHandler
                DCD     GPIO18_IRQHandler
                DCD     GPIO19_IRQHandler
                DCD     GPIO20_IRQHandler
                DCD     GPIO21_IRQHandler
                DCD     GPIO22_IRQHandler
                DCD     GPIO23_IRQHandler
                DCD     GPIO24_IRQHandler
                DCD     GPIO25_IRQHandler
                DCD     GPIO26_IRQHandler
                DCD     GPIO27_IRQHandler
                DCD     GPIO28_IRQHandler
                DCD     GPIO29_IRQHandler
                DCD     GPIO30_IRQHandler
                DCD     GPIO31_IRQHandler

__Vectors_End

__Vectors_Size 	EQU 	__Vectors_End - __Vectors

                AREA    |.text|, CODE, READONLY



;-------------------------------------------------------------------------------
; Reset Handler
;
Reset_Handler   PROC
                EXPORT  Reset_Handler             [WEAK]
                IMPORT  SystemInit
                IMPORT  __main
                LDR     R0, =SystemInit
                BLX     R0
                LDR     R0, =__main
                BX      R0
                ENDP

;-------------------------------------------------------------------------------
; Dummy Exception Handlers (infinite loops which can be modified)                

NMI_Handler     PROC
                EXPORT  NMI_Handler                [WEAK]
                B       .
                ENDP
HardFault_Handler\
                PROC
                EXPORT  HardFault_Handler          [WEAK]
                B       .
                ENDP
MemManage_Handler\
                PROC
                EXPORT  MemManage_Handler          [WEAK]
                B       .
                ENDP
BusFault_Handler\
                PROC
                EXPORT  BusFault_Handler           [WEAK]
                B       .
                ENDP
UsageFault_Handler\
                PROC
                EXPORT  UsageFault_Handler         [WEAK]
                B       .
                ENDP
SVC_Handler     PROC
                EXPORT  SVC_Handler                [WEAK]
                B       .
                ENDP
DebugMon_Handler\
                PROC
                EXPORT  DebugMon_Handler           [WEAK]
                B       .
                ENDP
PendSV_Handler  PROC
                EXPORT  PendSV_Handler             [WEAK]
                B       .
                ENDP
SysTick_Handler PROC
                EXPORT  SysTick_Handler            [WEAK]
                B       .
                ENDP

Default_Handler PROC

                EXPORT  WdogWakeup_IRQHandler           [WEAK]
                EXPORT  RTC_Wakeup_IRQHandler           [WEAK]
                EXPORT  SPI0_IRQHandler                 [WEAK]
                EXPORT  SPI1_IRQHandler                 [WEAK]
                EXPORT  I2C0_IRQHandler                 [WEAK]
                EXPORT  I2C0_SMBAlert_IRQHandler        [WEAK]
                EXPORT  I2C0_SMBus_IRQHandler           [WEAK]
                EXPORT  I2C1_IRQHandler                 [WEAK]
                EXPORT  I2C1_SMBAlert_IRQHandler        [WEAK]
                EXPORT  I2C1_SMBus_IRQHandler           [WEAK]
                EXPORT  UART0_IRQHandler                [WEAK]
                EXPORT  UART1_IRQHandler                [WEAK]
                EXPORT  EthernetMAC_IRQHandler          [WEAK]
                EXPORT  DMA_IRQHandler                  [WEAK]
                EXPORT  Timer1_IRQHandler               [WEAK]
                EXPORT  Timer2_IRQHandler               [WEAK]
                EXPORT  CAN_IRQHandler                  [WEAK]
                EXPORT  ENVM0_IRQHandler                [WEAK]
                EXPORT  ENVM1_IRQHandler                [WEAK]
                EXPORT  ComBlk_IRQHandler               [WEAK]
                EXPORT  USB_IRQHandler                  [WEAK]
                EXPORT  USB_DMA_IRQHandler              [WEAK]
                EXPORT  PLL_Lock_IRQHandler             [WEAK]
                EXPORT  PLL_LockLost_IRQHandler         [WEAK]
                EXPORT  CommSwitchError_IRQHandler      [WEAK]
                EXPORT  CacheError_IRQHandler           [WEAK]
                EXPORT  DDR_IRQHandler                  [WEAK]
                EXPORT  HPDMA_Complete_IRQHandler       [WEAK]
                EXPORT  HPDMA_Error_IRQHandler          [WEAK]
                EXPORT  ECC_Error_IRQHandler            [WEAK]
                EXPORT  MDDR_IOCalib_IRQHandler         [WEAK]
                EXPORT  FAB_PLL_Lock_IRQHandler         [WEAK]
                EXPORT  FAB_PLL_LockLost_IRQHandler     [WEAK]
                EXPORT  FIC64_IRQHandler                [WEAK]
                EXPORT  FabricIrq0_IRQHandler           [WEAK]
                EXPORT  FabricIrq1_IRQHandler           [WEAK]
                EXPORT  FabricIrq2_IRQHandler           [WEAK]
                EXPORT  FabricIrq3_IRQHandler           [WEAK]
                EXPORT  FabricIrq4_IRQHandler           [WEAK]
                EXPORT  FabricIrq5_IRQHandler           [WEAK]
                EXPORT  FabricIrq6_IRQHandler           [WEAK]
                EXPORT  FabricIrq7_IRQHandler           [WEAK]
                EXPORT  FabricIrq8_IRQHandler           [WEAK]
                EXPORT  FabricIrq9_IRQHandler           [WEAK]
                EXPORT  FabricIrq10_IRQHandler          [WEAK]
                EXPORT  FabricIrq11_IRQHandler          [WEAK]
                EXPORT  FabricIrq12_IRQHandler          [WEAK]
                EXPORT  FabricIrq13_IRQHandler          [WEAK]
                EXPORT  FabricIrq14_IRQHandler          [WEAK]
                EXPORT  FabricIrq15_IRQHandler          [WEAK]                
                EXPORT  GPIO0_IRQHandler                [WEAK]
                EXPORT  GPIO1_IRQHandler                [WEAK]
                EXPORT  GPIO2_IRQHandler                [WEAK]
                EXPORT  GPIO3_IRQHandler                [WEAK]
                EXPORT  GPIO4_IRQHandler                [WEAK]
                EXPORT  GPIO5_IRQHandler                [WEAK]
                EXPORT  GPIO6_IRQHandler                [WEAK]
                EXPORT  GPIO7_IRQHandler                [WEAK]
                EXPORT  GPIO8_IRQHandler                [WEAK]
                EXPORT  GPIO9_IRQHandler                [WEAK]
                EXPORT  GPIO10_IRQHandler               [WEAK]
                EXPORT  GPIO11_IRQHandler               [WEAK]
                EXPORT  GPIO12_IRQHandler               [WEAK]
                EXPORT  GPIO13_IRQHandler               [WEAK]
                EXPORT  GPIO14_IRQHandler               [WEAK]
                EXPORT  GPIO15_IRQHandler               [WEAK]
                EXPORT  GPIO16_IRQHandler               [WEAK]
                EXPORT  GPIO17_IRQHandler               [WEAK]
                EXPORT  GPIO18_IRQHandler               [WEAK]
                EXPORT  GPIO19_IRQHandler               [WEAK]
                EXPORT  GPIO20_IRQHandler               [WEAK]
                EXPORT  GPIO21_IRQHandler               [WEAK]
                EXPORT  GPIO22_IRQHandler               [WEAK]
                EXPORT  GPIO23_IRQHandler               [WEAK]
                EXPORT  GPIO24_IRQHandler               [WEAK]
                EXPORT  GPIO25_IRQHandler               [WEAK]
                EXPORT  GPIO26_IRQHandler               [WEAK]
                EXPORT  GPIO27_IRQHandler               [WEAK]
                EXPORT  GPIO28_IRQHandler               [WEAK]
                EXPORT  GPIO29_IRQHandler               [WEAK]
                EXPORT  GPIO30_IRQHandler               [WEAK]
                EXPORT  GPIO31_IRQHandler               [WEAK]


WdogWakeup_IRQHandler
RTC_Wakeup_IRQHandler
SPI0_IRQHandler
SPI1_IRQHandler
I2C0_IRQHandler
I2C0_SMBAlert_IRQHandler
I2C0_SMBus_IRQHandler
I2C1_IRQHandler
I2C1_SMBAlert_IRQHandler
I2C1_SMBus_IRQHandler
UART0_IRQHandler
UART1_IRQHandler
EthernetMAC_IRQHandler
DMA_IRQHandler
Timer1_IRQHandler
Timer2_IRQHandler
CAN_IRQHandler
ENVM0_IRQHandler
ENVM1_IRQHandler
ComBlk_IRQHandler
USB_IRQHandler
USB_DMA_IRQHandler
PLL_Lock_IRQHandler
PLL_LockLost_IRQHandler
CommSwitchError_IRQHandler
CacheError_IRQHandler
DDR_IRQHandler
HPDMA_Complete_IRQHandler
HPDMA_Error_IRQHandler
ECC_Error_IRQHandler
MDDR_IOCalib_IRQHandler
FAB_PLL_Lock_IRQHandler
FAB_PLL_LockLost_IRQHandler
FIC64_IRQHandler
FabricIrq0_IRQHandler
FabricIrq1_IRQHandler
FabricIrq2_IRQHandler
FabricIrq3_IRQHandler
FabricIrq4_IRQHandler
FabricIrq5_IRQHandler
FabricIrq6_IRQHandler
FabricIrq7_IRQHandler
FabricIrq8_IRQHandler 
FabricIrq9_IRQHandler 
FabricIrq10_IRQHandler
FabricIrq11_IRQHandler
FabricIrq12_IRQHandler
FabricIrq13_IRQHandler
FabricIrq14_IRQHandler
FabricIrq15_IRQHandler
GPIO0_IRQHandler
GPIO1_IRQHandler
GPIO2_IRQHandler
GPIO3_IRQHandler
GPIO4_IRQHandler
GPIO5_IRQHandler
GPIO6_IRQHandler
GPIO7_IRQHandler
GPIO8_IRQHandler
GPIO9_IRQHandler
GPIO10_IRQHandler
GPIO11_IRQHandler
GPIO12_IRQHandler
GPIO13_IRQHandler
GPIO14_IRQHandler
GPIO15_IRQHandler
GPIO16_IRQHandler
GPIO17_IRQHandler
GPIO18_IRQHandler
GPIO19_IRQHandler
GPIO20_IRQHandler
GPIO21_IRQHandler
GPIO22_IRQHandler
GPIO23_IRQHandler
GPIO24_IRQHandler
GPIO25_IRQHandler
GPIO26_IRQHandler
GPIO27_IRQHandler
GPIO28_IRQHandler
GPIO29_IRQHandler
GPIO30_IRQHandler
GPIO31_IRQHandler
                B       .

                ENDP

mscc_post_hw_cfg_init PROC
                EXPORT  mscc_post_hw_cfg_init           [WEAK]
                BX LR
                ENDP
                
                ALIGN


;-------------------------------------------------------------------------------
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
