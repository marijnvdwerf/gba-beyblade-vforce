	.include "asm/common.inc"

	thumb_func_start sub_80655C0
sub_80655C0:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xfffffffc
	mov	r9, r0
	ldr	r0, [sp, #0x24]
	lsl	r2, r2, #0x10
	lsr	r2, r2, #0x10
	lsl	r3, r3, #0x10
	lsr	r3, r3, #0x10
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	str	r0, [sp]
	mov	r0, #0x0
	mov	r8, r0
	cmp	r1, #0
	bge	.L1	@cond_branch
	NEG	r1, r1
.L1:
	add	r6, r1, #0
	lsl	r0, r2, #0x10
	asr	r4, r0, #0x10
	mov	r1, r9
	ldrb	r1, [r1, #0x4]
	cmp	r4, r1
	blt	.L2	@cond_branch
	mov	r0, #0x0
	b	.L3
.L2:
	lsr	r7, r0, #0x10
	lsl	r2, r7, #0x10
	asr	r1, r2, #0x10
	lsl	r0, r3, #0x10
	asr	r0, r0, #0x10
	sub	r0, r4, r0
	mov	r3, #0x0
	cmp	r1, r0
	ble	.L10	@cond_branch
	mov	sl, r0
.L13:
	asr	r1, r2, #0x10
	mov	r0, #0xc4
	mul	r1, r1, r0
	mov	r2, r9
	ldr	r0, [r2]
	add	r4, r0, r1
	cmp	r6, #0
	ble	.L5	@cond_branch
	add	r0, r6, #0
	mov	r1, #0xa
	bl	Mod
	add	r2, r0, #0
	b	.L6
.L5:
	mov	r2, #0x0
.L6:
	cmp	r2, #0
	bne	.L9	@cond_branch
	cmp	r6, #0
	bne	.L9	@cond_branch
	mov	r1, r8
	lsl	r0, r1, #0x10
	asr	r5, r0, #0x10
	add	r3, r0, #0
	cmp	r5, #0
	beq	.L9	@cond_branch
	ldr	r2, [sp]
	cmp	r2, #0
	beq	.L10	@cond_branch
	mov	r0, #0x1
	NEG	r0, r0
	str	r0, [r4, #0x70]
	add	r0, r4, #0
	mov	r1, #0x0
	mov	r2, #0x34
	bl	ActorSetFrame
	add	r0, r5, #1
	lsl	r0, r0, #0x10
	b	.L11
.L9:
	mov	r0, #0x1
	NEG	r0, r0
	str	r0, [r4, #0x70]
	add	r2, r2, #0x34
	lsl	r2, r2, #0x10
	lsr	r2, r2, #0x10
	add	r0, r4, #0
	mov	r1, #0x0
	bl	ActorSetFrame
	mov	r1, r8
	lsl	r0, r1, #0x10
	mov	r2, #0x80
	lsl	r2, r2, #0x9
	add	r0, r0, r2
.L11:
	lsr	r0, r0, #0x10
	mov	r8, r0
	cmp	r6, #0
	ble	.L12	@cond_branch
	add	r0, r6, #0
	mov	r1, #0xa
	bl	Div
	add	r6, r0, #0
.L12:
	lsl	r0, r7, #0x10
	ldr	r1, .L14
	add	r0, r0, r1
	lsr	r7, r0, #0x10
	lsl	r2, r7, #0x10
	asr	r0, r2, #0x10
	mov	r1, r8
	lsl	r3, r1, #0x10
	cmp	r0, sl
	bgt	.L13	@cond_branch
.L10:
	lsr	r0, r3, #0x10
.L3:
	add	sp, sp, #0x4
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.L15:
	.align	2, 0
.L14:
	.4byte	0xffff0000
	thumb_func_end sub_80655C0

.align 2, 0 @ Don't pad with nop.
