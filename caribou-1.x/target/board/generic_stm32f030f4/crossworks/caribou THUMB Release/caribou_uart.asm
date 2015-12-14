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
	.section	.text.caribou_uart_close,"ax",%progbits
	.align	2
	.global	caribou_uart_close
	.code	16
	.thumb_func
	.type	caribou_uart_close, %function
caribou_uart_close:
.LFB34:
	push	{r4, lr}
.LCFI0:
	mov	r4, r0
	mov	r2, #0
	ldr	r3, .L2
	str	r2, [r3]
	bl	caribou_thread_lock
	lsl	r3, r4, #1
	add	r4, r3, r4
	lsl	r4, r4, #3
	ldr	r3, .L2+4
	ldr	r4, [r3, r4]
	mov	r0, r4
	bl	chip_uart_int_disable
	mov	r0, r4
	bl	chip_uart_interrupt_vector
	bl	chip_vector_disable
	mov	r0, r4
	bl	chip_uart_rx_queue
	bl	caribou_bytequeue_free
	mov	r0, r4
	bl	chip_uart_tx_queue
	bl	caribou_bytequeue_free
	mov	r0, r4
	mov	r1, #0
	bl	chip_uart_set_rx_queue
	mov	r0, r4
	mov	r1, #0
	bl	chip_uart_set_tx_queue
	mov	r0, r4
	bl	chip_uart_status
	mov	r3, #4
	mov	r1, r0
	bic	r1, r3
	mov	r0, r4
	bl	chip_uart_set_status
	bl	caribou_thread_unlock
	mov	r0, #0
	@ sp needed
	pop	{r4, pc}
.L3:
	.align	2
.L2:
	.word	__errno
	.word	_stdio_
.LFE34:
	.size	caribou_uart_close, .-caribou_uart_close
	.section	.text.caribou_uart_init_config,"ax",%progbits
	.align	2
	.global	caribou_uart_init_config
	.code	16
	.thumb_func
	.type	caribou_uart_init_config, %function
caribou_uart_init_config:
.LFB35:
	push	{r4, lr}
.LCFI1:
	sub	r4, r0, #0
	beq	.L4
	mov	r1, #0
	mov	r2, #12
	bl	memset
	mov	r3, #150
	lsl	r3, r3, #6
	str	r3, [r4]
	mov	r3, #8
	strb	r3, [r4, #4]
	mov	r3, #1
	strb	r3, [r4, #5]
	mov	r3, #0
	strb	r3, [r4, #6]
	strb	r3, [r4, #7]
.L4:
	@ sp needed
	pop	{r4, pc}
.LFE35:
	.size	caribou_uart_init_config, .-caribou_uart_init_config
	.section	.text.caribou_uart_set_config,"ax",%progbits
	.align	2
	.global	caribou_uart_set_config
	.code	16
	.thumb_func
	.type	caribou_uart_set_config, %function
caribou_uart_set_config:
.LFB36:
	push	{r3, lr}
.LCFI2:
.LBB4:
.LBB5:
	lsl	r3, r0, #1
	add	r0, r3, r0
	lsl	r0, r0, #3
.LBE5:
.LBE4:
	ldr	r3, .L7
	ldr	r0, [r3, r0]
	bl	chip_uart_set_config
	@ sp needed
	pop	{r3, pc}
.L8:
	.align	2
.L7:
	.word	_stdio_
.LFE36:
	.size	caribou_uart_set_config, .-caribou_uart_set_config
	.section	.text.caribou_uart_open,"ax",%progbits
	.align	2
	.global	caribou_uart_open
	.code	16
	.thumb_func
	.type	caribou_uart_open, %function
caribou_uart_open:
.LFB33:
	push	{r4, r5, r6, lr}
.LCFI3:
	mov	r4, r0
	mov	r6, r1
	mov	r2, #0
	ldr	r3, .L18
	str	r2, [r3]
	bl	caribou_thread_lock
	cmp	r4, #0
	blt	.L10
.LBB11:
	lsl	r3, r4, #1
	add	r3, r3, r4
	lsl	r3, r3, #3
	ldr	r2, .L18+4
	ldr	r5, [r2, r3]
	mov	r0, r5
	bl	chip_uart_rx_queue
	bl	caribou_bytequeue_free
	mov	r0, r5
	bl	chip_uart_tx_queue
	bl	caribou_bytequeue_free
	mov	r0, r5
	mov	r1, #0
	bl	chip_uart_set_rx_queue
	mov	r0, r5
	mov	r1, #0
	bl	chip_uart_set_tx_queue
	mov	r0, #128
	bl	caribou_bytequeue_new
	mov	r1, r0
	mov	r0, r5
	bl	chip_uart_set_rx_queue
	cmp	r0, #0
	beq	.L11
	mov	r0, #8
	bl	caribou_bytequeue_new
	mov	r1, r0
	mov	r0, r5
	bl	chip_uart_set_tx_queue
	cmp	r0, #0
	beq	.L12
	mov	r0, r5
	mov	r1, #0
	bl	chip_uart_set_config
	mov	r0, r5
	bl	chip_uart_status
	mov	r3, #4
	mov	r1, r0
	orr	r1, r3
	mov	r0, r5
	bl	chip_uart_set_status
	b	.L13
.L12:
	mov	r0, r5
	bl	chip_uart_rx_queue
	bl	caribou_bytequeue_free
	mov	r2, #12
	ldr	r3, .L18
	str	r2, [r3]
	b	.L13
.L11:
	mov	r2, #12
	ldr	r3, .L18
	str	r2, [r3]
	b	.L13
.L16:
.LBE11:
	mov	r0, r4
	mov	r1, r6
	bl	caribou_uart_set_config
	cmp	r0, #0
	bge	.L14
	mov	r0, r4
	bl	caribou_uart_close
	mov	r4, #1
	neg	r4, r4
.L14:
	mov	r0, r4
	bl	chip_uart_open
	cmp	r0, r4
	beq	.L17
	mov	r0, r4
	bl	caribou_uart_close
	b	.L17
.L13:
	bl	caribou_thread_unlock
	cmp	r6, #0
	bne	.L16
	b	.L14
.L10:
	bl	caribou_thread_unlock
	b	.L14
.L17:
	mov	r0, r4
	@ sp needed
	pop	{r4, r5, r6, pc}
.L19:
	.align	2
.L18:
	.word	__errno
	.word	_stdio_
.LFE33:
	.size	caribou_uart_open, .-caribou_uart_open
	.section	.text.caribou_uart_queue_tx_sz,"ax",%progbits
	.align	2
	.global	caribou_uart_queue_tx_sz
	.code	16
	.thumb_func
	.type	caribou_uart_queue_tx_sz, %function
caribou_uart_queue_tx_sz:
.LFB37:
	mov	r0, #8
	@ sp needed
	bx	lr
.LFE37:
	.size	caribou_uart_queue_tx_sz, .-caribou_uart_queue_tx_sz
	.section	.text.caribou_uart_queue_rx_sz,"ax",%progbits
	.align	2
	.global	caribou_uart_queue_rx_sz
	.code	16
	.thumb_func
	.type	caribou_uart_queue_rx_sz, %function
caribou_uart_queue_rx_sz:
.LFB38:
	mov	r0, #128
	@ sp needed
	bx	lr
.LFE38:
	.size	caribou_uart_queue_rx_sz, .-caribou_uart_queue_rx_sz
	.section	.text.caribou_uart_rx_queue,"ax",%progbits
	.align	2
	.global	caribou_uart_rx_queue
	.code	16
	.thumb_func
	.type	caribou_uart_rx_queue, %function
caribou_uart_rx_queue:
.LFB39:
	push	{r3, lr}
.LCFI4:
.LBB14:
.LBB15:
	lsl	r3, r0, #1
	add	r0, r3, r0
	lsl	r0, r0, #3
.LBE15:
.LBE14:
	ldr	r3, .L23
	ldr	r0, [r3, r0]
	bl	chip_uart_rx_queue
	@ sp needed
	pop	{r3, pc}
.L24:
	.align	2
.L23:
	.word	_stdio_
.LFE39:
	.size	caribou_uart_rx_queue, .-caribou_uart_rx_queue
	.section	.text.caribou_uart_tx_queue,"ax",%progbits
	.align	2
	.global	caribou_uart_tx_queue
	.code	16
	.thumb_func
	.type	caribou_uart_tx_queue, %function
caribou_uart_tx_queue:
.LFB40:
	push	{r3, lr}
.LCFI5:
.LBB18:
.LBB19:
	lsl	r3, r0, #1
	add	r0, r3, r0
	lsl	r0, r0, #3
.LBE19:
.LBE18:
	ldr	r3, .L26
	ldr	r0, [r3, r0]
	bl	chip_uart_tx_queue
	@ sp needed
	pop	{r3, pc}
.L27:
	.align	2
.L26:
	.word	_stdio_
.LFE40:
	.size	caribou_uart_tx_queue, .-caribou_uart_tx_queue
	.section	.text.caribou_uart_int_enable,"ax",%progbits
	.align	2
	.global	caribou_uart_int_enable
	.code	16
	.thumb_func
	.type	caribou_uart_int_enable, %function
caribou_uart_int_enable:
.LFB41:
	push	{r3, lr}
.LCFI6:
.LBB22:
.LBB23:
	lsl	r3, r0, #1
	add	r0, r3, r0
	lsl	r0, r0, #3
.LBE23:
.LBE22:
	ldr	r3, .L29
	ldr	r0, [r3, r0]
	bl	chip_uart_int_enable
	@ sp needed
	pop	{r3, pc}
.L30:
	.align	2
.L29:
	.word	_stdio_
.LFE41:
	.size	caribou_uart_int_enable, .-caribou_uart_int_enable
	.section	.text.caribou_uart_int_disable,"ax",%progbits
	.align	2
	.global	caribou_uart_int_disable
	.code	16
	.thumb_func
	.type	caribou_uart_int_disable, %function
caribou_uart_int_disable:
.LFB42:
	push	{r3, lr}
.LCFI7:
.LBB26:
.LBB27:
	lsl	r3, r0, #1
	add	r0, r3, r0
	lsl	r0, r0, #3
.LBE27:
.LBE26:
	ldr	r3, .L32
	ldr	r0, [r3, r0]
	bl	chip_uart_int_disable
	@ sp needed
	pop	{r3, pc}
.L33:
	.align	2
.L32:
	.word	_stdio_
.LFE42:
	.size	caribou_uart_int_disable, .-caribou_uart_int_disable
	.section	.text.caribou_uart_int_enabled,"ax",%progbits
	.align	2
	.global	caribou_uart_int_enabled
	.code	16
	.thumb_func
	.type	caribou_uart_int_enabled, %function
caribou_uart_int_enabled:
.LFB43:
	push	{r3, lr}
.LCFI8:
.LBB30:
.LBB31:
	lsl	r3, r0, #1
	add	r0, r3, r0
	lsl	r0, r0, #3
.LBE31:
.LBE30:
	ldr	r3, .L35
	ldr	r0, [r3, r0]
	bl	chip_uart_int_enabled
	@ sp needed
	pop	{r3, pc}
.L36:
	.align	2
.L35:
	.word	_stdio_
.LFE43:
	.size	caribou_uart_int_enabled, .-caribou_uart_int_enabled
	.section	.text.caribou_uart_int_set,"ax",%progbits
	.align	2
	.global	caribou_uart_int_set
	.code	16
	.thumb_func
	.type	caribou_uart_int_set, %function
caribou_uart_int_set:
.LFB44:
	push	{r3, lr}
.LCFI9:
.LBB34:
.LBB35:
	lsl	r3, r0, #1
	add	r0, r3, r0
	lsl	r0, r0, #3
.LBE35:
.LBE34:
	ldr	r3, .L38
	ldr	r0, [r3, r0]
	bl	chip_uart_int_set
	@ sp needed
	pop	{r3, pc}
.L39:
	.align	2
.L38:
	.word	_stdio_
.LFE44:
	.size	caribou_uart_int_set, .-caribou_uart_int_set
	.section	.text.caribou_uart_tx_data,"ax",%progbits
	.align	2
	.global	caribou_uart_tx_data
	.code	16
	.thumb_func
	.type	caribou_uart_tx_data, %function
caribou_uart_tx_data:
.LFB45:
	push	{r3, lr}
.LCFI10:
.LBB38:
.LBB39:
	lsl	r3, r0, #1
	add	r0, r3, r0
	lsl	r0, r0, #3
.LBE39:
.LBE38:
	ldr	r3, .L41
	ldr	r0, [r3, r0]
	bl	chip_uart_tx_data
	@ sp needed
	pop	{r3, pc}
.L42:
	.align	2
.L41:
	.word	_stdio_
.LFE45:
	.size	caribou_uart_tx_data, .-caribou_uart_tx_data
	.section	.text.caribou_uart_rx_data,"ax",%progbits
	.align	2
	.global	caribou_uart_rx_data
	.code	16
	.thumb_func
	.type	caribou_uart_rx_data, %function
caribou_uart_rx_data:
.LFB46:
	push	{r3, lr}
.LCFI11:
.LBB42:
.LBB43:
	lsl	r3, r0, #1
	add	r0, r3, r0
	lsl	r0, r0, #3
.LBE43:
.LBE42:
	ldr	r3, .L44
	ldr	r0, [r3, r0]
	bl	chip_uart_rx_data
	@ sp needed
	pop	{r3, pc}
.L45:
	.align	2
.L44:
	.word	_stdio_
.LFE46:
	.size	caribou_uart_rx_data, .-caribou_uart_rx_data
	.section	.text.caribou_uart_tx_busy,"ax",%progbits
	.align	2
	.global	caribou_uart_tx_busy
	.code	16
	.thumb_func
	.type	caribou_uart_tx_busy, %function
caribou_uart_tx_busy:
.LFB47:
	push	{r3, lr}
.LCFI12:
.LBB46:
.LBB47:
	lsl	r3, r0, #1
	add	r0, r3, r0
	lsl	r0, r0, #3
.LBE47:
.LBE46:
	ldr	r3, .L47
	ldr	r0, [r3, r0]
	bl	chip_uart_tx_busy
	uxtb	r0, r0
	@ sp needed
	pop	{r3, pc}
.L48:
	.align	2
.L47:
	.word	_stdio_
.LFE47:
	.size	caribou_uart_tx_busy, .-caribou_uart_tx_busy
	.section	.text.caribou_uart_tx_ready,"ax",%progbits
	.align	2
	.global	caribou_uart_tx_ready
	.code	16
	.thumb_func
	.type	caribou_uart_tx_ready, %function
caribou_uart_tx_ready:
.LFB48:
	push	{r3, lr}
.LCFI13:
.LBB50:
.LBB51:
	lsl	r3, r0, #1
	add	r0, r3, r0
	lsl	r0, r0, #3
.LBE51:
.LBE50:
	ldr	r3, .L50
	ldr	r0, [r3, r0]
	bl	chip_uart_tx_ready
	@ sp needed
	pop	{r3, pc}
.L51:
	.align	2
.L50:
	.word	_stdio_
.LFE48:
	.size	caribou_uart_tx_ready, .-caribou_uart_tx_ready
	.section	.text.caribou_uart_rx_ready,"ax",%progbits
	.align	2
	.global	caribou_uart_rx_ready
	.code	16
	.thumb_func
	.type	caribou_uart_rx_ready, %function
caribou_uart_rx_ready:
.LFB49:
	push	{r3, lr}
.LCFI14:
.LBB54:
.LBB55:
	lsl	r3, r0, #1
	add	r0, r3, r0
	lsl	r0, r0, #3
.LBE55:
.LBE54:
	ldr	r3, .L53
	ldr	r0, [r3, r0]
	bl	chip_uart_rx_ready
	@ sp needed
	pop	{r3, pc}
.L54:
	.align	2
.L53:
	.word	_stdio_
.LFE49:
	.size	caribou_uart_rx_ready, .-caribou_uart_rx_ready
	.section	.text.caribou_uart_enable,"ax",%progbits
	.align	2
	.global	caribou_uart_enable
	.code	16
	.thumb_func
	.type	caribou_uart_enable, %function
caribou_uart_enable:
.LFB50:
	push	{r3, lr}
.LCFI15:
.LBB58:
.LBB59:
	lsl	r3, r0, #1
	add	r0, r3, r0
	lsl	r0, r0, #3
.LBE59:
.LBE58:
	ldr	r3, .L56
	ldr	r0, [r3, r0]
	bl	chip_uart_enable
	@ sp needed
	pop	{r3, pc}
.L57:
	.align	2
.L56:
	.word	_stdio_
.LFE50:
	.size	caribou_uart_enable, .-caribou_uart_enable
	.section	.text.caribou_uart_disable,"ax",%progbits
	.align	2
	.global	caribou_uart_disable
	.code	16
	.thumb_func
	.type	caribou_uart_disable, %function
caribou_uart_disable:
.LFB51:
	push	{r3, lr}
.LCFI16:
.LBB62:
.LBB63:
	lsl	r3, r0, #1
	add	r0, r3, r0
	lsl	r0, r0, #3
.LBE63:
.LBE62:
	ldr	r3, .L59
	ldr	r0, [r3, r0]
	bl	chip_uart_disable
	@ sp needed
	pop	{r3, pc}
.L60:
	.align	2
.L59:
	.word	_stdio_
.LFE51:
	.size	caribou_uart_disable, .-caribou_uart_disable
	.section	.text.caribou_uart_private_readfn,"ax",%progbits
	.align	2
	.global	caribou_uart_private_readfn
	.code	16
	.thumb_func
	.type	caribou_uart_private_readfn, %function
caribou_uart_private_readfn:
.LFB52:
	push	{r3, r4, r5, r6, r7, lr}
.LCFI17:
	mov	r7, r9
	mov	r6, r8
	push	{r6, r7}
.LCFI18:
	mov	r5, r0
	mov	r7, r1
	sub	r6, r2, #0
	ble	.L66
	mov	r4, #0
.LBB64:
	mov	r3, #1
	mov	r8, r3
.L65:
	ldr	r0, [r5]
	bl	chip_uart_rx_queue
	bl	caribou_bytequeue_get
	cmp	r0, #0
	blt	.L63
	add	r3, r4, #1
	mov	r9, r3
	strb	r0, [r7, r4]
	ldr	r4, [r5]
	mov	r0, r4
	bl	chip_uart_status
	mov	r1, r8
	orr	r1, r0
	mov	r0, r4
	bl	chip_uart_set_status
	mov	r4, r9
	b	.L64
.L63:
	bl	caribou_thread_yield
.L64:
.LBE64:
	cmp	r6, r4
	bgt	.L65
	b	.L62
.L66:
	mov	r4, #0
.L62:
	mov	r0, r4
	@ sp needed
	pop	{r2, r3}
	mov	r8, r2
	mov	r9, r3
	pop	{r3, r4, r5, r6, r7, pc}
.LFE52:
	.size	caribou_uart_private_readfn, .-caribou_uart_private_readfn
	.section	.text.caribou_uart_private_writefn,"ax",%progbits
	.align	2
	.global	caribou_uart_private_writefn
	.code	16
	.thumb_func
	.type	caribou_uart_private_writefn, %function
caribou_uart_private_writefn:
.LFB53:
	push	{r3, r4, r5, r6, r7, lr}
.LCFI19:
	mov	r5, r0
	mov	r7, r1
	sub	r6, r2, #0
	ble	.L72
	mov	r4, #0
.L71:
	ldr	r0, [r5]
	bl	chip_uart_tx_queue
	ldrb	r1, [r7, r4]
	bl	caribou_bytequeue_put
	cmp	r0, #0
	beq	.L69
	add	r4, r4, #1
	b	.L70
.L69:
	bl	caribou_thread_yield
.L70:
	ldr	r0, [r5]
	bl	chip_uart_tx_start
	cmp	r4, r6
	blt	.L71
	b	.L68
.L72:
	mov	r4, #0
.L68:
	mov	r0, r4
	@ sp needed
	pop	{r3, r4, r5, r6, r7, pc}
.LFE53:
	.size	caribou_uart_private_writefn, .-caribou_uart_private_writefn
	.section	.text.caribou_uart_private_readqueuefn,"ax",%progbits
	.align	2
	.global	caribou_uart_private_readqueuefn
	.code	16
	.thumb_func
	.type	caribou_uart_private_readqueuefn, %function
caribou_uart_private_readqueuefn:
.LFB54:
	push	{r3, lr}
.LCFI20:
	ldr	r0, [r0]
	bl	chip_uart_rx_queue
	bl	caribou_bytequeue_level
	@ sp needed
	pop	{r3, pc}
.LFE54:
	.size	caribou_uart_private_readqueuefn, .-caribou_uart_private_readqueuefn
	.section	.text.caribou_uart_private_writequeuefn,"ax",%progbits
	.align	2
	.global	caribou_uart_private_writequeuefn
	.code	16
	.thumb_func
	.type	caribou_uart_private_writequeuefn, %function
caribou_uart_private_writequeuefn:
.LFB55:
	push	{r3, lr}
.LCFI21:
	ldr	r0, [r0]
	bl	chip_uart_tx_queue
	bl	caribou_bytequeue_level
	@ sp needed
	pop	{r3, pc}
.LFE55:
	.size	caribou_uart_private_writequeuefn, .-caribou_uart_private_writequeuefn
	.section	.text.caribou_uart_private_statefn,"ax",%progbits
	.align	2
	.global	caribou_uart_private_statefn
	.code	16
	.thumb_func
	.type	caribou_uart_private_statefn, %function
caribou_uart_private_statefn:
.LFB56:
	push	{r3, lr}
.LCFI22:
	ldr	r0, [r0]
	bl	chip_uart_status
	@ sp needed
	pop	{r3, pc}
.LFE56:
	.size	caribou_uart_private_statefn, .-caribou_uart_private_statefn
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
	.byte	0x4
	.4byte	.LCFI0-.LFB34
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.byte	0x4
	.4byte	.LCFI1-.LFB35
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.byte	0x4
	.4byte	.LCFI2-.LFB36
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE4:
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.byte	0x4
	.4byte	.LCFI3-.LFB33
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
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.align	2
.LEFDE8:
.LSFDE10:
	.4byte	.LEFDE10-.LASFDE10
.LASFDE10:
	.4byte	.Lframe0
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.align	2
.LEFDE10:
.LSFDE12:
	.4byte	.LEFDE12-.LASFDE12
.LASFDE12:
	.4byte	.Lframe0
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.byte	0x4
	.4byte	.LCFI4-.LFB39
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE12:
.LSFDE14:
	.4byte	.LEFDE14-.LASFDE14
.LASFDE14:
	.4byte	.Lframe0
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.byte	0x4
	.4byte	.LCFI5-.LFB40
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE14:
.LSFDE16:
	.4byte	.LEFDE16-.LASFDE16
.LASFDE16:
	.4byte	.Lframe0
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.byte	0x4
	.4byte	.LCFI6-.LFB41
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE16:
.LSFDE18:
	.4byte	.LEFDE18-.LASFDE18
.LASFDE18:
	.4byte	.Lframe0
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.byte	0x4
	.4byte	.LCFI7-.LFB42
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE18:
.LSFDE20:
	.4byte	.LEFDE20-.LASFDE20
.LASFDE20:
	.4byte	.Lframe0
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.byte	0x4
	.4byte	.LCFI8-.LFB43
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE20:
.LSFDE22:
	.4byte	.LEFDE22-.LASFDE22
.LASFDE22:
	.4byte	.Lframe0
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.byte	0x4
	.4byte	.LCFI9-.LFB44
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE22:
.LSFDE24:
	.4byte	.LEFDE24-.LASFDE24
.LASFDE24:
	.4byte	.Lframe0
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.byte	0x4
	.4byte	.LCFI10-.LFB45
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE24:
.LSFDE26:
	.4byte	.LEFDE26-.LASFDE26
.LASFDE26:
	.4byte	.Lframe0
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.byte	0x4
	.4byte	.LCFI11-.LFB46
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE26:
.LSFDE28:
	.4byte	.LEFDE28-.LASFDE28
.LASFDE28:
	.4byte	.Lframe0
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.byte	0x4
	.4byte	.LCFI12-.LFB47
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE28:
.LSFDE30:
	.4byte	.LEFDE30-.LASFDE30
.LASFDE30:
	.4byte	.Lframe0
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.byte	0x4
	.4byte	.LCFI13-.LFB48
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE30:
.LSFDE32:
	.4byte	.LEFDE32-.LASFDE32
.LASFDE32:
	.4byte	.Lframe0
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.byte	0x4
	.4byte	.LCFI14-.LFB49
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE32:
.LSFDE34:
	.4byte	.LEFDE34-.LASFDE34
.LASFDE34:
	.4byte	.Lframe0
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.byte	0x4
	.4byte	.LCFI15-.LFB50
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE34:
.LSFDE36:
	.4byte	.LEFDE36-.LASFDE36
.LASFDE36:
	.4byte	.Lframe0
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.byte	0x4
	.4byte	.LCFI16-.LFB51
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE36:
.LSFDE38:
	.4byte	.LEFDE38-.LASFDE38
.LASFDE38:
	.4byte	.Lframe0
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
	.byte	0x4
	.4byte	.LCFI17-.LFB52
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
	.byte	0x4
	.4byte	.LCFI18-.LCFI17
	.byte	0xe
	.uleb128 0x20
	.byte	0x88
	.uleb128 0x8
	.byte	0x89
	.uleb128 0x7
	.align	2
.LEFDE38:
.LSFDE40:
	.4byte	.LEFDE40-.LASFDE40
.LASFDE40:
	.4byte	.Lframe0
	.4byte	.LFB53
	.4byte	.LFE53-.LFB53
	.byte	0x4
	.4byte	.LCFI19-.LFB53
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
.LEFDE40:
.LSFDE42:
	.4byte	.LEFDE42-.LASFDE42
.LASFDE42:
	.4byte	.Lframe0
	.4byte	.LFB54
	.4byte	.LFE54-.LFB54
	.byte	0x4
	.4byte	.LCFI20-.LFB54
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE42:
.LSFDE44:
	.4byte	.LEFDE44-.LASFDE44
.LASFDE44:
	.4byte	.Lframe0
	.4byte	.LFB55
	.4byte	.LFE55-.LFB55
	.byte	0x4
	.4byte	.LCFI21-.LFB55
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE44:
.LSFDE46:
	.4byte	.LEFDE46-.LASFDE46
.LASFDE46:
	.4byte	.Lframe0
	.4byte	.LFB56
	.4byte	.LFE56-.LFB56
	.byte	0x4
	.4byte	.LCFI22-.LFB56
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE46:
	.text
.Letext0:
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../../../../src/dev/uart.c"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x1d7
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF24
	.byte	0x1
	.4byte	.LASF25
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.uleb128 0x2
	.4byte	.LASF0
	.byte	0x1
	.byte	0x5e
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF1
	.byte	0x1
	.byte	0x73
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF26
	.byte	0x1
	.byte	0x1e
	.byte	0x1
	.uleb128 0x2
	.4byte	.LASF2
	.byte	0x1
	.byte	0x85
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF3
	.byte	0x1
	.byte	0x96
	.byte	0x1
	.uleb128 0x4
	.4byte	.LASF4
	.byte	0x1
	.byte	0x8e
	.byte	0x1
	.uleb128 0x2
	.4byte	.LASF5
	.byte	0x1
	.byte	0x2a
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	0x60
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	0x58
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF6
	.byte	0x1
	.byte	0x9b
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF7
	.byte	0x1
	.byte	0xa0
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF8
	.byte	0x1
	.byte	0xaa
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF9
	.byte	0x1
	.byte	0xb5
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF10
	.byte	0x1
	.byte	0xc0
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF11
	.byte	0x1
	.byte	0xcb
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF12
	.byte	0x1
	.byte	0xd5
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF13
	.byte	0x1
	.byte	0xdd
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.4byte	.LASF27
	.byte	0x1
	.byte	0xe5
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x13c
	.uleb128 0x7
	.4byte	.LASF14
	.byte	0x1
	.byte	0xe7
	.byte	0
	.uleb128 0x2
	.4byte	.LASF15
	.byte	0x1
	.byte	0xed
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF16
	.byte	0x1
	.byte	0xf5
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF17
	.byte	0x1
	.byte	0xfa
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF18
	.byte	0x1
	.byte	0xff
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x8
	.4byte	.LASF19
	.byte	0x1
	.2byte	0x106
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x8
	.4byte	.LASF20
	.byte	0x1
	.2byte	0x11b
	.4byte	.LFB53
	.4byte	.LFE53-.LFB53
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x8
	.4byte	.LASF21
	.byte	0x1
	.2byte	0x132
	.4byte	.LFB54
	.4byte	.LFE54-.LFB54
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x8
	.4byte	.LASF22
	.byte	0x1
	.2byte	0x138
	.4byte	.LFB55
	.4byte	.LFE55-.LFB55
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x8
	.4byte	.LASF23
	.byte	0x1
	.2byte	0x13e
	.4byte	.LFB56
	.4byte	.LFE56-.LFB56
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
	.uleb128 0x2116
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x20
	.uleb128 0xb
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
	.uleb128 0xb
	.uleb128 0x20
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x5
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
	.uleb128 0x6
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0x1
	.uleb128 0x13
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
	.uleb128 0xb
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x8
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
	.4byte	0xd4
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
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
	.4byte	.LFB56
	.4byte	.LFE56-.LFB56
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LFB34
	.4byte	.LFE34
	.4byte	.LFB35
	.4byte	.LFE35
	.4byte	.LFB36
	.4byte	.LFE36
	.4byte	.LFB33
	.4byte	.LFE33
	.4byte	.LFB37
	.4byte	.LFE37
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
	.4byte	.LFB56
	.4byte	.LFE56
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF7:
	.ascii	"caribou_uart_tx_queue\000"
.LASF5:
	.ascii	"caribou_uart_open\000"
.LASF13:
	.ascii	"caribou_uart_rx_data\000"
.LASF15:
	.ascii	"caribou_uart_tx_ready\000"
.LASF9:
	.ascii	"caribou_uart_int_disable\000"
.LASF25:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4/crossworks/../"
	.ascii	"../../../src/dev/uart.c\000"
.LASF6:
	.ascii	"caribou_uart_rx_queue\000"
.LASF4:
	.ascii	"caribou_uart_queue_tx_sz\000"
.LASF19:
	.ascii	"caribou_uart_private_readfn\000"
.LASF0:
	.ascii	"caribou_uart_close\000"
.LASF16:
	.ascii	"caribou_uart_rx_ready\000"
.LASF17:
	.ascii	"caribou_uart_enable\000"
.LASF26:
	.ascii	"caribou_device_of\000"
.LASF18:
	.ascii	"caribou_uart_disable\000"
.LASF24:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g1 -std=gnu99 -O1 -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF27:
	.ascii	"caribou_uart_tx_busy\000"
.LASF2:
	.ascii	"caribou_uart_set_config\000"
.LASF12:
	.ascii	"caribou_uart_tx_data\000"
.LASF14:
	.ascii	"chip_uart_tx_busy\000"
.LASF21:
	.ascii	"caribou_uart_private_readqueuefn\000"
.LASF22:
	.ascii	"caribou_uart_private_writequeuefn\000"
.LASF3:
	.ascii	"caribou_uart_queue_rx_sz\000"
.LASF8:
	.ascii	"caribou_uart_int_enable\000"
.LASF20:
	.ascii	"caribou_uart_private_writefn\000"
.LASF10:
	.ascii	"caribou_uart_int_enabled\000"
.LASF1:
	.ascii	"caribou_uart_init_config\000"
.LASF23:
	.ascii	"caribou_uart_private_statefn\000"
.LASF11:
	.ascii	"caribou_uart_int_set\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
