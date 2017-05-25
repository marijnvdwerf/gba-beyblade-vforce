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
	bge	.L1	@cond_branch
	NEG	r0, r0
.L1:
	add	r7, r0, #0
	ldr	r2, [sp]
	ldrb	r0, [r2, #0x4]
	sub	r0, r0, #0x1
	lsl	r0, r0, #0x10
	b	.L2
.L20:
	asr	r1, r1, #0x10
	mov	r0, #0xc4
	mul	r1, r1, r0
	ldr	r2, [sp]
	ldr	r0, [r2]
	add	r4, r0, r1
	cmp	r7, #0
	ble	.L3	@cond_branch
	add	r0, r7, #0
	mov	r1, #0xa
	bl	Mod
	add	r2, r0, #0
	b	.L4
.L3:
	mov	r2, #0x0
.L4:
	ldr	r1, [sp, #0x4]
	lsl	r0, r1, #0x10
	asr	r1, r0, #0x10
	mov	r8, r0
	cmp	r1, #0x2
	ble	.L6	@cond_branch
	cmp	r7, #0
	ble	.L6	@cond_branch
	sub	r0, r1, #3
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	str	r0, [sp, #0x4]
	mov	r2, #0x1
	NEG	r2, r2
	str	r2, [r4, #0x70]
	ldr	r0, .L8
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
	b	.L19
.L9:
	.align	2, 0
.L8:
	.4byte	0x807d9ac
.L6:
	mov	r0, sl
	lsl	r6, r0, #0x10
	cmp	r2, #0
	bne	.L12	@cond_branch
	cmp	r7, #0
	bne	.L12	@cond_branch
	asr	r5, r6, #0x10
	cmp	r5, #0
	beq	.L12	@cond_branch
	ldr	r1, [sp]
	ldr	r0, [r1, #0x8]
	cmp	r0, #0
	bge	.L14	@cond_branch
	ldr	r2, [sp, #0x8]
	cmp	r2, #0
	bne	.L14	@cond_branch
	mov	r0, #0x1
	NEG	r0, r0
	str	r0, [r4, #0x70]
	ldr	r1, .L16
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
	b	.L18
.L17:
	.align	2, 0
.L16:
	.4byte	0x807d9ad
.L14:
	mov	r0, #0x0
	str	r0, [r4, #0x70]
	b	.L18
.L12:
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
.L18:
	cmp	r7, #0
	ble	.L19	@cond_branch
	add	r0, r7, #0
	mov	r1, #0xa
	bl	Div
	add	r7, r0, #0
.L19:
	mov	r2, r9
	lsl	r0, r2, #0x10
	ldr	r1, .L21
	add	r0, r0, r1
.L2:
	lsr	r0, r0, #0x10
	mov	r9, r0
	lsl	r1, r0, #0x10
	cmp	r1, #0
	bge	.L20	@cond_branch
	add	sp, sp, #0xc
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L22:
	.align	2, 0
.L21:
	.4byte	0xffff0000
	thumb_func_end sub_80653D8

.align 2, 0 @ Don't pad with nop.
