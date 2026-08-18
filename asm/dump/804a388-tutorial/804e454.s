	.include "asm/common.inc"

	thumb_func_start sub_804E454
sub_804E454:
	add	r0, r0, #0xa0
	ldr	r0, [r0]
	and	r0, r0, r1
	cmp	r0, r1
	beq	.L804E462	@cond_branch
	mov	r0, #0x0
	b	.L804E464
.L804E462:
	mov	r0, #0x1
.L804E464:
	bx	lr
	thumb_func_end sub_804E454

.align 2, 0 @ Don't pad with nop.
