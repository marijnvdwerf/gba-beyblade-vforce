	.include "asm/common.inc"

	thumb_func_start sub_8067A2C
sub_8067A2C:
	push	{r4, r5, lr}
	add	r5, r0, #0
	add	r4, r5, #0
	add	r3, r1, #0
	cmp	r2, #0xf
	bls	.L2	@cond_branch
	add	r0, r3, #0
	orr	r0, r0, r5
	mov	r1, #0x3
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L2	@cond_branch
	add	r1, r5, #0
.L3:
	ldmia	r3!, {r0}
	stmia	r1!, {r0}
	ldmia	r3!, {r0}
	stmia	r1!, {r0}
	ldmia	r3!, {r0}
	stmia	r1!, {r0}
	ldmia	r3!, {r0}
	stmia	r1!, {r0}
	sub	r2, r2, #0x10
	cmp	r2, #0xf
	bhi	.L3	@cond_branch
	cmp	r2, #0x3
	bls	.L4	@cond_branch
.L5:
	ldmia	r3!, {r0}
	stmia	r1!, {r0}
	sub	r2, r2, #0x4
	cmp	r2, #0x3
	bhi	.L5	@cond_branch
.L4:
	add	r4, r1, #0
.L2:
	sub	r2, r2, #0x1
	mov	r0, #0x1
	NEG	r0, r0
	cmp	r2, r0
	beq	.L6	@cond_branch
	add	r1, r0, #0
.L7:
	ldrb	r0, [r3]
	strb	r0, [r4]
	add	r3, r3, #0x1
	add	r4, r4, #0x1
	sub	r2, r2, #0x1
	cmp	r2, r1
	bne	.L7	@cond_branch
.L6:
	add	r0, r5, #0
	pop	{r4, r5, pc}
	thumb_func_end sub_8067A2C

.align 2, 0 @ Don't pad with nop.
