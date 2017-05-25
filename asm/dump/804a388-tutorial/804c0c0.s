	.include "asm/common.inc"

	thumb_func_start sub_804C0C0
sub_804C0C0:
	push	{r4, lr}
	add	r2, r0, #0
	mov	r1, #0xf3
	lsl	r1, r1, #0x2
	add	r0, r2, r1
	mov	r1, #0x4
	ldrh	r3, [r0]
	orr	r1, r1, r3
	strh	r1, [r0]
	mov	r0, #0xf1
	lsl	r0, r0, #0x2
	add	r4, r2, r0
	ldr	r0, [r4]
	cmp	r0, #0
	beq	.L1	@cond_branch
	bl	sub_8060A94
.L1:
	mov	r0, #0x0
	str	r0, [r4]
	pop	{r4}
	pop	{r0}
	bx	r0
	thumb_func_end sub_804C0C0

.align 2, 0 @ Don't pad with nop.
