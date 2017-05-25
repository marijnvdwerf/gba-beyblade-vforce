	.include "asm/common.inc"

	thumb_func_start sub_805FBE0
sub_805FBE0:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xfffffffc
	add	r4, r0, #0
	ldr	r0, [sp, #0x24]
	lsl	r1, r1, #0x10
	mov	r9, r1
	lsr	r5, r1, #0x10
	lsl	r2, r2, #0x10
	lsr	r7, r2, #0x10
	lsl	r3, r3, #0x10
	lsr	r3, r3, #0x10
	mov	r8, r3
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	add	r6, r0, #0
	mov	r0, #0x0
	strh	r0, [r4]
	strh	r0, [r4, #0x2]
	strh	r7, [r4, #0x4]
	strh	r5, [r4, #0x6]
	strh	r0, [r4, #0x26]
	strh	r0, [r4, #0x24]
	strh	r0, [r4, #0x30]
	strh	r0, [r4, #0x2e]
	strh	r6, [r4, #0x2c]
	ldr	r0, [r4, #0x28]
	cmp	r0, #0
	beq	.L1	@cond_branch
	add	r0, r4, #0
	bl	sub_805FCC8
.L1:
	mov	r0, r8
	lsl	r0, r0, #0x5
	str	r0, [sp]
	lsl	r0, r6, #0x1
	ldr	r1, [sp]
	add	r6, r1, r0
	add	r0, r6, #0
	bl	fastAllocate
	str	r0, [r4, #0x28]
	lsl	r7, r7, #0x3
	add	r0, r7, #0
	bl	fastAllocate
	str	r0, [r4, #0x18]
	lsl	r2, r5, #0x2
	mov	sl, r2
	mov	r1, r9
	lsr	r0, r1, #0x15
	lsl	r0, r0, #0x2
	mov	r8, r0
	mov	r1, sl
	ADD r1, r8
	lsl	r0, r5, #0x1
	add	r5, r1, r0
	add	r0, r5, #0
	bl	fastAllocate
	str	r0, [r4, #0x1c]
	ldr	r0, [r4, #0x28]
	cmp	r0, #0
	bne	.L2	@cond_branch
	ldr	r0, .L5
	add	r1, r6, #0
	bl	nullsub_9
.L2:
	ldr	r0, [r4, #0x18]
	cmp	r0, #0
	bne	.L3	@cond_branch
	ldr	r0, .L5 + 4
	add	r1, r7, #0
	bl	nullsub_9
.L3:
	ldr	r0, [r4, #0x1c]
	cmp	r0, #0
	bne	.L4	@cond_branch
	ldr	r0, .L5 + 8
	add	r1, r5, #0
	bl	nullsub_9
.L4:
	ldr	r0, [r4, #0x28]
	ldr	r1, [r0]
	str	r1, [r4, #0x20]
	ldr	r0, [r4, #0x18]
	ldr	r0, [r0]
	str	r0, [r4, #0x8]
	ldr	r0, [r4, #0x1c]
	ldr	r0, [r0]
	str	r0, [r4, #0xc]
	ldr	r2, [sp]
	add	r1, r1, r2
	str	r1, [r4, #0x34]
	ADD r0, sl
	str	r0, [r4, #0x10]
	ADD r0, r8
	str	r0, [r4, #0x14]
	add	sp, sp, #0x4
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L6:
	.align	2, 0
.L5:
	.4byte	0x8755764
	.4byte	0x8755794
	.4byte	0x87557c8
	thumb_func_end sub_805FBE0

.align 2, 0 @ Don't pad with nop.
