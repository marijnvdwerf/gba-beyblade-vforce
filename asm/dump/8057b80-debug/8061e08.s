	.include "asm/common.inc"

	thumb_func_start sub_8061E08
sub_8061E08:
	push	{r4, lr}
	add	r2, r0, #0
	ldr	r0, [r2, #0x1c]
	cmp	r0, #0
	bne	.L1	@cond_branch
	mov	r0, #0x0
	b	.L2
.L1:
	ldr	r4, [r2, #0x18]
	ldr	r3, [r4, #0x8]
	ldr	r0, [r2, #0x20]
	cmp	r0, #0
	beq	.L3	@cond_branch
	ldr	r1, [r2, #0x24]
	ldrh	r4, [r4, #0x18]
	add	r0, r4, r0
	ldrb	r1, [r1, #0x4]
	ldrb	r0, [r0]
	sub	r0, r1, r0
	lsl	r0, r0, #0x8
	add	r3, r3, r0
.L3:
	add	r0, r2, #0
	add	r0, r0, #0x29
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	add	r3, r3, r0
	add	r0, r3, #0
.L2:
	pop	{r4}
	pop	{r1}
	bx	r1
	thumb_func_end sub_8061E08

.align 2, 0 @ Don't pad with nop.
