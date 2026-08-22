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
	bne	.L804E2CA	@cond_branch
	lsl	r3, r7, #0x18
	lsr	r3, r3, #0x18
	ldr	r0, [sp, #0x1c]
	str	r0, [sp]
	ldr	r0, [sp, #0x20]
	str	r0, [sp, #0x4]
	add	r0, r6, #0
	bl	sub_804E258
	b	.L804E320
.L804E2CA:
	add	r0, r6, #0
	add	r2, r5, #0
	bl	sub_804E3B0
	add	r1, r0, #0
	cmp	r4, #0
	ble	.L804E2E0	@cond_branch
	cmp	r1, #0
	bge	.L804E2E0	@cond_branch
	add	r0, r1, #1
	add	r1, r5, r0
.L804E2E0:
	lsl	r0, r7, #0x10
	add	r3, r0, #0
	cmp	r3, #0
	bge	.L804E2F0	@cond_branch
	cmp	r1, #0
	ble	.L804E2F0	@cond_branch
	sub	r0, r1, #1
	sub	r1, r0, r5
.L804E2F0:
	cmp	r1, #0
	bge	.L804E2FC	@cond_branch
	neg	r2, r1
	neg	r0, r3
	lsr	r0, r0, #0x10
	b	.L804E300
.L804E2FC:
	add	r2, r1, #0
	lsr	r0, r3, #0x10
.L804E300:
	lsl	r0, r0, #0x10
	asr	r0, r0, #0x10
	mul	r0, r0, r2
	asr	r0, r0, #0x8
	cmp	r2, #0
	bne	.L804E312	@cond_branch
	cmp	r1, #0
	beq	.L804E312	@cond_branch
	mov	r0, #0x0
.L804E312:
	ldr	r2, [sp, #0x20]
	cmp	r0, r2
	ble	.L804E31A	@cond_branch
	add	r0, r2, #0
.L804E31A:
	cmp	r1, #0
	bge	.L804E320	@cond_branch
	neg	r0, r0
.L804E320:
	add	sp, sp, #0x8
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
	thumb_func_end sub_804E2A4

.align 2, 0 @ Don't pad with nop.
