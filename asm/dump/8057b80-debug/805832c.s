	.include "asm/common.inc"

	thumb_func_start sub_805832C
sub_805832C:
	push	{r4, r5, r6, r7, lr}
	add	r4, r0, #0
	ldr	r0, [sp, #0x14]
	lsl	r1, r1, #0x10
	lsr	r5, r1, #0x10
	lsl	r2, r2, #0x10
	lsr	r6, r2, #0x10
	lsl	r3, r3, #0x10
	lsr	r7, r3, #0x10
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	mov	ip, r0
	mov	r3, #0x0
	ldr	r1, [r4]
	ldr	r0, [r1, #0x18]
	add	r1, r1, r0
	mov	r2, #0x0
	b	.L1
.L5:
	ldrh	r0, [r1]
	cmp	r0, r5
	bne	.L3	@cond_branch
	ldrh	r0, [r1, #0x4]
	cmp	r6, r0
	bcs	.L3	@cond_branch
	mov	r0, #0x0
	strh	r3, [r4, #0x1c]
	strh	r0, [r4, #0x1e]
	strh	r5, [r4, #0x1a]
	strh	r7, [r4, #0x2e]
	add	r1, r1, #0x8
	lsl	r0, r6, #0x1
	add	r0, r0, r1
	ldrh	r1, [r0]
	add	r0, r4, #0
	mov	r2, ip
	bl	ActorSetFrame
	b	.L4
.L3:
	ldrh	r0, [r1, #0x2]
	add	r1, r1, r0
	add	r0, r3, r0
	lsl	r0, r0, #0x10
	lsr	r3, r0, #0x10
	add	r2, r2, #0x1
.L1:
	ldrh	r0, [r4, #0x28]
	cmp	r2, r0
	bcc	.L5	@cond_branch
.L4:
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_805832C

.align 2, 0 @ Don't pad with nop.
