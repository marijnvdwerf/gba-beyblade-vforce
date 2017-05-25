	.include "asm/common.inc"

	thumb_func_start ActorSetFrameSequence
ActorSetFrameSequence:
	push	{r4, r5, r6, r7, lr}
	add	r3, r0, #0
	add	r6, r1, #0
	lsl	r0, r6, #0x3
	add	r0, r0, #0x20
	ldr	r2, [r3]
	add	r5, r2, r0
	ldr	r0, [r2]
	lsl	r1, r0, #0x1
	mov	r0, #0x2
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L1	@cond_branch
	add	r1, r1, #0x2
.L1:
	mov	r0, #0x10
	ldrb	r4, [r2, #0x7]
	and	r0, r0, r4
	cmp	r0, #0
	beq	.L3	@cond_branch
	ldr	r0, [r2, #0x8]
	lsl	r0, r0, #0x3
	add	r0, r0, #0x20
	add	r0, r2, r0
	add	r2, r0, r1
	cmp	r2, #0
	beq	.L3	@cond_branch
	lsl	r0, r6, #0x4
	add	r2, r2, r0
	ldrb	r1, [r2]
	add	r0, r3, #0
	add	r0, r0, #0xa4
	strb	r1, [r0]
	ldrb	r0, [r2, #0x1]
	add	r2, r3, #0
	add	r2, r2, #0xa5
	strb	r0, [r2]
.L3:
	ldrh	r0, [r5]
	mov	ip, r0
	ldrh	r7, [r5, #0x2]
	ldrb	r4, [r5, #0x7]
	ldrb	r0, [r5, #0x6]
	add	r2, r3, #0
	add	r2, r2, #0x32
	mov	r1, #0x0
	strb	r0, [r2]
	add	r0, r3, #0
	add	r0, r0, #0x33
	strb	r4, [r0]
	ldrh	r0, [r5, #0x4]
	mov	r2, #0x0
	strh	r0, [r3, #0x34]
	strh	r1, [r3, #0x36]
	ldr	r0, .L6
	ldr	r0, [r0]
	str	r0, [r3, #0x58]
	strh	r7, [r3, #0x26]
	strh	r6, [r3, #0x20]
	add	r0, r3, #0
	add	r0, r0, #0x24
	strb	r2, [r0]
	mov	r0, #0x2
	and	r0, r0, r4
	cmp	r0, #0
	beq	.L4	@cond_branch
	ldr	r1, .L6 + 4
	add	r0, r7, r1
	ADD r0, ip
	strh	r0, [r3, #0x22]
	b	.L5
.L7:
	.align	2, 0
.L6:
	.4byte	0x3000e30
	.4byte	0xffff
.L4:
	mov	r2, ip
	strh	r2, [r3, #0x22]
.L5:
	add	r1, r3, #0
	add	r1, r1, #0x31
	mov	r0, #0xc
	and	r4, r4, r0
	lsr	r0, r4, #0x2
	ldrb	r4, [r1]
	EOR	r0, r4
	strb	r0, [r1]
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end ActorSetFrameSequence

.align 2, 0 @ Don't pad with nop.
