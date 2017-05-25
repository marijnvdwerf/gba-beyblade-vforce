	.include "asm/common.inc"

	thumb_func_start ActorSetFrame
ActorSetFrame:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	add	r4, r0, #0
	add	r7, r1, #0
	lsl	r2, r2, #0x10
	lsr	r2, r2, #0x10
	mov	r8, r2
	bl	GetSpriteSheetStructA
	add	r5, r0, #0
	ldr	r2, [r4]
	ldr	r0, [r2]
	lsl	r1, r0, #0x1
	mov	r0, #0x2
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L1	@cond_branch
	add	r1, r1, #0x2
.L1:
	mov	r0, #0x10
	ldrb	r3, [r2, #0x7]
	and	r0, r0, r3
	cmp	r0, #0
	beq	.L3	@cond_branch
	ldr	r0, [r2, #0x8]
	lsl	r0, r0, #0x3
	add	r0, r0, #0x20
	add	r0, r2, r0
	add	r2, r0, r1
	cmp	r2, #0
	beq	.L3	@cond_branch
	lsl	r0, r7, #0x4
	add	r2, r2, r0
	ldrb	r1, [r2]
	add	r0, r4, #0
	add	r0, r0, #0xa4
	strb	r1, [r0]
	ldrb	r0, [r2, #0x1]
	add	r2, r4, #0
	add	r2, r2, #0xa5
	strb	r0, [r2]
.L3:
	ldrh	r0, [r5]
	mov	ip, r0
	ldrh	r6, [r5, #0x2]
	cmp	r8, r6
	bcs	.L4	@cond_branch
	ldrb	r1, [r5, #0x7]
	ldrb	r0, [r5, #0x6]
	add	r2, r4, #0
	add	r2, r2, #0x32
	mov	r3, #0x0
	strb	r0, [r2]
	add	r0, r4, #0
	add	r0, r0, #0x33
	strb	r1, [r0]
	ldrh	r0, [r5, #0x4]
	mov	r2, #0x0
	strh	r0, [r4, #0x34]
	strh	r3, [r4, #0x36]
	strh	r6, [r4, #0x26]
	strh	r7, [r4, #0x20]
	add	r0, r4, #0
	add	r0, r0, #0x24
	strb	r2, [r0]
	mov	r0, ip
	ADD r0, r8
	strh	r0, [r4, #0x22]
	mov	r0, #0xc
	and	r1, r1, r0
	lsr	r1, r1, #0x2
	add	r0, r4, #0
	add	r0, r0, #0x31
	strb	r1, [r0]
.L4:
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end ActorSetFrame

.align 2, 0 @ Don't pad with nop.
