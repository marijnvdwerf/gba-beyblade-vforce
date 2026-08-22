	.include "asm/common.inc"

	thumb_func_start sub_804E224
sub_804E224:
	push	{r4, lr}
	add	r4, r3, #0
	lsl	r2, r2, #0x18
	lsr	r3, r2, #0x18
	sub	r2, r1, r0
	add	r1, r2, #0
	cmp	r2, #0
	bge	.L804E236	@cond_branch
	neg	r1, r2
.L804E236:
	add	r0, r1, #0
	mul	r0, r0, r3
	asr	r0, r0, #0x8
	cmp	r0, #0
	bne	.L804E246	@cond_branch
	cmp	r1, #0
	beq	.L804E246	@cond_branch
	add	r0, r1, #0
.L804E246:
	cmp	r0, r4
	ble	.L804E24C	@cond_branch
	add	r0, r4, #0
.L804E24C:
	cmp	r2, #0
	bge	.L804E252	@cond_branch
	neg	r0, r0
.L804E252:
	pop	{r4}
	pop	{r1}
	bx	r1
	thumb_func_end sub_804E224

.align 2, 0 @ Don't pad with nop.
