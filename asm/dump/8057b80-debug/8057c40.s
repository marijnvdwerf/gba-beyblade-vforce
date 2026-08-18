	.include "asm/common.inc"

	thumb_func_start sub_8057C40
sub_8057C40:
	ldr	r0, .L8057C48
	ldr	r0, [r0]
	bx	lr
.L8057C46:
	.align	2, 0
.L8057C48:
	.4byte	0x3000e30
	thumb_func_end sub_8057C40

.align 2, 0 @ Don't pad with nop.
