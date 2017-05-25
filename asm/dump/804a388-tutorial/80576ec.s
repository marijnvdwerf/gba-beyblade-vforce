	.include "asm/common.inc"

	thumb_func_start sub_80576EC
sub_80576EC:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r9
	mov	r6, r8
	push	{r6, r7}
	add	sp, sp, #0xfffffffc
	add	r7, r0, #0
	ldr	r0, .L4
	ldr	r6, [r0]
	ldr	r1, .L4 + 4
	add	r0, r6, r1
	ldr	r2, .L4 + 8
	add	r3, r6, r2
	add	r1, r1, #0x4
	add	r1, r1, r6
	mov	r9, r1
	ldr	r5, [r7]
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L3	@cond_branch
	ldr	r1, [r5, #0x4]
	asr	r1, r1, #0x5
	ldr	r2, [r5, #0x8]
	asr	r2, r2, #0x5
	add	r0, r3, #0
	bl	GetQuadTreeNodeForPos
	add	r1, r0, #0
	add	r4, r5, #0
	add	r4, r4, #0x94
	ldr	r2, [r4]
	mov	r8, r2
	ldr	r2, .L4 + 12
	add	r0, r6, r2
	str	r0, [r4]
	cmp	r1, #0
	beq	.L2	@cond_branch
	str	r1, [sp]
	add	r0, r5, #0
	mov	r1, r9
	mov	r2, #0x0
	mov	r3, #0x0
	bl	sub_805C9A4
.L2:
	mov	r0, r8
	str	r0, [r4]
	mov	r1, #0x80
	lsl	r1, r1, #0x12
	add	r0, r7, #0
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L3	@cond_branch
	mov	r1, #0xe1
	lsl	r1, r1, #0x1
	add	r0, r7, r1
	ldrb	r0, [r0]
	lsl	r1, r0, #0x2
	ldr	r2, .L4 + 16
	add	r0, r6, r2
	add	r0, r0, r1
	ldr	r2, [r0]
	add	r0, r5, #0
	mov	r1, r9
	bl	sub_80577D8
	add	r0, r0, #0x40
	ldr	r2, .L4 + 20
	add	r1, r7, r2
	strb	r0, [r1]
.L3:
	add	sp, sp, #0x4
	pop	{r3, r4}
	mov	r8, r3
	mov	r9, r4
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L5:
	.align	2, 0
.L4:
	.4byte	0x3000fb0
	.4byte	0xcbc
	.4byte	0xddc
	.4byte	0xeb4
	.4byte	0xe34
	.4byte	0x1c3
	thumb_func_end sub_80576EC

.align 2, 0 @ Don't pad with nop.
