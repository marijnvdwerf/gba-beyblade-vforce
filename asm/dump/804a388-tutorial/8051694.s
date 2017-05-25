	.include "asm/common.inc"

	thumb_func_start sub_8051694
sub_8051694:
	push	{lr}
	bl	sub_80516B0
	add	r1, r0, #0
	lsl	r0, r1, #0x2
	add	r0, r0, r1
	lsl	r0, r0, #0x4
	ldr	r1, .L1
	add	r0, r0, r1
	pop	{r1}
	bx	r1
.L2:
	.align	2, 0
.L1:
	.4byte	0x807582c
	thumb_func_end sub_8051694

.align 2, 0 @ Don't pad with nop.
