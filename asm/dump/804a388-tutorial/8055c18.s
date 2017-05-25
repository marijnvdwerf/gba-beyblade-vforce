	.include "asm/common.inc"

	thumb_func_start sub_8055C18
sub_8055C18:
	add	r2, r0, #0
	lsl	r1, r1, #0x18
	cmp	r1, #0
	bne	.L1	@cond_branch
	mov	r0, #0x1
	ldrh	r2, [r2, #0x28]
	b	.L2
.L1:
	mov	r0, #0x1
	ldrh	r2, [r2, #0x2a]
.L2:
	and	r0, r0, r2
	bx	lr
	thumb_func_end sub_8055C18

.align 2, 0 @ Don't pad with nop.
