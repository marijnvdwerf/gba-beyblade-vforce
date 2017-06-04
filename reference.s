	.include "asm/common.inc"

	thumb_func_start sub_8062BFC
sub_8062BFC:
	push	{lr}
	add	r2, r0, #0
	add	r3, r1, #0
	ldr	r0, .L2
	ldr	r1, [r0]
	ldr	r0, [r1, #0x4]
	cmp	r2, r0
	bcs	.L1	@cond_branch
	ldr	r1, [r1, #0xc]
	lsl	r0, r2, #0x2
	add	r0, r0, r1
	ldr	r0, [r0]
	add	r1, r3, #0
	bl	sub_80629F0
.L1:
	pop	{r1}
	bx	r1
.L3:
	.align	2, 0
.L2:
	.4byte	0x3005e14
	thumb_func_end sub_8062BFC

.align 2, 0 @ Don't pad with nop.
