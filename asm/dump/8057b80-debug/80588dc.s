	.include "asm/common.inc"

	thumb_func_start sub_80588DC
sub_80588DC:
	push	{r4, r5, lr}
	add	r3, r0, #0
	ldr	r2, [r3, #0x74]
	mov	r0, #0x1
	NEG	r0, r0
	cmp	r2, r0
	beq	.L1	@cond_branch
	mov	r0, #0x0
	cmp	r0, r2
	bge	.L2	@cond_branch
	ldr	r4, [r3, #0x78]
	mov	r5, #0x0
.L3:
	lsl	r1, r0, #0x10
	asr	r1, r1, #0x10
	lsl	r0, r1, #0x4
	add	r0, r4, r0
	str	r5, [r0]
	add	r1, r1, #0x1
	lsl	r1, r1, #0x10
	lsr	r0, r1, #0x10
	asr	r1, r1, #0x10
	cmp	r1, r2
	blt	.L3	@cond_branch
.L2:
	mov	r0, #0x0
	str	r0, [r3, #0x74]
.L1:
	pop	{r4, r5}
	pop	{r0}
	bx	r0
	thumb_func_end sub_80588DC

.align 2, 0 @ Don't pad with nop.
