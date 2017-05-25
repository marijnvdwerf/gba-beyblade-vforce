	.include "asm/common.inc"

	thumb_func_start sub_8060C1C
sub_8060C1C:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	mov	r8, r0
	lsl	r1, r1, #0x10
	lsr	r5, r1, #0x10
	lsl	r2, r2, #0x10
	lsr	r7, r2, #0x10
	ldr	r2, .L3
	ldr	r1, [r2]
	cmp	r1, r5
	bcs	.L1	@cond_branch
	ldr	r0, .L3 + 4
	add	r2, r5, #0
	bl	printf
	mov	r0, #0x0
	b	.L2
.L4:
	.align	2, 0
.L3:
	.4byte	0x3005df4
	.4byte	0x8755ac8
.L1:
	sub	r0, r1, r5
	str	r0, [r2]
	ldr	r0, .L6
	ldr	r6, [r0]
	add	r4, r6, #0
	ldr	r0, .L6 + 4
	ldr	r0, [r0]
	add	r1, r7, #0
	bl	sub_80609C4
	add	r2, r0, #0
	add	r1, r6, #0
	mov	r0, r8
	str	r5, [r0, #0x8]
	str	r6, [r0]
	strh	r7, [r6, #0x22]
	b	.L5
.L7:
	.align	2, 0
.L6:
	.4byte	0x3005dec
	.4byte	0x3005de4
.L8:
	ldr	r4, [r4, #0x4]
	strh	r7, [r4, #0x22]
	str	r1, [r4]
	add	r1, r4, #0
.L5:
	sub	r0, r5, #1
	lsl	r0, r0, #0x10
	lsr	r5, r0, #0x10
	cmp	r5, #0
	bne	.L8	@cond_branch
	mov	r0, r8
	str	r4, [r0, #0x4]
	ldr	r1, .L12
	ldr	r0, [r4, #0x4]
	str	r0, [r1]
	cmp	r2, #0
	bne	.L9	@cond_branch
	ldr	r0, .L12 + 4
	ldr	r1, [r0]
	add	r3, r0, #0
	cmp	r1, #0
	beq	.L10	@cond_branch
	str	r4, [r1]
.L10:
	ldr	r0, [r3]
	str	r0, [r4, #0x4]
	str	r2, [r6]
	str	r6, [r3]
	b	.L11
.L13:
	.align	2, 0
.L12:
	.4byte	0x3005dec
	.4byte	0x3005de4
.L9:
	ldr	r0, [r2, #0x4]
	cmp	r0, #0
	beq	.L14	@cond_branch
	str	r4, [r0]
.L14:
	ldr	r0, [r2, #0x4]
	str	r0, [r4, #0x4]
	str	r2, [r6]
	str	r6, [r2, #0x4]
	ldr	r3, .L15
.L11:
	ldr	r0, [r3]
	bl	sub_80604D4
	add	r0, r6, #0
.L2:
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.L16:
	.align	2, 0
.L15:
	.4byte	0x3005de4
	thumb_func_end sub_8060C1C

.align 2, 0 @ Don't pad with nop.
