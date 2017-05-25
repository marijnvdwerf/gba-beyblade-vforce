	.include "asm/common.inc"

	thumb_func_start sub_80603E8
sub_80603E8:
	ldr	r0, .L2
	ldr	r2, [r0]
	ldr	r0, [r2, #0x1c]
	cmp	r0, #0
	bne	.L1	@cond_branch
	ldr	r0, [r2, #0x14]
	mov	r1, #0x80
	lsl	r1, r1, #0x3
	orr	r0, r0, r1
	str	r0, [r2, #0x14]
.L1:
	bx	lr
.L3:
	.align	2, 0
.L2:
	.4byte	0x3005dc4
	thumb_func_end sub_80603E8

.align 2, 0 @ Don't pad with nop.
