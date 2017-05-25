	.include "asm/common.inc"

	thumb_func_start sub_80679E0
sub_80679E0:
	push	{r4, r5, r6, lr}
	add	r6, r1, #0
	add	r5, r0, #0
	cmp	r2, #0
	beq	.L1	@cond_branch
	mov	r0, #0x20
	sub	r0, r0, r2
	cmp	r0, #0
	bgt	.L2	@cond_branch
	mov	r4, #0x0
	NEG	r0, r0
	add	r3, r6, #0
	LSR	r3, r0
	b	.L3
.L2:
	add	r1, r6, #0
	LSL	r1, r0
	add	r4, r6, #0
	LSR	r4, r2
	add	r0, r5, #0
	LSR	r0, r2
	add	r3, r0, #0
	orr	r3, r3, r1
.L3:
	add	r1, r4, #0
	add	r0, r3, #0
.L1:
	pop	{r4, r5, r6, pc}
	thumb_func_end sub_80679E0

.align 2, 0 @ Don't pad with nop.
