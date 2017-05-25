	.include "asm/common.inc"

	thumb_func_start sub_804C098
sub_804C098:
	push	{r4, r5, lr}
	add	r5, r0, #0
	mov	r0, #0xf0
	lsl	r0, r0, #0x2
	add	r4, r5, r0
	ldr	r0, [r4]
	cmp	r0, #0
	beq	.L1	@cond_branch
	bl	sub_8060A94
	mov	r0, #0x0
	str	r0, [r4]
.L1:
	mov	r0, #0xf9
	lsl	r0, r0, #0x2
	add	r1, r5, r0
	mov	r0, #0x0
	str	r0, [r1]
	pop	{r4, r5}
	pop	{r0}
	bx	r0
	thumb_func_end sub_804C098

.align 2, 0 @ Don't pad with nop.
