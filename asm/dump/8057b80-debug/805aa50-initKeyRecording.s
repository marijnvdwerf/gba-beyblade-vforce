	.include "asm/common.inc"

	thumb_func_start initKeyRecording
initKeyRecording:
	push	{r4, r5, lr}
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	add	r4, r0, #0
	ldr	r1, .L3
	ldr	r0, .L3 + 4
	strh	r4, [r0]
	strh	r4, [r1]
	ldr	r5, .L3 + 8
	ldr	r0, [r5]
	cmp	r0, #0
	beq	.L1	@cond_branch
	bl	deallocateBlock
	mov	r0, #0x0
	str	r0, [r5]
.L1:
	lsl	r4, r4, #0x1
	add	r0, r4, #0
	bl	slowAllocate
	str	r0, [r5]
	cmp	r0, #0
	bne	.L2	@cond_branch
	ldr	r0, .L3 + 12
	add	r1, r4, #0
	bl	printf
.L2:
	ldr	r1, .L3 + 16
	ldr	r0, [r5]
	ldr	r0, [r0]
	str	r0, [r1]
	ldr	r1, .L3 + 20
	mov	r0, #0x1
	strh	r0, [r1]
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L4:
	.align	2, 0
.L3:
	.4byte	0x3005db4
	.4byte	0x3005db8
	.4byte	0x3005dbc
	.4byte	0x875530c
	.4byte	0x3005db0
	.4byte	0x3005ca4
	thumb_func_end initKeyRecording

.align 2, 0 @ Don't pad with nop.
