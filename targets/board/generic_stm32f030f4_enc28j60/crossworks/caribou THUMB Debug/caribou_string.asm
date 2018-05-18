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
	.file	"string.c"
	.text
.Ltext0:
	.section	.text.memcpy,"ax",%progbits
	.align	1
	.global	memcpy
	.code	16
	.thumb_func
	.type	memcpy, %function
memcpy:
.LFB0:
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4_enc28j60/crossworks/../../../../src/lib/string.c"
	.loc 1 22 0
.LVL0:
	.loc 1 23 0
	mov	r3, #0
	.loc 1 22 0
	push	{r4, lr}
.LCFI0:
	.loc 1 23 0
	cmp	r0, r3
	beq	.L6
.LVL1:
.L3:
.LBB2:
	.loc 1 27 0 discriminator 1
	cmp	r3, r2
	beq	.L6
.LVL2:
	.loc 1 29 0
	ldrb	r4, [r1, r3]
	strb	r4, [r0, r3]
.LVL3:
	add	r3, r3, #1
.LVL4:
	b	.L3
.LVL5:
.L6:
.LBE2:
	.loc 1 34 0
	@ sp needed
	pop	{r4, pc}
.LFE0:
	.size	memcpy, .-memcpy
	.section	.text.memmove,"ax",%progbits
	.align	1
	.global	memmove
	.code	16
	.thumb_func
	.type	memmove, %function
memmove:
.LFB1:
	.loc 1 40 0
.LVL6:
	push	{r4, r5, r6, lr}
.LCFI1:
	.loc 1 45 0
	cmp	r0, #0
	beq	.L17
	.loc 1 47 0
	cmp	r0, r1
	bhi	.L10
.L12:
	.loc 1 50 0 discriminator 1
	mov	r3, #0
	b	.L11
.L10:
	.loc 1 47 0 discriminator 1
	add	r4, r1, r2
	cmp	r0, r4
	bcs	.L12
.LVL7:
	.loc 1 50 0
	add	r5, r0, r2
.LVL8:
	mov	r3, r2
.LVL9:
.L13:
	.loc 1 50 0 is_stmt 0 discriminator 1
	sub	r3, r3, #1
	bcc	.L17
.LVL10:
	neg	r1, r2
	add	r6, r4, r1
	.loc 1 51 0 is_stmt 1
	ldrb	r6, [r6, r3]
	add	r1, r5, r1
	strb	r6, [r1, r3]
	b	.L13
.LVL11:
.L11:
	.loc 1 55 0 discriminator 1
	cmp	r3, r2
	beq	.L17
.LVL12:
	.loc 1 56 0
	ldrb	r4, [r1, r3]
	strb	r4, [r0, r3]
	add	r3, r3, #1
.LVL13:
	b	.L11
.LVL14:
.L17:
	.loc 1 60 0
	@ sp needed
	pop	{r4, r5, r6, pc}
.LFE1:
	.size	memmove, .-memmove
	.section	.text.memset,"ax",%progbits
	.align	1
	.global	memset
	.code	16
	.thumb_func
	.type	memset, %function
memset:
.LFB2:
	.loc 1 66 0
.LVL15:
	mov	r3, r0
	add	r2, r0, r2
.LVL16:
	.loc 1 68 0
	cmp	r0, #0
	beq	.L23
.L20:
.LVL17:
.LBB3:
	.loc 1 70 0 discriminator 1
	cmp	r3, r2
	beq	.L23
	.loc 1 72 0 discriminator 2
	strb	r1, [r3]
.LVL18:
	add	r3, r3, #1
.LVL19:
	b	.L20
.LVL20:
.L23:
.LBE3:
	.loc 1 76 0
	@ sp needed
	bx	lr
.LFE2:
	.size	memset, .-memset
	.section	.text.memcmp,"ax",%progbits
	.align	1
	.global	memcmp
	.code	16
	.thumb_func
	.type	memcmp, %function
memcmp:
.LFB3:
	.loc 1 82 0
.LVL21:
	push	{r4, r5, lr}
.LCFI2:
.LBB4:
	.loc 1 85 0
	mov	r3, #0
.LVL22:
.L25:
	.loc 1 85 0 is_stmt 0 discriminator 1
	cmp	r3, r2
	beq	.L29
	.loc 1 87 0 is_stmt 1
	ldrb	r5, [r0, r3]
	ldrb	r4, [r1, r3]
	cmp	r5, r4
	beq	.L26
	.loc 1 89 0
	sub	r0, r5, r4
.LVL23:
	b	.L27
.LVL24:
.L26:
	.loc 1 85 0
	add	r3, r3, #1
.LVL25:
	b	.L25
.L29:
.LBE4:
	.loc 1 92 0
	mov	r0, #0
.LVL26:
.L27:
	.loc 1 93 0
	@ sp needed
	pop	{r4, r5, pc}
.LFE3:
	.size	memcmp, .-memcmp
	.section	.text.strcpy,"ax",%progbits
	.align	1
	.global	strcpy
	.code	16
	.thumb_func
	.type	strcpy, %function
strcpy:
.LFB4:
	.loc 1 99 0
.LVL27:
	.loc 1 101 0
	mov	r3, #0
.LVL28:
.L32:
	.loc 1 101 0 is_stmt 0 discriminator 1
	ldrb	r2, [r1, r3]
	strb	r2, [r0, r3]
	add	r3, r3, #1
.LVL29:
	cmp	r2, #0
	bne	.L32
	.loc 1 103 0 is_stmt 1
	@ sp needed
	bx	lr
.LFE4:
	.size	strcpy, .-strcpy
	.section	.text.strncpy,"ax",%progbits
	.align	1
	.global	strncpy
	.code	16
	.thumb_func
	.type	strncpy, %function
strncpy:
.LFB5:
	.loc 1 109 0
.LVL30:
	push	{r4, lr}
.LCFI3:
	.loc 1 111 0
	mov	r3, #0
.LVL31:
.L36:
	.loc 1 111 0 is_stmt 0 discriminator 1
	cmp	r3, r2
	beq	.L38
.LVL32:
	.loc 1 111 0 discriminator 2
	ldrb	r4, [r1, r3]
	strb	r4, [r0, r3]
	add	r3, r3, #1
.LVL33:
	cmp	r4, #0
	bne	.L36
.LVL34:
.L38:
	.loc 1 113 0 is_stmt 1
	@ sp needed
	pop	{r4, pc}
.LFE5:
	.size	strncpy, .-strncpy
	.section	.text.strcmp,"ax",%progbits
	.align	1
	.global	strcmp
	.code	16
	.thumb_func
	.type	strcmp, %function
strcmp:
.LFB6:
	.loc 1 120 0
.LVL35:
.L42:
	.loc 1 121 0 discriminator 1
	ldrb	r3, [r0]
	ldrb	r2, [r1]
	cmp	r3, #0
	beq	.L43
	.loc 1 121 0 is_stmt 0 discriminator 2
	cmp	r2, r3
	bne	.L46
	.loc 1 121 0 discriminator 1
	add	r0, r0, #1
.LVL36:
	add	r1, r1, #1
.LVL37:
	b	.L42
.L43:
	.loc 1 123 0 is_stmt 1
	mov	r0, r3
.LVL38:
	.loc 1 122 0
	cmp	r2, #0
	beq	.L49
.L46:
	.loc 1 124 0
	ldrb	r0, [r1]
	cmp	r3, r0
	sbc	r3, r3, r3
	mov	r0, #1
	orr	r0, r3
.L49:
	.loc 1 125 0
	@ sp needed
	bx	lr
.LFE6:
	.size	strcmp, .-strcmp
	.section	.text.strcasecmp,"ax",%progbits
	.align	1
	.global	strcasecmp
	.code	16
	.thumb_func
	.type	strcasecmp, %function
strcasecmp:
.LFB7:
	.loc 1 131 0
.LVL39:
	push	{r4, r5, lr}
.LCFI4:
.L52:
	.loc 1 132 0 discriminator 1
	ldrb	r3, [r0]
	cmp	r3, #0
	beq	.L53
	.loc 1 132 0 is_stmt 0 discriminator 2
	mov	r2, r3
	sub	r2, r2, #97
	mov	r4, r3
	cmp	r2, #25
	bhi	.L55
	.loc 1 132 0 discriminator 1
	sub	r4, r4, #32
.L55:
	.loc 1 132 0 discriminator 3
	ldrb	r2, [r1]
	mov	r5, r2
	sub	r5, r5, #97
	cmp	r5, #25
	bhi	.L57
	.loc 1 132 0 discriminator 1
	sub	r2, r2, #32
.L57:
	.loc 1 132 0 discriminator 3
	cmp	r4, r2
	bne	.L64
	.loc 1 132 0 discriminator 1
	add	r0, r0, #1
.LVL40:
	add	r1, r1, #1
.LVL41:
	b	.L52
.L53:
	.loc 1 133 0 is_stmt 1
	ldrb	r2, [r1]
	.loc 1 134 0
	mov	r0, r3
.LVL42:
	.loc 1 133 0
	cmp	r2, #0
	beq	.L67
.L64:
	.loc 1 135 0
	mov	r2, r3
	sub	r2, r2, #97
	cmp	r2, #25
	bhi	.L60
	.loc 1 135 0 is_stmt 0 discriminator 1
	sub	r3, r3, #32
.L60:
	.loc 1 135 0 discriminator 3
	ldrb	r2, [r1]
	mov	r1, r2
.LVL43:
	sub	r1, r1, #97
	cmp	r1, #25
	bhi	.L62
	.loc 1 135 0 discriminator 1
	sub	r2, r2, #32
.L62:
	.loc 1 135 0 discriminator 3
	mov	r0, #1
	cmp	r3, r2
	bge	.L67
	.loc 1 135 0
	neg	r0, r0
.L67:
	.loc 1 136 0 is_stmt 1
	@ sp needed
	pop	{r4, r5, pc}
.LFE7:
	.size	strcasecmp, .-strcasecmp
	.section	.text.strncmp,"ax",%progbits
	.align	1
	.global	strncmp
	.code	16
	.thumb_func
	.type	strncmp, %function
strncmp:
.LFB8:
	.loc 1 142 0
.LVL44:
	mov	r3, r0
	.loc 1 152 0
	mov	r0, #0
.LVL45:
	.loc 1 142 0
	push	{r4, lr}
.LCFI5:
	.loc 1 143 0
	cmp	r2, r0
	beq	.L70
	sub	r2, r2, #1
.LVL46:
	add	r2, r3, r2
.LVL47:
.L71:
	.loc 1 145 0 discriminator 1
	cmp	r3, r2
	bne	.L72
.L73:
	.loc 1 150 0
	ldrb	r0, [r3]
	ldrb	r3, [r1]
.LVL48:
	sub	r0, r0, r3
	b	.L70
.LVL49:
.L72:
	.loc 1 145 0 discriminator 2
	ldrb	r0, [r3]
	cmp	r0, #0
	beq	.L73
	.loc 1 145 0 is_stmt 0 discriminator 1
	ldrb	r4, [r1]
	cmp	r4, r0
	bne	.L73
	.loc 1 147 0 is_stmt 1
	add	r3, r3, #1
.LVL50:
	.loc 1 148 0
	add	r1, r1, #1
.LVL51:
	b	.L71
.LVL52:
.L70:
	.loc 1 153 0
	@ sp needed
	pop	{r4, pc}
.LFE8:
	.size	strncmp, .-strncmp
	.section	.text.strncasecmp,"ax",%progbits
	.align	1
	.global	strncasecmp
	.code	16
	.thumb_func
	.type	strncasecmp, %function
strncasecmp:
.LFB9:
	.loc 1 159 0
.LVL53:
	push	{r4, r5, r6, lr}
.LCFI6:
	sub	r2, r2, #1
.LVL54:
	.loc 1 159 0
	mov	r5, #0
.LVL55:
.L84:
	.loc 1 163 0
	ldrb	r3, [r0, r5]
.LVL56:
	mov	r4, r3
	sub	r4, r4, #65
	cmp	r4, #25
	bhi	.L81
	.loc 1 163 0 is_stmt 0 discriminator 1
	add	r3, r3, #32
.LVL57:
.L81:
	.loc 1 164 0 is_stmt 1
	ldrb	r4, [r1, r5]
.LVL58:
	mov	r6, r4
	sub	r6, r6, #65
	cmp	r6, #25
	bhi	.L82
	.loc 1 164 0 is_stmt 0 discriminator 1
	add	r4, r4, #32
.LVL59:
.L82:
	.loc 1 165 0 is_stmt 1
	cmp	r5, r2
	beq	.L83
	.loc 1 165 0 is_stmt 0 discriminator 1
	cmp	r3, #0
	beq	.L83
	add	r5, r5, #1
.LVL60:
	cmp	r3, r4
	beq	.L84
.LVL61:
.L83:
	.loc 1 166 0 is_stmt 1
	sub	r0, r3, r4
	.loc 1 167 0
	@ sp needed
.LVL62:
	pop	{r4, r5, r6, pc}
.LFE9:
	.size	strncasecmp, .-strncasecmp
	.section	.text.strlen,"ax",%progbits
	.align	1
	.global	strlen
	.code	16
	.thumb_func
	.type	strlen, %function
strlen:
.LFB10:
	.loc 1 173 0
.LVL63:
	.loc 1 173 0
	sub	r3, r0, #0
	.loc 1 175 0
	beq	.L92
	mov	r2, r0
.LVL64:
.L90:
	sub	r0, r2, r3
.LVL65:
	add	r2, r2, #1
.LVL66:
	sub	r1, r2, #1
.LBB5:
	.loc 1 177 0 discriminator 1
	ldrb	r1, [r1]
	cmp	r1, #0
	bne	.L90
	b	.L89
.LVL67:
.L92:
.L89:
.LBE5:
	.loc 1 180 0
	@ sp needed
	bx	lr
.LFE10:
	.size	strlen, .-strlen
	.section	.text.strchr,"ax",%progbits
	.align	1
	.global	strchr
	.code	16
	.thumb_func
	.type	strchr, %function
strchr:
.LFB11:
	.loc 1 186 0
.LVL68:
.L94:
	.loc 1 187 0 discriminator 1
	ldrb	r3, [r0]
	cmp	r3, #0
	beq	.L98
	.loc 1 189 0
	cmp	r3, r1
	beq	.L95
	.loc 1 191 0
	add	r0, r0, #1
.LVL69:
	b	.L94
.L98:
	.loc 1 193 0
	mov	r0, r3
.LVL70:
.L95:
	.loc 1 194 0
	@ sp needed
	bx	lr
.LFE11:
	.size	strchr, .-strchr
	.section	.text.strcat,"ax",%progbits
	.align	1
	.global	strcat
	.code	16
	.thumb_func
	.type	strcat, %function
strcat:
.LFB12:
	.loc 1 200 0
.LVL71:
	push	{r4, lr}
.LCFI7:
	.loc 1 201 0
	mov	r2, r0
.LVL72:
.L100:
	.loc 1 202 0 discriminator 1
	ldrb	r3, [r2]
	cmp	r3, #0
	beq	.L103
	.loc 1 202 0 is_stmt 0 discriminator 2
	add	r2, r2, #1
.LVL73:
	b	.L100
.LVL74:
.L103:
	.loc 1 205 0 is_stmt 1 discriminator 1
	ldrb	r4, [r1, r3]
	strb	r4, [r2, r3]
.LVL75:
	add	r3, r3, #1
.LVL76:
	add	r4, r1, r3
	sub	r4, r4, #1
	.loc 1 206 0 discriminator 1
	ldrb	r4, [r4]
	cmp	r4, #0
	bne	.L103
	.loc 1 208 0
	@ sp needed
	pop	{r4, pc}
.LFE12:
	.size	strcat, .-strcat
	.section	.text.atoi,"ax",%progbits
	.align	1
	.global	atoi
	.code	16
	.thumb_func
	.type	atoi, %function
atoi:
.LFB13:
	.loc 1 214 0
.LVL77:
	push	{r4, r5, r6, lr}
.LCFI8:
.LVL78:
.L105:
	.loc 1 216 0 discriminator 1
	ldrb	r2, [r0]
	cmp	r2, #32
	bne	.L126
.L106:
	.loc 1 216 0 is_stmt 0 discriminator 2
	add	r0, r0, #1
.LVL79:
	b	.L105
.L126:
	.loc 1 216 0 discriminator 3
	cmp	r2, #9
	beq	.L106
	.loc 1 215 0 is_stmt 1
	mov	r3, #0
	.loc 1 217 0
	cmp	r2, r3
	beq	.L107
	add	r3, r0, #1
.L108:
.LBB6:
	.loc 1 221 0 discriminator 1
	ldrb	r1, [r3]
	sub	r2, r3, r0
.LVL80:
	mov	r4, r1
	sub	r4, r4, #48
	cmp	r4, #9
	bhi	.L127
.L109:
.LVL81:
	add	r3, r3, #1
.LVL82:
	b	.L108
.LVL83:
.L127:
	.loc 1 221 0 is_stmt 0 discriminator 2
	sub	r1, r1, #45
	cmp	r1, #1
	bls	.L109
	.loc 1 223 0 is_stmt 1
	sub	r2, r2, #1
.LVL84:
	.loc 1 220 0
	mov	r1, #1
.LBE6:
	.loc 1 215 0
	mov	r3, #0
.LVL85:
.L110:
.LBB7:
	.loc 1 223 0 discriminator 2
	ldrb	r4, [r0, r2]
	mov	r5, r4
	sub	r5, r5, #48
	uxtb	r6, r5
	cmp	r6, #9
	bhi	.L128
	.loc 1 237 0
	mul	r5, r1
	.loc 1 238 0
	mov	r4, #10
	.loc 1 237 0
	add	r3, r3, r5
.LVL86:
	.loc 1 238 0
	mul	r1, r4
.LVL87:
	b	.L112
.L128:
	.loc 1 223 0 discriminator 1
	cmp	r4, #46
	bne	.L129
	.loc 1 232 0
	mov	r1, #1
.LVL88:
	.loc 1 233 0
	mov	r3, #0
.LVL89:
.L112:
	.loc 1 223 0
	sub	r2, r2, #1
	bcs	.L110
.LVL90:
	b	.L107
.L129:
	.loc 1 223 0 is_stmt 0 discriminator 1
	cmp	r4, #45
	bne	.L107
	.loc 1 227 0 is_stmt 1
	neg	r3, r3
.LVL91:
.L107:
.LBE7:
	.loc 1 243 0
	mov	r0, r3
.LVL92:
	@ sp needed
	pop	{r4, r5, r6, pc}
.LFE13:
	.size	atoi, .-atoi
	.section	.text.strdup,"ax",%progbits
	.align	1
	.global	strdup
	.code	16
	.thumb_func
	.type	strdup, %function
strdup:
.LFB14:
	.loc 1 247 0
.LVL93:
	push	{r4, lr}
.LCFI9:
	.loc 1 247 0
	mov	r4, r0
	.loc 1 248 0
	bl	strlen
.LVL94:
	add	r0, r0, #1
	bl	malloc
.LVL95:
	.loc 1 249 0
	cmp	r0, #0
	beq	.L132
	.loc 1 251 0
	mov	r1, r4
	bl	strcpy
.LVL96:
.L132:
	.loc 1 253 0
	@ sp needed
.LVL97:
	pop	{r4, pc}
.LFE14:
	.size	strdup, .-strdup
	.section	.text.strncat,"ax",%progbits
	.align	1
	.global	strncat
	.code	16
	.thumb_func
	.type	strncat, %function
strncat:
.LFB15:
	.loc 1 260 0
.LVL98:
	push	{r4, r5, lr}
.LCFI10:
	.loc 1 261 0
	mov	r3, r0
	cmp	r2, #0
	beq	.L137
.L138:
.LVL99:
.LBB8:
	.loc 1 265 0 discriminator 1
	ldrb	r4, [r3]
	cmp	r4, #0
	beq	.L148
	.loc 1 266 0
	add	r3, r3, #1
.LVL100:
	b	.L138
.L148:
	mov	r5, r3
.LVL101:
.L141:
	.loc 1 268 0
	ldrb	r4, [r1]
	strb	r4, [r3]
	cmp	r4, #0
	beq	.L140
	.loc 1 270 0
	add	r3, r3, #1
.LVL102:
	add	r4, r5, r2
	add	r1, r1, #1
	.loc 1 271 0
	cmp	r3, r4
	bne	.L141
.LVL103:
.L140:
	.loc 1 272 0
	mov	r2, #0
	strb	r2, [r3]
.LVL104:
.L137:
.LBE8:
	.loc 1 275 0
	@ sp needed
	pop	{r4, r5, pc}
.LFE15:
	.size	strncat, .-strncat
	.section	.text.strcspn,"ax",%progbits
	.align	1
	.global	strcspn
	.code	16
	.thumb_func
	.type	strcspn, %function
strcspn:
.LFB16:
	.loc 1 278 0
.LVL105:
	push	{r4, r5, r6, lr}
.LCFI11:
	.loc 1 281 0
	mov	r3, r0
.LVL106:
.L150:
	.loc 1 281 0 is_stmt 0 discriminator 1
	ldrb	r4, [r3]
	sub	r6, r3, r0
	cmp	r4, #0
	beq	.L157
	mov	r2, r1
.L155:
.LVL107:
	.loc 1 282 0 is_stmt 1 discriminator 1
	ldrb	r5, [r2]
	cmp	r5, #0
	beq	.L160
	add	r2, r2, #1
.LVL108:
	.loc 1 283 0
	cmp	r5, r4
	bne	.L155
	b	.L157
.LVL109:
.L160:
	add	r3, r3, #1
.LVL110:
	b	.L150
.LVL111:
.L157:
	.loc 1 290 0
	mov	r0, r6
.LVL112:
	@ sp needed
	pop	{r4, r5, r6, pc}
.LFE16:
	.size	strcspn, .-strcspn
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
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.byte	0x4
	.4byte	.LCFI0-.LFB0
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
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.byte	0x4
	.4byte	.LCFI1-.LFB1
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
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.align	2
.LEFDE4:
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.byte	0x4
	.4byte	.LCFI2-.LFB3
	.byte	0xe
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x85
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE6:
.LSFDE8:
	.4byte	.LEFDE8-.LASFDE8
.LASFDE8:
	.4byte	.Lframe0
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.align	2
.LEFDE8:
.LSFDE10:
	.4byte	.LEFDE10-.LASFDE10
.LASFDE10:
	.4byte	.Lframe0
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.byte	0x4
	.4byte	.LCFI3-.LFB5
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
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.align	2
.LEFDE12:
.LSFDE14:
	.4byte	.LEFDE14-.LASFDE14
.LASFDE14:
	.4byte	.Lframe0
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.byte	0x4
	.4byte	.LCFI4-.LFB7
	.byte	0xe
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x85
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE14:
.LSFDE16:
	.4byte	.LEFDE16-.LASFDE16
.LASFDE16:
	.4byte	.Lframe0
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.byte	0x4
	.4byte	.LCFI5-.LFB8
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
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.byte	0x4
	.4byte	.LCFI6-.LFB9
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
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.align	2
.LEFDE20:
.LSFDE22:
	.4byte	.LEFDE22-.LASFDE22
.LASFDE22:
	.4byte	.Lframe0
	.4byte	.LFB11
	.4byte	.LFE11-.LFB11
	.align	2
.LEFDE22:
.LSFDE24:
	.4byte	.LEFDE24-.LASFDE24
.LASFDE24:
	.4byte	.Lframe0
	.4byte	.LFB12
	.4byte	.LFE12-.LFB12
	.byte	0x4
	.4byte	.LCFI7-.LFB12
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE24:
.LSFDE26:
	.4byte	.LEFDE26-.LASFDE26
.LASFDE26:
	.4byte	.Lframe0
	.4byte	.LFB13
	.4byte	.LFE13-.LFB13
	.byte	0x4
	.4byte	.LCFI8-.LFB13
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
.LEFDE26:
.LSFDE28:
	.4byte	.LEFDE28-.LASFDE28
.LASFDE28:
	.4byte	.Lframe0
	.4byte	.LFB14
	.4byte	.LFE14-.LFB14
	.byte	0x4
	.4byte	.LCFI9-.LFB14
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE28:
.LSFDE30:
	.4byte	.LEFDE30-.LASFDE30
.LASFDE30:
	.4byte	.Lframe0
	.4byte	.LFB15
	.4byte	.LFE15-.LFB15
	.byte	0x4
	.4byte	.LCFI10-.LFB15
	.byte	0xe
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x85
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE30:
.LSFDE32:
	.4byte	.LEFDE32-.LASFDE32
.LASFDE32:
	.4byte	.Lframe0
	.4byte	.LFB16
	.4byte	.LFE16-.LFB16
	.byte	0x4
	.4byte	.LCFI11-.LFB16
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
	.text
.Letext0:
	.file 2 "/usr/share/crossworks_for_arm_3.3/include/stddef.h"
	.file 3 "../../../../include/caribou/lib/heap.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x630
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF37
	.byte	0x1
	.4byte	.LASF38
	.4byte	.LASF39
	.4byte	.Ldebug_ranges0+0x18
	.4byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF2
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF3
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF4
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF5
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF6
	.uleb128 0x4
	.byte	0x4
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF7
	.uleb128 0x5
	.byte	0x4
	.4byte	0x6c
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF8
	.uleb128 0x5
	.byte	0x4
	.4byte	0x79
	.uleb128 0x6
	.4byte	0x6c
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF9
	.uleb128 0x7
	.4byte	.LASF40
	.byte	0x2
	.byte	0x16
	.4byte	0x48
	.uleb128 0x8
	.4byte	.LASF13
	.byte	0x1
	.byte	0x15
	.4byte	0x5d
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xfb
	.uleb128 0x9
	.ascii	"dst\000"
	.byte	0x1
	.byte	0x15
	.4byte	0x5d
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x9
	.ascii	"src\000"
	.byte	0x1
	.byte	0x15
	.4byte	0xfb
	.uleb128 0x1
	.byte	0x51
	.uleb128 0xa
	.4byte	.LASF10
	.byte	0x1
	.byte	0x15
	.4byte	0x85
	.4byte	.LLST0
	.uleb128 0xb
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.uleb128 0xc
	.4byte	.LASF11
	.byte	0x1
	.byte	0x19
	.4byte	0x66
	.4byte	.LLST1
	.uleb128 0xc
	.4byte	.LASF12
	.byte	0x1
	.byte	0x1a
	.4byte	0x66
	.4byte	.LLST2
	.byte	0
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.4byte	0x101
	.uleb128 0xd
	.uleb128 0x8
	.4byte	.LASF14
	.byte	0x1
	.byte	0x27
	.4byte	0x5d
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x170
	.uleb128 0xe
	.4byte	.LASF15
	.byte	0x1
	.byte	0x27
	.4byte	0x5d
	.uleb128 0x1
	.byte	0x50
	.uleb128 0xa
	.4byte	.LASF16
	.byte	0x1
	.byte	0x27
	.4byte	0xfb
	.4byte	.LLST3
	.uleb128 0xf
	.ascii	"n\000"
	.byte	0x1
	.byte	0x27
	.4byte	0x85
	.4byte	.LLST4
	.uleb128 0x10
	.ascii	"dst\000"
	.byte	0x1
	.byte	0x29
	.4byte	0x66
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x11
	.ascii	"src\000"
	.byte	0x1
	.byte	0x2a
	.4byte	0x66
	.4byte	.LLST5
	.uleb128 0xc
	.4byte	.LASF17
	.byte	0x1
	.byte	0x2b
	.4byte	0x66
	.4byte	.LLST6
	.byte	0
	.uleb128 0x8
	.4byte	.LASF18
	.byte	0x1
	.byte	0x41
	.4byte	0x5d
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1cf
	.uleb128 0x9
	.ascii	"s\000"
	.byte	0x1
	.byte	0x41
	.4byte	0x5d
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x9
	.ascii	"c\000"
	.byte	0x1
	.byte	0x41
	.4byte	0x41
	.uleb128 0x1
	.byte	0x51
	.uleb128 0xf
	.ascii	"n\000"
	.byte	0x1
	.byte	0x41
	.4byte	0x85
	.4byte	.LLST7
	.uleb128 0x10
	.ascii	"p\000"
	.byte	0x1
	.byte	0x43
	.4byte	0x1cf
	.uleb128 0x1
	.byte	0x50
	.uleb128 0xb
	.4byte	.LBB3
	.4byte	.LBE3-.LBB3
	.uleb128 0x11
	.ascii	"j\000"
	.byte	0x1
	.byte	0x46
	.4byte	0x85
	.4byte	.LLST8
	.byte	0
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.4byte	0x2c
	.uleb128 0x8
	.4byte	.LASF19
	.byte	0x1
	.byte	0x51
	.4byte	0x41
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x247
	.uleb128 0xf
	.ascii	"s1\000"
	.byte	0x1
	.byte	0x51
	.4byte	0xfb
	.4byte	.LLST9
	.uleb128 0x9
	.ascii	"s2\000"
	.byte	0x1
	.byte	0x51
	.4byte	0xfb
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x9
	.ascii	"n\000"
	.byte	0x1
	.byte	0x51
	.4byte	0x85
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x11
	.ascii	"cs\000"
	.byte	0x1
	.byte	0x53
	.4byte	0x66
	.4byte	.LLST10
	.uleb128 0x11
	.ascii	"ct\000"
	.byte	0x1
	.byte	0x54
	.4byte	0x66
	.4byte	.LLST11
	.uleb128 0xb
	.4byte	.LBB4
	.4byte	.LBE4-.LBB4
	.uleb128 0x11
	.ascii	"i\000"
	.byte	0x1
	.byte	0x55
	.4byte	0x85
	.4byte	.LLST12
	.byte	0
	.byte	0
	.uleb128 0x8
	.4byte	.LASF20
	.byte	0x1
	.byte	0x62
	.4byte	0x66
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x28a
	.uleb128 0xa
	.4byte	.LASF21
	.byte	0x1
	.byte	0x62
	.4byte	0x66
	.4byte	.LLST13
	.uleb128 0xf
	.ascii	"src\000"
	.byte	0x1
	.byte	0x62
	.4byte	0x73
	.4byte	.LLST14
	.uleb128 0x10
	.ascii	"p\000"
	.byte	0x1
	.byte	0x64
	.4byte	0x66
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x8
	.4byte	.LASF22
	.byte	0x1
	.byte	0x6c
	.4byte	0x66
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2dc
	.uleb128 0xa
	.4byte	.LASF21
	.byte	0x1
	.byte	0x6c
	.4byte	0x66
	.4byte	.LLST15
	.uleb128 0xf
	.ascii	"src\000"
	.byte	0x1
	.byte	0x6c
	.4byte	0x73
	.4byte	.LLST16
	.uleb128 0xf
	.ascii	"len\000"
	.byte	0x1
	.byte	0x6c
	.4byte	0x85
	.4byte	.LLST17
	.uleb128 0x10
	.ascii	"p\000"
	.byte	0x1
	.byte	0x6e
	.4byte	0x66
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x8
	.4byte	.LASF23
	.byte	0x1
	.byte	0x77
	.4byte	0x41
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x312
	.uleb128 0xf
	.ascii	"s1\000"
	.byte	0x1
	.byte	0x77
	.4byte	0x73
	.4byte	.LLST18
	.uleb128 0xf
	.ascii	"s2\000"
	.byte	0x1
	.byte	0x77
	.4byte	0x73
	.4byte	.LLST19
	.byte	0
	.uleb128 0x8
	.4byte	.LASF24
	.byte	0x1
	.byte	0x82
	.4byte	0x41
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x348
	.uleb128 0xf
	.ascii	"s1\000"
	.byte	0x1
	.byte	0x82
	.4byte	0x73
	.4byte	.LLST20
	.uleb128 0xf
	.ascii	"s2\000"
	.byte	0x1
	.byte	0x82
	.4byte	0x73
	.4byte	.LLST21
	.byte	0
	.uleb128 0x8
	.4byte	.LASF25
	.byte	0x1
	.byte	0x8d
	.4byte	0x41
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x38b
	.uleb128 0xf
	.ascii	"s1\000"
	.byte	0x1
	.byte	0x8d
	.4byte	0x73
	.4byte	.LLST22
	.uleb128 0xf
	.ascii	"s2\000"
	.byte	0x1
	.byte	0x8d
	.4byte	0x73
	.4byte	.LLST23
	.uleb128 0xf
	.ascii	"n\000"
	.byte	0x1
	.byte	0x8d
	.4byte	0x85
	.4byte	.LLST24
	.byte	0
	.uleb128 0x8
	.4byte	.LASF26
	.byte	0x1
	.byte	0x9e
	.4byte	0x41
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3e6
	.uleb128 0xf
	.ascii	"s1\000"
	.byte	0x1
	.byte	0x9e
	.4byte	0x73
	.4byte	.LLST25
	.uleb128 0xf
	.ascii	"s2\000"
	.byte	0x1
	.byte	0x9e
	.4byte	0x73
	.4byte	.LLST26
	.uleb128 0xf
	.ascii	"n\000"
	.byte	0x1
	.byte	0x9e
	.4byte	0x85
	.4byte	.LLST27
	.uleb128 0x10
	.ascii	"f\000"
	.byte	0x1
	.byte	0xa0
	.4byte	0x41
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x11
	.ascii	"l\000"
	.byte	0x1
	.byte	0xa0
	.4byte	0x41
	.4byte	.LLST28
	.byte	0
	.uleb128 0x8
	.4byte	.LASF27
	.byte	0x1
	.byte	0xac
	.4byte	0x85
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x433
	.uleb128 0xf
	.ascii	"str\000"
	.byte	0x1
	.byte	0xac
	.4byte	0x73
	.4byte	.LLST29
	.uleb128 0x11
	.ascii	"n\000"
	.byte	0x1
	.byte	0xae
	.4byte	0x85
	.4byte	.LLST30
	.uleb128 0xb
	.4byte	.LBB5
	.4byte	.LBE5-.LBB5
	.uleb128 0x11
	.ascii	"p\000"
	.byte	0x1
	.byte	0xb1
	.4byte	0x66
	.4byte	.LLST31
	.byte	0
	.byte	0
	.uleb128 0x8
	.4byte	.LASF28
	.byte	0x1
	.byte	0xb9
	.4byte	0x66
	.4byte	.LFB11
	.4byte	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x465
	.uleb128 0xf
	.ascii	"s\000"
	.byte	0x1
	.byte	0xb9
	.4byte	0x73
	.4byte	.LLST32
	.uleb128 0x9
	.ascii	"c\000"
	.byte	0x1
	.byte	0xb9
	.4byte	0x41
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x8
	.4byte	.LASF29
	.byte	0x1
	.byte	0xc7
	.4byte	0x66
	.4byte	.LFB12
	.4byte	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4a8
	.uleb128 0xe
	.4byte	.LASF21
	.byte	0x1
	.byte	0xc7
	.4byte	0x66
	.uleb128 0x1
	.byte	0x50
	.uleb128 0xf
	.ascii	"src\000"
	.byte	0x1
	.byte	0xc7
	.4byte	0x73
	.4byte	.LLST33
	.uleb128 0x11
	.ascii	"p\000"
	.byte	0x1
	.byte	0xc9
	.4byte	0x66
	.4byte	.LLST34
	.byte	0
	.uleb128 0x8
	.4byte	.LASF30
	.byte	0x1
	.byte	0xd5
	.4byte	0x41
	.4byte	.LFB13
	.4byte	.LFE13-.LFB13
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x501
	.uleb128 0xf
	.ascii	"a\000"
	.byte	0x1
	.byte	0xd5
	.4byte	0x73
	.4byte	.LLST35
	.uleb128 0x11
	.ascii	"rc\000"
	.byte	0x1
	.byte	0xd7
	.4byte	0x41
	.4byte	.LLST36
	.uleb128 0x12
	.4byte	.Ldebug_ranges0+0
	.uleb128 0xc
	.4byte	.LASF31
	.byte	0x1
	.byte	0xdb
	.4byte	0x41
	.4byte	.LLST37
	.uleb128 0xc
	.4byte	.LASF32
	.byte	0x1
	.byte	0xdc
	.4byte	0x41
	.4byte	.LLST38
	.byte	0
	.byte	0
	.uleb128 0x8
	.4byte	.LASF33
	.byte	0x1
	.byte	0xf6
	.4byte	0x66
	.4byte	.LFB14
	.4byte	.LFE14-.LFB14
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x564
	.uleb128 0xf
	.ascii	"s\000"
	.byte	0x1
	.byte	0xf6
	.4byte	0x73
	.4byte	.LLST39
	.uleb128 0xc
	.4byte	.LASF34
	.byte	0x1
	.byte	0xf8
	.4byte	0x66
	.4byte	.LLST40
	.uleb128 0x13
	.4byte	.LVL94
	.4byte	0x3e6
	.4byte	0x54a
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x15
	.4byte	.LVL95
	.4byte	0x622
	.uleb128 0x16
	.4byte	.LVL96
	.4byte	0x247
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x17
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x103
	.4byte	0x66
	.4byte	.LFB15
	.4byte	.LFE15-.LFB15
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5d1
	.uleb128 0x18
	.ascii	"dst\000"
	.byte	0x1
	.2byte	0x103
	.4byte	0x66
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x19
	.ascii	"src\000"
	.byte	0x1
	.2byte	0x103
	.4byte	0x73
	.4byte	.LLST41
	.uleb128 0x19
	.ascii	"n\000"
	.byte	0x1
	.2byte	0x103
	.4byte	0x85
	.4byte	.LLST42
	.uleb128 0xb
	.4byte	.LBB8
	.4byte	.LBE8-.LBB8
	.uleb128 0x1a
	.ascii	"d\000"
	.byte	0x1
	.2byte	0x107
	.4byte	0x66
	.4byte	.LLST43
	.uleb128 0x1a
	.ascii	"s\000"
	.byte	0x1
	.2byte	0x108
	.4byte	0x73
	.4byte	.LLST44
	.byte	0
	.byte	0
	.uleb128 0x17
	.4byte	.LASF36
	.byte	0x1
	.2byte	0x115
	.4byte	0x85
	.4byte	.LFB16
	.4byte	.LFE16-.LFB16
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x622
	.uleb128 0x19
	.ascii	"p\000"
	.byte	0x1
	.2byte	0x115
	.4byte	0x73
	.4byte	.LLST45
	.uleb128 0x18
	.ascii	"s\000"
	.byte	0x1
	.2byte	0x115
	.4byte	0x73
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1a
	.ascii	"i\000"
	.byte	0x1
	.2byte	0x117
	.4byte	0x41
	.4byte	.LLST46
	.uleb128 0x1a
	.ascii	"j\000"
	.byte	0x1
	.2byte	0x117
	.4byte	0x41
	.4byte	.LLST47
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF41
	.byte	0x3
	.byte	0x1d
	.4byte	0x5d
	.uleb128 0x1c
	.4byte	0x85
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
	.uleb128 0x4
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
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
	.uleb128 0x8
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
	.uleb128 0x9
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
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0xc
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
	.uleb128 0xd
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.uleb128 0xf
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
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x12
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.uleb128 0x14
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
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
	.uleb128 0x18
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
	.uleb128 0x19
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
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1a
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
	.uleb128 0x17
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LVL0
	.4byte	.LVL1
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL1
	.4byte	.LVL3
	.2byte	0x6
	.byte	0x72
	.sleb128 0
	.byte	0x73
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.4byte	.LVL3
	.4byte	.LVL4
	.2byte	0x7
	.byte	0x73
	.sleb128 0
	.byte	0x20
	.byte	0x72
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.4byte	.LVL4
	.4byte	.LVL5
	.2byte	0x6
	.byte	0x72
	.sleb128 0
	.byte	0x73
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL1
	.4byte	.LVL2
	.2byte	0x6
	.byte	0x70
	.sleb128 0
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.4byte	.LVL2
	.4byte	.LVL4
	.2byte	0x8
	.byte	0x70
	.sleb128 0
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.byte	0x23
	.uleb128 0x1
	.byte	0x9f
	.4byte	.LVL4
	.4byte	.LVL5
	.2byte	0x6
	.byte	0x70
	.sleb128 0
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL1
	.4byte	.LVL2
	.2byte	0x6
	.byte	0x71
	.sleb128 0
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.4byte	.LVL2
	.4byte	.LVL4
	.2byte	0x8
	.byte	0x71
	.sleb128 0
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.byte	0x23
	.uleb128 0x1
	.byte	0x9f
	.4byte	.LVL4
	.4byte	.LVL5
	.2byte	0x6
	.byte	0x71
	.sleb128 0
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL6
	.4byte	.LVL9
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL9
	.4byte	.LVL11
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	.LVL11
	.4byte	.LVL14
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL14
	.4byte	.LFE1
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL6
	.4byte	.LVL9
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL9
	.4byte	.LVL10
	.2byte	0x3
	.byte	0x73
	.sleb128 -1
	.byte	0x9f
	.4byte	.LVL10
	.4byte	.LVL11
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL11
	.4byte	.LVL13
	.2byte	0x7
	.byte	0x73
	.sleb128 0
	.byte	0x20
	.byte	0x72
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.4byte	.LVL13
	.4byte	.LVL14
	.2byte	0x6
	.byte	0x72
	.sleb128 0
	.byte	0x73
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL6
	.4byte	.LVL7
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL7
	.4byte	.LVL9
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL9
	.4byte	.LVL11
	.2byte	0x9
	.byte	0x74
	.sleb128 0
	.byte	0x72
	.sleb128 0
	.byte	0x1c
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.4byte	.LVL11
	.4byte	.LVL12
	.2byte	0x6
	.byte	0x71
	.sleb128 0
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.4byte	.LVL12
	.4byte	.LVL13
	.2byte	0x8
	.byte	0x71
	.sleb128 0
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.byte	0x23
	.uleb128 0x1
	.byte	0x9f
	.4byte	.LVL13
	.4byte	.LVL14
	.2byte	0x6
	.byte	0x71
	.sleb128 0
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL8
	.4byte	.LVL9
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL9
	.4byte	.LVL11
	.2byte	0x9
	.byte	0x75
	.sleb128 0
	.byte	0x72
	.sleb128 0
	.byte	0x1c
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.4byte	.LVL11
	.4byte	.LVL12
	.2byte	0x6
	.byte	0x70
	.sleb128 0
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.4byte	.LVL12
	.4byte	.LVL13
	.2byte	0x8
	.byte	0x70
	.sleb128 0
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.byte	0x23
	.uleb128 0x1
	.byte	0x9f
	.4byte	.LVL13
	.4byte	.LVL14
	.2byte	0x6
	.byte	0x70
	.sleb128 0
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST7:
	.4byte	.LVL15
	.4byte	.LVL16
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL16
	.4byte	.LFE2
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST8:
	.4byte	.LVL17
	.4byte	.LVL18
	.2byte	0x6
	.byte	0x73
	.sleb128 0
	.byte	0x70
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.4byte	.LVL18
	.4byte	.LVL19
	.2byte	0x8
	.byte	0x73
	.sleb128 0
	.byte	0x70
	.sleb128 0
	.byte	0x1c
	.byte	0x23
	.uleb128 0x1
	.byte	0x9f
	.4byte	.LVL19
	.4byte	.LVL20
	.2byte	0x6
	.byte	0x73
	.sleb128 0
	.byte	0x70
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST9:
	.4byte	.LVL21
	.4byte	.LVL23
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL23
	.4byte	.LVL24
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL24
	.4byte	.LVL26
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL26
	.4byte	.LFE3
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST10:
	.4byte	.LVL21
	.4byte	.LVL22
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL22
	.4byte	.LVL23
	.2byte	0x6
	.byte	0x70
	.sleb128 0
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.4byte	.LVL23
	.4byte	.LVL24
	.2byte	0x7
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.4byte	.LVL24
	.4byte	.LVL26
	.2byte	0x6
	.byte	0x70
	.sleb128 0
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.4byte	.LVL26
	.4byte	.LFE3
	.2byte	0x7
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST11:
	.4byte	.LVL21
	.4byte	.LVL22
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL22
	.4byte	.LFE3
	.2byte	0x6
	.byte	0x71
	.sleb128 0
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST12:
	.4byte	.LVL21
	.4byte	.LVL22
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL22
	.4byte	.LFE3
	.2byte	0x1
	.byte	0x53
	.4byte	0
	.4byte	0
.LLST13:
	.4byte	.LVL27
	.4byte	.LVL28
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL28
	.4byte	.LVL29
	.2byte	0x8
	.byte	0x70
	.sleb128 0
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.byte	0x23
	.uleb128 0x1
	.byte	0x9f
	.4byte	.LVL29
	.4byte	.LFE4
	.2byte	0x6
	.byte	0x70
	.sleb128 0
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST14:
	.4byte	.LVL27
	.4byte	.LVL28
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL28
	.4byte	.LVL29
	.2byte	0x8
	.byte	0x71
	.sleb128 0
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.byte	0x23
	.uleb128 0x1
	.byte	0x9f
	.4byte	.LVL29
	.4byte	.LFE4
	.2byte	0x6
	.byte	0x71
	.sleb128 0
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST15:
	.4byte	.LVL30
	.4byte	.LVL31
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL31
	.4byte	.LVL32
	.2byte	0x6
	.byte	0x70
	.sleb128 0
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.4byte	.LVL32
	.4byte	.LVL33
	.2byte	0x8
	.byte	0x70
	.sleb128 0
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.byte	0x23
	.uleb128 0x1
	.byte	0x9f
	.4byte	.LVL33
	.4byte	.LVL34
	.2byte	0x6
	.byte	0x70
	.sleb128 0
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST16:
	.4byte	.LVL30
	.4byte	.LVL31
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL31
	.4byte	.LVL32
	.2byte	0x6
	.byte	0x71
	.sleb128 0
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.4byte	.LVL32
	.4byte	.LVL33
	.2byte	0x8
	.byte	0x71
	.sleb128 0
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.byte	0x23
	.uleb128 0x1
	.byte	0x9f
	.4byte	.LVL33
	.4byte	.LVL34
	.2byte	0x6
	.byte	0x71
	.sleb128 0
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST17:
	.4byte	.LVL30
	.4byte	.LVL31
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL31
	.4byte	.LVL33
	.2byte	0x7
	.byte	0x73
	.sleb128 0
	.byte	0x20
	.byte	0x72
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.4byte	.LVL33
	.4byte	.LVL34
	.2byte	0x6
	.byte	0x72
	.sleb128 0
	.byte	0x73
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST18:
	.4byte	.LVL35
	.4byte	.LVL36
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL36
	.4byte	.LVL38
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST19:
	.4byte	.LVL35
	.4byte	.LVL37
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL37
	.4byte	.LFE6
	.2byte	0x1
	.byte	0x51
	.4byte	0
	.4byte	0
.LLST20:
	.4byte	.LVL39
	.4byte	.LVL40
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL40
	.4byte	.LVL42
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST21:
	.4byte	.LVL39
	.4byte	.LVL41
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL41
	.4byte	.LVL43
	.2byte	0x1
	.byte	0x51
	.4byte	0
	.4byte	0
.LLST22:
	.4byte	.LVL44
	.4byte	.LVL45
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL45
	.4byte	.LVL48
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL49
	.4byte	.LVL52
	.2byte	0x1
	.byte	0x53
	.4byte	0
	.4byte	0
.LLST23:
	.4byte	.LVL44
	.4byte	.LVL51
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL51
	.4byte	.LFE8
	.2byte	0x1
	.byte	0x51
	.4byte	0
	.4byte	0
.LLST24:
	.4byte	.LVL44
	.4byte	.LVL46
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL46
	.4byte	.LVL47
	.2byte	0x3
	.byte	0x72
	.sleb128 1
	.byte	0x9f
	.4byte	.LVL47
	.4byte	.LVL52
	.2byte	0x6
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x31
	.byte	0x1c
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST25:
	.4byte	.LVL53
	.4byte	.LVL55
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL55
	.4byte	.LVL60
	.2byte	0x8
	.byte	0x70
	.sleb128 0
	.byte	0x75
	.sleb128 0
	.byte	0x22
	.byte	0x23
	.uleb128 0x1
	.byte	0x9f
	.4byte	.LVL60
	.4byte	.LVL61
	.2byte	0x6
	.byte	0x70
	.sleb128 0
	.byte	0x75
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST26:
	.4byte	.LVL53
	.4byte	.LVL55
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL55
	.4byte	.LVL57
	.2byte	0x6
	.byte	0x71
	.sleb128 0
	.byte	0x75
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.4byte	.LVL57
	.4byte	.LVL60
	.2byte	0x8
	.byte	0x71
	.sleb128 0
	.byte	0x75
	.sleb128 0
	.byte	0x22
	.byte	0x23
	.uleb128 0x1
	.byte	0x9f
	.4byte	.LVL60
	.4byte	.LVL61
	.2byte	0x6
	.byte	0x71
	.sleb128 0
	.byte	0x75
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST27:
	.4byte	.LVL53
	.4byte	.LVL54
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL54
	.4byte	.LVL55
	.2byte	0x3
	.byte	0x72
	.sleb128 1
	.byte	0x9f
	.4byte	.LVL55
	.4byte	.LVL59
	.2byte	0x8
	.byte	0x72
	.sleb128 0
	.byte	0x75
	.sleb128 0
	.byte	0x1c
	.byte	0x23
	.uleb128 0x1
	.byte	0x9f
	.4byte	.LVL59
	.4byte	.LVL60
	.2byte	0x6
	.byte	0x72
	.sleb128 0
	.byte	0x75
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.4byte	.LVL60
	.4byte	.LVL61
	.2byte	0x8
	.byte	0x72
	.sleb128 0
	.byte	0x75
	.sleb128 0
	.byte	0x1c
	.byte	0x23
	.uleb128 0x1
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST28:
	.4byte	.LVL58
	.4byte	.LVL62
	.2byte	0x1
	.byte	0x54
	.4byte	0
	.4byte	0
.LLST29:
	.4byte	.LVL63
	.4byte	.LVL64
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL64
	.4byte	.LFE10
	.2byte	0x1
	.byte	0x53
	.4byte	0
	.4byte	0
.LLST30:
	.4byte	.LVL63
	.4byte	.LVL64
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL65
	.4byte	.LFE10
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST31:
	.4byte	.LVL65
	.4byte	.LVL66
	.2byte	0x3
	.byte	0x72
	.sleb128 1
	.byte	0x9f
	.4byte	.LVL66
	.4byte	.LVL67
	.2byte	0x1
	.byte	0x52
	.4byte	0
	.4byte	0
.LLST32:
	.4byte	.LVL68
	.4byte	.LVL69
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL69
	.4byte	.LVL70
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST33:
	.4byte	.LVL71
	.4byte	.LVL74
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL74
	.4byte	.LVL75
	.2byte	0x6
	.byte	0x71
	.sleb128 0
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.4byte	.LVL75
	.4byte	.LVL76
	.2byte	0x8
	.byte	0x71
	.sleb128 0
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.byte	0x23
	.uleb128 0x1
	.byte	0x9f
	.4byte	.LVL76
	.4byte	.LFE12
	.2byte	0x6
	.byte	0x71
	.sleb128 0
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST34:
	.4byte	.LVL71
	.4byte	.LVL72
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL72
	.4byte	.LVL74
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL74
	.4byte	.LVL76
	.2byte	0x8
	.byte	0x72
	.sleb128 0
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.byte	0x23
	.uleb128 0x1
	.byte	0x9f
	.4byte	.LVL76
	.4byte	.LFE12
	.2byte	0x6
	.byte	0x72
	.sleb128 0
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST35:
	.4byte	.LVL77
	.4byte	.LVL79
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL79
	.4byte	.LVL92
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST36:
	.4byte	.LVL78
	.4byte	.LVL85
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL85
	.4byte	.LFE13
	.2byte	0x1
	.byte	0x53
	.4byte	0
	.4byte	0
.LLST37:
	.4byte	.LVL80
	.4byte	.LVL81
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL81
	.4byte	.LVL82
	.2byte	0x8
	.byte	0x73
	.sleb128 0
	.byte	0x70
	.sleb128 0
	.byte	0x1c
	.byte	0x23
	.uleb128 0x1
	.byte	0x9f
	.4byte	.LVL82
	.4byte	.LVL83
	.2byte	0x6
	.byte	0x73
	.sleb128 0
	.byte	0x70
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.4byte	.LVL83
	.4byte	.LVL89
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL89
	.4byte	.LVL90
	.2byte	0x3
	.byte	0x72
	.sleb128 -1
	.byte	0x9f
	.4byte	.LVL90
	.4byte	.LVL91
	.2byte	0x1
	.byte	0x52
	.4byte	0
	.4byte	0
.LLST38:
	.4byte	.LVL84
	.4byte	.LVL85
	.2byte	0x2
	.byte	0x31
	.byte	0x9f
	.4byte	.LVL85
	.4byte	.LVL88
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL89
	.4byte	.LVL91
	.2byte	0x1
	.byte	0x51
	.4byte	0
	.4byte	0
.LLST39:
	.4byte	.LVL93
	.4byte	.LVL94-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL94-1
	.4byte	.LVL97
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL97
	.4byte	.LFE14
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST40:
	.4byte	.LVL95
	.4byte	.LVL96-1
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST41:
	.4byte	.LVL98
	.4byte	.LVL101
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL101
	.4byte	.LFE15
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST42:
	.4byte	.LVL98
	.4byte	.LVL101
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL101
	.4byte	.LVL103
	.2byte	0x9
	.byte	0x75
	.sleb128 0
	.byte	0x73
	.sleb128 0
	.byte	0x1c
	.byte	0x72
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST43:
	.4byte	.LVL99
	.4byte	.LVL104
	.2byte	0x1
	.byte	0x53
	.4byte	0
	.4byte	0
.LLST44:
	.4byte	.LVL101
	.4byte	.LVL102
	.2byte	0xc
	.byte	0x73
	.sleb128 0
	.byte	0x75
	.sleb128 0
	.byte	0x1c
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x22
	.byte	0x23
	.uleb128 0x1
	.byte	0x9f
	.4byte	.LVL102
	.4byte	.LVL103
	.2byte	0xa
	.byte	0x73
	.sleb128 0
	.byte	0x75
	.sleb128 0
	.byte	0x1c
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x22
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST45:
	.4byte	.LVL105
	.4byte	.LVL112
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL112
	.4byte	.LFE16
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST46:
	.4byte	.LVL105
	.4byte	.LVL106
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL106
	.4byte	.LVL109
	.2byte	0x6
	.byte	0x73
	.sleb128 0
	.byte	0x70
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.4byte	.LVL109
	.4byte	.LVL110
	.2byte	0x8
	.byte	0x73
	.sleb128 0
	.byte	0x70
	.sleb128 0
	.byte	0x1c
	.byte	0x23
	.uleb128 0x1
	.byte	0x9f
	.4byte	.LVL110
	.4byte	.LVL112
	.2byte	0x6
	.byte	0x73
	.sleb128 0
	.byte	0x70
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.4byte	.LVL112
	.4byte	.LFE16
	.2byte	0x7
	.byte	0x73
	.sleb128 0
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x1c
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST47:
	.4byte	.LVL107
	.4byte	.LVL108
	.2byte	0x6
	.byte	0x72
	.sleb128 0
	.byte	0x71
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.4byte	.LVL108
	.4byte	.LVL109
	.2byte	0x7
	.byte	0x71
	.sleb128 0
	.byte	0x20
	.byte	0x72
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.4byte	.LVL109
	.4byte	.LVL111
	.2byte	0x6
	.byte	0x72
	.sleb128 0
	.byte	0x71
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.4byte	0
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x9c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.4byte	.LFB11
	.4byte	.LFE11-.LFB11
	.4byte	.LFB12
	.4byte	.LFE12-.LFB12
	.4byte	.LFB13
	.4byte	.LFE13-.LFB13
	.4byte	.LFB14
	.4byte	.LFE14-.LFB14
	.4byte	.LFB15
	.4byte	.LFE15-.LFB15
	.4byte	.LFB16
	.4byte	.LFE16-.LFB16
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LBB6
	.4byte	.LBE6
	.4byte	.LBB7
	.4byte	.LBE7
	.4byte	0
	.4byte	0
	.4byte	.LFB0
	.4byte	.LFE0
	.4byte	.LFB1
	.4byte	.LFE1
	.4byte	.LFB2
	.4byte	.LFE2
	.4byte	.LFB3
	.4byte	.LFE3
	.4byte	.LFB4
	.4byte	.LFE4
	.4byte	.LFB5
	.4byte	.LFE5
	.4byte	.LFB6
	.4byte	.LFE6
	.4byte	.LFB7
	.4byte	.LFE7
	.4byte	.LFB8
	.4byte	.LFE8
	.4byte	.LFB9
	.4byte	.LFE9
	.4byte	.LFB10
	.4byte	.LFE10
	.4byte	.LFB11
	.4byte	.LFE11
	.4byte	.LFB12
	.4byte	.LFE12
	.4byte	.LFB13
	.4byte	.LFE13
	.4byte	.LFB14
	.4byte	.LFE14
	.4byte	.LFB15
	.4byte	.LFE15
	.4byte	.LFB16
	.4byte	.LFE16
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF22:
	.ascii	"strncpy\000"
.LASF17:
	.ascii	"svdst\000"
.LASF21:
	.ascii	"dest\000"
.LASF32:
	.ascii	"multiplier\000"
.LASF2:
	.ascii	"short int\000"
.LASF40:
	.ascii	"size_t\000"
.LASF41:
	.ascii	"malloc\000"
.LASF9:
	.ascii	"sizetype\000"
.LASF13:
	.ascii	"memcpy\000"
.LASF25:
	.ascii	"strncmp\000"
.LASF16:
	.ascii	"vsrc\000"
.LASF39:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4_enc28j60/cross"
	.ascii	"works\000"
.LASF19:
	.ascii	"memcmp\000"
.LASF5:
	.ascii	"long long int\000"
.LASF15:
	.ascii	"vdst\000"
.LASF18:
	.ascii	"memset\000"
.LASF7:
	.ascii	"long int\000"
.LASF34:
	.ascii	"other\000"
.LASF12:
	.ascii	"p_src\000"
.LASF14:
	.ascii	"memmove\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF30:
	.ascii	"atoi\000"
.LASF28:
	.ascii	"strchr\000"
.LASF0:
	.ascii	"signed char\000"
.LASF11:
	.ascii	"p_dst\000"
.LASF6:
	.ascii	"long long unsigned int\000"
.LASF4:
	.ascii	"unsigned int\000"
.LASF36:
	.ascii	"strcspn\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF8:
	.ascii	"char\000"
.LASF29:
	.ascii	"strcat\000"
.LASF27:
	.ascii	"strlen\000"
.LASF26:
	.ascii	"strncasecmp\000"
.LASF20:
	.ascii	"strcpy\000"
.LASF37:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -std=gnu99 -Os -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF38:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4_enc28j60/cross"
	.ascii	"works/../../../../src/lib/string.c\000"
.LASF10:
	.ascii	"size\000"
.LASF23:
	.ascii	"strcmp\000"
.LASF33:
	.ascii	"strdup\000"
.LASF31:
	.ascii	"digit\000"
.LASF24:
	.ascii	"strcasecmp\000"
.LASF35:
	.ascii	"strncat\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
