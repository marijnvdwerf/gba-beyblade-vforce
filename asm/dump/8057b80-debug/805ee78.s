	.include "asm/common.inc"

	thumb_func_start sub_805EE78
sub_805EE78:
	push	{lr}
	add	r2, r0, #0
	mov	r3, #0x89
	lsl	r3, r3, #0x2
	add	r0, r2, r3
	str	r1, [r0]
	mov	r3, #0xd2
	lsl	r3, r3, #0x2
	add	r0, r2, r3
	ldr	r3, [r0]
	cmp	r3, #0
	bne	.L1	@cond_branch
	add	r0, r2, #0
	bl	sub_805ED60
	b	.L2
.L1:
	add	r0, r1, #0
	add	r1, r2, #0
	bl	call_via_r3
.L2:
	pop	{r0}
	bx	r0
	thumb_func_end sub_805EE78

.align 2, 0 @ Don't pad with nop.
