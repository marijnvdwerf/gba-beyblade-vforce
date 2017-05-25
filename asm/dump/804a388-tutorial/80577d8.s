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
	bl	sub_8066084
	add	r7, r0, #0
	add	r6, r7, #0
	lsl	r0, r5, #0x8
	add	r1, r4, #0
	bl	sub_8066084
	add	r5, r0, #0
	add	r3, r0, #0
	cmp	r3, #0
	bge	.L1	@cond_branch
	NEG	r3, r3
.L1:
	cmp	r3, #0x80
	bgt	.L2	@cond_branch
	asr	r0, r0, #0x1
	NEG	r0, r0
	add	r4, r7, #0
	b	.L3
.L2:
	asr	r0, r6, #0x1
	add	r4, r5, #0
.L3:
	ldr	r1, .L7
	lsl	r0, r0, #0x10
	asr	r0, r0, #0x10
	add	r0, r0, #0x80
	add	r0, r0, r1
	ldrb	r2, [r0]
	cmp	r4, #0
	bge	.L4	@cond_branch
	mov	r0, #0xff
	sub	r2, r0, r2
.L4:
	cmp	r3, #0x80
	ble	.L6	@cond_branch
	add	r2, r2, #0x40
	cmp	r2, #0xff
	ble	.L6	@cond_branch
	ldr	r0, .L7 + 4
	add	r2, r2, r0
.L6:
	add	r0, r2, #0
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.L8:
	.align	2, 0
.L7:
	.4byte	0x874cebc
	.4byte	0xffffff00
	thumb_func_end sub_80577D8

.align 2, 0 @ Don't pad with nop.
