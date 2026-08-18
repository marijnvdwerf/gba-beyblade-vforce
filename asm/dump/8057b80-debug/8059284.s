	.include "asm/common.inc"

	thumb_func_start sub_8059284
sub_8059284:
	push	{r4, r5, lr}
	add	r3, r0, #0
	lsl	r1, r1, #0x10
	lsl	r2, r2, #0x10
	lsr	r2, r2, #0x10
	lsr	r1, r1, #0x1e
	add	r0, r1, #0
	mov	r5, #0x1
	and	r2, r2, r5
	cmp	r2, #0
	beq	.L80592AA	@cond_branch
	lsl	r0, r1, #0x1
	add	r0, r0, #0x8
	add	r4, r5, #0
	LSL	r4, r0
	add	r1, r1, #0x4
	add	r0, r3, #0
	add	r0, r0, #0x5f
	b	.L8059300
.L80592AA:
	cmp	r1, #0x1
	beq	.L80592CE	@cond_branch
	cmp	r1, #0x1
	bgt	.L80592B8	@cond_branch
	cmp	r1, #0
	beq	.L80592C2	@cond_branch
	b	.L8059306
.L80592B8:
	cmp	r0, #0x2
	beq	.L80592E2	@cond_branch
	cmp	r0, #0x3
	beq	.L80592F6	@cond_branch
	b	.L8059306
.L80592C2:
	mov	r4, #0x80
	lsl	r4, r4, #0x4
	add	r0, r3, #0
	add	r0, r0, #0x5f
	mov	r1, #0x5
	b	.L8059300
.L80592CE:
	mov	r4, #0x80
	lsl	r4, r4, #0x5
	add	r1, r3, #0
	add	r1, r1, #0x5f
	mov	r0, #0x6
	strb	r0, [r1]
	add	r1, r1, #0x1
	mov	r0, #0x5
	strb	r0, [r1]
	b	.L8059306
.L80592E2:
	mov	r4, #0x80
	lsl	r4, r4, #0x5
	add	r1, r3, #0
	add	r1, r1, #0x5f
	mov	r0, #0x5
	strb	r0, [r1]
	add	r1, r1, #0x1
	mov	r0, #0x6
	strb	r0, [r1]
	b	.L8059306
.L80592F6:
	mov	r4, #0x80
	lsl	r4, r4, #0x6
	add	r0, r3, #0
	add	r0, r0, #0x5f
	mov	r1, #0x6
.L8059300:
	strb	r1, [r0]
	add	r0, r0, #0x1
	strb	r1, [r0]
.L8059306:
	add	r0, r4, #0
	pop	{r4, r5}
	pop	{r1}
	bx	r1
	thumb_func_end sub_8059284

.align 2, 0 @ Don't pad with nop.
