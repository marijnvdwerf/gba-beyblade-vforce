	.include "asm/common.inc"

	thumb_func_start sub_8059E5C
sub_8059E5C:
	push	{r4, r5, r6, r7, lr}
	ldr	r4, [sp, #0x14]
	ldr	r5, [sp, #0x18]
	lsl	r2, r2, #0x18
	lsr	r6, r2, #0x18
	mov	r1, #0x1f
	and	r1, r1, r5
	lsl	r1, r1, #0x1
	ldr	r2, [r0, #0x70]
	add	r2, r2, r1
	asr	r5, r5, #0x5
	ldr	r7, [r0]
	lsl	r1, r7, #0x2
	mul	r1, r1, r5
	add	r5, r2, r1
	add	r1, r0, #0
	add	r1, r1, #0x5c
	ldrb	r1, [r1]
	lsl	r2, r1, #0xb
	mov	r1, #0xc0
	lsl	r1, r1, #0x13
	add	r2, r2, r1
	add	r0, r0, #0x5f
	ldrb	r1, [r0]
	LSL	r4, r1
	add	r4, r4, r3
	lsl	r4, r4, #0x1
	add	r2, r2, r4
	cmp	r6, #0
	beq	.L1	@cond_branch
	lsl	r1, r7, #0x1
	add	r3, r0, #0
	mov	r4, #0x2
.L2:
	ldrh	r0, [r5]
	strh	r0, [r2]
	add	r5, r5, r1
	add	r0, r4, #0
	ldrb	r7, [r3]
	LSL	r0, r7
	add	r2, r2, r0
	sub	r0, r6, #1
	lsl	r0, r0, #0x18
	lsr	r6, r0, #0x18
	cmp	r6, #0
	bne	.L2	@cond_branch
.L1:
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8059E5C

.align 2, 0 @ Don't pad with nop.
