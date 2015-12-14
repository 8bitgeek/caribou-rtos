	.cpu cortex-m0
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 1
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.code	16
	.file	"stm32f0xx_flash.c"
	.text
.Ltext0:
	.section	.text.FLASH_SetLatency,"ax",%progbits
	.align	2
	.global	FLASH_SetLatency
	.code	16
	.thumb_func
	.type	FLASH_SetLatency, %function
FLASH_SetLatency:
.LFB32:
	ldr	r3, .L2
	ldr	r2, [r3]
	mov	r1, #1
	bic	r2, r1
	orr	r0, r2
	str	r0, [r3]
	@ sp needed
	bx	lr
.L3:
	.align	2
.L2:
	.word	1073881088
.LFE32:
	.size	FLASH_SetLatency, .-FLASH_SetLatency
	.section	.text.FLASH_PrefetchBufferCmd,"ax",%progbits
	.align	2
	.global	FLASH_PrefetchBufferCmd
	.code	16
	.thumb_func
	.type	FLASH_PrefetchBufferCmd, %function
FLASH_PrefetchBufferCmd:
.LFB33:
	cmp	r0, #0
	beq	.L5
	ldr	r3, .L7
	ldr	r1, [r3]
	mov	r2, #16
	orr	r2, r1
	str	r2, [r3]
	b	.L4
.L5:
	ldr	r3, .L7
	ldr	r2, [r3]
	mov	r1, #16
	bic	r2, r1
	str	r2, [r3]
.L4:
	@ sp needed
	bx	lr
.L8:
	.align	2
.L7:
	.word	1073881088
.LFE33:
	.size	FLASH_PrefetchBufferCmd, .-FLASH_PrefetchBufferCmd
	.section	.text.FLASH_GetPrefetchBufferStatus,"ax",%progbits
	.align	2
	.global	FLASH_GetPrefetchBufferStatus
	.code	16
	.thumb_func
	.type	FLASH_GetPrefetchBufferStatus, %function
FLASH_GetPrefetchBufferStatus:
.LFB34:
	ldr	r3, .L10
	ldr	r0, [r3]
	lsl	r0, r0, #26
	lsr	r0, r0, #31
	@ sp needed
	bx	lr
.L11:
	.align	2
.L10:
	.word	1073881088
.LFE34:
	.size	FLASH_GetPrefetchBufferStatus, .-FLASH_GetPrefetchBufferStatus
	.section	.text.FLASH_Unlock,"ax",%progbits
	.align	2
	.global	FLASH_Unlock
	.code	16
	.thumb_func
	.type	FLASH_Unlock, %function
FLASH_Unlock:
.LFB35:
	ldr	r3, .L14
	ldr	r3, [r3, #16]
	lsl	r2, r3, #24
	bpl	.L12
	ldr	r3, .L14
	ldr	r2, .L14+4
	str	r2, [r3, #4]
	ldr	r2, .L14+8
	str	r2, [r3, #4]
.L12:
	@ sp needed
	bx	lr
.L15:
	.align	2
.L14:
	.word	1073881088
	.word	1164378403
	.word	-839939669
.LFE35:
	.size	FLASH_Unlock, .-FLASH_Unlock
	.section	.text.FLASH_Lock,"ax",%progbits
	.align	2
	.global	FLASH_Lock
	.code	16
	.thumb_func
	.type	FLASH_Lock, %function
FLASH_Lock:
.LFB36:
	ldr	r3, .L17
	ldr	r1, [r3, #16]
	mov	r2, #128
	orr	r2, r1
	str	r2, [r3, #16]
	@ sp needed
	bx	lr
.L18:
	.align	2
.L17:
	.word	1073881088
.LFE36:
	.size	FLASH_Lock, .-FLASH_Lock
	.section	.text.FLASH_OB_Unlock,"ax",%progbits
	.align	2
	.global	FLASH_OB_Unlock
	.code	16
	.thumb_func
	.type	FLASH_OB_Unlock, %function
FLASH_OB_Unlock:
.LFB41:
	ldr	r3, .L21
	ldr	r3, [r3, #16]
	lsl	r2, r3, #22
	bmi	.L19
	ldr	r3, .L21
	ldr	r2, .L21+4
	str	r2, [r3, #8]
	ldr	r2, .L21+8
	str	r2, [r3, #8]
.L19:
	@ sp needed
	bx	lr
.L22:
	.align	2
.L21:
	.word	1073881088
	.word	1164378403
	.word	-839939669
.LFE41:
	.size	FLASH_OB_Unlock, .-FLASH_OB_Unlock
	.section	.text.FLASH_OB_Lock,"ax",%progbits
	.align	2
	.global	FLASH_OB_Lock
	.code	16
	.thumb_func
	.type	FLASH_OB_Lock, %function
FLASH_OB_Lock:
.LFB42:
	ldr	r3, .L24
	ldr	r1, [r3, #16]
	ldr	r2, .L24+4
	and	r2, r1
	str	r2, [r3, #16]
	@ sp needed
	bx	lr
.L25:
	.align	2
.L24:
	.word	1073881088
	.word	-513
.LFE42:
	.size	FLASH_OB_Lock, .-FLASH_OB_Lock
	.section	.text.FLASH_OB_Launch,"ax",%progbits
	.align	2
	.global	FLASH_OB_Launch
	.code	16
	.thumb_func
	.type	FLASH_OB_Launch, %function
FLASH_OB_Launch:
.LFB43:
	ldr	r3, .L27
	ldr	r1, [r3, #16]
	mov	r2, #128
	lsl	r2, r2, #6
	orr	r2, r1
	str	r2, [r3, #16]
	@ sp needed
	bx	lr
.L28:
	.align	2
.L27:
	.word	1073881088
.LFE43:
	.size	FLASH_OB_Launch, .-FLASH_OB_Launch
	.section	.text.FLASH_OB_GetUser,"ax",%progbits
	.align	2
	.global	FLASH_OB_GetUser
	.code	16
	.thumb_func
	.type	FLASH_OB_GetUser, %function
FLASH_OB_GetUser:
.LFB53:
	ldr	r3, .L30
	ldr	r0, [r3, #28]
	lsr	r0, r0, #8
	uxtb	r0, r0
	@ sp needed
	bx	lr
.L31:
	.align	2
.L30:
	.word	1073881088
.LFE53:
	.size	FLASH_OB_GetUser, .-FLASH_OB_GetUser
	.section	.text.FLASH_OB_GetWRP,"ax",%progbits
	.align	2
	.global	FLASH_OB_GetWRP
	.code	16
	.thumb_func
	.type	FLASH_OB_GetWRP, %function
FLASH_OB_GetWRP:
.LFB54:
	ldr	r3, .L33
	ldr	r0, [r3, #32]
	@ sp needed
	bx	lr
.L34:
	.align	2
.L33:
	.word	1073881088
.LFE54:
	.size	FLASH_OB_GetWRP, .-FLASH_OB_GetWRP
	.section	.text.FLASH_OB_GetRDP,"ax",%progbits
	.align	2
	.global	FLASH_OB_GetRDP
	.code	16
	.thumb_func
	.type	FLASH_OB_GetRDP, %function
FLASH_OB_GetRDP:
.LFB55:
	ldr	r3, .L36
	ldr	r0, [r3, #28]
	mov	r3, #6
	and	r0, r3
	sub	r3, r0, #1
	sbc	r0, r0, r3
	uxtb	r0, r0
	@ sp needed
	bx	lr
.L37:
	.align	2
.L36:
	.word	1073881088
.LFE55:
	.size	FLASH_OB_GetRDP, .-FLASH_OB_GetRDP
	.section	.text.FLASH_ITConfig,"ax",%progbits
	.align	2
	.global	FLASH_ITConfig
	.code	16
	.thumb_func
	.type	FLASH_ITConfig, %function
FLASH_ITConfig:
.LFB56:
	cmp	r1, #0
	beq	.L39
	ldr	r3, .L41
	ldr	r2, [r3, #16]
	orr	r0, r2
	str	r0, [r3, #16]
	b	.L38
.L39:
	ldr	r3, .L41
	ldr	r2, [r3, #16]
	bic	r2, r0
	str	r2, [r3, #16]
.L38:
	@ sp needed
	bx	lr
.L42:
	.align	2
.L41:
	.word	1073881088
.LFE56:
	.size	FLASH_ITConfig, .-FLASH_ITConfig
	.section	.text.FLASH_GetFlagStatus,"ax",%progbits
	.align	2
	.global	FLASH_GetFlagStatus
	.code	16
	.thumb_func
	.type	FLASH_GetFlagStatus, %function
FLASH_GetFlagStatus:
.LFB57:
	ldr	r3, .L44
	ldr	r3, [r3, #12]
	and	r0, r3
	sub	r3, r0, #1
	sbc	r0, r0, r3
	uxtb	r0, r0
	@ sp needed
	bx	lr
.L45:
	.align	2
.L44:
	.word	1073881088
.LFE57:
	.size	FLASH_GetFlagStatus, .-FLASH_GetFlagStatus
	.section	.text.FLASH_ClearFlag,"ax",%progbits
	.align	2
	.global	FLASH_ClearFlag
	.code	16
	.thumb_func
	.type	FLASH_ClearFlag, %function
FLASH_ClearFlag:
.LFB58:
	ldr	r3, .L47
	str	r0, [r3, #12]
	@ sp needed
	bx	lr
.L48:
	.align	2
.L47:
	.word	1073881088
.LFE58:
	.size	FLASH_ClearFlag, .-FLASH_ClearFlag
	.section	.text.FLASH_GetStatus,"ax",%progbits
	.align	2
	.global	FLASH_GetStatus
	.code	16
	.thumb_func
	.type	FLASH_GetStatus, %function
FLASH_GetStatus:
.LFB59:
	ldr	r3, .L54
	ldr	r3, [r3, #12]
	mov	r0, #1
	lsl	r2, r3, #31
	bmi	.L50
	ldr	r3, .L54
	ldr	r3, [r3, #12]
	mov	r0, #2
	lsl	r2, r3, #27
	bmi	.L50
	ldr	r3, .L54
	ldr	r3, [r3, #12]
	mov	r0, #4
	and	r0, r3
	neg	r3, r0
	adc	r0, r0, r3
	add	r0, r0, #3
.L50:
	@ sp needed
	bx	lr
.L55:
	.align	2
.L54:
	.word	1073881088
.LFE59:
	.size	FLASH_GetStatus, .-FLASH_GetStatus
	.section	.text.FLASH_WaitForLastOperation,"ax",%progbits
	.align	2
	.global	FLASH_WaitForLastOperation
	.code	16
	.thumb_func
	.type	FLASH_WaitForLastOperation, %function
FLASH_WaitForLastOperation:
.LFB60:
	push	{r4, lr}
.LCFI0:
	mov	r4, r0
	bl	FLASH_GetStatus
	cmp	r0, #1
	bne	.L57
	cmp	r4, #0
	beq	.L61
.L59:
	bl	FLASH_GetStatus
	sub	r4, r4, #1
	cmp	r0, #1
	bne	.L57
	cmp	r4, #0
	bne	.L59
	b	.L61
.L57:
	cmp	r4, #0
	bne	.L60
.L61:
	mov	r0, #5
.L60:
	@ sp needed
	pop	{r4, pc}
.LFE60:
	.size	FLASH_WaitForLastOperation, .-FLASH_WaitForLastOperation
	.section	.text.FLASH_ErasePage,"ax",%progbits
	.align	2
	.global	FLASH_ErasePage
	.code	16
	.thumb_func
	.type	FLASH_ErasePage, %function
FLASH_ErasePage:
.LFB37:
	push	{r4, r5, r6, lr}
.LCFI1:
	mov	r5, r0
	mov	r0, #176
	lsl	r0, r0, #12
	bl	FLASH_WaitForLastOperation
	cmp	r0, #4
	bne	.L63
	ldr	r4, .L64
	ldr	r3, [r4, #16]
	mov	r6, #2
	orr	r3, r6
	str	r3, [r4, #16]
	str	r5, [r4, #20]
	ldr	r2, [r4, #16]
	mov	r3, #64
	orr	r3, r2
	str	r3, [r4, #16]
	mov	r0, #176
	lsl	r0, r0, #12
	bl	FLASH_WaitForLastOperation
	ldr	r3, [r4, #16]
	bic	r3, r6
	str	r3, [r4, #16]
.L63:
	@ sp needed
	pop	{r4, r5, r6, pc}
.L65:
	.align	2
.L64:
	.word	1073881088
.LFE37:
	.size	FLASH_ErasePage, .-FLASH_ErasePage
	.section	.text.FLASH_EraseAllPages,"ax",%progbits
	.align	2
	.global	FLASH_EraseAllPages
	.code	16
	.thumb_func
	.type	FLASH_EraseAllPages, %function
FLASH_EraseAllPages:
.LFB38:
	push	{r3, r4, r5, lr}
.LCFI2:
	mov	r0, #176
	lsl	r0, r0, #12
	bl	FLASH_WaitForLastOperation
	cmp	r0, #4
	bne	.L67
	ldr	r4, .L68
	ldr	r3, [r4, #16]
	mov	r5, #4
	orr	r3, r5
	str	r3, [r4, #16]
	ldr	r2, [r4, #16]
	mov	r3, #64
	orr	r3, r2
	str	r3, [r4, #16]
	mov	r0, #176
	lsl	r0, r0, #12
	bl	FLASH_WaitForLastOperation
	ldr	r3, [r4, #16]
	bic	r3, r5
	str	r3, [r4, #16]
.L67:
	@ sp needed
	pop	{r3, r4, r5, pc}
.L69:
	.align	2
.L68:
	.word	1073881088
.LFE38:
	.size	FLASH_EraseAllPages, .-FLASH_EraseAllPages
	.section	.text.FLASH_ProgramWord,"ax",%progbits
	.align	2
	.global	FLASH_ProgramWord
	.code	16
	.thumb_func
	.type	FLASH_ProgramWord, %function
FLASH_ProgramWord:
.LFB39:
	push	{r4, r5, lr}
.LCFI3:
	sub	sp, sp, #12
.LCFI4:
	mov	r5, r0
	mov	r4, r1
	mov	r3, #0
	str	r3, [sp, #4]
	mov	r0, #176
	lsl	r0, r0, #12
	bl	FLASH_WaitForLastOperation
	cmp	r0, #4
	bne	.L71
	ldr	r3, .L73
	ldr	r1, [r3, #16]
	mov	r2, #1
	orr	r2, r1
	str	r2, [r3, #16]
	uxth	r3, r4
	strh	r3, [r5]
	mov	r0, #176
	lsl	r0, r0, #12
	bl	FLASH_WaitForLastOperation
	cmp	r0, #4
	bne	.L72
	add	r5, r5, #2
	str	r5, [sp, #4]
	ldr	r3, [sp, #4]
	lsr	r4, r4, #16
	strh	r4, [r3]
	mov	r0, #176
	lsl	r0, r0, #12
	bl	FLASH_WaitForLastOperation
	ldr	r3, .L73
	ldr	r2, [r3, #16]
	mov	r1, #1
	bic	r2, r1
	str	r2, [r3, #16]
	b	.L71
.L72:
	ldr	r3, .L73
	ldr	r2, [r3, #16]
	mov	r1, #1
	bic	r2, r1
	str	r2, [r3, #16]
.L71:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, pc}
.L74:
	.align	2
.L73:
	.word	1073881088
.LFE39:
	.size	FLASH_ProgramWord, .-FLASH_ProgramWord
	.section	.text.FLASH_ProgramHalfWord,"ax",%progbits
	.align	2
	.global	FLASH_ProgramHalfWord
	.code	16
	.thumb_func
	.type	FLASH_ProgramHalfWord, %function
FLASH_ProgramHalfWord:
.LFB40:
	push	{r3, r4, r5, r6, r7, lr}
.LCFI5:
	mov	r4, r0
	mov	r5, r1
	mov	r0, #176
	lsl	r0, r0, #12
	bl	FLASH_WaitForLastOperation
	cmp	r0, #4
	bne	.L76
	ldr	r6, .L77
	ldr	r3, [r6, #16]
	mov	r7, #1
	orr	r3, r7
	str	r3, [r6, #16]
	strh	r5, [r4]
	mov	r0, #176
	lsl	r0, r0, #12
	bl	FLASH_WaitForLastOperation
	ldr	r3, [r6, #16]
	bic	r3, r7
	str	r3, [r6, #16]
.L76:
	@ sp needed
	pop	{r3, r4, r5, r6, r7, pc}
.L78:
	.align	2
.L77:
	.word	1073881088
.LFE40:
	.size	FLASH_ProgramHalfWord, .-FLASH_ProgramHalfWord
	.section	.text.FLASH_OB_Erase,"ax",%progbits
	.align	2
	.global	FLASH_OB_Erase
	.code	16
	.thumb_func
	.type	FLASH_OB_Erase, %function
FLASH_OB_Erase:
.LFB44:
	push	{r4, lr}
.LCFI6:
	bl	FLASH_OB_GetRDP
	mov	r4, #0
	cmp	r0, #0
	bne	.L80
	mov	r4, #170
.L80:
	mov	r0, #176
	lsl	r0, r0, #12
	bl	FLASH_WaitForLastOperation
	cmp	r0, #4
	bne	.L81
	ldr	r3, .L84
	ldr	r1, [r3, #16]
	mov	r2, #32
	orr	r2, r1
	str	r2, [r3, #16]
	ldr	r1, [r3, #16]
	mov	r2, #64
	orr	r2, r1
	str	r2, [r3, #16]
	mov	r0, #176
	lsl	r0, r0, #12
	bl	FLASH_WaitForLastOperation
	cmp	r0, #4
	bne	.L82
	ldr	r3, .L84
	ldr	r2, [r3, #16]
	mov	r1, #32
	bic	r2, r1
	str	r2, [r3, #16]
	ldr	r1, [r3, #16]
	mov	r2, #16
	orr	r2, r1
	str	r2, [r3, #16]
	ldr	r3, .L84+4
	strh	r4, [r3]
	mov	r0, #176
	lsl	r0, r0, #12
	bl	FLASH_WaitForLastOperation
	cmp	r0, #5
	beq	.L81
	ldr	r3, .L84
	ldr	r2, [r3, #16]
	mov	r1, #16
	bic	r2, r1
	str	r2, [r3, #16]
	b	.L81
.L82:
	cmp	r0, #5
	beq	.L81
	ldr	r3, .L84
	ldr	r2, [r3, #16]
	mov	r1, #16
	bic	r2, r1
	str	r2, [r3, #16]
.L81:
	@ sp needed
	pop	{r4, pc}
.L85:
	.align	2
.L84:
	.word	1073881088
	.word	536868864
.LFE44:
	.size	FLASH_OB_Erase, .-FLASH_OB_Erase
	.section	.text.FLASH_OB_EnableWRP,"ax",%progbits
	.align	2
	.global	FLASH_OB_EnableWRP
	.code	16
	.thumb_func
	.type	FLASH_OB_EnableWRP, %function
FLASH_OB_EnableWRP:
.LFB45:
	push	{r3, r4, r5, lr}
.LCFI7:
	mov	r5, r0
	mov	r0, #176
	lsl	r0, r0, #12
	bl	FLASH_WaitForLastOperation
	sub	r4, r0, #0
	cmp	r4, #4
	bne	.L87
	mvn	r5, r5
	mov	r2, #255
	and	r2, r5
	ldr	r3, .L93
	ldr	r0, [r3, #16]
	mov	r1, #16
	orr	r1, r0
	str	r1, [r3, #16]
	cmp	r2, #255
	beq	.L88
	ldr	r3, .L93+4
	strh	r2, [r3, #8]
	mov	r0, #176
	lsl	r0, r0, #12
	bl	FLASH_WaitForLastOperation
	sub	r3, r0, #0
	cmp	r3, #4
	bne	.L89
.L88:
	lsl	r5, r5, #16
	lsr	r5, r5, #24
	cmp	r5, #255
	beq	.L91
	ldr	r3, .L93+4
	strh	r5, [r3, #10]
	mov	r0, #176
	lsl	r0, r0, #12
	bl	FLASH_WaitForLastOperation
	mov	r3, r0
.L89:
	cmp	r3, #5
	bne	.L90
	b	.L92
.L91:
	mov	r3, r4
.L90:
	ldr	r2, .L93
	ldr	r1, [r2, #16]
	mov	r0, #16
	bic	r1, r0
	str	r1, [r2, #16]
	mov	r0, r3
	b	.L87
.L92:
	mov	r0, r3
.L87:
	@ sp needed
	pop	{r3, r4, r5, pc}
.L94:
	.align	2
.L93:
	.word	1073881088
	.word	536868864
.LFE45:
	.size	FLASH_OB_EnableWRP, .-FLASH_OB_EnableWRP
	.section	.text.FLASH_OB_RDPConfig,"ax",%progbits
	.align	2
	.global	FLASH_OB_RDPConfig
	.code	16
	.thumb_func
	.type	FLASH_OB_RDPConfig, %function
FLASH_OB_RDPConfig:
.LFB46:
	push	{r4, lr}
.LCFI8:
	mov	r4, r0
	mov	r0, #176
	lsl	r0, r0, #12
	bl	FLASH_WaitForLastOperation
	cmp	r0, #4
	bne	.L96
	ldr	r3, .L98
	ldr	r1, [r3, #16]
	mov	r2, #32
	orr	r2, r1
	str	r2, [r3, #16]
	ldr	r1, [r3, #16]
	mov	r2, #64
	orr	r2, r1
	str	r2, [r3, #16]
	mov	r0, #176
	lsl	r0, r0, #12
	bl	FLASH_WaitForLastOperation
	cmp	r0, #4
	bne	.L97
	ldr	r3, .L98
	ldr	r2, [r3, #16]
	mov	r1, #32
	bic	r2, r1
	str	r2, [r3, #16]
	ldr	r1, [r3, #16]
	mov	r2, #16
	orr	r2, r1
	str	r2, [r3, #16]
	ldr	r3, .L98+4
	strh	r4, [r3]
	mov	r0, #176
	lsl	r0, r0, #12
	bl	FLASH_WaitForLastOperation
	cmp	r0, #5
	beq	.L96
	ldr	r3, .L98
	ldr	r2, [r3, #16]
	mov	r1, #16
	bic	r2, r1
	str	r2, [r3, #16]
	b	.L96
.L97:
	cmp	r0, #5
	beq	.L96
	ldr	r3, .L98
	ldr	r2, [r3, #16]
	mov	r1, #32
	bic	r2, r1
	str	r2, [r3, #16]
.L96:
	@ sp needed
	pop	{r4, pc}
.L99:
	.align	2
.L98:
	.word	1073881088
	.word	536868864
.LFE46:
	.size	FLASH_OB_RDPConfig, .-FLASH_OB_RDPConfig
	.section	.text.FLASH_OB_UserConfig,"ax",%progbits
	.align	2
	.global	FLASH_OB_UserConfig
	.code	16
	.thumb_func
	.type	FLASH_OB_UserConfig, %function
FLASH_OB_UserConfig:
.LFB47:
	push	{r4, r5, r6, lr}
.LCFI9:
	mov	r4, r0
	mov	r5, r1
	mov	r6, r2
	mov	r0, #176
	lsl	r0, r0, #12
	bl	FLASH_WaitForLastOperation
	cmp	r0, #4
	bne	.L101
	ldr	r3, .L102
	ldr	r1, [r3, #16]
	mov	r2, #16
	orr	r2, r1
	str	r2, [r3, #16]
	mov	r3, #8
	neg	r3, r3
	orr	r6, r3
	orr	r5, r6
	orr	r4, r5
	uxtb	r4, r4
	ldr	r3, .L102+4
	strh	r4, [r3, #2]
	mov	r0, #176
	lsl	r0, r0, #12
	bl	FLASH_WaitForLastOperation
	cmp	r0, #5
	beq	.L101
	ldr	r3, .L102
	ldr	r2, [r3, #16]
	mov	r1, #16
	bic	r2, r1
	str	r2, [r3, #16]
.L101:
	@ sp needed
	pop	{r4, r5, r6, pc}
.L103:
	.align	2
.L102:
	.word	1073881088
	.word	536868864
.LFE47:
	.size	FLASH_OB_UserConfig, .-FLASH_OB_UserConfig
	.section	.text.FLASH_OB_BOOTConfig,"ax",%progbits
	.align	2
	.global	FLASH_OB_BOOTConfig
	.code	16
	.thumb_func
	.type	FLASH_OB_BOOTConfig, %function
FLASH_OB_BOOTConfig:
.LFB48:
	push	{r4, lr}
.LCFI10:
	mov	r4, r0
	mov	r0, #176
	lsl	r0, r0, #12
	bl	FLASH_WaitForLastOperation
	cmp	r0, #4
	bne	.L105
	ldr	r3, .L106
	ldr	r1, [r3, #16]
	mov	r2, #16
	orr	r2, r1
	str	r2, [r3, #16]
	mov	r3, #239
	orr	r4, r3
	ldr	r3, .L106+4
	strh	r4, [r3, #2]
	mov	r0, #176
	lsl	r0, r0, #12
	bl	FLASH_WaitForLastOperation
	cmp	r0, #5
	beq	.L105
	ldr	r3, .L106
	ldr	r2, [r3, #16]
	mov	r1, #16
	bic	r2, r1
	str	r2, [r3, #16]
.L105:
	@ sp needed
	pop	{r4, pc}
.L107:
	.align	2
.L106:
	.word	1073881088
	.word	536868864
.LFE48:
	.size	FLASH_OB_BOOTConfig, .-FLASH_OB_BOOTConfig
	.section	.text.FLASH_OB_VDDAConfig,"ax",%progbits
	.align	2
	.global	FLASH_OB_VDDAConfig
	.code	16
	.thumb_func
	.type	FLASH_OB_VDDAConfig, %function
FLASH_OB_VDDAConfig:
.LFB49:
	push	{r4, lr}
.LCFI11:
	mov	r4, r0
	mov	r0, #176
	lsl	r0, r0, #12
	bl	FLASH_WaitForLastOperation
	cmp	r0, #4
	bne	.L109
	ldr	r3, .L110
	ldr	r1, [r3, #16]
	mov	r2, #16
	orr	r2, r1
	str	r2, [r3, #16]
	mov	r3, #223
	orr	r4, r3
	ldr	r3, .L110+4
	strh	r4, [r3, #2]
	mov	r0, #176
	lsl	r0, r0, #12
	bl	FLASH_WaitForLastOperation
	cmp	r0, #5
	beq	.L109
	ldr	r3, .L110
	ldr	r2, [r3, #16]
	mov	r1, #16
	bic	r2, r1
	str	r2, [r3, #16]
.L109:
	@ sp needed
	pop	{r4, pc}
.L111:
	.align	2
.L110:
	.word	1073881088
	.word	536868864
.LFE49:
	.size	FLASH_OB_VDDAConfig, .-FLASH_OB_VDDAConfig
	.section	.text.FLASH_OB_SRAMParityConfig,"ax",%progbits
	.align	2
	.global	FLASH_OB_SRAMParityConfig
	.code	16
	.thumb_func
	.type	FLASH_OB_SRAMParityConfig, %function
FLASH_OB_SRAMParityConfig:
.LFB50:
	push	{r4, lr}
.LCFI12:
	mov	r4, r0
	mov	r0, #176
	lsl	r0, r0, #12
	bl	FLASH_WaitForLastOperation
	cmp	r0, #4
	bne	.L113
	ldr	r3, .L114
	ldr	r1, [r3, #16]
	mov	r2, #16
	orr	r2, r1
	str	r2, [r3, #16]
	mov	r3, #191
	orr	r4, r3
	ldr	r3, .L114+4
	strh	r4, [r3, #2]
	mov	r0, #176
	lsl	r0, r0, #12
	bl	FLASH_WaitForLastOperation
	cmp	r0, #5
	beq	.L113
	ldr	r3, .L114
	ldr	r2, [r3, #16]
	mov	r1, #16
	bic	r2, r1
	str	r2, [r3, #16]
.L113:
	@ sp needed
	pop	{r4, pc}
.L115:
	.align	2
.L114:
	.word	1073881088
	.word	536868864
.LFE50:
	.size	FLASH_OB_SRAMParityConfig, .-FLASH_OB_SRAMParityConfig
	.section	.text.FLASH_OB_WriteUser,"ax",%progbits
	.align	2
	.global	FLASH_OB_WriteUser
	.code	16
	.thumb_func
	.type	FLASH_OB_WriteUser, %function
FLASH_OB_WriteUser:
.LFB51:
	push	{r4, lr}
.LCFI13:
	mov	r4, r0
	mov	r0, #176
	lsl	r0, r0, #12
	bl	FLASH_WaitForLastOperation
	cmp	r0, #4
	bne	.L117
	ldr	r3, .L118
	ldr	r1, [r3, #16]
	mov	r2, #16
	orr	r2, r1
	str	r2, [r3, #16]
	mov	r3, #136
	orr	r4, r3
	ldr	r3, .L118+4
	strh	r4, [r3, #2]
	mov	r0, #176
	lsl	r0, r0, #12
	bl	FLASH_WaitForLastOperation
	cmp	r0, #5
	beq	.L117
	ldr	r3, .L118
	ldr	r2, [r3, #16]
	mov	r1, #16
	bic	r2, r1
	str	r2, [r3, #16]
.L117:
	@ sp needed
	pop	{r4, pc}
.L119:
	.align	2
.L118:
	.word	1073881088
	.word	536868864
.LFE51:
	.size	FLASH_OB_WriteUser, .-FLASH_OB_WriteUser
	.section	.text.FLASH_ProgramOptionByteData,"ax",%progbits
	.align	2
	.global	FLASH_ProgramOptionByteData
	.code	16
	.thumb_func
	.type	FLASH_ProgramOptionByteData, %function
FLASH_ProgramOptionByteData:
.LFB52:
	push	{r3, r4, r5, lr}
.LCFI14:
	mov	r4, r0
	mov	r5, r1
	mov	r0, #176
	lsl	r0, r0, #12
	bl	FLASH_WaitForLastOperation
	cmp	r0, #4
	bne	.L121
	ldr	r3, .L122
	ldr	r1, [r3, #16]
	mov	r2, #16
	orr	r2, r1
	str	r2, [r3, #16]
	strh	r5, [r4]
	mov	r0, #176
	lsl	r0, r0, #12
	bl	FLASH_WaitForLastOperation
	cmp	r0, #5
	beq	.L121
	ldr	r3, .L122
	ldr	r2, [r3, #16]
	mov	r1, #16
	bic	r2, r1
	str	r2, [r3, #16]
.L121:
	@ sp needed
	pop	{r3, r4, r5, pc}
.L123:
	.align	2
.L122:
	.word	1073881088
.LFE52:
	.size	FLASH_ProgramOptionByteData, .-FLASH_ProgramOptionByteData
	.section	.debug_frame,"",%progbits
.Lframe0:
	.4byte	.LECIE0-.LSCIE0
.LSCIE0:
	.4byte	0xffffffff
	.byte	0x3
	.ascii	"\000"
	.uleb128 0x1
	.sleb128 -4
	.uleb128 0xe
	.byte	0xc
	.uleb128 0xd
	.uleb128 0
	.align	2
.LECIE0:
.LSFDE0:
	.4byte	.LEFDE0-.LASFDE0
.LASFDE0:
	.4byte	.Lframe0
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.align	2
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.align	2
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.align	2
.LEFDE4:
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.align	2
.LEFDE6:
.LSFDE8:
	.4byte	.LEFDE8-.LASFDE8
.LASFDE8:
	.4byte	.Lframe0
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.align	2
.LEFDE8:
.LSFDE10:
	.4byte	.LEFDE10-.LASFDE10
.LASFDE10:
	.4byte	.Lframe0
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.align	2
.LEFDE10:
.LSFDE12:
	.4byte	.LEFDE12-.LASFDE12
.LASFDE12:
	.4byte	.Lframe0
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.align	2
.LEFDE12:
.LSFDE14:
	.4byte	.LEFDE14-.LASFDE14
.LASFDE14:
	.4byte	.Lframe0
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.align	2
.LEFDE14:
.LSFDE16:
	.4byte	.LEFDE16-.LASFDE16
.LASFDE16:
	.4byte	.Lframe0
	.4byte	.LFB53
	.4byte	.LFE53-.LFB53
	.align	2
.LEFDE16:
.LSFDE18:
	.4byte	.LEFDE18-.LASFDE18
.LASFDE18:
	.4byte	.Lframe0
	.4byte	.LFB54
	.4byte	.LFE54-.LFB54
	.align	2
.LEFDE18:
.LSFDE20:
	.4byte	.LEFDE20-.LASFDE20
.LASFDE20:
	.4byte	.Lframe0
	.4byte	.LFB55
	.4byte	.LFE55-.LFB55
	.align	2
.LEFDE20:
.LSFDE22:
	.4byte	.LEFDE22-.LASFDE22
.LASFDE22:
	.4byte	.Lframe0
	.4byte	.LFB56
	.4byte	.LFE56-.LFB56
	.align	2
.LEFDE22:
.LSFDE24:
	.4byte	.LEFDE24-.LASFDE24
.LASFDE24:
	.4byte	.Lframe0
	.4byte	.LFB57
	.4byte	.LFE57-.LFB57
	.align	2
.LEFDE24:
.LSFDE26:
	.4byte	.LEFDE26-.LASFDE26
.LASFDE26:
	.4byte	.Lframe0
	.4byte	.LFB58
	.4byte	.LFE58-.LFB58
	.align	2
.LEFDE26:
.LSFDE28:
	.4byte	.LEFDE28-.LASFDE28
.LASFDE28:
	.4byte	.Lframe0
	.4byte	.LFB59
	.4byte	.LFE59-.LFB59
	.align	2
.LEFDE28:
.LSFDE30:
	.4byte	.LEFDE30-.LASFDE30
.LASFDE30:
	.4byte	.Lframe0
	.4byte	.LFB60
	.4byte	.LFE60-.LFB60
	.byte	0x4
	.4byte	.LCFI0-.LFB60
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE30:
.LSFDE32:
	.4byte	.LEFDE32-.LASFDE32
.LASFDE32:
	.4byte	.Lframe0
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.byte	0x4
	.4byte	.LCFI1-.LFB37
	.byte	0xe
	.uleb128 0x10
	.byte	0x84
	.uleb128 0x4
	.byte	0x85
	.uleb128 0x3
	.byte	0x86
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE32:
.LSFDE34:
	.4byte	.LEFDE34-.LASFDE34
.LASFDE34:
	.4byte	.Lframe0
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.byte	0x4
	.4byte	.LCFI2-.LFB38
	.byte	0xe
	.uleb128 0x10
	.byte	0x83
	.uleb128 0x4
	.byte	0x84
	.uleb128 0x3
	.byte	0x85
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE34:
.LSFDE36:
	.4byte	.LEFDE36-.LASFDE36
.LASFDE36:
	.4byte	.Lframe0
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.byte	0x4
	.4byte	.LCFI3-.LFB39
	.byte	0xe
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x85
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI4-.LCFI3
	.byte	0xe
	.uleb128 0x18
	.align	2
.LEFDE36:
.LSFDE38:
	.4byte	.LEFDE38-.LASFDE38
.LASFDE38:
	.4byte	.Lframe0
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.byte	0x4
	.4byte	.LCFI5-.LFB40
	.byte	0xe
	.uleb128 0x18
	.byte	0x83
	.uleb128 0x6
	.byte	0x84
	.uleb128 0x5
	.byte	0x85
	.uleb128 0x4
	.byte	0x86
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE38:
.LSFDE40:
	.4byte	.LEFDE40-.LASFDE40
.LASFDE40:
	.4byte	.Lframe0
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.byte	0x4
	.4byte	.LCFI6-.LFB44
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE40:
.LSFDE42:
	.4byte	.LEFDE42-.LASFDE42
.LASFDE42:
	.4byte	.Lframe0
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.byte	0x4
	.4byte	.LCFI7-.LFB45
	.byte	0xe
	.uleb128 0x10
	.byte	0x83
	.uleb128 0x4
	.byte	0x84
	.uleb128 0x3
	.byte	0x85
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE42:
.LSFDE44:
	.4byte	.LEFDE44-.LASFDE44
.LASFDE44:
	.4byte	.Lframe0
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.byte	0x4
	.4byte	.LCFI8-.LFB46
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE44:
.LSFDE46:
	.4byte	.LEFDE46-.LASFDE46
.LASFDE46:
	.4byte	.Lframe0
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.byte	0x4
	.4byte	.LCFI9-.LFB47
	.byte	0xe
	.uleb128 0x10
	.byte	0x84
	.uleb128 0x4
	.byte	0x85
	.uleb128 0x3
	.byte	0x86
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE46:
.LSFDE48:
	.4byte	.LEFDE48-.LASFDE48
.LASFDE48:
	.4byte	.Lframe0
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.byte	0x4
	.4byte	.LCFI10-.LFB48
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE48:
.LSFDE50:
	.4byte	.LEFDE50-.LASFDE50
.LASFDE50:
	.4byte	.Lframe0
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.byte	0x4
	.4byte	.LCFI11-.LFB49
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE50:
.LSFDE52:
	.4byte	.LEFDE52-.LASFDE52
.LASFDE52:
	.4byte	.Lframe0
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.byte	0x4
	.4byte	.LCFI12-.LFB50
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE52:
.LSFDE54:
	.4byte	.LEFDE54-.LASFDE54
.LASFDE54:
	.4byte	.Lframe0
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.byte	0x4
	.4byte	.LCFI13-.LFB51
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE54:
.LSFDE56:
	.4byte	.LEFDE56-.LASFDE56
.LASFDE56:
	.4byte	.Lframe0
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
	.byte	0x4
	.4byte	.LCFI14-.LFB52
	.byte	0xe
	.uleb128 0x10
	.byte	0x83
	.uleb128 0x4
	.byte	0x84
	.uleb128 0x3
	.byte	0x85
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE56:
	.text
.Letext0:
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../../../chip/stm32/stm32f030/lib/src/stm32f0xx_flash.c"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x21f
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF29
	.byte	0x1
	.4byte	.LASF30
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.uleb128 0x2
	.4byte	.LASF0
	.byte	0x1
	.byte	0x87
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF1
	.byte	0x1
	.byte	0x9f
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF2
	.byte	0x1
	.byte	0xb3
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF3
	.byte	0x1
	.byte	0xe8
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF4
	.byte	0x1
	.byte	0xf7
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF5
	.byte	0x1
	.2byte	0x1e6
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF6
	.byte	0x1
	.2byte	0x1f5
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF7
	.byte	0x1
	.2byte	0x200
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF8
	.byte	0x1
	.2byte	0x3c2
	.4byte	.LFB53
	.4byte	.LFE53-.LFB53
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF9
	.byte	0x1
	.2byte	0x3cd
	.4byte	.LFB54
	.4byte	.LFE54-.LFB54
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF10
	.byte	0x1
	.2byte	0x3d8
	.4byte	.LFB55
	.4byte	.LFE55-.LFB55
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF11
	.byte	0x1
	.2byte	0x400
	.4byte	.LFB56
	.4byte	.LFE56-.LFB56
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF12
	.byte	0x1
	.2byte	0x41c
	.4byte	.LFB57
	.4byte	.LFE57-.LFB57
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF13
	.byte	0x1
	.2byte	0x438
	.4byte	.LFB58
	.4byte	.LFE58-.LFB58
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF14
	.byte	0x1
	.2byte	0x447
	.4byte	.LFB59
	.4byte	.LFE59-.LFB59
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF15
	.byte	0x1
	.2byte	0x46c
	.4byte	.LFB60
	.4byte	.LFE60-.LFB60
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF16
	.byte	0x1
	.2byte	0x109
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF17
	.byte	0x1
	.2byte	0x12f
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF18
	.byte	0x1
	.2byte	0x152
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF19
	.byte	0x1
	.2byte	0x18c
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF20
	.byte	0x1
	.2byte	0x211
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF21
	.byte	0x1
	.2byte	0x257
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF22
	.byte	0x1
	.2byte	0x292
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF23
	.byte	0x1
	.2byte	0x2d7
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF24
	.byte	0x1
	.2byte	0x2ff
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF25
	.byte	0x1
	.2byte	0x325
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF26
	.byte	0x1
	.2byte	0x34b
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF27
	.byte	0x1
	.2byte	0x37b
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF28
	.byte	0x1
	.2byte	0x3a3
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
	.uleb128 0x1
	.byte	0x9c
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0xfc
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.4byte	.LFB53
	.4byte	.LFE53-.LFB53
	.4byte	.LFB54
	.4byte	.LFE54-.LFB54
	.4byte	.LFB55
	.4byte	.LFE55-.LFB55
	.4byte	.LFB56
	.4byte	.LFE56-.LFB56
	.4byte	.LFB57
	.4byte	.LFE57-.LFB57
	.4byte	.LFB58
	.4byte	.LFE58-.LFB58
	.4byte	.LFB59
	.4byte	.LFE59-.LFB59
	.4byte	.LFB60
	.4byte	.LFE60-.LFB60
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LFB32
	.4byte	.LFE32
	.4byte	.LFB33
	.4byte	.LFE33
	.4byte	.LFB34
	.4byte	.LFE34
	.4byte	.LFB35
	.4byte	.LFE35
	.4byte	.LFB36
	.4byte	.LFE36
	.4byte	.LFB41
	.4byte	.LFE41
	.4byte	.LFB42
	.4byte	.LFE42
	.4byte	.LFB43
	.4byte	.LFE43
	.4byte	.LFB53
	.4byte	.LFE53
	.4byte	.LFB54
	.4byte	.LFE54
	.4byte	.LFB55
	.4byte	.LFE55
	.4byte	.LFB56
	.4byte	.LFE56
	.4byte	.LFB57
	.4byte	.LFE57
	.4byte	.LFB58
	.4byte	.LFE58
	.4byte	.LFB59
	.4byte	.LFE59
	.4byte	.LFB60
	.4byte	.LFE60
	.4byte	.LFB37
	.4byte	.LFE37
	.4byte	.LFB38
	.4byte	.LFE38
	.4byte	.LFB39
	.4byte	.LFE39
	.4byte	.LFB40
	.4byte	.LFE40
	.4byte	.LFB44
	.4byte	.LFE44
	.4byte	.LFB45
	.4byte	.LFE45
	.4byte	.LFB46
	.4byte	.LFE46
	.4byte	.LFB47
	.4byte	.LFE47
	.4byte	.LFB48
	.4byte	.LFE48
	.4byte	.LFB49
	.4byte	.LFE49
	.4byte	.LFB50
	.4byte	.LFE50
	.4byte	.LFB51
	.4byte	.LFE51
	.4byte	.LFB52
	.4byte	.LFE52
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF15:
	.ascii	"FLASH_WaitForLastOperation\000"
.LASF16:
	.ascii	"FLASH_ErasePage\000"
.LASF19:
	.ascii	"FLASH_ProgramHalfWord\000"
.LASF10:
	.ascii	"FLASH_OB_GetRDP\000"
.LASF11:
	.ascii	"FLASH_ITConfig\000"
.LASF7:
	.ascii	"FLASH_OB_Launch\000"
.LASF12:
	.ascii	"FLASH_GetFlagStatus\000"
.LASF13:
	.ascii	"FLASH_ClearFlag\000"
.LASF1:
	.ascii	"FLASH_PrefetchBufferCmd\000"
.LASF6:
	.ascii	"FLASH_OB_Lock\000"
.LASF4:
	.ascii	"FLASH_Lock\000"
.LASF21:
	.ascii	"FLASH_OB_EnableWRP\000"
.LASF3:
	.ascii	"FLASH_Unlock\000"
.LASF0:
	.ascii	"FLASH_SetLatency\000"
.LASF30:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4/crossworks/../"
	.ascii	"../../chip/stm32/stm32f030/lib/src/stm32f0xx_flash."
	.ascii	"c\000"
.LASF18:
	.ascii	"FLASH_ProgramWord\000"
.LASF9:
	.ascii	"FLASH_OB_GetWRP\000"
.LASF20:
	.ascii	"FLASH_OB_Erase\000"
.LASF29:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g1 -std=gnu99 -O1 -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF17:
	.ascii	"FLASH_EraseAllPages\000"
.LASF5:
	.ascii	"FLASH_OB_Unlock\000"
.LASF2:
	.ascii	"FLASH_GetPrefetchBufferStatus\000"
.LASF22:
	.ascii	"FLASH_OB_RDPConfig\000"
.LASF14:
	.ascii	"FLASH_GetStatus\000"
.LASF27:
	.ascii	"FLASH_OB_WriteUser\000"
.LASF24:
	.ascii	"FLASH_OB_BOOTConfig\000"
.LASF8:
	.ascii	"FLASH_OB_GetUser\000"
.LASF25:
	.ascii	"FLASH_OB_VDDAConfig\000"
.LASF28:
	.ascii	"FLASH_ProgramOptionByteData\000"
.LASF23:
	.ascii	"FLASH_OB_UserConfig\000"
.LASF26:
	.ascii	"FLASH_OB_SRAMParityConfig\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
