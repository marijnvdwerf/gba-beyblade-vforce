	.include "asm/common.inc"

	thumb_func_start sub_8060934
sub_8060934:
	push	{r4, r5, r6, lr}
	lsl	r0, r0, #0x10
	lsr	r6, r0, #0x10
	ldr	r0, .L7
	ldr	r4, [r0]
	cmp	r4, #0
	beq	.L1	@cond_branch
	mov	r5, #0x1
.L4:
	add	r0, r5, #0
	ldrh	r1, [r4, #0x20]
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L2	@cond_branch
	ldr	r2, [r4, #0x24]
	cmp	r2, #0
	blt	.L3	@cond_branch
	ldrh	r0, [r4, #0x16]
	sub	r0, r0, #0x5
	add	r1, r5, #0
	LSL	r1, r0
	add	r0, r2, #0
	bl	freeSpriteVramLocation
.L3:
	mov	r0, #0x1
	NEG	r0, r0
	str	r0, [r4, #0x24]
.L2:
	ldr	r4, [r4, #0x4]
	cmp	r4, #0
	bne	.L4	@cond_branch
.L1:
	ldr	r0, .L7 + 4
	str	r6, [r0]
	ldr	r0, .L7 + 8
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L5	@cond_branch
	ldr	r0, .L7 + 12
	str	r3, [r0]
	ldr	r0, .L7 + 16
	add	r2, r3, #0
	add	r2, r2, #0x8
	str	r2, [r0]
	mov	r1, #0x0
	strh	r6, [r3]
	mov	r4, #0x80
	lsl	r4, r4, #0x3
	add	r0, r4, #0
	sub	r0, r0, r6
	strh	r0, [r3, #0x2]
	str	r1, [r3, #0x4]
	mov	r3, #0x1d
.L6:
	add	r1, r2, #0
	add	r1, r1, #0x8
	str	r1, [r2, #0x4]
	add	r2, r1, #0
	add	r0, r3, #0
	sub	r3, r3, #0x1
	cmp	r0, #0
	bne	.L6	@cond_branch
	str	r0, [r1, #0x4]
.L5:
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L8:
	.align	2, 0
.L7:
	.4byte	0x3005de4
	.4byte	0x3005e6c
	.4byte	0x3005dcc
	.4byte	0x3005dc8
	.4byte	0x3005dd8
	thumb_func_end sub_8060934

.align 2, 0 @ Don't pad with nop.
