	.include "asm/common.inc"

	thumb_func_start sub_8058390
sub_8058390:
	push	{r4, r5, r6, lr}
	add	r4, r0, #0
	lsl	r1, r1, #0x10
	lsr	r5, r1, #0x10
	lsl	r2, r2, #0x10
	lsr	r2, r2, #0x10
	lsl	r3, r3, #0x10
	lsr	r3, r3, #0x10
	ldr	r1, [r4]
	ldr	r0, [r1, #0x18]
	add	r0, r1, r0
	mov	r1, #0x0
	b	.L80583CE
.L80583AA:
	ldrh	r6, [r0]
	cmp	r6, r5
	bne	.L80583C8	@cond_branch
	ldrh	r6, [r0, #0x4]
	cmp	r2, r6
	bcs	.L80583C8	@cond_branch
	strh	r3, [r4, #0x2e]
	add	r0, r0, #0x8
	lsl	r1, r2, #0x1
	add	r1, r1, r0
	ldrh	r1, [r1]
	add	r0, r4, #0
	bl	ActorSetFrameSequence
	b	.L80583D4
.L80583C8:
	ldrh	r6, [r0, #0x2]
	add	r0, r6, r0
	add	r1, r1, #0x1
.L80583CE:
	ldrh	r6, [r4, #0x28]
	cmp	r1, r6
	bcc	.L80583AA	@cond_branch
.L80583D4:
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8058390

.align 2, 0 @ Don't pad with nop.
