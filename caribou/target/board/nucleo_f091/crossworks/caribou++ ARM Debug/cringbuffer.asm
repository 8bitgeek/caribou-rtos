	.syntax unified
	.cpu cortex-m0plus
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
	.file	"cringbuffer.cpp"
	.text
.Ltext0:
	.section	.text._ZN7CARIBOU10CByteArray4sizeEv,"axG",%progbits,_ZN7CARIBOU10CByteArray4sizeEv,comdat
	.align	2
	.weak	_ZN7CARIBOU10CByteArray4sizeEv
	.code	16
	.thumb_func
	.type	_ZN7CARIBOU10CByteArray4sizeEv, %function
_ZN7CARIBOU10CByteArray4sizeEv:
.LFB0:
	.file 1 "../../../../../caribou++/include/caribou++/cbytearray.h"
	.loc 1 54 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI0:
	sub	sp, sp, #8
.LCFI1:
	add	r7, sp, #0
.LCFI2:
	str	r0, [r7, #4]
	.loc 1 54 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE0:
	.size	_ZN7CARIBOU10CByteArray4sizeEv, .-_ZN7CARIBOU10CByteArray4sizeEv
	.section	.text._ZN7CARIBOU10CByteArray2atEj,"axG",%progbits,_ZN7CARIBOU10CByteArray2atEj,comdat
	.align	2
	.weak	_ZN7CARIBOU10CByteArray2atEj
	.code	16
	.thumb_func
	.type	_ZN7CARIBOU10CByteArray2atEj, %function
_ZN7CARIBOU10CByteArray2atEj:
.LFB1:
	.loc 1 55 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI3:
	sub	sp, sp, #8
.LCFI4:
	add	r7, sp, #0
.LCFI5:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 55 0
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #8]
	ldr	r3, [r7]
	adds	r3, r2, r3
	ldrb	r3, [r3]
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE1:
	.size	_ZN7CARIBOU10CByteArray2atEj, .-_ZN7CARIBOU10CByteArray2atEj
	.section	.text._ZN7CARIBOU10CByteArray4dataEv,"axG",%progbits,_ZN7CARIBOU10CByteArray4dataEv,comdat
	.align	2
	.weak	_ZN7CARIBOU10CByteArray4dataEv
	.code	16
	.thumb_func
	.type	_ZN7CARIBOU10CByteArray4dataEv, %function
_ZN7CARIBOU10CByteArray4dataEv:
.LFB2:
	.loc 1 56 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI6:
	sub	sp, sp, #8
.LCFI7:
	add	r7, sp, #0
.LCFI8:
	str	r0, [r7, #4]
	.loc 1 56 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #8]
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE2:
	.size	_ZN7CARIBOU10CByteArray4dataEv, .-_ZN7CARIBOU10CByteArray4dataEv
	.section	.text._ZN7CARIBOU10CByteArray6isNullEv,"axG",%progbits,_ZN7CARIBOU10CByteArray6isNullEv,comdat
	.align	2
	.weak	_ZN7CARIBOU10CByteArray6isNullEv
	.code	16
	.thumb_func
	.type	_ZN7CARIBOU10CByteArray6isNullEv, %function
_ZN7CARIBOU10CByteArray6isNullEv:
.LFB4:
	.loc 1 59 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI9:
	sub	sp, sp, #8
.LCFI10:
	add	r7, sp, #0
.LCFI11:
	str	r0, [r7, #4]
	.loc 1 59 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #8]
	rsbs	r2, r3, #0
	adcs	r3, r3, r2
	uxtb	r3, r3
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE4:
	.size	_ZN7CARIBOU10CByteArray6isNullEv, .-_ZN7CARIBOU10CByteArray6isNullEv
	.section	.text._ZN7CARIBOU10CByteArray7isEmptyEv,"axG",%progbits,_ZN7CARIBOU10CByteArray7isEmptyEv,comdat
	.align	2
	.weak	_ZN7CARIBOU10CByteArray7isEmptyEv
	.code	16
	.thumb_func
	.type	_ZN7CARIBOU10CByteArray7isEmptyEv, %function
_ZN7CARIBOU10CByteArray7isEmptyEv:
.LFB5:
	.loc 1 60 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI12:
	sub	sp, sp, #8
.LCFI13:
	add	r7, sp, #0
.LCFI14:
	str	r0, [r7, #4]
	.loc 1 60 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	adds	r3, r3, #28
	ldr	r3, [r3]
	ldr	r2, [r7, #4]
	movs	r0, r2
	blx	r3
	subs	r3, r0, #0
	bne	.L10
	.loc 1 60 0 is_stmt 0 discriminator 2
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	adds	r3, r3, #20
	ldr	r3, [r3]
	ldr	r2, [r7, #4]
	movs	r0, r2
	blx	r3
	subs	r3, r0, #0
	bne	.L11
.L10:
	.loc 1 60 0 discriminator 3
	movs	r3, #1
	b	.L12
.L11:
	.loc 1 60 0 discriminator 4
	movs	r3, #0
.L12:
	.loc 1 60 0 discriminator 6
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE5:
	.size	_ZN7CARIBOU10CByteArray7isEmptyEv, .-_ZN7CARIBOU10CByteArray7isEmptyEv
	.section	.text._ZN7CARIBOU11CRingBuffer5clearEv,"axG",%progbits,_ZN7CARIBOU11CRingBuffer5clearEv,comdat
	.align	2
	.weak	_ZN7CARIBOU11CRingBuffer5clearEv
	.code	16
	.thumb_func
	.type	_ZN7CARIBOU11CRingBuffer5clearEv, %function
_ZN7CARIBOU11CRingBuffer5clearEv:
.LFB10:
	.file 2 "../../../../../caribou++/include/caribou++/cringbuffer.h"
	.loc 2 35 0 is_stmt 1
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI15:
	sub	sp, sp, #8
.LCFI16:
	add	r7, sp, #0
.LCFI17:
	str	r0, [r7, #4]
	.loc 2 35 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	strh	r2, [r3, #20]
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #16]
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #16]
	ldr	r3, [r7, #4]
	str	r2, [r3, #12]
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE10:
	.size	_ZN7CARIBOU11CRingBuffer5clearEv, .-_ZN7CARIBOU11CRingBuffer5clearEv
	.section	.text._ZN7CARIBOU11CRingBuffer4fullEv,"axG",%progbits,_ZN7CARIBOU11CRingBuffer4fullEv,comdat
	.align	2
	.weak	_ZN7CARIBOU11CRingBuffer4fullEv
	.code	16
	.thumb_func
	.type	_ZN7CARIBOU11CRingBuffer4fullEv, %function
_ZN7CARIBOU11CRingBuffer4fullEv:
.LFB11:
	.loc 2 42 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
.LCFI18:
	sub	sp, sp, #12
.LCFI19:
	add	r7, sp, #0
.LCFI20:
	str	r0, [r7, #4]
	.loc 2 42 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	adds	r3, r3, #20
	ldr	r3, [r3]
	ldr	r2, [r7, #4]
	movs	r0, r2
	blx	r3
	movs	r4, r0
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	_ZN7CARIBOU10CByteArray4sizeEv
	movs	r3, r0
	subs	r2, r3, #1
	movs	r3, #0
	cmp	r4, r2
	adcs	r3, r3, r3
	uxtb	r3, r3
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r7, pc}
.LFE11:
	.size	_ZN7CARIBOU11CRingBuffer4fullEv, .-_ZN7CARIBOU11CRingBuffer4fullEv
	.section	.text._ZN7CARIBOU11CRingBuffer5emptyEv,"axG",%progbits,_ZN7CARIBOU11CRingBuffer5emptyEv,comdat
	.align	2
	.weak	_ZN7CARIBOU11CRingBuffer5emptyEv
	.code	16
	.thumb_func
	.type	_ZN7CARIBOU11CRingBuffer5emptyEv, %function
_ZN7CARIBOU11CRingBuffer5emptyEv:
.LFB13:
	.loc 2 44 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI21:
	sub	sp, sp, #8
.LCFI22:
	add	r7, sp, #0
.LCFI23:
	str	r0, [r7, #4]
	.loc 2 44 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	adds	r3, r3, #20
	ldr	r3, [r3]
	ldr	r2, [r7, #4]
	movs	r0, r2
	blx	r3
	movs	r3, r0
	rsbs	r2, r3, #0
	adcs	r3, r3, r2
	uxtb	r3, r3
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE13:
	.size	_ZN7CARIBOU11CRingBuffer5emptyEv, .-_ZN7CARIBOU11CRingBuffer5emptyEv
	.section	.text._ZN7CARIBOU11CRingBufferC2Ev,"ax",%progbits
	.align	2
	.global	_ZN7CARIBOU11CRingBufferC2Ev
	.code	16
	.thumb_func
	.type	_ZN7CARIBOU11CRingBufferC2Ev, %function
_ZN7CARIBOU11CRingBufferC2Ev:
.LFB16:
	.file 3 "/home/mike/Documents/GitHub/caribou-rtos/caribou/target/board/nucleo_f091/crossworks/../../../../../caribou++/src/cringbuffer.cpp"
	.loc 3 23 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI24:
	sub	sp, sp, #8
.LCFI25:
	add	r7, sp, #0
.LCFI26:
	str	r0, [r7, #4]
.LBB2:
	.loc 3 27 0
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	_ZN7CARIBOU10CByteArrayC2Ev
	ldr	r2, .L21
	ldr	r3, [r7, #4]
	str	r2, [r3]
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #16]
	ldr	r3, [r7, #4]
	movs	r2, #0
	strh	r2, [r3, #20]
.LBE2:
	.loc 3 29 0
	ldr	r3, [r7, #4]
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L22:
	.align	2
.L21:
	.word	_ZTVN7CARIBOU11CRingBufferE+8
.LFE16:
	.size	_ZN7CARIBOU11CRingBufferC2Ev, .-_ZN7CARIBOU11CRingBufferC2Ev
	.global	_ZN7CARIBOU11CRingBufferC1Ev
	.thumb_set _ZN7CARIBOU11CRingBufferC1Ev,_ZN7CARIBOU11CRingBufferC2Ev
	.section	.text._ZN7CARIBOU11CRingBufferD2Ev,"ax",%progbits
	.align	2
	.global	_ZN7CARIBOU11CRingBufferD2Ev
	.code	16
	.thumb_func
	.type	_ZN7CARIBOU11CRingBufferD2Ev, %function
_ZN7CARIBOU11CRingBufferD2Ev:
.LFB19:
	.loc 3 31 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI27:
	sub	sp, sp, #8
.LCFI28:
	add	r7, sp, #0
.LCFI29:
	str	r0, [r7, #4]
.LBB3:
	.loc 3 31 0
	ldr	r2, .L26
	ldr	r3, [r7, #4]
	str	r2, [r3]
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	_ZN7CARIBOU10CByteArrayD2Ev
.LBE3:
	.loc 3 33 0
	movs	r3, #0
	cmp	r3, #0
	beq	.L24
	.loc 3 33 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	_ZdlPv
.L24:
	.loc 3 33 0 discriminator 3
	ldr	r3, [r7, #4]
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L27:
	.align	2
.L26:
	.word	_ZTVN7CARIBOU11CRingBufferE+8
.LFE19:
	.size	_ZN7CARIBOU11CRingBufferD2Ev, .-_ZN7CARIBOU11CRingBufferD2Ev
	.global	_ZN7CARIBOU11CRingBufferD1Ev
	.thumb_set _ZN7CARIBOU11CRingBufferD1Ev,_ZN7CARIBOU11CRingBufferD2Ev
	.section	.text._ZN7CARIBOU11CRingBufferD0Ev,"ax",%progbits
	.align	2
	.global	_ZN7CARIBOU11CRingBufferD0Ev
	.code	16
	.thumb_func
	.type	_ZN7CARIBOU11CRingBufferD0Ev, %function
_ZN7CARIBOU11CRingBufferD0Ev:
.LFB21:
	.loc 3 31 0 is_stmt 1
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI30:
	sub	sp, sp, #8
.LCFI31:
	add	r7, sp, #0
.LCFI32:
	str	r0, [r7, #4]
	.loc 3 33 0
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	_ZN7CARIBOU11CRingBufferD1Ev
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	_ZdlPv
	ldr	r3, [r7, #4]
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE21:
	.size	_ZN7CARIBOU11CRingBufferD0Ev, .-_ZN7CARIBOU11CRingBufferD0Ev
	.section	.text._ZN7CARIBOU11CRingBuffer6resizeEj,"ax",%progbits
	.align	2
	.global	_ZN7CARIBOU11CRingBuffer6resizeEj
	.code	16
	.thumb_func
	.type	_ZN7CARIBOU11CRingBuffer6resizeEj, %function
_ZN7CARIBOU11CRingBuffer6resizeEj:
.LFB22:
	.loc 3 40 0
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r7, lr}
.LCFI33:
	sub	sp, sp, #24
.LCFI34:
	add	r7, sp, #0
.LCFI35:
	str	r0, [r7, #4]
	str	r1, [r7]
.LBB4:
	.loc 3 41 0
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	_ZN7CARIBOU11CRingBuffer5emptyEv
	movs	r3, r0
	rsbs	r2, r3, #0
	adcs	r3, r3, r2
	uxtb	r3, r3
	cmp	r3, #0
	beq	.L31
.LBB5:
	.loc 3 43 0
	movs	r3, #8
	adds	r3, r7, r3
	movs	r0, r3
	bl	_ZN7CARIBOU10CByteArrayC1Ev
.L33:
	.loc 3 44 0
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	_ZN7CARIBOU11CRingBuffer5emptyEv
	movs	r3, r0
	rsbs	r2, r3, #0
	adcs	r3, r3, r2
	uxtb	r3, r3
	cmp	r3, #0
	beq	.L32
	.loc 3 46 0
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	_ZN7CARIBOU11CRingBuffer6removeEv
	movs	r3, r0
	movs	r2, r3
	movs	r3, #8
	adds	r3, r7, r3
	movs	r1, r2
	movs	r0, r3
	bl	_ZN7CARIBOU10CByteArray6appendEc
	.loc 3 44 0
	b	.L33
.L32:
	.loc 3 48 0
	ldr	r3, [r7, #4]
	ldr	r2, [r7]
	movs	r1, r2
	movs	r0, r3
	bl	_ZN7CARIBOU10CByteArray6resizeEj
.LBB6:
	.loc 3 49 0
	movs	r3, #0
	str	r3, [r7, #20]
.L35:
	.loc 3 49 0 is_stmt 0 discriminator 3
	movs	r3, #8
	adds	r3, r7, r3
	movs	r0, r3
	bl	_ZN7CARIBOU10CByteArray4sizeEv
	movs	r2, r0
	ldr	r3, [r7, #20]
	cmp	r3, r2
	sbcs	r3, r3, r3
	rsbs	r3, r3, #0
	uxtb	r3, r3
	cmp	r3, #0
	beq	.L34
	.loc 3 51 0 is_stmt 1 discriminator 2
	ldr	r4, [r7, #4]
	ldr	r5, [r7, #20]
	ldr	r2, [r7, #20]
	movs	r3, #8
	adds	r3, r7, r3
	movs	r1, r2
	movs	r0, r3
	bl	_ZN7CARIBOU10CByteArray2atEj
	movs	r3, r0
	movs	r2, r3
	movs	r1, r5
	movs	r0, r4
	bl	_ZN7CARIBOU10CByteArray3setEjh
	.loc 3 49 0 discriminator 2
	ldr	r3, [r7, #20]
	adds	r3, r3, #1
	str	r3, [r7, #20]
	b	.L35
.L34:
.LBE6:
	.loc 3 53 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #16]
	.loc 3 54 0
	movs	r3, #8
	adds	r3, r7, r3
	movs	r0, r3
	bl	_ZN7CARIBOU10CByteArray4sizeEv
	movs	r2, r0
	ldr	r3, [r7, #4]
	str	r2, [r3, #12]
	.loc 3 43 0
	movs	r3, #8
	adds	r3, r7, r3
	movs	r0, r3
	bl	_ZN7CARIBOU10CByteArrayD1Ev
.LBE5:
	b	.L36
.L31:
	.loc 3 59 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	strh	r2, [r3, #20]
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #16]
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #16]
	ldr	r3, [r7, #4]
	str	r2, [r3, #12]
	.loc 3 60 0
	ldr	r3, [r7, #4]
	ldr	r2, [r7]
	movs	r1, r2
	movs	r0, r3
	bl	_ZN7CARIBOU10CByteArray6resizeEj
.L36:
.LBE4:
	.loc 3 62 0
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	_ZN7CARIBOU10CByteArray4sizeEv
	movs	r3, r0
	.loc 3 63 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #24
	@ sp needed
	pop	{r4, r5, r7, pc}
.LFE22:
	.size	_ZN7CARIBOU11CRingBuffer6resizeEj, .-_ZN7CARIBOU11CRingBuffer6resizeEj
	.section	.text._ZN7CARIBOU11CRingBuffer6insertEh,"ax",%progbits
	.align	2
	.global	_ZN7CARIBOU11CRingBuffer6insertEh
	.code	16
	.thumb_func
	.type	_ZN7CARIBOU11CRingBuffer6insertEh, %function
_ZN7CARIBOU11CRingBuffer6insertEh:
.LFB23:
	.loc 3 70 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
.LCFI36:
	sub	sp, sp, #12
.LCFI37:
	add	r7, sp, #0
.LCFI38:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #3
	strb	r2, [r3]
	.loc 3 71 0
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	_ZN7CARIBOU11CRingBuffer4fullEv
	movs	r3, r0
	rsbs	r2, r3, #0
	adcs	r3, r3, r2
	uxtb	r3, r3
	cmp	r3, #0
	beq	.L39
	.loc 3 73 0
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	_ZN7CARIBOU10CByteArray4dataEv
	movs	r2, r0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #12]
	adds	r3, r2, r3
	adds	r2, r7, #3
	ldrb	r2, [r2]
	strb	r2, [r3]
	.loc 3 74 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #12]
	adds	r2, r3, #1
	ldr	r3, [r7, #4]
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r4, [r3, #12]
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	_ZN7CARIBOU10CByteArray4sizeEv
	movs	r2, r0
	movs	r3, #0
	cmp	r4, r2
	adcs	r3, r3, r3
	uxtb	r3, r3
	cmp	r3, #0
	beq	.L40
	.loc 3 76 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #12]
.L40:
	.loc 3 78 0
	movs	r3, #1
	b	.L41
.L39:
	.loc 3 80 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #20]
	adds	r3, r3, #1
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #20]
	.loc 3 81 0
	movs	r3, #0
.L41:
	.loc 3 82 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r7, pc}
.LFE23:
	.size	_ZN7CARIBOU11CRingBuffer6insertEh, .-_ZN7CARIBOU11CRingBuffer6insertEh
	.section	.text._ZN7CARIBOU11CRingBuffer6insertERNS_10CByteArrayE,"ax",%progbits
	.align	2
	.global	_ZN7CARIBOU11CRingBuffer6insertERNS_10CByteArrayE
	.code	16
	.thumb_func
	.type	_ZN7CARIBOU11CRingBuffer6insertERNS_10CByteArrayE, %function
_ZN7CARIBOU11CRingBuffer6insertERNS_10CByteArrayE:
.LFB24:
	.loc 3 89 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
.LCFI39:
	sub	sp, sp, #12
.LCFI40:
	add	r7, sp, #0
.LCFI41:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 3 90 0
	movs	r5, #0
	.loc 3 91 0
	ldr	r3, [r7]
	ldr	r3, [r3]
	adds	r3, r3, #20
	ldr	r3, [r3]
	ldr	r2, [r7]
	movs	r0, r2
	blx	r3
	movs	r6, r0
.LBB7:
	.loc 3 92 0
	movs	r4, #0
.L44:
	.loc 3 92 0 is_stmt 0 discriminator 3
	movs	r3, r4
	cmp	r3, r6
	bcs	.L43
	.loc 3 94 0 is_stmt 1 discriminator 2
	movs	r2, r4
	ldr	r3, [r7]
	movs	r1, r2
	movs	r0, r3
	bl	_ZN7CARIBOU10CByteArray2atEj
	movs	r3, r0
	movs	r2, r3
	ldr	r3, [r7, #4]
	movs	r1, r2
	movs	r0, r3
	bl	_ZN7CARIBOU11CRingBuffer6insertEh
	movs	r3, r0
	adds	r5, r5, r3
	.loc 3 92 0 discriminator 2
	adds	r4, r4, #1
	b	.L44
.L43:
.LBE7:
	.loc 3 96 0
	movs	r3, r5
	.loc 3 97 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.LFE24:
	.size	_ZN7CARIBOU11CRingBuffer6insertERNS_10CByteArrayE, .-_ZN7CARIBOU11CRingBuffer6insertERNS_10CByteArrayE
	.section	.text._ZN7CARIBOU11CRingBuffer4peekEv,"ax",%progbits
	.align	2
	.global	_ZN7CARIBOU11CRingBuffer4peekEv
	.code	16
	.thumb_func
	.type	_ZN7CARIBOU11CRingBuffer4peekEv, %function
_ZN7CARIBOU11CRingBuffer4peekEv:
.LFB25:
	.loc 3 104 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI42:
	sub	sp, sp, #16
.LCFI43:
	add	r7, sp, #0
.LCFI44:
	str	r0, [r7, #4]
	.loc 3 106 0
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	_ZN7CARIBOU10CByteArray4dataEv
	movs	r2, r0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #16]
	adds	r2, r2, r3
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r2, [r2]
	strb	r2, [r3]
	.loc 3 107 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 3 108 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE25:
	.size	_ZN7CARIBOU11CRingBuffer4peekEv, .-_ZN7CARIBOU11CRingBuffer4peekEv
	.section	.text._ZN7CARIBOU11CRingBuffer6removeEv,"ax",%progbits
	.align	2
	.global	_ZN7CARIBOU11CRingBuffer6removeEv
	.code	16
	.thumb_func
	.type	_ZN7CARIBOU11CRingBuffer6removeEv, %function
_ZN7CARIBOU11CRingBuffer6removeEv:
.LFB26:
	.loc 3 115 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
.LCFI45:
	sub	sp, sp, #20
.LCFI46:
	add	r7, sp, #0
.LCFI47:
	str	r0, [r7, #4]
.LBB8:
	.loc 3 116 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	adds	r3, r3, #20
	ldr	r3, [r3]
	ldr	r2, [r7, #4]
	movs	r0, r2
	blx	r3
	movs	r3, r0
	subs	r2, r3, #1
	sbcs	r3, r3, r2
	uxtb	r3, r3
	cmp	r3, #0
	beq	.L49
.LBB9:
	.loc 3 119 0
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	_ZN7CARIBOU10CByteArray4dataEv
	movs	r2, r0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #16]
	adds	r2, r2, r3
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r2, [r2]
	strb	r2, [r3]
	.loc 3 120 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #16]
	adds	r2, r3, #1
	ldr	r3, [r7, #4]
	str	r2, [r3, #16]
	ldr	r3, [r7, #4]
	ldr	r4, [r3, #16]
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	_ZN7CARIBOU10CByteArray4sizeEv
	movs	r2, r0
	movs	r3, #0
	cmp	r4, r2
	adcs	r3, r3, r3
	uxtb	r3, r3
	cmp	r3, #0
	beq	.L50
	.loc 3 122 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #16]
.L50:
	.loc 3 124 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	b	.L51
.L49:
.LBE9:
.LBE8:
	.loc 3 126 0
	movs	r3, #0
.L51:
	.loc 3 127 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r7, pc}
.LFE26:
	.size	_ZN7CARIBOU11CRingBuffer6removeEv, .-_ZN7CARIBOU11CRingBuffer6removeEv
	.section	.text._ZN7CARIBOU11CRingBuffer6removeEh,"ax",%progbits
	.align	2
	.global	_ZN7CARIBOU11CRingBuffer6removeEh
	.code	16
	.thumb_func
	.type	_ZN7CARIBOU11CRingBuffer6removeEh, %function
_ZN7CARIBOU11CRingBuffer6removeEh:
.LFB27:
	.loc 3 134 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
.LCFI48:
	sub	sp, sp, #20
.LCFI49:
	add	r7, sp, #0
.LCFI50:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #3
	strb	r2, [r3]
	.loc 3 135 0
	movs	r3, #15
	adds	r4, r7, r3
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	_ZN7CARIBOU11CRingBuffer6removeEv
	movs	r3, r0
	strb	r3, [r4]
	.loc 3 136 0
	adds	r3, r7, #3
	ldrb	r2, [r3]
	ldr	r3, [r7, #4]
	movs	r1, r2
	movs	r0, r3
	bl	_ZN7CARIBOU11CRingBuffer6insertEh
	.loc 3 137 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 3 138 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r7, pc}
.LFE27:
	.size	_ZN7CARIBOU11CRingBuffer6removeEh, .-_ZN7CARIBOU11CRingBuffer6removeEh
	.section	.text._ZN7CARIBOU11CRingBuffer6lengthEv,"ax",%progbits
	.align	2
	.global	_ZN7CARIBOU11CRingBuffer6lengthEv
	.code	16
	.thumb_func
	.type	_ZN7CARIBOU11CRingBuffer6lengthEv, %function
_ZN7CARIBOU11CRingBuffer6lengthEv:
.LFB28:
	.loc 3 145 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI51:
	sub	sp, sp, #8
.LCFI52:
	add	r7, sp, #0
.LCFI53:
	str	r0, [r7, #4]
	.loc 3 146 0
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bls	.L55
	.loc 3 148 0
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #16]
	subs	r3, r2, r3
	b	.L56
.L55:
	.loc 3 150 0
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bcs	.L57
	.loc 3 152 0
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	_ZN7CARIBOU10CByteArray4sizeEv
	movs	r2, r0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #16]
	subs	r2, r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #12]
	adds	r3, r2, r3
	b	.L56
.L57:
	.loc 3 154 0
	movs	r3, #0
.L56:
	.loc 3 155 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE28:
	.size	_ZN7CARIBOU11CRingBuffer6lengthEv, .-_ZN7CARIBOU11CRingBuffer6lengthEv
	.section	.text._ZN7CARIBOU11CRingBuffer11toByteArrayEv,"ax",%progbits
	.align	2
	.global	_ZN7CARIBOU11CRingBuffer11toByteArrayEv
	.code	16
	.thumb_func
	.type	_ZN7CARIBOU11CRingBuffer11toByteArrayEv, %function
_ZN7CARIBOU11CRingBuffer11toByteArrayEv:
.LFB29:
	.loc 3 162 0
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI54:
	sub	sp, sp, #24
.LCFI55:
	add	r7, sp, #0
.LCFI56:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 3 163 0
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	_ZN7CARIBOU10CByteArrayC1Ev
	.loc 3 164 0
	ldr	r3, [r7]
	ldr	r3, [r3]
	adds	r3, r3, #20
	ldr	r3, [r3]
	ldr	r2, [r7]
	movs	r0, r2
	blx	r3
	movs	r3, r0
	str	r3, [r7, #12]
	.loc 3 165 0
	movs	r3, #0
	str	r3, [r7, #20]
	.loc 3 166 0
	ldr	r3, [r7]
	ldr	r3, [r3, #16]
	str	r3, [r7, #16]
.L61:
	.loc 3 167 0
	ldr	r2, [r7, #20]
	ldr	r3, [r7, #12]
	cmp	r2, r3
	bge	.L63
	.loc 3 169 0
	ldr	r3, [r7]
	movs	r0, r3
	bl	_ZN7CARIBOU10CByteArray4sizeEv
	movs	r1, r0
	ldr	r2, [r7, #16]
	movs	r3, #0
	cmp	r2, r1
	adcs	r3, r3, r3
	uxtb	r3, r3
	cmp	r3, #0
	beq	.L60
	.loc 3 170 0
	movs	r3, #0
	str	r3, [r7, #16]
.L60:
	.loc 3 171 0
	ldr	r3, [r7]
	movs	r0, r3
	bl	_ZN7CARIBOU10CByteArray4dataEv
	movs	r1, r0
	ldr	r3, [r7, #16]
	adds	r2, r3, #1
	str	r2, [r7, #16]
	adds	r3, r1, r3
	ldrb	r2, [r3]
	ldr	r3, [r7, #4]
	movs	r1, r2
	movs	r0, r3
	bl	_ZN7CARIBOU10CByteArray6appendEc
	.loc 3 172 0
	ldr	r3, [r7, #20]
	adds	r3, r3, #1
	str	r3, [r7, #20]
	.loc 3 167 0
	b	.L61
.L63:
	.loc 3 174 0
	nop
	.loc 3 175 0
	ldr	r0, [r7, #4]
	mov	sp, r7
	add	sp, sp, #24
	@ sp needed
	pop	{r7, pc}
.LFE29:
	.size	_ZN7CARIBOU11CRingBuffer11toByteArrayEv, .-_ZN7CARIBOU11CRingBuffer11toByteArrayEv
	.global	_ZTVN7CARIBOU11CRingBufferE
	.section	.rodata._ZTVN7CARIBOU11CRingBufferE,"a",%progbits
	.align	2
	.type	_ZTVN7CARIBOU11CRingBufferE, %object
	.size	_ZTVN7CARIBOU11CRingBufferE, 44
_ZTVN7CARIBOU11CRingBufferE:
	.word	0
	.word	0
	.word	_ZN7CARIBOU11CRingBufferD1Ev
	.word	_ZN7CARIBOU11CRingBufferD0Ev
	.word	_ZN7CARIBOU11CRingBuffer5clearEv
	.word	_ZN7CARIBOU11CRingBuffer6resizeEj
	.word	_ZN7CARIBOU10CByteArray4takeEj
	.word	_ZN7CARIBOU11CRingBuffer6lengthEv
	.word	_ZN7CARIBOU10CByteArray4findEci
	.word	_ZN7CARIBOU10CByteArray6isNullEv
	.word	_ZN7CARIBOU10CByteArray7isEmptyEv
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
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI1-.LCFI0
	.byte	0xe
	.uleb128 0x10
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
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.byte	0x4
	.4byte	.LCFI3-.LFB1
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
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.byte	0x4
	.4byte	.LCFI6-.LFB2
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
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.byte	0x4
	.4byte	.LCFI9-.LFB4
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
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.byte	0x4
	.4byte	.LCFI12-.LFB5
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
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.byte	0x4
	.4byte	.LCFI15-.LFB10
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
	.4byte	.LFB11
	.4byte	.LFE11-.LFB11
	.byte	0x4
	.4byte	.LCFI18-.LFB11
	.byte	0xe
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
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
	.4byte	.LFB13
	.4byte	.LFE13-.LFB13
	.byte	0x4
	.4byte	.LCFI21-.LFB13
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
	.4byte	.LFB16
	.4byte	.LFE16-.LFB16
	.byte	0x4
	.4byte	.LCFI24-.LFB16
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
	.4byte	.LFB19
	.4byte	.LFE19-.LFB19
	.byte	0x4
	.4byte	.LCFI27-.LFB19
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI28-.LCFI27
	.byte	0xe
	.uleb128 0x10
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
	.4byte	.LFB21
	.4byte	.LFE21-.LFB21
	.byte	0x4
	.4byte	.LCFI30-.LFB21
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI31-.LCFI30
	.byte	0xe
	.uleb128 0x10
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
	.4byte	.LFB22
	.4byte	.LFE22-.LFB22
	.byte	0x4
	.4byte	.LCFI33-.LFB22
	.byte	0xe
	.uleb128 0x10
	.byte	0x84
	.uleb128 0x4
	.byte	0x85
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI34-.LCFI33
	.byte	0xe
	.uleb128 0x28
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
	.4byte	.LFB23
	.4byte	.LFE23-.LFB23
	.byte	0x4
	.4byte	.LCFI36-.LFB23
	.byte	0xe
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
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
	.4byte	.LFB24
	.4byte	.LFE24-.LFB24
	.byte	0x4
	.4byte	.LCFI39-.LFB24
	.byte	0xe
	.uleb128 0x14
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
	.4byte	.LCFI40-.LCFI39
	.byte	0xe
	.uleb128 0x20
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
	.4byte	.LFB25
	.4byte	.LFE25-.LFB25
	.byte	0x4
	.4byte	.LCFI42-.LFB25
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
	.4byte	.LFB26
	.4byte	.LFE26-.LFB26
	.byte	0x4
	.4byte	.LCFI45-.LFB26
	.byte	0xe
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI46-.LCFI45
	.byte	0xe
	.uleb128 0x20
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
	.4byte	.LFB27
	.4byte	.LFE27-.LFB27
	.byte	0x4
	.4byte	.LCFI48-.LFB27
	.byte	0xe
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI49-.LCFI48
	.byte	0xe
	.uleb128 0x20
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
	.4byte	.LFB28
	.4byte	.LFE28-.LFB28
	.byte	0x4
	.4byte	.LCFI51-.LFB28
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI52-.LCFI51
	.byte	0xe
	.uleb128 0x10
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
	.4byte	.LFB29
	.4byte	.LFE29-.LFB29
	.byte	0x4
	.4byte	.LCFI54-.LFB29
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
	.text
.Letext0:
	.file 4 "/usr/share/crossworks_for_arm_3.7/include/stdint.h"
	.file 5 "/usr/share/crossworks_for_arm_3.7/include/stddef.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x7c0
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF533
	.byte	0x4
	.4byte	.LASF534
	.4byte	.LASF535
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.4byte	.Ldebug_line0
	.4byte	.Ldebug_macro0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF473
	.uleb128 0x3
	.4byte	.LASF476
	.byte	0x4
	.byte	0xf
	.4byte	0x3b
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF474
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF475
	.uleb128 0x3
	.4byte	.LASF477
	.byte	0x4
	.byte	0x15
	.4byte	0x54
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF478
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF479
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF480
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF481
	.uleb128 0x5
	.byte	0x4
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF482
	.uleb128 0x6
	.byte	0x4
	.4byte	0x86
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF483
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF484
	.uleb128 0x3
	.4byte	.LASF485
	.byte	0x5
	.byte	0x16
	.4byte	0x62
	.uleb128 0x7
	.4byte	.LASF536
	.byte	0x1
	.byte	0x17
	.4byte	0x3ad
	.uleb128 0x8
	.4byte	.LASF493
	.byte	0x18
	.byte	0x2
	.byte	0x1c
	.4byte	0x2f7
	.4byte	0x2f7
	.uleb128 0x9
	.4byte	0x2f7
	.byte	0
	.byte	0x1
	.uleb128 0xa
	.4byte	.LASF486
	.byte	0x2
	.byte	0x31
	.4byte	0x94
	.byte	0xc
	.uleb128 0xa
	.4byte	.LASF487
	.byte	0x2
	.byte	0x32
	.4byte	0x94
	.byte	0x10
	.uleb128 0xa
	.4byte	.LASF488
	.byte	0x2
	.byte	0x33
	.4byte	0x49
	.byte	0x14
	.uleb128 0xb
	.4byte	.LASF493
	.4byte	.LASF537
	.4byte	0x3ad
	.byte	0x1
	.4byte	0xfb
	.4byte	0x106
	.uleb128 0xc
	.4byte	0x3ad
	.uleb128 0xd
	.4byte	0x3b3
	.byte	0
	.uleb128 0xe
	.4byte	.LASF493
	.byte	0x3
	.byte	0x17
	.4byte	.LASF495
	.4byte	0x3ad
	.byte	0x1
	.4byte	0x11e
	.4byte	0x124
	.uleb128 0xc
	.4byte	0x3ad
	.byte	0
	.uleb128 0xf
	.4byte	.LASF489
	.byte	0x3
	.byte	0x1f
	.4byte	.LASF491
	.4byte	0x77
	.byte	0x1
	.4byte	0xaa
	.byte	0x1
	.4byte	0x141
	.4byte	0x14c
	.uleb128 0xc
	.4byte	0x3ad
	.uleb128 0xc
	.4byte	0x5b
	.byte	0
	.uleb128 0x10
	.4byte	.LASF503
	.byte	0x3
	.byte	0x27
	.4byte	.LASF505
	.4byte	0x94
	.byte	0x1
	.uleb128 0x2
	.byte	0x10
	.uleb128 0x3
	.4byte	0xaa
	.byte	0x1
	.4byte	0x16c
	.4byte	0x177
	.uleb128 0xc
	.4byte	0x3ad
	.uleb128 0xd
	.4byte	0x94
	.byte	0
	.uleb128 0x11
	.4byte	.LASF490
	.byte	0x2
	.byte	0x23
	.4byte	.LASF492
	.byte	0x1
	.uleb128 0x2
	.byte	0x10
	.uleb128 0x2
	.4byte	0xaa
	.byte	0x1
	.4byte	0x193
	.4byte	0x199
	.uleb128 0xc
	.4byte	0x3ad
	.byte	0
	.uleb128 0xe
	.4byte	.LASF494
	.byte	0x3
	.byte	0x45
	.4byte	.LASF496
	.4byte	0x94
	.byte	0x1
	.4byte	0x1b1
	.4byte	0x1bc
	.uleb128 0xc
	.4byte	0x3ad
	.uleb128 0xd
	.4byte	0x30
	.byte	0
	.uleb128 0xe
	.4byte	.LASF494
	.byte	0x3
	.byte	0x58
	.4byte	.LASF497
	.4byte	0x94
	.byte	0x1
	.4byte	0x1d4
	.4byte	0x1df
	.uleb128 0xc
	.4byte	0x3ad
	.uleb128 0xd
	.4byte	0x3b9
	.byte	0
	.uleb128 0xe
	.4byte	.LASF498
	.byte	0x3
	.byte	0x67
	.4byte	.LASF499
	.4byte	0x30
	.byte	0x1
	.4byte	0x1f7
	.4byte	0x1fd
	.uleb128 0xc
	.4byte	0x3ad
	.byte	0
	.uleb128 0xe
	.4byte	.LASF500
	.byte	0x3
	.byte	0x72
	.4byte	.LASF501
	.4byte	0x30
	.byte	0x1
	.4byte	0x215
	.4byte	0x21b
	.uleb128 0xc
	.4byte	0x3ad
	.byte	0
	.uleb128 0xe
	.4byte	.LASF500
	.byte	0x3
	.byte	0x85
	.4byte	.LASF502
	.4byte	0x30
	.byte	0x1
	.4byte	0x233
	.4byte	0x23e
	.uleb128 0xc
	.4byte	0x3ad
	.uleb128 0xd
	.4byte	0x30
	.byte	0
	.uleb128 0x10
	.4byte	.LASF504
	.byte	0x3
	.byte	0x90
	.4byte	.LASF506
	.4byte	0x94
	.byte	0x1
	.uleb128 0x2
	.byte	0x10
	.uleb128 0x5
	.4byte	0xaa
	.byte	0x1
	.4byte	0x25e
	.4byte	0x264
	.uleb128 0xc
	.4byte	0x3ad
	.byte	0
	.uleb128 0xe
	.4byte	.LASF507
	.byte	0x2
	.byte	0x2a
	.4byte	.LASF508
	.4byte	0x86
	.byte	0x1
	.4byte	0x27c
	.4byte	0x282
	.uleb128 0xc
	.4byte	0x3ad
	.byte	0
	.uleb128 0xe
	.4byte	.LASF509
	.byte	0x2
	.byte	0x2b
	.4byte	.LASF510
	.4byte	0x49
	.byte	0x1
	.4byte	0x29a
	.4byte	0x2a0
	.uleb128 0xc
	.4byte	0x3ad
	.byte	0
	.uleb128 0xe
	.4byte	.LASF511
	.byte	0x2
	.byte	0x2c
	.4byte	.LASF512
	.4byte	0x86
	.byte	0x1
	.4byte	0x2b8
	.4byte	0x2be
	.uleb128 0xc
	.4byte	0x3ad
	.byte	0
	.uleb128 0xe
	.4byte	.LASF513
	.byte	0x2
	.byte	0x2d
	.4byte	.LASF514
	.4byte	0x49
	.byte	0x1
	.4byte	0x2d6
	.4byte	0x2dc
	.uleb128 0xc
	.4byte	0x3ad
	.byte	0
	.uleb128 0x12
	.4byte	.LASF515
	.byte	0x3
	.byte	0xa1
	.4byte	.LASF538
	.4byte	0x2f7
	.byte	0x1
	.4byte	0x2f0
	.uleb128 0xc
	.4byte	0x3ad
	.byte	0
	.byte	0
	.uleb128 0x13
	.4byte	.LASF539
	.4byte	0x3a7
	.uleb128 0xe
	.4byte	.LASF516
	.byte	0x1
	.byte	0x36
	.4byte	.LASF517
	.4byte	0x94
	.byte	0x1
	.4byte	0x318
	.4byte	0x31e
	.uleb128 0xc
	.4byte	0x3bf
	.byte	0
	.uleb128 0x14
	.ascii	"at\000"
	.byte	0x1
	.byte	0x37
	.4byte	.LASF540
	.4byte	0x86
	.byte	0x1
	.4byte	0x335
	.4byte	0x340
	.uleb128 0xc
	.4byte	0x3bf
	.uleb128 0xd
	.4byte	0x94
	.byte	0
	.uleb128 0xe
	.4byte	.LASF518
	.byte	0x1
	.byte	0x38
	.4byte	.LASF519
	.4byte	0x80
	.byte	0x1
	.4byte	0x358
	.4byte	0x35e
	.uleb128 0xc
	.4byte	0x3bf
	.byte	0
	.uleb128 0x10
	.4byte	.LASF520
	.byte	0x1
	.byte	0x3b
	.4byte	.LASF521
	.4byte	0x86
	.byte	0x1
	.uleb128 0x2
	.byte	0x10
	.uleb128 0x7
	.4byte	0x2f7
	.byte	0x1
	.4byte	0x37e
	.4byte	0x384
	.uleb128 0xc
	.4byte	0x3bf
	.byte	0
	.uleb128 0x15
	.4byte	.LASF522
	.byte	0x1
	.byte	0x3c
	.4byte	.LASF523
	.4byte	0x86
	.byte	0x1
	.uleb128 0x2
	.byte	0x10
	.uleb128 0x8
	.4byte	0x2f7
	.byte	0x1
	.4byte	0x3a0
	.uleb128 0xc
	.4byte	0x3bf
	.byte	0
	.byte	0
	.uleb128 0x16
	.4byte	0xaa
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0xaa
	.uleb128 0x17
	.byte	0x4
	.4byte	0x3a7
	.uleb128 0x17
	.byte	0x4
	.4byte	0x2f7
	.uleb128 0x6
	.byte	0x4
	.4byte	0x2f7
	.uleb128 0x18
	.4byte	0x300
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3dc
	.4byte	0x3e9
	.uleb128 0x19
	.4byte	.LASF524
	.4byte	0x3e9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x16
	.4byte	0x3bf
	.uleb128 0x18
	.4byte	0x31e
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x405
	.4byte	0x420
	.uleb128 0x19
	.4byte	.LASF524
	.4byte	0x3e9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1a
	.4byte	.LASF529
	.byte	0x1
	.byte	0x37
	.4byte	0x94
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x18
	.4byte	0x340
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x437
	.4byte	0x444
	.uleb128 0x19
	.4byte	.LASF524
	.4byte	0x3e9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x18
	.4byte	0x35e
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x45b
	.4byte	0x468
	.uleb128 0x19
	.4byte	.LASF524
	.4byte	0x3e9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x1b
	.4byte	0x384
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x47f
	.4byte	0x48c
	.uleb128 0x19
	.4byte	.LASF524
	.4byte	0x3e9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x18
	.4byte	0x177
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4a3
	.4byte	0x4b0
	.uleb128 0x19
	.4byte	.LASF524
	.4byte	0x4b0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x16
	.4byte	0x3ad
	.uleb128 0x1b
	.4byte	0x264
	.4byte	.LFB11
	.4byte	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4cc
	.4byte	0x4d9
	.uleb128 0x19
	.4byte	.LASF524
	.4byte	0x4b0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x1b
	.4byte	0x2a0
	.4byte	.LFB13
	.4byte	.LFE13-.LFB13
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4f0
	.4byte	0x4fd
	.uleb128 0x19
	.4byte	.LASF524
	.4byte	0x4b0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x1c
	.4byte	0x106
	.byte	0
	.4byte	0x50b
	.4byte	0x515
	.uleb128 0x1d
	.4byte	.LASF524
	.4byte	0x4b0
	.byte	0
	.uleb128 0x1e
	.4byte	0x4fd
	.4byte	.LASF526
	.4byte	.LFB16
	.4byte	.LFE16-.LFB16
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x530
	.4byte	0x539
	.uleb128 0x1f
	.4byte	0x50b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x1c
	.4byte	0x124
	.byte	0
	.4byte	0x547
	.4byte	0x55a
	.uleb128 0x1d
	.4byte	.LASF524
	.4byte	0x4b0
	.uleb128 0x1d
	.4byte	.LASF525
	.4byte	0x55a
	.byte	0
	.uleb128 0x16
	.4byte	0x5b
	.uleb128 0x1e
	.4byte	0x539
	.4byte	.LASF527
	.4byte	.LFB19
	.4byte	.LFE19-.LFB19
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x57a
	.4byte	0x583
	.uleb128 0x1f
	.4byte	0x547
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x1e
	.4byte	0x539
	.4byte	.LASF528
	.4byte	.LFB21
	.4byte	.LFE21-.LFB21
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x59e
	.4byte	0x5a7
	.uleb128 0x1f
	.4byte	0x547
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x1b
	.4byte	0x14c
	.4byte	.LFB22
	.4byte	.LFE22-.LFB22
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5be
	.4byte	0x605
	.uleb128 0x19
	.4byte	.LASF524
	.4byte	0x4b0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1a
	.4byte	.LASF516
	.byte	0x3
	.byte	0x27
	.4byte	0x94
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x20
	.4byte	.LBB5
	.4byte	.LBE5-.LBB5
	.uleb128 0x21
	.ascii	"t\000"
	.byte	0x3
	.byte	0x2b
	.4byte	0x2f7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x20
	.4byte	.LBB6
	.4byte	.LBE6-.LBB6
	.uleb128 0x21
	.ascii	"n\000"
	.byte	0x3
	.byte	0x31
	.4byte	0x5b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1b
	.4byte	0x199
	.4byte	.LFB23
	.4byte	.LFE23-.LFB23
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x61c
	.4byte	0x636
	.uleb128 0x19
	.4byte	.LASF524
	.4byte	0x4b0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x22
	.ascii	"ch\000"
	.byte	0x3
	.byte	0x45
	.4byte	0x30
	.uleb128 0x2
	.byte	0x91
	.sleb128 -21
	.byte	0
	.uleb128 0x1b
	.4byte	0x1bc
	.4byte	.LFB24
	.4byte	.LFE24-.LFB24
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x64d
	.4byte	0x697
	.uleb128 0x19
	.4byte	.LASF524
	.4byte	0x4b0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1a
	.4byte	.LASF530
	.byte	0x3
	.byte	0x58
	.4byte	0x697
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x23
	.4byte	.LASF516
	.byte	0x3
	.byte	0x5a
	.4byte	0x94
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x21
	.ascii	"len\000"
	.byte	0x3
	.byte	0x5b
	.4byte	0x94
	.uleb128 0x1
	.byte	0x56
	.uleb128 0x20
	.4byte	.LBB7
	.4byte	.LBE7-.LBB7
	.uleb128 0x21
	.ascii	"n\000"
	.byte	0x3
	.byte	0x5c
	.4byte	0x5b
	.uleb128 0x1
	.byte	0x54
	.byte	0
	.byte	0
	.uleb128 0x16
	.4byte	0x3b9
	.uleb128 0x1b
	.4byte	0x1df
	.4byte	.LFB25
	.4byte	.LFE25-.LFB25
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6b3
	.4byte	0x6cd
	.uleb128 0x19
	.4byte	.LASF524
	.4byte	0x4b0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x21
	.ascii	"ch\000"
	.byte	0x3
	.byte	0x69
	.4byte	0x30
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x1b
	.4byte	0x1fd
	.4byte	.LFB26
	.4byte	.LFE26-.LFB26
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6e4
	.4byte	0x708
	.uleb128 0x19
	.4byte	.LASF524
	.4byte	0x4b0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x20
	.4byte	.LBB9
	.4byte	.LBE9-.LBB9
	.uleb128 0x21
	.ascii	"ch\000"
	.byte	0x3
	.byte	0x76
	.4byte	0x30
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.byte	0
	.uleb128 0x1b
	.4byte	0x21b
	.4byte	.LFB27
	.4byte	.LFE27-.LFB27
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x71f
	.4byte	0x747
	.uleb128 0x19
	.4byte	.LASF524
	.4byte	0x4b0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x22
	.ascii	"ch\000"
	.byte	0x3
	.byte	0x85
	.4byte	0x30
	.uleb128 0x2
	.byte	0x91
	.sleb128 -29
	.uleb128 0x21
	.ascii	"out\000"
	.byte	0x3
	.byte	0x87
	.4byte	0x30
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.uleb128 0x1b
	.4byte	0x23e
	.4byte	.LFB28
	.4byte	.LFE28-.LFB28
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x75e
	.4byte	0x76b
	.uleb128 0x19
	.4byte	.LASF524
	.4byte	0x4b0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x24
	.4byte	0x2dc
	.4byte	.LFB29
	.4byte	.LFE29-.LFB29
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x77e
	.uleb128 0x19
	.4byte	.LASF524
	.4byte	0x4b0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x21
	.ascii	"rc\000"
	.byte	0x3
	.byte	0xa3
	.4byte	0x2f7
	.uleb128 0x3
	.byte	0x91
	.sleb128 -28
	.byte	0x6
	.uleb128 0x23
	.4byte	.LASF531
	.byte	0x3
	.byte	0xa4
	.4byte	0x5b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x23
	.4byte	.LASF532
	.byte	0x3
	.byte	0xa5
	.4byte	0x5b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x21
	.ascii	"idx\000"
	.byte	0x3
	.byte	0xa6
	.4byte	0x5b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
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
	.uleb128 0x2119
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
	.uleb128 0x39
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x2
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1d
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x1c
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.uleb128 0x32
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
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
	.uleb128 0xb
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x32
	.uleb128 0xb
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x64
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x32
	.uleb128 0xb
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x64
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x4c
	.uleb128 0xb
	.uleb128 0x1d
	.uleb128 0x13
	.uleb128 0x32
	.uleb128 0xb
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x64
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x4c
	.uleb128 0xb
	.uleb128 0x4d
	.uleb128 0x18
	.uleb128 0x1d
	.uleb128 0x13
	.uleb128 0x32
	.uleb128 0xb
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x64
	.uleb128 0x13
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
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x4c
	.uleb128 0xb
	.uleb128 0x4d
	.uleb128 0x18
	.uleb128 0x1d
	.uleb128 0x13
	.uleb128 0x32
	.uleb128 0xb
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x64
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
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
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x32
	.uleb128 0xb
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x64
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x2
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x32
	.uleb128 0xb
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x64
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
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
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x4c
	.uleb128 0xb
	.uleb128 0x4d
	.uleb128 0x18
	.uleb128 0x1d
	.uleb128 0x13
	.uleb128 0x32
	.uleb128 0xb
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x64
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x10
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x47
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x64
	.uleb128 0x13
	.uleb128 0x2117
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1a
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
	.uleb128 0x1b
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x47
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x64
	.uleb128 0x13
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x47
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x64
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x64
	.uleb128 0x13
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
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
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x47
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x64
	.uleb128 0x13
	.uleb128 0x2116
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_pubnames,"",%progbits
	.4byte	0x26a
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x7c4
	.4byte	0x9f
	.ascii	"CARIBOU\000"
	.4byte	0x3c5
	.ascii	"CARIBOU::CByteArray::size\000"
	.4byte	0x3ee
	.ascii	"CARIBOU::CByteArray::at\000"
	.4byte	0x420
	.ascii	"CARIBOU::CByteArray::data\000"
	.4byte	0x444
	.ascii	"CARIBOU::CByteArray::isNull\000"
	.4byte	0x468
	.ascii	"CARIBOU::CByteArray::isEmpty\000"
	.4byte	0x48c
	.ascii	"CARIBOU::CRingBuffer::clear\000"
	.4byte	0x4b5
	.ascii	"CARIBOU::CRingBuffer::full\000"
	.4byte	0x4d9
	.ascii	"CARIBOU::CRingBuffer::empty\000"
	.4byte	0x4fd
	.ascii	"CARIBOU::CRingBuffer::CRingBuffer\000"
	.4byte	0x539
	.ascii	"CARIBOU::CRingBuffer::~CRingBuffer\000"
	.4byte	0x5a7
	.ascii	"CARIBOU::CRingBuffer::resize\000"
	.4byte	0x605
	.ascii	"CARIBOU::CRingBuffer::insert\000"
	.4byte	0x636
	.ascii	"CARIBOU::CRingBuffer::insert\000"
	.4byte	0x69c
	.ascii	"CARIBOU::CRingBuffer::peek\000"
	.4byte	0x6cd
	.ascii	"CARIBOU::CRingBuffer::remove\000"
	.4byte	0x708
	.ascii	"CARIBOU::CRingBuffer::remove\000"
	.4byte	0x747
	.ascii	"CARIBOU::CRingBuffer::length\000"
	.4byte	0x76b
	.ascii	"CARIBOU::CRingBuffer::toByteArray\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0x12c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x7c4
	.4byte	0x29
	.ascii	"signed char\000"
	.4byte	0x3b
	.ascii	"unsigned char\000"
	.4byte	0x30
	.ascii	"uint8_t\000"
	.4byte	0x42
	.ascii	"short int\000"
	.4byte	0x54
	.ascii	"short unsigned int\000"
	.4byte	0x49
	.ascii	"uint16_t\000"
	.4byte	0x5b
	.ascii	"int\000"
	.4byte	0x62
	.ascii	"unsigned int\000"
	.4byte	0x69
	.ascii	"long long int\000"
	.4byte	0x70
	.ascii	"long long unsigned int\000"
	.4byte	0x79
	.ascii	"long int\000"
	.4byte	0x86
	.ascii	"char\000"
	.4byte	0x8d
	.ascii	"sizetype\000"
	.4byte	0x94
	.ascii	"size_t\000"
	.4byte	0xaa
	.ascii	"CARIBOU::CRingBuffer\000"
	.4byte	0x2f7
	.ascii	"CARIBOU::CByteArray\000"
	.4byte	0xaa
	.ascii	"CARIBOU::CRingBuffer\000"
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0xac
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
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.4byte	.LFB11
	.4byte	.LFE11-.LFB11
	.4byte	.LFB13
	.4byte	.LFE13-.LFB13
	.4byte	.LFB16
	.4byte	.LFE16-.LFB16
	.4byte	.LFB19
	.4byte	.LFE19-.LFB19
	.4byte	.LFB21
	.4byte	.LFE21-.LFB21
	.4byte	.LFB22
	.4byte	.LFE22-.LFB22
	.4byte	.LFB23
	.4byte	.LFE23-.LFB23
	.4byte	.LFB24
	.4byte	.LFE24-.LFB24
	.4byte	.LFB25
	.4byte	.LFE25-.LFB25
	.4byte	.LFB26
	.4byte	.LFE26-.LFB26
	.4byte	.LFB27
	.4byte	.LFE27-.LFB27
	.4byte	.LFB28
	.4byte	.LFE28-.LFB28
	.4byte	.LFB29
	.4byte	.LFE29-.LFB29
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LFB0
	.4byte	.LFE0
	.4byte	.LFB1
	.4byte	.LFE1
	.4byte	.LFB2
	.4byte	.LFE2
	.4byte	.LFB4
	.4byte	.LFE4
	.4byte	.LFB5
	.4byte	.LFE5
	.4byte	.LFB10
	.4byte	.LFE10
	.4byte	.LFB11
	.4byte	.LFE11
	.4byte	.LFB13
	.4byte	.LFE13
	.4byte	.LFB16
	.4byte	.LFE16
	.4byte	.LFB19
	.4byte	.LFE19
	.4byte	.LFB21
	.4byte	.LFE21
	.4byte	.LFB22
	.4byte	.LFE22
	.4byte	.LFB23
	.4byte	.LFE23
	.4byte	.LFB24
	.4byte	.LFE24
	.4byte	.LFB25
	.4byte	.LFE25
	.4byte	.LFB26
	.4byte	.LFE26
	.4byte	.LFB27
	.4byte	.LFE27
	.4byte	.LFB28
	.4byte	.LFE28
	.4byte	.LFB29
	.4byte	.LFE29
	.4byte	0
	.4byte	0
	.section	.debug_macro,"",%progbits
.Ldebug_macro0:
	.2byte	0x4
	.byte	0x2
	.4byte	.Ldebug_line0
	.byte	0x7
	.4byte	.Ldebug_macro1
	.byte	0x3
	.uleb128 0
	.uleb128 0x3
	.byte	0x3
	.uleb128 0x11
	.uleb128 0x2
	.byte	0x5
	.uleb128 0x12
	.4byte	.LASF360
	.byte	0x3
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x5
	.uleb128 0x12
	.4byte	.LASF361
	.file 6 "../../../../include/caribou/lib/string.h"
	.byte	0x3
	.uleb128 0x14
	.uleb128 0x6
	.byte	0x5
	.uleb128 0x10
	.4byte	.LASF362
	.file 7 "../../../../include/caribou/kernel/types.h"
	.byte	0x3
	.uleb128 0x12
	.uleb128 0x7
	.byte	0x5
	.uleb128 0x10
	.4byte	.LASF363
	.file 8 "../include/caribou_config.h"
	.byte	0x3
	.uleb128 0x12
	.uleb128 0x8
	.byte	0x7
	.4byte	.Ldebug_macro2
	.byte	0x4
	.byte	0x3
	.uleb128 0x25
	.uleb128 0x4
	.byte	0x7
	.4byte	.Ldebug_macro3
	.byte	0x4
	.byte	0x3
	.uleb128 0x26
	.uleb128 0x5
	.byte	0x5
	.uleb128 0xc
	.4byte	.LASF428
	.file 9 "/usr/share/crossworks_for_arm_3.7/include/__crossworks.h"
	.byte	0x3
	.uleb128 0xe
	.uleb128 0x9
	.byte	0x7
	.4byte	.Ldebug_macro4
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro5
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro6
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro7
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.byte	0x5
	.uleb128 0x15
	.4byte	.LASF472
	.byte	0x4
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.0.fefc1653436e9cd31ae315aa23be959b,comdat
.Ldebug_macro1:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0
	.4byte	.LASF0
	.byte	0x5
	.uleb128 0
	.4byte	.LASF1
	.byte	0x5
	.uleb128 0
	.4byte	.LASF2
	.byte	0x5
	.uleb128 0
	.4byte	.LASF3
	.byte	0x5
	.uleb128 0
	.4byte	.LASF4
	.byte	0x5
	.uleb128 0
	.4byte	.LASF5
	.byte	0x5
	.uleb128 0
	.4byte	.LASF6
	.byte	0x5
	.uleb128 0
	.4byte	.LASF7
	.byte	0x5
	.uleb128 0
	.4byte	.LASF8
	.byte	0x5
	.uleb128 0
	.4byte	.LASF9
	.byte	0x5
	.uleb128 0
	.4byte	.LASF10
	.byte	0x5
	.uleb128 0
	.4byte	.LASF11
	.byte	0x5
	.uleb128 0
	.4byte	.LASF12
	.byte	0x5
	.uleb128 0
	.4byte	.LASF13
	.byte	0x5
	.uleb128 0
	.4byte	.LASF14
	.byte	0x5
	.uleb128 0
	.4byte	.LASF15
	.byte	0x5
	.uleb128 0
	.4byte	.LASF16
	.byte	0x5
	.uleb128 0
	.4byte	.LASF17
	.byte	0x5
	.uleb128 0
	.4byte	.LASF18
	.byte	0x5
	.uleb128 0
	.4byte	.LASF19
	.byte	0x5
	.uleb128 0
	.4byte	.LASF20
	.byte	0x5
	.uleb128 0
	.4byte	.LASF21
	.byte	0x5
	.uleb128 0
	.4byte	.LASF22
	.byte	0x5
	.uleb128 0
	.4byte	.LASF23
	.byte	0x5
	.uleb128 0
	.4byte	.LASF24
	.byte	0x5
	.uleb128 0
	.4byte	.LASF25
	.byte	0x5
	.uleb128 0
	.4byte	.LASF26
	.byte	0x5
	.uleb128 0
	.4byte	.LASF27
	.byte	0x5
	.uleb128 0
	.4byte	.LASF28
	.byte	0x5
	.uleb128 0
	.4byte	.LASF29
	.byte	0x5
	.uleb128 0
	.4byte	.LASF30
	.byte	0x5
	.uleb128 0
	.4byte	.LASF31
	.byte	0x5
	.uleb128 0
	.4byte	.LASF32
	.byte	0x5
	.uleb128 0
	.4byte	.LASF33
	.byte	0x5
	.uleb128 0
	.4byte	.LASF34
	.byte	0x5
	.uleb128 0
	.4byte	.LASF35
	.byte	0x5
	.uleb128 0
	.4byte	.LASF36
	.byte	0x5
	.uleb128 0
	.4byte	.LASF37
	.byte	0x5
	.uleb128 0
	.4byte	.LASF38
	.byte	0x5
	.uleb128 0
	.4byte	.LASF39
	.byte	0x5
	.uleb128 0
	.4byte	.LASF40
	.byte	0x5
	.uleb128 0
	.4byte	.LASF41
	.byte	0x5
	.uleb128 0
	.4byte	.LASF42
	.byte	0x5
	.uleb128 0
	.4byte	.LASF43
	.byte	0x5
	.uleb128 0
	.4byte	.LASF44
	.byte	0x5
	.uleb128 0
	.4byte	.LASF45
	.byte	0x5
	.uleb128 0
	.4byte	.LASF46
	.byte	0x5
	.uleb128 0
	.4byte	.LASF47
	.byte	0x5
	.uleb128 0
	.4byte	.LASF48
	.byte	0x5
	.uleb128 0
	.4byte	.LASF49
	.byte	0x5
	.uleb128 0
	.4byte	.LASF50
	.byte	0x5
	.uleb128 0
	.4byte	.LASF51
	.byte	0x5
	.uleb128 0
	.4byte	.LASF52
	.byte	0x5
	.uleb128 0
	.4byte	.LASF53
	.byte	0x5
	.uleb128 0
	.4byte	.LASF54
	.byte	0x5
	.uleb128 0
	.4byte	.LASF55
	.byte	0x5
	.uleb128 0
	.4byte	.LASF56
	.byte	0x5
	.uleb128 0
	.4byte	.LASF57
	.byte	0x5
	.uleb128 0
	.4byte	.LASF58
	.byte	0x5
	.uleb128 0
	.4byte	.LASF59
	.byte	0x5
	.uleb128 0
	.4byte	.LASF60
	.byte	0x5
	.uleb128 0
	.4byte	.LASF61
	.byte	0x5
	.uleb128 0
	.4byte	.LASF62
	.byte	0x5
	.uleb128 0
	.4byte	.LASF63
	.byte	0x5
	.uleb128 0
	.4byte	.LASF64
	.byte	0x5
	.uleb128 0
	.4byte	.LASF65
	.byte	0x5
	.uleb128 0
	.4byte	.LASF66
	.byte	0x5
	.uleb128 0
	.4byte	.LASF67
	.byte	0x5
	.uleb128 0
	.4byte	.LASF68
	.byte	0x5
	.uleb128 0
	.4byte	.LASF69
	.byte	0x5
	.uleb128 0
	.4byte	.LASF70
	.byte	0x5
	.uleb128 0
	.4byte	.LASF71
	.byte	0x5
	.uleb128 0
	.4byte	.LASF72
	.byte	0x5
	.uleb128 0
	.4byte	.LASF73
	.byte	0x5
	.uleb128 0
	.4byte	.LASF74
	.byte	0x5
	.uleb128 0
	.4byte	.LASF75
	.byte	0x5
	.uleb128 0
	.4byte	.LASF76
	.byte	0x5
	.uleb128 0
	.4byte	.LASF77
	.byte	0x5
	.uleb128 0
	.4byte	.LASF78
	.byte	0x5
	.uleb128 0
	.4byte	.LASF79
	.byte	0x5
	.uleb128 0
	.4byte	.LASF80
	.byte	0x5
	.uleb128 0
	.4byte	.LASF81
	.byte	0x5
	.uleb128 0
	.4byte	.LASF82
	.byte	0x5
	.uleb128 0
	.4byte	.LASF83
	.byte	0x5
	.uleb128 0
	.4byte	.LASF84
	.byte	0x5
	.uleb128 0
	.4byte	.LASF85
	.byte	0x5
	.uleb128 0
	.4byte	.LASF86
	.byte	0x5
	.uleb128 0
	.4byte	.LASF87
	.byte	0x5
	.uleb128 0
	.4byte	.LASF88
	.byte	0x5
	.uleb128 0
	.4byte	.LASF89
	.byte	0x5
	.uleb128 0
	.4byte	.LASF90
	.byte	0x5
	.uleb128 0
	.4byte	.LASF91
	.byte	0x5
	.uleb128 0
	.4byte	.LASF92
	.byte	0x5
	.uleb128 0
	.4byte	.LASF93
	.byte	0x5
	.uleb128 0
	.4byte	.LASF94
	.byte	0x5
	.uleb128 0
	.4byte	.LASF95
	.byte	0x5
	.uleb128 0
	.4byte	.LASF96
	.byte	0x5
	.uleb128 0
	.4byte	.LASF97
	.byte	0x5
	.uleb128 0
	.4byte	.LASF98
	.byte	0x5
	.uleb128 0
	.4byte	.LASF99
	.byte	0x5
	.uleb128 0
	.4byte	.LASF100
	.byte	0x5
	.uleb128 0
	.4byte	.LASF101
	.byte	0x5
	.uleb128 0
	.4byte	.LASF102
	.byte	0x5
	.uleb128 0
	.4byte	.LASF103
	.byte	0x5
	.uleb128 0
	.4byte	.LASF104
	.byte	0x5
	.uleb128 0
	.4byte	.LASF105
	.byte	0x5
	.uleb128 0
	.4byte	.LASF106
	.byte	0x5
	.uleb128 0
	.4byte	.LASF107
	.byte	0x5
	.uleb128 0
	.4byte	.LASF108
	.byte	0x5
	.uleb128 0
	.4byte	.LASF109
	.byte	0x5
	.uleb128 0
	.4byte	.LASF110
	.byte	0x5
	.uleb128 0
	.4byte	.LASF111
	.byte	0x5
	.uleb128 0
	.4byte	.LASF112
	.byte	0x5
	.uleb128 0
	.4byte	.LASF113
	.byte	0x5
	.uleb128 0
	.4byte	.LASF114
	.byte	0x5
	.uleb128 0
	.4byte	.LASF115
	.byte	0x5
	.uleb128 0
	.4byte	.LASF116
	.byte	0x5
	.uleb128 0
	.4byte	.LASF117
	.byte	0x5
	.uleb128 0
	.4byte	.LASF118
	.byte	0x5
	.uleb128 0
	.4byte	.LASF119
	.byte	0x5
	.uleb128 0
	.4byte	.LASF120
	.byte	0x5
	.uleb128 0
	.4byte	.LASF121
	.byte	0x5
	.uleb128 0
	.4byte	.LASF122
	.byte	0x5
	.uleb128 0
	.4byte	.LASF123
	.byte	0x5
	.uleb128 0
	.4byte	.LASF124
	.byte	0x5
	.uleb128 0
	.4byte	.LASF125
	.byte	0x5
	.uleb128 0
	.4byte	.LASF126
	.byte	0x5
	.uleb128 0
	.4byte	.LASF127
	.byte	0x5
	.uleb128 0
	.4byte	.LASF128
	.byte	0x5
	.uleb128 0
	.4byte	.LASF129
	.byte	0x5
	.uleb128 0
	.4byte	.LASF130
	.byte	0x5
	.uleb128 0
	.4byte	.LASF131
	.byte	0x5
	.uleb128 0
	.4byte	.LASF132
	.byte	0x5
	.uleb128 0
	.4byte	.LASF133
	.byte	0x5
	.uleb128 0
	.4byte	.LASF134
	.byte	0x5
	.uleb128 0
	.4byte	.LASF135
	.byte	0x5
	.uleb128 0
	.4byte	.LASF136
	.byte	0x5
	.uleb128 0
	.4byte	.LASF137
	.byte	0x5
	.uleb128 0
	.4byte	.LASF138
	.byte	0x5
	.uleb128 0
	.4byte	.LASF139
	.byte	0x5
	.uleb128 0
	.4byte	.LASF140
	.byte	0x5
	.uleb128 0
	.4byte	.LASF141
	.byte	0x5
	.uleb128 0
	.4byte	.LASF142
	.byte	0x5
	.uleb128 0
	.4byte	.LASF143
	.byte	0x5
	.uleb128 0
	.4byte	.LASF144
	.byte	0x5
	.uleb128 0
	.4byte	.LASF145
	.byte	0x5
	.uleb128 0
	.4byte	.LASF146
	.byte	0x5
	.uleb128 0
	.4byte	.LASF147
	.byte	0x5
	.uleb128 0
	.4byte	.LASF148
	.byte	0x5
	.uleb128 0
	.4byte	.LASF149
	.byte	0x5
	.uleb128 0
	.4byte	.LASF150
	.byte	0x5
	.uleb128 0
	.4byte	.LASF151
	.byte	0x5
	.uleb128 0
	.4byte	.LASF152
	.byte	0x5
	.uleb128 0
	.4byte	.LASF153
	.byte	0x5
	.uleb128 0
	.4byte	.LASF154
	.byte	0x5
	.uleb128 0
	.4byte	.LASF155
	.byte	0x5
	.uleb128 0
	.4byte	.LASF156
	.byte	0x5
	.uleb128 0
	.4byte	.LASF157
	.byte	0x5
	.uleb128 0
	.4byte	.LASF158
	.byte	0x5
	.uleb128 0
	.4byte	.LASF159
	.byte	0x5
	.uleb128 0
	.4byte	.LASF160
	.byte	0x5
	.uleb128 0
	.4byte	.LASF161
	.byte	0x5
	.uleb128 0
	.4byte	.LASF162
	.byte	0x5
	.uleb128 0
	.4byte	.LASF163
	.byte	0x5
	.uleb128 0
	.4byte	.LASF164
	.byte	0x5
	.uleb128 0
	.4byte	.LASF165
	.byte	0x5
	.uleb128 0
	.4byte	.LASF166
	.byte	0x5
	.uleb128 0
	.4byte	.LASF167
	.byte	0x5
	.uleb128 0
	.4byte	.LASF168
	.byte	0x5
	.uleb128 0
	.4byte	.LASF169
	.byte	0x5
	.uleb128 0
	.4byte	.LASF170
	.byte	0x5
	.uleb128 0
	.4byte	.LASF171
	.byte	0x5
	.uleb128 0
	.4byte	.LASF172
	.byte	0x5
	.uleb128 0
	.4byte	.LASF173
	.byte	0x5
	.uleb128 0
	.4byte	.LASF174
	.byte	0x5
	.uleb128 0
	.4byte	.LASF175
	.byte	0x5
	.uleb128 0
	.4byte	.LASF176
	.byte	0x5
	.uleb128 0
	.4byte	.LASF177
	.byte	0x5
	.uleb128 0
	.4byte	.LASF178
	.byte	0x5
	.uleb128 0
	.4byte	.LASF179
	.byte	0x5
	.uleb128 0
	.4byte	.LASF180
	.byte	0x5
	.uleb128 0
	.4byte	.LASF181
	.byte	0x5
	.uleb128 0
	.4byte	.LASF182
	.byte	0x5
	.uleb128 0
	.4byte	.LASF183
	.byte	0x5
	.uleb128 0
	.4byte	.LASF184
	.byte	0x5
	.uleb128 0
	.4byte	.LASF185
	.byte	0x5
	.uleb128 0
	.4byte	.LASF186
	.byte	0x5
	.uleb128 0
	.4byte	.LASF187
	.byte	0x5
	.uleb128 0
	.4byte	.LASF188
	.byte	0x5
	.uleb128 0
	.4byte	.LASF189
	.byte	0x5
	.uleb128 0
	.4byte	.LASF190
	.byte	0x5
	.uleb128 0
	.4byte	.LASF191
	.byte	0x5
	.uleb128 0
	.4byte	.LASF192
	.byte	0x5
	.uleb128 0
	.4byte	.LASF193
	.byte	0x5
	.uleb128 0
	.4byte	.LASF194
	.byte	0x5
	.uleb128 0
	.4byte	.LASF195
	.byte	0x5
	.uleb128 0
	.4byte	.LASF196
	.byte	0x5
	.uleb128 0
	.4byte	.LASF197
	.byte	0x5
	.uleb128 0
	.4byte	.LASF198
	.byte	0x5
	.uleb128 0
	.4byte	.LASF199
	.byte	0x5
	.uleb128 0
	.4byte	.LASF200
	.byte	0x5
	.uleb128 0
	.4byte	.LASF201
	.byte	0x5
	.uleb128 0
	.4byte	.LASF202
	.byte	0x5
	.uleb128 0
	.4byte	.LASF203
	.byte	0x5
	.uleb128 0
	.4byte	.LASF204
	.byte	0x5
	.uleb128 0
	.4byte	.LASF205
	.byte	0x5
	.uleb128 0
	.4byte	.LASF206
	.byte	0x5
	.uleb128 0
	.4byte	.LASF207
	.byte	0x5
	.uleb128 0
	.4byte	.LASF208
	.byte	0x5
	.uleb128 0
	.4byte	.LASF209
	.byte	0x5
	.uleb128 0
	.4byte	.LASF210
	.byte	0x5
	.uleb128 0
	.4byte	.LASF211
	.byte	0x5
	.uleb128 0
	.4byte	.LASF212
	.byte	0x5
	.uleb128 0
	.4byte	.LASF213
	.byte	0x5
	.uleb128 0
	.4byte	.LASF214
	.byte	0x5
	.uleb128 0
	.4byte	.LASF215
	.byte	0x5
	.uleb128 0
	.4byte	.LASF216
	.byte	0x5
	.uleb128 0
	.4byte	.LASF217
	.byte	0x5
	.uleb128 0
	.4byte	.LASF218
	.byte	0x5
	.uleb128 0
	.4byte	.LASF219
	.byte	0x5
	.uleb128 0
	.4byte	.LASF220
	.byte	0x5
	.uleb128 0
	.4byte	.LASF221
	.byte	0x5
	.uleb128 0
	.4byte	.LASF222
	.byte	0x5
	.uleb128 0
	.4byte	.LASF223
	.byte	0x5
	.uleb128 0
	.4byte	.LASF224
	.byte	0x5
	.uleb128 0
	.4byte	.LASF225
	.byte	0x5
	.uleb128 0
	.4byte	.LASF226
	.byte	0x5
	.uleb128 0
	.4byte	.LASF227
	.byte	0x5
	.uleb128 0
	.4byte	.LASF228
	.byte	0x5
	.uleb128 0
	.4byte	.LASF229
	.byte	0x5
	.uleb128 0
	.4byte	.LASF230
	.byte	0x5
	.uleb128 0
	.4byte	.LASF231
	.byte	0x5
	.uleb128 0
	.4byte	.LASF232
	.byte	0x5
	.uleb128 0
	.4byte	.LASF233
	.byte	0x5
	.uleb128 0
	.4byte	.LASF234
	.byte	0x5
	.uleb128 0
	.4byte	.LASF235
	.byte	0x5
	.uleb128 0
	.4byte	.LASF236
	.byte	0x5
	.uleb128 0
	.4byte	.LASF237
	.byte	0x5
	.uleb128 0
	.4byte	.LASF238
	.byte	0x5
	.uleb128 0
	.4byte	.LASF239
	.byte	0x5
	.uleb128 0
	.4byte	.LASF240
	.byte	0x5
	.uleb128 0
	.4byte	.LASF241
	.byte	0x5
	.uleb128 0
	.4byte	.LASF242
	.byte	0x5
	.uleb128 0
	.4byte	.LASF243
	.byte	0x5
	.uleb128 0
	.4byte	.LASF244
	.byte	0x5
	.uleb128 0
	.4byte	.LASF245
	.byte	0x5
	.uleb128 0
	.4byte	.LASF246
	.byte	0x5
	.uleb128 0
	.4byte	.LASF247
	.byte	0x5
	.uleb128 0
	.4byte	.LASF248
	.byte	0x5
	.uleb128 0
	.4byte	.LASF249
	.byte	0x5
	.uleb128 0
	.4byte	.LASF250
	.byte	0x5
	.uleb128 0
	.4byte	.LASF251
	.byte	0x5
	.uleb128 0
	.4byte	.LASF252
	.byte	0x5
	.uleb128 0
	.4byte	.LASF253
	.byte	0x5
	.uleb128 0
	.4byte	.LASF254
	.byte	0x5
	.uleb128 0
	.4byte	.LASF255
	.byte	0x5
	.uleb128 0
	.4byte	.LASF256
	.byte	0x5
	.uleb128 0
	.4byte	.LASF257
	.byte	0x5
	.uleb128 0
	.4byte	.LASF258
	.byte	0x5
	.uleb128 0
	.4byte	.LASF259
	.byte	0x5
	.uleb128 0
	.4byte	.LASF260
	.byte	0x5
	.uleb128 0
	.4byte	.LASF261
	.byte	0x5
	.uleb128 0
	.4byte	.LASF262
	.byte	0x5
	.uleb128 0
	.4byte	.LASF263
	.byte	0x5
	.uleb128 0
	.4byte	.LASF264
	.byte	0x5
	.uleb128 0
	.4byte	.LASF265
	.byte	0x5
	.uleb128 0
	.4byte	.LASF266
	.byte	0x5
	.uleb128 0
	.4byte	.LASF267
	.byte	0x5
	.uleb128 0
	.4byte	.LASF268
	.byte	0x5
	.uleb128 0
	.4byte	.LASF269
	.byte	0x5
	.uleb128 0
	.4byte	.LASF270
	.byte	0x5
	.uleb128 0
	.4byte	.LASF271
	.byte	0x5
	.uleb128 0
	.4byte	.LASF272
	.byte	0x5
	.uleb128 0
	.4byte	.LASF273
	.byte	0x5
	.uleb128 0
	.4byte	.LASF274
	.byte	0x5
	.uleb128 0
	.4byte	.LASF275
	.byte	0x5
	.uleb128 0
	.4byte	.LASF276
	.byte	0x5
	.uleb128 0
	.4byte	.LASF277
	.byte	0x5
	.uleb128 0
	.4byte	.LASF278
	.byte	0x5
	.uleb128 0
	.4byte	.LASF279
	.byte	0x5
	.uleb128 0
	.4byte	.LASF280
	.byte	0x5
	.uleb128 0
	.4byte	.LASF281
	.byte	0x5
	.uleb128 0
	.4byte	.LASF282
	.byte	0x5
	.uleb128 0
	.4byte	.LASF283
	.byte	0x5
	.uleb128 0
	.4byte	.LASF284
	.byte	0x5
	.uleb128 0
	.4byte	.LASF285
	.byte	0x5
	.uleb128 0
	.4byte	.LASF286
	.byte	0x5
	.uleb128 0
	.4byte	.LASF287
	.byte	0x5
	.uleb128 0
	.4byte	.LASF288
	.byte	0x5
	.uleb128 0
	.4byte	.LASF289
	.byte	0x5
	.uleb128 0
	.4byte	.LASF290
	.byte	0x5
	.uleb128 0
	.4byte	.LASF291
	.byte	0x5
	.uleb128 0
	.4byte	.LASF292
	.byte	0x5
	.uleb128 0
	.4byte	.LASF293
	.byte	0x5
	.uleb128 0
	.4byte	.LASF294
	.byte	0x5
	.uleb128 0
	.4byte	.LASF295
	.byte	0x5
	.uleb128 0
	.4byte	.LASF296
	.byte	0x5
	.uleb128 0
	.4byte	.LASF297
	.byte	0x5
	.uleb128 0
	.4byte	.LASF298
	.byte	0x5
	.uleb128 0
	.4byte	.LASF299
	.byte	0x5
	.uleb128 0
	.4byte	.LASF300
	.byte	0x5
	.uleb128 0
	.4byte	.LASF301
	.byte	0x5
	.uleb128 0
	.4byte	.LASF302
	.byte	0x5
	.uleb128 0
	.4byte	.LASF303
	.byte	0x5
	.uleb128 0
	.4byte	.LASF304
	.byte	0x5
	.uleb128 0
	.4byte	.LASF305
	.byte	0x5
	.uleb128 0
	.4byte	.LASF306
	.byte	0x5
	.uleb128 0
	.4byte	.LASF307
	.byte	0x5
	.uleb128 0
	.4byte	.LASF308
	.byte	0x5
	.uleb128 0
	.4byte	.LASF309
	.byte	0x5
	.uleb128 0
	.4byte	.LASF310
	.byte	0x5
	.uleb128 0
	.4byte	.LASF311
	.byte	0x5
	.uleb128 0
	.4byte	.LASF312
	.byte	0x5
	.uleb128 0
	.4byte	.LASF313
	.byte	0x5
	.uleb128 0
	.4byte	.LASF314
	.byte	0x5
	.uleb128 0
	.4byte	.LASF315
	.byte	0x5
	.uleb128 0
	.4byte	.LASF316
	.byte	0x5
	.uleb128 0
	.4byte	.LASF317
	.byte	0x5
	.uleb128 0
	.4byte	.LASF318
	.byte	0x5
	.uleb128 0
	.4byte	.LASF319
	.byte	0x5
	.uleb128 0
	.4byte	.LASF320
	.byte	0x5
	.uleb128 0
	.4byte	.LASF321
	.byte	0x5
	.uleb128 0
	.4byte	.LASF322
	.byte	0x5
	.uleb128 0
	.4byte	.LASF323
	.byte	0x5
	.uleb128 0
	.4byte	.LASF324
	.byte	0x5
	.uleb128 0
	.4byte	.LASF325
	.byte	0x5
	.uleb128 0
	.4byte	.LASF326
	.byte	0x5
	.uleb128 0
	.4byte	.LASF327
	.byte	0x5
	.uleb128 0
	.4byte	.LASF328
	.byte	0x5
	.uleb128 0
	.4byte	.LASF329
	.byte	0x5
	.uleb128 0
	.4byte	.LASF330
	.byte	0x5
	.uleb128 0
	.4byte	.LASF331
	.byte	0x5
	.uleb128 0
	.4byte	.LASF332
	.byte	0x5
	.uleb128 0
	.4byte	.LASF333
	.byte	0x5
	.uleb128 0
	.4byte	.LASF334
	.byte	0x5
	.uleb128 0
	.4byte	.LASF335
	.byte	0x5
	.uleb128 0
	.4byte	.LASF336
	.byte	0x5
	.uleb128 0
	.4byte	.LASF337
	.byte	0x5
	.uleb128 0
	.4byte	.LASF338
	.byte	0x5
	.uleb128 0
	.4byte	.LASF339
	.byte	0x5
	.uleb128 0
	.4byte	.LASF340
	.byte	0x5
	.uleb128 0
	.4byte	.LASF341
	.byte	0x5
	.uleb128 0
	.4byte	.LASF342
	.byte	0x5
	.uleb128 0
	.4byte	.LASF343
	.byte	0x5
	.uleb128 0
	.4byte	.LASF344
	.byte	0x5
	.uleb128 0
	.4byte	.LASF345
	.byte	0x5
	.uleb128 0
	.4byte	.LASF346
	.byte	0x5
	.uleb128 0
	.4byte	.LASF347
	.byte	0x5
	.uleb128 0
	.4byte	.LASF348
	.byte	0x5
	.uleb128 0
	.4byte	.LASF342
	.byte	0x5
	.uleb128 0
	.4byte	.LASF349
	.byte	0x5
	.uleb128 0
	.4byte	.LASF350
	.byte	0x5
	.uleb128 0
	.4byte	.LASF351
	.byte	0x5
	.uleb128 0
	.4byte	.LASF352
	.byte	0x5
	.uleb128 0
	.4byte	.LASF353
	.byte	0x5
	.uleb128 0
	.4byte	.LASF354
	.byte	0x5
	.uleb128 0
	.4byte	.LASF355
	.byte	0x5
	.uleb128 0
	.4byte	.LASF356
	.byte	0x5
	.uleb128 0
	.4byte	.LASF357
	.byte	0x5
	.uleb128 0
	.4byte	.LASF358
	.byte	0x5
	.uleb128 0
	.4byte	.LASF359
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.caribou_config.h.18.aa9ba0c879a67a396c27ce76eefb94f8,comdat
.Ldebug_macro2:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x12
	.4byte	.LASF364
	.byte	0x5
	.uleb128 0x15
	.4byte	.LASF365
	.byte	0x5
	.uleb128 0x23
	.4byte	.LASF366
	.byte	0x5
	.uleb128 0x33
	.4byte	.LASF367
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stdint.h.12.a46364249816572e638a099e1e002568,comdat
.Ldebug_macro3:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xc
	.4byte	.LASF368
	.byte	0x5
	.uleb128 0x58
	.4byte	.LASF369
	.byte	0x5
	.uleb128 0x5a
	.4byte	.LASF370
	.byte	0x5
	.uleb128 0x5b
	.4byte	.LASF371
	.byte	0x5
	.uleb128 0x5d
	.4byte	.LASF372
	.byte	0x5
	.uleb128 0x5f
	.4byte	.LASF373
	.byte	0x5
	.uleb128 0x60
	.4byte	.LASF374
	.byte	0x5
	.uleb128 0x62
	.4byte	.LASF375
	.byte	0x5
	.uleb128 0x63
	.4byte	.LASF376
	.byte	0x5
	.uleb128 0x64
	.4byte	.LASF377
	.byte	0x5
	.uleb128 0x66
	.4byte	.LASF378
	.byte	0x5
	.uleb128 0x67
	.4byte	.LASF379
	.byte	0x5
	.uleb128 0x68
	.4byte	.LASF380
	.byte	0x5
	.uleb128 0x6a
	.4byte	.LASF381
	.byte	0x5
	.uleb128 0x6b
	.4byte	.LASF382
	.byte	0x5
	.uleb128 0x6c
	.4byte	.LASF383
	.byte	0x5
	.uleb128 0x6f
	.4byte	.LASF384
	.byte	0x5
	.uleb128 0x70
	.4byte	.LASF385
	.byte	0x5
	.uleb128 0x71
	.4byte	.LASF386
	.byte	0x5
	.uleb128 0x72
	.4byte	.LASF387
	.byte	0x5
	.uleb128 0x73
	.4byte	.LASF388
	.byte	0x5
	.uleb128 0x74
	.4byte	.LASF389
	.byte	0x5
	.uleb128 0x75
	.4byte	.LASF390
	.byte	0x5
	.uleb128 0x76
	.4byte	.LASF391
	.byte	0x5
	.uleb128 0x77
	.4byte	.LASF392
	.byte	0x5
	.uleb128 0x78
	.4byte	.LASF393
	.byte	0x5
	.uleb128 0x79
	.4byte	.LASF394
	.byte	0x5
	.uleb128 0x7a
	.4byte	.LASF395
	.byte	0x5
	.uleb128 0x7c
	.4byte	.LASF396
	.byte	0x5
	.uleb128 0x7d
	.4byte	.LASF397
	.byte	0x5
	.uleb128 0x7e
	.4byte	.LASF398
	.byte	0x5
	.uleb128 0x7f
	.4byte	.LASF399
	.byte	0x5
	.uleb128 0x80
	.4byte	.LASF400
	.byte	0x5
	.uleb128 0x81
	.4byte	.LASF401
	.byte	0x5
	.uleb128 0x82
	.4byte	.LASF402
	.byte	0x5
	.uleb128 0x83
	.4byte	.LASF403
	.byte	0x5
	.uleb128 0x84
	.4byte	.LASF404
	.byte	0x5
	.uleb128 0x85
	.4byte	.LASF405
	.byte	0x5
	.uleb128 0x86
	.4byte	.LASF406
	.byte	0x5
	.uleb128 0x87
	.4byte	.LASF407
	.byte	0x5
	.uleb128 0x8c
	.4byte	.LASF408
	.byte	0x5
	.uleb128 0x8d
	.4byte	.LASF409
	.byte	0x5
	.uleb128 0x8e
	.4byte	.LASF410
	.byte	0x5
	.uleb128 0x90
	.4byte	.LASF411
	.byte	0x5
	.uleb128 0x91
	.4byte	.LASF412
	.byte	0x5
	.uleb128 0x92
	.4byte	.LASF413
	.byte	0x5
	.uleb128 0xa2
	.4byte	.LASF414
	.byte	0x5
	.uleb128 0xa3
	.4byte	.LASF415
	.byte	0x5
	.uleb128 0xa4
	.4byte	.LASF416
	.byte	0x5
	.uleb128 0xa5
	.4byte	.LASF417
	.byte	0x5
	.uleb128 0xa6
	.4byte	.LASF418
	.byte	0x5
	.uleb128 0xa7
	.4byte	.LASF419
	.byte	0x5
	.uleb128 0xa8
	.4byte	.LASF420
	.byte	0x5
	.uleb128 0xa9
	.4byte	.LASF421
	.byte	0x5
	.uleb128 0xab
	.4byte	.LASF422
	.byte	0x5
	.uleb128 0xac
	.4byte	.LASF423
	.byte	0x5
	.uleb128 0xb6
	.4byte	.LASF424
	.byte	0x5
	.uleb128 0xb7
	.4byte	.LASF425
	.byte	0x5
	.uleb128 0xbb
	.4byte	.LASF426
	.byte	0x5
	.uleb128 0xbc
	.4byte	.LASF427
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.__crossworks.h.12.61bb4fabf92630af048d0ccca36b2d0e,comdat
.Ldebug_macro4:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xc
	.4byte	.LASF429
	.byte	0x5
	.uleb128 0x20
	.4byte	.LASF430
	.byte	0x6
	.uleb128 0x22
	.4byte	.LASF431
	.byte	0x5
	.uleb128 0x24
	.4byte	.LASF432
	.byte	0x5
	.uleb128 0x28
	.4byte	.LASF433
	.byte	0x5
	.uleb128 0x2a
	.4byte	.LASF434
	.byte	0x5
	.uleb128 0x3b
	.4byte	.LASF435
	.byte	0x5
	.uleb128 0x42
	.4byte	.LASF430
	.byte	0x5
	.uleb128 0x48
	.4byte	.LASF436
	.byte	0x5
	.uleb128 0x49
	.4byte	.LASF437
	.byte	0x5
	.uleb128 0x4a
	.4byte	.LASF438
	.byte	0x5
	.uleb128 0x4b
	.4byte	.LASF439
	.byte	0x5
	.uleb128 0x4c
	.4byte	.LASF440
	.byte	0x5
	.uleb128 0x4d
	.4byte	.LASF441
	.byte	0x5
	.uleb128 0x4e
	.4byte	.LASF442
	.byte	0x5
	.uleb128 0x4f
	.4byte	.LASF443
	.byte	0x5
	.uleb128 0x52
	.4byte	.LASF444
	.byte	0x5
	.uleb128 0x53
	.4byte	.LASF445
	.byte	0x5
	.uleb128 0x54
	.4byte	.LASF446
	.byte	0x5
	.uleb128 0x55
	.4byte	.LASF447
	.byte	0x5
	.uleb128 0x5a
	.4byte	.LASF448
	.byte	0x5
	.uleb128 0xb9
	.4byte	.LASF449
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stddef.h.17.843c62562a57aee81b0862358e7a7896,comdat
.Ldebug_macro5:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x11
	.4byte	.LASF450
	.byte	0x5
	.uleb128 0x25
	.4byte	.LASF451
	.byte	0x5
	.uleb128 0x2a
	.4byte	.LASF452
	.byte	0x5
	.uleb128 0x32
	.4byte	.LASF453
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.types.h.46.460eacf32782db15e99728547c2652d4,comdat
.Ldebug_macro6:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x2e
	.4byte	.LASF454
	.byte	0x5
	.uleb128 0x32
	.4byte	.LASF455
	.byte	0x5
	.uleb128 0x36
	.4byte	.LASF456
	.byte	0x5
	.uleb128 0x3a
	.4byte	.LASF457
	.byte	0x5
	.uleb128 0x3d
	.4byte	.LASF458
	.byte	0x5
	.uleb128 0x41
	.4byte	.LASF459
	.byte	0x5
	.uleb128 0x45
	.4byte	.LASF460
	.byte	0x5
	.uleb128 0x49
	.4byte	.LASF461
	.byte	0x5
	.uleb128 0x4d
	.4byte	.LASF462
	.byte	0x5
	.uleb128 0x53
	.4byte	.LASF463
	.byte	0x5
	.uleb128 0x54
	.4byte	.LASF464
	.byte	0x5
	.uleb128 0x55
	.4byte	.LASF465
	.byte	0x5
	.uleb128 0x66
	.4byte	.LASF466
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.string.h.119.5569d807c4450b0b62567ebaa2d9e469,comdat
.Ldebug_macro7:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x77
	.4byte	.LASF467
	.byte	0x5
	.uleb128 0x78
	.4byte	.LASF468
	.byte	0x5
	.uleb128 0x79
	.4byte	.LASF469
	.byte	0x5
	.uleb128 0x7a
	.4byte	.LASF470
	.byte	0x5
	.uleb128 0x7b
	.4byte	.LASF471
	.byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF298:
	.ascii	"__TA_FBIT__ 63\000"
.LASF460:
	.ascii	"LONG_MAX (0x7FFFFFFFFFFFFFFF)\000"
.LASF184:
	.ascii	"__DEC64_SUBNORMAL_MIN__ 0.000000000000001E-383DD\000"
.LASF126:
	.ascii	"__FLT_EVAL_METHOD__ 0\000"
.LASF336:
	.ascii	"__ARM_ARCH_ISA_THUMB 1\000"
.LASF381:
	.ascii	"INTMAX_MIN (-9223372036854775807LL-1)\000"
.LASF60:
	.ascii	"__UINT_FAST8_TYPE__ unsigned int\000"
.LASF507:
	.ascii	"full\000"
.LASF451:
	.ascii	"NULL 0\000"
.LASF111:
	.ascii	"__UINT32_C(c) c ## UL\000"
.LASF416:
	.ascii	"INT16_C(x) (x)\000"
.LASF183:
	.ascii	"__DEC64_EPSILON__ 1E-15DD\000"
.LASF261:
	.ascii	"__ULACCUM_EPSILON__ 0x1P-32ULK\000"
.LASF513:
	.ascii	"overflow\000"
.LASF153:
	.ascii	"__DBL_DENORM_MIN__ double(1.1)\000"
.LASF483:
	.ascii	"char\000"
.LASF107:
	.ascii	"__UINT8_C(c) c\000"
.LASF489:
	.ascii	"~CRingBuffer\000"
.LASF500:
	.ascii	"remove\000"
.LASF273:
	.ascii	"__QQ_IBIT__ 0\000"
.LASF289:
	.ascii	"__UDQ_IBIT__ 0\000"
.LASF10:
	.ascii	"__ATOMIC_RELEASE 3\000"
.LASF327:
	.ascii	"__SIZEOF_WINT_T__ 4\000"
.LASF227:
	.ascii	"__ULLFRACT_FBIT__ 64\000"
.LASF404:
	.ascii	"UINT_FAST8_MAX UINT8_MAX\000"
.LASF316:
	.ascii	"__GCC_ATOMIC_CHAR16_T_LOCK_FREE 1\000"
.LASF67:
	.ascii	"__has_include_next(STR) __has_include_next__(STR)\000"
.LASF459:
	.ascii	"LONG_MIN (0x8000000000000000)\000"
.LASF330:
	.ascii	"__ARM_SIZEOF_WCHAR_T 4\000"
.LASF199:
	.ascii	"__USFRACT_MIN__ 0.0UHR\000"
.LASF4:
	.ascii	"__GNUC_MINOR__ 4\000"
.LASF496:
	.ascii	"_ZN7CARIBOU11CRingBuffer6insertEh\000"
.LASF394:
	.ascii	"UINT_LEAST32_MAX UINT32_MAX\000"
.LASF479:
	.ascii	"unsigned int\000"
.LASF534:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f091/crossworks/../../../../../ca"
	.ascii	"ribou++/src/cringbuffer.cpp\000"
.LASF109:
	.ascii	"__UINT16_C(c) c\000"
.LASF17:
	.ascii	"__SIZEOF_SHORT__ 2\000"
.LASF297:
	.ascii	"__DA_IBIT__ 32\000"
.LASF488:
	.ascii	"mOverflow\000"
.LASF20:
	.ascii	"__SIZEOF_LONG_DOUBLE__ 8\000"
.LASF136:
	.ascii	"__FLT_MAX__ 1.1\000"
.LASF114:
	.ascii	"__INT_FAST8_MAX__ 0x7fffffff\000"
.LASF25:
	.ascii	"__ORDER_BIG_ENDIAN__ 4321\000"
.LASF230:
	.ascii	"__ULLFRACT_MAX__ 0XFFFFFFFFFFFFFFFFP-64ULLR\000"
.LASF188:
	.ascii	"__DEC128_MIN__ 1E-6143DL\000"
.LASF517:
	.ascii	"_ZN7CARIBOU10CByteArray4sizeEv\000"
.LASF306:
	.ascii	"__UTA_FBIT__ 64\000"
.LASF55:
	.ascii	"__UINT_LEAST64_TYPE__ long long unsigned int\000"
.LASF75:
	.ascii	"__INT_MAX__ 0x7fffffff\000"
.LASF32:
	.ascii	"__PTRDIFF_TYPE__ int\000"
.LASF312:
	.ascii	"__CHAR_UNSIGNED__ 1\000"
.LASF41:
	.ascii	"__INT16_TYPE__ short int\000"
.LASF359:
	.ascii	"__ARM 1\000"
.LASF176:
	.ascii	"__DEC32_EPSILON__ 1E-6DF\000"
.LASF158:
	.ascii	"__LDBL_DIG__ 15\000"
.LASF15:
	.ascii	"__SIZEOF_LONG__ 4\000"
.LASF392:
	.ascii	"UINT_LEAST8_MAX UINT8_MAX\000"
.LASF263:
	.ascii	"__LLACCUM_IBIT__ 32\000"
.LASF8:
	.ascii	"__ATOMIC_SEQ_CST 5\000"
.LASF469:
	.ascii	"isnum(c) ( (c)>='0' && (c)<='9' )\000"
.LASF457:
	.ascii	"max(a,b) (((a) > (b)) ? (a) : (b))\000"
.LASF463:
	.ascii	"caribou_lib_lock() chip_interrupts_disable()\000"
.LASF166:
	.ascii	"__LDBL_EPSILON__ 1.1\000"
.LASF464:
	.ascii	"caribou_lib_unlock() chip_interrupts_enable()\000"
.LASF48:
	.ascii	"__INT_LEAST8_TYPE__ signed char\000"
.LASF371:
	.ascii	"INT8_MIN (-128)\000"
.LASF87:
	.ascii	"__UINTMAX_C(c) c ## ULL\000"
.LASF461:
	.ascii	"INT_MIN (0x80000000)\000"
.LASF27:
	.ascii	"__BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__\000"
.LASF177:
	.ascii	"__DEC32_SUBNORMAL_MIN__ 0.000001E-95DF\000"
.LASF213:
	.ascii	"__LFRACT_IBIT__ 0\000"
.LASF447:
	.ascii	"__CTYPE_PRINT (__CTYPE_BLANK | __CTYPE_PUNCT | __CT"
	.ascii	"YPE_UPPER | __CTYPE_LOWER | __CTYPE_DIGIT)\000"
.LASF397:
	.ascii	"INT_FAST16_MIN INT32_MIN\000"
.LASF333:
	.ascii	"__ARM_ARCH 6\000"
.LASF100:
	.ascii	"__INT_LEAST16_MAX__ 0x7fff\000"
.LASF449:
	.ascii	"__MAX_CATEGORY 5\000"
.LASF73:
	.ascii	"__SCHAR_MAX__ 0x7f\000"
.LASF268:
	.ascii	"__ULLACCUM_IBIT__ 32\000"
.LASF191:
	.ascii	"__DEC128_SUBNORMAL_MIN__ 0.000000000000000000000000"
	.ascii	"000000001E-6143DL\000"
.LASF228:
	.ascii	"__ULLFRACT_IBIT__ 0\000"
.LASF390:
	.ascii	"INT_LEAST32_MAX INT32_MAX\000"
.LASF7:
	.ascii	"__ATOMIC_RELAXED 0\000"
.LASF452:
	.ascii	"__RAL_WCHAR_T_DEFINED \000"
.LASF83:
	.ascii	"__SIZE_MAX__ 0xffffffffU\000"
.LASF425:
	.ascii	"WCHAR_MAX 2147483647L\000"
.LASF254:
	.ascii	"__LACCUM_MIN__ (-0X1P31LK-0X1P31LK)\000"
.LASF270:
	.ascii	"__ULLACCUM_MAX__ 0XFFFFFFFFFFFFFFFFP-32ULLK\000"
.LASF259:
	.ascii	"__ULACCUM_MIN__ 0.0ULK\000"
.LASF429:
	.ascii	"__crossworks_H \000"
.LASF468:
	.ascii	"toupper(c) ( ( (c)>='a' && (c)<='z' ) ? ((c)-0x20) "
	.ascii	": (c) )\000"
.LASF353:
	.ascii	"STM32F0xx 1\000"
.LASF337:
	.ascii	"__ARMEL__ 1\000"
.LASF402:
	.ascii	"INT_FAST32_MAX INT32_MAX\000"
.LASF59:
	.ascii	"__INT_FAST64_TYPE__ long long int\000"
.LASF99:
	.ascii	"__INT8_C(c) c\000"
.LASF473:
	.ascii	"signed char\000"
.LASF366:
	.ascii	"CARIBOU_LIB_IRQ_SAFE 1\000"
.LASF269:
	.ascii	"__ULLACCUM_MIN__ 0.0ULLK\000"
.LASF383:
	.ascii	"UINTMAX_MAX 18446744073709551615ULL\000"
.LASF334:
	.ascii	"__APCS_32__ 1\000"
.LASF131:
	.ascii	"__FLT_MIN_EXP__ (-125)\000"
.LASF138:
	.ascii	"__FLT_EPSILON__ 1.1\000"
.LASF357:
	.ascii	"CARIBOU_BITMAP_HEAP 1\000"
.LASF431:
	.ascii	"__RAL_SIZE_T\000"
.LASF418:
	.ascii	"INT32_C(x) (x ##L)\000"
.LASF373:
	.ascii	"INT16_MIN (-32767-1)\000"
.LASF295:
	.ascii	"__SA_IBIT__ 16\000"
.LASF225:
	.ascii	"__LLFRACT_MAX__ 0X7FFFFFFFFFFFFFFFP-63LLR\000"
.LASF453:
	.ascii	"offsetof(s,m) ((size_t)&(((s *)0)->m))\000"
.LASF117:
	.ascii	"__INT_FAST64_MAX__ 0x7fffffffffffffffLL\000"
.LASF414:
	.ascii	"INT8_C(x) (x)\000"
.LASF130:
	.ascii	"__FLT_DIG__ 6\000"
.LASF115:
	.ascii	"__INT_FAST16_MAX__ 0x7fffffff\000"
.LASF426:
	.ascii	"WINT_MIN (-2147483647L-1)\000"
.LASF146:
	.ascii	"__DBL_MIN_10_EXP__ (-37)\000"
.LASF296:
	.ascii	"__DA_FBIT__ 31\000"
.LASF329:
	.ascii	"__ARM_SIZEOF_MINIMAL_ENUM 1\000"
.LASF174:
	.ascii	"__DEC32_MIN__ 1E-95DF\000"
.LASF529:
	.ascii	"index\000"
.LASF124:
	.ascii	"__GCC_IEC_559 0\000"
.LASF481:
	.ascii	"long long unsigned int\000"
.LASF241:
	.ascii	"__USACCUM_EPSILON__ 0x1P-8UHK\000"
.LASF82:
	.ascii	"__PTRDIFF_MAX__ 0x7fffffff\000"
.LASF427:
	.ascii	"WINT_MAX 2147483647L\000"
.LASF260:
	.ascii	"__ULACCUM_MAX__ 0XFFFFFFFFFFFFFFFFP-32ULK\000"
.LASF210:
	.ascii	"__UFRACT_MAX__ 0XFFFFP-16UR\000"
.LASF195:
	.ascii	"__SFRACT_MAX__ 0X7FP-7HR\000"
.LASF344:
	.ascii	"__ARM_EABI__ 1\000"
.LASF106:
	.ascii	"__UINT_LEAST8_MAX__ 0xff\000"
.LASF186:
	.ascii	"__DEC128_MIN_EXP__ (-6142)\000"
.LASF90:
	.ascii	"__INT8_MAX__ 0x7f\000"
.LASF221:
	.ascii	"__ULFRACT_EPSILON__ 0x1P-32ULR\000"
.LASF50:
	.ascii	"__INT_LEAST32_TYPE__ long int\000"
.LASF423:
	.ascii	"UINTMAX_C(x) (x ##ULL)\000"
.LASF218:
	.ascii	"__ULFRACT_IBIT__ 0\000"
.LASF291:
	.ascii	"__UTQ_IBIT__ 0\000"
.LASF112:
	.ascii	"__UINT_LEAST64_MAX__ 0xffffffffffffffffULL\000"
.LASF128:
	.ascii	"__FLT_RADIX__ 2\000"
.LASF150:
	.ascii	"__DBL_MAX__ double(1.1)\000"
.LASF229:
	.ascii	"__ULLFRACT_MIN__ 0.0ULLR\000"
.LASF535:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f091/crossworks\000"
.LASF249:
	.ascii	"__UACCUM_MIN__ 0.0UK\000"
.LASF442:
	.ascii	"__CTYPE_BLANK 0x40\000"
.LASF216:
	.ascii	"__LFRACT_EPSILON__ 0x1P-31LR\000"
.LASF56:
	.ascii	"__INT_FAST8_TYPE__ int\000"
.LASF536:
	.ascii	"CARIBOU\000"
.LASF436:
	.ascii	"__CTYPE_UPPER 0x01\000"
.LASF232:
	.ascii	"__SACCUM_FBIT__ 7\000"
.LASF33:
	.ascii	"__WCHAR_TYPE__ unsigned int\000"
.LASF355:
	.ascii	"USE_STDPERIPH_DRIVER 1\000"
.LASF331:
	.ascii	"__ARM_ARCH_PROFILE 77\000"
.LASF65:
	.ascii	"__UINTPTR_TYPE__ unsigned int\000"
.LASF182:
	.ascii	"__DEC64_MAX__ 9.999999999999999E384DD\000"
.LASF204:
	.ascii	"__FRACT_MIN__ (-0.5R-0.5R)\000"
.LASF145:
	.ascii	"__DBL_MIN_EXP__ (-125)\000"
.LASF84:
	.ascii	"__INTMAX_MAX__ 0x7fffffffffffffffLL\000"
.LASF209:
	.ascii	"__UFRACT_MIN__ 0.0UR\000"
.LASF251:
	.ascii	"__UACCUM_EPSILON__ 0x1P-16UK\000"
.LASF376:
	.ascii	"INT32_MAX 2147483647L\000"
.LASF490:
	.ascii	"clear\000"
.LASF279:
	.ascii	"__DQ_IBIT__ 0\000"
.LASF492:
	.ascii	"_ZN7CARIBOU11CRingBuffer5clearEv\000"
.LASF237:
	.ascii	"__USACCUM_FBIT__ 8\000"
.LASF233:
	.ascii	"__SACCUM_IBIT__ 8\000"
.LASF328:
	.ascii	"__SIZEOF_PTRDIFF_T__ 4\000"
.LASF540:
	.ascii	"_ZN7CARIBOU10CByteArray2atEj\000"
.LASF194:
	.ascii	"__SFRACT_MIN__ (-0.5HR-0.5HR)\000"
.LASF303:
	.ascii	"__USA_IBIT__ 16\000"
.LASF223:
	.ascii	"__LLFRACT_IBIT__ 0\000"
.LASF424:
	.ascii	"WCHAR_MIN (-2147483647L-1)\000"
.LASF142:
	.ascii	"__FLT_HAS_QUIET_NAN__ 1\000"
.LASF156:
	.ascii	"__DBL_HAS_QUIET_NAN__ 1\000"
.LASF362:
	.ascii	"CARIBOUSTRING_H \000"
.LASF18:
	.ascii	"__SIZEOF_FLOAT__ 4\000"
.LASF240:
	.ascii	"__USACCUM_MAX__ 0XFFFFP-8UHK\000"
.LASF497:
	.ascii	"_ZN7CARIBOU11CRingBuffer6insertERNS_10CByteArrayE\000"
.LASF173:
	.ascii	"__DEC32_MAX_EXP__ 97\000"
.LASF485:
	.ascii	"size_t\000"
.LASF3:
	.ascii	"__GNUC__ 5\000"
.LASF349:
	.ascii	"__CROSSWORKS_ARM 1\000"
.LASF313:
	.ascii	"__WCHAR_UNSIGNED__ 1\000"
.LASF68:
	.ascii	"__GXX_WEAK__ 1\000"
.LASF165:
	.ascii	"__LDBL_MIN__ 1.1\000"
.LASF23:
	.ascii	"__BIGGEST_ALIGNMENT__ 8\000"
.LASF253:
	.ascii	"__LACCUM_IBIT__ 32\000"
.LASF147:
	.ascii	"__DBL_MAX_EXP__ 128\000"
.LASF200:
	.ascii	"__USFRACT_MAX__ 0XFFP-8UHR\000"
.LASF118:
	.ascii	"__UINT_FAST8_MAX__ 0xffffffffU\000"
.LASF24:
	.ascii	"__ORDER_LITTLE_ENDIAN__ 1234\000"
.LASF264:
	.ascii	"__LLACCUM_MIN__ (-0X1P31LLK-0X1P31LLK)\000"
.LASF401:
	.ascii	"INT_FAST16_MAX INT32_MAX\000"
.LASF352:
	.ascii	"__CROSSWORKS_REVISION 4\000"
.LASF294:
	.ascii	"__SA_FBIT__ 15\000"
.LASF430:
	.ascii	"__THREAD __thread\000"
.LASF72:
	.ascii	"__GXX_ABI_VERSION 1009\000"
.LASF530:
	.ascii	"bytes\000"
.LASF236:
	.ascii	"__SACCUM_EPSILON__ 0x1P-7HK\000"
.LASF509:
	.ascii	"free\000"
.LASF57:
	.ascii	"__INT_FAST16_TYPE__ int\000"
.LASF471:
	.ascii	"hex(c) ( (c)<0xa ? (c)+'0' : ((c)-0xa)+'A' )\000"
.LASF384:
	.ascii	"INT_LEAST8_MIN INT8_MIN\000"
.LASF45:
	.ascii	"__UINT16_TYPE__ short unsigned int\000"
.LASF315:
	.ascii	"__GCC_ATOMIC_CHAR_LOCK_FREE 1\000"
.LASF285:
	.ascii	"__UHQ_IBIT__ 0\000"
.LASF207:
	.ascii	"__UFRACT_FBIT__ 16\000"
.LASF417:
	.ascii	"UINT16_C(x) (x ##U)\000"
.LASF528:
	.ascii	"_ZN7CARIBOU11CRingBufferD0Ev\000"
.LASF77:
	.ascii	"__LONG_LONG_MAX__ 0x7fffffffffffffffLL\000"
.LASF389:
	.ascii	"INT_LEAST16_MAX INT16_MAX\000"
.LASF43:
	.ascii	"__INT64_TYPE__ long long int\000"
.LASF134:
	.ascii	"__FLT_MAX_10_EXP__ 38\000"
.LASF467:
	.ascii	"tolower(c) ( ( (c)>='A' && (c)<='Z' ) ? ((c)+0x20) "
	.ascii	": (c) )\000"
.LASF265:
	.ascii	"__LLACCUM_MAX__ 0X7FFFFFFFFFFFFFFFP-31LLK\000"
.LASF503:
	.ascii	"resize\000"
.LASF495:
	.ascii	"_ZN7CARIBOU11CRingBufferC4Ev\000"
.LASF266:
	.ascii	"__LLACCUM_EPSILON__ 0x1P-31LLK\000"
.LASF520:
	.ascii	"isNull\000"
.LASF311:
	.ascii	"__NO_INLINE__ 1\000"
.LASF219:
	.ascii	"__ULFRACT_MIN__ 0.0ULR\000"
.LASF129:
	.ascii	"__FLT_MANT_DIG__ 24\000"
.LASF428:
	.ascii	"__stddef_H \000"
.LASF287:
	.ascii	"__USQ_IBIT__ 0\000"
.LASF532:
	.ascii	"nByte\000"
.LASF308:
	.ascii	"__REGISTER_PREFIX__ \000"
.LASF71:
	.ascii	"__cpp_runtime_arrays 198712\000"
.LASF248:
	.ascii	"__UACCUM_IBIT__ 16\000"
.LASF119:
	.ascii	"__UINT_FAST16_MAX__ 0xffffffffU\000"
.LASF61:
	.ascii	"__UINT_FAST16_TYPE__ unsigned int\000"
.LASF458:
	.ascii	"min(a,b) (((a) < (b)) ? (a) : (b))\000"
.LASF439:
	.ascii	"__CTYPE_SPACE 0x08\000"
.LASF387:
	.ascii	"INT_LEAST64_MIN INT64_MIN\000"
.LASF238:
	.ascii	"__USACCUM_IBIT__ 8\000"
.LASF456:
	.ascii	"false ((bool)0)\000"
.LASF356:
	.ascii	"PLL_SOURCE_HSI 1\000"
.LASF305:
	.ascii	"__UDA_IBIT__ 32\000"
.LASF202:
	.ascii	"__FRACT_FBIT__ 15\000"
.LASF395:
	.ascii	"UINT_LEAST64_MAX UINT64_MAX\000"
.LASF368:
	.ascii	"__stdint_H \000"
.LASF476:
	.ascii	"uint8_t\000"
.LASF412:
	.ascii	"INTPTR_MAX INT32_MAX\000"
.LASF391:
	.ascii	"INT_LEAST64_MAX INT64_MAX\000"
.LASF104:
	.ascii	"__INT_LEAST64_MAX__ 0x7fffffffffffffffLL\000"
.LASF242:
	.ascii	"__ACCUM_FBIT__ 15\000"
.LASF318:
	.ascii	"__GCC_ATOMIC_WCHAR_T_LOCK_FREE 1\000"
.LASF179:
	.ascii	"__DEC64_MIN_EXP__ (-382)\000"
.LASF499:
	.ascii	"_ZN7CARIBOU11CRingBuffer4peekEv\000"
.LASF222:
	.ascii	"__LLFRACT_FBIT__ 63\000"
.LASF493:
	.ascii	"CRingBuffer\000"
.LASF518:
	.ascii	"data\000"
.LASF302:
	.ascii	"__USA_FBIT__ 16\000"
.LASF94:
	.ascii	"__UINT8_MAX__ 0xff\000"
.LASF9:
	.ascii	"__ATOMIC_ACQUIRE 2\000"
.LASF95:
	.ascii	"__UINT16_MAX__ 0xffff\000"
.LASF358:
	.ascii	"DEBUG 1\000"
.LASF137:
	.ascii	"__FLT_MIN__ 1.1\000"
.LASF369:
	.ascii	"UINT8_MAX 255\000"
.LASF510:
	.ascii	"_ZN7CARIBOU11CRingBuffer4freeEv\000"
.LASF433:
	.ascii	"__RAL_SIZE_MAX 4294967295UL\000"
.LASF175:
	.ascii	"__DEC32_MAX__ 9.999999E96DF\000"
.LASF212:
	.ascii	"__LFRACT_FBIT__ 31\000"
.LASF438:
	.ascii	"__CTYPE_DIGIT 0x04\000"
.LASF465:
	.ascii	"caribou_lib_lock_restore(n) chip_interrupts_set(n)\000"
.LASF49:
	.ascii	"__INT_LEAST16_TYPE__ short int\000"
.LASF446:
	.ascii	"__CTYPE_GRAPH (__CTYPE_PUNCT | __CTYPE_UPPER | __CT"
	.ascii	"YPE_LOWER | __CTYPE_DIGIT)\000"
.LASF378:
	.ascii	"INT64_MIN (-9223372036854775807LL-1)\000"
.LASF533:
	.ascii	"GNU C++98 5.4.1 20160609 (release) [ARM/embedded-5-"
	.ascii	"branch revision 237715] -fmessage-length=0 -fno-exc"
	.ascii	"eptions -fno-rtti -mtp=soft -mcpu=cortex-m0plus -ml"
	.ascii	"ittle-endian -mfloat-abi=soft -mthumb -fmerge-all-c"
	.ascii	"onstants -g3 -gpubnames -std=gnu++98 -fno-dwarf2-cf"
	.ascii	"i-asm -fno-builtin -ffunction-sections -fdata-secti"
	.ascii	"ons -fshort-double -fshort-enums -fno-common\000"
.LASF1:
	.ascii	"__cplusplus 199711L\000"
.LASF211:
	.ascii	"__UFRACT_EPSILON__ 0x1P-16UR\000"
.LASF321:
	.ascii	"__GCC_ATOMIC_LONG_LOCK_FREE 1\000"
.LASF246:
	.ascii	"__ACCUM_EPSILON__ 0x1P-15K\000"
.LASF288:
	.ascii	"__UDQ_FBIT__ 64\000"
.LASF69:
	.ascii	"__DEPRECATED 1\000"
.LASF454:
	.ascii	"bool char\000"
.LASF290:
	.ascii	"__UTQ_FBIT__ 128\000"
.LASF480:
	.ascii	"long long int\000"
.LASF504:
	.ascii	"length\000"
.LASF314:
	.ascii	"__GCC_ATOMIC_BOOL_LOCK_FREE 1\000"
.LASF52:
	.ascii	"__UINT_LEAST8_TYPE__ unsigned char\000"
.LASF448:
	.ascii	"__RAL_WCHAR_T unsigned\000"
.LASF13:
	.ascii	"__FINITE_MATH_ONLY__ 0\000"
.LASF235:
	.ascii	"__SACCUM_MAX__ 0X7FFFP-7HK\000"
.LASF332:
	.ascii	"__arm__ 1\000"
.LASF157:
	.ascii	"__LDBL_MANT_DIG__ 53\000"
.LASF281:
	.ascii	"__TQ_IBIT__ 0\000"
.LASF300:
	.ascii	"__UHA_FBIT__ 8\000"
.LASF502:
	.ascii	"_ZN7CARIBOU11CRingBuffer6removeEh\000"
.LASF323:
	.ascii	"__GCC_ATOMIC_TEST_AND_SET_TRUEVAL 1\000"
.LASF346:
	.ascii	"__ELF__ 1\000"
.LASF420:
	.ascii	"INT64_C(x) (x ##LL)\000"
.LASF101:
	.ascii	"__INT16_C(c) c\000"
.LASF523:
	.ascii	"_ZN7CARIBOU10CByteArray7isEmptyEv\000"
.LASF97:
	.ascii	"__UINT64_MAX__ 0xffffffffffffffffULL\000"
.LASF255:
	.ascii	"__LACCUM_MAX__ 0X7FFFFFFFFFFFFFFFP-31LK\000"
.LASF116:
	.ascii	"__INT_FAST32_MAX__ 0x7fffffff\000"
.LASF141:
	.ascii	"__FLT_HAS_INFINITY__ 1\000"
.LASF380:
	.ascii	"UINT64_MAX 18446744073709551615ULL\000"
.LASF441:
	.ascii	"__CTYPE_CNTRL 0x20\000"
.LASF505:
	.ascii	"_ZN7CARIBOU11CRingBuffer6resizeEj\000"
.LASF93:
	.ascii	"__INT64_MAX__ 0x7fffffffffffffffLL\000"
.LASF0:
	.ascii	"__STDC__ 1\000"
.LASF444:
	.ascii	"__CTYPE_ALPHA (__CTYPE_UPPER | __CTYPE_LOWER)\000"
.LASF247:
	.ascii	"__UACCUM_FBIT__ 16\000"
.LASF515:
	.ascii	"toByteArray\000"
.LASF310:
	.ascii	"__GNUC_GNU_INLINE__ 1\000"
.LASF12:
	.ascii	"__ATOMIC_CONSUME 1\000"
.LASF419:
	.ascii	"UINT32_C(x) (x ##UL)\000"
.LASF34:
	.ascii	"__WINT_TYPE__ unsigned int\000"
.LASF76:
	.ascii	"__LONG_MAX__ 0x7fffffffL\000"
.LASF91:
	.ascii	"__INT16_MAX__ 0x7fff\000"
.LASF217:
	.ascii	"__ULFRACT_FBIT__ 32\000"
.LASF516:
	.ascii	"size\000"
.LASF19:
	.ascii	"__SIZEOF_DOUBLE__ 4\000"
.LASF244:
	.ascii	"__ACCUM_MIN__ (-0X1P15K-0X1P15K)\000"
.LASF407:
	.ascii	"UINT_FAST64_MAX UINT64_MAX\000"
.LASF388:
	.ascii	"INT_LEAST8_MAX INT8_MAX\000"
.LASF5:
	.ascii	"__GNUC_PATCHLEVEL__ 1\000"
.LASF345:
	.ascii	"__GXX_TYPEINFO_EQUALITY_INLINE 0\000"
.LASF360:
	.ascii	"CARIBOUCRINGBUFFER_H \000"
.LASF205:
	.ascii	"__FRACT_MAX__ 0X7FFFP-15R\000"
.LASF81:
	.ascii	"__WINT_MIN__ 0U\000"
.LASF257:
	.ascii	"__ULACCUM_FBIT__ 32\000"
.LASF508:
	.ascii	"_ZN7CARIBOU11CRingBuffer4fullEv\000"
.LASF514:
	.ascii	"_ZN7CARIBOU11CRingBuffer8overflowEv\000"
.LASF203:
	.ascii	"__FRACT_IBIT__ 0\000"
.LASF526:
	.ascii	"_ZN7CARIBOU11CRingBufferC2Ev\000"
.LASF169:
	.ascii	"__LDBL_HAS_INFINITY__ 1\000"
.LASF125:
	.ascii	"__GCC_IEC_559_COMPLEX 0\000"
.LASF96:
	.ascii	"__UINT32_MAX__ 0xffffffffUL\000"
.LASF377:
	.ascii	"INT32_MIN (-2147483647L-1)\000"
.LASF159:
	.ascii	"__LDBL_MIN_EXP__ (-1021)\000"
.LASF326:
	.ascii	"__SIZEOF_WCHAR_T__ 4\000"
.LASF338:
	.ascii	"__THUMBEL__ 1\000"
.LASF28:
	.ascii	"__FLOAT_WORD_ORDER__ __ORDER_LITTLE_ENDIAN__\000"
.LASF245:
	.ascii	"__ACCUM_MAX__ 0X7FFFFFFFP-15K\000"
.LASF208:
	.ascii	"__UFRACT_IBIT__ 0\000"
.LASF171:
	.ascii	"__DEC32_MANT_DIG__ 7\000"
.LASF152:
	.ascii	"__DBL_EPSILON__ double(1.1)\000"
.LASF89:
	.ascii	"__SIG_ATOMIC_MIN__ (-__SIG_ATOMIC_MAX__ - 1)\000"
.LASF226:
	.ascii	"__LLFRACT_EPSILON__ 0x1P-63LLR\000"
.LASF421:
	.ascii	"UINT64_C(x) (x ##ULL)\000"
.LASF162:
	.ascii	"__LDBL_MAX_10_EXP__ 308\000"
.LASF192:
	.ascii	"__SFRACT_FBIT__ 7\000"
.LASF38:
	.ascii	"__CHAR32_TYPE__ long unsigned int\000"
.LASF193:
	.ascii	"__SFRACT_IBIT__ 0\000"
.LASF531:
	.ascii	"nLength\000"
.LASF343:
	.ascii	"__ARM_PCS 1\000"
.LASF275:
	.ascii	"__HQ_IBIT__ 0\000"
.LASF477:
	.ascii	"uint16_t\000"
.LASF309:
	.ascii	"__USER_LABEL_PREFIX__ \000"
.LASF434:
	.ascii	"__RAL_PTRDIFF_T int\000"
.LASF54:
	.ascii	"__UINT_LEAST32_TYPE__ long unsigned int\000"
.LASF278:
	.ascii	"__DQ_FBIT__ 63\000"
.LASF301:
	.ascii	"__UHA_IBIT__ 8\000"
.LASF524:
	.ascii	"this\000"
.LASF370:
	.ascii	"INT8_MAX 127\000"
.LASF325:
	.ascii	"__PRAGMA_REDEFINE_EXTNAME 1\000"
.LASF375:
	.ascii	"UINT32_MAX 4294967295UL\000"
.LASF74:
	.ascii	"__SHRT_MAX__ 0x7fff\000"
.LASF26:
	.ascii	"__ORDER_PDP_ENDIAN__ 3412\000"
.LASF277:
	.ascii	"__SQ_IBIT__ 0\000"
.LASF539:
	.ascii	"CByteArray\000"
.LASF135:
	.ascii	"__FLT_DECIMAL_DIG__ 9\000"
.LASF348:
	.ascii	"__SHORT_DOUBLES 1\000"
.LASF92:
	.ascii	"__INT32_MAX__ 0x7fffffffL\000"
.LASF6:
	.ascii	"__VERSION__ \"5.4.1 20160609 (release) [ARM/embedde"
	.ascii	"d-5-branch revision 237715]\"\000"
.LASF484:
	.ascii	"sizetype\000"
.LASF190:
	.ascii	"__DEC128_EPSILON__ 1E-33DL\000"
.LASF538:
	.ascii	"_ZN7CARIBOU11CRingBuffer11toByteArrayEv\000"
.LASF282:
	.ascii	"__UQQ_FBIT__ 8\000"
.LASF470:
	.ascii	"ishex(c) isnum(c) || ( toupper(c)>='A' && toupper(c"
	.ascii	")<='F' )\000"
.LASF475:
	.ascii	"short int\000"
.LASF250:
	.ascii	"__UACCUM_MAX__ 0XFFFFFFFFP-16UK\000"
.LASF88:
	.ascii	"__SIG_ATOMIC_MAX__ 0x7fffffff\000"
.LASF486:
	.ascii	"mHead\000"
.LASF180:
	.ascii	"__DEC64_MAX_EXP__ 385\000"
.LASF284:
	.ascii	"__UHQ_FBIT__ 16\000"
.LASF42:
	.ascii	"__INT32_TYPE__ long int\000"
.LASF482:
	.ascii	"long int\000"
.LASF365:
	.ascii	"CONSOLE_USART 0\000"
.LASF161:
	.ascii	"__LDBL_MAX_EXP__ 1024\000"
.LASF276:
	.ascii	"__SQ_FBIT__ 31\000"
.LASF262:
	.ascii	"__LLACCUM_FBIT__ 31\000"
.LASF214:
	.ascii	"__LFRACT_MIN__ (-0.5LR-0.5LR)\000"
.LASF411:
	.ascii	"INTPTR_MIN INT32_MIN\000"
.LASF187:
	.ascii	"__DEC128_MAX_EXP__ 6145\000"
.LASF30:
	.ascii	"__GNUG__ 5\000"
.LASF435:
	.ascii	"__CODE \000"
.LASF110:
	.ascii	"__UINT_LEAST32_MAX__ 0xffffffffUL\000"
.LASF396:
	.ascii	"INT_FAST8_MIN INT8_MIN\000"
.LASF335:
	.ascii	"__thumb__ 1\000"
.LASF252:
	.ascii	"__LACCUM_FBIT__ 31\000"
.LASF170:
	.ascii	"__LDBL_HAS_QUIET_NAN__ 1\000"
.LASF40:
	.ascii	"__INT8_TYPE__ signed char\000"
.LASF80:
	.ascii	"__WINT_MAX__ 0xffffffffU\000"
.LASF522:
	.ascii	"isEmpty\000"
.LASF406:
	.ascii	"UINT_FAST32_MAX UINT32_MAX\000"
.LASF494:
	.ascii	"insert\000"
.LASF280:
	.ascii	"__TQ_FBIT__ 127\000"
.LASF201:
	.ascii	"__USFRACT_EPSILON__ 0x1P-8UHR\000"
.LASF379:
	.ascii	"INT64_MAX 9223372036854775807LL\000"
.LASF121:
	.ascii	"__UINT_FAST64_MAX__ 0xffffffffffffffffULL\000"
.LASF120:
	.ascii	"__UINT_FAST32_MAX__ 0xffffffffU\000"
.LASF197:
	.ascii	"__USFRACT_FBIT__ 8\000"
.LASF105:
	.ascii	"__INT64_C(c) c ## LL\000"
.LASF274:
	.ascii	"__HQ_FBIT__ 15\000"
.LASF78:
	.ascii	"__WCHAR_MAX__ 0xffffffffU\000"
.LASF16:
	.ascii	"__SIZEOF_LONG_LONG__ 8\000"
.LASF283:
	.ascii	"__UQQ_IBIT__ 0\000"
.LASF44:
	.ascii	"__UINT8_TYPE__ unsigned char\000"
.LASF403:
	.ascii	"INT_FAST64_MAX INT64_MAX\000"
.LASF322:
	.ascii	"__GCC_ATOMIC_LLONG_LOCK_FREE 1\000"
.LASF521:
	.ascii	"_ZN7CARIBOU10CByteArray6isNullEv\000"
.LASF317:
	.ascii	"__GCC_ATOMIC_CHAR32_T_LOCK_FREE 1\000"
.LASF51:
	.ascii	"__INT_LEAST64_TYPE__ long long int\000"
.LASF450:
	.ascii	"__RAL_SIZE_T_DEFINED \000"
.LASF46:
	.ascii	"__UINT32_TYPE__ long unsigned int\000"
.LASF160:
	.ascii	"__LDBL_MIN_10_EXP__ (-307)\000"
.LASF29:
	.ascii	"__SIZEOF_POINTER__ 4\000"
.LASF527:
	.ascii	"_ZN7CARIBOU11CRingBufferD2Ev\000"
.LASF340:
	.ascii	"__VFP_FP__ 1\000"
.LASF525:
	.ascii	"__in_chrg\000"
.LASF220:
	.ascii	"__ULFRACT_MAX__ 0XFFFFFFFFP-32ULR\000"
.LASF292:
	.ascii	"__HA_FBIT__ 7\000"
.LASF386:
	.ascii	"INT_LEAST32_MIN INT32_MIN\000"
.LASF437:
	.ascii	"__CTYPE_LOWER 0x02\000"
.LASF472:
	.ascii	"inherited CByteArray\000"
.LASF234:
	.ascii	"__SACCUM_MIN__ (-0X1P7HK-0X1P7HK)\000"
.LASF324:
	.ascii	"__GCC_ATOMIC_POINTER_LOCK_FREE 1\000"
.LASF113:
	.ascii	"__UINT64_C(c) c ## ULL\000"
.LASF256:
	.ascii	"__LACCUM_EPSILON__ 0x1P-31LK\000"
.LASF413:
	.ascii	"UINTPTR_MAX UINT32_MAX\000"
.LASF196:
	.ascii	"__SFRACT_EPSILON__ 0x1P-7HR\000"
.LASF70:
	.ascii	"__cpp_binary_literals 201304\000"
.LASF286:
	.ascii	"__USQ_FBIT__ 32\000"
.LASF293:
	.ascii	"__HA_IBIT__ 8\000"
.LASF519:
	.ascii	"_ZN7CARIBOU10CByteArray4dataEv\000"
.LASF258:
	.ascii	"__ULACCUM_IBIT__ 32\000"
.LASF511:
	.ascii	"empty\000"
.LASF354:
	.ascii	"STM32F0XX 1\000"
.LASF139:
	.ascii	"__FLT_DENORM_MIN__ 1.1\000"
.LASF22:
	.ascii	"__CHAR_BIT__ 8\000"
.LASF21:
	.ascii	"__SIZEOF_SIZE_T__ 4\000"
.LASF206:
	.ascii	"__FRACT_EPSILON__ 0x1P-15R\000"
.LASF2:
	.ascii	"__STDC_HOSTED__ 1\000"
.LASF122:
	.ascii	"__INTPTR_MAX__ 0x7fffffff\000"
.LASF66:
	.ascii	"__has_include(STR) __has_include__(STR)\000"
.LASF339:
	.ascii	"__SOFTFP__ 1\000"
.LASF347:
	.ascii	"__SIZEOF_WCHAR_T 4\000"
.LASF399:
	.ascii	"INT_FAST64_MIN INT64_MIN\000"
.LASF374:
	.ascii	"INT16_MAX 32767\000"
.LASF98:
	.ascii	"__INT_LEAST8_MAX__ 0x7f\000"
.LASF37:
	.ascii	"__CHAR16_TYPE__ short unsigned int\000"
.LASF409:
	.ascii	"PTRDIFF_MAX INT32_MAX\000"
.LASF133:
	.ascii	"__FLT_MAX_EXP__ 128\000"
.LASF350:
	.ascii	"__CROSSWORKS_MAJOR_VERSION 3\000"
.LASF11:
	.ascii	"__ATOMIC_ACQ_REL 4\000"
.LASF63:
	.ascii	"__UINT_FAST64_TYPE__ long long unsigned int\000"
.LASF243:
	.ascii	"__ACCUM_IBIT__ 16\000"
.LASF474:
	.ascii	"unsigned char\000"
.LASF172:
	.ascii	"__DEC32_MIN_EXP__ (-94)\000"
.LASF36:
	.ascii	"__UINTMAX_TYPE__ long long unsigned int\000"
.LASF432:
	.ascii	"__RAL_SIZE_T unsigned\000"
.LASF443:
	.ascii	"__CTYPE_XDIGIT 0x80\000"
.LASF64:
	.ascii	"__INTPTR_TYPE__ int\000"
.LASF127:
	.ascii	"__DEC_EVAL_METHOD__ 2\000"
.LASF239:
	.ascii	"__USACCUM_MIN__ 0.0UHK\000"
.LASF537:
	.ascii	"_ZN7CARIBOU11CRingBufferC4ERKS0_\000"
.LASF198:
	.ascii	"__USFRACT_IBIT__ 0\000"
.LASF506:
	.ascii	"_ZN7CARIBOU11CRingBuffer6lengthEv\000"
.LASF62:
	.ascii	"__UINT_FAST32_TYPE__ unsigned int\000"
.LASF185:
	.ascii	"__DEC128_MANT_DIG__ 34\000"
.LASF398:
	.ascii	"INT_FAST32_MIN INT32_MIN\000"
.LASF167:
	.ascii	"__LDBL_DENORM_MIN__ 1.1\000"
.LASF148:
	.ascii	"__DBL_MAX_10_EXP__ 38\000"
.LASF512:
	.ascii	"_ZN7CARIBOU11CRingBuffer5emptyEv\000"
.LASF31:
	.ascii	"__SIZE_TYPE__ unsigned int\000"
.LASF267:
	.ascii	"__ULLACCUM_FBIT__ 32\000"
.LASF415:
	.ascii	"UINT8_C(x) (x ##U)\000"
.LASF363:
	.ascii	"_CARIBOU_TYPES_H_ \000"
.LASF319:
	.ascii	"__GCC_ATOMIC_SHORT_LOCK_FREE 1\000"
.LASF445:
	.ascii	"__CTYPE_ALNUM (__CTYPE_UPPER | __CTYPE_LOWER | __CT"
	.ascii	"YPE_DIGIT)\000"
.LASF307:
	.ascii	"__UTA_IBIT__ 64\000"
.LASF422:
	.ascii	"INTMAX_C(x) (x ##LL)\000"
.LASF132:
	.ascii	"__FLT_MIN_10_EXP__ (-37)\000"
.LASF440:
	.ascii	"__CTYPE_PUNCT 0x10\000"
.LASF455:
	.ascii	"true ((bool)1)\000"
.LASF79:
	.ascii	"__WCHAR_MIN__ 0U\000"
.LASF155:
	.ascii	"__DBL_HAS_INFINITY__ 1\000"
.LASF58:
	.ascii	"__INT_FAST32_TYPE__ int\000"
.LASF487:
	.ascii	"mTail\000"
.LASF14:
	.ascii	"__SIZEOF_INT__ 4\000"
.LASF149:
	.ascii	"__DBL_DECIMAL_DIG__ 9\000"
.LASF35:
	.ascii	"__INTMAX_TYPE__ long long int\000"
.LASF85:
	.ascii	"__INTMAX_C(c) c ## LL\000"
.LASF405:
	.ascii	"UINT_FAST16_MAX UINT32_MAX\000"
.LASF143:
	.ascii	"__DBL_MANT_DIG__ 24\000"
.LASF400:
	.ascii	"INT_FAST8_MAX INT8_MAX\000"
.LASF372:
	.ascii	"UINT16_MAX 65535\000"
.LASF47:
	.ascii	"__UINT64_TYPE__ long long unsigned int\000"
.LASF382:
	.ascii	"INTMAX_MAX 9223372036854775807LL\000"
.LASF408:
	.ascii	"PTRDIFF_MIN INT32_MIN\000"
.LASF320:
	.ascii	"__GCC_ATOMIC_INT_LOCK_FREE 1\000"
.LASF478:
	.ascii	"short unsigned int\000"
.LASF341:
	.ascii	"__THUMB_INTERWORK__ 1\000"
.LASF299:
	.ascii	"__TA_IBIT__ 64\000"
.LASF272:
	.ascii	"__QQ_FBIT__ 7\000"
.LASF53:
	.ascii	"__UINT_LEAST16_TYPE__ short unsigned int\000"
.LASF144:
	.ascii	"__DBL_DIG__ 6\000"
.LASF151:
	.ascii	"__DBL_MIN__ double(1.1)\000"
.LASF385:
	.ascii	"INT_LEAST16_MIN INT16_MIN\000"
.LASF189:
	.ascii	"__DEC128_MAX__ 9.999999999999999999999999999999999E"
	.ascii	"6144DL\000"
.LASF501:
	.ascii	"_ZN7CARIBOU11CRingBuffer6removeEv\000"
.LASF163:
	.ascii	"__DECIMAL_DIG__ 17\000"
.LASF103:
	.ascii	"__INT32_C(c) c ## L\000"
.LASF367:
	.ascii	"NEW_TAKES_SIZE_T \000"
.LASF393:
	.ascii	"UINT_LEAST16_MAX UINT16_MAX\000"
.LASF123:
	.ascii	"__UINTPTR_MAX__ 0xffffffffU\000"
.LASF154:
	.ascii	"__DBL_HAS_DENORM__ 1\000"
.LASF466:
	.ascii	"ASSERT(x) \000"
.LASF491:
	.ascii	"_ZN7CARIBOU11CRingBufferD4Ev\000"
.LASF215:
	.ascii	"__LFRACT_MAX__ 0X7FFFFFFFP-31LR\000"
.LASF304:
	.ascii	"__UDA_FBIT__ 32\000"
.LASF351:
	.ascii	"__CROSSWORKS_MINOR_VERSION 7\000"
.LASF364:
	.ascii	"_CARIBOU_CONFIG_H_ \000"
.LASF102:
	.ascii	"__INT_LEAST32_MAX__ 0x7fffffffL\000"
.LASF164:
	.ascii	"__LDBL_MAX__ 1.1\000"
.LASF181:
	.ascii	"__DEC64_MIN__ 1E-383DD\000"
.LASF498:
	.ascii	"peek\000"
.LASF342:
	.ascii	"__ARM_ARCH_6M__ 1\000"
.LASF86:
	.ascii	"__UINTMAX_MAX__ 0xffffffffffffffffULL\000"
.LASF39:
	.ascii	"__SIG_ATOMIC_TYPE__ int\000"
.LASF410:
	.ascii	"SIZE_MAX INT32_MAX\000"
.LASF224:
	.ascii	"__LLFRACT_MIN__ (-0.5LLR-0.5LLR)\000"
.LASF361:
	.ascii	"_CARIBOU_CBYTEARRAY_H_ \000"
.LASF231:
	.ascii	"__ULLFRACT_EPSILON__ 0x1P-64ULLR\000"
.LASF168:
	.ascii	"__LDBL_HAS_DENORM__ 1\000"
.LASF108:
	.ascii	"__UINT_LEAST16_MAX__ 0xffff\000"
.LASF462:
	.ascii	"INT_MAX (0x7FFFFFFF)\000"
.LASF271:
	.ascii	"__ULLACCUM_EPSILON__ 0x1P-32ULLK\000"
.LASF178:
	.ascii	"__DEC64_MANT_DIG__ 16\000"
.LASF140:
	.ascii	"__FLT_HAS_DENORM__ 1\000"
	.ident	"GCC: (GNU) 5.4.1 20160609 (release) [ARM/embedded-5-branch revision 237715]"
