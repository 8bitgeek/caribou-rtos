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
	.global	_stdio_
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
	.section	.text.chip_uart_int_enable,"ax",%progbits
	.align	2
	.global	chip_uart_int_enable
	.code	16
	.thumb_func
	.type	chip_uart_int_enable, %function
chip_uart_int_enable:
.LFB32:
	.file 1 "/home/mike/Documents/GitHub/caribou-rtos/caribou/target/board/nucleo_f091/crossworks/../../../chip/stm32/stm32f030/src/uart.c"
	.loc 1 99 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI0:
	sub	sp, sp, #16
.LCFI1:
	add	r7, sp, #0
.LCFI2:
	str	r0, [r7, #4]
	.loc 1 100 0
	ldr	r3, [r7, #4]
	str	r3, [r7, #12]
	.loc 1 101 0
	ldr	r3, [r7, #12]
	movs	r0, r3
	bl	chip_uart_int_enabled
	movs	r3, r0
	str	r3, [r7, #8]
	.loc 1 102 0
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r1, .L3
	movs	r2, #1
	movs	r0, r3
	bl	USART_ITConfig
	.loc 1 103 0
	ldr	r3, [r7, #8]
	.loc 1 104 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L4:
	.align	2
.L3:
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
	.loc 1 109 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI3:
	sub	sp, sp, #16
.LCFI4:
	add	r7, sp, #0
.LCFI5:
	str	r0, [r7, #4]
	.loc 1 110 0
	ldr	r3, [r7, #4]
	str	r3, [r7, #12]
	.loc 1 111 0
	ldr	r3, [r7, #12]
	movs	r0, r3
	bl	chip_uart_int_enabled
	movs	r3, r0
	str	r3, [r7, #8]
	.loc 1 112 0
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r1, .L7
	movs	r2, #0
	movs	r0, r3
	bl	USART_ITConfig
	.loc 1 113 0
	ldr	r3, [r7, #8]
	.loc 1 114 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L8:
	.align	2
.L7:
	.word	327941
.LFE33:
	.size	chip_uart_int_disable, .-chip_uart_int_disable
	.section	.text.chip_uart_int_enabled,"ax",%progbits
	.align	2
	.global	chip_uart_int_enabled
	.code	16
	.thumb_func
	.type	chip_uart_int_enabled, %function
chip_uart_int_enabled:
.LFB34:
	.loc 1 118 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI6:
	sub	sp, sp, #16
.LCFI7:
	add	r7, sp, #0
.LCFI8:
	str	r0, [r7, #4]
	.loc 1 119 0
	ldr	r3, [r7, #4]
	str	r3, [r7, #12]
	.loc 1 120 0
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r3, [r3]
	ldr	r2, .L11
	ands	r3, r2
	subs	r2, r3, #1
	sbcs	r3, r3, r2
	uxtb	r3, r3
	str	r3, [r7, #8]
	.loc 1 121 0
	ldr	r3, [r7, #8]
	.loc 1 122 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L12:
	.align	2
.L11:
	.word	327941
.LFE34:
	.size	chip_uart_int_enabled, .-chip_uart_int_enabled
	.section	.text.chip_uart_int_set,"ax",%progbits
	.align	2
	.global	chip_uart_int_set
	.code	16
	.thumb_func
	.type	chip_uart_int_set, %function
chip_uart_int_set:
.LFB35:
	.loc 1 126 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI9:
	sub	sp, sp, #16
.LCFI10:
	add	r7, sp, #0
.LCFI11:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 127 0
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	chip_uart_int_enabled
	movs	r3, r0
	str	r3, [r7, #12]
	.loc 1 128 0
	ldr	r3, [r7]
	cmp	r3, #0
	beq	.L14
.LBB2:
	.loc 1 129 0
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	uart_enable_interrupts
.LBE2:
	b	.L15
.L14:
.LBB3:
	.loc 1 131 0
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	uart_disable_interrupts
.L15:
.LBE3:
	.loc 1 132 0
	ldr	r3, [r7, #12]
	.loc 1 133 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE35:
	.size	chip_uart_int_set, .-chip_uart_int_set
	.section	.text.uart_enable,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	uart_enable, %function
uart_enable:
.LFB36:
	.loc 1 137 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI12:
	sub	sp, sp, #8
.LCFI13:
	add	r7, sp, #0
.LCFI14:
	str	r0, [r7, #4]
	.loc 1 138 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r1, #1
	movs	r0, r3
	bl	USART_Cmd
	.loc 1 139 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE36:
	.size	uart_enable, .-uart_enable
	.section	.text.uart_disable,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	uart_disable, %function
uart_disable:
.LFB37:
	.loc 1 143 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI15:
	sub	sp, sp, #8
.LCFI16:
	add	r7, sp, #0
.LCFI17:
	str	r0, [r7, #4]
	.loc 1 144 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r1, #0
	movs	r0, r3
	bl	USART_Cmd
	.loc 1 145 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE37:
	.size	uart_disable, .-uart_disable
	.section	.text.chip_uart_set_config,"ax",%progbits
	.align	2
	.global	chip_uart_set_config
	.code	16
	.thumb_func
	.type	chip_uart_set_config, %function
chip_uart_set_config:
.LFB38:
	.loc 1 149 0
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI18:
	sub	sp, sp, #40
.LCFI19:
	add	r7, sp, #0
.LCFI20:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 150 0
	movs	r3, #1
	rsbs	r3, r3, #0
	str	r3, [r7, #36]
	.loc 1 151 0
	ldr	r3, [r7, #4]
	str	r3, [r7, #32]
	.loc 1 152 0
	ldr	r3, [r7]
	cmp	r3, #0
	bne	.L20
	.loc 1 154 0
	ldr	r3, [r7, #32]
	adds	r3, r3, #8
	str	r3, [r7]
.L20:
	.loc 1 156 0
	ldr	r3, [r7, #32]
	ldr	r3, [r3]
	movs	r1, #0
	movs	r0, r3
	bl	USART_Cmd
	.loc 1 157 0
	ldr	r3, [r7]
	cmp	r3, #0
	bne	.LCB291
	b	.L21	@long jump
.LCB291:
.LBB4:
	.loc 1 160 0
	ldr	r3, [r7]
	ldr	r2, [r3]
	movs	r3, #8
	adds	r3, r7, r3
	str	r2, [r3]
	.loc 1 161 0
	ldr	r3, [r7]
	ldrb	r3, [r3, #4]
	movs	r2, r3
	movs	r3, #8
	adds	r3, r7, r3
	str	r2, [r3, #4]
	.loc 1 163 0
	ldr	r3, [r7]
	ldrb	r3, [r3, #4]
	cmp	r3, #9
	beq	.L23
	.loc 1 170 0
	movs	r3, #8
	adds	r3, r7, r3
	movs	r2, #0
	str	r2, [r3, #4]
	.loc 1 171 0
	b	.L24
.L23:
	.loc 1 173 0
	movs	r3, #8
	adds	r3, r7, r3
	movs	r2, #128
	lsls	r2, r2, #5
	str	r2, [r3, #4]
	.loc 1 174 0
	nop
.L24:
	.loc 1 177 0
	ldr	r3, [r7]
	ldrb	r3, [r3, #5]
	cmp	r3, #2
	beq	.L26
	cmp	r3, #3
	beq	.L27
	.loc 1 184 0
	movs	r3, #8
	adds	r3, r7, r3
	movs	r2, #0
	str	r2, [r3, #8]
	.loc 1 185 0
	b	.L28
.L26:
	.loc 1 187 0
	movs	r3, #8
	adds	r3, r7, r3
	movs	r2, #192
	lsls	r2, r2, #6
	str	r2, [r3, #8]
	.loc 1 188 0
	b	.L28
.L27:
	.loc 1 190 0
	movs	r3, #8
	adds	r3, r7, r3
	movs	r2, #128
	lsls	r2, r2, #6
	str	r2, [r3, #8]
	.loc 1 191 0
	nop
.L28:
	.loc 1 194 0
	ldr	r3, [r7]
	ldrb	r3, [r3, #6]
	cmp	r3, #1
	beq	.L30
	cmp	r3, #2
	beq	.L31
	.loc 1 198 0
	movs	r3, #8
	adds	r3, r7, r3
	movs	r2, #0
	str	r2, [r3, #12]
	.loc 1 199 0
	b	.L32
.L31:
	.loc 1 201 0
	movs	r3, #8
	adds	r3, r7, r3
	movs	r2, #192
	lsls	r2, r2, #3
	str	r2, [r3, #12]
	.loc 1 202 0
	b	.L32
.L30:
	.loc 1 204 0
	movs	r3, #8
	adds	r3, r7, r3
	movs	r2, #128
	lsls	r2, r2, #3
	str	r2, [r3, #12]
	.loc 1 205 0
	nop
.L32:
	.loc 1 208 0
	ldr	r3, [r7]
	ldrb	r3, [r3, #7]
	cmp	r3, #2
	beq	.L34
	cmp	r3, #3
	beq	.L35
	cmp	r3, #1
	beq	.L36
	.loc 1 212 0
	movs	r3, #8
	adds	r3, r7, r3
	movs	r2, #0
	str	r2, [r3, #20]
	.loc 1 213 0
	b	.L37
.L36:
	.loc 1 215 0
	movs	r3, #8
	adds	r3, r7, r3
	movs	r2, #128
	lsls	r2, r2, #1
	str	r2, [r3, #20]
	.loc 1 216 0
	b	.L37
.L34:
	.loc 1 218 0
	movs	r3, #8
	adds	r3, r7, r3
	movs	r2, #128
	lsls	r2, r2, #2
	str	r2, [r3, #20]
	.loc 1 219 0
	b	.L37
.L35:
	.loc 1 221 0
	movs	r3, #8
	adds	r3, r7, r3
	movs	r2, #192
	lsls	r2, r2, #2
	str	r2, [r3, #20]
	.loc 1 222 0
	nop
.L37:
	.loc 1 225 0
	movs	r3, #8
	adds	r3, r7, r3
	movs	r2, #12
	str	r2, [r3, #16]
	.loc 1 226 0
	ldr	r3, [r7, #32]
	ldr	r3, [r3]
	movs	r2, #8
	adds	r2, r7, r2
	movs	r1, r2
	movs	r0, r3
	bl	USART_Init
	.loc 1 227 0
	ldr	r3, [r7, #32]
	ldr	r3, [r3]
	movs	r1, #1
	movs	r0, r3
	bl	USART_Cmd
	.loc 1 228 0
	ldr	r3, [r7, #32]
	ldrb	r3, [r3, #4]
	ldr	r2, [r7, #32]
	ldr	r1, .L39
	movs	r0, r3
	bl	caribou_vector_install
	.loc 1 229 0
	ldr	r3, [r7, #32]
	ldrb	r3, [r3, #4]
	movs	r0, r3
	bl	chip_vector_enable
	.loc 1 230 0
	ldr	r3, [r7, #32]
	ldr	r3, [r3]
	ldr	r1, .L39+4
	movs	r2, #1
	movs	r0, r3
	bl	USART_ITConfig
	.loc 1 231 0
	movs	r3, #0
	str	r3, [r7, #36]
.L21:
.LBE4:
	.loc 1 233 0
	ldr	r3, [r7, #36]
	.loc 1 234 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #40
	@ sp needed
	pop	{r7, pc}
.L40:
	.align	2
.L39:
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
	.loc 1 238 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI21:
	sub	sp, sp, #8
.LCFI22:
	add	r7, sp, #0
.LCFI23:
	str	r0, [r7, #4]
	.loc 1 239 0
	ldr	r3, [r7, #4]
	.loc 1 240 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 244 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI24:
	sub	sp, sp, #8
.LCFI25:
	add	r7, sp, #0
.LCFI26:
	str	r0, [r7, #4]
	.loc 1 245 0
	ldr	r3, [r7, #4]
	.loc 1 246 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 249 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI27:
	sub	sp, sp, #16
.LCFI28:
	add	r7, sp, #0
.LCFI29:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 250 0
	ldr	r3, [r7, #4]
	str	r3, [r7, #12]
	.loc 1 251 0
	ldr	r3, [r7, #12]
	ldr	r2, [r7]
	str	r2, [r3, #24]
	.loc 1 252 0
	ldr	r3, [r7]
	.loc 1 253 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 256 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI30:
	sub	sp, sp, #16
.LCFI31:
	add	r7, sp, #0
.LCFI32:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 257 0
	ldr	r3, [r7, #4]
	str	r3, [r7, #12]
	.loc 1 258 0
	ldr	r3, [r7, #12]
	ldr	r2, [r7]
	str	r2, [r3, #28]
	.loc 1 259 0
	ldr	r3, [r7]
	.loc 1 260 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 263 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI33:
	sub	sp, sp, #16
.LCFI34:
	add	r7, sp, #0
.LCFI35:
	str	r0, [r7, #4]
	.loc 1 264 0
	ldr	r3, [r7, #4]
	str	r3, [r7, #12]
	.loc 1 265 0
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #24]
	.loc 1 266 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 269 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI36:
	sub	sp, sp, #16
.LCFI37:
	add	r7, sp, #0
.LCFI38:
	str	r0, [r7, #4]
	.loc 1 270 0
	ldr	r3, [r7, #4]
	str	r3, [r7, #12]
	.loc 1 271 0
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #28]
	.loc 1 272 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 275 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI39:
	sub	sp, sp, #16
.LCFI40:
	add	r7, sp, #0
.LCFI41:
	str	r0, [r7, #4]
	.loc 1 276 0
	ldr	r3, [r7, #4]
	str	r3, [r7, #12]
	.loc 1 277 0
	ldr	r3, [r7, #12]
	ldrb	r3, [r3, #4]
	.loc 1 278 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 281 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI42:
	sub	sp, sp, #16
.LCFI43:
	add	r7, sp, #0
.LCFI44:
	str	r0, [r7, #4]
	.loc 1 282 0
	ldr	r3, [r7, #4]
	str	r3, [r7, #12]
	.loc 1 283 0
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #20]
	.loc 1 284 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 287 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI45:
	sub	sp, sp, #16
.LCFI46:
	add	r7, sp, #0
.LCFI47:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 288 0
	ldr	r3, [r7, #4]
	str	r3, [r7, #12]
	.loc 1 289 0
	ldr	r3, [r7, #12]
	ldr	r2, [r7]
	str	r2, [r3, #20]
	.loc 1 290 0
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #20]
	.loc 1 291 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 294 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI48:
	sub	sp, sp, #16
.LCFI49:
	add	r7, sp, #0
.LCFI50:
	str	r0, [r7, #4]
	.loc 1 295 0
	ldr	r3, [r7, #4]
	str	r3, [r7, #12]
	.loc 1 296 0
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	movs	r2, #64
	ands	r3, r2
	rsbs	r2, r3, #0
	adcs	r3, r3, r2
	uxtb	r2, r3
	movs	r3, #11
	adds	r3, r7, r3
	strb	r2, [r3]
	.loc 1 297 0
	movs	r3, #11
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 1 298 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 301 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI51:
	sub	sp, sp, #16
.LCFI52:
	add	r7, sp, #0
.LCFI53:
	str	r0, [r7, #4]
	.loc 1 302 0
	ldr	r3, [r7, #4]
	str	r3, [r7, #12]
	.loc 1 303 0
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	movs	r2, #128
	ands	r3, r2
	subs	r2, r3, #1
	sbcs	r3, r3, r2
	uxtb	r2, r3
	movs	r3, #11
	adds	r3, r7, r3
	strb	r2, [r3]
	.loc 1 304 0
	movs	r3, #11
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 1 305 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 308 0
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI54:
	sub	sp, sp, #24
.LCFI55:
	add	r7, sp, #0
.LCFI56:
	str	r0, [r7, #4]
	.loc 1 309 0
	ldr	r3, [r7, #4]
	str	r3, [r7, #20]
	.loc 1 310 0
	ldr	r3, [r7, #20]
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	str	r3, [r7, #16]
	.loc 1 311 0
	ldr	r3, [r7, #16]
	movs	r2, #32
	ands	r3, r2
	subs	r2, r3, #1
	sbcs	r3, r3, r2
	uxtb	r2, r3
	movs	r3, #15
	adds	r3, r7, r3
	strb	r2, [r3]
	.loc 1 312 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 1 313 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #24
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 316 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI57:
	sub	sp, sp, #16
.LCFI58:
	add	r7, sp, #0
.LCFI59:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 317 0
	ldr	r3, [r7, #4]
	str	r3, [r7, #12]
	.loc 1 318 0
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r7]
	uxth	r2, r2
	strh	r2, [r3, #40]
	.loc 1 319 0
	ldr	r3, [r7]
	.loc 1 320 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 323 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI60:
	sub	sp, sp, #16
.LCFI61:
	add	r7, sp, #0
.LCFI62:
	str	r0, [r7, #4]
	.loc 1 324 0
	ldr	r3, [r7, #4]
	str	r3, [r7, #12]
	.loc 1 325 0
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldrh	r3, [r3, #36]
	uxth	r3, r3
	.loc 1 326 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 330 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI63:
	sub	sp, sp, #16
.LCFI64:
	add	r7, sp, #0
.LCFI65:
	str	r0, [r7, #4]
	.loc 1 331 0
	ldr	r3, [r7, #4]
	str	r3, [r7, #12]
	.loc 1 332 0
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r7, #12]
	ldr	r2, [r2]
	ldr	r2, [r2]
	movs	r1, #128
	orrs	r2, r1
	str	r2, [r3]
	.loc 1 333 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 337 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI66:
	sub	sp, sp, #16
.LCFI67:
	add	r7, sp, #0
.LCFI68:
	str	r0, [r7, #4]
	.loc 1 338 0
	ldr	r3, [r7, #4]
	str	r3, [r7, #12]
	.loc 1 339 0
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r7, #12]
	ldr	r2, [r2]
	ldr	r2, [r2]
	movs	r1, #128
	bics	r2, r1
	str	r2, [r3]
	.loc 1 340 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 344 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
.LCFI69:
	sub	sp, sp, #20
.LCFI70:
	add	r7, sp, #0
.LCFI71:
	movs	r2, r0
	str	r1, [r7]
	adds	r3, r7, #7
	strb	r2, [r3]
	.loc 1 345 0
	ldr	r3, [r7]
	str	r3, [r7, #12]
	.loc 1 346 0
	ldr	r3, [r7, #12]
	ldrb	r3, [r3, #4]
	adds	r2, r7, #7
	ldrb	r2, [r2]
	cmp	r2, r3
	bne	.L78
	.loc 1 349 0
	b	.L73
.L75:
	.loc 1 351 0
	ldr	r3, [r7, #12]
	ldr	r4, [r3, #24]
	ldr	r3, [r7, #12]
	movs	r0, r3
	bl	chip_uart_rx_data
	movs	r3, r0
	uxtb	r3, r3
	movs	r1, r3
	movs	r0, r4
	bl	caribou_bytequeue_put
	subs	r3, r0, #0
	bne	.L74
	.loc 1 353 0
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #20]
	movs	r2, #16
	orrs	r2, r3
	ldr	r3, [r7, #12]
	str	r2, [r3, #20]
.L74:
	.loc 1 355 0
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #20]
	movs	r2, #1
	orrs	r2, r3
	ldr	r3, [r7, #12]
	str	r2, [r3, #20]
.L73:
	.loc 1 349 0
	ldr	r3, [r7, #12]
	movs	r0, r3
	bl	chip_uart_rx_ready
	subs	r3, r0, #0
	bne	.L75
	.loc 1 358 0
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #28]
	movs	r0, r3
	bl	caribou_bytequeue_empty
	subs	r3, r0, #0
	bne	.L76
	.loc 1 361 0
	ldr	r3, [r7, #12]
	movs	r0, r3
	bl	chip_uart_tx_ready
	subs	r3, r0, #0
	beq	.L76
	.loc 1 363 0
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #28]
	movs	r0, r3
	bl	caribou_bytequeue_get
	movs	r2, r0
	ldr	r3, [r7, #12]
	movs	r1, r2
	movs	r0, r3
	bl	chip_uart_tx_data
.L76:
	.loc 1 367 0
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #28]
	movs	r0, r3
	bl	caribou_bytequeue_empty
	subs	r3, r0, #0
	beq	.L77
	.loc 1 369 0
	ldr	r3, [r7, #12]
	movs	r0, r3
	bl	chip_uart_tx_stop
.L77:
	.loc 1 371 0
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	movs	r2, #8
	str	r2, [r3, #32]
.L78:
	.loc 1 373 0
	nop
	mov	sp, r7
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r7, pc}
.LFE55:
	.size	isr_uart, .-isr_uart
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
	.uleb128 0x18
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
	.uleb128 0x18
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
	.uleb128 0x18
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
	.uleb128 0x10
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
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI17-.LCFI16
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
	.4byte	.LCFI18-.LFB38
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI19-.LCFI18
	.byte	0xe
	.uleb128 0x30
	.byte	0x4
	.4byte	.LCFI20-.LCFI19
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
	.4byte	.LCFI21-.LFB39
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI22-.LCFI21
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI23-.LCFI22
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
	.4byte	.LCFI24-.LFB40
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI25-.LCFI24
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI26-.LCFI25
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
	.4byte	.LCFI27-.LFB41
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI28-.LCFI27
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI29-.LCFI28
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
	.4byte	.LCFI30-.LFB42
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI31-.LCFI30
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI32-.LCFI31
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
	.4byte	.LCFI33-.LFB43
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI34-.LCFI33
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI35-.LCFI34
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
	.4byte	.LCFI36-.LFB44
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI37-.LCFI36
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI38-.LCFI37
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
	.4byte	.LCFI39-.LFB45
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI40-.LCFI39
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI41-.LCFI40
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
	.4byte	.LCFI42-.LFB46
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI43-.LCFI42
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI44-.LCFI43
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
	.4byte	.LCFI45-.LFB47
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI46-.LCFI45
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI47-.LCFI46
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
	.4byte	.LCFI48-.LFB48
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI49-.LCFI48
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI50-.LCFI49
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
	.4byte	.LCFI51-.LFB49
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI52-.LCFI51
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI53-.LCFI52
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
	.4byte	.LCFI54-.LFB50
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI55-.LCFI54
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI56-.LCFI55
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
	.4byte	.LCFI57-.LFB51
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI58-.LCFI57
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI59-.LCFI58
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
	.4byte	.LCFI60-.LFB52
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI61-.LCFI60
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI62-.LCFI61
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
	.4byte	.LCFI63-.LFB53
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI64-.LCFI63
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI65-.LCFI64
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
	.4byte	.LCFI66-.LFB54
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI67-.LCFI66
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI68-.LCFI67
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
	.4byte	.LCFI69-.LFB55
	.byte	0xe
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI70-.LCFI69
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI71-.LCFI70
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE46:
	.text
.Letext0:
	.file 2 "/usr/share/crossworks_for_arm_3.7/include/stdint.h"
	.file 3 "../../../../include/caribou/lib/stdio.h"
	.file 4 "../../../chip/stm32/stm32f091/include/stm32f091rc/chip/vectors.h"
	.file 5 "../../../chip/stm32/stm32f091/lib/CMSIS/ST/STM32F0xx/Include/stm32f0xx.h"
	.file 6 "../../../chip/stm32/stm32f091/lib/include/stm32f0xx_usart.h"
	.file 7 "../../../../include/caribou/lib/bytequeue.h"
	.file 8 "../../../../include/caribou/dev/uart.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0xd8f
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF208
	.byte	0xc
	.4byte	.LASF209
	.4byte	.LASF210
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
	.uleb128 0x3
	.4byte	.LASF6
	.byte	0x2
	.byte	0x17
	.4byte	0x69
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF7
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF8
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF9
	.uleb128 0x5
	.byte	0x4
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF10
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF11
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF12
	.uleb128 0x6
	.4byte	.LASF211
	.byte	0x18
	.byte	0x3
	.byte	0x1f
	.4byte	0xea
	.uleb128 0x7
	.4byte	.LASF13
	.byte	0x3
	.byte	0x21
	.4byte	0x7e
	.byte	0
	.uleb128 0x7
	.4byte	.LASF14
	.byte	0x3
	.byte	0x22
	.4byte	0x109
	.byte	0x4
	.uleb128 0x7
	.4byte	.LASF15
	.byte	0x3
	.byte	0x23
	.4byte	0x109
	.byte	0x8
	.uleb128 0x7
	.4byte	.LASF16
	.byte	0x3
	.byte	0x24
	.4byte	0x11e
	.byte	0xc
	.uleb128 0x7
	.4byte	.LASF17
	.byte	0x3
	.byte	0x25
	.4byte	0x11e
	.byte	0x10
	.uleb128 0x7
	.4byte	.LASF18
	.byte	0x3
	.byte	0x26
	.4byte	0x11e
	.byte	0x14
	.byte	0
	.uleb128 0x8
	.4byte	0x57
	.4byte	0x103
	.uleb128 0x9
	.4byte	0x103
	.uleb128 0x9
	.4byte	0x7e
	.uleb128 0x9
	.4byte	0x57
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.4byte	0x95
	.uleb128 0xa
	.byte	0x4
	.4byte	0xea
	.uleb128 0x8
	.4byte	0x57
	.4byte	0x11e
	.uleb128 0x9
	.4byte	0x103
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.4byte	0x10f
	.uleb128 0x3
	.4byte	.LASF19
	.byte	0x3
	.byte	0x27
	.4byte	0x95
	.uleb128 0xb
	.byte	0x1
	.4byte	0x37
	.byte	0x4
	.byte	0x1a
	.4byte	0x1fc
	.uleb128 0xc
	.4byte	.LASF20
	.byte	0
	.uleb128 0xc
	.4byte	.LASF21
	.byte	0x1
	.uleb128 0xc
	.4byte	.LASF22
	.byte	0x2
	.uleb128 0xc
	.4byte	.LASF23
	.byte	0x3
	.uleb128 0xc
	.4byte	.LASF24
	.byte	0x4
	.uleb128 0xc
	.4byte	.LASF25
	.byte	0x5
	.uleb128 0xc
	.4byte	.LASF26
	.byte	0x6
	.uleb128 0xc
	.4byte	.LASF27
	.byte	0x7
	.uleb128 0xc
	.4byte	.LASF28
	.byte	0x8
	.uleb128 0xc
	.4byte	.LASF29
	.byte	0x9
	.uleb128 0xc
	.4byte	.LASF30
	.byte	0xa
	.uleb128 0xc
	.4byte	.LASF31
	.byte	0xb
	.uleb128 0xc
	.4byte	.LASF32
	.byte	0xc
	.uleb128 0xc
	.4byte	.LASF33
	.byte	0xd
	.uleb128 0xc
	.4byte	.LASF34
	.byte	0xe
	.uleb128 0xc
	.4byte	.LASF35
	.byte	0xf
	.uleb128 0xc
	.4byte	.LASF36
	.byte	0x10
	.uleb128 0xc
	.4byte	.LASF37
	.byte	0x11
	.uleb128 0xc
	.4byte	.LASF38
	.byte	0x12
	.uleb128 0xc
	.4byte	.LASF39
	.byte	0x13
	.uleb128 0xc
	.4byte	.LASF40
	.byte	0x14
	.uleb128 0xc
	.4byte	.LASF41
	.byte	0x15
	.uleb128 0xc
	.4byte	.LASF42
	.byte	0x16
	.uleb128 0xc
	.4byte	.LASF43
	.byte	0x17
	.uleb128 0xc
	.4byte	.LASF44
	.byte	0x18
	.uleb128 0xc
	.4byte	.LASF45
	.byte	0x19
	.uleb128 0xc
	.4byte	.LASF46
	.byte	0x1a
	.uleb128 0xc
	.4byte	.LASF47
	.byte	0x1b
	.uleb128 0xc
	.4byte	.LASF48
	.byte	0x1c
	.uleb128 0xc
	.4byte	.LASF49
	.byte	0x1d
	.uleb128 0xc
	.4byte	.LASF50
	.byte	0x1e
	.uleb128 0xc
	.4byte	.LASF51
	.byte	0x1f
	.byte	0
	.uleb128 0x3
	.4byte	.LASF52
	.byte	0x4
	.byte	0x3e
	.4byte	0x12f
	.uleb128 0xd
	.4byte	.LASF212
	.byte	0x1
	.4byte	0x25
	.byte	0x5
	.byte	0xaa
	.4byte	0x2e4
	.uleb128 0xe
	.4byte	.LASF53
	.sleb128 -14
	.uleb128 0xe
	.4byte	.LASF54
	.sleb128 -13
	.uleb128 0xe
	.4byte	.LASF55
	.sleb128 -5
	.uleb128 0xe
	.4byte	.LASF56
	.sleb128 -2
	.uleb128 0xe
	.4byte	.LASF57
	.sleb128 -1
	.uleb128 0xc
	.4byte	.LASF58
	.byte	0
	.uleb128 0xc
	.4byte	.LASF59
	.byte	0x1
	.uleb128 0xc
	.4byte	.LASF60
	.byte	0x2
	.uleb128 0xc
	.4byte	.LASF61
	.byte	0x3
	.uleb128 0xc
	.4byte	.LASF62
	.byte	0x4
	.uleb128 0xc
	.4byte	.LASF63
	.byte	0x5
	.uleb128 0xc
	.4byte	.LASF64
	.byte	0x6
	.uleb128 0xc
	.4byte	.LASF65
	.byte	0x7
	.uleb128 0xc
	.4byte	.LASF66
	.byte	0x8
	.uleb128 0xc
	.4byte	.LASF67
	.byte	0x9
	.uleb128 0xc
	.4byte	.LASF68
	.byte	0xa
	.uleb128 0xc
	.4byte	.LASF69
	.byte	0xb
	.uleb128 0xc
	.4byte	.LASF70
	.byte	0xc
	.uleb128 0xc
	.4byte	.LASF71
	.byte	0xd
	.uleb128 0xc
	.4byte	.LASF72
	.byte	0xe
	.uleb128 0xc
	.4byte	.LASF73
	.byte	0xf
	.uleb128 0xc
	.4byte	.LASF74
	.byte	0x10
	.uleb128 0xc
	.4byte	.LASF75
	.byte	0x11
	.uleb128 0xc
	.4byte	.LASF76
	.byte	0x13
	.uleb128 0xc
	.4byte	.LASF77
	.byte	0x14
	.uleb128 0xc
	.4byte	.LASF78
	.byte	0x15
	.uleb128 0xc
	.4byte	.LASF79
	.byte	0x16
	.uleb128 0xc
	.4byte	.LASF80
	.byte	0x17
	.uleb128 0xc
	.4byte	.LASF81
	.byte	0x18
	.uleb128 0xc
	.4byte	.LASF82
	.byte	0x19
	.uleb128 0xc
	.4byte	.LASF83
	.byte	0x1a
	.uleb128 0xc
	.4byte	.LASF84
	.byte	0x1b
	.uleb128 0xc
	.4byte	.LASF85
	.byte	0x1c
	.uleb128 0xc
	.4byte	.LASF86
	.byte	0x1e
	.byte	0
	.uleb128 0xf
	.4byte	0x5e
	.uleb128 0xb
	.byte	0x1
	.4byte	0x37
	.byte	0x5
	.byte	0xe1
	.4byte	0x302
	.uleb128 0xc
	.4byte	.LASF87
	.byte	0
	.uleb128 0xc
	.4byte	.LASF88
	.byte	0x1
	.byte	0
	.uleb128 0xf
	.4byte	0x45
	.uleb128 0x10
	.byte	0x2c
	.byte	0x5
	.2byte	0x26b
	.4byte	0x3e1
	.uleb128 0x11
	.ascii	"CR1\000"
	.byte	0x5
	.2byte	0x26d
	.4byte	0x2e4
	.byte	0
	.uleb128 0x11
	.ascii	"CR2\000"
	.byte	0x5
	.2byte	0x26e
	.4byte	0x2e4
	.byte	0x4
	.uleb128 0x11
	.ascii	"CR3\000"
	.byte	0x5
	.2byte	0x26f
	.4byte	0x2e4
	.byte	0x8
	.uleb128 0x11
	.ascii	"BRR\000"
	.byte	0x5
	.2byte	0x270
	.4byte	0x302
	.byte	0xc
	.uleb128 0x12
	.4byte	.LASF89
	.byte	0x5
	.2byte	0x271
	.4byte	0x45
	.byte	0xe
	.uleb128 0x12
	.4byte	.LASF90
	.byte	0x5
	.2byte	0x272
	.4byte	0x302
	.byte	0x10
	.uleb128 0x12
	.4byte	.LASF91
	.byte	0x5
	.2byte	0x273
	.4byte	0x45
	.byte	0x12
	.uleb128 0x12
	.4byte	.LASF92
	.byte	0x5
	.2byte	0x274
	.4byte	0x2e4
	.byte	0x14
	.uleb128 0x11
	.ascii	"RQR\000"
	.byte	0x5
	.2byte	0x275
	.4byte	0x302
	.byte	0x18
	.uleb128 0x12
	.4byte	.LASF93
	.byte	0x5
	.2byte	0x276
	.4byte	0x45
	.byte	0x1a
	.uleb128 0x11
	.ascii	"ISR\000"
	.byte	0x5
	.2byte	0x277
	.4byte	0x2e4
	.byte	0x1c
	.uleb128 0x11
	.ascii	"ICR\000"
	.byte	0x5
	.2byte	0x278
	.4byte	0x2e4
	.byte	0x20
	.uleb128 0x11
	.ascii	"RDR\000"
	.byte	0x5
	.2byte	0x279
	.4byte	0x302
	.byte	0x24
	.uleb128 0x12
	.4byte	.LASF94
	.byte	0x5
	.2byte	0x27a
	.4byte	0x45
	.byte	0x26
	.uleb128 0x11
	.ascii	"TDR\000"
	.byte	0x5
	.2byte	0x27b
	.4byte	0x302
	.byte	0x28
	.uleb128 0x12
	.4byte	.LASF95
	.byte	0x5
	.2byte	0x27c
	.4byte	0x45
	.byte	0x2a
	.byte	0
	.uleb128 0x13
	.4byte	.LASF96
	.byte	0x5
	.2byte	0x27d
	.4byte	0x307
	.uleb128 0x14
	.byte	0x18
	.byte	0x6
	.byte	0x38
	.4byte	0x43e
	.uleb128 0x7
	.4byte	.LASF97
	.byte	0x6
	.byte	0x3a
	.4byte	0x5e
	.byte	0
	.uleb128 0x7
	.4byte	.LASF98
	.byte	0x6
	.byte	0x3f
	.4byte	0x5e
	.byte	0x4
	.uleb128 0x7
	.4byte	.LASF99
	.byte	0x6
	.byte	0x42
	.4byte	0x5e
	.byte	0x8
	.uleb128 0x7
	.4byte	.LASF100
	.byte	0x6
	.byte	0x45
	.4byte	0x5e
	.byte	0xc
	.uleb128 0x7
	.4byte	.LASF101
	.byte	0x6
	.byte	0x4c
	.4byte	0x5e
	.byte	0x10
	.uleb128 0x7
	.4byte	.LASF102
	.byte	0x6
	.byte	0x4f
	.4byte	0x5e
	.byte	0x14
	.byte	0
	.uleb128 0x3
	.4byte	.LASF103
	.byte	0x6
	.byte	0x52
	.4byte	0x3ed
	.uleb128 0x14
	.byte	0xc
	.byte	0x7
	.byte	0x1d
	.4byte	0x482
	.uleb128 0x7
	.4byte	.LASF104
	.byte	0x7
	.byte	0x1f
	.4byte	0x482
	.byte	0
	.uleb128 0x7
	.4byte	.LASF105
	.byte	0x7
	.byte	0x20
	.4byte	0x45
	.byte	0x4
	.uleb128 0x7
	.4byte	.LASF106
	.byte	0x7
	.byte	0x21
	.4byte	0x45
	.byte	0x6
	.uleb128 0x7
	.4byte	.LASF107
	.byte	0x7
	.byte	0x22
	.4byte	0x45
	.byte	0x8
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.4byte	0x2c
	.uleb128 0x3
	.4byte	.LASF108
	.byte	0x7
	.byte	0x23
	.4byte	0x449
	.uleb128 0xb
	.byte	0x4
	.4byte	0x69
	.byte	0x8
	.byte	0x34
	.4byte	0x57a
	.uleb128 0xc
	.4byte	.LASF109
	.byte	0x6e
	.uleb128 0x15
	.4byte	.LASF110
	.2byte	0x12c
	.uleb128 0x15
	.4byte	.LASF111
	.2byte	0x258
	.uleb128 0x15
	.4byte	.LASF112
	.2byte	0x4b0
	.uleb128 0x15
	.4byte	.LASF113
	.2byte	0x960
	.uleb128 0x15
	.4byte	.LASF114
	.2byte	0x12c0
	.uleb128 0x15
	.4byte	.LASF115
	.2byte	0x2580
	.uleb128 0x15
	.4byte	.LASF116
	.2byte	0x4b00
	.uleb128 0x15
	.4byte	.LASF117
	.2byte	0x7080
	.uleb128 0x15
	.4byte	.LASF118
	.2byte	0x9600
	.uleb128 0x15
	.4byte	.LASF119
	.2byte	0xdac0
	.uleb128 0x15
	.4byte	.LASF120
	.2byte	0xe100
	.uleb128 0x16
	.4byte	.LASF121
	.4byte	0x1c200
	.uleb128 0x16
	.4byte	.LASF122
	.4byte	0x1f400
	.uleb128 0x16
	.4byte	.LASF123
	.4byte	0x25800
	.uleb128 0x16
	.4byte	.LASF124
	.4byte	0x38400
	.uleb128 0x16
	.4byte	.LASF125
	.4byte	0x3e800
	.uleb128 0x16
	.4byte	.LASF126
	.4byte	0x70800
	.uleb128 0x16
	.4byte	.LASF127
	.4byte	0xe1000
	.uleb128 0x16
	.4byte	.LASF128
	.4byte	0x1b5800
	.uleb128 0x16
	.4byte	.LASF129
	.4byte	0x1c2000
	.uleb128 0x16
	.4byte	.LASF130
	.4byte	0x36b000
	.uleb128 0x16
	.4byte	.LASF131
	.4byte	0x384000
	.uleb128 0x16
	.4byte	.LASF132
	.4byte	0x6d6000
	.uleb128 0x16
	.4byte	.LASF133
	.4byte	0x708000
	.uleb128 0x16
	.4byte	.LASF134
	.4byte	0x895440
	.uleb128 0x16
	.4byte	.LASF135
	.4byte	0xa037a0
	.byte	0
	.uleb128 0x3
	.4byte	.LASF136
	.byte	0x8
	.byte	0x50
	.4byte	0x493
	.uleb128 0xb
	.byte	0x1
	.4byte	0x37
	.byte	0x8
	.byte	0x54
	.4byte	0x5b0
	.uleb128 0xc
	.4byte	.LASF137
	.byte	0x5
	.uleb128 0xc
	.4byte	.LASF138
	.byte	0x6
	.uleb128 0xc
	.4byte	.LASF139
	.byte	0x7
	.uleb128 0xc
	.4byte	.LASF140
	.byte	0x8
	.uleb128 0xc
	.4byte	.LASF141
	.byte	0x9
	.byte	0
	.uleb128 0x3
	.4byte	.LASF142
	.byte	0x8
	.byte	0x5a
	.4byte	0x585
	.uleb128 0xb
	.byte	0x1
	.4byte	0x37
	.byte	0x8
	.byte	0x5e
	.4byte	0x5e0
	.uleb128 0xc
	.4byte	.LASF143
	.byte	0
	.uleb128 0xc
	.4byte	.LASF144
	.byte	0x1
	.uleb128 0xc
	.4byte	.LASF145
	.byte	0x2
	.uleb128 0xc
	.4byte	.LASF146
	.byte	0x3
	.byte	0
	.uleb128 0x3
	.4byte	.LASF147
	.byte	0x8
	.byte	0x63
	.4byte	0x5bb
	.uleb128 0xb
	.byte	0x1
	.4byte	0x37
	.byte	0x8
	.byte	0x67
	.4byte	0x60a
	.uleb128 0xc
	.4byte	.LASF148
	.byte	0
	.uleb128 0xc
	.4byte	.LASF149
	.byte	0x1
	.uleb128 0xc
	.4byte	.LASF150
	.byte	0x2
	.byte	0
	.uleb128 0x3
	.4byte	.LASF151
	.byte	0x8
	.byte	0x6b
	.4byte	0x5eb
	.uleb128 0xb
	.byte	0x1
	.4byte	0x37
	.byte	0x8
	.byte	0x6f
	.4byte	0x63a
	.uleb128 0xc
	.4byte	.LASF152
	.byte	0
	.uleb128 0xc
	.4byte	.LASF153
	.byte	0x1
	.uleb128 0xc
	.4byte	.LASF154
	.byte	0x2
	.uleb128 0xc
	.4byte	.LASF155
	.byte	0x3
	.byte	0
	.uleb128 0x3
	.4byte	.LASF156
	.byte	0x8
	.byte	0x74
	.4byte	0x615
	.uleb128 0xb
	.byte	0x1
	.4byte	0x37
	.byte	0x8
	.byte	0x78
	.4byte	0x66a
	.uleb128 0xc
	.4byte	.LASF157
	.byte	0
	.uleb128 0xc
	.4byte	.LASF158
	.byte	0x1
	.uleb128 0xc
	.4byte	.LASF159
	.byte	0x2
	.uleb128 0xc
	.4byte	.LASF160
	.byte	0x3
	.byte	0
	.uleb128 0x3
	.4byte	.LASF161
	.byte	0x8
	.byte	0x7d
	.4byte	0x645
	.uleb128 0x14
	.byte	0xc
	.byte	0x8
	.byte	0x7f
	.4byte	0x6c6
	.uleb128 0x7
	.4byte	.LASF162
	.byte	0x8
	.byte	0x81
	.4byte	0x57a
	.byte	0
	.uleb128 0x7
	.4byte	.LASF163
	.byte	0x8
	.byte	0x82
	.4byte	0x5b0
	.byte	0x4
	.uleb128 0x7
	.4byte	.LASF164
	.byte	0x8
	.byte	0x83
	.4byte	0x5e0
	.byte	0x5
	.uleb128 0x7
	.4byte	.LASF165
	.byte	0x8
	.byte	0x84
	.4byte	0x60a
	.byte	0x6
	.uleb128 0x7
	.4byte	.LASF166
	.byte	0x8
	.byte	0x85
	.4byte	0x63a
	.byte	0x7
	.uleb128 0x7
	.4byte	.LASF167
	.byte	0x8
	.byte	0x86
	.4byte	0x66a
	.byte	0x8
	.byte	0
	.uleb128 0x3
	.4byte	.LASF168
	.byte	0x8
	.byte	0x87
	.4byte	0x675
	.uleb128 0x14
	.byte	0x20
	.byte	0x1
	.byte	0x1e
	.4byte	0x720
	.uleb128 0x7
	.4byte	.LASF169
	.byte	0x1
	.byte	0x20
	.4byte	0x720
	.byte	0
	.uleb128 0x7
	.4byte	.LASF170
	.byte	0x1
	.byte	0x21
	.4byte	0x1fc
	.byte	0x4
	.uleb128 0x7
	.4byte	.LASF171
	.byte	0x1
	.byte	0x22
	.4byte	0x6c6
	.byte	0x8
	.uleb128 0x7
	.4byte	.LASF172
	.byte	0x1
	.byte	0x23
	.4byte	0x5e
	.byte	0x14
	.uleb128 0x17
	.ascii	"rx\000"
	.byte	0x1
	.byte	0x24
	.4byte	0x726
	.byte	0x18
	.uleb128 0x17
	.ascii	"tx\000"
	.byte	0x1
	.byte	0x25
	.4byte	0x726
	.byte	0x1c
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.4byte	0x3e1
	.uleb128 0xa
	.byte	0x4
	.4byte	0x488
	.uleb128 0x3
	.4byte	.LASF173
	.byte	0x1
	.byte	0x26
	.4byte	0x6d1
	.uleb128 0x18
	.4byte	.LASF175
	.byte	0x1
	.byte	0x62
	.4byte	0x57
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x77a
	.uleb128 0x19
	.4byte	.LASF177
	.byte	0x1
	.byte	0x62
	.4byte	0x7e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1a
	.4byte	.LASF174
	.byte	0x1
	.byte	0x64
	.4byte	0x77a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1b
	.ascii	"rc\000"
	.byte	0x1
	.byte	0x65
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.4byte	0x72c
	.uleb128 0x18
	.4byte	.LASF176
	.byte	0x1
	.byte	0x6c
	.4byte	0x57
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x7c3
	.uleb128 0x19
	.4byte	.LASF177
	.byte	0x1
	.byte	0x6c
	.4byte	0x7e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1a
	.4byte	.LASF174
	.byte	0x1
	.byte	0x6e
	.4byte	0x77a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1b
	.ascii	"rc\000"
	.byte	0x1
	.byte	0x6f
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x1c
	.4byte	.LASF178
	.byte	0x1
	.byte	0x75
	.4byte	0x57
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x806
	.uleb128 0x19
	.4byte	.LASF177
	.byte	0x1
	.byte	0x75
	.4byte	0x7e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1a
	.4byte	.LASF174
	.byte	0x1
	.byte	0x77
	.4byte	0x77a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1b
	.ascii	"rc\000"
	.byte	0x1
	.byte	0x78
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x18
	.4byte	.LASF179
	.byte	0x1
	.byte	0x7d
	.4byte	0x57
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x87b
	.uleb128 0x19
	.4byte	.LASF177
	.byte	0x1
	.byte	0x7d
	.4byte	0x7e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x19
	.4byte	.LASF180
	.byte	0x1
	.byte	0x7d
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1b
	.ascii	"rc\000"
	.byte	0x1
	.byte	0x7f
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1d
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.4byte	0x863
	.uleb128 0x1e
	.4byte	.LASF181
	.byte	0x1
	.byte	0x81
	.4byte	0x57
	.uleb128 0x1f
	.byte	0
	.byte	0
	.uleb128 0x20
	.4byte	.LBB3
	.4byte	.LBE3-.LBB3
	.uleb128 0x1e
	.4byte	.LASF182
	.byte	0x1
	.byte	0x83
	.4byte	0x57
	.uleb128 0x1f
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x21
	.4byte	.LASF183
	.byte	0x1
	.byte	0x88
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x89f
	.uleb128 0x19
	.4byte	.LASF177
	.byte	0x1
	.byte	0x88
	.4byte	0x77a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x21
	.4byte	.LASF184
	.byte	0x1
	.byte	0x8e
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x8c3
	.uleb128 0x19
	.4byte	.LASF177
	.byte	0x1
	.byte	0x8e
	.4byte	0x77a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x18
	.4byte	.LASF185
	.byte	0x1
	.byte	0x94
	.4byte	0x57
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x92c
	.uleb128 0x19
	.4byte	.LASF177
	.byte	0x1
	.byte	0x94
	.4byte	0x7e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x19
	.4byte	.LASF171
	.byte	0x1
	.byte	0x94
	.4byte	0x92c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1b
	.ascii	"rc\000"
	.byte	0x1
	.byte	0x96
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1a
	.4byte	.LASF174
	.byte	0x1
	.byte	0x97
	.4byte	0x77a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x20
	.4byte	.LBB4
	.4byte	.LBE4-.LBB4
	.uleb128 0x1a
	.4byte	.LASF186
	.byte	0x1
	.byte	0x9f
	.4byte	0x43e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.4byte	0x6c6
	.uleb128 0x1c
	.4byte	.LASF187
	.byte	0x1
	.byte	0xed
	.4byte	0x57
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x959
	.uleb128 0x22
	.ascii	"fd\000"
	.byte	0x1
	.byte	0xed
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x1c
	.4byte	.LASF188
	.byte	0x1
	.byte	0xf3
	.4byte	0x57
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x980
	.uleb128 0x22
	.ascii	"fd\000"
	.byte	0x1
	.byte	0xf3
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x1c
	.4byte	.LASF189
	.byte	0x1
	.byte	0xf8
	.4byte	0x726
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x9c4
	.uleb128 0x19
	.4byte	.LASF177
	.byte	0x1
	.byte	0xf8
	.4byte	0x7e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x19
	.4byte	.LASF190
	.byte	0x1
	.byte	0xf8
	.4byte	0x726
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1a
	.4byte	.LASF174
	.byte	0x1
	.byte	0xfa
	.4byte	0x77a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x1c
	.4byte	.LASF191
	.byte	0x1
	.byte	0xff
	.4byte	0x726
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xa09
	.uleb128 0x19
	.4byte	.LASF177
	.byte	0x1
	.byte	0xff
	.4byte	0x7e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x19
	.4byte	.LASF192
	.byte	0x1
	.byte	0xff
	.4byte	0x726
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x23
	.4byte	.LASF174
	.byte	0x1
	.2byte	0x101
	.4byte	0x77a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x24
	.4byte	.LASF193
	.byte	0x1
	.2byte	0x106
	.4byte	0x726
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xa42
	.uleb128 0x25
	.4byte	.LASF177
	.byte	0x1
	.2byte	0x106
	.4byte	0x7e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x23
	.4byte	.LASF174
	.byte	0x1
	.2byte	0x108
	.4byte	0x77a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x24
	.4byte	.LASF194
	.byte	0x1
	.2byte	0x10c
	.4byte	0x726
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xa7b
	.uleb128 0x25
	.4byte	.LASF177
	.byte	0x1
	.2byte	0x10c
	.4byte	0x7e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x23
	.4byte	.LASF174
	.byte	0x1
	.2byte	0x10e
	.4byte	0x77a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x24
	.4byte	.LASF195
	.byte	0x1
	.2byte	0x112
	.4byte	0x1fc
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xab4
	.uleb128 0x25
	.4byte	.LASF177
	.byte	0x1
	.2byte	0x112
	.4byte	0x7e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x23
	.4byte	.LASF174
	.byte	0x1
	.2byte	0x114
	.4byte	0x77a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x24
	.4byte	.LASF196
	.byte	0x1
	.2byte	0x118
	.4byte	0x5e
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xaed
	.uleb128 0x25
	.4byte	.LASF177
	.byte	0x1
	.2byte	0x118
	.4byte	0x7e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x23
	.4byte	.LASF174
	.byte	0x1
	.2byte	0x11a
	.4byte	0x77a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x24
	.4byte	.LASF197
	.byte	0x1
	.2byte	0x11e
	.4byte	0x5e
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xb35
	.uleb128 0x25
	.4byte	.LASF177
	.byte	0x1
	.2byte	0x11e
	.4byte	0x7e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x25
	.4byte	.LASF172
	.byte	0x1
	.2byte	0x11e
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x23
	.4byte	.LASF174
	.byte	0x1
	.2byte	0x120
	.4byte	0x77a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x24
	.4byte	.LASF198
	.byte	0x1
	.2byte	0x125
	.4byte	0x87
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xb7c
	.uleb128 0x25
	.4byte	.LASF177
	.byte	0x1
	.2byte	0x125
	.4byte	0x7e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x23
	.4byte	.LASF174
	.byte	0x1
	.2byte	0x127
	.4byte	0x77a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x26
	.ascii	"rc\000"
	.byte	0x1
	.2byte	0x128
	.4byte	0x87
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0x24
	.4byte	.LASF199
	.byte	0x1
	.2byte	0x12c
	.4byte	0x87
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xbc3
	.uleb128 0x25
	.4byte	.LASF177
	.byte	0x1
	.2byte	0x12c
	.4byte	0x7e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x23
	.4byte	.LASF174
	.byte	0x1
	.2byte	0x12e
	.4byte	0x77a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x26
	.ascii	"rc\000"
	.byte	0x1
	.2byte	0x12f
	.4byte	0x87
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0x24
	.4byte	.LASF200
	.byte	0x1
	.2byte	0x133
	.4byte	0x87
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xc18
	.uleb128 0x25
	.4byte	.LASF177
	.byte	0x1
	.2byte	0x133
	.4byte	0x7e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x23
	.4byte	.LASF174
	.byte	0x1
	.2byte	0x135
	.4byte	0x77a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x26
	.ascii	"sr\000"
	.byte	0x1
	.2byte	0x136
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x26
	.ascii	"rc\000"
	.byte	0x1
	.2byte	0x137
	.4byte	0x87
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.uleb128 0x24
	.4byte	.LASF201
	.byte	0x1
	.2byte	0x13b
	.4byte	0x57
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xc5f
	.uleb128 0x25
	.4byte	.LASF177
	.byte	0x1
	.2byte	0x13b
	.4byte	0x7e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x27
	.ascii	"ch\000"
	.byte	0x1
	.2byte	0x13b
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x23
	.4byte	.LASF174
	.byte	0x1
	.2byte	0x13d
	.4byte	0x77a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x24
	.4byte	.LASF202
	.byte	0x1
	.2byte	0x142
	.4byte	0x57
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xc98
	.uleb128 0x25
	.4byte	.LASF177
	.byte	0x1
	.2byte	0x142
	.4byte	0x7e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x23
	.4byte	.LASF174
	.byte	0x1
	.2byte	0x144
	.4byte	0x77a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x28
	.4byte	.LASF203
	.byte	0x1
	.2byte	0x149
	.4byte	.LFB53
	.4byte	.LFE53-.LFB53
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xccd
	.uleb128 0x25
	.4byte	.LASF177
	.byte	0x1
	.2byte	0x149
	.4byte	0x7e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x23
	.4byte	.LASF174
	.byte	0x1
	.2byte	0x14b
	.4byte	0x77a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x28
	.4byte	.LASF204
	.byte	0x1
	.2byte	0x150
	.4byte	.LFB54
	.4byte	.LFE54-.LFB54
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xd02
	.uleb128 0x25
	.4byte	.LASF177
	.byte	0x1
	.2byte	0x150
	.4byte	0x7e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x23
	.4byte	.LASF174
	.byte	0x1
	.2byte	0x152
	.4byte	0x77a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x29
	.4byte	.LASF205
	.byte	0x1
	.2byte	0x157
	.4byte	.LFB55
	.4byte	.LFE55-.LFB55
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xd46
	.uleb128 0x25
	.4byte	.LASF170
	.byte	0x1
	.2byte	0x157
	.4byte	0x1fc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -25
	.uleb128 0x27
	.ascii	"arg\000"
	.byte	0x1
	.2byte	0x157
	.4byte	0x7e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x23
	.4byte	.LASF177
	.byte	0x1
	.2byte	0x159
	.4byte	0x77a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x2a
	.4byte	0xd56
	.4byte	0xd56
	.uleb128 0x2b
	.4byte	0x8e
	.byte	0x2
	.byte	0
	.uleb128 0x2c
	.4byte	0x124
	.uleb128 0x2d
	.4byte	.LASF206
	.byte	0x1
	.byte	0x48
	.4byte	0xd6c
	.uleb128 0x5
	.byte	0x3
	.4byte	_stdio_
	.uleb128 0x2c
	.4byte	0xd46
	.uleb128 0x2a
	.4byte	0x72c
	.4byte	0xd81
	.uleb128 0x2b
	.4byte	0x8e
	.byte	0x2
	.byte	0
	.uleb128 0x2d
	.4byte	.LASF207
	.byte	0x1
	.byte	0x28
	.4byte	0xd71
	.uleb128 0x5
	.byte	0x3
	.4byte	device_info
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
	.uleb128 0x7
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
	.uleb128 0x8
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
	.uleb128 0x9
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
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
	.uleb128 0xc
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
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
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x15
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0x19
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
	.uleb128 0x1a
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
	.uleb128 0x1b
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
	.uleb128 0x1d
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
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
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0x22
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
	.uleb128 0x23
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
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x24
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
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x25
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
	.uleb128 0x26
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
	.uleb128 0x27
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
	.uleb128 0x28
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
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x29
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
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2b
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x2c
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2d
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
	.4byte	0xa7b
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0xd93
	.4byte	0x217
	.ascii	"NonMaskableInt_IRQn\000"
	.4byte	0x21d
	.ascii	"HardFault_IRQn\000"
	.4byte	0x223
	.ascii	"SVC_IRQn\000"
	.4byte	0x229
	.ascii	"PendSV_IRQn\000"
	.4byte	0x22f
	.ascii	"SysTick_IRQn\000"
	.4byte	0x235
	.ascii	"WWDG_IRQn\000"
	.4byte	0x23b
	.ascii	"PVD_IRQn\000"
	.4byte	0x241
	.ascii	"RTC_IRQn\000"
	.4byte	0x247
	.ascii	"FLASH_IRQn\000"
	.4byte	0x24d
	.ascii	"RCC_IRQn\000"
	.4byte	0x253
	.ascii	"EXTI0_1_IRQn\000"
	.4byte	0x259
	.ascii	"EXTI2_3_IRQn\000"
	.4byte	0x25f
	.ascii	"EXTI4_15_IRQn\000"
	.4byte	0x265
	.ascii	"TS_IRQn\000"
	.4byte	0x26b
	.ascii	"DMA1_Channel1_IRQn\000"
	.4byte	0x271
	.ascii	"DMA1_Channel2_3_IRQn\000"
	.4byte	0x277
	.ascii	"DMA1_Channel4_5_IRQn\000"
	.4byte	0x27d
	.ascii	"ADC1_COMP_IRQn\000"
	.4byte	0x283
	.ascii	"TIM1_BRK_UP_TRG_COM_IRQn\000"
	.4byte	0x289
	.ascii	"TIM1_CC_IRQn\000"
	.4byte	0x28f
	.ascii	"TIM2_IRQn\000"
	.4byte	0x295
	.ascii	"TIM3_IRQn\000"
	.4byte	0x29b
	.ascii	"TIM6_DAC_IRQn\000"
	.4byte	0x2a1
	.ascii	"TIM14_IRQn\000"
	.4byte	0x2a7
	.ascii	"TIM15_IRQn\000"
	.4byte	0x2ad
	.ascii	"TIM16_IRQn\000"
	.4byte	0x2b3
	.ascii	"TIM17_IRQn\000"
	.4byte	0x2b9
	.ascii	"I2C1_IRQn\000"
	.4byte	0x2bf
	.ascii	"I2C2_IRQn\000"
	.4byte	0x2c5
	.ascii	"SPI1_IRQn\000"
	.4byte	0x2cb
	.ascii	"SPI2_IRQn\000"
	.4byte	0x2d1
	.ascii	"USART1_IRQn\000"
	.4byte	0x2d7
	.ascii	"USART2_IRQn\000"
	.4byte	0x2dd
	.ascii	"CEC_IRQn\000"
	.4byte	0x2f5
	.ascii	"DISABLE\000"
	.4byte	0x2fb
	.ascii	"ENABLE\000"
	.4byte	0x49f
	.ascii	"CARIBOU_UART_BAUD_RATE_110\000"
	.4byte	0x4a5
	.ascii	"CARIBOU_UART_BAUD_RATE_300\000"
	.4byte	0x4ac
	.ascii	"CARIBOU_UART_BAUD_RATE_600\000"
	.4byte	0x4b3
	.ascii	"CARIBOU_UART_BAUD_RATE_1200\000"
	.4byte	0x4ba
	.ascii	"CARIBOU_UART_BAUD_RATE_2400\000"
	.4byte	0x4c1
	.ascii	"CARIBOU_UART_BAUD_RATE_4800\000"
	.4byte	0x4c8
	.ascii	"CARIBOU_UART_BAUD_RATE_9600\000"
	.4byte	0x4cf
	.ascii	"CARIBOU_UART_BAUD_RATE_19200\000"
	.4byte	0x4d6
	.ascii	"CARIBOU_UART_BAUD_RATE_28800\000"
	.4byte	0x4dd
	.ascii	"CARIBOU_UART_BAUD_RATE_38400\000"
	.4byte	0x4e4
	.ascii	"CARIBOU_UART_BAUD_RATE_56000\000"
	.4byte	0x4eb
	.ascii	"CARIBOU_UART_BAUD_RATE_57600\000"
	.4byte	0x4f2
	.ascii	"CARIBOU_UART_BAUD_RATE_115200\000"
	.4byte	0x4fb
	.ascii	"CARIBOU_UART_BAUD_RATE_128000\000"
	.4byte	0x504
	.ascii	"CARIBOU_UART_BAUD_RATE_153600\000"
	.4byte	0x50d
	.ascii	"CARIBOU_UART_BAUD_RATE_230400\000"
	.4byte	0x516
	.ascii	"CARIBOU_UART_BAUD_RATE_256000\000"
	.4byte	0x51f
	.ascii	"CARIBOU_UART_BAUD_RATE_460800\000"
	.4byte	0x528
	.ascii	"CARIBOU_UART_BAUD_RATE_921600\000"
	.4byte	0x531
	.ascii	"CARIBOU_UART_BAUD_RATE_1792000\000"
	.4byte	0x53a
	.ascii	"CARIBOU_UART_BAUD_RATE_1843200\000"
	.4byte	0x543
	.ascii	"CARIBOU_UART_BAUD_RATE_3584000\000"
	.4byte	0x54c
	.ascii	"CARIBOU_UART_BAUD_RATE_3686400\000"
	.4byte	0x555
	.ascii	"CARIBOU_UART_BAUD_RATE_7168000\000"
	.4byte	0x55e
	.ascii	"CARIBOU_UART_BAUD_RATE_7372800\000"
	.4byte	0x567
	.ascii	"CARIBOU_UART_BAUD_RATE_9000000\000"
	.4byte	0x570
	.ascii	"CARIBOU_UART_BAUD_RATE_10500000\000"
	.4byte	0x591
	.ascii	"CARIBOU_UART_WORDSIZE_5\000"
	.4byte	0x597
	.ascii	"CARIBOU_UART_WORDSIZE_6\000"
	.4byte	0x59d
	.ascii	"CARIBOU_UART_WORDSIZE_7\000"
	.4byte	0x5a3
	.ascii	"CARIBOU_UART_WORDSIZE_8\000"
	.4byte	0x5a9
	.ascii	"CARIBOU_UART_WORDSIZE_9\000"
	.4byte	0x5c7
	.ascii	"CARIBOU_UART_STOPBITS_05\000"
	.4byte	0x5cd
	.ascii	"CARIBOU_UART_STOPBITS_1\000"
	.4byte	0x5d3
	.ascii	"CARIBOU_UART_STOPBITS_15\000"
	.4byte	0x5d9
	.ascii	"CARIBOU_UART_STOPBITS_2\000"
	.4byte	0x5f7
	.ascii	"CARIBOU_UART_PARITY_NONE\000"
	.4byte	0x5fd
	.ascii	"CARIBOU_UART_PARITY_EVEN\000"
	.4byte	0x603
	.ascii	"CARIBOU_UART_PARITY_ODD\000"
	.4byte	0x621
	.ascii	"CARIBOU_UART_FLOW_NONE\000"
	.4byte	0x627
	.ascii	"CARIBOU_UART_FLOW_RTS\000"
	.4byte	0x62d
	.ascii	"CARIBOU_UART_FLOW_CTS\000"
	.4byte	0x633
	.ascii	"CARIBOU_UART_FLOW_RTS_CTS\000"
	.4byte	0x651
	.ascii	"CARIBOU_UART_DMA_NONE\000"
	.4byte	0x657
	.ascii	"CARIBOU_UART_DMA_RX\000"
	.4byte	0x65d
	.ascii	"CARIBOU_UART_DMA_TX\000"
	.4byte	0x663
	.ascii	"CARIBOU_UART_DMA_BOTH\000"
	.4byte	0x737
	.ascii	"chip_uart_int_enable\000"
	.4byte	0x780
	.ascii	"chip_uart_int_disable\000"
	.4byte	0x7c3
	.ascii	"chip_uart_int_enabled\000"
	.4byte	0x806
	.ascii	"chip_uart_int_set\000"
	.4byte	0x855
	.ascii	"uart_enable_interrupts\000"
	.4byte	0x86c
	.ascii	"uart_disable_interrupts\000"
	.4byte	0x87b
	.ascii	"uart_enable\000"
	.4byte	0x89f
	.ascii	"uart_disable\000"
	.4byte	0x8c3
	.ascii	"chip_uart_set_config\000"
	.4byte	0x932
	.ascii	"chip_uart_open\000"
	.4byte	0x959
	.ascii	"chip_uart_close\000"
	.4byte	0x980
	.ascii	"chip_uart_set_rx_queue\000"
	.4byte	0x9c4
	.ascii	"chip_uart_set_tx_queue\000"
	.4byte	0xa09
	.ascii	"chip_uart_rx_queue\000"
	.4byte	0xa42
	.ascii	"chip_uart_tx_queue\000"
	.4byte	0xa7b
	.ascii	"chip_uart_interrupt_vector\000"
	.4byte	0xab4
	.ascii	"chip_uart_status\000"
	.4byte	0xaed
	.ascii	"chip_uart_set_status\000"
	.4byte	0xb35
	.ascii	"chip_uart_tx_busy\000"
	.4byte	0xb7c
	.ascii	"chip_uart_tx_ready\000"
	.4byte	0xbc3
	.ascii	"chip_uart_rx_ready\000"
	.4byte	0xc18
	.ascii	"chip_uart_tx_data\000"
	.4byte	0xc5f
	.ascii	"chip_uart_rx_data\000"
	.4byte	0xc98
	.ascii	"chip_uart_tx_start\000"
	.4byte	0xccd
	.ascii	"chip_uart_tx_stop\000"
	.4byte	0xd02
	.ascii	"isr_uart\000"
	.4byte	0xd5b
	.ascii	"_stdio_\000"
	.4byte	0xd81
	.ascii	"device_info\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0x21d
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0xd93
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
	.4byte	0x69
	.ascii	"unsigned int\000"
	.4byte	0x5e
	.ascii	"uint32_t\000"
	.4byte	0x70
	.ascii	"long long int\000"
	.4byte	0x77
	.ascii	"long long unsigned int\000"
	.4byte	0x80
	.ascii	"long int\000"
	.4byte	0x87
	.ascii	"char\000"
	.4byte	0x8e
	.ascii	"sizetype\000"
	.4byte	0x95
	.ascii	"_stdio_t\000"
	.4byte	0x124
	.ascii	"stdio_t\000"
	.4byte	0x1fc
	.ascii	"InterruptVector\000"
	.4byte	0x207
	.ascii	"IRQn\000"
	.4byte	0x3e1
	.ascii	"USART_TypeDef\000"
	.4byte	0x43e
	.ascii	"USART_InitTypeDef\000"
	.4byte	0x488
	.ascii	"caribou_bytequeue_t\000"
	.4byte	0x57a
	.ascii	"caribou_uart_baud_t\000"
	.4byte	0x5b0
	.ascii	"caribou_uart_word_t\000"
	.4byte	0x5e0
	.ascii	"caribou_uart_stop_t\000"
	.4byte	0x60a
	.ascii	"caribou_uart_parity_t\000"
	.4byte	0x63a
	.ascii	"caribou_uart_flow_t\000"
	.4byte	0x66a
	.ascii	"caribou_uart_dma_t\000"
	.4byte	0x6c6
	.ascii	"caribou_uart_config_t\000"
	.4byte	0x72c
	.ascii	"chip_uart_private_t\000"
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0xd4
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
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF47:
	.ascii	"Vector_USART1\000"
.LASF48:
	.ascii	"Vector_USART2\000"
.LASF65:
	.ascii	"EXTI4_15_IRQn\000"
.LASF120:
	.ascii	"CARIBOU_UART_BAUD_RATE_57600\000"
.LASF165:
	.ascii	"parity_bits\000"
.LASF108:
	.ascii	"caribou_bytequeue_t\000"
.LASF156:
	.ascii	"caribou_uart_flow_t\000"
.LASF110:
	.ascii	"CARIBOU_UART_BAUD_RATE_300\000"
.LASF17:
	.ascii	"writequeuefn\000"
.LASF64:
	.ascii	"EXTI2_3_IRQn\000"
.LASF55:
	.ascii	"SVC_IRQn\000"
.LASF15:
	.ascii	"writefn\000"
.LASF119:
	.ascii	"CARIBOU_UART_BAUD_RATE_56000\000"
.LASF7:
	.ascii	"unsigned int\000"
.LASF148:
	.ascii	"CARIBOU_UART_PARITY_NONE\000"
.LASF78:
	.ascii	"TIM16_IRQn\000"
.LASF106:
	.ascii	"head\000"
.LASF149:
	.ascii	"CARIBOU_UART_PARITY_EVEN\000"
.LASF143:
	.ascii	"CARIBOU_UART_STOPBITS_05\000"
.LASF61:
	.ascii	"FLASH_IRQn\000"
.LASF98:
	.ascii	"USART_WordLength\000"
.LASF63:
	.ascii	"EXTI0_1_IRQn\000"
.LASF31:
	.ascii	"Vector_DMA_CH4_5\000"
.LASF121:
	.ascii	"CARIBOU_UART_BAUD_RATE_115200\000"
.LASF99:
	.ascii	"USART_StopBits\000"
.LASF113:
	.ascii	"CARIBOU_UART_BAUD_RATE_2400\000"
.LASF130:
	.ascii	"CARIBOU_UART_BAUD_RATE_3584000\000"
.LASF183:
	.ascii	"uart_enable\000"
.LASF128:
	.ascii	"CARIBOU_UART_BAUD_RATE_1792000\000"
.LASF80:
	.ascii	"I2C1_IRQn\000"
.LASF56:
	.ascii	"PendSV_IRQn\000"
.LASF125:
	.ascii	"CARIBOU_UART_BAUD_RATE_256000\000"
.LASF145:
	.ascii	"CARIBOU_UART_STOPBITS_15\000"
.LASF137:
	.ascii	"CARIBOU_UART_WORDSIZE_5\000"
.LASF138:
	.ascii	"CARIBOU_UART_WORDSIZE_6\000"
.LASF139:
	.ascii	"CARIBOU_UART_WORDSIZE_7\000"
.LASF140:
	.ascii	"CARIBOU_UART_WORDSIZE_8\000"
.LASF123:
	.ascii	"CARIBOU_UART_BAUD_RATE_153600\000"
.LASF62:
	.ascii	"RCC_IRQn\000"
.LASF202:
	.ascii	"chip_uart_rx_data\000"
.LASF90:
	.ascii	"GTPR\000"
.LASF177:
	.ascii	"device\000"
.LASF6:
	.ascii	"uint32_t\000"
.LASF97:
	.ascii	"USART_BaudRate\000"
.LASF201:
	.ascii	"chip_uart_tx_data\000"
.LASF195:
	.ascii	"chip_uart_interrupt_vector\000"
.LASF208:
	.ascii	"GNU C99 5.4.1 20160609 (release) [ARM/embedded-5-br"
	.ascii	"anch revision 237715] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -gpubnames -std=gnu"
	.ascii	"99 -fno-dwarf2-cfi-asm -fno-builtin -ffunction-sect"
	.ascii	"ions -fdata-sections -fshort-double -fshort-enums -"
	.ascii	"fno-common\000"
.LASF105:
	.ascii	"size\000"
.LASF27:
	.ascii	"Vector_EXTI4_15\000"
.LASF16:
	.ascii	"readqueuefn\000"
.LASF111:
	.ascii	"CARIBOU_UART_BAUD_RATE_600\000"
.LASF185:
	.ascii	"chip_uart_set_config\000"
.LASF82:
	.ascii	"SPI1_IRQn\000"
.LASF158:
	.ascii	"CARIBOU_UART_DMA_RX\000"
.LASF9:
	.ascii	"long long unsigned int\000"
.LASF38:
	.ascii	"Vector_Reserved1\000"
.LASF49:
	.ascii	"Vector_Reserved2\000"
.LASF170:
	.ascii	"vector\000"
.LASF178:
	.ascii	"chip_uart_int_enabled\000"
.LASF190:
	.ascii	"rx_queue\000"
.LASF210:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f091/crossworks\000"
.LASF51:
	.ascii	"Vector_SoftSysTick\000"
.LASF134:
	.ascii	"CARIBOU_UART_BAUD_RATE_9000000\000"
.LASF132:
	.ascii	"CARIBOU_UART_BAUD_RATE_7168000\000"
.LASF168:
	.ascii	"caribou_uart_config_t\000"
.LASF199:
	.ascii	"chip_uart_tx_ready\000"
.LASF109:
	.ascii	"CARIBOU_UART_BAUD_RATE_110\000"
.LASF150:
	.ascii	"CARIBOU_UART_PARITY_ODD\000"
.LASF101:
	.ascii	"USART_Mode\000"
.LASF85:
	.ascii	"USART2_IRQn\000"
.LASF30:
	.ascii	"Vector_DMA_CH2_3\000"
.LASF102:
	.ascii	"USART_HardwareFlowControl\000"
.LASF28:
	.ascii	"Vector_TSC\000"
.LASF204:
	.ascii	"chip_uart_tx_stop\000"
.LASF173:
	.ascii	"chip_uart_private_t\000"
.LASF136:
	.ascii	"caribou_uart_baud_t\000"
.LASF147:
	.ascii	"caribou_uart_stop_t\000"
.LASF176:
	.ascii	"chip_uart_int_disable\000"
.LASF206:
	.ascii	"_stdio_\000"
.LASF96:
	.ascii	"USART_TypeDef\000"
.LASF159:
	.ascii	"CARIBOU_UART_DMA_TX\000"
.LASF103:
	.ascii	"USART_InitTypeDef\000"
.LASF160:
	.ascii	"CARIBOU_UART_DMA_BOTH\000"
.LASF186:
	.ascii	"USART_InitStructure\000"
.LASF20:
	.ascii	"Vector_WWDG\000"
.LASF11:
	.ascii	"char\000"
.LASF87:
	.ascii	"DISABLE\000"
.LASF161:
	.ascii	"caribou_uart_dma_t\000"
.LASF74:
	.ascii	"TIM3_IRQn\000"
.LASF67:
	.ascii	"DMA1_Channel1_IRQn\000"
.LASF117:
	.ascii	"CARIBOU_UART_BAUD_RATE_28800\000"
.LASF211:
	.ascii	"_stdio_t\000"
.LASF77:
	.ascii	"TIM15_IRQn\000"
.LASF3:
	.ascii	"uint8_t\000"
.LASF172:
	.ascii	"status\000"
.LASF92:
	.ascii	"RTOR\000"
.LASF174:
	.ascii	"private_device\000"
.LASF131:
	.ascii	"CARIBOU_UART_BAUD_RATE_3686400\000"
.LASF151:
	.ascii	"caribou_uart_parity_t\000"
.LASF34:
	.ascii	"Vector_TIM1_CC\000"
.LASF24:
	.ascii	"Vector_RCC\000"
.LASF8:
	.ascii	"long long int\000"
.LASF58:
	.ascii	"WWDG_IRQn\000"
.LASF118:
	.ascii	"CARIBOU_UART_BAUD_RATE_38400\000"
.LASF33:
	.ascii	"Vector_TIM1_BRK_UP_TRG_COM\000"
.LASF184:
	.ascii	"uart_disable\000"
.LASF191:
	.ascii	"chip_uart_set_tx_queue\000"
.LASF203:
	.ascii	"chip_uart_tx_start\000"
.LASF200:
	.ascii	"chip_uart_rx_ready\000"
.LASF196:
	.ascii	"chip_uart_status\000"
.LASF152:
	.ascii	"CARIBOU_UART_FLOW_NONE\000"
.LASF66:
	.ascii	"TS_IRQn\000"
.LASF71:
	.ascii	"TIM1_BRK_UP_TRG_COM_IRQn\000"
.LASF26:
	.ascii	"Vector_EXTI2_3\000"
.LASF197:
	.ascii	"chip_uart_set_status\000"
.LASF43:
	.ascii	"Vector_I2C1\000"
.LASF44:
	.ascii	"Vector_I2C2\000"
.LASF194:
	.ascii	"chip_uart_tx_queue\000"
.LASF70:
	.ascii	"ADC1_COMP_IRQn\000"
.LASF175:
	.ascii	"chip_uart_int_enable\000"
.LASF163:
	.ascii	"word_size\000"
.LASF188:
	.ascii	"chip_uart_close\000"
.LASF22:
	.ascii	"Vector_RTC\000"
.LASF207:
	.ascii	"device_info\000"
.LASF187:
	.ascii	"chip_uart_open\000"
.LASF4:
	.ascii	"uint16_t\000"
.LASF212:
	.ascii	"IRQn\000"
.LASF45:
	.ascii	"Vector_SPI1\000"
.LASF46:
	.ascii	"Vector_SPI2\000"
.LASF141:
	.ascii	"CARIBOU_UART_WORDSIZE_9\000"
.LASF142:
	.ascii	"caribou_uart_word_t\000"
.LASF171:
	.ascii	"config\000"
.LASF60:
	.ascii	"RTC_IRQn\000"
.LASF89:
	.ascii	"RESERVED1\000"
.LASF91:
	.ascii	"RESERVED2\000"
.LASF93:
	.ascii	"RESERVED3\000"
.LASF94:
	.ascii	"RESERVED4\000"
.LASF95:
	.ascii	"RESERVED5\000"
.LASF2:
	.ascii	"short int\000"
.LASF154:
	.ascii	"CARIBOU_UART_FLOW_CTS\000"
.LASF10:
	.ascii	"long int\000"
.LASF84:
	.ascii	"USART1_IRQn\000"
.LASF164:
	.ascii	"stop_bits\000"
.LASF126:
	.ascii	"CARIBOU_UART_BAUD_RATE_460800\000"
.LASF53:
	.ascii	"NonMaskableInt_IRQn\000"
.LASF35:
	.ascii	"Vector_TIM2\000"
.LASF36:
	.ascii	"Vector_TIM3\000"
.LASF167:
	.ascii	"dma_mode\000"
.LASF72:
	.ascii	"TIM1_CC_IRQn\000"
.LASF14:
	.ascii	"readfn\000"
.LASF122:
	.ascii	"CARIBOU_UART_BAUD_RATE_128000\000"
.LASF76:
	.ascii	"TIM14_IRQn\000"
.LASF39:
	.ascii	"Vector_TIM14\000"
.LASF40:
	.ascii	"Vector_TIM15\000"
.LASF41:
	.ascii	"Vector_TIM16\000"
.LASF42:
	.ascii	"Vector_TIM17\000"
.LASF182:
	.ascii	"uart_disable_interrupts\000"
.LASF69:
	.ascii	"DMA1_Channel4_5_IRQn\000"
.LASF13:
	.ascii	"device_private\000"
.LASF59:
	.ascii	"PVD_IRQn\000"
.LASF79:
	.ascii	"TIM17_IRQn\000"
.LASF180:
	.ascii	"state\000"
.LASF112:
	.ascii	"CARIBOU_UART_BAUD_RATE_1200\000"
.LASF25:
	.ascii	"Vector_EXTI0_1\000"
.LASF155:
	.ascii	"CARIBOU_UART_FLOW_RTS_CTS\000"
.LASF57:
	.ascii	"SysTick_IRQn\000"
.LASF166:
	.ascii	"flow_control\000"
.LASF86:
	.ascii	"CEC_IRQn\000"
.LASF88:
	.ascii	"ENABLE\000"
.LASF12:
	.ascii	"sizetype\000"
.LASF129:
	.ascii	"CARIBOU_UART_BAUD_RATE_1843200\000"
.LASF81:
	.ascii	"I2C2_IRQn\000"
.LASF73:
	.ascii	"TIM2_IRQn\000"
.LASF169:
	.ascii	"base_address\000"
.LASF104:
	.ascii	"queue\000"
.LASF32:
	.ascii	"Vector_ADC_COMP\000"
.LASF68:
	.ascii	"DMA1_Channel2_3_IRQn\000"
.LASF153:
	.ascii	"CARIBOU_UART_FLOW_RTS\000"
.LASF193:
	.ascii	"chip_uart_rx_queue\000"
.LASF75:
	.ascii	"TIM6_DAC_IRQn\000"
.LASF23:
	.ascii	"Vector_FLASH\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF133:
	.ascii	"CARIBOU_UART_BAUD_RATE_7372800\000"
.LASF107:
	.ascii	"tail\000"
.LASF205:
	.ascii	"isr_uart\000"
.LASF18:
	.ascii	"statefn\000"
.LASF50:
	.ascii	"Vector_CEC\000"
.LASF114:
	.ascii	"CARIBOU_UART_BAUD_RATE_4800\000"
.LASF83:
	.ascii	"SPI2_IRQn\000"
.LASF189:
	.ascii	"chip_uart_set_rx_queue\000"
.LASF100:
	.ascii	"USART_Parity\000"
.LASF19:
	.ascii	"stdio_t\000"
.LASF37:
	.ascii	"Vector_TIM6_DAC\000"
.LASF192:
	.ascii	"tx_queue\000"
.LASF0:
	.ascii	"signed char\000"
.LASF5:
	.ascii	"short unsigned int\000"
.LASF157:
	.ascii	"CARIBOU_UART_DMA_NONE\000"
.LASF54:
	.ascii	"HardFault_IRQn\000"
.LASF135:
	.ascii	"CARIBOU_UART_BAUD_RATE_10500000\000"
.LASF198:
	.ascii	"chip_uart_tx_busy\000"
.LASF181:
	.ascii	"uart_enable_interrupts\000"
.LASF29:
	.ascii	"Vector_DMA_CH1\000"
.LASF21:
	.ascii	"Vector_PVD\000"
.LASF209:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f091/crossworks/../../../chip/stm"
	.ascii	"32/stm32f030/src/uart.c\000"
.LASF127:
	.ascii	"CARIBOU_UART_BAUD_RATE_921600\000"
.LASF52:
	.ascii	"InterruptVector\000"
.LASF115:
	.ascii	"CARIBOU_UART_BAUD_RATE_9600\000"
.LASF162:
	.ascii	"baud_rate\000"
.LASF124:
	.ascii	"CARIBOU_UART_BAUD_RATE_230400\000"
.LASF144:
	.ascii	"CARIBOU_UART_STOPBITS_1\000"
.LASF146:
	.ascii	"CARIBOU_UART_STOPBITS_2\000"
.LASF116:
	.ascii	"CARIBOU_UART_BAUD_RATE_19200\000"
.LASF179:
	.ascii	"chip_uart_int_set\000"
	.ident	"GCC: (GNU) 5.4.1 20160609 (release) [ARM/embedded-5-branch revision 237715]"
