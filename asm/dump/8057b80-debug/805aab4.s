	.include "asm/common.inc"

	thumb_func_start sub_805AAB4
sub_805AAB4:
	push	{r4, lr}
	ldr	r1, .L1
	ldr	r2, .L1 + 4
	ldrh	r3, [r1]
	ldrh	r4, [r2]
	sub	r0, r3, r4
	strh	r0, [r1]
	mov	r0, #0x0
	strh	r0, [r2]
	pop	{r4}
	pop	{r0}
	bx	r0
.L2:
	.align	2, 0
.L1:
	.4byte	0x3005db8
	.4byte	0x3005db4
	thumb_func_end sub_805AAB4

.align 2, 0 @ Don't pad with nop.
