	.include "asm/common.inc"

	thumb_func_start sub_8056EC0
sub_8056EC0:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	ldr	r0, .L8056EE0
	ldr	r0, [r0]
	ldr	r1, .L8056EE0 + 4
	add	r7, r0, r1
	ldr	r1, .L8056EE0 + 8
	add	r6, r0, r1
	add	r1, r1, #0x4
	add	r5, r0, r1
	bl	sub_8051734
	mov	r8, r0
	mov	r4, #0x0
	b	.L8056F4E
.L8056EE0:
	.align	2, 0

	.4byte	0x3000fb0
	.4byte	0x65c
	.4byte	0x12f4
.L8056EEC:
	asr	r0, r4, #0x5
	lsl	r3, r0, #0x2
	mov	r0, #0x82
	lsl	r0, r0, #0x1
	add	r1, r6, r0
	add	r1, r1, r3
	mov	r0, #0x1f
	and	r0, r0, r4
	mov	r2, #0x1
	LSL	r2, r0
	ldr	r0, [r1]
	and	r0, r0, r2
	cmp	r0, #0
	beq	.L8056F4A	@cond_branch
	mov	r0, r8
	add	r0, r0, #0x10
	add	r0, r0, r3
	ldr	r0, [r0]
	and	r0, r0, r2
	cmp	r0, #0
	bne	.L8056F1C	@cond_branch
	mov	r0, #0x0
	bl	sub_8051640
.L8056F1C:
	ldr	r1, [r5, #0x4]
	add	r0, r7, #0
	bl	GetLineMetaData
	add	r1, r0, #0
	add	r0, r7, #0
	mov	r2, #0x1
	ldr	r3, .L8056F40
	bl	getLineMetaobjectByTypeAndId
	cmp	r0, #0
	beq	.L8056F44	@cond_branch
	ldr	r0, [r0, #0x8]
	mov	r1, #0x1
	bl	sub_8057104
	b	.L8056F4A
.L8056F3E:
	.align	2, 0
.L8056F40:
	.4byte	0x37ae
.L8056F44:
	ldr	r0, .L8056F74
	bl	printf
.L8056F4A:
	add	r5, r5, #0x8
	add	r4, r4, #0x1
.L8056F4E:
	ldr	r0, [r6]
	cmp	r4, r0
	blt	.L8056EEC	@cond_branch
	ldr	r2, .L8056F74 + 4
	mov	r1, #0x82
	lsl	r1, r1, #0x1
	add	r0, r6, r1
	mov	r1, r8
	add	r1, r1, #0x10
	ldr	r3, [r2]
	mov	r2, #0x4
	bl	_call_via_r3
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L8056F72:
	.align	2, 0
.L8056F74:
	.4byte	0x8729838
	.4byte	0x807d974
	thumb_func_end sub_8056EC0

.align 2, 0 @ Don't pad with nop.
