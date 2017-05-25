	.include "asm/common.inc"

	thumb_func_start sub_8049210
sub_8049210:
	add	r1, r0, #0
	ldr	r2, .L2
	add	r0, r2, #0
	add	r0, r0, #0xb4
	ldr	r0, [r0]
	ldr	r0, [r0, #0x4]
	ldr	r0, [r0, #0x1c]
	cmp	r1, r0
	bcc	.L1	@cond_branch
	sub	r1, r0, #1
.L1:
	add	r1, r1, #0x1
	add	r0, r2, #0
	add	r0, r0, #0x7d
	strb	r1, [r0]
	bx	lr
.L3:
	.align	2, 0
.L2:
	.4byte	0x3000650
	thumb_func_end sub_8049210

.align 2, 0 @ Don't pad with nop.
