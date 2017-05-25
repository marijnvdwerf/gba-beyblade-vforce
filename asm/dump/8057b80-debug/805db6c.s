	.include "asm/common.inc"

	thumb_func_start sub_805DB6C
sub_805DB6C:
	ldr	r2, [r0, #0xc]
	ldr	r0, [r0]
	ldr	r0, [r0, #0x8]
	cmp	r1, r0
	blt	.L1	@cond_branch
	mov	r0, #0x0
	b	.L2
.L1:
	lsl	r0, r1, #0x5
	add	r0, r2, r0
.L2:
	bx	lr
	thumb_func_end sub_805DB6C

.align 2, 0 @ Don't pad with nop.
