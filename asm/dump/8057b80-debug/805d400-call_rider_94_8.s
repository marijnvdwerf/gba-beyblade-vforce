	.include "asm/common.inc"

	thumb_func_start call_rider_94_8
call_rider_94_8:
	push	{r4, r5, r6, lr}
	add	r5, r0, #0
	add	r6, r1, #0
	lsl	r3, r3, #0x10
	lsr	r3, r3, #0x10
	mov	r1, #0x1
	add	r0, r0, #0x94
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L2	@cond_branch
	ldr	r4, [r0, #0x8]
	cmp	r4, #0
	beq	.L2	@cond_branch
	add	r0, r5, #0
	add	r1, r6, #0
	bl	_call_via_r4
	lsl	r0, r0, #0x18
	lsr	r1, r0, #0x18
.L2:
	add	r0, r1, #0
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
	thumb_func_end call_rider_94_8

.align 2, 0 @ Don't pad with nop.
