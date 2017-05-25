	.include "asm/common.inc"

	thumb_func_start sub_8058754
sub_8058754:
	push	{lr}
	add	r2, r0, #0
	add	r0, r0, #0xb0
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L1	@cond_branch
	add	r0, r2, #0
	bl	call_via_r3
	b	.L2
.L1:
	ldr	r0, [r2, #0x4]
	str	r0, [r1]
	ldr	r0, [r2, #0x8]
	str	r0, [r1, #0x4]
	ldr	r0, [r2, #0xc]
	str	r0, [r1, #0x8]
.L2:
	pop	{r0}
	bx	r0
	thumb_func_end sub_8058754

.align 2, 0 @ Don't pad with nop.
