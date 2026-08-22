	.include "asm/common.inc"

	thumb_func_start sub_804E3B0
sub_804E3B0:
	push	{r4, r5, lr}
	sub	r3, r1, r0
	add	r5, r3, #0
	cmp	r3, #0
	bge	.L804E3BC	@cond_branch
	neg	r3, r3
.L804E3BC:
	add	r0, r2, #1
	lsr	r1, r0, #0x1
	add	r4, r0, #0
	cmp	r3, r1
	bls	.L804E3CC	@cond_branch
	sub	r0, r3, #1
	sub	r2, r2, r0
	b	.L804E3CE
.L804E3CC:
	add	r2, r3, #0
.L804E3CE:
	cmp	r5, #0
	blt	.L804E3D8	@cond_branch
	lsr	r0, r4, #0x1
	cmp	r3, r0
	bls	.L804E3DA	@cond_branch
.L804E3D8:
	neg	r2, r2
.L804E3DA:
	add	r0, r2, #0
	pop	{r4, r5}
	pop	{r1}
	bx	r1
	thumb_func_end sub_804E3B0

.align 2, 0 @ Don't pad with nop.
