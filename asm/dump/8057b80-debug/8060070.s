	.include "asm/common.inc"

	thumb_func_start sub_8060070
sub_8060070:
	ldr	r0, .L3
	ldr	r0, [r0]
	ldr	r0, [r0, #0x14]
	mov	r1, #0x2
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L1	@cond_branch
	mov	r0, #0x0
	b	.L2
.L4:
	.align	2, 0
.L3:
	.4byte	0x3005dc4
.L1:
	mov	r0, #0x1
.L2:
	bx	lr
	thumb_func_end sub_8060070

.align 2, 0 @ Don't pad with nop.
