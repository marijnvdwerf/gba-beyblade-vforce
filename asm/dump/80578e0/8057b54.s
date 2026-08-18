	.include "asm/common.inc"

	thumb_func_start sub_8057B54
sub_8057B54:
	ldr	r1, .L8057B60
	mov	r0, #0x0
	str	r0, [r1, #0x4]
	str	r0, [r1]
	bx	lr
.L8057B5E:
	.align	2, 0
.L8057B60:
	.4byte	0x3000ee0
	thumb_func_end sub_8057B54

.align 2, 0 @ Don't pad with nop.
