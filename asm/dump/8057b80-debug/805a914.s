	.include "asm/common.inc"

	thumb_func_start sub_805A914
sub_805A914:
	lsl	r0, r0, #0x18
	lsr	r1, r0, #0x18
	cmp	r1, #0x9
	bhi	.L1	@cond_branch
	lsl	r0, r1, #0x1
	add	r0, r0, r1
	lsl	r0, r0, #0x3
	ldr	r1, .L3
	add	r0, r0, r1
	b	.L2
.L4:
	.align	2, 0
.L3:
	.4byte	0x3005cb0
.L1:
	mov	r0, #0x0
.L2:
	bx	lr
	thumb_func_end sub_805A914

.align 2, 0 @ Don't pad with nop.
