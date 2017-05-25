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
	bge	.L1	@cond_branch
	NEG	r1, r2
.L1:
	asr	r0, r4, #0x1
	cmp	r1, r0
	ble	.L2	@cond_branch
	sub	r1, r1, r4
.L2:
	add	r0, r1, #0
	mul	r0, r0, r3
	asr	r0, r0, #0x8
	add	r3, r0, #0
	cmp	r0, #0
	bge	.L3	@cond_branch
	NEG	r0, r0
.L3:
	cmp	r3, #0
	bne	.L5	@cond_branch
	cmp	r1, #0
	beq	.L5	@cond_branch
	add	r0, r1, #0
.L5:
	cmp	r0, r5
	ble	.L6	@cond_branch
	add	r0, r5, #0
.L6:
	cmp	r3, #0
	bge	.L7	@cond_branch
	NEG	r0, r0
.L7:
	cmp	r2, #0
	bge	.L8	@cond_branch
	NEG	r0, r0
.L8:
	pop	{r4, r5}
	pop	{r1}
	bx	r1
	thumb_func_end sub_804E258

.align 2, 0 @ Don't pad with nop.
