	.include "asm/common.inc"

	thumb_func_start sub_805AB58
sub_805AB58:
	mov	r1, #0x0
	ldr	r0, .L805AB68
	ldrh	r0, [r0]
	cmp	r0, #0x2
	bne	.L805AB64	@cond_branch
	mov	r1, #0x1
.L805AB64:
	add	r0, r1, #0
	bx	lr
.L805AB68:
	.align	2, 0

	.4byte	0x3005ca4
	thumb_func_end sub_805AB58

.align 2, 0 @ Don't pad with nop.
