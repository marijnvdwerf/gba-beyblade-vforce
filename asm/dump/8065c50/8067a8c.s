	.include "asm/common.inc"

	thumb_func_start sub_8067A8C
sub_8067A8C:
	push	{r4, r5, lr}
	add	r5, r0, #0
	add	r4, r1, #0
	add	r3, r5, #0
	cmp	r2, #0x3
	bls	.L7	@cond_branch
	mov	r0, #0x3
	and	r0, r0, r5
	cmp	r0, #0
	bne	.L7	@cond_branch
	add	r1, r5, #0
	mov	r0, #0xff
	and	r4, r4, r0
	lsl	r3, r4, #0x8
	orr	r3, r3, r4
	lsl	r0, r3, #0x10
	orr	r3, r3, r0
	cmp	r2, #0xf
	bls	.L5	@cond_branch
.L4:
	stmia	r1!, {r3}
	stmia	r1!, {r3}
	stmia	r1!, {r3}
	stmia	r1!, {r3}
	sub	r2, r2, #0x10
	cmp	r2, #0xf
	bhi	.L4	@cond_branch
	b	.L5
.L6:
	stmia	r1!, {r3}
	sub	r2, r2, #0x4
.L5:
	cmp	r2, #0x3
	bhi	.L6	@cond_branch
	add	r3, r1, #0
	b	.L7
.L8:
	strb	r4, [r3]
	add	r3, r3, #0x1
.L7:
	add	r0, r2, #0
	sub	r2, r2, #0x1
	cmp	r0, #0
	bne	.L8	@cond_branch
	add	r0, r5, #0
	pop	{r4, r5, pc}
	thumb_func_end sub_8067A8C

.align 2, 0 @ Don't pad with nop.
