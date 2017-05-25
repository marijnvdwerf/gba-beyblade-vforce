	.include "asm/common.inc"

	thumb_func_start sub_8061CB4
sub_8061CB4:
	push	{r4, lr}
	add	r3, r0, #0
	ldr	r0, [r3, #0x1c]
	cmp	r0, #0
	bne	.L1	@cond_branch
	mov	r0, #0x0
	b	.L2
.L1:
	mov	r0, #0x3
	ldrh	r1, [r3, #0x8]
	and	r0, r0, r1
	cmp	r0, #0x1
	beq	.L3	@cond_branch
	cmp	r0, #0x1
	bgt	.L4	@cond_branch
	cmp	r0, #0
	beq	.L5	@cond_branch
	b	.L11
.L4:
	cmp	r0, #0x2
	beq	.L7	@cond_branch
	b	.L11
.L5:
	ldr	r0, [r3, #0x14]
	ldr	r2, [r0, #0x8]
	b	.L11
.L3:
	ldr	r4, [r3, #0x18]
	ldr	r2, [r4, #0x8]
	ldr	r0, [r3, #0x20]
	cmp	r0, #0
	beq	.L10	@cond_branch
	ldr	r1, [r3, #0x24]
	ldrh	r4, [r4, #0x18]
	add	r0, r4, r0
	ldrb	r1, [r1, #0x4]
	ldrb	r0, [r0]
	sub	r0, r1, r0
	lsl	r0, r0, #0x8
	add	r2, r2, r0
.L10:
	add	r0, r3, #0
	add	r0, r0, #0x29
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	add	r2, r2, r0
	ldrh	r3, [r3, #0xc]
	lsl	r0, r3, #0x8
	sub	r2, r2, r0
	b	.L11
.L7:
	ldr	r4, [r3, #0x18]
	ldr	r2, [r4, #0x8]
	ldr	r0, [r3, #0x20]
	cmp	r0, #0
	beq	.L12	@cond_branch
	ldr	r1, [r3, #0x24]
	ldrh	r4, [r4, #0x18]
	add	r0, r4, r0
	ldrb	r1, [r1, #0x4]
	ldrb	r0, [r0]
	sub	r0, r1, r0
	lsl	r0, r0, #0x8
	add	r2, r2, r0
.L12:
	add	r0, r3, #0
	add	r0, r0, #0x29
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	add	r2, r2, r0
	ldr	r0, [r3, #0x14]
	ldr	r1, [r0, #0x8]
	sub	r2, r2, r1
	mov	r0, #0x2
	NEG	r0, r0
	ldrh	r3, [r3, #0xc]
	and	r0, r0, r3
	lsl	r0, r0, #0x7
	sub	r1, r1, r0
	asr	r0, r2, #0x1
	add	r2, r1, r0
.L11:
	add	r0, r2, #0
.L2:
	pop	{r4}
	pop	{r1}
	bx	r1
	thumb_func_end sub_8061CB4

.align 2, 0 @ Don't pad with nop.
