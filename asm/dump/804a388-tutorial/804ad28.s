	.include "asm/common.inc"

	thumb_func_start sub_804AD28
sub_804AD28:
	push	{lr}
	ldr	r0, .L1
	ldrh	r0, [r0]
	bl	sub_804AFD4
	ldr	r1, .L1 + 4
	mov	r0, #0x0
	strh	r0, [r1]
	pop	{r0}
	bx	r0
.L2:
	.align	2, 0
.L1:
	.4byte	0x3000f14
	.4byte	0x3000f1c
	thumb_func_end sub_804AD28

.align 2, 0 @ Don't pad with nop.
