	.include "asm/common.inc"

	thumb_func_start sub_804FE14
sub_804FE14:
	ldr	r0, .L1
	ldr	r0, [r0]
	ldr	r1, .L1 + 4
	add	r0, r0, r1
	mov	r1, #0x1
	ldrh	r2, [r0]
	orr	r1, r1, r2
	strh	r1, [r0]
	bx	lr
.L2:
	.align	2, 0
.L1:
	.4byte	0x3000fb0
	.4byte	0x105e
	thumb_func_end sub_804FE14

.align 2, 0 @ Don't pad with nop.
