	.include "asm/common.inc"

	thumb_func_start sub_8053954
sub_8053954:
	push	{lr}
	ldr	r3, .L1
	ldr	r0, [r3]
	ldr	r2, .L1 + 4
	add	r0, r0, r2
	mov	r1, #0x5
	strb	r1, [r0]
	ldr	r0, [r3]
	add	r0, r0, r2
	ldrb	r0, [r0]
	bl	sub_804F800
	pop	{r0}
	bx	r0
.L2:
	.align	2, 0
.L1:
	.4byte	0x3000fb0
	.4byte	0x1638
	thumb_func_end sub_8053954

.align 2, 0 @ Don't pad with nop.
