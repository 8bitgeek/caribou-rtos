	.syntax unified
	.cpu cortex-m0
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.thumb
	.syntax unified
	.file	"uart.c"
	.text
.Ltext0:
	.global	uart_mutex
	.section	.bss.uart_mutex,"aw",%nobits
	.align	2
	.type	uart_mutex, %object
	.size	uart_mutex, 8
uart_mutex:
	.space	8
	.section	.text.caribou_device_of,"ax",%progbits
	.align	2
	.global	caribou_device_of
	.code	16
	.thumb_func
	.type	caribou_device_of, %function
caribou_device_of:
.LFB32:
	.file 1 "/home/mike/Documents/GitHub/caribou-rtos/caribou/target/board/nucleo_f091/crossworks/../../../../src/dev/uart.c"
	.loc 1 33 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI0:
	sub	sp, sp, #16
.LCFI1:
	add	r7, sp, #0
.LCFI2:
	str	r0, [r7, #4]
	.loc 1 34 0
	ldr	r2, [r7, #4]
	movs	r3, r2
	lsls	r3, r3, #1
	adds	r3, r3, r2
	lsls	r3, r3, #3
	ldr	r2, .L3
	adds	r3, r3, r2
	str	r3, [r7, #12]
	.loc 1 35 0
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	str	r3, [r7, #8]
	.loc 1 36 0
	ldr	r3, [r7, #8]
	.loc 1 37 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L4:
	.align	2
.L3:
	.word	_stdio_
.LFE32:
	.size	caribou_device_of, .-caribou_device_of
	.section	.text.caribou_uart_open,"ax",%progbits
	.align	2
	.global	caribou_uart_open
	.code	16
	.thumb_func
	.type	caribou_uart_open, %function
caribou_uart_open:
.LFB33:
	.loc 1 45 0
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI3:
	sub	sp, sp, #24
.LCFI4:
	add	r7, sp, #0
.LCFI5:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 47 0
	ldr	r3, .L13
	movs	r2, #0
	str	r2, [r3]
	.loc 1 48 0
	ldr	r3, .L13+4
	movs	r1, #0
	movs	r0, r3
	bl	caribou_mutex_lock
	.loc 1 49 0
	ldr	r3, [r7, #4]
	str	r3, [r7, #20]
	ldr	r3, [r7, #20]
	cmp	r3, #0
	blt	.L6
.LBB2:
	.loc 1 51 0
	ldr	r2, [r7, #20]
	movs	r3, r2
	lsls	r3, r3, #1
	adds	r3, r3, r2
	lsls	r3, r3, #3
	ldr	r2, .L13+8
	adds	r3, r3, r2
	str	r3, [r7, #16]
	.loc 1 52 0
	ldr	r3, [r7, #16]
	ldr	r3, [r3]
	str	r3, [r7, #12]
	.loc 1 53 0
	ldr	r3, [r7, #12]
	movs	r0, r3
	bl	chip_uart_rx_queue
	movs	r3, r0
	movs	r0, r3
	bl	caribou_bytequeue_free
	.loc 1 54 0
	ldr	r3, [r7, #12]
	movs	r0, r3
	bl	chip_uart_tx_queue
	movs	r3, r0
	movs	r0, r3
	bl	caribou_bytequeue_free
	.loc 1 55 0
	ldr	r3, [r7, #12]
	movs	r1, #0
	movs	r0, r3
	bl	chip_uart_set_rx_queue
	.loc 1 56 0
	ldr	r3, [r7, #12]
	movs	r1, #0
	movs	r0, r3
	bl	chip_uart_set_tx_queue
	.loc 1 57 0
	bl	caribou_uart_queue_rx_sz
	movs	r3, r0
	uxth	r3, r3
	movs	r0, r3
	bl	caribou_bytequeue_new
	movs	r2, r0
	ldr	r3, [r7, #12]
	movs	r1, r2
	movs	r0, r3
	bl	chip_uart_set_rx_queue
	subs	r3, r0, #0
	beq	.L7
	.loc 1 59 0
	bl	caribou_uart_queue_tx_sz
	movs	r3, r0
	uxth	r3, r3
	movs	r0, r3
	bl	caribou_bytequeue_new
	movs	r2, r0
	ldr	r3, [r7, #12]
	movs	r1, r2
	movs	r0, r3
	bl	chip_uart_set_tx_queue
	subs	r3, r0, #0
	beq	.L8
	.loc 1 61 0
	ldr	r3, [r7, #12]
	movs	r1, #0
	movs	r0, r3
	bl	chip_uart_set_config
	.loc 1 62 0
	ldr	r3, [r7, #12]
	movs	r0, r3
	bl	chip_uart_status
	movs	r2, r0
	movs	r3, #4
	orrs	r2, r3
	ldr	r3, [r7, #12]
	movs	r1, r2
	movs	r0, r3
	bl	chip_uart_set_status
	b	.L6
.L8:
	.loc 1 66 0
	ldr	r3, [r7, #12]
	movs	r0, r3
	bl	chip_uart_rx_queue
	movs	r3, r0
	movs	r0, r3
	bl	caribou_bytequeue_free
	.loc 1 67 0
	ldr	r3, .L13
	movs	r2, #12
	str	r2, [r3]
	b	.L6
.L7:
	.loc 1 72 0
	ldr	r3, .L13
	movs	r2, #12
	str	r2, [r3]
.L6:
.LBE2:
	.loc 1 75 0
	ldr	r3, .L13+4
	movs	r0, r3
	bl	caribou_mutex_unlock
	.loc 1 76 0
	ldr	r3, [r7, #20]
	cmp	r3, #0
	blt	.L10
	.loc 1 76 0 is_stmt 0 discriminator 1
	ldr	r3, [r7]
	cmp	r3, #0
	beq	.L10
	.loc 1 78 0 is_stmt 1
	ldr	r2, [r7]
	ldr	r3, [r7, #20]
	movs	r1, r2
	movs	r0, r3
	bl	caribou_uart_set_config
	subs	r3, r0, #0
	bge	.L10
	.loc 1 80 0
	ldr	r3, [r7, #20]
	movs	r0, r3
	bl	caribou_uart_close
	.loc 1 81 0
	movs	r3, #1
	rsbs	r3, r3, #0
	str	r3, [r7, #20]
.L10:
	.loc 1 84 0
	ldr	r3, [r7, #20]
	movs	r0, r3
	bl	chip_uart_open
	movs	r2, r0
	ldr	r3, [r7, #20]
	cmp	r2, r3
	beq	.L11
	.loc 1 86 0
	ldr	r3, [r7, #20]
	movs	r0, r3
	bl	caribou_uart_close
.L11:
	.loc 1 88 0
	ldr	r3, [r7, #20]
	.loc 1 89 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #24
	@ sp needed
	pop	{r7, pc}
.L14:
	.align	2
.L13:
	.word	__errno
	.word	uart_mutex
	.word	_stdio_
.LFE33:
	.size	caribou_uart_open, .-caribou_uart_open
	.section	.text.caribou_uart_close,"ax",%progbits
	.align	2
	.global	caribou_uart_close
	.code	16
	.thumb_func
	.type	caribou_uart_close, %function
caribou_uart_close:
.LFB34:
	.loc 1 97 0
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI6:
	sub	sp, sp, #24
.LCFI7:
	add	r7, sp, #0
.LCFI8:
	str	r0, [r7, #4]
	.loc 1 98 0
	movs	r3, #0
	str	r3, [r7, #20]
	.loc 1 99 0
	ldr	r3, .L17
	movs	r2, #0
	str	r2, [r3]
	.loc 1 100 0
	ldr	r3, .L17+4
	movs	r1, #0
	movs	r0, r3
	bl	caribou_mutex_lock
	.loc 1 101 0
	ldr	r2, [r7, #4]
	movs	r3, r2
	lsls	r3, r3, #1
	adds	r3, r3, r2
	lsls	r3, r3, #3
	ldr	r2, .L17+8
	adds	r3, r3, r2
	str	r3, [r7, #16]
	.loc 1 102 0
	ldr	r3, [r7, #16]
	ldr	r3, [r3]
	str	r3, [r7, #12]
	.loc 1 103 0
	ldr	r3, [r7, #12]
	movs	r0, r3
	bl	chip_uart_int_disable
	.loc 1 104 0
	ldr	r3, [r7, #12]
	movs	r0, r3
	bl	chip_uart_interrupt_vector
	movs	r3, r0
	movs	r0, r3
	bl	chip_vector_disable
	.loc 1 105 0
	ldr	r3, [r7, #12]
	movs	r0, r3
	bl	chip_uart_rx_queue
	movs	r3, r0
	movs	r0, r3
	bl	caribou_bytequeue_free
	.loc 1 106 0
	ldr	r3, [r7, #12]
	movs	r0, r3
	bl	chip_uart_tx_queue
	movs	r3, r0
	movs	r0, r3
	bl	caribou_bytequeue_free
	.loc 1 107 0
	ldr	r3, [r7, #12]
	movs	r1, #0
	movs	r0, r3
	bl	chip_uart_set_rx_queue
	.loc 1 108 0
	ldr	r3, [r7, #12]
	movs	r1, #0
	movs	r0, r3
	bl	chip_uart_set_tx_queue
	.loc 1 109 0
	ldr	r3, [r7, #12]
	movs	r0, r3
	bl	chip_uart_status
	movs	r2, r0
	movs	r3, #4
	bics	r2, r3
	ldr	r3, [r7, #12]
	movs	r1, r2
	movs	r0, r3
	bl	chip_uart_set_status
	.loc 1 110 0
	ldr	r3, .L17+4
	movs	r0, r3
	bl	caribou_mutex_unlock
	.loc 1 111 0
	ldr	r3, [r7, #20]
	.loc 1 112 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #24
	@ sp needed
	pop	{r7, pc}
.L18:
	.align	2
.L17:
	.word	__errno
	.word	uart_mutex
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
	.loc 1 118 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI9:
	sub	sp, sp, #8
.LCFI10:
	add	r7, sp, #0
.LCFI11:
	str	r0, [r7, #4]
	.loc 1 119 0
	ldr	r3, [r7, #4]
	cmp	r3, #0
	beq	.L21
	.loc 1 121 0
	ldr	r3, [r7, #4]
	movs	r2, #12
	movs	r1, #0
	movs	r0, r3
	bl	memset
	.loc 1 122 0
	ldr	r3, [r7, #4]
	movs	r2, #150
	lsls	r2, r2, #6
	str	r2, [r3]
	.loc 1 123 0
	ldr	r3, [r7, #4]
	movs	r2, #8
	strb	r2, [r3, #4]
	.loc 1 124 0
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb	r2, [r3, #5]
	.loc 1 125 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #6]
	.loc 1 126 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #7]
.L21:
	.loc 1 128 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 136 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI12:
	sub	sp, sp, #16
.LCFI13:
	add	r7, sp, #0
.LCFI14:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 137 0
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	caribou_device_of
	movs	r2, r0
	ldr	r3, [r7]
	movs	r1, r3
	movs	r0, r2
	bl	chip_uart_set_config
	movs	r3, r0
	str	r3, [r7, #12]
	.loc 1 138 0
	ldr	r3, [r7, #12]
	.loc 1 139 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE36:
	.size	caribou_uart_set_config, .-caribou_uart_set_config
	.section	.text.caribou_uart_queue_tx_sz,"ax",%progbits
	.align	2
	.global	caribou_uart_queue_tx_sz
	.code	16
	.thumb_func
	.type	caribou_uart_queue_tx_sz, %function
caribou_uart_queue_tx_sz:
.LFB37:
	.loc 1 145 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI15:
	add	r7, sp, #0
.LCFI16:
	.loc 1 146 0
	movs	r3, #32
	.loc 1 147 0
	movs	r0, r3
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 153 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI17:
	add	r7, sp, #0
.LCFI18:
	.loc 1 154 0
	movs	r3, #128
	.loc 1 155 0
	movs	r0, r3
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 158 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI19:
	sub	sp, sp, #8
.LCFI20:
	add	r7, sp, #0
.LCFI21:
	str	r0, [r7, #4]
	.loc 1 159 0
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	caribou_device_of
	movs	r3, r0
	movs	r0, r3
	bl	chip_uart_rx_queue
	movs	r3, r0
	.loc 1 160 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 163 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI22:
	sub	sp, sp, #8
.LCFI23:
	add	r7, sp, #0
.LCFI24:
	str	r0, [r7, #4]
	.loc 1 164 0
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	caribou_device_of
	movs	r3, r0
	movs	r0, r3
	bl	chip_uart_tx_queue
	movs	r3, r0
	.loc 1 165 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 173 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI25:
	sub	sp, sp, #16
.LCFI26:
	add	r7, sp, #0
.LCFI27:
	str	r0, [r7, #4]
	.loc 1 174 0
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	caribou_device_of
	movs	r3, r0
	movs	r0, r3
	bl	chip_uart_int_enable
	movs	r3, r0
	str	r3, [r7, #12]
	.loc 1 175 0
	ldr	r3, [r7, #12]
	.loc 1 176 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 184 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI28:
	sub	sp, sp, #16
.LCFI29:
	add	r7, sp, #0
.LCFI30:
	str	r0, [r7, #4]
	.loc 1 185 0
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	caribou_device_of
	movs	r3, r0
	movs	r0, r3
	bl	chip_uart_int_disable
	movs	r3, r0
	str	r3, [r7, #12]
	.loc 1 186 0
	ldr	r3, [r7, #12]
	.loc 1 187 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 195 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI31:
	sub	sp, sp, #16
.LCFI32:
	add	r7, sp, #0
.LCFI33:
	str	r0, [r7, #4]
	.loc 1 196 0
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	caribou_device_of
	movs	r3, r0
	movs	r0, r3
	bl	chip_uart_int_enabled
	movs	r3, r0
	str	r3, [r7, #12]
	.loc 1 197 0
	ldr	r3, [r7, #12]
	.loc 1 198 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 206 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI34:
	sub	sp, sp, #16
.LCFI35:
	add	r7, sp, #0
.LCFI36:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 207 0
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	caribou_device_of
	movs	r2, r0
	ldr	r3, [r7]
	movs	r1, r3
	movs	r0, r2
	bl	chip_uart_int_set
	movs	r3, r0
	str	r3, [r7, #12]
	.loc 1 208 0
	ldr	r3, [r7, #12]
	.loc 1 209 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 216 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI37:
	sub	sp, sp, #8
.LCFI38:
	add	r7, sp, #0
.LCFI39:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 217 0
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	caribou_device_of
	movs	r2, r0
	ldr	r3, [r7]
	movs	r1, r3
	movs	r0, r2
	bl	chip_uart_tx_data
	.loc 1 218 0
	nop
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 224 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI40:
	sub	sp, sp, #8
.LCFI41:
	add	r7, sp, #0
.LCFI42:
	str	r0, [r7, #4]
	.loc 1 225 0
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	caribou_device_of
	movs	r3, r0
	movs	r0, r3
	bl	chip_uart_rx_data
	movs	r3, r0
	.loc 1 226 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 232 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI43:
	sub	sp, sp, #8
.LCFI44:
	add	r7, sp, #0
.LCFI45:
	str	r0, [r7, #4]
	.loc 1 233 0
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	caribou_device_of
	movs	r3, r0
	movs	r0, r3
	bl	chip_uart_tx_busy
	movs	r3, r0
	uxtb	r3, r3
	.loc 1 234 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 240 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI46:
	sub	sp, sp, #8
.LCFI47:
	add	r7, sp, #0
.LCFI48:
	str	r0, [r7, #4]
	.loc 1 241 0
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	caribou_device_of
	movs	r3, r0
	movs	r0, r3
	bl	chip_uart_tx_ready
	movs	r3, r0
	.loc 1 242 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 248 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI49:
	sub	sp, sp, #8
.LCFI50:
	add	r7, sp, #0
.LCFI51:
	str	r0, [r7, #4]
	.loc 1 249 0
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	caribou_device_of
	movs	r3, r0
	movs	r0, r3
	bl	chip_uart_rx_ready
	movs	r3, r0
	.loc 1 250 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 253 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI52:
	sub	sp, sp, #8
.LCFI53:
	add	r7, sp, #0
.LCFI54:
	str	r0, [r7, #4]
	.loc 1 254 0
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	caribou_device_of
	movs	r3, r0
	movs	r0, r3
	bl	chip_uart_enable
	.loc 1 255 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 258 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI55:
	sub	sp, sp, #8
.LCFI56:
	add	r7, sp, #0
.LCFI57:
	str	r0, [r7, #4]
	.loc 1 259 0
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	caribou_device_of
	movs	r3, r0
	movs	r0, r3
	bl	chip_uart_disable
	.loc 1 260 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 265 0
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
.LCFI58:
	sub	sp, sp, #36
.LCFI59:
	add	r7, sp, #0
.LCFI60:
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	.loc 1 266 0
	movs	r3, #0
	str	r3, [r7, #28]
	.loc 1 267 0
	ldr	r3, [r7, #8]
	str	r3, [r7, #24]
	.loc 1 268 0
	b	.L52
.L54:
.LBB3:
	.loc 1 271 0
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	movs	r0, r3
	bl	chip_uart_rx_queue
	movs	r3, r0
	movs	r0, r3
	bl	caribou_bytequeue_get
	movs	r3, r0
	str	r3, [r7, #20]
	ldr	r3, [r7, #20]
	cmp	r3, #0
	blt	.L53
	.loc 1 273 0
	ldr	r3, [r7, #28]
	adds	r2, r3, #1
	str	r2, [r7, #28]
	movs	r2, r3
	ldr	r3, [r7, #24]
	adds	r3, r3, r2
	ldr	r2, [r7, #20]
	uxtb	r2, r2
	strb	r2, [r3]
	.loc 1 274 0
	ldr	r3, [r7, #12]
	ldr	r4, [r3]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	movs	r0, r3
	bl	chip_uart_status
	movs	r2, r0
	movs	r3, #1
	orrs	r3, r2
	movs	r1, r3
	movs	r0, r4
	bl	chip_uart_set_status
	b	.L52
.L53:
	.loc 1 278 0
	bl	caribou_thread_yield
.L52:
.LBE3:
	.loc 1 268 0
	ldr	r2, [r7, #28]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	blt	.L54
	.loc 1 281 0
	ldr	r3, [r7, #28]
	.loc 1 282 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r7, pc}
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
	.loc 1 286 0
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI61:
	sub	sp, sp, #24
.LCFI62:
	add	r7, sp, #0
.LCFI63:
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	.loc 1 287 0
	movs	r3, #0
	str	r3, [r7, #20]
	.loc 1 288 0
	ldr	r3, [r7, #8]
	str	r3, [r7, #16]
	.loc 1 289 0
	b	.L57
.L60:
	.loc 1 292 0
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	movs	r0, r3
	bl	chip_uart_tx_queue
	ldr	r3, [r7, #20]
	ldr	r2, [r7, #16]
	adds	r3, r2, r3
	ldrb	r3, [r3]
	movs	r1, r3
	bl	caribou_bytequeue_put
	subs	r3, r0, #0
	beq	.L58
	.loc 1 294 0
	ldr	r3, [r7, #20]
	adds	r3, r3, #1
	str	r3, [r7, #20]
	b	.L59
.L58:
	.loc 1 298 0
	bl	caribou_thread_yield
.L59:
	.loc 1 301 0
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	movs	r0, r3
	bl	chip_uart_tx_start
.L57:
	.loc 1 289 0
	ldr	r2, [r7, #20]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	blt	.L60
	.loc 1 303 0
	ldr	r3, [r7, #20]
	.loc 1 305 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #24
	@ sp needed
	pop	{r7, pc}
.LFE53:
	.size	caribou_uart_private_writefn, .-caribou_uart_private_writefn
	.section	.text.caribou_uart_private_flush,"ax",%progbits
	.align	2
	.global	caribou_uart_private_flush
	.code	16
	.thumb_func
	.type	caribou_uart_private_flush, %function
caribou_uart_private_flush:
.LFB54:
	.loc 1 308 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI64:
	sub	sp, sp, #16
.LCFI65:
	add	r7, sp, #0
.LCFI66:
	str	r0, [r7, #4]
	.loc 1 309 0
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	_fd
	movs	r3, r0
	str	r3, [r7, #12]
	.loc 1 310 0
	b	.L63
.L64:
	.loc 1 312 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r0, r3
	bl	chip_uart_tx_start
	.loc 1 313 0
	bl	caribou_thread_yield
.L63:
	.loc 1 310 0
	ldr	r3, [r7, #12]
	movs	r0, r3
	bl	caribou_uart_tx_queue
	movs	r3, r0
	movs	r0, r3
	bl	caribou_bytequeue_empty
	subs	r3, r0, #0
	beq	.L64
.LBB4:
	.loc 1 315 0
	b	.L65
.L66:
	.loc 1 317 0
	bl	caribou_thread_yield
.L65:
	.loc 1 315 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r0, r3
	bl	chip_uart_tx_busy
	subs	r3, r0, #0
	bne	.L66
.LBE4:
	.loc 1 319 0
	movs	r3, #0
	.loc 1 320 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE54:
	.size	caribou_uart_private_flush, .-caribou_uart_private_flush
	.section	.text.caribou_uart_private_readqueuefn,"ax",%progbits
	.align	2
	.global	caribou_uart_private_readqueuefn
	.code	16
	.thumb_func
	.type	caribou_uart_private_readqueuefn, %function
caribou_uart_private_readqueuefn:
.LFB55:
	.loc 1 324 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI67:
	sub	sp, sp, #8
.LCFI68:
	add	r7, sp, #0
.LCFI69:
	str	r0, [r7, #4]
	.loc 1 325 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r0, r3
	bl	chip_uart_rx_queue
	movs	r3, r0
	movs	r0, r3
	bl	caribou_bytequeue_level
	movs	r3, r0
	.loc 1 326 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE55:
	.size	caribou_uart_private_readqueuefn, .-caribou_uart_private_readqueuefn
	.section	.text.caribou_uart_private_writequeuefn,"ax",%progbits
	.align	2
	.global	caribou_uart_private_writequeuefn
	.code	16
	.thumb_func
	.type	caribou_uart_private_writequeuefn, %function
caribou_uart_private_writequeuefn:
.LFB56:
	.loc 1 330 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI70:
	sub	sp, sp, #8
.LCFI71:
	add	r7, sp, #0
.LCFI72:
	str	r0, [r7, #4]
	.loc 1 331 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r0, r3
	bl	chip_uart_tx_queue
	movs	r3, r0
	movs	r0, r3
	bl	caribou_bytequeue_level
	movs	r3, r0
	.loc 1 332 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE56:
	.size	caribou_uart_private_writequeuefn, .-caribou_uart_private_writequeuefn
	.section	.text.caribou_uart_private_statefn,"ax",%progbits
	.align	2
	.global	caribou_uart_private_statefn
	.code	16
	.thumb_func
	.type	caribou_uart_private_statefn, %function
caribou_uart_private_statefn:
.LFB57:
	.loc 1 336 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI73:
	sub	sp, sp, #8
.LCFI74:
	add	r7, sp, #0
.LCFI75:
	str	r0, [r7, #4]
	.loc 1 337 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r0, r3
	bl	chip_uart_status
	movs	r3, r0
	.loc 1 338 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE57:
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
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.byte	0x4
	.4byte	.LCFI0-.LFB32
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI1-.LCFI0
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI2-.LCFI1
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.byte	0x4
	.4byte	.LCFI3-.LFB33
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI4-.LCFI3
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI5-.LCFI4
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.byte	0x4
	.4byte	.LCFI6-.LFB34
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI7-.LCFI6
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI8-.LCFI7
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE4:
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.byte	0x4
	.4byte	.LCFI9-.LFB35
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI10-.LCFI9
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI11-.LCFI10
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE6:
.LSFDE8:
	.4byte	.LEFDE8-.LASFDE8
.LASFDE8:
	.4byte	.Lframe0
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.byte	0x4
	.4byte	.LCFI12-.LFB36
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI13-.LCFI12
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI14-.LCFI13
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE8:
.LSFDE10:
	.4byte	.LEFDE10-.LASFDE10
.LASFDE10:
	.4byte	.Lframe0
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.byte	0x4
	.4byte	.LCFI15-.LFB37
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI16-.LCFI15
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE10:
.LSFDE12:
	.4byte	.LEFDE12-.LASFDE12
.LASFDE12:
	.4byte	.Lframe0
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.byte	0x4
	.4byte	.LCFI17-.LFB38
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI18-.LCFI17
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE12:
.LSFDE14:
	.4byte	.LEFDE14-.LASFDE14
.LASFDE14:
	.4byte	.Lframe0
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.byte	0x4
	.4byte	.LCFI19-.LFB39
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI20-.LCFI19
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI21-.LCFI20
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE14:
.LSFDE16:
	.4byte	.LEFDE16-.LASFDE16
.LASFDE16:
	.4byte	.Lframe0
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.byte	0x4
	.4byte	.LCFI22-.LFB40
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI23-.LCFI22
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI24-.LCFI23
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE16:
.LSFDE18:
	.4byte	.LEFDE18-.LASFDE18
.LASFDE18:
	.4byte	.Lframe0
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.byte	0x4
	.4byte	.LCFI25-.LFB41
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI26-.LCFI25
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI27-.LCFI26
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE18:
.LSFDE20:
	.4byte	.LEFDE20-.LASFDE20
.LASFDE20:
	.4byte	.Lframe0
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.byte	0x4
	.4byte	.LCFI28-.LFB42
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI29-.LCFI28
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI30-.LCFI29
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE20:
.LSFDE22:
	.4byte	.LEFDE22-.LASFDE22
.LASFDE22:
	.4byte	.Lframe0
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.byte	0x4
	.4byte	.LCFI31-.LFB43
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI32-.LCFI31
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI33-.LCFI32
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE22:
.LSFDE24:
	.4byte	.LEFDE24-.LASFDE24
.LASFDE24:
	.4byte	.Lframe0
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.byte	0x4
	.4byte	.LCFI34-.LFB44
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI35-.LCFI34
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI36-.LCFI35
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE24:
.LSFDE26:
	.4byte	.LEFDE26-.LASFDE26
.LASFDE26:
	.4byte	.Lframe0
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.byte	0x4
	.4byte	.LCFI37-.LFB45
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI38-.LCFI37
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI39-.LCFI38
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE26:
.LSFDE28:
	.4byte	.LEFDE28-.LASFDE28
.LASFDE28:
	.4byte	.Lframe0
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.byte	0x4
	.4byte	.LCFI40-.LFB46
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI41-.LCFI40
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI42-.LCFI41
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE28:
.LSFDE30:
	.4byte	.LEFDE30-.LASFDE30
.LASFDE30:
	.4byte	.Lframe0
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.byte	0x4
	.4byte	.LCFI43-.LFB47
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI44-.LCFI43
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI45-.LCFI44
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE30:
.LSFDE32:
	.4byte	.LEFDE32-.LASFDE32
.LASFDE32:
	.4byte	.Lframe0
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.byte	0x4
	.4byte	.LCFI46-.LFB48
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI47-.LCFI46
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI48-.LCFI47
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE32:
.LSFDE34:
	.4byte	.LEFDE34-.LASFDE34
.LASFDE34:
	.4byte	.Lframe0
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.byte	0x4
	.4byte	.LCFI49-.LFB49
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI50-.LCFI49
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI51-.LCFI50
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE34:
.LSFDE36:
	.4byte	.LEFDE36-.LASFDE36
.LASFDE36:
	.4byte	.Lframe0
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.byte	0x4
	.4byte	.LCFI52-.LFB50
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI53-.LCFI52
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI54-.LCFI53
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE36:
.LSFDE38:
	.4byte	.LEFDE38-.LASFDE38
.LASFDE38:
	.4byte	.Lframe0
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.byte	0x4
	.4byte	.LCFI55-.LFB51
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI56-.LCFI55
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI57-.LCFI56
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE38:
.LSFDE40:
	.4byte	.LEFDE40-.LASFDE40
.LASFDE40:
	.4byte	.Lframe0
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
	.byte	0x4
	.4byte	.LCFI58-.LFB52
	.byte	0xe
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI59-.LCFI58
	.byte	0xe
	.uleb128 0x30
	.byte	0x4
	.4byte	.LCFI60-.LCFI59
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE40:
.LSFDE42:
	.4byte	.LEFDE42-.LASFDE42
.LASFDE42:
	.4byte	.Lframe0
	.4byte	.LFB53
	.4byte	.LFE53-.LFB53
	.byte	0x4
	.4byte	.LCFI61-.LFB53
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI62-.LCFI61
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI63-.LCFI62
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE42:
.LSFDE44:
	.4byte	.LEFDE44-.LASFDE44
.LASFDE44:
	.4byte	.Lframe0
	.4byte	.LFB54
	.4byte	.LFE54-.LFB54
	.byte	0x4
	.4byte	.LCFI64-.LFB54
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI65-.LCFI64
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI66-.LCFI65
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE44:
.LSFDE46:
	.4byte	.LEFDE46-.LASFDE46
.LASFDE46:
	.4byte	.Lframe0
	.4byte	.LFB55
	.4byte	.LFE55-.LFB55
	.byte	0x4
	.4byte	.LCFI67-.LFB55
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI68-.LCFI67
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI69-.LCFI68
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE46:
.LSFDE48:
	.4byte	.LEFDE48-.LASFDE48
.LASFDE48:
	.4byte	.Lframe0
	.4byte	.LFB56
	.4byte	.LFE56-.LFB56
	.byte	0x4
	.4byte	.LCFI70-.LFB56
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI71-.LCFI70
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI72-.LCFI71
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE48:
.LSFDE50:
	.4byte	.LEFDE50-.LASFDE50
.LASFDE50:
	.4byte	.Lframe0
	.4byte	.LFB57
	.4byte	.LFE57-.LFB57
	.byte	0x4
	.4byte	.LCFI73-.LFB57
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI74-.LCFI73
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI75-.LCFI74
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE50:
	.text
.Letext0:
	.file 2 "/usr/share/crossworks_for_arm_3.7/include/stdint.h"
	.file 3 "../../../../include/caribou/lib/errno.h"
	.file 4 "../../../../include/caribou/lib/stdio.h"
	.file 5 "../../../../include/caribou/lib/mutex.h"
	.file 6 "../../../../include/caribou/lib/bytequeue.h"
	.file 7 "../../../../include/caribou/dev/uart.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x9cc
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF126
	.byte	0xc
	.4byte	.LASF127
	.4byte	.LASF128
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
	.uleb128 0x3
	.4byte	.LASF3
	.byte	0x2
	.byte	0xf
	.4byte	0x37
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF2
	.uleb128 0x3
	.4byte	.LASF4
	.byte	0x2
	.byte	0x15
	.4byte	0x50
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF5
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF6
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF7
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x5
	.byte	0x4
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF9
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF10
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF11
	.uleb128 0x6
	.4byte	.LASF12
	.byte	0x3
	.2byte	0x108
	.4byte	0x57
	.uleb128 0x7
	.4byte	.LASF129
	.byte	0x18
	.byte	0x4
	.byte	0x1f
	.4byte	0xeb
	.uleb128 0x8
	.4byte	.LASF13
	.byte	0x4
	.byte	0x21
	.4byte	0x73
	.byte	0
	.uleb128 0x8
	.4byte	.LASF14
	.byte	0x4
	.byte	0x22
	.4byte	0x10a
	.byte	0x4
	.uleb128 0x8
	.4byte	.LASF15
	.byte	0x4
	.byte	0x23
	.4byte	0x10a
	.byte	0x8
	.uleb128 0x8
	.4byte	.LASF16
	.byte	0x4
	.byte	0x24
	.4byte	0x11f
	.byte	0xc
	.uleb128 0x8
	.4byte	.LASF17
	.byte	0x4
	.byte	0x25
	.4byte	0x11f
	.byte	0x10
	.uleb128 0x8
	.4byte	.LASF18
	.byte	0x4
	.byte	0x26
	.4byte	0x11f
	.byte	0x14
	.byte	0
	.uleb128 0x9
	.4byte	0x57
	.4byte	0x104
	.uleb128 0xa
	.4byte	0x104
	.uleb128 0xa
	.4byte	0x73
	.uleb128 0xa
	.4byte	0x57
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.4byte	0x96
	.uleb128 0xb
	.byte	0x4
	.4byte	0xeb
	.uleb128 0x9
	.4byte	0x57
	.4byte	0x11f
	.uleb128 0xa
	.4byte	0x104
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.4byte	0x110
	.uleb128 0x3
	.4byte	.LASF19
	.byte	0x4
	.byte	0x27
	.4byte	0x96
	.uleb128 0xc
	.byte	0x8
	.byte	0x5
	.byte	0x1e
	.4byte	0x169
	.uleb128 0x8
	.4byte	.LASF20
	.byte	0x5
	.byte	0x20
	.4byte	0x73
	.byte	0
	.uleb128 0x8
	.4byte	.LASF21
	.byte	0x5
	.byte	0x21
	.4byte	0x45
	.byte	0x4
	.uleb128 0x8
	.4byte	.LASF22
	.byte	0x5
	.byte	0x22
	.4byte	0x2c
	.byte	0x6
	.uleb128 0x8
	.4byte	.LASF23
	.byte	0x5
	.byte	0x23
	.4byte	0x2c
	.byte	0x7
	.byte	0
	.uleb128 0x3
	.4byte	.LASF24
	.byte	0x5
	.byte	0x24
	.4byte	0x130
	.uleb128 0xc
	.byte	0xc
	.byte	0x6
	.byte	0x1d
	.4byte	0x1ad
	.uleb128 0x8
	.4byte	.LASF25
	.byte	0x6
	.byte	0x1f
	.4byte	0x1ad
	.byte	0
	.uleb128 0x8
	.4byte	.LASF26
	.byte	0x6
	.byte	0x20
	.4byte	0x45
	.byte	0x4
	.uleb128 0x8
	.4byte	.LASF27
	.byte	0x6
	.byte	0x21
	.4byte	0x45
	.byte	0x6
	.uleb128 0x8
	.4byte	.LASF28
	.byte	0x6
	.byte	0x22
	.4byte	0x45
	.byte	0x8
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.4byte	0x2c
	.uleb128 0x3
	.4byte	.LASF29
	.byte	0x6
	.byte	0x23
	.4byte	0x174
	.uleb128 0xd
	.byte	0x4
	.4byte	0x5e
	.byte	0x7
	.byte	0x34
	.4byte	0x2a5
	.uleb128 0xe
	.4byte	.LASF30
	.byte	0x6e
	.uleb128 0xf
	.4byte	.LASF31
	.2byte	0x12c
	.uleb128 0xf
	.4byte	.LASF32
	.2byte	0x258
	.uleb128 0xf
	.4byte	.LASF33
	.2byte	0x4b0
	.uleb128 0xf
	.4byte	.LASF34
	.2byte	0x960
	.uleb128 0xf
	.4byte	.LASF35
	.2byte	0x12c0
	.uleb128 0xf
	.4byte	.LASF36
	.2byte	0x2580
	.uleb128 0xf
	.4byte	.LASF37
	.2byte	0x4b00
	.uleb128 0xf
	.4byte	.LASF38
	.2byte	0x7080
	.uleb128 0xf
	.4byte	.LASF39
	.2byte	0x9600
	.uleb128 0xf
	.4byte	.LASF40
	.2byte	0xdac0
	.uleb128 0xf
	.4byte	.LASF41
	.2byte	0xe100
	.uleb128 0x10
	.4byte	.LASF42
	.4byte	0x1c200
	.uleb128 0x10
	.4byte	.LASF43
	.4byte	0x1f400
	.uleb128 0x10
	.4byte	.LASF44
	.4byte	0x25800
	.uleb128 0x10
	.4byte	.LASF45
	.4byte	0x38400
	.uleb128 0x10
	.4byte	.LASF46
	.4byte	0x3e800
	.uleb128 0x10
	.4byte	.LASF47
	.4byte	0x70800
	.uleb128 0x10
	.4byte	.LASF48
	.4byte	0xe1000
	.uleb128 0x10
	.4byte	.LASF49
	.4byte	0x1b5800
	.uleb128 0x10
	.4byte	.LASF50
	.4byte	0x1c2000
	.uleb128 0x10
	.4byte	.LASF51
	.4byte	0x36b000
	.uleb128 0x10
	.4byte	.LASF52
	.4byte	0x384000
	.uleb128 0x10
	.4byte	.LASF53
	.4byte	0x6d6000
	.uleb128 0x10
	.4byte	.LASF54
	.4byte	0x708000
	.uleb128 0x10
	.4byte	.LASF55
	.4byte	0x895440
	.uleb128 0x10
	.4byte	.LASF56
	.4byte	0xa037a0
	.byte	0
	.uleb128 0x3
	.4byte	.LASF57
	.byte	0x7
	.byte	0x50
	.4byte	0x1be
	.uleb128 0xd
	.byte	0x1
	.4byte	0x37
	.byte	0x7
	.byte	0x54
	.4byte	0x2db
	.uleb128 0xe
	.4byte	.LASF58
	.byte	0x5
	.uleb128 0xe
	.4byte	.LASF59
	.byte	0x6
	.uleb128 0xe
	.4byte	.LASF60
	.byte	0x7
	.uleb128 0xe
	.4byte	.LASF61
	.byte	0x8
	.uleb128 0xe
	.4byte	.LASF62
	.byte	0x9
	.byte	0
	.uleb128 0x3
	.4byte	.LASF63
	.byte	0x7
	.byte	0x5a
	.4byte	0x2b0
	.uleb128 0xd
	.byte	0x1
	.4byte	0x37
	.byte	0x7
	.byte	0x5e
	.4byte	0x30b
	.uleb128 0xe
	.4byte	.LASF64
	.byte	0
	.uleb128 0xe
	.4byte	.LASF65
	.byte	0x1
	.uleb128 0xe
	.4byte	.LASF66
	.byte	0x2
	.uleb128 0xe
	.4byte	.LASF67
	.byte	0x3
	.byte	0
	.uleb128 0x3
	.4byte	.LASF68
	.byte	0x7
	.byte	0x63
	.4byte	0x2e6
	.uleb128 0xd
	.byte	0x1
	.4byte	0x37
	.byte	0x7
	.byte	0x67
	.4byte	0x335
	.uleb128 0xe
	.4byte	.LASF69
	.byte	0
	.uleb128 0xe
	.4byte	.LASF70
	.byte	0x1
	.uleb128 0xe
	.4byte	.LASF71
	.byte	0x2
	.byte	0
	.uleb128 0x3
	.4byte	.LASF72
	.byte	0x7
	.byte	0x6b
	.4byte	0x316
	.uleb128 0xd
	.byte	0x1
	.4byte	0x37
	.byte	0x7
	.byte	0x6f
	.4byte	0x365
	.uleb128 0xe
	.4byte	.LASF73
	.byte	0
	.uleb128 0xe
	.4byte	.LASF74
	.byte	0x1
	.uleb128 0xe
	.4byte	.LASF75
	.byte	0x2
	.uleb128 0xe
	.4byte	.LASF76
	.byte	0x3
	.byte	0
	.uleb128 0x3
	.4byte	.LASF77
	.byte	0x7
	.byte	0x74
	.4byte	0x340
	.uleb128 0xd
	.byte	0x1
	.4byte	0x37
	.byte	0x7
	.byte	0x78
	.4byte	0x395
	.uleb128 0xe
	.4byte	.LASF78
	.byte	0
	.uleb128 0xe
	.4byte	.LASF79
	.byte	0x1
	.uleb128 0xe
	.4byte	.LASF80
	.byte	0x2
	.uleb128 0xe
	.4byte	.LASF81
	.byte	0x3
	.byte	0
	.uleb128 0x3
	.4byte	.LASF82
	.byte	0x7
	.byte	0x7d
	.4byte	0x370
	.uleb128 0xc
	.byte	0xc
	.byte	0x7
	.byte	0x7f
	.4byte	0x3f1
	.uleb128 0x8
	.4byte	.LASF83
	.byte	0x7
	.byte	0x81
	.4byte	0x2a5
	.byte	0
	.uleb128 0x8
	.4byte	.LASF84
	.byte	0x7
	.byte	0x82
	.4byte	0x2db
	.byte	0x4
	.uleb128 0x8
	.4byte	.LASF85
	.byte	0x7
	.byte	0x83
	.4byte	0x30b
	.byte	0x5
	.uleb128 0x8
	.4byte	.LASF86
	.byte	0x7
	.byte	0x84
	.4byte	0x335
	.byte	0x6
	.uleb128 0x8
	.4byte	.LASF87
	.byte	0x7
	.byte	0x85
	.4byte	0x365
	.byte	0x7
	.uleb128 0x8
	.4byte	.LASF88
	.byte	0x7
	.byte	0x86
	.4byte	0x395
	.byte	0x8
	.byte	0
	.uleb128 0x3
	.4byte	.LASF89
	.byte	0x7
	.byte	0x87
	.4byte	0x3a0
	.uleb128 0x11
	.4byte	.LASF91
	.byte	0x1
	.byte	0x20
	.4byte	0x43e
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x43e
	.uleb128 0x12
	.ascii	"fd\000"
	.byte	0x1
	.byte	0x20
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x13
	.ascii	"io\000"
	.byte	0x1
	.byte	0x22
	.4byte	0x444
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x14
	.4byte	.LASF90
	.byte	0x1
	.byte	0x23
	.4byte	0x73
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.4byte	0x73
	.uleb128 0xb
	.byte	0x4
	.4byte	0x125
	.uleb128 0x15
	.4byte	.LASF92
	.byte	0x1
	.byte	0x2c
	.4byte	0x57
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4b2
	.uleb128 0x16
	.4byte	.LASF93
	.byte	0x1
	.byte	0x2c
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x16
	.4byte	.LASF94
	.byte	0x1
	.byte	0x2c
	.4byte	0x4b2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x13
	.ascii	"fd\000"
	.byte	0x1
	.byte	0x2e
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x17
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.uleb128 0x13
	.ascii	"io\000"
	.byte	0x1
	.byte	0x33
	.4byte	0x444
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x14
	.4byte	.LASF90
	.byte	0x1
	.byte	0x34
	.4byte	0x73
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.4byte	0x3f1
	.uleb128 0x15
	.4byte	.LASF95
	.byte	0x1
	.byte	0x60
	.4byte	0x57
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x507
	.uleb128 0x12
	.ascii	"fd\000"
	.byte	0x1
	.byte	0x60
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x13
	.ascii	"rc\000"
	.byte	0x1
	.byte	0x62
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x13
	.ascii	"io\000"
	.byte	0x1
	.byte	0x65
	.4byte	0x444
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x14
	.4byte	.LASF90
	.byte	0x1
	.byte	0x66
	.4byte	0x73
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x18
	.4byte	.LASF111
	.byte	0x1
	.byte	0x75
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x52b
	.uleb128 0x16
	.4byte	.LASF94
	.byte	0x1
	.byte	0x75
	.4byte	0x4b2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x15
	.4byte	.LASF96
	.byte	0x1
	.byte	0x87
	.4byte	0x57
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x56d
	.uleb128 0x12
	.ascii	"fd\000"
	.byte	0x1
	.byte	0x87
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x16
	.4byte	.LASF94
	.byte	0x1
	.byte	0x87
	.4byte	0x4b2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x13
	.ascii	"rc\000"
	.byte	0x1
	.byte	0x89
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x19
	.4byte	.LASF97
	.byte	0x1
	.byte	0x90
	.4byte	0x57
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x19
	.4byte	.LASF98
	.byte	0x1
	.byte	0x98
	.4byte	0x57
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x15
	.4byte	.LASF99
	.byte	0x1
	.byte	0x9d
	.4byte	0x5be
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5be
	.uleb128 0x12
	.ascii	"fd\000"
	.byte	0x1
	.byte	0x9d
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.4byte	0x1b3
	.uleb128 0x15
	.4byte	.LASF100
	.byte	0x1
	.byte	0xa2
	.4byte	0x5be
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5eb
	.uleb128 0x12
	.ascii	"fd\000"
	.byte	0x1
	.byte	0xa2
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x15
	.4byte	.LASF101
	.byte	0x1
	.byte	0xac
	.4byte	0x57
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x61f
	.uleb128 0x12
	.ascii	"fd\000"
	.byte	0x1
	.byte	0xac
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x13
	.ascii	"rc\000"
	.byte	0x1
	.byte	0xae
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x15
	.4byte	.LASF102
	.byte	0x1
	.byte	0xb7
	.4byte	0x57
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x653
	.uleb128 0x12
	.ascii	"fd\000"
	.byte	0x1
	.byte	0xb7
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x13
	.ascii	"rc\000"
	.byte	0x1
	.byte	0xb9
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x15
	.4byte	.LASF103
	.byte	0x1
	.byte	0xc2
	.4byte	0x57
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x687
	.uleb128 0x12
	.ascii	"fd\000"
	.byte	0x1
	.byte	0xc2
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x13
	.ascii	"rc\000"
	.byte	0x1
	.byte	0xc4
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x15
	.4byte	.LASF104
	.byte	0x1
	.byte	0xcd
	.4byte	0x57
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6c9
	.uleb128 0x12
	.ascii	"fd\000"
	.byte	0x1
	.byte	0xcd
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x16
	.4byte	.LASF105
	.byte	0x1
	.byte	0xcd
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x13
	.ascii	"rc\000"
	.byte	0x1
	.byte	0xcf
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x15
	.4byte	.LASF106
	.byte	0x1
	.byte	0xd7
	.4byte	0x57
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6fd
	.uleb128 0x12
	.ascii	"fd\000"
	.byte	0x1
	.byte	0xd7
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x12
	.ascii	"ch\000"
	.byte	0x1
	.byte	0xd7
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x15
	.4byte	.LASF107
	.byte	0x1
	.byte	0xdf
	.4byte	0x57
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x724
	.uleb128 0x12
	.ascii	"fd\000"
	.byte	0x1
	.byte	0xdf
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x15
	.4byte	.LASF108
	.byte	0x1
	.byte	0xe7
	.4byte	0x7c
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x758
	.uleb128 0x12
	.ascii	"fd\000"
	.byte	0x1
	.byte	0xe7
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1a
	.4byte	.LASF119
	.byte	0x1
	.byte	0xe9
	.4byte	0x57
	.uleb128 0x1b
	.byte	0
	.byte	0
	.uleb128 0x15
	.4byte	.LASF109
	.byte	0x1
	.byte	0xef
	.4byte	0x7c
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x77f
	.uleb128 0x12
	.ascii	"fd\000"
	.byte	0x1
	.byte	0xef
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x15
	.4byte	.LASF110
	.byte	0x1
	.byte	0xf7
	.4byte	0x7c
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x7a6
	.uleb128 0x12
	.ascii	"fd\000"
	.byte	0x1
	.byte	0xf7
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x18
	.4byte	.LASF112
	.byte	0x1
	.byte	0xfc
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x7c9
	.uleb128 0x12
	.ascii	"fd\000"
	.byte	0x1
	.byte	0xfc
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x1c
	.4byte	.LASF113
	.byte	0x1
	.2byte	0x101
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x7ee
	.uleb128 0x1d
	.ascii	"fd\000"
	.byte	0x1
	.2byte	0x101
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF114
	.byte	0x1
	.2byte	0x108
	.4byte	0x57
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x867
	.uleb128 0x1d
	.ascii	"io\000"
	.byte	0x1
	.2byte	0x108
	.4byte	0x444
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1f
	.4byte	.LASF115
	.byte	0x1
	.2byte	0x108
	.4byte	0x73
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1f
	.4byte	.LASF116
	.byte	0x1
	.2byte	0x108
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x20
	.ascii	"rc\000"
	.byte	0x1
	.2byte	0x10a
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x20
	.ascii	"p\000"
	.byte	0x1
	.2byte	0x10b
	.4byte	0x1ad
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x17
	.4byte	.LBB3
	.4byte	.LBE3-.LBB3
	.uleb128 0x20
	.ascii	"c\000"
	.byte	0x1
	.2byte	0x10e
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF117
	.byte	0x1
	.2byte	0x11d
	.4byte	0x57
	.4byte	.LFB53
	.4byte	.LFE53-.LFB53
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x8c9
	.uleb128 0x1d
	.ascii	"io\000"
	.byte	0x1
	.2byte	0x11d
	.4byte	0x444
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1f
	.4byte	.LASF115
	.byte	0x1
	.2byte	0x11d
	.4byte	0x73
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1f
	.4byte	.LASF116
	.byte	0x1
	.2byte	0x11d
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x20
	.ascii	"rc\000"
	.byte	0x1
	.2byte	0x11f
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x20
	.ascii	"p\000"
	.byte	0x1
	.2byte	0x120
	.4byte	0x1ad
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF118
	.byte	0x1
	.2byte	0x133
	.4byte	0x57
	.4byte	.LFB54
	.4byte	.LFE54-.LFB54
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x917
	.uleb128 0x1d
	.ascii	"io\000"
	.byte	0x1
	.2byte	0x133
	.4byte	0x444
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x20
	.ascii	"fd\000"
	.byte	0x1
	.2byte	0x135
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x17
	.4byte	.LBB4
	.4byte	.LBE4-.LBB4
	.uleb128 0x1a
	.4byte	.LASF119
	.byte	0x1
	.byte	0xe9
	.4byte	0x57
	.uleb128 0x1b
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF120
	.byte	0x1
	.2byte	0x143
	.4byte	0x57
	.4byte	.LFB55
	.4byte	.LFE55-.LFB55
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x940
	.uleb128 0x1d
	.ascii	"io\000"
	.byte	0x1
	.2byte	0x143
	.4byte	0x444
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF121
	.byte	0x1
	.2byte	0x149
	.4byte	0x57
	.4byte	.LFB56
	.4byte	.LFE56-.LFB56
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x969
	.uleb128 0x1d
	.ascii	"io\000"
	.byte	0x1
	.2byte	0x149
	.4byte	0x444
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF122
	.byte	0x1
	.2byte	0x14f
	.4byte	0x57
	.4byte	.LFB57
	.4byte	.LFE57-.LFB57
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x992
	.uleb128 0x1d
	.ascii	"io\000"
	.byte	0x1
	.2byte	0x14f
	.4byte	0x444
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x21
	.4byte	.LASF123
	.byte	0x3
	.2byte	0x109
	.4byte	0x8a
	.uleb128 0x22
	.4byte	0x9a9
	.4byte	0x9a9
	.uleb128 0x23
	.byte	0
	.uleb128 0x24
	.4byte	0x125
	.uleb128 0x25
	.4byte	.LASF124
	.byte	0x4
	.byte	0x29
	.4byte	0x9b9
	.uleb128 0x24
	.4byte	0x99e
	.uleb128 0x26
	.4byte	.LASF125
	.byte	0x1
	.byte	0x1d
	.4byte	0x169
	.uleb128 0x5
	.byte	0x3
	.4byte	uart_mutex
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
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x17
	.uleb128 0x2134
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x4
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x11
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
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x15
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
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x16
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x18
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
	.uleb128 0x27
	.uleb128 0x19
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
	.uleb128 0x19
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
	.uleb128 0x49
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
	.uleb128 0x1a
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
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
	.uleb128 0x1d
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x1f
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x21
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_pubnames,"",%progbits
	.4byte	0x868
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x9d0
	.4byte	0x1ca
	.ascii	"CARIBOU_UART_BAUD_RATE_110\000"
	.4byte	0x1d0
	.ascii	"CARIBOU_UART_BAUD_RATE_300\000"
	.4byte	0x1d7
	.ascii	"CARIBOU_UART_BAUD_RATE_600\000"
	.4byte	0x1de
	.ascii	"CARIBOU_UART_BAUD_RATE_1200\000"
	.4byte	0x1e5
	.ascii	"CARIBOU_UART_BAUD_RATE_2400\000"
	.4byte	0x1ec
	.ascii	"CARIBOU_UART_BAUD_RATE_4800\000"
	.4byte	0x1f3
	.ascii	"CARIBOU_UART_BAUD_RATE_9600\000"
	.4byte	0x1fa
	.ascii	"CARIBOU_UART_BAUD_RATE_19200\000"
	.4byte	0x201
	.ascii	"CARIBOU_UART_BAUD_RATE_28800\000"
	.4byte	0x208
	.ascii	"CARIBOU_UART_BAUD_RATE_38400\000"
	.4byte	0x20f
	.ascii	"CARIBOU_UART_BAUD_RATE_56000\000"
	.4byte	0x216
	.ascii	"CARIBOU_UART_BAUD_RATE_57600\000"
	.4byte	0x21d
	.ascii	"CARIBOU_UART_BAUD_RATE_115200\000"
	.4byte	0x226
	.ascii	"CARIBOU_UART_BAUD_RATE_128000\000"
	.4byte	0x22f
	.ascii	"CARIBOU_UART_BAUD_RATE_153600\000"
	.4byte	0x238
	.ascii	"CARIBOU_UART_BAUD_RATE_230400\000"
	.4byte	0x241
	.ascii	"CARIBOU_UART_BAUD_RATE_256000\000"
	.4byte	0x24a
	.ascii	"CARIBOU_UART_BAUD_RATE_460800\000"
	.4byte	0x253
	.ascii	"CARIBOU_UART_BAUD_RATE_921600\000"
	.4byte	0x25c
	.ascii	"CARIBOU_UART_BAUD_RATE_1792000\000"
	.4byte	0x265
	.ascii	"CARIBOU_UART_BAUD_RATE_1843200\000"
	.4byte	0x26e
	.ascii	"CARIBOU_UART_BAUD_RATE_3584000\000"
	.4byte	0x277
	.ascii	"CARIBOU_UART_BAUD_RATE_3686400\000"
	.4byte	0x280
	.ascii	"CARIBOU_UART_BAUD_RATE_7168000\000"
	.4byte	0x289
	.ascii	"CARIBOU_UART_BAUD_RATE_7372800\000"
	.4byte	0x292
	.ascii	"CARIBOU_UART_BAUD_RATE_9000000\000"
	.4byte	0x29b
	.ascii	"CARIBOU_UART_BAUD_RATE_10500000\000"
	.4byte	0x2bc
	.ascii	"CARIBOU_UART_WORDSIZE_5\000"
	.4byte	0x2c2
	.ascii	"CARIBOU_UART_WORDSIZE_6\000"
	.4byte	0x2c8
	.ascii	"CARIBOU_UART_WORDSIZE_7\000"
	.4byte	0x2ce
	.ascii	"CARIBOU_UART_WORDSIZE_8\000"
	.4byte	0x2d4
	.ascii	"CARIBOU_UART_WORDSIZE_9\000"
	.4byte	0x2f2
	.ascii	"CARIBOU_UART_STOPBITS_05\000"
	.4byte	0x2f8
	.ascii	"CARIBOU_UART_STOPBITS_1\000"
	.4byte	0x2fe
	.ascii	"CARIBOU_UART_STOPBITS_15\000"
	.4byte	0x304
	.ascii	"CARIBOU_UART_STOPBITS_2\000"
	.4byte	0x322
	.ascii	"CARIBOU_UART_PARITY_NONE\000"
	.4byte	0x328
	.ascii	"CARIBOU_UART_PARITY_EVEN\000"
	.4byte	0x32e
	.ascii	"CARIBOU_UART_PARITY_ODD\000"
	.4byte	0x34c
	.ascii	"CARIBOU_UART_FLOW_NONE\000"
	.4byte	0x352
	.ascii	"CARIBOU_UART_FLOW_RTS\000"
	.4byte	0x358
	.ascii	"CARIBOU_UART_FLOW_CTS\000"
	.4byte	0x35e
	.ascii	"CARIBOU_UART_FLOW_RTS_CTS\000"
	.4byte	0x3fc
	.ascii	"caribou_device_of\000"
	.4byte	0x44a
	.ascii	"caribou_uart_open\000"
	.4byte	0x4b8
	.ascii	"caribou_uart_close\000"
	.4byte	0x507
	.ascii	"caribou_uart_init_config\000"
	.4byte	0x52b
	.ascii	"caribou_uart_set_config\000"
	.4byte	0x56d
	.ascii	"caribou_uart_queue_tx_sz\000"
	.4byte	0x582
	.ascii	"caribou_uart_queue_rx_sz\000"
	.4byte	0x597
	.ascii	"caribou_uart_rx_queue\000"
	.4byte	0x5c4
	.ascii	"caribou_uart_tx_queue\000"
	.4byte	0x5eb
	.ascii	"caribou_uart_int_enable\000"
	.4byte	0x61f
	.ascii	"caribou_uart_int_disable\000"
	.4byte	0x653
	.ascii	"caribou_uart_int_enabled\000"
	.4byte	0x687
	.ascii	"caribou_uart_int_set\000"
	.4byte	0x6c9
	.ascii	"caribou_uart_tx_data\000"
	.4byte	0x6fd
	.ascii	"caribou_uart_rx_data\000"
	.4byte	0x724
	.ascii	"caribou_uart_tx_busy\000"
	.4byte	0x74a
	.ascii	"chip_uart_tx_busy\000"
	.4byte	0x758
	.ascii	"caribou_uart_tx_ready\000"
	.4byte	0x77f
	.ascii	"caribou_uart_rx_ready\000"
	.4byte	0x7a6
	.ascii	"caribou_uart_enable\000"
	.4byte	0x7c9
	.ascii	"caribou_uart_disable\000"
	.4byte	0x7ee
	.ascii	"caribou_uart_private_readfn\000"
	.4byte	0x867
	.ascii	"caribou_uart_private_writefn\000"
	.4byte	0x8c9
	.ascii	"caribou_uart_private_flush\000"
	.4byte	0x908
	.ascii	"chip_uart_tx_busy\000"
	.4byte	0x917
	.ascii	"caribou_uart_private_readqueuefn\000"
	.4byte	0x940
	.ascii	"caribou_uart_private_writequeuefn\000"
	.4byte	0x969
	.ascii	"caribou_uart_private_statefn\000"
	.4byte	0x9be
	.ascii	"uart_mutex\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0x1d3
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x9d0
	.4byte	0x25
	.ascii	"signed char\000"
	.4byte	0x37
	.ascii	"unsigned char\000"
	.4byte	0x2c
	.ascii	"uint8_t\000"
	.4byte	0x3e
	.ascii	"short int\000"
	.4byte	0x50
	.ascii	"short unsigned int\000"
	.4byte	0x45
	.ascii	"uint16_t\000"
	.4byte	0x57
	.ascii	"int\000"
	.4byte	0x5e
	.ascii	"unsigned int\000"
	.4byte	0x65
	.ascii	"long long int\000"
	.4byte	0x6c
	.ascii	"long long unsigned int\000"
	.4byte	0x75
	.ascii	"long int\000"
	.4byte	0x7c
	.ascii	"char\000"
	.4byte	0x83
	.ascii	"sizetype\000"
	.4byte	0x8a
	.ascii	"errno_t\000"
	.4byte	0x96
	.ascii	"_stdio_t\000"
	.4byte	0x125
	.ascii	"stdio_t\000"
	.4byte	0x169
	.ascii	"caribou_mutex_t\000"
	.4byte	0x1b3
	.ascii	"caribou_bytequeue_t\000"
	.4byte	0x2a5
	.ascii	"caribou_uart_baud_t\000"
	.4byte	0x2db
	.ascii	"caribou_uart_word_t\000"
	.4byte	0x30b
	.ascii	"caribou_uart_stop_t\000"
	.4byte	0x335
	.ascii	"caribou_uart_parity_t\000"
	.4byte	0x365
	.ascii	"caribou_uart_flow_t\000"
	.4byte	0x395
	.ascii	"caribou_uart_dma_t\000"
	.4byte	0x3f1
	.ascii	"caribou_uart_config_t\000"
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0xe4
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
	.4byte	.LFB57
	.4byte	.LFE57-.LFB57
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
	.4byte	.LFB57
	.4byte	.LFE57
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF104:
	.ascii	"caribou_uart_int_set\000"
.LASF41:
	.ascii	"CARIBOU_UART_BAUD_RATE_57600\000"
.LASF86:
	.ascii	"parity_bits\000"
.LASF29:
	.ascii	"caribou_bytequeue_t\000"
.LASF77:
	.ascii	"caribou_uart_flow_t\000"
.LASF31:
	.ascii	"CARIBOU_UART_BAUD_RATE_300\000"
.LASF17:
	.ascii	"writequeuefn\000"
.LASF95:
	.ascii	"caribou_uart_close\000"
.LASF123:
	.ascii	"__errno\000"
.LASF106:
	.ascii	"caribou_uart_tx_data\000"
.LASF22:
	.ascii	"flags\000"
.LASF15:
	.ascii	"writefn\000"
.LASF40:
	.ascii	"CARIBOU_UART_BAUD_RATE_56000\000"
.LASF6:
	.ascii	"unsigned int\000"
.LASF101:
	.ascii	"caribou_uart_int_enable\000"
.LASF69:
	.ascii	"CARIBOU_UART_PARITY_NONE\000"
.LASF27:
	.ascii	"head\000"
.LASF70:
	.ascii	"CARIBOU_UART_PARITY_EVEN\000"
.LASF64:
	.ascii	"CARIBOU_UART_STOPBITS_05\000"
.LASF90:
	.ascii	"device\000"
.LASF42:
	.ascii	"CARIBOU_UART_BAUD_RATE_115200\000"
.LASF112:
	.ascii	"caribou_uart_enable\000"
.LASF34:
	.ascii	"CARIBOU_UART_BAUD_RATE_2400\000"
.LASF49:
	.ascii	"CARIBOU_UART_BAUD_RATE_1792000\000"
.LASF96:
	.ascii	"caribou_uart_set_config\000"
.LASF46:
	.ascii	"CARIBOU_UART_BAUD_RATE_256000\000"
.LASF66:
	.ascii	"CARIBOU_UART_STOPBITS_15\000"
.LASF58:
	.ascii	"CARIBOU_UART_WORDSIZE_5\000"
.LASF59:
	.ascii	"CARIBOU_UART_WORDSIZE_6\000"
.LASF60:
	.ascii	"CARIBOU_UART_WORDSIZE_7\000"
.LASF61:
	.ascii	"CARIBOU_UART_WORDSIZE_8\000"
.LASF44:
	.ascii	"CARIBOU_UART_BAUD_RATE_153600\000"
.LASF72:
	.ascii	"caribou_uart_parity_t\000"
.LASF103:
	.ascii	"caribou_uart_int_enabled\000"
.LASF81:
	.ascii	"CARIBOU_UART_DMA_BOTH\000"
.LASF126:
	.ascii	"GNU C99 5.4.1 20160609 (release) [ARM/embedded-5-br"
	.ascii	"anch revision 237715] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -gpubnames -std=gnu"
	.ascii	"99 -fno-dwarf2-cfi-asm -fno-builtin -ffunction-sect"
	.ascii	"ions -fdata-sections -fshort-double -fshort-enums -"
	.ascii	"fno-common\000"
.LASF110:
	.ascii	"caribou_uart_rx_ready\000"
.LASF91:
	.ascii	"caribou_device_of\000"
.LASF100:
	.ascii	"caribou_uart_tx_queue\000"
.LASF16:
	.ascii	"readqueuefn\000"
.LASF116:
	.ascii	"count\000"
.LASF32:
	.ascii	"CARIBOU_UART_BAUD_RATE_600\000"
.LASF79:
	.ascii	"CARIBOU_UART_DMA_RX\000"
.LASF8:
	.ascii	"long long unsigned int\000"
.LASF117:
	.ascii	"caribou_uart_private_writefn\000"
.LASF113:
	.ascii	"caribou_uart_disable\000"
.LASF121:
	.ascii	"caribou_uart_private_writequeuefn\000"
.LASF128:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f091/crossworks\000"
.LASF55:
	.ascii	"CARIBOU_UART_BAUD_RATE_9000000\000"
.LASF102:
	.ascii	"caribou_uart_int_disable\000"
.LASF120:
	.ascii	"caribou_uart_private_readqueuefn\000"
.LASF53:
	.ascii	"CARIBOU_UART_BAUD_RATE_7168000\000"
.LASF89:
	.ascii	"caribou_uart_config_t\000"
.LASF30:
	.ascii	"CARIBOU_UART_BAUD_RATE_110\000"
.LASF71:
	.ascii	"CARIBOU_UART_PARITY_ODD\000"
.LASF57:
	.ascii	"caribou_uart_baud_t\000"
.LASF68:
	.ascii	"caribou_uart_stop_t\000"
.LASF118:
	.ascii	"caribou_uart_private_flush\000"
.LASF124:
	.ascii	"_stdio_\000"
.LASF80:
	.ascii	"CARIBOU_UART_DMA_TX\000"
.LASF24:
	.ascii	"caribou_mutex_t\000"
.LASF92:
	.ascii	"caribou_uart_open\000"
.LASF10:
	.ascii	"char\000"
.LASF82:
	.ascii	"caribou_uart_dma_t\000"
.LASF93:
	.ascii	"ndev\000"
.LASF115:
	.ascii	"data\000"
.LASF38:
	.ascii	"CARIBOU_UART_BAUD_RATE_28800\000"
.LASF129:
	.ascii	"_stdio_t\000"
.LASF3:
	.ascii	"uint8_t\000"
.LASF99:
	.ascii	"caribou_uart_rx_queue\000"
.LASF52:
	.ascii	"CARIBOU_UART_BAUD_RATE_3686400\000"
.LASF51:
	.ascii	"CARIBOU_UART_BAUD_RATE_3584000\000"
.LASF7:
	.ascii	"long long int\000"
.LASF39:
	.ascii	"CARIBOU_UART_BAUD_RATE_38400\000"
.LASF111:
	.ascii	"caribou_uart_init_config\000"
.LASF73:
	.ascii	"CARIBOU_UART_FLOW_NONE\000"
.LASF26:
	.ascii	"size\000"
.LASF98:
	.ascii	"caribou_uart_queue_rx_sz\000"
.LASF84:
	.ascii	"word_size\000"
.LASF4:
	.ascii	"uint16_t\000"
.LASF23:
	.ascii	"blocking\000"
.LASF62:
	.ascii	"CARIBOU_UART_WORDSIZE_9\000"
.LASF125:
	.ascii	"uart_mutex\000"
.LASF63:
	.ascii	"caribou_uart_word_t\000"
.LASF94:
	.ascii	"config\000"
.LASF2:
	.ascii	"short int\000"
.LASF75:
	.ascii	"CARIBOU_UART_FLOW_CTS\000"
.LASF9:
	.ascii	"long int\000"
.LASF85:
	.ascii	"stop_bits\000"
.LASF47:
	.ascii	"CARIBOU_UART_BAUD_RATE_460800\000"
.LASF88:
	.ascii	"dma_mode\000"
.LASF14:
	.ascii	"readfn\000"
.LASF43:
	.ascii	"CARIBOU_UART_BAUD_RATE_128000\000"
.LASF13:
	.ascii	"device_private\000"
.LASF122:
	.ascii	"caribou_uart_private_statefn\000"
.LASF21:
	.ascii	"locks\000"
.LASF33:
	.ascii	"CARIBOU_UART_BAUD_RATE_1200\000"
.LASF76:
	.ascii	"CARIBOU_UART_FLOW_RTS_CTS\000"
.LASF87:
	.ascii	"flow_control\000"
.LASF11:
	.ascii	"sizetype\000"
.LASF50:
	.ascii	"CARIBOU_UART_BAUD_RATE_1843200\000"
.LASF108:
	.ascii	"caribou_uart_tx_busy\000"
.LASF25:
	.ascii	"queue\000"
.LASF20:
	.ascii	"thread\000"
.LASF74:
	.ascii	"CARIBOU_UART_FLOW_RTS\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF54:
	.ascii	"CARIBOU_UART_BAUD_RATE_7372800\000"
.LASF28:
	.ascii	"tail\000"
.LASF97:
	.ascii	"caribou_uart_queue_tx_sz\000"
.LASF18:
	.ascii	"statefn\000"
.LASF35:
	.ascii	"CARIBOU_UART_BAUD_RATE_4800\000"
.LASF105:
	.ascii	"state\000"
.LASF19:
	.ascii	"stdio_t\000"
.LASF114:
	.ascii	"caribou_uart_private_readfn\000"
.LASF127:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f091/crossworks/../../../../src/d"
	.ascii	"ev/uart.c\000"
.LASF0:
	.ascii	"signed char\000"
.LASF5:
	.ascii	"short unsigned int\000"
.LASF78:
	.ascii	"CARIBOU_UART_DMA_NONE\000"
.LASF12:
	.ascii	"errno_t\000"
.LASF107:
	.ascii	"caribou_uart_rx_data\000"
.LASF56:
	.ascii	"CARIBOU_UART_BAUD_RATE_10500000\000"
.LASF119:
	.ascii	"chip_uart_tx_busy\000"
.LASF48:
	.ascii	"CARIBOU_UART_BAUD_RATE_921600\000"
.LASF109:
	.ascii	"caribou_uart_tx_ready\000"
.LASF36:
	.ascii	"CARIBOU_UART_BAUD_RATE_9600\000"
.LASF83:
	.ascii	"baud_rate\000"
.LASF45:
	.ascii	"CARIBOU_UART_BAUD_RATE_230400\000"
.LASF65:
	.ascii	"CARIBOU_UART_STOPBITS_1\000"
.LASF67:
	.ascii	"CARIBOU_UART_STOPBITS_2\000"
.LASF37:
	.ascii	"CARIBOU_UART_BAUD_RATE_19200\000"
	.ident	"GCC: (GNU) 5.4.1 20160609 (release) [ARM/embedded-5-branch revision 237715]"
