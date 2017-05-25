	.include "asm/common.inc"

	thumb_func_start sub_8058A28
sub_8058A28:
	push	{r4, r5, r6, r7, lr}
	add	sp, sp, #0xfffffff4
	add	r6, r0, #0
	add	r4, r1, #0
	ldr	r0, [sp, #0x20]
	lsl	r4, r4, #0x18
	lsr	r4, r4, #0x18
	lsl	r3, r3, #0x10
	lsr	r3, r3, #0x10
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	add	r7, r0, #0
	str	r7, [sp]
	add	r0, r6, #0
	add	r1, r4, #0
	bl	sub_8058AA8
	add	r0, r4, #0
	bl	GetBGLayerHOffsetPtr
	mov	r5, #0x0
	strh	r5, [r0]
	add	r0, r4, #0
	bl	GetBGLayerVOffsetPtr
	strh	r5, [r0]
	add	r0, r6, #0
	add	r0, r0, #0x5f
	mov	r1, #0x1
	add	r2, r1, #0
	ldrb	r0, [r0]
	LSL	r2, r0
	add	r0, r6, #0
	add	r0, r0, #0x60
	ldrb	r0, [r0]
	LSL	r1, r0
	ldr	r0, [r6]
	cmp	r0, r2
	bge	.L1	@cond_branch
	add	r2, r0, #0
.L1:
	ldr	r0, [r6, #0x4]
	cmp	r0, r1
	bge	.L2	@cond_branch
	add	r1, r0, #0
.L2:
	mov	r0, #0x2
	and	r0, r0, r7
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	cmp	r0, #0
	bne	.L3	@cond_branch
	str	r0, [sp]
	str	r2, [sp, #0x4]
	str	r1, [sp, #0x8]
	add	r0, r6, #0
	mov	r1, #0x0
	mov	r2, #0x0
	mov	r3, #0x0
	bl	sub_8059310
.L3:
	add	sp, sp, #0xc
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8058A28

.align 2, 0 @ Don't pad with nop.
