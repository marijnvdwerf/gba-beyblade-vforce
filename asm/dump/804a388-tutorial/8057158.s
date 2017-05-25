	.include "asm/common.inc"

	thumb_func_start sub_8057158
sub_8057158:
	mov	r2, #0x0
	strh	r2, [r0]
	str	r1, [r0, #0x4]
	strh	r2, [r0, #0x2]
	bx	lr
	thumb_func_end sub_8057158

.align 2, 0 @ Don't pad with nop.
