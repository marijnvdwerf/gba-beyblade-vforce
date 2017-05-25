	.include "asm/common.inc"

	thumb_func_start sub_8055B64
sub_8055B64:
	add	r2, r0, #0
	lsl	r1, r1, #0x18
	cmp	r1, #0
	beq	.L1	@cond_branch
	mov	r0, #0xae
	lsl	r0, r0, #0x8
	str	r0, [r2, #0x20]
	b	.L2
.L1:
	mov	r0, #0x80
	lsl	r0, r0, #0x5
	str	r0, [r2, #0x18]
.L2:
	bx	lr
	thumb_func_end sub_8055B64

.align 2, 0 @ Don't pad with nop.
