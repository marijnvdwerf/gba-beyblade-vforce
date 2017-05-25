	.include "asm/common.inc"

	thumb_func_start sub_8053920
sub_8053920:
	push	{lr}
	ldr	r3, .L2
	ldr	r0, [r3]
	ldr	r2, .L2 + 4
	add	r0, r0, r2
	ldrb	r1, [r0]
	add	r1, r1, #0x1
	strb	r1, [r0]
	ldr	r0, [r3]
	add	r1, r0, r2
	ldrb	r0, [r1]
	cmp	r0, #0x5
	bls	.L1	@cond_branch
	mov	r0, #0x5
	strb	r0, [r1]
.L1:
	ldr	r0, [r3]
	add	r0, r0, r2
	ldrb	r0, [r0]
	bl	sub_804F800
	pop	{r0}
	bx	r0
.L3:
	.align	2, 0
.L2:
	.4byte	0x3000fb0
	.4byte	0x1638
	thumb_func_end sub_8053920

.align 2, 0 @ Don't pad with nop.
