	.include "asm/common.inc"

	thumb_func_start sub_805EB00
sub_805EB00:
	push	{r4, r5, lr}
	add	r5, r0, #0
	ldr	r1, .L805EB44
	ldr	r2, .L805EB44 + 4
	add	r0, r5, r2
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	strh	r0, [r1]
	mov	r3, #0x89
	lsl	r3, r3, #0x2
	add	r0, r5, r3
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L805EB5E	@cond_branch
	mov	r4, #0xd5
	lsl	r4, r4, #0x2
	add	r2, r5, r4
	ldrb	r1, [r2]
	mov	r0, #0x1
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L805EB56	@cond_branch
	mov	r1, #0xd1
	lsl	r1, r1, #0x2
	add	r0, r5, r1
	ldr	r2, [r0]
	cmp	r2, #0
	bne	.L805EB4C	@cond_branch
	add	r0, r5, #0
	bl	sub_805EBCC
	b	.L805EB5E
.L805EB42:
	.align	2, 0
.L805EB44:
	.4byte	0x4000054
	.4byte	0x355
.L805EB4C:
	add	r0, r3, #0
	add	r1, r5, #0
	bl	_call_via_r2
	b	.L805EB5E
.L805EB56:
	mov	r0, #0x2
	neg	r0, r0
	and	r0, r0, r1
	strb	r0, [r2]
.L805EB5E:
	mov	r4, #0x0
.L805EB60:
	mov	r2, #0x88
	lsl	r2, r2, #0x2
	add	r0, r5, r2
	ldr	r1, [r0]
	lsl	r0, r4, #0x1
	add	r0, r0, r4
	lsl	r0, r0, #0x3
	add	r1, r1, #0x14
	add	r1, r1, r0
	ldr	r0, [r1]
	cmp	r0, #0
	beq	.L805EB84	@cond_branch
	lsl	r0, r4, #0x4
	add	r0, r0, r4
	lsl	r0, r0, #0x3
	add	r0, r5, r0
	bl	sub_8058EF4
.L805EB84:
	add	r0, r4, #1
	lsl	r0, r0, #0x18
	lsr	r4, r0, #0x18
	cmp	r4, #0x3
	bls	.L805EB60	@cond_branch
	ldr	r3, .L805EBC0
	add	r2, r5, r3
	ldr	r4, .L805EBC0 + 4
	add	r1, r5, r4
	ldrb	r3, [r2]
	ldrb	r4, [r1]
	add	r0, r3, r4
	mov	r3, #0x0
	strb	r0, [r2]
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bge	.L805EBAA	@cond_branch
	strb	r3, [r2]
	strb	r3, [r1]
.L805EBAA:
	mov	r0, #0x0
	ldsb	r0, [r2, r0]
	cmp	r0, #0xf
	ble	.L805EBB8	@cond_branch
	mov	r0, #0xf
	strb	r0, [r2]
	strb	r3, [r1]
.L805EBB8:
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L805EBBE:
	.align	2, 0
.L805EBC0:
	.4byte	0x355
	.4byte	0x356
	thumb_func_end sub_805EB00

.align 2, 0 @ Don't pad with nop.
