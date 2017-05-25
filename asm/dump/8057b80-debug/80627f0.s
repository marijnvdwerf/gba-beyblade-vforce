	.include "asm/common.inc"

	thumb_func_start sub_80627F0
sub_80627F0:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	ldr	r0, .L6
	ldr	r6, [r0]
	ldr	r0, .L6 + 4
	ldrb	r4, [r0]
	ldr	r0, .L6 + 8
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L11	@cond_branch
	ldr	r5, .L6 + 12
	ldr	r0, [r5, #0x4]
	cmp	r0, #0
	beq	.L11	@cond_branch
	bl	sub_8062C24
	ldr	r7, .L6 + 16
	ldr	r2, [r7]
	ldr	r0, [r5, #0x8]
	add	r0, r0, #0x1
	mov	r5, #0x2
	NEG	r5, r5
	and	r0, r0, r5
	mov	r3, #0x80
	lsl	r3, r3, #0x9
	ldr	r0, .L6 + 20
	ldrh	r0, [r0]
	add	r1, r0, #1
	and	r1, r1, r5
	cmp	r1, r3
	bne	.L3	@cond_branch
	ldr	r0, .L6 + 24
	ldrh	r1, [r0]
.L3:
	str	r1, [r7]
	cmp	r1, r2
	bls	.L4	@cond_branch
	sub	r5, r1, r2
	mov	r0, #0x0
	b	.L5
.L7:
	.align	2, 0
.L6:
	.4byte	0x3005e24
	.4byte	0x3005e04
	.4byte	0x3005e1c
	.4byte	0x3005e40
	.4byte	0x3000d94
	.4byte	0x4000104
	.4byte	0x3005e18
.L4:
	sub	r5, r3, r2
	ldr	r0, .L12
	ldrh	r0, [r0]
	ldr	r2, .L12 + 4
	add	r0, r0, r2
	add	r0, r0, r1
.L5:
	mov	sl, r0
	mov	r0, sl
	add	r7, r5, r0
	ldr	r1, .L12 + 8
	mov	r0, #0x0
	strb	r0, [r1]
	sub	r4, r4, #0x1
	mov	r0, #0x1
	NEG	r0, r0
	cmp	r4, r0
	beq	.L8	@cond_branch
	ldr	r1, .L12 + 12
	mov	r9, r1
	mov	r8, r0
.L9:
	mov	r0, r9
	ldrh	r2, [r0]
	add	r0, r6, #0
	add	r1, r7, #0
	bl	sub_80627A8
	add	r6, r6, #0x28
	sub	r4, r4, #0x1
	cmp	r4, r8
	bne	.L9	@cond_branch
.L8:
	ldr	r6, .L12 + 16
	ldr	r4, .L12 + 20
	ldr	r0, [r4]
	ldr	r3, [r6]
	add	r1, r5, #0
	mov	r2, #0x0
	bl	call_via_r3
	ldr	r0, [r4]
	add	r1, r0, r5
	str	r1, [r4]
	mov	r2, sl
	cmp	r2, #0
	beq	.L10	@cond_branch
	ldr	r0, .L12
	ldrh	r0, [r0]
	sub	r0, r1, r0
	str	r0, [r4]
	ldr	r3, [r6]
	mov	r1, sl
	add	r2, r5, #0
	bl	call_via_r3
	ldr	r0, [r4]
	ADD r0, sl
	str	r0, [r4]
.L10:
	ldr	r1, .L12 + 24
	ldr	r0, .L12
	ldrh	r2, [r0]
	ldr	r0, [r1]
	add	r0, r0, r2
	ldr	r1, [r4]
	cmp	r1, r0
	bne	.L11	@cond_branch
	sub	r0, r1, r2
	str	r0, [r4]
.L11:
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L13:
	.align	2, 0
.L12:
	.4byte	0x3005e4c
	.4byte	0xffff0000
	.4byte	0x3005e78
	.4byte	0x3000da0
	.4byte	0x807d968
	.4byte	0x3000d90
	.4byte	0x3005e1c
	thumb_func_end sub_80627F0

.align 2, 0 @ Don't pad with nop.
