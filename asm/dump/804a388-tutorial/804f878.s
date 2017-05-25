	.include "asm/common.inc"

	thumb_func_start sub_804F878
sub_804F878:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	add	sp, sp, #0xfffffffc
	ldr	r0, .L4
	ldr	r5, [r0]
	mov	r0, #0xf5
	lsl	r0, r0, #0x4
	add	r7, r5, r0
	bl	getLevelDescription2
	add	r6, r0, #0
	bl	sub_804FD64
	ldr	r1, .L4 + 4
	add	r1, r1, r5
	mov	r8, r1
	mov	r0, #0x2
	mov	r4, #0x0
	ldrh	r2, [r1]
	orr	r0, r0, r2
	strh	r0, [r1]
	mov	r0, #0x4
	bl	sub_8051780
	cmp	r0, #0
	beq	.L1	@cond_branch
	ldr	r0, .L4 + 8
	ldr	r0, [r0]
	ldr	r1, .L4 + 12
	add	r0, r0, r1
	ldrb	r0, [r0]
	cmp	r0, #0x2
	bne	.L2	@cond_branch
	bl	getLanguage
	lsl	r0, r0, #0x2
	add	r1, r6, #0
	add	r1, r1, #0x94
	b	.L3
.L5:
	.align	2, 0
.L4:
	.4byte	0x3000fb0
	.4byte	0x105e
	.4byte	0x3000f48
	.4byte	0x6a4
.L2:
	bl	getLanguage
	lsl	r0, r0, #0x2
	add	r1, r6, #0
	add	r1, r1, #0xa8
.L3:
	add	r1, r1, r0
	ldr	r1, [r1]
	add	r0, r7, #0
	mov	r2, #0xd
	bl	sub_8061660
	b	.L6
.L1:
	bl	getLanguage
	lsl	r0, r0, #0x2
	add	r1, r6, #0
	add	r1, r1, #0x68
	add	r1, r1, r0
	ldr	r1, [r1]
	add	r0, r7, #0
	mov	r2, #0xd
	bl	sub_8061660
	mov	r2, #0xf8
	lsl	r2, r2, #0x4
	add	r4, r5, r2
	bl	getLanguage
	lsl	r0, r0, #0x2
	add	r1, r6, #0
	add	r1, r1, #0x7c
	add	r1, r1, r0
	ldr	r1, [r1]
	add	r0, r4, #0
	mov	r2, #0xd
	bl	sub_8061660
	ldr	r0, .L7
	add	r4, r5, r0
	ldr	r2, .L7 + 4
	add	r1, r5, r2
	add	r0, r4, #0
	mov	r2, #0x2
	bl	newMotionGroup
	mov	r1, #0xb0
	lsl	r1, r1, #0x7
	mov	r2, #0x80
	lsl	r2, r2, #0x1
	add	r0, r4, #0
	bl	sub_8050578
	mov	r2, #0x34
	NEG	r2, r2
	mov	r0, #0xa
	NEG	r0, r0
	str	r0, [sp]
	add	r0, r4, #0
	mov	r1, #0x0
	mov	r3, #0x0
	bl	sub_80504E4
	mov	r0, #0x4
	mov	r1, r8
	ldrh	r1, [r1]
	orr	r0, r0, r1
	mov	r2, r8
	strh	r0, [r2]
.L6:
	add	r4, r7, #0
	add	r4, r4, #0xc0
	add	r1, r7, #0
	add	r1, r1, #0x14
	add	r0, r4, #0
	mov	r2, #0x2
	bl	newMotionGroup
	mov	r1, #0x90
	lsl	r1, r1, #0x7
	mov	r2, #0x80
	lsl	r2, r2, #0x1
	add	r0, r4, #0
	bl	sub_8050578
	mov	r0, #0x14
	str	r0, [sp]
	add	r0, r4, #0
	mov	r1, #0x0
	mov	r2, #0x34
	mov	r3, #0x0
	bl	sub_80504E4
	add	r1, r7, #0
	add	r1, r1, #0xf0
	mov	r0, #0x80
	str	r0, [r1]
	add	r0, r0, #0x8a
	add	r1, r7, r0
	mov	r0, #0x1
	strh	r0, [r1]
	add	sp, sp, #0x4
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L8:
	.align	2, 0
.L7:
	.4byte	0x1028
	.4byte	0xf94
	thumb_func_end sub_804F878

.align 2, 0 @ Don't pad with nop.
