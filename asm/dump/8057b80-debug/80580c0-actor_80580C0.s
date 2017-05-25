	.include "asm/common.inc"

	thumb_func_start actor_80580C0
actor_80580C0:
	push	{r4, r5, r6, r7, lr}
	add	r3, r0, #0
	lsl	r1, r1, #0x10
	lsr	r4, r1, #0x10
	lsl	r2, r2, #0x10
	lsr	r6, r2, #0x10
	mov	r5, #0x0
	ldr	r1, [r3]
	ldr	r0, [r1, #0x18]
	add	r1, r1, r0
	mov	r2, #0x0
	ldrh	r0, [r3, #0x28]
	cmp	r2, r0
	bcs	.L3	@cond_branch
	mov	r7, #0x0
.L4:
	ldrh	r0, [r1]
	cmp	r0, r4
	bne	.L2	@cond_branch
	strh	r5, [r3, #0x1c]
	strh	r7, [r3, #0x1e]
	strh	r4, [r3, #0x1a]
	strh	r6, [r3, #0x2e]
	ldrh	r1, [r1, #0x8]
	add	r0, r3, #0
	bl	ActorSetFrameSequence
	b	.L3
.L2:
	ldrh	r0, [r1, #0x2]
	add	r1, r1, r0
	add	r0, r5, r0
	lsl	r0, r0, #0x10
	lsr	r5, r0, #0x10
	add	r2, r2, #0x1
	ldrh	r0, [r3, #0x28]
	cmp	r2, r0
	bcc	.L4	@cond_branch
.L3:
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end actor_80580C0

.align 2, 0 @ Don't pad with nop.
