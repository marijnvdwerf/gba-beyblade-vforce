	.include "asm/common.inc"

	thumb_func_start resizeSpriteBlock
resizeSpriteBlock:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xfffffffc
	add	r5, r0, #0
	lsl	r1, r1, #0x10
	lsr	r1, r1, #0x10
	add	r4, r1, #0
	lsl	r2, r2, #0x10
	lsr	r3, r2, #0x10
	add	r7, r3, #0
	ldr	r2, [r5, #0x8]
	cmp	r2, r1
	bne	.L1	@cond_branch
	ldr	r0, [r5]
	b	.L15
.L1:
	cmp	r2, r1
	bcs	.L3	@cond_branch
	cmp	r2, #0
	beq	.L4	@cond_branch
	sub	r0, r1, r2
	lsl	r0, r0, #0x10
	lsr	r4, r0, #0x10
	ldr	r0, .L7
	mov	r9, r0
	ldr	r1, [r0]
	mov	r8, r1
	cmp	r8, r4
	bcs	.L5	@cond_branch
	ldr	r0, .L7 + 4
	bl	nullsub_8
	mov	r0, #0x0
	b	.L15
.L8:
	.align	2, 0
.L7:
	.4byte	0x3005df4
	.4byte	0x8755b0c
.L5:
	ldr	r1, .L13
	ldr	r3, [r1]
	mov	sl, r3
	ldr	r6, [r5, #0x4]
	mov	ip, r6
	str	r3, [sp]
	ldr	r0, [r5]
	ldrh	r7, [r0, #0x22]
	mov	r0, r8
	sub	r0, r0, r4
	mov	r6, r9
	str	r0, [r6]
	add	r0, r2, r4
	str	r0, [r5, #0x8]
	strh	r7, [r3, #0x22]
	sub	r0, r4, #1
	lsl	r0, r0, #0x10
	lsr	r4, r0, #0x10
	ldr	r2, .L13 + 4
	cmp	r4, #0
	beq	.L9	@cond_branch
.L10:
	ldr	r3, [r3, #0x4]
	strh	r7, [r3, #0x22]
	ldr	r0, [sp]
	str	r0, [r3]
	str	r3, [sp]
	sub	r0, r4, #1
	lsl	r0, r0, #0x10
	lsr	r4, r0, #0x10
	cmp	r4, #0
	bne	.L10	@cond_branch
.L9:
	ldr	r0, [r3, #0x4]
	str	r0, [r1]
	mov	r1, ip
	ldr	r0, [r1, #0x4]
	cmp	r0, #0
	beq	.L11	@cond_branch
	str	r3, [r0]
.L11:
	mov	r6, ip
	ldr	r0, [r6, #0x4]
	str	r0, [r3, #0x4]
	mov	r0, sl
	str	r0, [r6, #0x4]
	str	r6, [r0]
	str	r3, [r5, #0x4]
	ldr	r0, [r2]
	bl	sub_80604D4
	ldr	r0, [r5]
	b	.L15
.L14:
	.align	2, 0
.L13:
	.4byte	0x3005dec
	.4byte	0x3005de4
.L4:
	add	r0, r5, #0
	add	r2, r3, #0
	bl	sub_8060C1C
	ldr	r0, [r5]
	b	.L15
.L3:
	ldr	r0, .L16
	bl	nullsub_8
	add	r0, r5, #0
	bl	sub_8060CDC
	add	r0, r5, #0
	add	r1, r4, #0
	add	r2, r7, #0
	bl	sub_8060C1C
.L15:
	add	sp, sp, #0x4
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.L17:
	.align	2, 0
.L16:
	.4byte	0x8755b28
	thumb_func_end resizeSpriteBlock

.align 2, 0 @ Don't pad with nop.
