	.include "asm/common.inc"

	thumb_func_start sub_8048A74
sub_8048A74:
	push	{r4, r5, lr}
	add	r4, r0, #0
	add	r5, r1, #0
	ldrh	r1, [r4, #0xc]
	mov	r0, #0x1
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L8048A8E	@cond_branch
	ldr	r1, [r4, #0x8]
	mov	r0, #0x3
	ldrh	r2, [r4, #0xe]
	and	r0, r0, r2
	b	.L8048AA0
.L8048A8E:
	mov	r0, #0x2
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L8048AA2	@cond_branch
	ldrh	r0, [r4, #0xe]
	cmp	r0, #0x3
	bhi	.L8048AA2	@cond_branch
	ldr	r1, [r4, #0x8]
	add	r0, r0, #0x4
.L8048AA0:
	strh	r0, [r1, #0x18]
.L8048AA2:
	bl	sub_8057C40
	asr	r0, r0, #0x4
	mov	r1, #0xf
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L8048AB6	@cond_branch
	ldrh	r0, [r4, #0xe]
	add	r0, r0, #0x1
	strh	r0, [r4, #0xe]
.L8048AB6:
	ldr	r1, [r4]
	cmp	r1, #0
	beq	.L8048AC4	@cond_branch
	mov	r2, #0xc0
	lsl	r2, r2, #0x5
	add	r0, r5, r2
	str	r0, [r1, #0x8]
.L8048AC4:
	ldr	r1, [r4, #0x4]
	cmp	r1, #0
	beq	.L8048AD2	@cond_branch
	mov	r2, #0x98
	lsl	r2, r2, #0x8
	add	r0, r5, r2
	str	r0, [r1, #0x8]
.L8048AD2:
	ldr	r1, [r4, #0x8]
	cmp	r1, #0
	beq	.L8048AE0	@cond_branch
	mov	r2, #0xb0
	lsl	r2, r2, #0x7
	add	r0, r5, r2
	str	r0, [r1, #0x8]
.L8048AE0:
	pop	{r4, r5}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8048A74

.align 2, 0 @ Don't pad with nop.
