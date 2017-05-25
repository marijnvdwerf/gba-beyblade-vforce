	.include "asm/common.inc"

	thumb_func_start sub_805EEE0
sub_805EEE0:
	add	r1, r0, #0
	mov	r2, #0x88
	lsl	r2, r2, #0x2
	add	r0, r1, r2
	ldr	r0, [r0]
	add	r0, r0, #0x80
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L1	@cond_branch
	add	r2, r2, #0x8
	add	r0, r1, r2
	b	.L2
.L1:
	mov	r0, #0x0
.L2:
	bx	lr
	thumb_func_end sub_805EEE0

.align 2, 0 @ Don't pad with nop.
