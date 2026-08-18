	.include "asm/common.inc"

	thumb_func_start sub_804AFB8
sub_804AFB8:
	push	{lr}
	ldr	r0, .L804AFCC
	ldr	r0, [r0]
	ldr	r1, .L804AFCC + 4
	add	r0, r0, r1
	ldr	r0, [r0]
	bl	Sound_8062AB8
	pop	{r0}
	bx	r0
.L804AFCC:
	.align	2, 0

	.4byte	0x3000fb0
	.4byte	0xc2c
	thumb_func_end sub_804AFB8

.align 2, 0 @ Don't pad with nop.
