	.include "asm/common.inc"

	thumb_func_start sub_8063190
sub_8063190:
	add	r3, r0, #0
	ldr	r0, [r3, #0x4]
	cmp	r1, r0
	bge	.L1	@cond_branch
	ldr	r2, .L3
	ldr	r0, [r3]
	add	r0, r0, r1
	mov	r1, #0xc4
	mul	r1, r1, r0
	ldr	r0, [r2]
	add	r0, r0, r1
	b	.L2
.L4:
	.align	2, 0
.L3:
	.4byte	0x3005e68
.L1:
	mov	r0, #0x0
.L2:
	bx	lr
	thumb_func_end sub_8063190

.align 2, 0 @ Don't pad with nop.
