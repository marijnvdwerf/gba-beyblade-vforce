	.include "asm/common.inc"

	thumb_func_start sub_8061130
sub_8061130:
	lsl	r1, r1, #0x18
	ldr	r3, [r0, #0x10]
	ldr	r2, .L1
	and	r3, r3, r2
	mov	r2, #0xc0
	lsl	r2, r2, #0x12
	and	r2, r2, r1
	lsr	r2, r2, #0xe
	orr	r3, r3, r2
	str	r3, [r0, #0x10]
	bx	lr
.L2:
	.align	2, 0
.L1:
	.4byte	0xfffff3ff
	thumb_func_end sub_8061130

.align 2, 0 @ Don't pad with nop.
