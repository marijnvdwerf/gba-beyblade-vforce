	.include "asm/common.inc"

	thumb_func_start sub_80581B8
sub_80581B8:
	push	{r4, r5, lr}
	add	r4, r0, #0
	ldr	r0, [r4]
	ldr	r1, [r0, #0x18]
	add	r0, r0, r1
	ldrh	r1, [r4, #0x1c]
	add	r3, r1, r0
	ldrh	r1, [r4, #0x1e]
	ldrh	r0, [r3, #0x4]
	sub	r0, r0, #0x1
	cmp	r1, r0
	blt	.L1	@cond_branch
	mov	r2, #0x0
	mov	r0, #0x2e
	ldsh	r1, [r4, r0]
	mov	r0, #0x1
	NEG	r0, r0
	cmp	r1, r0
	beq	.L2	@cond_branch
	mov	r1, #0x1a
	ldsh	r5, [r4, r1]
	ldrh	r1, [r4, #0x2e]
	ldr	r2, .L5
	add	r0, r4, #0
	bl	actor_80580C0
	add	r0, r4, #0
	add	r0, r0, #0xc0
	ldr	r2, [r0]
	cmp	r2, #0
	beq	.L4	@cond_branch
	add	r0, r4, #0
	add	r1, r5, #0
	bl	_call_via_r2
	b	.L4
.L6:
	.align	2, 0
.L5:
	.4byte	0xffff
.L1:
	add	r0, r1, #1
	lsl	r0, r0, #0x10
	lsr	r2, r0, #0x10
.L2:
	strh	r2, [r4, #0x1e]
	lsl	r0, r2, #0x1
	add	r0, r0, r3
	ldrh	r1, [r0, #0x8]
	add	r0, r4, #0
	bl	ActorSetFrameSequence
.L4:
	pop	{r4, r5}
	pop	{r0}
	bx	r0
	thumb_func_end sub_80581B8

.align 2, 0 @ Don't pad with nop.
