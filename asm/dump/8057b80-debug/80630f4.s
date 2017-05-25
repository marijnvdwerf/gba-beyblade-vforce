	.include "asm/common.inc"

	thumb_func_start sub_80630F4
sub_80630F4:
	push	{r4, r5, lr}
	add	r5, r0, #0
	mov	r2, #0x0
	ldr	r0, [r5, #0x4]
	cmp	r2, r0
	bge	.L1	@cond_branch
.L3:
	lsl	r0, r2, #0x10
	asr	r4, r0, #0x10
	add	r0, r5, #0
	add	r1, r4, #0
	bl	sub_8063190
	cmp	r0, #0
	beq	.L2	@cond_branch
	bl	sub_80584B8
.L2:
	add	r0, r4, #1
	lsl	r0, r0, #0x10
	lsr	r2, r0, #0x10
	asr	r0, r0, #0x10
	ldr	r1, [r5, #0x4]
	cmp	r0, r1
	blt	.L3	@cond_branch
.L1:
	pop	{r4, r5}
	pop	{r0}
	bx	r0
	thumb_func_end sub_80630F4

.align 2, 0 @ Don't pad with nop.
