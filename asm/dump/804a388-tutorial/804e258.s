	.include "asm/common.inc"

	thumb_func_start sub_804E258
sub_804E258:
	push	{r4, r5, lr}
	add	r4, r2, #0
	ldr	r5, [sp, #0x10]
	lsl	r3, r3, #0x18
	lsr	r3, r3, #0x18
	sub	r2, r1, r0
	add	r1, r2, #0
	cmp	r2, #0
	bge	.L804E26C	@cond_branch
	neg	r1, r2
.L804E26C:
	asr	r0, r4, #0x1
	cmp	r1, r0
	ble	.L804E274	@cond_branch
	sub	r1, r1, r4
.L804E274:
	add	r0, r1, #0
	mul	r0, r0, r3
	asr	r0, r0, #0x8
	add	r3, r0, #0
	cmp	r0, #0
	bge	.L804E282	@cond_branch
	neg	r0, r0
.L804E282:
	cmp	r3, #0
	bne	.L804E28C	@cond_branch
	cmp	r1, #0
	beq	.L804E28C	@cond_branch
	add	r0, r1, #0
.L804E28C:
	cmp	r0, r5
	ble	.L804E292	@cond_branch
	add	r0, r5, #0
.L804E292:
	cmp	r3, #0
	bge	.L804E298	@cond_branch
	neg	r0, r0
.L804E298:
	cmp	r2, #0
	bge	.L804E29E	@cond_branch
	neg	r0, r0
.L804E29E:
	pop	{r4, r5}
	pop	{r1}
	bx	r1
	thumb_func_end sub_804E258

.align 2, 0 @ Don't pad with nop.
