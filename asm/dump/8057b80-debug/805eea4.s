	.include "asm/common.inc"

	thumb_func_start sub_805EEA4
sub_805EEA4:
	push	{r4, lr}
	add	r4, r0, #0
	lsl	r1, r1, #0x10
	lsr	r1, r1, #0x10
	mov	r3, #0x0
	lsl	r2, r2, #0x10
	asr	r2, r2, #0x10
	cmp	r3, r2
	bge	.L1	@cond_branch
.L4:
	ldr	r0, [r4]
	cmp	r1, r0
	bne	.L2	@cond_branch
	lsl	r0, r3, #0x10
	asr	r0, r0, #0x10
	b	.L3
.L2:
	add	r4, r4, #0x84
	lsl	r0, r3, #0x10
	mov	r3, #0x80
	lsl	r3, r3, #0x9
	add	r0, r0, r3
	lsr	r3, r0, #0x10
	asr	r0, r0, #0x10
	cmp	r0, r2
	blt	.L4	@cond_branch
.L1:
	mov	r0, #0x1
	NEG	r0, r0
.L3:
	pop	{r4}
	pop	{r1}
	bx	r1
	thumb_func_end sub_805EEA4

.align 2, 0 @ Don't pad with nop.
