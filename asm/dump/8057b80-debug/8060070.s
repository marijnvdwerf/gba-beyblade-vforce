	.include "asm/common.inc"

	thumb_func_start sub_8060070
sub_8060070:
	ldr	r0, .L8060084
	ldr	r0, [r0]
	ldr	r0, [r0, #0x14]
	mov	r1, #0x2
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L8060088	@cond_branch
	mov	r0, #0x0
	b	.L806008A
.L8060082:
	.align	2, 0
.L8060084:
	.4byte	0x3005dc4
.L8060088:
	mov	r0, #0x1
.L806008A:
	bx	lr
	thumb_func_end sub_8060070

.align 2, 0 @ Don't pad with nop.
