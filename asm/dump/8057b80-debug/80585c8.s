	.include "asm/common.inc"

	thumb_func_start sub_80585C8
sub_80585C8:
	add	r3, r0, #0
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	add	r2, r3, #0
	add	r2, r2, #0x98
	ldrb	r0, [r2]
	cmp	r1, r0
	beq	.L1	@cond_branch
	ldr	r0, .L2
	ldr	r0, [r0]
	str	r0, [r3, #0x58]
.L1:
	strb	r1, [r2]
	bx	lr
.L3:
	.align	2, 0
.L2:
	.4byte	0x3000e30
	thumb_func_end sub_80585C8

.align 2, 0 @ Don't pad with nop.
