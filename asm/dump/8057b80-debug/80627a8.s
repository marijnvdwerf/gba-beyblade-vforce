	.include "asm/common.inc"

	thumb_func_start sub_80627A8
sub_80627A8:
	push	{r4, r5, lr}
	add	r4, r0, #0
	ldrb	r0, [r4, #0x16]
	cmp	r0, #0x1
	bne	.L4	@cond_branch
	ldr	r0, .L5
	ldr	r3, [r0]
	add	r0, r4, #0
	bl	_call_via_r3
	ldr	r1, [r4]
	ldr	r0, [r1, #0x4]
	add	r0, r0, #0x10
	add	r3, r1, r0
	ldr	r2, [r1, #0x8]
	add	r0, r2, #0
	add	r0, r0, #0x10
	add	r5, r1, r0
	ldr	r0, [r4, #0x4]
	cmp	r0, r3
	bcc	.L4	@cond_branch
	cmp	r2, #0
	beq	.L3	@cond_branch
	sub	r0, r0, r3
	sub	r1, r3, r5
	bl	__umodsi3
	add	r0, r5, r0
	str	r0, [r4, #0x4]
	b	.L4
.L6:
	.align	2, 0
.L5:
	.4byte	0x807d964
.L3:
	strb	r2, [r4, #0x16]
.L4:
	pop	{r4, r5}
	pop	{r0}
	bx	r0
	thumb_func_end sub_80627A8

.align 2, 0 @ Don't pad with nop.
