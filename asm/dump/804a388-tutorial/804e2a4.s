	.include "asm/common.inc"

	thumb_func_start sub_804E2A4
sub_804E2A4:
	push	{r4, r5, r6, r7, lr}
	add	sp, sp, #0xfffffff8
	add	r6, r0, #0
	add	r5, r2, #0
	lsl	r3, r3, #0x10
	lsr	r7, r3, #0x10
	asr	r4, r3, #0x10
	cmp	r4, #0
	bne	.L1	@cond_branch
	lsl	r3, r7, #0x18
	lsr	r3, r3, #0x18
	ldr	r0, [sp, #0x1c]
	str	r0, [sp]
	ldr	r0, [sp, #0x20]
	str	r0, [sp, #0x4]
	add	r0, r6, #0
	bl	sub_804E258
	b	.L12
.L1:
	add	r0, r6, #0
	add	r2, r5, #0
	bl	sub_804E3B0
	add	r1, r0, #0
	cmp	r4, #0
	ble	.L4	@cond_branch
	cmp	r1, #0
	bge	.L4	@cond_branch
	add	r0, r1, #1
	add	r1, r5, r0
.L4:
	lsl	r0, r7, #0x10
	add	r3, r0, #0
	cmp	r3, #0
	bge	.L6	@cond_branch
	cmp	r1, #0
	ble	.L6	@cond_branch
	sub	r0, r1, #1
	sub	r1, r0, r5
.L6:
	cmp	r1, #0
	bge	.L7	@cond_branch
	NEG	r2, r1
	NEG	r0, r3
	lsr	r0, r0, #0x10
	b	.L8
.L7:
	add	r2, r1, #0
	lsr	r0, r3, #0x10
.L8:
	lsl	r0, r0, #0x10
	asr	r0, r0, #0x10
	mul	r0, r0, r2
	asr	r0, r0, #0x8
	cmp	r2, #0
	bne	.L10	@cond_branch
	cmp	r1, #0
	beq	.L10	@cond_branch
	mov	r0, #0x0
.L10:
	ldr	r2, [sp, #0x20]
	cmp	r0, r2
	ble	.L11	@cond_branch
	add	r0, r2, #0
.L11:
	cmp	r1, #0
	bge	.L12	@cond_branch
	NEG	r0, r0
.L12:
	add	sp, sp, #0x8
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
	thumb_func_end sub_804E2A4

.align 2, 0 @ Don't pad with nop.
