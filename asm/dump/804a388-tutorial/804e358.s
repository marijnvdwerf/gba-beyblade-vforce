	.include "asm/common.inc"

	thumb_func_start sub_804E358
sub_804E358:
	push	{r4, lr}
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	sub	r1, r1, r0
	lsl	r1, r1, #0x10
	lsr	r1, r1, #0x10
	lsl	r2, r1, #0x10
	asr	r0, r2, #0x10
	cmp	r0, #0
	bge	.L1	@cond_branch
	NEG	r0, r0
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	b	.L2
.L1:
	lsr	r0, r2, #0x10
.L2:
	lsl	r0, r0, #0x10
	asr	r2, r0, #0x10
	add	r3, r0, #0
	cmp	r2, #0x80
	ble	.L3	@cond_branch
	mov	r4, #0x80
	lsl	r4, r4, #0x1
	add	r0, r4, #0
	sub	r0, r0, r2
	lsl	r0, r0, #0x10
	lsr	r2, r0, #0x10
	b	.L4
.L3:
	lsr	r2, r3, #0x10
.L4:
	lsl	r0, r1, #0x10
	cmp	r0, #0
	blt	.L5	@cond_branch
	asr	r0, r3, #0x10
	cmp	r0, #0x80
	ble	.L6	@cond_branch
.L5:
	lsl	r0, r2, #0x10
	NEG	r0, r0
	lsr	r2, r0, #0x10
.L6:
	lsl	r0, r2, #0x10
	asr	r0, r0, #0x10
	pop	{r4}
	pop	{r1}
	bx	r1
	thumb_func_end sub_804E358

.align 2, 0 @ Don't pad with nop.
