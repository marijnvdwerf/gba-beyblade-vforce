	.include "asm/common.inc"

	thumb_func_start sub_805D610
sub_805D610:
	push	{r4, lr}
	add	r4, r0, #0
	add	r0, r0, #0x90
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L2	@cond_branch
	ldr	r3, [r0, #0x4]
	cmp	r3, #0
	beq	.L2	@cond_branch
	add	r0, r4, #0
	add	r0, r0, #0x80
	ldr	r1, [r0]
	add	r0, r0, #0x4
	ldr	r2, [r0]
	add	r0, r4, #0
	bl	_call_via_r3
.L2:
	add	r0, r4, #0
	add	r0, r0, #0x80
	mov	r2, #0x0
	str	r2, [r0]
	add	r1, r4, #0
	add	r1, r1, #0x84
	mov	r0, #0x1
	NEG	r0, r0
	str	r0, [r1]
	add	r0, r4, #0
	add	r0, r0, #0x88
	str	r2, [r0]
	pop	{r4}
	pop	{r0}
	bx	r0
	thumb_func_end sub_805D610

.align 2, 0 @ Don't pad with nop.
