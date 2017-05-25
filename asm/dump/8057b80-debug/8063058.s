	.include "asm/common.inc"

	thumb_func_start sub_8063058
sub_8063058:
	ldr	r0, .L3
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L1	@cond_branch
.L2:
	ldr	r0, [r0, #0x10]
	cmp	r0, #0
	bne	.L2	@cond_branch
.L1:
	bx	lr
.L4:
	.align	2, 0
.L3:
	.4byte	0x3005e60
	thumb_func_end sub_8063058

.align 2, 0 @ Don't pad with nop.
