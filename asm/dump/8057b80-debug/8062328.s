	.include "asm/common.inc"

	thumb_func_start sub_8062328
sub_8062328:
	add	r1, r0, #0
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	cmp	r1, r0
	bls	.L1	@cond_branch
	add	r1, r0, #0
.L1:
	ldr	r0, .L2
	strh	r1, [r0]
	bx	lr
.L3:
	.align	2, 0
.L2:
	.4byte	0x3000da0
	thumb_func_end sub_8062328

.align 2, 0 @ Don't pad with nop.
