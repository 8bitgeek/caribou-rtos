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
	.file	"mutex.c"
	.text
.Ltext0:
	.section	.text.caribou_mutex_new,"ax",%progbits
	.align	2
	.global	caribou_mutex_new
	.code	16
	.thumb_func
	.type	caribou_mutex_new, %function
caribou_mutex_new:
.LFB32:
	.file 1 "/home/mike/Documents/GitHub/caribou-rtos/caribou/target/board/nucleo_f030/crossworks/../../../../src/lib/mutex.c"
	.loc 1 33 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI0:
	sub	sp, sp, #16
.LCFI1:
	add	r7, sp, #0
.LCFI2:
	movs	r2, r0
	adds	r3, r7, #7
	strb	r2, [r3]
	.loc 1 34 0
	movs	r0, #8
	bl	malloc
	movs	r3, r0
	str	r3, [r7, #12]
	.loc 1 35 0
	ldr	r3, [r7, #12]
	cmp	r3, #0
	beq	.L2
	.loc 1 37 0
	adds	r3, r7, #7
	ldrb	r2, [r3]
	ldr	r3, [r7, #12]
	movs	r1, r2
	movs	r0, r3
	bl	caribou_mutex_init
	.loc 1 38 0
	ldr	r3, .L5
	movs	r2, #0
	str	r2, [r3]
	b	.L3
.L2:
	.loc 1 42 0
	ldr	r3, .L5
	movs	r2, #12
	str	r2, [r3]
.L3:
	.loc 1 44 0
	ldr	r3, [r7, #12]
	.loc 1 45 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L6:
	.align	2
.L5:
	.word	__errno
.LFE32:
	.size	caribou_mutex_new, .-caribou_mutex_new
	.section	.text.caribou_mutex_free,"ax",%progbits
	.align	2
	.global	caribou_mutex_free
	.code	16
	.thumb_func
	.type	caribou_mutex_free, %function
caribou_mutex_free:
.LFB33:
	.loc 1 52 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI3:
	sub	sp, sp, #8
.LCFI4:
	add	r7, sp, #0
.LCFI5:
	str	r0, [r7, #4]
	.loc 1 53 0
	ldr	r3, [r7, #4]
	cmp	r3, #0
	beq	.L9
	.loc 1 55 0
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	free
.L9:
	.loc 1 57 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE33:
	.size	caribou_mutex_free, .-caribou_mutex_free
	.section	.text.caribou_mutex_init,"ax",%progbits
	.align	2
	.global	caribou_mutex_init
	.code	16
	.thumb_func
	.type	caribou_mutex_init, %function
caribou_mutex_init:
.LFB34:
	.loc 1 67 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI6:
	sub	sp, sp, #8
.LCFI7:
	add	r7, sp, #0
.LCFI8:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #3
	strb	r2, [r3]
	.loc 1 68 0
	ldr	r3, [r7, #4]
	movs	r2, #8
	movs	r1, #0
	movs	r0, r3
	bl	memset
	.loc 1 69 0
	ldr	r3, [r7, #4]
	adds	r2, r7, #3
	ldrb	r2, [r2]
	strb	r2, [r3, #6]
	.loc 1 70 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE34:
	.size	caribou_mutex_init, .-caribou_mutex_init
	.section	.text.caribou_mutex_lock,"ax",%progbits
	.align	2
	.global	caribou_mutex_lock
	.code	16
	.thumb_func
	.type	caribou_mutex_lock, %function
caribou_mutex_lock:
.LFB35:
	.loc 1 85 0
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI9:
	sub	sp, sp, #40
.LCFI10:
	add	r7, sp, #0
.LCFI11:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 87 0
	bl	caribou_thread_lock
	.loc 1 88 0
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #7]
	adds	r3, r3, #1
	uxtb	r2, r3
	ldr	r3, [r7, #4]
	strb	r2, [r3, #7]
	.loc 1 89 0
	bl	caribou_thread_unlock
	.loc 1 90 0
	ldr	r3, [r7]
	cmp	r3, #0
	beq	.L13
	.loc 1 92 0
	ldr	r2, [r7]
	movs	r3, #12
	adds	r3, r7, r3
	movs	r1, r2
	movs	r0, r3
	bl	caribou_timer_set
	.loc 1 93 0
	movs	r3, #12
	adds	r0, r7, r3
	movs	r3, #2
	movs	r2, #0
	movs	r1, #0
	bl	caribou_timer_init
	.loc 1 95 0
	b	.L13
.L15:
	.loc 1 97 0
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #6]
	movs	r2, r3
	movs	r3, #1
	ands	r3, r2
	bne	.L13
	.loc 1 99 0
	bl	caribou_thread_yield
.L13:
	.loc 1 95 0
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	caribou_mutex_trylock
	subs	r3, r0, #0
	bne	.L14
	.loc 1 95 0 is_stmt 0 discriminator 1
	ldr	r3, [r7]
	cmp	r3, #0
	beq	.L15
	.loc 1 95 0 discriminator 2
	ldr	r3, [r7]
	cmp	r3, #0
	beq	.L14
	.loc 1 95 0 discriminator 3
	movs	r3, #12
	adds	r3, r7, r3
	movs	r0, r3
	bl	caribou_timer_expired
	subs	r3, r0, #0
	beq	.L15
.L14:
	.loc 1 102 0 is_stmt 1
	bl	caribou_thread_lock
	.loc 1 103 0
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #7]
	subs	r3, r3, #1
	uxtb	r2, r3
	ldr	r3, [r7, #4]
	strb	r2, [r3, #7]
	.loc 1 104 0
	bl	caribou_thread_unlock
	.loc 1 105 0
	movs	r3, #1
	.loc 1 106 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #40
	@ sp needed
	pop	{r7, pc}
.LFE35:
	.size	caribou_mutex_lock, .-caribou_mutex_lock
	.section	.text.caribou_mutex_trylock,"ax",%progbits
	.align	2
	.global	caribou_mutex_trylock
	.code	16
	.thumb_func
	.type	caribou_mutex_trylock, %function
caribou_mutex_trylock:
.LFB36:
	.loc 1 119 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI12:
	sub	sp, sp, #16
.LCFI13:
	add	r7, sp, #0
.LCFI14:
	str	r0, [r7, #4]
	.loc 1 121 0
	bl	caribou_thread_current
	movs	r3, r0
	str	r3, [r7, #8]
	.loc 1 122 0
	bl	caribou_thread_lock
	.loc 1 123 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #4]
	cmp	r3, #0
	beq	.L18
	.loc 1 125 0
	ldr	r3, [r7, #4]
	ldr	r2, [r3]
	ldr	r3, [r7, #8]
	cmp	r2, r3
	beq	.L19
	.loc 1 127 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
	b	.L22
.L19:
	.loc 1 129 0
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #6]
	movs	r2, r3
	movs	r3, #2
	ands	r3, r2
	beq	.L21
	.loc 1 131 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #4]
	adds	r3, r3, #1
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #4]
	.loc 1 132 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #1
	strb	r2, [r3]
	b	.L22
.L21:
	.loc 1 136 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
	b	.L22
.L18:
	.loc 1 142 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #4]
	adds	r3, r3, #1
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #4]
	.loc 1 143 0
	ldr	r3, [r7, #4]
	ldr	r2, [r7, #8]
	str	r2, [r3]
	.loc 1 144 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #1
	strb	r2, [r3]
.L22:
	.loc 1 146 0
	bl	caribou_thread_unlock
	.loc 1 147 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 1 148 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE36:
	.size	caribou_mutex_trylock, .-caribou_mutex_trylock
	.section	.text.caribou_mutex_unlock,"ax",%progbits
	.align	2
	.global	caribou_mutex_unlock
	.code	16
	.thumb_func
	.type	caribou_mutex_unlock, %function
caribou_mutex_unlock:
.LFB37:
	.loc 1 159 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
.LCFI15:
	sub	sp, sp, #20
.LCFI16:
	add	r7, sp, #0
.LCFI17:
	str	r0, [r7, #4]
	.loc 1 160 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 161 0
	bl	caribou_thread_lock
	.loc 1 162 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #4]
	cmp	r3, #0
	beq	.L25
	.loc 1 162 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #4]
	ldr	r4, [r3]
	bl	caribou_thread_current
	movs	r3, r0
	cmp	r4, r3
	bne	.L25
	.loc 1 164 0 is_stmt 1
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #4]
	subs	r3, r3, #1
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #4]
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #4]
	cmp	r3, #0
	bne	.L26
	.loc 1 165 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3]
.L26:
	.loc 1 166 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #1
	strb	r2, [r3]
.L25:
	.loc 1 169 0
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #7]
	cmp	r3, #0
	beq	.L27
	.loc 1 171 0
	bl	caribou_thread_unlock
	.loc 1 172 0
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #6]
	movs	r2, r3
	movs	r3, #1
	ands	r3, r2
	bne	.L29
	.loc 1 174 0
	bl	caribou_thread_yield
	b	.L29
.L27:
	.loc 1 179 0
	bl	caribou_thread_unlock
.L29:
	.loc 1 181 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 1 182 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r7, pc}
.LFE37:
	.size	caribou_mutex_unlock, .-caribou_mutex_unlock
	.section	.text.caribou_mutex_locks,"ax",%progbits
	.align	2
	.global	caribou_mutex_locks
	.code	16
	.thumb_func
	.type	caribou_mutex_locks, %function
caribou_mutex_locks:
.LFB38:
	.loc 1 189 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI18:
	sub	sp, sp, #16
.LCFI19:
	add	r7, sp, #0
.LCFI20:
	str	r0, [r7, #4]
	.loc 1 191 0
	bl	caribou_thread_lock
	.loc 1 192 0
	movs	r3, #14
	adds	r3, r7, r3
	ldr	r2, [r7, #4]
	ldrh	r2, [r2, #4]
	strh	r2, [r3]
	.loc 1 193 0
	bl	caribou_thread_unlock
	.loc 1 194 0
	movs	r3, #14
	adds	r3, r7, r3
	ldrh	r3, [r3]
	.loc 1 195 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE38:
	.size	caribou_mutex_locks, .-caribou_mutex_locks
	.section	.text.caribou_mutex_flags,"ax",%progbits
	.align	2
	.global	caribou_mutex_flags
	.code	16
	.thumb_func
	.type	caribou_mutex_flags, %function
caribou_mutex_flags:
.LFB39:
	.loc 1 204 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI21:
	sub	sp, sp, #16
.LCFI22:
	add	r7, sp, #0
.LCFI23:
	str	r0, [r7, #4]
	.loc 1 206 0
	bl	caribou_thread_lock
	.loc 1 207 0
	movs	r3, #15
	adds	r3, r7, r3
	ldr	r2, [r7, #4]
	ldrb	r2, [r2, #6]
	strb	r2, [r3]
	.loc 1 208 0
	bl	caribou_thread_unlock
	.loc 1 209 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 1 210 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE39:
	.size	caribou_mutex_flags, .-caribou_mutex_flags
	.section	.text.caribou_mutex_set_flags,"ax",%progbits
	.align	2
	.global	caribou_mutex_set_flags
	.code	16
	.thumb_func
	.type	caribou_mutex_set_flags, %function
caribou_mutex_set_flags:
.LFB40:
	.loc 1 220 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI24:
	sub	sp, sp, #8
.LCFI25:
	add	r7, sp, #0
.LCFI26:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #3
	strb	r2, [r3]
	.loc 1 221 0
	bl	caribou_thread_lock
	.loc 1 222 0
	ldr	r3, [r7, #4]
	adds	r2, r7, #3
	ldrb	r2, [r2]
	strb	r2, [r3, #6]
	.loc 1 223 0
	bl	caribou_thread_unlock
	.loc 1 224 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE40:
	.size	caribou_mutex_set_flags, .-caribou_mutex_set_flags
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
	.uleb128 0x10
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
	.uleb128 0x10
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
	.uleb128 0x30
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
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI16-.LCFI15
	.byte	0xe
	.uleb128 0x20
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
	.uleb128 0x18
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
	.uleb128 0x18
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
	.text
.Letext0:
	.file 2 "/usr/share/crossworks_for_arm_3.7/include/stdint.h"
	.file 3 "../../../../include/caribou/kernel/timer.h"
	.file 4 "../../../../include/caribou/lib/errno.h"
	.file 5 "../../../../include/caribou/kernel/thread.h"
	.file 6 "../../../../include/caribou/lib/mutex.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x4a6
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF58
	.byte	0xc
	.4byte	.LASF59
	.4byte	.LASF60
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
	.uleb128 0x3
	.4byte	.LASF2
	.byte	0x2
	.byte	0xf
	.4byte	0x37
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1
	.uleb128 0x3
	.4byte	.LASF3
	.byte	0x2
	.byte	0x14
	.4byte	0x49
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF4
	.uleb128 0x3
	.4byte	.LASF5
	.byte	0x2
	.byte	0x15
	.4byte	0x5b
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF6
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x3
	.4byte	.LASF7
	.byte	0x2
	.byte	0x17
	.4byte	0x74
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF9
	.uleb128 0x3
	.4byte	.LASF10
	.byte	0x2
	.byte	0x24
	.4byte	0x8d
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF11
	.uleb128 0x5
	.byte	0x4
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF12
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF13
	.uleb128 0x6
	.byte	0x4
	.4byte	0xaa
	.uleb128 0x7
	.4byte	0x9d
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF14
	.uleb128 0x3
	.4byte	.LASF15
	.byte	0x3
	.byte	0x2f
	.4byte	0xc1
	.uleb128 0x8
	.4byte	0x94
	.4byte	0xda
	.uleb128 0x9
	.4byte	0x94
	.uleb128 0x9
	.4byte	0xda
	.uleb128 0x9
	.4byte	0x94
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0xe0
	.uleb128 0xa
	.4byte	.LASF25
	.uleb128 0xb
	.4byte	.LASF25
	.byte	0x1c
	.byte	0x3
	.byte	0x38
	.4byte	0x146
	.uleb128 0xc
	.4byte	.LASF16
	.byte	0x3
	.byte	0x3b
	.4byte	0x146
	.byte	0
	.uleb128 0xc
	.4byte	.LASF17
	.byte	0x3
	.byte	0x3d
	.4byte	0x146
	.byte	0x4
	.uleb128 0xc
	.4byte	.LASF18
	.byte	0x3
	.byte	0x3f
	.4byte	0x14c
	.byte	0x8
	.uleb128 0xc
	.4byte	.LASF19
	.byte	0x3
	.byte	0x41
	.4byte	0x94
	.byte	0xc
	.uleb128 0xc
	.4byte	.LASF20
	.byte	0x3
	.byte	0x43
	.4byte	0x69
	.byte	0x10
	.uleb128 0xc
	.4byte	.LASF21
	.byte	0x3
	.byte	0x45
	.4byte	0x69
	.byte	0x14
	.uleb128 0xc
	.4byte	.LASF22
	.byte	0x3
	.byte	0x47
	.4byte	0x2c
	.byte	0x18
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0xe5
	.uleb128 0x6
	.byte	0x4
	.4byte	0xb6
	.uleb128 0x3
	.4byte	.LASF23
	.byte	0x3
	.byte	0x48
	.4byte	0xe5
	.uleb128 0xd
	.4byte	.LASF24
	.byte	0x4
	.2byte	0x108
	.4byte	0x62
	.uleb128 0xb
	.4byte	.LASF26
	.byte	0x48
	.byte	0x5
	.byte	0x1f
	.4byte	0x241
	.uleb128 0xc
	.4byte	.LASF17
	.byte	0x5
	.byte	0x22
	.4byte	0x241
	.byte	0
	.uleb128 0xc
	.4byte	.LASF27
	.byte	0x5
	.byte	0x25
	.4byte	0x241
	.byte	0x4
	.uleb128 0xe
	.ascii	"sp\000"
	.byte	0x5
	.byte	0x28
	.4byte	0x94
	.byte	0x8
	.uleb128 0xc
	.4byte	.LASF28
	.byte	0x5
	.byte	0x2b
	.4byte	0x94
	.byte	0xc
	.uleb128 0xc
	.4byte	.LASF29
	.byte	0x5
	.byte	0x2e
	.4byte	0x94
	.byte	0x10
	.uleb128 0xc
	.4byte	.LASF30
	.byte	0x5
	.byte	0x31
	.4byte	0x94
	.byte	0x14
	.uleb128 0xc
	.4byte	.LASF31
	.byte	0x5
	.byte	0x34
	.4byte	0x94
	.byte	0x18
	.uleb128 0xc
	.4byte	.LASF32
	.byte	0x5
	.byte	0x37
	.4byte	0x50
	.byte	0x1c
	.uleb128 0xc
	.4byte	.LASF33
	.byte	0x5
	.byte	0x3a
	.4byte	0x3e
	.byte	0x1e
	.uleb128 0xc
	.4byte	.LASF34
	.byte	0x5
	.byte	0x3d
	.4byte	0xa4
	.byte	0x20
	.uleb128 0xe
	.ascii	"arg\000"
	.byte	0x5
	.byte	0x40
	.4byte	0x94
	.byte	0x24
	.uleb128 0xc
	.4byte	.LASF35
	.byte	0x5
	.byte	0x43
	.4byte	0x82
	.byte	0x28
	.uleb128 0xc
	.4byte	.LASF36
	.byte	0x5
	.byte	0x46
	.4byte	0x3e
	.byte	0x30
	.uleb128 0xc
	.4byte	.LASF37
	.byte	0x5
	.byte	0x49
	.4byte	0x252
	.byte	0x34
	.uleb128 0xc
	.4byte	.LASF38
	.byte	0x5
	.byte	0x4c
	.4byte	0x258
	.byte	0x38
	.uleb128 0xc
	.4byte	.LASF39
	.byte	0x5
	.byte	0x4f
	.4byte	0x15d
	.byte	0x3c
	.uleb128 0xc
	.4byte	.LASF40
	.byte	0x5
	.byte	0x52
	.4byte	0x3e
	.byte	0x40
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x169
	.uleb128 0xf
	.4byte	0x252
	.uleb128 0x9
	.4byte	0x94
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x247
	.uleb128 0x6
	.byte	0x4
	.4byte	0x152
	.uleb128 0x3
	.4byte	.LASF41
	.byte	0x5
	.byte	0x5f
	.4byte	0x169
	.uleb128 0x6
	.byte	0x4
	.4byte	0x25e
	.uleb128 0x10
	.byte	0x8
	.byte	0x6
	.byte	0x1e
	.4byte	0x2a8
	.uleb128 0xc
	.4byte	.LASF42
	.byte	0x6
	.byte	0x20
	.4byte	0x94
	.byte	0
	.uleb128 0xc
	.4byte	.LASF43
	.byte	0x6
	.byte	0x21
	.4byte	0x50
	.byte	0x4
	.uleb128 0xc
	.4byte	.LASF22
	.byte	0x6
	.byte	0x22
	.4byte	0x2c
	.byte	0x6
	.uleb128 0xc
	.4byte	.LASF44
	.byte	0x6
	.byte	0x23
	.4byte	0x2c
	.byte	0x7
	.byte	0
	.uleb128 0x3
	.4byte	.LASF45
	.byte	0x6
	.byte	0x24
	.4byte	0x26f
	.uleb128 0x11
	.4byte	.LASF49
	.byte	0x1
	.byte	0x20
	.4byte	0x2e9
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2e9
	.uleb128 0x12
	.4byte	.LASF22
	.byte	0x1
	.byte	0x20
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.uleb128 0x13
	.4byte	.LASF46
	.byte	0x1
	.byte	0x22
	.4byte	0x2e9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x2a8
	.uleb128 0x14
	.4byte	.LASF47
	.byte	0x1
	.byte	0x33
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x313
	.uleb128 0x12
	.4byte	.LASF46
	.byte	0x1
	.byte	0x33
	.4byte	0x2e9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x14
	.4byte	.LASF48
	.byte	0x1
	.byte	0x42
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x345
	.uleb128 0x12
	.4byte	.LASF46
	.byte	0x1
	.byte	0x42
	.4byte	0x2e9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x12
	.4byte	.LASF22
	.byte	0x1
	.byte	0x42
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0x11
	.4byte	.LASF50
	.byte	0x1
	.byte	0x54
	.4byte	0x9d
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x389
	.uleb128 0x12
	.4byte	.LASF46
	.byte	0x1
	.byte	0x54
	.4byte	0x2e9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x12
	.4byte	.LASF51
	.byte	0x1
	.byte	0x54
	.4byte	0x69
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x13
	.4byte	.LASF38
	.byte	0x1
	.byte	0x56
	.4byte	0x152
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.uleb128 0x11
	.4byte	.LASF52
	.byte	0x1
	.byte	0x76
	.4byte	0x9d
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3cc
	.uleb128 0x12
	.4byte	.LASF46
	.byte	0x1
	.byte	0x76
	.4byte	0x2e9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x15
	.ascii	"rc\000"
	.byte	0x1
	.byte	0x78
	.4byte	0x9d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x13
	.4byte	.LASF53
	.byte	0x1
	.byte	0x79
	.4byte	0x269
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x11
	.4byte	.LASF54
	.byte	0x1
	.byte	0x9e
	.4byte	0x9d
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x401
	.uleb128 0x12
	.4byte	.LASF46
	.byte	0x1
	.byte	0x9e
	.4byte	0x2e9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x15
	.ascii	"rc\000"
	.byte	0x1
	.byte	0xa0
	.4byte	0x9d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.uleb128 0x11
	.4byte	.LASF55
	.byte	0x1
	.byte	0xbc
	.4byte	0x50
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x436
	.uleb128 0x12
	.4byte	.LASF46
	.byte	0x1
	.byte	0xbc
	.4byte	0x2e9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x15
	.ascii	"rc\000"
	.byte	0x1
	.byte	0xbe
	.4byte	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0x11
	.4byte	.LASF56
	.byte	0x1
	.byte	0xcb
	.4byte	0x2c
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x46b
	.uleb128 0x12
	.4byte	.LASF46
	.byte	0x1
	.byte	0xcb
	.4byte	0x2e9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x15
	.ascii	"rc\000"
	.byte	0x1
	.byte	0xcd
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x14
	.4byte	.LASF57
	.byte	0x1
	.byte	0xdb
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x49d
	.uleb128 0x12
	.4byte	.LASF46
	.byte	0x1
	.byte	0xdb
	.4byte	0x2e9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x12
	.4byte	.LASF22
	.byte	0x1
	.byte	0xdb
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0x16
	.4byte	.LASF39
	.byte	0x4
	.2byte	0x109
	.4byte	0x15d
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0xd
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
	.uleb128 0xe
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
	.uleb128 0xf
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x1
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
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
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
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x15
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
	.uleb128 0x16
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
	.byte	0
	.section	.debug_pubnames,"",%progbits
	.4byte	0xe8
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x4aa
	.4byte	0x2b3
	.ascii	"caribou_mutex_new\000"
	.4byte	0x2ef
	.ascii	"caribou_mutex_free\000"
	.4byte	0x313
	.ascii	"caribou_mutex_init\000"
	.4byte	0x345
	.ascii	"caribou_mutex_lock\000"
	.4byte	0x389
	.ascii	"caribou_mutex_trylock\000"
	.4byte	0x3cc
	.ascii	"caribou_mutex_unlock\000"
	.4byte	0x401
	.ascii	"caribou_mutex_locks\000"
	.4byte	0x436
	.ascii	"caribou_mutex_flags\000"
	.4byte	0x46b
	.ascii	"caribou_mutex_set_flags\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0x18f
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x4aa
	.4byte	0x25
	.ascii	"signed char\000"
	.4byte	0x37
	.ascii	"unsigned char\000"
	.4byte	0x2c
	.ascii	"uint8_t\000"
	.4byte	0x49
	.ascii	"short int\000"
	.4byte	0x3e
	.ascii	"int16_t\000"
	.4byte	0x5b
	.ascii	"short unsigned int\000"
	.4byte	0x50
	.ascii	"uint16_t\000"
	.4byte	0x62
	.ascii	"int\000"
	.4byte	0x74
	.ascii	"unsigned int\000"
	.4byte	0x69
	.ascii	"uint32_t\000"
	.4byte	0x7b
	.ascii	"long long int\000"
	.4byte	0x8d
	.ascii	"long long unsigned int\000"
	.4byte	0x82
	.ascii	"uint64_t\000"
	.4byte	0x96
	.ascii	"long int\000"
	.4byte	0x9d
	.ascii	"char\000"
	.4byte	0xaf
	.ascii	"sizetype\000"
	.4byte	0xb6
	.ascii	"caribou_timer_callback_fn\000"
	.4byte	0xe5
	.ascii	"_caribou_timer_t\000"
	.4byte	0x152
	.ascii	"caribou_timer_t\000"
	.4byte	0x15d
	.ascii	"errno_t\000"
	.4byte	0x169
	.ascii	"_caribou_thread_t\000"
	.4byte	0x25e
	.ascii	"caribou_thread_t\000"
	.4byte	0x2a8
	.ascii	"caribou_mutex_t\000"
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x5c
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
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF20:
	.ascii	"ticks\000"
.LASF43:
	.ascii	"locks\000"
.LASF41:
	.ascii	"caribou_thread_t\000"
.LASF32:
	.ascii	"state\000"
.LASF10:
	.ascii	"uint64_t\000"
.LASF4:
	.ascii	"short int\000"
.LASF14:
	.ascii	"sizetype\000"
.LASF54:
	.ascii	"caribou_mutex_unlock\000"
.LASF21:
	.ascii	"reloadticks\000"
.LASF19:
	.ascii	"fnarg\000"
.LASF60:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f030/crossworks\000"
.LASF2:
	.ascii	"uint8_t\000"
.LASF47:
	.ascii	"caribou_mutex_free\000"
.LASF27:
	.ascii	"parent\000"
.LASF44:
	.ascii	"blocking\000"
.LASF0:
	.ascii	"signed char\000"
.LASF9:
	.ascii	"long long int\000"
.LASF11:
	.ascii	"long long unsigned int\000"
.LASF12:
	.ascii	"long int\000"
.LASF38:
	.ascii	"timer\000"
.LASF34:
	.ascii	"name\000"
.LASF57:
	.ascii	"caribou_mutex_set_flags\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF24:
	.ascii	"errno_t\000"
.LASF31:
	.ascii	"stack_base\000"
.LASF53:
	.ascii	"current_thread\000"
.LASF22:
	.ascii	"flags\000"
.LASF7:
	.ascii	"uint32_t\000"
.LASF35:
	.ascii	"runtime\000"
.LASF8:
	.ascii	"unsigned int\000"
.LASF5:
	.ascii	"uint16_t\000"
.LASF49:
	.ascii	"caribou_mutex_new\000"
.LASF40:
	.ascii	"sleep\000"
.LASF28:
	.ascii	"stack_usage\000"
.LASF18:
	.ascii	"timerfn\000"
.LASF42:
	.ascii	"thread\000"
.LASF23:
	.ascii	"caribou_timer_t\000"
.LASF13:
	.ascii	"char\000"
.LASF55:
	.ascii	"caribou_mutex_locks\000"
.LASF36:
	.ascii	"lock\000"
.LASF6:
	.ascii	"short unsigned int\000"
.LASF3:
	.ascii	"int16_t\000"
.LASF37:
	.ascii	"finishfn\000"
.LASF26:
	.ascii	"_caribou_thread_t\000"
.LASF52:
	.ascii	"caribou_mutex_trylock\000"
.LASF29:
	.ascii	"stack_low\000"
.LASF58:
	.ascii	"GNU C99 5.4.1 20160609 (release) [ARM/embedded-5-br"
	.ascii	"anch revision 237715] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -gpubnames -std=gnu"
	.ascii	"99 -fno-dwarf2-cfi-asm -fno-builtin -ffunction-sect"
	.ascii	"ions -fdata-sections -fshort-double -fshort-enums -"
	.ascii	"fno-common\000"
.LASF15:
	.ascii	"caribou_timer_callback_fn\000"
.LASF30:
	.ascii	"stack_top\000"
.LASF46:
	.ascii	"mutex\000"
.LASF25:
	.ascii	"_caribou_timer_t\000"
.LASF59:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f030/crossworks/../../../../src/l"
	.ascii	"ib/mutex.c\000"
.LASF48:
	.ascii	"caribou_mutex_init\000"
.LASF56:
	.ascii	"caribou_mutex_flags\000"
.LASF16:
	.ascii	"prev\000"
.LASF50:
	.ascii	"caribou_mutex_lock\000"
.LASF33:
	.ascii	"prio\000"
.LASF51:
	.ascii	"timeout\000"
.LASF17:
	.ascii	"next\000"
.LASF39:
	.ascii	"__errno\000"
.LASF45:
	.ascii	"caribou_mutex_t\000"
	.ident	"GCC: (GNU) 5.4.1 20160609 (release) [ARM/embedded-5-branch revision 237715]"
