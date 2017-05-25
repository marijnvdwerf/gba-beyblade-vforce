	.include "asm/common.inc"

	thumb_func_start sub_804A364
sub_804A364:
	push	{lr}
	ldr	r0, .L1
	ldr	r0, [r0]
	bl	sub_804A378
	pop	{r1}
	bx	r1
.L2:
	.align	2, 0
.L1:
	.4byte	0x3000c00
	thumb_func_end sub_804A364

.align 2, 0 @ Don't pad with nop.
