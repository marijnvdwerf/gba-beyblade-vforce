	.include "asm/common.inc"

	thumb_func_start sub_804AF9C
sub_804AF9C:
	push	{lr}
	ldr	r0, .L1
	ldr	r0, [r0]
	ldr	r1, .L1 + 4
	add	r0, r0, r1
	ldr	r0, [r0]
	bl	Sound_8062AA4
	pop	{r0}
	bx	r0
.L2:
	.align	2, 0
.L1:
	.4byte	0x3000fb0
	.4byte	0xc2c
	thumb_func_end sub_804AF9C

.align 2, 0 @ Don't pad with nop.
