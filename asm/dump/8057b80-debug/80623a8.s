	.include "asm/common.inc"

	thumb_func_start sub_80623A8
sub_80623A8:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	mov	r8, r0
	ldr	r0, .L2
	ldr	r7, [r0]
	ldr	r0, .L2 + 4
	mov	r9, r0
	mov	r6, #0x7f
	ldr	r1, .L2 + 8
	mov	sl, r1
.L1:
	mov	r2, r9
	add	r2, r2, #0x4
	mov	r9, r2
	sub	r2, r2, #0x4
	ldmia	r2!, {r0}
	mov	r1, #0x0
	ldr	r2, .L2 + 12
	ldr	r3, .L2 + 16
	bl	sub_8066150
	add	r3, r1, #0
	add	r2, r0, #0
	lsr	r5, r2, #0x14
	lsl	r4, r3, #0xc
	add	r1, r5, #0
	orr	r1, r1, r4
	lsl	r0, r2, #0xc
	ldr	r2, .L2 + 20
	ldr	r3, .L2 + 24
	bl	sub_8065C50
	mov	r2, r8
	mov	r3, #0x0
	bl	sub_8065C50
	stmia	r7!, {r0}
	sub	r6, r6, #0x1
	mov	r0, #0x1
	NEG	r0, r0
	cmp	r6, r0
	bne	.L1	@cond_branch
	mov	r1, sl
	ldr	r0, [r1]
	ldr	r2, .L2 + 28
	str	r0, [r2]
	mov	r0, #0x80
	lsl	r0, r0, #0x9
	ldr	r1, .L2 + 32
	ldrh	r1, [r1]
	sub	r0, r0, r1
	ldr	r2, .L2 + 36
	str	r0, [r2]
	ldr	r1, .L2 + 40
	add	r0, r1, #0
	ldr	r2, .L2 + 44
	strh	r0, [r2]
	mov	r1, #0x80
	lsl	r1, r1, #0x1
	add	r0, r1, #0
	ldr	r2, .L2 + 48
	strh	r0, [r2]
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L3:
	.align	2, 0
.L2:
	.4byte	0x3000d98
	.4byte	0x8755b90
	.4byte	0x3005e1c
	.4byte	0x2b11
	.4byte	0x0
	.4byte	0x105
	.4byte	0x0
	.4byte	0x3000d90
	.4byte	0x3005e4c
	.4byte	0x3000d94
	.4byte	0xffff
	.4byte	0x3000da2
	.4byte	0x3000da0
	thumb_func_end sub_80623A8

.align 2, 0 @ Don't pad with nop.
