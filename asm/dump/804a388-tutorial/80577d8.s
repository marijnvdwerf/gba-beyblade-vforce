	.include "asm/common.inc"

	thumb_func_start sub_80577D8
sub_80577D8:
	push	{r4, r5, r6, r7, lr}
	ldr	r3, [r2]
	lsl	r3, r3, #0x4
	ldr	r4, [r1, #0x4]
	add	r3, r4, r3
	ldr	r1, [r2, #0x4]
	lsl	r1, r1, #0x4
	add	r4, r4, r1
	ldr	r2, [r3]
	ldr	r1, [r4]
	add	r2, r2, r1
	lsl	r2, r2, #0x4
	ldr	r1, [r3, #0x4]
	ldr	r3, [r4, #0x4]
	add	r1, r1, r3
	lsl	r1, r1, #0x4
	ldr	r3, [r0, #0x4]
	sub	r2, r2, r3
	asr	r6, r2, #0x8
	ldr	r0, [r0, #0x8]
	sub	r1, r1, r0
	asr	r5, r1, #0x8
	add	r0, r6, #0
	mul	r0, r0, r6
	add	r1, r5, #0
	mul	r1, r1, r5
	add	r0, r0, r1
	bl	Sqrt
	add	r4, r0, #0
	lsl	r4, r4, #0x10
	lsr	r4, r4, #0x10
	lsl	r0, r6, #0x8
	add	r1, r4, #0
	bl	__divsi3
	add	r7, r0, #0
	add	r6, r7, #0
	lsl	r0, r5, #0x8
	add	r1, r4, #0
	bl	__divsi3
	add	r5, r0, #0
	add	r3, r0, #0
	cmp	r3, #0
	bge	.L8057836	@cond_branch
	neg	r3, r3
.L8057836:
	cmp	r3, #0x80
	bgt	.L8057842	@cond_branch
	asr	r0, r0, #0x1
	neg	r0, r0
	add	r4, r7, #0
	b	.L8057846
.L8057842:
	asr	r0, r6, #0x1
	add	r4, r5, #0
.L8057846:
	ldr	r1, .L8057870
	lsl	r0, r0, #0x10
	asr	r0, r0, #0x10
	add	r0, r0, #0x80
	add	r0, r0, r1
	ldrb	r2, [r0]
	cmp	r4, #0
	bge	.L805785A	@cond_branch
	mov	r0, #0xff
	sub	r2, r0, r2
.L805785A:
	cmp	r3, #0x80
	ble	.L8057868	@cond_branch
	add	r2, r2, #0x40
	cmp	r2, #0xff
	ble	.L8057868	@cond_branch
	ldr	r0, .L8057870 + 4
	add	r2, r2, r0
.L8057868:
	add	r0, r2, #0
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.L8057870:
	.align	2, 0

	.4byte	Unk_874CEBC
	.4byte	0xffffff00
	thumb_func_end sub_80577D8

.align 2, 0 @ Don't pad with nop.
