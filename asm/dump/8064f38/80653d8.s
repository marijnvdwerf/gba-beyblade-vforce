	.include "asm/common.inc"

	thumb_func_start sub_80653D8
sub_80653D8:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xfffffff4
	str	r0, [sp]
	mov	r0, #0x0
	mov	sl, r0
	mov	r1, #0x0
	str	r1, [sp, #0x4]
	mov	r2, #0x0
	str	r2, [sp, #0x8]
	ldr	r1, [sp]
	ldr	r0, [r1, #0x8]
	cmp	r0, #0
	bge	.L80653FC	@cond_branch
	NEG	r0, r0
.L80653FC:
	add	r7, r0, #0
	ldr	r2, [sp]
	ldrb	r0, [r2, #0x4]
	sub	r0, r0, #0x1
	lsl	r0, r0, #0x10
	b	.L80654EA
.L8065408:
	asr	r1, r1, #0x10
	mov	r0, #0xc4
	mul	r1, r1, r0
	ldr	r2, [sp]
	ldr	r0, [r2]
	add	r4, r0, r1
	cmp	r7, #0
	ble	.L8065424	@cond_branch
	add	r0, r7, #0
	mov	r1, #0xa
	bl	DivRem
	add	r2, r0, #0
	b	.L8065426
.L8065424:
	mov	r2, #0x0
.L8065426:
	ldr	r1, [sp, #0x4]
	lsl	r0, r1, #0x10
	asr	r1, r0, #0x10
	mov	r8, r0
	cmp	r1, #0x2
	ble	.L8065464	@cond_branch
	cmp	r7, #0
	ble	.L8065464	@cond_branch
	sub	r0, r1, #3
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	str	r0, [sp, #0x4]
	mov	r2, #0x1
	NEG	r2, r2
	str	r2, [r4, #0x70]
	ldr	r0, .L8065460
	ldrb	r2, [r0]
	add	r0, r4, #0
	mov	r1, #0x0
	bl	ActorSetFrame
	mov	r1, sl
	lsl	r0, r1, #0x10
	mov	r2, #0x80
	lsl	r2, r2, #0x9
	add	r0, r0, r2
	lsr	r0, r0, #0x10
	mov	sl, r0
	b	.L80654E2
.L8065460:
	.align	2, 0

	.4byte	0x807d9ac
.L8065464:
	mov	r0, sl
	lsl	r6, r0, #0x10
	cmp	r2, #0
	bne	.L80654AE	@cond_branch
	cmp	r7, #0
	bne	.L80654AE	@cond_branch
	asr	r5, r6, #0x10
	cmp	r5, #0
	beq	.L80654AE	@cond_branch
	ldr	r1, [sp]
	ldr	r0, [r1, #0x8]
	cmp	r0, #0
	bge	.L80654A8	@cond_branch
	ldr	r2, [sp, #0x8]
	cmp	r2, #0
	bne	.L80654A8	@cond_branch
	mov	r0, #0x1
	NEG	r0, r0
	str	r0, [r4, #0x70]
	ldr	r1, .L80654A4
	ldrb	r2, [r1]
	add	r0, r4, #0
	mov	r1, #0x0
	bl	ActorSetFrame
	mov	r2, #0x1
	str	r2, [sp, #0x8]
	add	r0, r5, #1
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	mov	sl, r0
	b	.L80654D4
.L80654A4:
	.align	2, 0

	.4byte	0x807d9ad
.L80654A8:
	mov	r0, #0x0
	str	r0, [r4, #0x70]
	b	.L80654D4
.L80654AE:
	mov	r0, #0x1
	NEG	r0, r0
	str	r0, [r4, #0x70]
	add	r2, r2, #0x34
	lsl	r2, r2, #0x10
	lsr	r2, r2, #0x10
	add	r0, r4, #0
	mov	r1, #0x0
	bl	ActorSetFrame
	mov	r1, #0x80
	lsl	r1, r1, #0x9
	add	r0, r6, r1
	lsr	r0, r0, #0x10
	mov	sl, r0
	add	r0, r1, #0
	ADD r0, r8
	lsr	r0, r0, #0x10
	str	r0, [sp, #0x4]
.L80654D4:
	cmp	r7, #0
	ble	.L80654E2	@cond_branch
	add	r0, r7, #0
	mov	r1, #0xa
	bl	Div
	add	r7, r0, #0
.L80654E2:
	mov	r2, r9
	lsl	r0, r2, #0x10
	ldr	r1, .L8065504
	add	r0, r0, r1
.L80654EA:
	lsr	r0, r0, #0x10
	mov	r9, r0
	lsl	r1, r0, #0x10
	cmp	r1, #0
	bge	.L8065408	@cond_branch
	add	sp, sp, #0xc
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L8065504:
	.align	2, 0

	.4byte	0xffff0000
	thumb_func_end sub_80653D8

.align 2, 0 @ Don't pad with nop.
