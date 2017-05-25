	.include "asm/common.inc"

	thumb_func_start sub_805ABC0
sub_805ABC0:
	push	{r4, lr}
	add	r2, r0, #0
	ldr	r4, .L7
	ldrh	r0, [r4]
	ldrh	r1, [r2, #0x8]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L5	@cond_branch
	ldrh	r0, [r2, #0xa]
	ldr	r3, .L7 + 4
	cmp	r0, #0
	bne	.L2	@cond_branch
	ldr	r0, [r3]
	str	r0, [r2]
.L2:
	ldr	r1, [r3]
	ldr	r0, [r2]
	sub	r0, r1, r0
	cmp	r0, #0x64
	bls	.L3	@cond_branch
	str	r1, [r2]
	mov	r0, #0x0
	strh	r0, [r2, #0xa]
.L3:
	ldrh	r0, [r2, #0x8]
	ldrh	r1, [r4]
	and	r1, r1, r0
	ldrh	r4, [r2, #0xa]
	orr	r1, r1, r4
	strh	r1, [r2, #0xa]
	and	r1, r1, r0
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	cmp	r1, r0
	bne	.L5	@cond_branch
	ldr	r1, [r3]
	ldr	r0, [r2]
	sub	r0, r1, r0
	cmp	r0, #0x41
	bhi	.L5	@cond_branch
	str	r1, [r2, #0x4]
	mov	r0, #0x0
	strh	r0, [r2, #0xa]
	mov	r0, #0x1
	b	.L6
.L8:
	.align	2, 0
.L7:
	.4byte	0x3005da0
	.4byte	0x3000e30
.L5:
	mov	r0, #0x0
.L6:
	pop	{r4}
	pop	{r1}
	bx	r1
	thumb_func_end sub_805ABC0

.align 2, 0 @ Don't pad with nop.
