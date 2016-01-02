	.cpu cortex-m0
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 4
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.code	16
	.file	"bytequeue.c"
	.text
.Ltext0:
	.section	.text.caribou_bytequeue_new,"ax",%progbits
	.align	1
	.global	caribou_bytequeue_new
	.code	16
	.thumb_func
	.type	caribou_bytequeue_new, %function
caribou_bytequeue_new:
.LFB32:
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../../../../src/lib/bytequeue.c"
	.loc 1 35 0
.LVL0:
	push	{r4, r5, r6, lr}
.LCFI0:
	.loc 1 35 0
	mov	r6, r0
	.loc 1 36 0
	mov	r0, #12
.LVL1:
	bl	malloc
.LVL2:
	sub	r4, r0, #0
.LVL3:
	.loc 1 37 0
	beq	.L2
	.loc 1 39 0
	mov	r1, #0
	mov	r2, #12
	bl	memset
.LVL4:
	.loc 1 40 0
	mov	r0, r6
	bl	malloc
.LVL5:
	mov	r5, r0
	str	r0, [r4]
	.loc 1 41 0
	beq	.L3
	.loc 1 43 0
	strh	r6, [r4, #4]
	b	.L2
.L3:
	.loc 1 47 0
	mov	r0, r4
	bl	free
.LVL6:
	.loc 1 48 0
	mov	r4, r5
.LVL7:
.L2:
	.loc 1 52 0
	mov	r0, r4
	@ sp needed
.LVL8:
	pop	{r4, r5, r6, pc}
.LFE32:
	.size	caribou_bytequeue_new, .-caribou_bytequeue_new
	.section	.text.caribou_bytequeue_free,"ax",%progbits
	.align	1
	.global	caribou_bytequeue_free
	.code	16
	.thumb_func
	.type	caribou_bytequeue_free, %function
caribou_bytequeue_free:
.LFB33:
	.loc 1 60 0
.LVL9:
	push	{r3, r4, r5, lr}
.LCFI1:
	.loc 1 60 0
	sub	r4, r0, #0
	.loc 1 62 0
	beq	.L11
.LBB4:
	.loc 1 64 0
	bl	chip_interrupts_disable
.LVL10:
	mov	r5, r0
.LVL11:
	.loc 1 65 0
	ldr	r0, [r4]
.LVL12:
	cmp	r0, #0
	beq	.L10
	.loc 1 66 0
	bl	free
.LVL13:
.L10:
	.loc 1 67 0
	mov	r0, r4
	bl	free
.LVL14:
	.loc 1 69 0
	mov	r0, r5
	bl	chip_interrupts_set
.LVL15:
	.loc 1 68 0
	mov	r0, #1
	b	.L9
.LVL16:
.L11:
.L9:
.LBE4:
	.loc 1 72 0
	@ sp needed
.LVL17:
	pop	{r3, r4, r5, pc}
.LFE33:
	.size	caribou_bytequeue_free, .-caribou_bytequeue_free
	.section	.text.caribou_bytequeue_init,"ax",%progbits
	.align	1
	.global	caribou_bytequeue_init
	.code	16
	.thumb_func
	.type	caribou_bytequeue_init, %function
caribou_bytequeue_init:
.LFB34:
	.loc 1 82 0
.LVL18:
	push	{r4, r5, r6, lr}
.LCFI2:
	.loc 1 82 0
	mov	r5, r1
	mov	r6, r2
	.loc 1 84 0
	mov	r1, #0
.LVL19:
	mov	r2, #12
.LVL20:
	.loc 1 82 0
	mov	r4, r0
	.loc 1 84 0
	bl	memset
.LVL21:
	.loc 1 85 0
	cmp	r4, #0
	beq	.L17
	.loc 1 85 0 is_stmt 0 discriminator 1
	cmp	r5, #0
	beq	.L18
	.loc 1 83 0 is_stmt 1 discriminator 1
	mov	r0, #0
	.loc 1 85 0 discriminator 1
	cmp	r6, r0
	beq	.L16
	.loc 1 87 0
	str	r5, [r4]
	.loc 1 88 0
	strh	r6, [r4, #4]
.LVL22:
	.loc 1 89 0
	mov	r0, #1
	b	.L16
.LVL23:
.L17:
	.loc 1 83 0
	mov	r0, r4
	b	.L16
.L18:
	mov	r0, r5
.LVL24:
.L16:
	.loc 1 92 0
	@ sp needed
.LVL25:
.LVL26:
	pop	{r4, r5, r6, pc}
.LFE34:
	.size	caribou_bytequeue_init, .-caribou_bytequeue_init
	.section	.text.caribou_bytequeue_full,"ax",%progbits
	.align	1
	.global	caribou_bytequeue_full
	.code	16
	.thumb_func
	.type	caribou_bytequeue_full, %function
caribou_bytequeue_full:
.LFB35:
	.loc 1 100 0
.LVL27:
	push	{r4, lr}
.LCFI3:
	.loc 1 100 0
	mov	r4, r0
	.loc 1 101 0
	bl	chip_interrupts_disable
.LVL28:
	.loc 1 102 0
	ldrh	r3, [r4, #8]
	ldrh	r2, [r4, #6]
	sub	r1, r3, #1
	cmp	r2, r1
	beq	.L23
	.loc 1 102 0 is_stmt 0 discriminator 2
	ldrh	r1, [r4, #4]
	mov	r4, #0
.LVL29:
	sub	r1, r1, #1
	cmp	r2, r1
	bne	.L22
	.loc 1 102 0 discriminator 3
	neg	r4, r3
	adc	r4, r4, r3
	b	.L22
.LVL30:
.L23:
	.loc 1 102 0
	mov	r4, #1
.LVL31:
.L22:
	.loc 1 103 0 is_stmt 1 discriminator 5
	bl	chip_interrupts_set
.LVL32:
	.loc 1 105 0 discriminator 5
	@ sp needed
	.loc 1 104 0 discriminator 5
	uxtb	r0, r4
.LVL33:
	.loc 1 105 0 discriminator 5
	pop	{r4, pc}
.LFE35:
	.size	caribou_bytequeue_full, .-caribou_bytequeue_full
	.section	.text.caribou_bytequeue_empty,"ax",%progbits
	.align	1
	.global	caribou_bytequeue_empty
	.code	16
	.thumb_func
	.type	caribou_bytequeue_empty, %function
caribou_bytequeue_empty:
.LFB36:
	.loc 1 113 0
.LVL34:
	push	{r4, lr}
.LCFI4:
	.loc 1 113 0
	mov	r4, r0
	.loc 1 114 0
	bl	chip_interrupts_disable
.LVL35:
	.loc 1 115 0
	ldrh	r3, [r4, #8]
	ldrh	r2, [r4, #6]
	.loc 1 118 0
	@ sp needed
	.loc 1 115 0
	sub	r4, r2, r3
.LVL36:
	neg	r3, r4
	adc	r4, r4, r3
	uxtb	r4, r4
.LVL37:
	.loc 1 116 0
	bl	chip_interrupts_set
.LVL38:
	.loc 1 118 0
	mov	r0, r4
.LVL39:
	pop	{r4, pc}
.LFE36:
	.size	caribou_bytequeue_empty, .-caribou_bytequeue_empty
	.section	.text.caribou_bytequeue_clear,"ax",%progbits
	.align	1
	.global	caribou_bytequeue_clear
	.code	16
	.thumb_func
	.type	caribou_bytequeue_clear, %function
caribou_bytequeue_clear:
.LFB37:
	.loc 1 126 0
.LVL40:
	push	{r4, lr}
.LCFI5:
	.loc 1 126 0
	mov	r4, r0
	.loc 1 127 0
	bl	chip_interrupts_disable
.LVL41:
	.loc 1 128 0
	ldrh	r3, [r4, #8]
	.loc 1 130 0
	@ sp needed
	.loc 1 128 0
	strh	r3, [r4, #6]
	.loc 1 129 0
	bl	chip_interrupts_set
.LVL42:
.LVL43:
	.loc 1 130 0
	pop	{r4, pc}
.LFE37:
	.size	caribou_bytequeue_clear, .-caribou_bytequeue_clear
	.section	.text.caribou_bytequeue_level,"ax",%progbits
	.align	1
	.global	caribou_bytequeue_level
	.code	16
	.thumb_func
	.type	caribou_bytequeue_level, %function
caribou_bytequeue_level:
.LFB38:
	.loc 1 140 0
.LVL44:
	push	{r3, r4, r5, lr}
.LCFI6:
	.loc 1 140 0
	mov	r5, r0
	.loc 1 141 0
	bl	chip_interrupts_disable
.LVL45:
	.loc 1 142 0
	ldrh	r3, [r5, #6]
	ldrh	r2, [r5, #8]
	sub	r4, r3, r2
.LVL46:
	.loc 1 143 0
	bpl	.L28
	.loc 1 145 0
	ldrh	r4, [r5, #4]
.LVL47:
	sub	r4, r4, r2
	add	r4, r4, r3
.LVL48:
.L28:
	.loc 1 147 0
	bl	chip_interrupts_set
.LVL49:
	.loc 1 149 0
	@ sp needed
	mov	r0, r4
.LVL50:
.LVL51:
	pop	{r3, r4, r5, pc}
.LFE38:
	.size	caribou_bytequeue_level, .-caribou_bytequeue_level
	.section	.text.caribou_bytequeue_size,"ax",%progbits
	.align	1
	.global	caribou_bytequeue_size
	.code	16
	.thumb_func
	.type	caribou_bytequeue_size, %function
caribou_bytequeue_size:
.LFB39:
	.loc 1 157 0
.LVL52:
	.loc 1 158 0
	ldrh	r0, [r0, #4]
.LVL53:
	.loc 1 159 0
	@ sp needed
	bx	lr
.LFE39:
	.size	caribou_bytequeue_size, .-caribou_bytequeue_size
	.section	.text.caribou_bytequeue_half_full,"ax",%progbits
	.align	1
	.global	caribou_bytequeue_half_full
	.code	16
	.thumb_func
	.type	caribou_bytequeue_half_full, %function
caribou_bytequeue_half_full:
.LFB40:
	.loc 1 167 0
.LVL54:
	push	{r4, lr}
.LCFI7:
	.loc 1 167 0
	mov	r4, r0
	.loc 1 168 0
	bl	caribou_bytequeue_level
.LVL55:
.LBB5:
.LBB6:
	.loc 1 158 0
	ldrh	r3, [r4, #4]
.LBE6:
.LBE5:
	.loc 1 168 0
	asr	r1, r0, #31
	asr	r3, r3, #1
	lsr	r2, r3, #31
	cmp	r0, r3
	adc	r1, r1, r2
	uxtb	r0, r1
	.loc 1 169 0
	@ sp needed
.LVL56:
	pop	{r4, pc}
.LFE40:
	.size	caribou_bytequeue_half_full, .-caribou_bytequeue_half_full
	.section	.text.caribou_bytequeue_put,"ax",%progbits
	.align	1
	.global	caribou_bytequeue_put
	.code	16
	.thumb_func
	.type	caribou_bytequeue_put, %function
caribou_bytequeue_put:
.LFB41:
	.loc 1 178 0
.LVL57:
	push	{r4, r5, r6, lr}
.LCFI8:
	.loc 1 178 0
	mov	r4, r0
	mov	r6, r1
	.loc 1 179 0
	bl	chip_interrupts_disable
.LVL58:
	.loc 1 180 0
	ldrh	r2, [r4, #8]
	ldrh	r3, [r4, #6]
	sub	r1, r2, #1
	cmp	r3, r1
	beq	.L36
	.loc 1 180 0 is_stmt 0 discriminator 1
	ldrh	r1, [r4, #4]
	mov	r5, #1
	sub	r1, r1, #1
	cmp	r3, r1
	bne	.L33
	.loc 1 180 0 discriminator 4
	sub	r5, r2, #1
	sbc	r2, r2, r5
	uxtb	r5, r2
.LVL59:
	.loc 1 181 0 is_stmt 1 discriminator 4
	cmp	r5, #0
	bne	.L33
	b	.L34
.LVL60:
.L36:
	mov	r5, #0
	b	.L34
.L33:
.LVL61:
	.loc 1 183 0
	add	r2, r3, #1
	strh	r2, [r4, #6]
	ldr	r2, [r4]
	strb	r6, [r2, r3]
	.loc 1 184 0
	ldrh	r2, [r4, #6]
	ldrh	r3, [r4, #4]
	cmp	r2, r3
	bcc	.L34
	.loc 1 185 0
	mov	r3, #0
	strh	r3, [r4, #6]
.LVL62:
.L34:
	.loc 1 187 0
	bl	chip_interrupts_set
.LVL63:
	.loc 1 189 0
	@ sp needed
	mov	r0, r5
.LVL64:
	pop	{r4, r5, r6, pc}
.LFE41:
	.size	caribou_bytequeue_put, .-caribou_bytequeue_put
	.section	.text.caribou_bytequeue_puts,"ax",%progbits
	.align	1
	.global	caribou_bytequeue_puts
	.code	16
	.thumb_func
	.type	caribou_bytequeue_puts, %function
caribou_bytequeue_puts:
.LFB42:
	.loc 1 199 0
.LVL65:
	push	{r3, r4, r5, r6, r7, lr}
.LCFI9:
	.loc 1 199 0
	mov	r4, r0
	mov	r6, r1
	mov	r7, r2
	.loc 1 201 0
	bl	chip_interrupts_disable
.LVL66:
	.loc 1 202 0
	mov	r5, #0
.LVL67:
.L39:
	.loc 1 202 0 is_stmt 0 discriminator 1
	cmp	r5, r7
	bge	.L42
	.loc 1 202 0 discriminator 2
	ldrh	r2, [r4, #8]
	ldrh	r3, [r4, #6]
	sub	r1, r2, #1
	cmp	r3, r1
	beq	.L42
	.loc 1 202 0 discriminator 1
	ldrh	r1, [r4, #4]
	sub	r1, r1, #1
	cmp	r3, r1
	beq	.L45
.L43:
	.loc 1 204 0 is_stmt 1
	add	r2, r3, #1
	strh	r2, [r4, #6]
.LVL68:
	ldrb	r2, [r6, r5]
	ldr	r1, [r4]
	strb	r2, [r1, r3]
	.loc 1 205 0
	ldrh	r2, [r4, #6]
	ldrh	r3, [r4, #4]
	cmp	r2, r3
	bcc	.L40
	.loc 1 206 0
	mov	r3, #0
	strh	r3, [r4, #6]
.L40:
	add	r5, r5, #1
.LVL69:
	b	.L39
.L45:
	.loc 1 202 0 discriminator 1
	cmp	r2, #0
	bne	.L43
.L42:
	.loc 1 208 0
	bl	chip_interrupts_set
.LVL70:
	.loc 1 210 0
	@ sp needed
	mov	r0, r5
.LVL71:
.LVL72:
.LVL73:
.LVL74:
	pop	{r3, r4, r5, r6, r7, pc}
.LFE42:
	.size	caribou_bytequeue_puts, .-caribou_bytequeue_puts
	.section	.text.caribou_bytequeue_get,"ax",%progbits
	.align	1
	.global	caribou_bytequeue_get
	.code	16
	.thumb_func
	.type	caribou_bytequeue_get, %function
caribou_bytequeue_get:
.LFB43:
	.loc 1 218 0
.LVL75:
	push	{r3, r4, r5, lr}
.LCFI10:
	.loc 1 218 0
	mov	r4, r0
	.loc 1 219 0
	bl	chip_interrupts_disable
.LVL76:
	.loc 1 221 0
	ldrh	r3, [r4, #8]
	ldrh	r2, [r4, #6]
	cmp	r2, r3
	beq	.L48
	.loc 1 223 0
	add	r2, r3, #1
	uxth	r2, r2
	ldr	r1, [r4]
	strh	r2, [r4, #8]
	ldrb	r5, [r1, r3]
.LVL77:
	.loc 1 224 0
	ldrh	r3, [r4, #4]
	cmp	r3, r2
	bhi	.L47
	.loc 1 225 0
	mov	r3, #0
	strh	r3, [r4, #8]
	b	.L47
.LVL78:
.L48:
	.loc 1 220 0
	mov	r5, #1
	neg	r5, r5
.LVL79:
.L47:
	.loc 1 227 0
	bl	chip_interrupts_set
.LVL80:
	.loc 1 229 0
	@ sp needed
	mov	r0, r5
.LVL81:
.LVL82:
	pop	{r3, r4, r5, pc}
.LFE43:
	.size	caribou_bytequeue_get, .-caribou_bytequeue_get
	.section	.text.caribou_bytequeue_gets,"ax",%progbits
	.align	1
	.global	caribou_bytequeue_gets
	.code	16
	.thumb_func
	.type	caribou_bytequeue_gets, %function
caribou_bytequeue_gets:
.LFB44:
	.loc 1 239 0
.LVL83:
	push	{r3, r4, r5, r6, r7, lr}
.LCFI11:
	.loc 1 239 0
	mov	r4, r0
	mov	r7, r1
	mov	r6, r2
	.loc 1 240 0
	bl	chip_interrupts_disable
.LVL84:
	.loc 1 242 0
	mov	r5, #0
.LVL85:
.L50:
	.loc 1 242 0 is_stmt 0 discriminator 1
	ldrh	r3, [r4, #8]
	ldrh	r2, [r4, #6]
	cmp	r2, r3
	beq	.L54
	.loc 1 242 0 discriminator 2
	cmp	r5, r6
	bge	.L54
.LVL86:
	.loc 1 244 0 is_stmt 1
	add	r2, r3, #1
	strh	r2, [r4, #8]
	ldr	r2, [r4]
	ldrb	r3, [r2, r3]
	strb	r3, [r7, r5]
	.loc 1 245 0
	ldrh	r2, [r4, #8]
	ldrh	r3, [r4, #4]
	cmp	r2, r3
	bcc	.L51
	.loc 1 246 0
	mov	r3, #0
	strh	r3, [r4, #8]
.L51:
	add	r5, r5, #1
.LVL87:
	b	.L50
.L54:
	.loc 1 248 0
	bl	chip_interrupts_set
.LVL88:
	.loc 1 250 0
	@ sp needed
	mov	r0, r5
.LVL89:
.LVL90:
.LVL91:
.LVL92:
	pop	{r3, r4, r5, r6, r7, pc}
.LFE44:
	.size	caribou_bytequeue_gets, .-caribou_bytequeue_gets
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
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
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
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.byte	0x4
	.4byte	.LCFI2-.LFB34
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
.LEFDE4:
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.byte	0x4
	.4byte	.LCFI3-.LFB35
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE6:
.LSFDE8:
	.4byte	.LEFDE8-.LASFDE8
.LASFDE8:
	.4byte	.Lframe0
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.byte	0x4
	.4byte	.LCFI4-.LFB36
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE8:
.LSFDE10:
	.4byte	.LEFDE10-.LASFDE10
.LASFDE10:
	.4byte	.Lframe0
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.byte	0x4
	.4byte	.LCFI5-.LFB37
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE10:
.LSFDE12:
	.4byte	.LEFDE12-.LASFDE12
.LASFDE12:
	.4byte	.Lframe0
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.byte	0x4
	.4byte	.LCFI6-.LFB38
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
.LEFDE12:
.LSFDE14:
	.4byte	.LEFDE14-.LASFDE14
.LASFDE14:
	.4byte	.Lframe0
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.align	2
.LEFDE14:
.LSFDE16:
	.4byte	.LEFDE16-.LASFDE16
.LASFDE16:
	.4byte	.Lframe0
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.byte	0x4
	.4byte	.LCFI7-.LFB40
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE16:
.LSFDE18:
	.4byte	.LEFDE18-.LASFDE18
.LASFDE18:
	.4byte	.Lframe0
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.byte	0x4
	.4byte	.LCFI8-.LFB41
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
.LEFDE18:
.LSFDE20:
	.4byte	.LEFDE20-.LASFDE20
.LASFDE20:
	.4byte	.Lframe0
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.byte	0x4
	.4byte	.LCFI9-.LFB42
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
.LEFDE20:
.LSFDE22:
	.4byte	.LEFDE22-.LASFDE22
.LASFDE22:
	.4byte	.Lframe0
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.byte	0x4
	.4byte	.LCFI10-.LFB43
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
.LEFDE22:
.LSFDE24:
	.4byte	.LEFDE24-.LASFDE24
.LASFDE24:
	.4byte	.Lframe0
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.byte	0x4
	.4byte	.LCFI11-.LFB44
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
.LEFDE24:
	.text
.Letext0:
	.file 2 "/usr/share/crossworks_for_arm_3.3/include/stdint.h"
	.file 3 "/usr/share/crossworks_for_arm_3.3/include/stddef.h"
	.file 4 "../../../../include/caribou/lib/bytequeue.h"
	.file 5 "../../../../include/caribou/lib/heap.h"
	.file 6 "../../../../include/caribou/lib/string.h"
	.file 7 "../../../chip/stm32/stm32f030/include/stm32f030f/chip/chip.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x642
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF33
	.byte	0x1
	.4byte	.LASF34
	.4byte	.LASF35
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
	.uleb128 0x3
	.4byte	.LASF12
	.byte	0x3
	.byte	0x16
	.4byte	0x5e
	.uleb128 0x6
	.byte	0xc
	.byte	0x4
	.byte	0x1d
	.4byte	0xce
	.uleb128 0x7
	.4byte	.LASF13
	.byte	0x4
	.byte	0x1f
	.4byte	0xce
	.byte	0
	.uleb128 0x7
	.4byte	.LASF14
	.byte	0x4
	.byte	0x20
	.4byte	0x45
	.byte	0x4
	.uleb128 0x7
	.4byte	.LASF15
	.byte	0x4
	.byte	0x21
	.4byte	0x45
	.byte	0x6
	.uleb128 0x7
	.4byte	.LASF16
	.byte	0x4
	.byte	0x22
	.4byte	0x45
	.byte	0x8
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.4byte	0x2c
	.uleb128 0x3
	.4byte	.LASF17
	.byte	0x4
	.byte	0x23
	.4byte	0x95
	.uleb128 0x9
	.4byte	.LASF30
	.byte	0x1
	.byte	0x9c
	.4byte	0x57
	.byte	0x1
	.4byte	0xfb
	.uleb128 0xa
	.4byte	.LASF13
	.byte	0x1
	.byte	0x9c
	.4byte	0xfb
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.4byte	0xd4
	.uleb128 0xb
	.4byte	.LASF18
	.byte	0x1
	.byte	0x22
	.4byte	0xfb
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x18d
	.uleb128 0xc
	.4byte	.LASF14
	.byte	0x1
	.byte	0x22
	.4byte	0x45
	.4byte	.LLST0
	.uleb128 0xd
	.ascii	"rc\000"
	.byte	0x1
	.byte	0x24
	.4byte	0xfb
	.4byte	.LLST1
	.uleb128 0xe
	.4byte	.LVL2
	.4byte	0x5e8
	.4byte	0x14a
	.uleb128 0xf
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x3c
	.byte	0
	.uleb128 0xe
	.4byte	.LVL4
	.4byte	0x5fd
	.4byte	0x168
	.uleb128 0xf
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x3c
	.uleb128 0xf
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x30
	.uleb128 0xf
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0xe
	.4byte	.LVL5
	.4byte	0x5e8
	.4byte	0x17c
	.uleb128 0xf
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x10
	.4byte	.LVL6
	.4byte	0x61c
	.uleb128 0xf
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0xb
	.4byte	.LASF19
	.byte	0x1
	.byte	0x3b
	.4byte	0x7c
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x213
	.uleb128 0xc
	.4byte	.LASF13
	.byte	0x1
	.byte	0x3b
	.4byte	0xfb
	.4byte	.LLST2
	.uleb128 0xd
	.ascii	"rc\000"
	.byte	0x1
	.byte	0x3d
	.4byte	0x7c
	.4byte	.LLST3
	.uleb128 0x11
	.4byte	.LBB4
	.4byte	.LBE4-.LBB4
	.uleb128 0x12
	.4byte	.LASF20
	.byte	0x1
	.byte	0x40
	.4byte	0x57
	.4byte	.LLST4
	.uleb128 0x13
	.4byte	.LVL10
	.4byte	0x62d
	.uleb128 0x13
	.4byte	.LVL13
	.4byte	0x61c
	.uleb128 0xe
	.4byte	.LVL14
	.4byte	0x61c
	.4byte	0x201
	.uleb128 0xf
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x10
	.4byte	.LVL15
	.4byte	0x638
	.uleb128 0xf
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x75
	.sleb128 0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xb
	.4byte	.LASF21
	.byte	0x1
	.byte	0x51
	.4byte	0x7c
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x282
	.uleb128 0xc
	.4byte	.LASF13
	.byte	0x1
	.byte	0x51
	.4byte	0xfb
	.4byte	.LLST5
	.uleb128 0x14
	.ascii	"buf\000"
	.byte	0x1
	.byte	0x51
	.4byte	0x73
	.4byte	.LLST6
	.uleb128 0xc
	.4byte	.LASF14
	.byte	0x1
	.byte	0x51
	.4byte	0x45
	.4byte	.LLST7
	.uleb128 0xd
	.ascii	"rc\000"
	.byte	0x1
	.byte	0x53
	.4byte	0x7c
	.4byte	.LLST8
	.uleb128 0x10
	.4byte	.LVL21
	.4byte	0x5fd
	.uleb128 0xf
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x3c
	.uleb128 0xf
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x30
	.uleb128 0xf
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0xb
	.4byte	.LASF22
	.byte	0x1
	.byte	0x63
	.4byte	0x7c
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2da
	.uleb128 0xc
	.4byte	.LASF13
	.byte	0x1
	.byte	0x63
	.4byte	0xfb
	.4byte	.LLST9
	.uleb128 0x12
	.4byte	.LASF20
	.byte	0x1
	.byte	0x65
	.4byte	0x57
	.4byte	.LLST10
	.uleb128 0xd
	.ascii	"rc\000"
	.byte	0x1
	.byte	0x66
	.4byte	0x7c
	.4byte	.LLST11
	.uleb128 0x13
	.4byte	.LVL28
	.4byte	0x62d
	.uleb128 0x13
	.4byte	.LVL32
	.4byte	0x638
	.byte	0
	.uleb128 0xb
	.4byte	.LASF23
	.byte	0x1
	.byte	0x70
	.4byte	0x7c
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x332
	.uleb128 0xc
	.4byte	.LASF13
	.byte	0x1
	.byte	0x70
	.4byte	0xfb
	.4byte	.LLST12
	.uleb128 0x12
	.4byte	.LASF20
	.byte	0x1
	.byte	0x72
	.4byte	0x57
	.4byte	.LLST13
	.uleb128 0xd
	.ascii	"rc\000"
	.byte	0x1
	.byte	0x73
	.4byte	0x7c
	.4byte	.LLST14
	.uleb128 0x13
	.4byte	.LVL35
	.4byte	0x62d
	.uleb128 0x13
	.4byte	.LVL38
	.4byte	0x638
	.byte	0
	.uleb128 0x15
	.4byte	.LASF36
	.byte	0x1
	.byte	0x7d
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x378
	.uleb128 0xc
	.4byte	.LASF13
	.byte	0x1
	.byte	0x7d
	.4byte	0xfb
	.4byte	.LLST15
	.uleb128 0x12
	.4byte	.LASF20
	.byte	0x1
	.byte	0x7f
	.4byte	0x57
	.4byte	.LLST16
	.uleb128 0x13
	.4byte	.LVL41
	.4byte	0x62d
	.uleb128 0x13
	.4byte	.LVL42
	.4byte	0x638
	.byte	0
	.uleb128 0xb
	.4byte	.LASF24
	.byte	0x1
	.byte	0x8b
	.4byte	0x57
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3d0
	.uleb128 0xc
	.4byte	.LASF13
	.byte	0x1
	.byte	0x8b
	.4byte	0xfb
	.4byte	.LLST17
	.uleb128 0x12
	.4byte	.LASF20
	.byte	0x1
	.byte	0x8d
	.4byte	0x57
	.4byte	.LLST18
	.uleb128 0xd
	.ascii	"rc\000"
	.byte	0x1
	.byte	0x8e
	.4byte	0x57
	.4byte	.LLST19
	.uleb128 0x13
	.4byte	.LVL45
	.4byte	0x62d
	.uleb128 0x13
	.4byte	.LVL49
	.4byte	0x638
	.byte	0
	.uleb128 0x16
	.4byte	0xdf
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3ed
	.uleb128 0x17
	.4byte	0xef
	.4byte	.LLST20
	.byte	0
	.uleb128 0xb
	.4byte	.LASF25
	.byte	0x1
	.byte	0xa6
	.4byte	0x7c
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x443
	.uleb128 0xc
	.4byte	.LASF13
	.byte	0x1
	.byte	0xa6
	.4byte	0xfb
	.4byte	.LLST21
	.uleb128 0x18
	.4byte	0xdf
	.4byte	.LBB5
	.4byte	.LBE5-.LBB5
	.byte	0x1
	.byte	0xa8
	.4byte	0x432
	.uleb128 0x17
	.4byte	0xef
	.4byte	.LLST22
	.byte	0
	.uleb128 0x10
	.4byte	.LVL55
	.4byte	0x378
	.uleb128 0xf
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0xb
	.4byte	.LASF26
	.byte	0x1
	.byte	0xb1
	.4byte	0x7c
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4a8
	.uleb128 0xc
	.4byte	.LASF13
	.byte	0x1
	.byte	0xb1
	.4byte	0xfb
	.4byte	.LLST23
	.uleb128 0x14
	.ascii	"c\000"
	.byte	0x1
	.byte	0xb1
	.4byte	0x2c
	.4byte	.LLST24
	.uleb128 0x12
	.4byte	.LASF20
	.byte	0x1
	.byte	0xb3
	.4byte	0x57
	.4byte	.LLST25
	.uleb128 0xd
	.ascii	"rc\000"
	.byte	0x1
	.byte	0xb4
	.4byte	0x7c
	.4byte	.LLST26
	.uleb128 0x13
	.4byte	.LVL58
	.4byte	0x62d
	.uleb128 0x13
	.4byte	.LVL63
	.4byte	0x638
	.byte	0
	.uleb128 0xb
	.4byte	.LASF27
	.byte	0x1
	.byte	0xc6
	.4byte	0x57
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x51b
	.uleb128 0xc
	.4byte	.LASF13
	.byte	0x1
	.byte	0xc6
	.4byte	0xfb
	.4byte	.LLST27
	.uleb128 0x14
	.ascii	"c\000"
	.byte	0x1
	.byte	0xc6
	.4byte	0xce
	.4byte	.LLST28
	.uleb128 0x14
	.ascii	"sz\000"
	.byte	0x1
	.byte	0xc6
	.4byte	0x57
	.4byte	.LLST29
	.uleb128 0xd
	.ascii	"rc\000"
	.byte	0x1
	.byte	0xc8
	.4byte	0x57
	.4byte	.LLST30
	.uleb128 0x12
	.4byte	.LASF20
	.byte	0x1
	.byte	0xc9
	.4byte	0x57
	.4byte	.LLST31
	.uleb128 0x13
	.4byte	.LVL66
	.4byte	0x62d
	.uleb128 0x13
	.4byte	.LVL70
	.4byte	0x638
	.byte	0
	.uleb128 0xb
	.4byte	.LASF28
	.byte	0x1
	.byte	0xd9
	.4byte	0x57
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x573
	.uleb128 0xc
	.4byte	.LASF13
	.byte	0x1
	.byte	0xd9
	.4byte	0xfb
	.4byte	.LLST32
	.uleb128 0x12
	.4byte	.LASF20
	.byte	0x1
	.byte	0xdb
	.4byte	0x57
	.4byte	.LLST33
	.uleb128 0xd
	.ascii	"rc\000"
	.byte	0x1
	.byte	0xdc
	.4byte	0x57
	.4byte	.LLST34
	.uleb128 0x13
	.4byte	.LVL76
	.4byte	0x62d
	.uleb128 0x13
	.4byte	.LVL80
	.4byte	0x638
	.byte	0
	.uleb128 0xb
	.4byte	.LASF29
	.byte	0x1
	.byte	0xee
	.4byte	0x57
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5e8
	.uleb128 0xc
	.4byte	.LASF13
	.byte	0x1
	.byte	0xee
	.4byte	0xfb
	.4byte	.LLST35
	.uleb128 0x14
	.ascii	"buf\000"
	.byte	0x1
	.byte	0xee
	.4byte	0xce
	.4byte	.LLST36
	.uleb128 0x14
	.ascii	"sz\000"
	.byte	0x1
	.byte	0xee
	.4byte	0x57
	.4byte	.LLST37
	.uleb128 0x12
	.4byte	.LASF20
	.byte	0x1
	.byte	0xf0
	.4byte	0x57
	.4byte	.LLST38
	.uleb128 0xd
	.ascii	"rc\000"
	.byte	0x1
	.byte	0xf1
	.4byte	0x57
	.4byte	.LLST39
	.uleb128 0x13
	.4byte	.LVL84
	.4byte	0x62d
	.uleb128 0x13
	.4byte	.LVL88
	.4byte	0x638
	.byte	0
	.uleb128 0x19
	.4byte	.LASF31
	.byte	0x5
	.byte	0x1d
	.4byte	0x73
	.4byte	0x5fd
	.uleb128 0x1a
	.4byte	0x8a
	.byte	0
	.uleb128 0x19
	.4byte	.LASF32
	.byte	0x6
	.byte	0x29
	.4byte	0x73
	.4byte	0x61c
	.uleb128 0x1a
	.4byte	0x73
	.uleb128 0x1a
	.4byte	0x57
	.uleb128 0x1a
	.4byte	0x8a
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF37
	.byte	0x5
	.byte	0x20
	.4byte	0x62d
	.uleb128 0x1a
	.4byte	0x73
	.byte	0
	.uleb128 0x1c
	.4byte	.LASF38
	.byte	0x7
	.byte	0x45
	.4byte	0x57
	.uleb128 0x1d
	.4byte	.LASF39
	.byte	0x7
	.byte	0x47
	.uleb128 0x1a
	.4byte	0x57
	.byte	0
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
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
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
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
	.byte	0
	.byte	0
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0xd
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
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x12
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
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
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
	.uleb128 0x17
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
	.uleb128 0x16
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
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
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1d
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
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LVL0
	.4byte	.LVL1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL1
	.4byte	.LFE32
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL3
	.4byte	.LVL4-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL4-1
	.4byte	.LVL6
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL6
	.4byte	.LVL7
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL7
	.4byte	.LVL8
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL8
	.4byte	.LFE32
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL9
	.4byte	.LVL10-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL10-1
	.4byte	.LVL17
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL17
	.4byte	.LFE33
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL9
	.4byte	.LVL14
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL14
	.4byte	.LVL16
	.2byte	0x2
	.byte	0x31
	.byte	0x9f
	.4byte	.LVL16
	.4byte	.LFE33
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL11
	.4byte	.LVL12
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL12
	.4byte	.LVL16
	.2byte	0x1
	.byte	0x55
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL18
	.4byte	.LVL21-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL21-1
	.4byte	.LVL25
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL25
	.4byte	.LFE34
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL18
	.4byte	.LVL19
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL19
	.4byte	.LVL26
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL26
	.4byte	.LFE34
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST7:
	.4byte	.LVL18
	.4byte	.LVL20
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL20
	.4byte	.LFE34
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST8:
	.4byte	.LVL18
	.4byte	.LVL22
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL22
	.4byte	.LVL23
	.2byte	0x2
	.byte	0x31
	.byte	0x9f
	.4byte	.LVL23
	.4byte	.LVL24
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL24
	.4byte	.LFE34
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST9:
	.4byte	.LVL27
	.4byte	.LVL28-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL28-1
	.4byte	.LVL29
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL29
	.4byte	.LVL30
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL30
	.4byte	.LVL31
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL31
	.4byte	.LFE35
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST10:
	.4byte	.LVL28
	.4byte	.LVL32-1
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST11:
	.4byte	.LVL31
	.4byte	.LVL33
	.2byte	0x1
	.byte	0x54
	.4byte	0
	.4byte	0
.LLST12:
	.4byte	.LVL34
	.4byte	.LVL35-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL35-1
	.4byte	.LVL36
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL36
	.4byte	.LFE36
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST13:
	.4byte	.LVL35
	.4byte	.LVL38-1
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST14:
	.4byte	.LVL37
	.4byte	.LVL39
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL39
	.4byte	.LFE36
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST15:
	.4byte	.LVL40
	.4byte	.LVL41-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL41-1
	.4byte	.LVL43
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL43
	.4byte	.LFE37
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST16:
	.4byte	.LVL41
	.4byte	.LVL42-1
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST17:
	.4byte	.LVL44
	.4byte	.LVL45-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL45-1
	.4byte	.LVL51
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL51
	.4byte	.LFE38
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST18:
	.4byte	.LVL45
	.4byte	.LVL49-1
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST19:
	.4byte	.LVL46
	.4byte	.LVL47
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL47
	.4byte	.LVL48
	.2byte	0x6
	.byte	0x73
	.sleb128 0
	.byte	0x72
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.4byte	.LVL48
	.4byte	.LVL50
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL50
	.4byte	.LFE38
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST20:
	.4byte	.LVL52
	.4byte	.LVL53
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL53
	.4byte	.LFE39
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST21:
	.4byte	.LVL54
	.4byte	.LVL55-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL55-1
	.4byte	.LVL56
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL56
	.4byte	.LFE40
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST22:
	.4byte	.LVL55
	.4byte	.LVL56
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL56
	.4byte	.LFE40
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST23:
	.4byte	.LVL57
	.4byte	.LVL58-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL58-1
	.4byte	.LVL64
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL64
	.4byte	.LFE41
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST24:
	.4byte	.LVL57
	.4byte	.LVL58-1
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL58-1
	.4byte	.LFE41
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST25:
	.4byte	.LVL58
	.4byte	.LVL63-1
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST26:
	.4byte	.LVL59
	.4byte	.LVL60
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL61
	.4byte	.LVL62
	.2byte	0x2
	.byte	0x31
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST27:
	.4byte	.LVL65
	.4byte	.LVL66-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL66-1
	.4byte	.LVL71
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL71
	.4byte	.LFE42
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST28:
	.4byte	.LVL65
	.4byte	.LVL66-1
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL66-1
	.4byte	.LVL73
	.2byte	0x1
	.byte	0x56
	.4byte	.LVL73
	.4byte	.LFE42
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST29:
	.4byte	.LVL65
	.4byte	.LVL66-1
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL66-1
	.4byte	.LVL74
	.2byte	0x1
	.byte	0x57
	.4byte	.LVL74
	.4byte	.LFE42
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST30:
	.4byte	.LVL65
	.4byte	.LVL67
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL67
	.4byte	.LVL68
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL68
	.4byte	.LVL69
	.2byte	0x3
	.byte	0x75
	.sleb128 1
	.byte	0x9f
	.4byte	.LVL69
	.4byte	.LVL72
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL72
	.4byte	.LFE42
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST31:
	.4byte	.LVL66
	.4byte	.LVL70-1
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST32:
	.4byte	.LVL75
	.4byte	.LVL76-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL76-1
	.4byte	.LVL81
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL81
	.4byte	.LFE43
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST33:
	.4byte	.LVL76
	.4byte	.LVL80-1
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST34:
	.4byte	.LVL76
	.4byte	.LVL77
	.2byte	0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.4byte	.LVL77
	.4byte	.LVL78
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL78
	.4byte	.LVL79
	.2byte	0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.4byte	.LVL79
	.4byte	.LVL82
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL82
	.4byte	.LFE43
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST35:
	.4byte	.LVL83
	.4byte	.LVL84-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL84-1
	.4byte	.LVL89
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL89
	.4byte	.LFE44
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST36:
	.4byte	.LVL83
	.4byte	.LVL84-1
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL84-1
	.4byte	.LVL92
	.2byte	0x1
	.byte	0x57
	.4byte	.LVL92
	.4byte	.LFE44
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST37:
	.4byte	.LVL83
	.4byte	.LVL84-1
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL84-1
	.4byte	.LVL91
	.2byte	0x1
	.byte	0x56
	.4byte	.LVL91
	.4byte	.LFE44
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST38:
	.4byte	.LVL84
	.4byte	.LVL88-1
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST39:
	.4byte	.LVL84
	.4byte	.LVL85
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL85
	.4byte	.LVL86
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL86
	.4byte	.LVL87
	.2byte	0x3
	.byte	0x75
	.sleb128 1
	.byte	0x9f
	.4byte	.LVL87
	.4byte	.LVL90
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL90
	.4byte	.LFE44
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x7c
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
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF12:
	.ascii	"size_t\000"
.LASF19:
	.ascii	"caribou_bytequeue_free\000"
.LASF18:
	.ascii	"caribou_bytequeue_new\000"
.LASF25:
	.ascii	"caribou_bytequeue_half_full\000"
.LASF20:
	.ascii	"state\000"
.LASF26:
	.ascii	"caribou_bytequeue_put\000"
.LASF29:
	.ascii	"caribou_bytequeue_gets\000"
.LASF13:
	.ascii	"queue\000"
.LASF27:
	.ascii	"caribou_bytequeue_puts\000"
.LASF35:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4/crossworks\000"
.LASF36:
	.ascii	"caribou_bytequeue_clear\000"
.LASF5:
	.ascii	"short unsigned int\000"
.LASF33:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -std=gnu99 -Os -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF32:
	.ascii	"memset\000"
.LASF15:
	.ascii	"head\000"
.LASF31:
	.ascii	"malloc\000"
.LASF21:
	.ascii	"caribou_bytequeue_init\000"
.LASF6:
	.ascii	"unsigned int\000"
.LASF14:
	.ascii	"size\000"
.LASF8:
	.ascii	"long long unsigned int\000"
.LASF3:
	.ascii	"uint8_t\000"
.LASF39:
	.ascii	"chip_interrupts_set\000"
.LASF11:
	.ascii	"sizetype\000"
.LASF37:
	.ascii	"free\000"
.LASF7:
	.ascii	"long long int\000"
.LASF38:
	.ascii	"chip_interrupts_disable\000"
.LASF34:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4/crossworks/../"
	.ascii	"../../../src/lib/bytequeue.c\000"
.LASF28:
	.ascii	"caribou_bytequeue_get\000"
.LASF30:
	.ascii	"caribou_bytequeue_size\000"
.LASF2:
	.ascii	"short int\000"
.LASF4:
	.ascii	"uint16_t\000"
.LASF16:
	.ascii	"tail\000"
.LASF22:
	.ascii	"caribou_bytequeue_full\000"
.LASF9:
	.ascii	"long int\000"
.LASF10:
	.ascii	"char\000"
.LASF23:
	.ascii	"caribou_bytequeue_empty\000"
.LASF0:
	.ascii	"signed char\000"
.LASF17:
	.ascii	"caribou_bytequeue_t\000"
.LASF24:
	.ascii	"caribou_bytequeue_level\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
