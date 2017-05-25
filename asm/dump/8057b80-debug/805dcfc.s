	.include "asm/common.inc"

	thumb_func_start sub_805DCFC
sub_805DCFC:
	add	r3, r1, #0
	cmp	r3, #0
	beq	.L2	@cond_branch
	ldr	r1, [r3]
	lsl	r0, r1, #0x2
	add	r0, r0, #0x20
	add	r3, r3, r0
	cmp	r2, r1
	bge	.L2	@cond_branch
	lsl	r0, r2, #0x4
	add	r0, r3, r0
	b	.L3
.L2:
	mov	r0, #0x0
.L3:
	bx	lr
	thumb_func_end sub_805DCFC

.align 2, 0 @ Don't pad with nop.
