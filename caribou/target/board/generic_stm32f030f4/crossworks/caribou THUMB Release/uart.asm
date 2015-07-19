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
	.file	"uart.c"
	.text
.Ltext0:
	.section	.text.chip_uart_int_enabled,"ax",%progbits
	.align	2
	.global	chip_uart_int_enabled
	.code	16
	.thumb_func
	.type	chip_uart_int_enabled, %function
chip_uart_int_enabled:
.LFB34:
	ldr	r3, [r0]
	ldr	r0, [r3]
	ldr	r3, .L2
	and	r0, r3
	sub	r3, r0, #1
	sbc	r0, r0, r3
	@ sp needed
	bx	lr
.L3:
	.align	2
.L2:
	.word	327941
.LFE34:
	.size	chip_uart_int_enabled, .-chip_uart_int_enabled
	.section	.text.chip_uart_int_enable,"ax",%progbits
	.align	2
	.global	chip_uart_int_enable
	.code	16
	.thumb_func
	.type	chip_uart_int_enable, %function
chip_uart_int_enable:
.LFB32:
	push	{r3, r4, r5, lr}
.LCFI0:
	mov	r4, r0
	bl	chip_uart_int_enabled
	mov	r5, r0
	ldr	r0, [r4]
	ldr	r1, .L5
	mov	r2, #1
	bl	USART_ITConfig
	mov	r0, r5
	@ sp needed
	pop	{r3, r4, r5, pc}
.L6:
	.align	2
.L5:
	.word	327941
.LFE32:
	.size	chip_uart_int_enable, .-chip_uart_int_enable
	.section	.text.chip_uart_int_disable,"ax",%progbits
	.align	2
	.global	chip_uart_int_disable
	.code	16
	.thumb_func
	.type	chip_uart_int_disable, %function
chip_uart_int_disable:
.LFB33:
	push	{r3, r4, r5, lr}
.LCFI1:
	mov	r4, r0
	bl	chip_uart_int_enabled
	mov	r5, r0
	ldr	r0, [r4]
	ldr	r1, .L8
	mov	r2, #0
	bl	USART_ITConfig
	mov	r0, r5
	@ sp needed
	pop	{r3, r4, r5, pc}
.L9:
	.align	2
.L8:
	.word	327941
.LFE33:
	.size	chip_uart_int_disable, .-chip_uart_int_disable
	.section	.text.chip_uart_int_set,"ax",%progbits
	.align	2
	.global	chip_uart_int_set
	.code	16
	.thumb_func
	.type	chip_uart_int_set, %function
chip_uart_int_set:
.LFB35:
	push	{r4, r5, r6, lr}
.LCFI2:
	mov	r4, r0
	mov	r6, r1
	bl	chip_uart_int_enabled
	mov	r5, r0
	cmp	r6, #0
	beq	.L11
.LBB2:
	mov	r0, r4
	bl	uart_enable_interrupts
.LBE2:
	b	.L12
.L11:
.LBB3:
	mov	r0, r4
	bl	uart_disable_interrupts
.L12:
.LBE3:
	mov	r0, r5
	@ sp needed
	pop	{r4, r5, r6, pc}
.LFE35:
	.size	chip_uart_int_set, .-chip_uart_int_set
	.section	.text.chip_uart_set_config,"ax",%progbits
	.align	2
	.global	chip_uart_set_config
	.code	16
	.thumb_func
	.type	chip_uart_set_config, %function
chip_uart_set_config:
.LFB38:
	push	{r4, r5, lr}
.LCFI3:
	sub	sp, sp, #28
.LCFI4:
	mov	r4, r0
	sub	r5, r1, #0
	bne	.L14
	mov	r5, r0
	add	r5, r5, #8
	ldr	r0, [r0]
	mov	r1, #0
	bl	USART_Cmd
	cmp	r5, #0
	beq	.L33
.L32:
.LBB4:
	ldr	r3, [r5]
	str	r3, [sp]
	ldrb	r3, [r5, #4]
	cmp	r3, #9
	beq	.L17
	mov	r3, #0
	str	r3, [sp, #4]
	b	.L18
.L17:
	mov	r3, #128
	lsl	r3, r3, #5
	str	r3, [sp, #4]
.L18:
	ldrb	r3, [r5, #5]
	cmp	r3, #2
	beq	.L20
	cmp	r3, #3
	beq	.L21
	mov	r3, #0
	str	r3, [sp, #8]
	b	.L22
.L20:
	mov	r3, #192
	lsl	r3, r3, #6
	str	r3, [sp, #8]
	b	.L22
.L21:
	mov	r3, #128
	lsl	r3, r3, #6
	str	r3, [sp, #8]
.L22:
	ldrb	r3, [r5, #6]
	cmp	r3, #1
	beq	.L24
	cmp	r3, #2
	beq	.L25
	mov	r3, #0
	str	r3, [sp, #12]
	b	.L26
.L25:
	mov	r3, #192
	lsl	r3, r3, #3
	str	r3, [sp, #12]
	b	.L26
.L24:
	mov	r3, #128
	lsl	r3, r3, #3
	str	r3, [sp, #12]
.L26:
	ldrb	r3, [r5, #7]
	cmp	r3, #2
	beq	.L28
	cmp	r3, #3
	beq	.L29
	cmp	r3, #1
	beq	.L30
	mov	r3, #0
	str	r3, [sp, #20]
	b	.L31
.L30:
	mov	r3, #128
	lsl	r3, r3, #1
	str	r3, [sp, #20]
	b	.L31
.L28:
	mov	r3, #128
	lsl	r3, r3, #2
	str	r3, [sp, #20]
	b	.L31
.L29:
	mov	r3, #192
	lsl	r3, r3, #2
	str	r3, [sp, #20]
.L31:
	mov	r3, #12
	str	r3, [sp, #16]
	ldr	r0, [r4]
	mov	r1, sp
	bl	USART_Init
	ldr	r0, [r4]
	mov	r1, #1
	bl	USART_Cmd
	ldrb	r0, [r4, #4]
	ldr	r1, .L35
	mov	r2, r4
	bl	caribou_vector_install
	ldrb	r0, [r4, #4]
	bl	chip_vector_enable
	ldr	r0, [r4]
	ldr	r1, .L35+4
	mov	r2, #1
	bl	USART_ITConfig
	mov	r0, #0
	b	.L34
.L33:
.LBE4:
	mov	r0, #1
	neg	r0, r0
	b	.L34
.L14:
	ldr	r0, [r0]
	mov	r1, #0
	bl	USART_Cmd
	b	.L32
.L34:
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, pc}
.L36:
	.align	2
.L35:
	.word	isr_uart
	.word	327941
.LFE38:
	.size	chip_uart_set_config, .-chip_uart_set_config
	.section	.text.chip_uart_open,"ax",%progbits
	.align	2
	.global	chip_uart_open
	.code	16
	.thumb_func
	.type	chip_uart_open, %function
chip_uart_open:
.LFB39:
	@ sp needed
	bx	lr
.LFE39:
	.size	chip_uart_open, .-chip_uart_open
	.section	.text.chip_uart_close,"ax",%progbits
	.align	2
	.global	chip_uart_close
	.code	16
	.thumb_func
	.type	chip_uart_close, %function
chip_uart_close:
.LFB40:
	@ sp needed
	bx	lr
.LFE40:
	.size	chip_uart_close, .-chip_uart_close
	.section	.text.chip_uart_set_rx_queue,"ax",%progbits
	.align	2
	.global	chip_uart_set_rx_queue
	.code	16
	.thumb_func
	.type	chip_uart_set_rx_queue, %function
chip_uart_set_rx_queue:
.LFB41:
	str	r1, [r0, #24]
	mov	r0, r1
	@ sp needed
	bx	lr
.LFE41:
	.size	chip_uart_set_rx_queue, .-chip_uart_set_rx_queue
	.section	.text.chip_uart_set_tx_queue,"ax",%progbits
	.align	2
	.global	chip_uart_set_tx_queue
	.code	16
	.thumb_func
	.type	chip_uart_set_tx_queue, %function
chip_uart_set_tx_queue:
.LFB42:
	str	r1, [r0, #28]
	mov	r0, r1
	@ sp needed
	bx	lr
.LFE42:
	.size	chip_uart_set_tx_queue, .-chip_uart_set_tx_queue
	.section	.text.chip_uart_rx_queue,"ax",%progbits
	.align	2
	.global	chip_uart_rx_queue
	.code	16
	.thumb_func
	.type	chip_uart_rx_queue, %function
chip_uart_rx_queue:
.LFB43:
	ldr	r0, [r0, #24]
	@ sp needed
	bx	lr
.LFE43:
	.size	chip_uart_rx_queue, .-chip_uart_rx_queue
	.section	.text.chip_uart_tx_queue,"ax",%progbits
	.align	2
	.global	chip_uart_tx_queue
	.code	16
	.thumb_func
	.type	chip_uart_tx_queue, %function
chip_uart_tx_queue:
.LFB44:
	ldr	r0, [r0, #28]
	@ sp needed
	bx	lr
.LFE44:
	.size	chip_uart_tx_queue, .-chip_uart_tx_queue
	.section	.text.chip_uart_interrupt_vector,"ax",%progbits
	.align	2
	.global	chip_uart_interrupt_vector
	.code	16
	.thumb_func
	.type	chip_uart_interrupt_vector, %function
chip_uart_interrupt_vector:
.LFB45:
	ldrb	r0, [r0, #4]
	@ sp needed
	bx	lr
.LFE45:
	.size	chip_uart_interrupt_vector, .-chip_uart_interrupt_vector
	.section	.text.chip_uart_status,"ax",%progbits
	.align	2
	.global	chip_uart_status
	.code	16
	.thumb_func
	.type	chip_uart_status, %function
chip_uart_status:
.LFB46:
	ldr	r0, [r0, #20]
	@ sp needed
	bx	lr
.LFE46:
	.size	chip_uart_status, .-chip_uart_status
	.section	.text.chip_uart_set_status,"ax",%progbits
	.align	2
	.global	chip_uart_set_status
	.code	16
	.thumb_func
	.type	chip_uart_set_status, %function
chip_uart_set_status:
.LFB47:
	str	r1, [r0, #20]
	mov	r0, r1
	@ sp needed
	bx	lr
.LFE47:
	.size	chip_uart_set_status, .-chip_uart_set_status
	.section	.text.chip_uart_tx_busy,"ax",%progbits
	.align	2
	.global	chip_uart_tx_busy
	.code	16
	.thumb_func
	.type	chip_uart_tx_busy, %function
chip_uart_tx_busy:
.LFB48:
	ldr	r3, [r0]
	ldr	r0, [r3, #28]
	lsr	r0, r0, #6
	mov	r3, #1
	eor	r0, r3
	and	r0, r3
	@ sp needed
	bx	lr
.LFE48:
	.size	chip_uart_tx_busy, .-chip_uart_tx_busy
	.section	.text.chip_uart_tx_ready,"ax",%progbits
	.align	2
	.global	chip_uart_tx_ready
	.code	16
	.thumb_func
	.type	chip_uart_tx_ready, %function
chip_uart_tx_ready:
.LFB49:
	ldr	r3, [r0]
	ldr	r0, [r3, #28]
	lsl	r0, r0, #24
	lsr	r0, r0, #31
	@ sp needed
	bx	lr
.LFE49:
	.size	chip_uart_tx_ready, .-chip_uart_tx_ready
	.section	.text.chip_uart_rx_ready,"ax",%progbits
	.align	2
	.global	chip_uart_rx_ready
	.code	16
	.thumb_func
	.type	chip_uart_rx_ready, %function
chip_uart_rx_ready:
.LFB50:
	ldr	r3, [r0]
	ldr	r0, [r3, #28]
	lsl	r0, r0, #26
	lsr	r0, r0, #31
	@ sp needed
	bx	lr
.LFE50:
	.size	chip_uart_rx_ready, .-chip_uart_rx_ready
	.section	.text.chip_uart_tx_data,"ax",%progbits
	.align	2
	.global	chip_uart_tx_data
	.code	16
	.thumb_func
	.type	chip_uart_tx_data, %function
chip_uart_tx_data:
.LFB51:
	ldr	r3, [r0]
	uxth	r2, r1
	strh	r2, [r3, #40]
	mov	r0, r1
	@ sp needed
	bx	lr
.LFE51:
	.size	chip_uart_tx_data, .-chip_uart_tx_data
	.section	.text.chip_uart_rx_data,"ax",%progbits
	.align	2
	.global	chip_uart_rx_data
	.code	16
	.thumb_func
	.type	chip_uart_rx_data, %function
chip_uart_rx_data:
.LFB52:
	ldr	r3, [r0]
	ldrh	r0, [r3, #36]
	uxth	r0, r0
	@ sp needed
	bx	lr
.LFE52:
	.size	chip_uart_rx_data, .-chip_uart_rx_data
	.section	.text.chip_uart_tx_start,"ax",%progbits
	.align	2
	.global	chip_uart_tx_start
	.code	16
	.thumb_func
	.type	chip_uart_tx_start, %function
chip_uart_tx_start:
.LFB53:
	ldr	r3, [r0]
	ldr	r1, [r3]
	mov	r2, #128
	orr	r2, r1
	str	r2, [r3]
	@ sp needed
	bx	lr
.LFE53:
	.size	chip_uart_tx_start, .-chip_uart_tx_start
	.section	.text.chip_uart_tx_stop,"ax",%progbits
	.align	2
	.global	chip_uart_tx_stop
	.code	16
	.thumb_func
	.type	chip_uart_tx_stop, %function
chip_uart_tx_stop:
.LFB54:
	ldr	r3, [r0]
	ldr	r2, [r3]
	mov	r1, #128
	bic	r2, r1
	str	r2, [r3]
	@ sp needed
	bx	lr
.LFE54:
	.size	chip_uart_tx_stop, .-chip_uart_tx_stop
	.section	.text.isr_uart,"ax",%progbits
	.align	2
	.global	isr_uart
	.code	16
	.thumb_func
	.type	isr_uart, %function
isr_uart:
.LFB55:
	push	{r4, r5, r6, lr}
.LCFI5:
	mov	r4, r1
	ldrb	r3, [r1, #4]
	cmp	r3, r0
	bne	.L53
	mov	r6, #16
	mov	r5, #1
	b	.L55
.L57:
.LBB9:
.LBB10:
	ldr	r3, [r4]
	ldrh	r1, [r3, #36]
.LBE10:
.LBE9:
	uxtb	r1, r1
	ldr	r0, [r4, #24]
	bl	caribou_bytequeue_put
	cmp	r0, #0
	bne	.L56
	ldr	r3, [r4, #20]
	orr	r3, r6
	str	r3, [r4, #20]
.L56:
	ldr	r3, [r4, #20]
	orr	r3, r5
	str	r3, [r4, #20]
.L55:
	mov	r0, r4
	bl	chip_uart_rx_ready
	cmp	r0, #0
	bne	.L57
	ldr	r0, [r4, #28]
	bl	caribou_bytequeue_empty
	cmp	r0, #0
	bne	.L58
	mov	r0, r4
	bl	chip_uart_tx_ready
	cmp	r0, #0
	beq	.L58
	ldr	r0, [r4, #28]
	bl	caribou_bytequeue_get
.LBB11:
.LBB12:
	uxth	r0, r0
	ldr	r3, [r4]
	strh	r0, [r3, #40]
.L58:
.LBE12:
.LBE11:
	ldr	r0, [r4, #28]
	bl	caribou_bytequeue_empty
	cmp	r0, #0
	beq	.L59
	mov	r0, r4
	bl	chip_uart_tx_stop
.L59:
	ldr	r3, [r4]
	mov	r2, #8
	str	r2, [r3, #32]
.L53:
	@ sp needed
	pop	{r4, r5, r6, pc}
.LFE55:
	.size	isr_uart, .-isr_uart
	.global	_stdio_
	.global	device_info
	.section	.data.device_info,"aw",%progbits
	.align	2
	.type	device_info, %object
	.size	device_info, 96
device_info:
	.word	1073821696
	.byte	27
	.space	3
	.word	9600
	.byte	8
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.space	3
	.word	0
	.word	0
	.word	0
	.word	1073759232
	.byte	28
	.space	3
	.word	9600
	.byte	8
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.space	3
	.word	0
	.word	0
	.word	0
	.word	0
	.byte	0
	.space	3
	.word	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.space	4
	.word	0
	.word	0
	.word	0
	.section	.rodata._stdio_,"a",%progbits
	.align	2
	.type	_stdio_, %object
	.size	_stdio_, 72
_stdio_:
	.word	device_info
	.word	caribou_uart_private_readfn
	.word	caribou_uart_private_writefn
	.word	caribou_uart_private_readqueuefn
	.word	caribou_uart_private_writequeuefn
	.word	caribou_uart_private_statefn
	.word	device_info+32
	.word	caribou_uart_private_readfn
	.word	caribou_uart_private_writefn
	.word	caribou_uart_private_readqueuefn
	.word	caribou_uart_private_writequeuefn
	.word	caribou_uart_private_statefn
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
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
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.align	2
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.byte	0x4
	.4byte	.LCFI0-.LFB32
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
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.byte	0x4
	.4byte	.LCFI1-.LFB33
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
.LEFDE4:
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.byte	0x4
	.4byte	.LCFI2-.LFB35
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
.LEFDE6:
.LSFDE8:
	.4byte	.LEFDE8-.LASFDE8
.LASFDE8:
	.4byte	.Lframe0
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.byte	0x4
	.4byte	.LCFI3-.LFB38
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
	.uleb128 0x28
	.align	2
.LEFDE8:
.LSFDE10:
	.4byte	.LEFDE10-.LASFDE10
.LASFDE10:
	.4byte	.Lframe0
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.align	2
.LEFDE10:
.LSFDE12:
	.4byte	.LEFDE12-.LASFDE12
.LASFDE12:
	.4byte	.Lframe0
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.align	2
.LEFDE12:
.LSFDE14:
	.4byte	.LEFDE14-.LASFDE14
.LASFDE14:
	.4byte	.Lframe0
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.align	2
.LEFDE14:
.LSFDE16:
	.4byte	.LEFDE16-.LASFDE16
.LASFDE16:
	.4byte	.Lframe0
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.align	2
.LEFDE16:
.LSFDE18:
	.4byte	.LEFDE18-.LASFDE18
.LASFDE18:
	.4byte	.Lframe0
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.align	2
.LEFDE18:
.LSFDE20:
	.4byte	.LEFDE20-.LASFDE20
.LASFDE20:
	.4byte	.Lframe0
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.align	2
.LEFDE20:
.LSFDE22:
	.4byte	.LEFDE22-.LASFDE22
.LASFDE22:
	.4byte	.Lframe0
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.align	2
.LEFDE22:
.LSFDE24:
	.4byte	.LEFDE24-.LASFDE24
.LASFDE24:
	.4byte	.Lframe0
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.align	2
.LEFDE24:
.LSFDE26:
	.4byte	.LEFDE26-.LASFDE26
.LASFDE26:
	.4byte	.Lframe0
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.align	2
.LEFDE26:
.LSFDE28:
	.4byte	.LEFDE28-.LASFDE28
.LASFDE28:
	.4byte	.Lframe0
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.align	2
.LEFDE28:
.LSFDE30:
	.4byte	.LEFDE30-.LASFDE30
.LASFDE30:
	.4byte	.Lframe0
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.align	2
.LEFDE30:
.LSFDE32:
	.4byte	.LEFDE32-.LASFDE32
.LASFDE32:
	.4byte	.Lframe0
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.align	2
.LEFDE32:
.LSFDE34:
	.4byte	.LEFDE34-.LASFDE34
.LASFDE34:
	.4byte	.Lframe0
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.align	2
.LEFDE34:
.LSFDE36:
	.4byte	.LEFDE36-.LASFDE36
.LASFDE36:
	.4byte	.Lframe0
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
	.align	2
.LEFDE36:
.LSFDE38:
	.4byte	.LEFDE38-.LASFDE38
.LASFDE38:
	.4byte	.Lframe0
	.4byte	.LFB53
	.4byte	.LFE53-.LFB53
	.align	2
.LEFDE38:
.LSFDE40:
	.4byte	.LEFDE40-.LASFDE40
.LASFDE40:
	.4byte	.Lframe0
	.4byte	.LFB54
	.4byte	.LFE54-.LFB54
	.align	2
.LEFDE40:
.LSFDE42:
	.4byte	.LEFDE42-.LASFDE42
.LASFDE42:
	.4byte	.Lframe0
	.4byte	.LFB55
	.4byte	.LFE55-.LFB55
	.byte	0x4
	.4byte	.LCFI5-.LFB55
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
.LEFDE42:
	.text
.Letext0:
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../../../chip/stm32/stm32f030/src/uart.c"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x1a9
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF22
	.byte	0x1
	.4byte	.LASF23
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.uleb128 0x2
	.4byte	.LASF0
	.byte	0x1
	.byte	0x75
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF1
	.byte	0x1
	.byte	0x62
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF2
	.byte	0x1
	.byte	0x6c
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF3
	.byte	0x1
	.byte	0x7d
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF4
	.byte	0x1
	.byte	0x94
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF5
	.byte	0x1
	.byte	0xed
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF6
	.byte	0x1
	.byte	0xf3
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF7
	.byte	0x1
	.byte	0xf8
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF8
	.byte	0x1
	.byte	0xff
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF9
	.byte	0x1
	.2byte	0x106
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF10
	.byte	0x1
	.2byte	0x10c
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF11
	.byte	0x1
	.2byte	0x112
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF12
	.byte	0x1
	.2byte	0x118
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF13
	.byte	0x1
	.2byte	0x11e
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF14
	.byte	0x1
	.2byte	0x125
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF15
	.byte	0x1
	.2byte	0x12c
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF16
	.byte	0x1
	.2byte	0x133
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF17
	.byte	0x1
	.2byte	0x13b
	.byte	0x1
	.uleb128 0x6
	.4byte	0x146
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF18
	.byte	0x1
	.2byte	0x142
	.byte	0x1
	.uleb128 0x6
	.4byte	0x15e
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF19
	.byte	0x1
	.2byte	0x149
	.4byte	.LFB53
	.4byte	.LFE53-.LFB53
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF20
	.byte	0x1
	.2byte	0x150
	.4byte	.LFB54
	.4byte	.LFE54-.LFB54
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x7
	.4byte	.LASF21
	.byte	0x1
	.2byte	0x157
	.4byte	.LFB55
	.4byte	.LFE55-.LFB55
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
	.uleb128 0xb
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
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x5
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
	.uleb128 0x20
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x2e
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
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
	.uleb128 0x7
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
	.4byte	0xc4
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
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
	.4byte	.LFB53
	.4byte	.LFE53-.LFB53
	.4byte	.LFB54
	.4byte	.LFE54-.LFB54
	.4byte	.LFB55
	.4byte	.LFE55-.LFB55
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LFB34
	.4byte	.LFE34
	.4byte	.LFB32
	.4byte	.LFE32
	.4byte	.LFB33
	.4byte	.LFE33
	.4byte	.LFB35
	.4byte	.LFE35
	.4byte	.LFB38
	.4byte	.LFE38
	.4byte	.LFB39
	.4byte	.LFE39
	.4byte	.LFB40
	.4byte	.LFE40
	.4byte	.LFB41
	.4byte	.LFE41
	.4byte	.LFB42
	.4byte	.LFE42
	.4byte	.LFB43
	.4byte	.LFE43
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
	.4byte	.LFB53
	.4byte	.LFE53
	.4byte	.LFB54
	.4byte	.LFE54
	.4byte	.LFB55
	.4byte	.LFE55
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF19:
	.ascii	"chip_uart_tx_start\000"
.LASF15:
	.ascii	"chip_uart_tx_ready\000"
.LASF6:
	.ascii	"chip_uart_close\000"
.LASF16:
	.ascii	"chip_uart_rx_ready\000"
.LASF21:
	.ascii	"isr_uart\000"
.LASF1:
	.ascii	"chip_uart_int_enable\000"
.LASF23:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4/crossworks/../"
	.ascii	"../../chip/stm32/stm32f030/src/uart.c\000"
.LASF9:
	.ascii	"chip_uart_rx_queue\000"
.LASF17:
	.ascii	"chip_uart_tx_data\000"
.LASF14:
	.ascii	"chip_uart_tx_busy\000"
.LASF20:
	.ascii	"chip_uart_tx_stop\000"
.LASF11:
	.ascii	"chip_uart_interrupt_vector\000"
.LASF12:
	.ascii	"chip_uart_status\000"
.LASF10:
	.ascii	"chip_uart_tx_queue\000"
.LASF7:
	.ascii	"chip_uart_set_rx_queue\000"
.LASF22:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g1 -std=gnu99 -O1 -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF2:
	.ascii	"chip_uart_int_disable\000"
.LASF13:
	.ascii	"chip_uart_set_status\000"
.LASF0:
	.ascii	"chip_uart_int_enabled\000"
.LASF3:
	.ascii	"chip_uart_int_set\000"
.LASF18:
	.ascii	"chip_uart_rx_data\000"
.LASF5:
	.ascii	"chip_uart_open\000"
.LASF4:
	.ascii	"chip_uart_set_config\000"
.LASF8:
	.ascii	"chip_uart_set_tx_queue\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
